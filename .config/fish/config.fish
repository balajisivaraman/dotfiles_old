if test -n "$DESKTOP_SESSION"
    set (gnome-keyring-daemon --start | string split "=")
end

[ -f /usr/share/autojump/autojump.fish ]; and source /usr/share/autojump/autojump.fish

starship init fish | source
