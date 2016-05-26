if uname -a | grep Darwin > /dev/null
  set -x PATH $HOME/.stack/programs/x86_64-osx/ghc-7.10.3/bin $PATH

  set -x GRADLE_HOME ~/Software/coding/java/gradle-2.8/
  set -x PATH $GRADLE_HOME/bin $PATH
  set -x PATH $HOME/.bin $PATH

  set -x JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_66.jdk/Contents/Home
  set -x JAVA_8_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_66.jdk/Contents/Home
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
