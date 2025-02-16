#!/bin/sh
cd ~;
'password' | sudo apt install build-essential -y;
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";
echo >> $HOME/.profile;
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> $HOME/.profile;
echo >> $HOME/.bashrc;
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> $HOME/.bashrc;
brew doctor;
brew install curl unzip git gcc wget ripgrep fzf bat posting pipx fnm neovim rust go ;
echo 'eval "$(fnm env --use-on-cd --shell bash)"' >> $HOME/.bashrc;
echo 'export GOPATH=$HOME/go' >> $HOME/.bashrc;
echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin' >> $HOME/.bashrc
echo 'export PATH=$PATH:/usr/local/go/bin' >> $HOME/.bashrc;
echo '. "$HOME/.cargo/env"' >> $HOME/.bashrc;
echo '. "$HOME/.local/share/../bin/env"' >> $HOME/.bashrc;
echo 'eval "$(fzf --bash)"' >> $HOME/.bashrc;
fnm --version;
nvm --version;
go version;
