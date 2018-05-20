source ~/.config/fish/conf.d/aliases.fish
source ~/.config/fish/conf.d/prompt.fish

set -x GPG_TTY (tty)
set -x RUST_SRC_PATH $HOME/Projects/rust/rust-lang/src
set -x PATH ~/bin/ $PATH
set -x PATH $HOME/.local/bin/ $PATH
set -x PATH $HOME/.fzf/bin $PATH
set -x PATH $HOME/.cargo/bin $PATH
