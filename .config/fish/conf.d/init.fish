source ~/.config/fish/conf.d/aliases.fish
source ~/.config/fish/conf.d/prompt.load

set -x GPG_TTY (tty)
set -x PATH ~/bin/ $PATH
set -x PATH $HOME/.local/bin/ $PATH
set -x PATH $HOME/.bin/ $PATH
set -x PATH $HOME/.cargo/bin $PATH
