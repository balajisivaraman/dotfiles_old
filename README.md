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

# XMonad

After a brief tryst with i3 (and Gnome), I moved back to XMonad as my
primary window manager in late 2018. My
[configuration](.xmonad/xmonad.hs) does not represent close to the
full powers of XMonad, but I hope it still highlights how configurable
it truly is.

In particular, you will be able to see the following idiosyncrasies:

- Use a
  [NoFrillsDecoration](https://hackage.haskell.org/package/xmonad-contrib-0.15/docs/XMonad-Layout-NoFrillsDecoration.html)
  titlebar without the text instead of a border to highlight currently
  active window. (This idea was taken from Ethan Schoonover's
  wonderful XMonad
  [demo](https://www.youtube.com/watch?v=70IxjLEmomg), which is highly
  recommended to get an understanding of the customisability of XMonad.)
- Setup a few
  [NamedScratchpad](https://hackage.haskell.org/package/xmonad-contrib-0.15/docs/XMonad-Util-NamedScratchpad.html#t:NamedScratchpads)'s
  that I use on a day-to-day basis (mail reader, password manager,
  music player etc.)
- Pipe XMonad status to XMobar's stdin. This gives us useful
  information such as workspaces opened and currently in use, window
  title of the current window etc.

# XMobar

My XMobar configuration was also inspired by the Ethan Schoonover
linked to above. There's nothing particularly fancy about it.

- Left Side: XMonad status piped in from stdin
- Middle: Status of my music retrieved using the [status-cmus](.scripts/status-cmus) script
- Right:
  - Volume information retrieved using the [status-vol](.scripts/status-vol) script
  - Date and Time information output using XMobar itself

In addition to the above, tray icons (currently only Owncloud) are
displayed on the far right using
[Stalonetray](http://stalonetray.sourceforge.net/), configured
[here](.stalonetrayrc).

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
