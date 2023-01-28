#! /bin/sh

sudo systemctl --now enable dhcpcd
sudo systemctl --now enable systemd-networkd

echo "Upadting system"
sudo pacman -Syyuu

echo "Instaling basic tools"
sudo pacman -S xorg xorg-xinit xmonad xmonad-contrib feh rofi zsh alacritty picom dunst htop flameshot xclip

mkdir -p ~/.config/{alacritty, rofi}
mkdir .xmonad
mkdir .zsh
mkdir wallpapers

cp files/alacritty.yml ~/.config/alacritty/
cp files/config.rasi ~/.config/rofi/
cp files/xmonad.hs ~/.xmonad/
cp wallpapers/* ~/wallpapers/
cp files/.zshrc ~/.zshrc
cp files/.p10k.zsh ~/.p10k.zsh

sudo chsh -s /bin/zsh victor

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
~/.cargo/bin/cargo install paru bottom bat ripgrep

~/.cargo/bin/paru -S nerd-fonts-git discord-ptb brave-bin beekeeper-studio-bin visual-studio-code-bin neovim

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

echo "Instaling virtualization tools"
sudo pacman -S libvirt qemu-base virt-viewer virt-manager iptables-nft dnsmasq dmidecode bridge-utils openbsd-netcat

sudo systemctl enable libvirtd
sudo usermod -aG libvirt victor
