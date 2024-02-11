# Clone folder to repository

if [ ! -d "~/.config/nvim" ] 
then
    echo "Directory config neovim exists."
    cp -rf ~/.config/nvim .config/
    echo "Neovim already clone."
else
    echo "Error: Directory config neovim does not exists."
fi
