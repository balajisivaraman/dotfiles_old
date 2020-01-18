export GHC_DOT_APP=/Applications/ghc-7.8.4.app
PATH=/usr/local/git/bin/:$HOME/.cabal/bin:$GHC_DOT_APP/Contents/bin:$PATH
PATH=~/Coding/haskell/ghc-mod/.cabal-sandbox/bin:~/Coding/haskell/purescript/.cabal-sandbox/bin:$PATH
export PATH

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion\
