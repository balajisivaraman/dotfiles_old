if uname -a | grep Darwin > /dev/null

  set GHC_DOT_APP /Applications/ghc-7.10.2.app

  if set -q  GHC_DOT_APP
    set -x PATH $HOME/.cabal/bin $GHC_DOT_APP/Contents/bin $PATH
  end

  set -x PATH $HOME/Projects/haskell/stack-ide/.stack-work/install/x86_64-osx/nightly-2015-08-06/7.10.2/bin $PATH

  set -x GRADLE_HOME ~/Software/coding/java/gradle-2.4/
  set -x PATH /usr/local/Cellar/git/2.5.1/bin $PATH
  set -x PATH $GRADLE_HOME/bin $PATH

  set -x JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_60.jdk/Contents/Home
  set -x JAVA_8_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_60.jdk/Contents/Home

end

if uname -a | grep GNU/Linux > /dev/null

    set -x PATH $HOME/Projects/elm-lang/elm-bin/.cabal-sandbox/bin $PATH
    set -x PATH $HOME/.gem/ruby/2.2.0/bin $PATH

end

set -x PATH ~/bin/ $PATH
set -x PATH $HOME/.local/bin/ $PATH

set p $HOME/Projects/
set twp $HOME/TWProjects/
set omf $HOME/.oh-my-fish/
set emacs $HOME/.emacs.d/
