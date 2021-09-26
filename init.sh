#!/bin/sh

sudo apt update
sudo apt upgrade -y

sudo rm -r $ZSH

sudo apt install -y curl wget zsh git python3 python3-pip

echo "Obtendo oh-my-zsh"
export RUNZSH=no
export ZSHPLUGINS=$HOME/plugins

sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Configurando Plugins ZSH"
rm -rf $ZSHPLUGINS
mkdir $ZSHPLUGINS

git clone https://github.com/supercrabtree/k.git $ZSHPLUGINS/k
echo "source $ZSHPLUGINS/k/k.sh" >> $HOME/.zshrc

git clone https://github.com/zsh-users/zsh-autosuggestions $ZSHPLUGINS/zsh-autosuggestions
echo "source $ZSHPLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh" >> $HOME/.zshrc

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSHPLUGINS/zsh-syntax-highlighting
echo "source $ZSHPLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> $HOME/.zshrc

echo "plugins=(git docker docker-compose)" >> $HOME/.zshrc

echo "Configurando Docker"
sudo usermod -aG docker $USER

echo "Configurando ambiente Driva"
export DRIVAHOME=$HOME/driva
rm -rf $DRIVAHOME
mkdir $DRIVAHOME

wget https://github.com/cli/cli/releases/download/v2.0.0/gh_2.0.0_linux_amd64.deb
sudo apt install ./gh_2.0.0_linux_amd64.deb
rm gh_2.0.0_linux_amd64.deb

gh auth login

gh repo clone Driva-tecnologia/Backend-Driva $DRIVAHOME/Backend
gh repo clone Driva-tecnologia/App-Driva $DRIVAHOME/Frontend

echo "Configurando desenvolvimento Node"
export NVM_DIR=''
rm -rf $HOME/.nvm

curl -sL https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  

nvm install 14.17.6

npm install --global yarn

zsh $HOME/.zshrc

echo "FINALIZADO"
