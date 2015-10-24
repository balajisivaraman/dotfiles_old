set -x FISH_CONFIG_PATH $HOME/.fish

source $FISH_CONFIG_PATH/aliases.fish
source $FISH_CONFIG_PATH/balaji.fish
source $FISH_CONFIG_PATH/nix.load
source $FISH_CONFIG_PATH/prompt.load
rvm default
