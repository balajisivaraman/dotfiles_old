#General
alias l 'ls -alhFrt'
alias twp 'cd $HOME/TWProjects/'
alias p 'cd $HOME/Projects/'
alias emacsd 'cd $HOME/.emacs.d'

#Git
alias g git
alias st 'git status'

#Arch
alias pacin 'sudo pacman -S $argv'
alias pacrem 'sudo pacman -Rns $argv'
alias y 'yaourt'
alias ys 'yaourt -S $argv'
alias yr 'yaourt -R $argv'

#Ruby
alias rc 'rails console'
alias rs 'rails server'

#Pam
alias lb './build_scripts/local_build.sh'
alias pam 'cd $HOME/TWProjects/pam'

if uname -a | grep Darwin > /dev/null
  set -x PATH $HOME/.stack/programs/x86_64-osx/ghc-7.10.3/bin $PATH
  set -x PATH $HOME/.bin $PATH
  set -x JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_66.jdk/Contents/Home
  set -x JAVA_8_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_66.jdk/Contents/Home
end

if uname -a | grep GNU/Linux > /dev/null
    set -x PATH  ~/.cargo/bin $PATH
end

set -x PATH ~/bin/ $PATH
set -x PATH $HOME/.local/bin/ $PATH

rvm default
