#!/bin/bash

set -e

rootinit() {
  if [ $# != 1 ]; then
    echo "Usage: $(basename "$0") rootinit <hostname>" >&2
    exit 1
  fi
  hostname="$1"
  ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
  hwclock --systohc
  sed -i 's/^#\(en_US\.UTF-8 .*\)$/\1/g' /etc/locale.gen
  locale-gen
  export LANG=en_US.UTF-8
  echo 'LANG=en_US.UTF-8' > /etc/locale.conf
  echo "$hostname" > /etc/hostname
  {
    echo "127.0.0.1  localhost"
    echo "::1  localhost"
    echo "127.0.1.1  $hostname.localdomain $hostname"
  } >> /etc/hosts
  echo "set root password:"
  passwd
}

userinit() {
  useradd -m -g users -u 1000 -s /usr/bin/fish \
    -G disk,lp,wheel,log,dbus,network,video,audio,storage,power \
    balaji
  echo "set balaji password"
  passwd balaji
  echo "make sure '%wheel ALL=(ALL) NOPASSWD: ALL' is in sudoers"
}

systemd_boot_init() {
  bootctl install
  rootpartuuid="$(blkid | grep root | rev | cut -d'=' -f 1 | rev | sed 's/"//g')"
  echo $rootpartuuid
  {
    echo "title	Arch Linux"
    echo "linux	/vmlinuz-linux"
    echo "initrd	/amd-ucode.img"
    echo "initrd	/initramfs-linux.img"
    echo "options	root=\"PARTUUID=$rootpartuuid\" rw"
  } >> /boot/loader/entries/arch.conf
}

laninit() {
  pacman --noconfirm -S dhcpcd
  interface="$(ip addr | grep 2: | cut -d':' -f 2 | awk '{$1=$1};1')"
  systemctl enable dhcpcd@$interface.service
}

x() {
  pacman --noconfirm -S xorg xorg-xinit nvidia
}

pkgs() {
  pacman --noconfirm -S \
    alsa-utils \
    aspell aspell-en \
    bind-tools \
    dhcpcd \
    ffmpeg \
    fish \
    gnupg \
    htop iotop \
    hunspell hunspell-en_US \
    iputils inetutils \
    keepassxc \
    libfido2 \
    linux-tools \
    nextcloud-client \
    ntfs-3g \
    openssh openssl \
    pdftk \
    strace \
    unzip \
    vi vim \
    whois \
    youtube-dl \
    yubioath-desktop \
    yubico-pam \
  systemctl enable --now pcscd.service
}

xpkgs() {
  pacman --noconfirm -S \
    alacritty \
    dunst \
    feh \
    flameshot \
    gnome-keyring \
    i3-gaps \
    i3lock \
    i3status-rust \
    keepassxc \
    libnotify \
    lightdm lightdm-gtk-greeter \
    lxsession \
    mpv \
    nextcloud-client \
    pcmanfm \
    perl-file-mimeinfo \
    picom \
    pulseaudio pavucontrol \
    rofi \
    stow \
    udiskie \
    xclip \
    xorg-xmodmap xcape \
    xsel \
    xsettingsd \
    xss-lock \
    xterm \
    zathura zathura-pdf-mupdf
}

lightdm() {
  systemctl enable lightdm
  groupadd -r autologin
  gpasswd -a balaji autologin
  sed -i '/^#greeter-session/c\greeter-session=lightdm-gtk-greeter' /etc/lightdm/lightdm.conf
  sed -i '/^#autologin-user=/c\autologin-user=balaji' /etc/lightdm/lightdm.conf
  sed -i '/^#autologin-session=/c\autologin-session=i3' /etc/lightdm/lightdm.conf
}

devpkgs() {
  pacman --noconfirm -S \
    asciidoc \
    ctags \
    curl \
    fd \
    fzf \
    git \
    httpie \
    jq \
    podman \
    python python-pip \
    ripgrep \
    rustup rust-analyzer \
    shellcheck \
    starship \
    texlive-most \
    tmux \
    wget
}

yayinit() {
  cd /tmp || exit 1
  if [ ! -d yay-bin ]; then
    git clone https://aur.archlinux.org/yay-bin.git
  fi
  cd yay-bin || exit 1
  makepkg -fsi --noconfirm
}

yaypkgs() {
  yay --noconfirm -S \
    autojump \
    bat \
    exa \
    fnm-bin \
    git-delta \
    neovim-git python-neovim-git
}

yayxpkgs() {
  yay --noconfirm -S \
    clipcat \
    google-chrome \
    nerd-fonts-terminus \
    nordic-darker-theme-git \
    apple-fonts \
    plane-icon-theme-git \
    ttfautohint
}

i3lockinit() {
  cd /tmp || exit 1
  if [ ! -d i3lockr ]; then
    git clone --depth=1 https://github.com/owenthewizard/i3lockr.git /tmp/i3lockr
  fi
  cd i3lockr || exit 1
  rustup default stable
  cargo build --release
  sudo strip -s target/release/i3lockr -o /usr/local/bin/i3lockr
}

fstab() {
  sudo mkdir -p /media/backup
  sudo chown -R balaji:users /media/backup
  sudo chmod -R 777 /media/backup
  sudo mkdir -p /media/Media
  sudo chown -R balaji:users /media/Media
  sudo chmod -R 777 /media/Media
  sudo mkdir -p /media/TV
  sudo chown -R balaji:users /media/TV
  sudo chmod -R 777 /media/TV
  sudo bash -c 'echo "UUID=50353c11-beed-4c9c-8432-bbf608e989e4          /media/backup              ext4             rw,relatime          0 0" >> /etc/fstab'
  sudo bash -c 'echo "UUID=9C08911F0890FA0A          /media/TV              ntfs-3g             uid=balaji,gid=users,umask=0022          0 0" >> /etc/fstab'
  sudo bash -c 'echo "UUID=30DC85B7DC85783C          /media/Media              ntfs-3g             uid=balaji,gid=users,umask=0022          0 0" >> /etc/fstab'
}

podmaninit() {
  sudo touch /etc/subuid
  sudo touch /etc/subgid
  sudo usermod --add-subuids 100000-150000 --add-subgids 100000-150000 balaji
  podman system migrate
}

case "$1" in
  rootinit) shift ; rootinit "$@" ;;
  userinit) shift ; userinit "$@" ;;
  systemd_boot_init) shift ; systemd_boot_init "$@" ;;
  laninit) shift ; laninit "$@" ;;
  x) shift ; x "$@" ;;
  pkgs) shift ; pkgs "$@" ;;
  xpkgs) shift ; xpkgs "$@" ;;
  lightdm) shift ; lightdm "$@" ;;
  devpkgs) shift ; devpkgs "$@" ;;
  yayinit) shift ; yayinit "$@" ;;
  yaypkgs) shift ; yaypkgs "$@" ;;
  yayxpkgs) shift ; yayxpkgs "$@" ;;
  i3lockinit) shift ; i3lockinit "$@" ;;
  fstab) shift ; fstab "$@" ;;
  podmaninit) shift ; podmaninit "$@" ;;
  *)
    echo "unrecognized command" >&2
    exit 1
    ;;
esac
