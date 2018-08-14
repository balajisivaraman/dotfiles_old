if status --is-login
    if test -z "$DISPLAY" -a $XDG_VTNR = 1
        exec startx -- -keeptty
    end
end

[ -f /usr/share/autojump/autojump.fish ]; and source /usr/share/autojump/autojump.fish

set -g theme_color_scheme dracula
set -g theme_display_user yes
set -g theme_display_hostname yes
set -g theme_display_git_master_branch yes
