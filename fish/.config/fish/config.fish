if [ $hostname = "korriban.local" ]
    [ -f $(brew --prefix)/share/autojump/autojump.fish ]; and source $(brew --prefix)/share/autojump/autojump.fish
else
    [ -f /usr/share/autojump/autojump.fish ]; and source /usr/share/autojump/autojump.fish
end

set -x EDITOR 'emacsclient -c'

starship init fish | source
