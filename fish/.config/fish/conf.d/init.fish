set -x GPG_TTY (tty)
set -x PATH $HOME/.fzf/bin $PATH
set -x PATH $HOME/.cargo/bin $PATH
set -x PATH $HOME/.local/bin $PATH
set -x PATH $HOME/go/bin $PATH
set -x GOPATH $HOME/go
set -x GOBIN $HOME/go/bin
set -x FZF_DEFAULT_OPTS '--height 40% --layout=reverse --border --color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f --color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54'
