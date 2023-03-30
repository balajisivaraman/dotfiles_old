set -x GPG_TTY (tty)
set -x PATH $HOME/.fzf/bin $PATH
set -x PATH $HOME/.cargo/bin $PATH
set -x PATH $HOME/.local/bin $PATH
set -x PATH $HOME/.local/share/coursier/bin $PATH
set -x PATH $HOME/go/bin $PATH
set -x GOPATH $HOME/go
set -x GOBIN $HOME/go/bin
set -x FZF_DEFAULT_OPTS '--height 40% --layout=reverse --border --color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'
