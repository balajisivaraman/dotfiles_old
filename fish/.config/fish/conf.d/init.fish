set -x GPG_TTY (tty)
set -x PATH $HOME/.fzf/bin $PATH
set -x PATH $HOME/.cargo/bin $PATH
set -x PATH $HOME/.local/bin $PATH
set -x PATH $HOME/go/bin $PATH
set -x GOPATH $HOME/go
set -x GOBIN $HOME/go/bin
set -x FZF_DEFAULT_OPTS '--height 40% --layout=reverse --border
 --color=fg:#ffffff,bg:#121212,hl:#90c4ed
 --color=fg+:#ffffff,bg+:#3c3c3c,hl+:#00d3d0
 --color=info:#c0c530,prompt:#f78fe7,pointer:#9f80ff
 --color=marker:#70b900,spinner:#feacd0,header:#6ae4b9'
