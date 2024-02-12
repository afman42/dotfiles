# Clone folder to repository

if [ ! -d "~/.config/nvim" ] 
then
    echo "Directory config neovim exists."
    cp -rf ~/.config/nvim/ .config/
    echo "Neovim already clone."
else
    echo "Directory config neovim does not exists."
    echo "Create directory neovim."
    mkdir -p ~/.config/nvim/
    cp -rf .config/nvim/ ~/.config/
    echo "Neovim clone folder"
fi


if [ ! -d "~/.config/home-manager" ] 
then
    echo "Directory home-manager exists."
    cp -rf ~/.config/home-manager/ .config/
    echo "Home-manager already clone."
else
    echo "Directory home-manager does not exists."
    echo "Create directory home-manager"
    mkdir -p ~/.config/home-manager/
    cp -rf .config/home-manager/ ~/.config/
    echo "home-manager clone folder"
fi
