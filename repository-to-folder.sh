# Repository to folder


if [ ! -d "~/.config/nvim" ] 
then
    echo "Error: Directory"
else
    echo "Directory config neovim does not exists."
    echo "Make directory neovim."
    mkdir -p ~/.config/nvim/
    cp -rf .config/nvim ~/.config/
    echo "Neovim already clone."
fi
