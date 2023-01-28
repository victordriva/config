#! /bin/sh

sudo systemctl --now enable dhcpcd
sudo systemctl --now enable systemd-networkd

echo "Upadting system"
sudo pacman -Syyuu

echo "Installing basic tools"
sudo pacman -S xorg xorg-xinit xmonad xmonad-contrib feh rofi zsh alacritty picom dunst htop flameshot xclip pulseaudio pavucontrol

mkdir -p ~/.config/alacritty ~/.config/rofi ~/.config/pulse ~/.xmonad ~/.zsh ~/wallpapers

cp files/alacritty.yml ~/.config/alacritty/
cp files/config.rasi ~/.config/rofi/
cp files/xmonad.hs ~/.xmonad/
cp files/pulse/* ~/.config/pulse
cp wallpapers/* ~/wallpapers/
cp files/.zshrc ~/.zshrc
cp files/.p10k.zsh ~/.p10k.zsh

echo "Configuring ZSH"
sudo chsh -s /bin/zsh victor

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

echo "Installing extra tools"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
~/.cargo/bin/cargo install paru bottom bat ripgrep exa

sudo pacman -S lightdm lightdm-webkit2-greeter
~/.cargo/bin/paru -S nerd-fonts-git discord-ptb brave-bin beekeeper-studio-bin visual-studio-code-bin neovim lightdm-webkit2-theme-glorious

# Set default lightdm greeter to lightdm-webkit2-greeter
sudo sed -i 's/^\(#?greeter\)-session\s*=\s*\(.*\)/greeter-session = lightdm-webkit2-greeter #\1/ #\2g' /etc/lightdm/lightdm.conf
# Set default lightdm-webkit2-greeter theme to Glorious
sudo sed -i 's/^webkit_theme\s*=\s*\(.*\)/webkit_theme = glorious #\1/g' /etc/lightdm/lightdm-webkit2-greeter.conf
sudo sed -i 's/^debug_mode\s*=\s*\(.*\)/debug_mode = true #\1/g' /etc/lightdm/lightdm-webkit2-greeter.conf

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

echo "Installing virtualization tools"
sudo pacman -S libvirt qemu-base virt-viewer virt-manager iptables-nft dnsmasq dmidecode bridge-utils openbsd-netcat

sudo systemctl enable libvirtd
sudo usermod -aG libvirt victor

echo "Finished, now reboot"
