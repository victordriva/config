#! /bin/sh

echo "Upadting system"
sudo pacman -Syyuu

echo "Installing tools"
sudo pacman -S feh alacritty picom dunst flameshot xclip dbeaver git neovim libreoffice-still steam lutris

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
~/.cargo/bin/cargo install paru bottom bat ripgrep exa

~/.cargo/bin/paru -S discord-ptb google-chrome brave-bin insomnia-bin

echo "Fixing fonts"
~/.cargo/bin/paru -S noto-fonts-emoji ttf-symbola
sudo pacman -R gnu-free-fonts

echo "Finished, now reboot"
