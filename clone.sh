# Clone folder to repository

if [ ! -d "~/.config/nvim" ] 
then
    echo "Directory config neovim exists."
    cp -rf ~/.config/nvim/ .config/
    echo "Neovim already backup."
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
    echo "Home-manager already backup."
else
    echo "Directory home-manager does not exists."
    echo "Create directory home-manager"
    mkdir -p ~/.config/home-manager/
    cp -rf .config/home-manager/ ~/.config/
    echo "home-manager clone folder"
fi

if [ ! -d "~/.backup_bash_profile" ] 
then
    echo "Directory backup_bash_profile exists."
    cp -rf ~/.backup_bash_profile/ ./
    echo "Home-manager already backup."
else
    echo "Directory backup_bash_profile does not exists."
    echo "Create directory backup_bash_profile"
    mkdir -p ~/.backup_bash_profile/
    cp -rf .backup_bash_profile/ ~/
    echo "backup_bash_profile clone folder"
fi
