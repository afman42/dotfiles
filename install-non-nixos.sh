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
echo -e "#fnm\n `eval fnm env --use-on-cd` \n" >> ~/.bashrc
echo "Successfully add path fnm"

# Add path go
echo "Add path GOPATH"
echo -e "export PATH=$PATH:/home/arman/.nix-profile/bin/go \n" >> ~/.bashrc
echo -e "export GOPATH=$HOME/go \n" >> ~/.bashrc
echo -e "PATH=$GOPATH/bin:$PATH \n" >> ~/.bashrc
echo "Successfully add GOPATH"

# Add environment variable home-manager
echo "Add path session variable"
echo -e "\n . $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh \n" >> ~/.profile
echo "Add path application dekstop"
echo -e "\n export XDG_DATA_DIRS=$HOME/.nix-profile/share:$XDG_DATA_DIRS \n" >> ~/.profile
echo "Successfully add path session and application dekstop"

# Clone folder
echo "Execute file clone shell script"
chmod +x ./clone.sh
sh ./clone.sh
echo "Successfully clone folder"

echo "Run home-manager"
home-manager switch
echo "Finish home-manager"

echo "Source .bashrc"
source ~/.bashrc
echo "Finish Source .bashrc"
