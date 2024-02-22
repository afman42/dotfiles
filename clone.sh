#!/bin/bash

path_repository=~/repository/dotfiles/

# Clone folder to repository
echo "Directory config neovim does not exists."
echo "Create directory neovim."
mkdir -p ~/.config/nvim/
cp -rf $path_repository.config/nvim/ ~/.config/
echo "Neovim clone folder"

echo "Remove file home and replace"
rm -f ~/.config/home-manager/home.nix
cp -f $path_repository.config/home-manager/home.nix ~/.config/home-manager/
echo "home-manager clone folder"

echo "Directory backup_bash_profile does not exists."
echo "Create directory backup_bash_profile"
mv ~/.bashrc ~/.bashrcc
mv ~/.profile ~/.profilee
mkdir -p ~/.backup_bash_profile/
cp -f $path_repository.backup_bash_profile/.backup_bashrc ~/.backup_bash_profile/
cp -f $path_repository.backup_bash_profile/.backup_profile ~/.backup_bash_profile/
echo "backup_bash_profile clone folder"

echo "Directory nixpkgs does not exists."
echo "Create directory nixpkgs"
mkdir -p ~/.config/nixpkgs/
cp -f  $path_repository.config/nixpkgs/config.nix ~/.config/nixpkgs/
echo "nixpkgs clone folder"