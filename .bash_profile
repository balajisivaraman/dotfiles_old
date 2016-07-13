
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

if [ -e /Users/balajisivaraman/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/balajisivaraman/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
