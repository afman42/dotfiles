sh <(curl -L https://nixos.org/nix/install) --no-daemon

nix-env -iA nix-tree
nix-env -iA rsync

# home-manager update
echo "Add cli home-manager"
nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz home-manager
nix-channel --update

nix-shell '<home-manager>' -A install
echo "Successfully cli home-manager"


# Add fnm eval
echo "Add path fnm"
echo -e "#fnm\n `eval fnm env --use-on-cd`" >> ~/.bashrc
echo "Successfully add path fnm"

# Add environment variable home-manager
echo "Add path session variable"
echo -e ". $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh" >> ~/.profile
echo "Add path application dekstop"
echo -e "export XDG_DATA_DIRS=$HOME/.nix-profile/share:$XDG_DATA_DIRS" >> ~/.profile
echo "Successfully add path session and application dekstop"

