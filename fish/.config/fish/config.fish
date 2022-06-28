[ -f /usr/share/autojump/autojump.fish ]; and source /usr/share/autojump/autojump.fish

set -x EDITOR 'emacsclient -c'

starship init fish | source
