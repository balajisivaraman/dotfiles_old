# Balaji's Dot Files

Welcome to my dot files. Feel free to browse around or peruse this
README file, where I have explained my configuration and workflows.

# Color Scheme

One thing you will observe as you go through my configurations is that
I use is that I use [Dracula](https://draculatheme.com/) as my
colorscheme everywhere.

I find that using a single colorscheme across all my tools including
my Window manager gives a uniform look and feel to my entire desktop
experience.

# i3

After various attempts to setup XMonad, I moved to i3 (with Gnome) as
my primary window manager in early 2020. My
[configuration](.config/i3/config) does not represent close to the
full powers of i3, but I hope it still highlights how configurable it
truly is.

# i3status-rust

There's nothing particularly fancy about my
[i3status-rust](https://github.com/greshake/i3status-rust)
[configuration](.config/i3/status.toml), but I do think it's better
and easier to configure than the standard i3bar.

# Rofi

I absolutely love [Rofi](https://github.com/DaveDavenport/rofi/) and
have used it to automate a few workflows.

- [App Launcher/Desktop Switcher](.xmonad/xmonad.hs#L21) - This is
  directly configured in XMonad and bound to `Mod+Space`, similar to
  how Alfred would be on OSX.
- [Document Launcher](.scripts/document-launcher) - This uses the
  [`fd`](https://github.com/sharkdp/fd) tool to find all PDF files in
  my `~/Documents` folder and list it in Rofi in DMenu mode. The
  selection is then opened using the Zathura PDF viewer.
- [Device Mounter/Unmounter](.scripts/device-mounter) - This is a
  slightly more involved configuration that firsts lists a set of
  choices for me to choose from, and then based on the choice either
  displays additional Rofi menus or performs some action.

I can see many more uses for Rofi and think it'll become a mainstay of
my workflow for years to come.

# Utility Scripts

All of the utility scripts described in the above sections (plus more)
can be found under the [.scripts](.scripts) folder. Feel free to copy
any ideas that you find useful.

# Additional Utilities

In addition to the above, this repository also contains configurations
for the following tools that I use on a day-to-day basis:

- [NeoVim](.config/nvim/init.vim)
- [TMux](.tmux.conf)
- [XResources](.Xresources)
- [Alacritty](.config/alacritty/alacritty.yml)

# License

All configuration and script files in this repository are licensed
under the MIT license.
