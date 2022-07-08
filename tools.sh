#! /bin/sh

asdf plugin add nodejs
asdf install nodejs latest
asdf install nodejs 16.16.0
asdf global nodejs latest
npm install -g npm@latest
npm install --global yarn

asdf plugin add python
asdf install python latest
asdf install python 3.9.13
asdf global python latest

asdf plugin-add golang
asdf install golang latest
asdf global golang latest

asdf plugin-add rust
asdf install rust latest
asdf global rust latest

figlet Instalando cli GH  

# Limpando GH
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

sudo apt update
sudo apt install gh

gh auth login

figlet Instalando extras

wget https://github.com/neovim/neovim/releases/download/v0.7.2/nvim-linux64.deb
sudo apt install ./nvim-linux64.deb
rm ./nvim-linux64.deb

cargo install exa bat ytop
asdf reshim