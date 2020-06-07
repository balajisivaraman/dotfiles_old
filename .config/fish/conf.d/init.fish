set -x GPG_TTY (tty)
set -x RUST_SRC_PATH $HOME/Projects/rust/rust-lang/src
set -x PATH $HOME/.fzf/bin $PATH
set -x PATH $HOME/.cargo/bin $PATH
set -x PATH $HOME/go/bin $PATH
set -x PATH $HOME/bin $PATH
set -x GOPATH $HOME/go
set -x GOBIN $HOME/go/bin

set -x NEXUS_USERNAME sc-0102-ins_dev
set -x NEXUS_PASSWORD generali
set -x GITLAB_PRIVATE_TOKEN Koem8deMRuPYasYXW4q7
set -x MAESTRO_API_CALLER_ROOT ~/code/generali/sin-maestro-api-caller

function setOpenJdk8
    set -Ux JAVA_HOME (/usr/libexec/java_home -v 1.8)
end

function setOpenJdk11
    set -Ux JAVA_HOME (/usr/libexec/java_home -v 11)
end
