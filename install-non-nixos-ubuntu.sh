HOME_MANAGER_RELEASE = release-23.11

sh <(curl -L https://nixos.org/nix/install) --no-daemon

nix-env -iA nix-tree
nix-env -iA rsync

# home-manager update
echo "Add cli home-manager"
nix-channel --add https://github.com/nix-community/home-manager/archive/${HOME_MANAGER_RELEASE}.tar.gz home-manager
nix-channel --update

nix-shell '<home-manager>' -A install
echo "Successfully cli home-manager"

# Clone folder
echo "Execute file clone shell script"
chmod +x ./clone.sh
sh ./clone.sh
echo "Successfully clone folder"

echo "Run home-manager"
home-manager switch
echo "Finish home-manager"
echo "Logout and login again"