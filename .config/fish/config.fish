if status --is-login
    if test -z "$DISPLAY" -a $XDG_VTNR = 1
        exec startx -- -keeptty
    end
end

[ -f /usr/share/autojump/autojump.fish ]; and source /usr/share/autojump/autojump.fish

starship init fish | source
