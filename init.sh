#!/bin/sh

sudo apt update
sudo apt upgrade -y

sudo rm -r $ZSH

sudo apt install -y curl wget zsh git python3 python3-pip

git config --global init.defaultBranch main

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

echo "Configurando Github"
export DRIVAHOME=$HOME/driva
echo "export DRIVAHOME=$HOME/driva" >> $HOME/.zshrc
mkdir $DRIVAHOME

wget https://github.com/cli/cli/releases/download/v2.5.0/gh_2.5.0_linux_amd64.deb
sudo apt install ./gh_2.5.0_linux_amd64.deb
rm gh_2.5.0_linux_amd64.deb

gh auth login

echo "Configurando desenvolvimento Node"
export NVM_DIR=''
rm -rf $HOME/.nvm

curl -sL https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  

nvm install 14.17.6

npm install --global yarn

zsh $HOME/.zshrc


echo "Configurando desenvolvimento Python"

sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

rm -rf $HOME/.pyenv

curl https://pyenv.run | bash

echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> $HOME/.zshrc
echo 'eval "$(pyenv init --path)"' >> $HOME/.zshrc
echo 'eval "$(pyenv virtualenv-init -)"' >> $HOME/.zshrc




echo "FINALIZADO"
