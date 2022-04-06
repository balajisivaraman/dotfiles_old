[ -f /usr/share/autojump/autojump.fish ]; and source /usr/share/autojump/autojump.fish

starship init fish | source

status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
