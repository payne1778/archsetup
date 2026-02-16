#!/usr/bin/bash

## System Set-up

set -e

# Network
# sudo iwconfig wlan0 essid $1
if ! ping -c 1 8.8.8.8 > /dev/null; then
    echo "FATAL: Could not connect to the internet"
    exit 1
fi
sudo pacman -S --noconfirm networkmanager
sudo systemctl enable --now NetworkManager
if ! systemctl is-active NetworkManager; then 
    echo "ERROR: NetworkManager was not started"
fi


# Audio
sudo pacman -S --noconfirm pipewire
sudo pacman -S --noconfirm wireplumber
sudo pacman -S --noconfirm pavucontrol
if ! systemctl is-active pipewire; then 
  echo "ERROR: pipewire service is not active"
fi
if ! systemctl is-active pipewire.socket; then
  echo "ERROR: pipewire socket service is not active"
fi
sudo pacman -S --noconfirm pipewire-alsa
sudo pacman -S --noconfirm pipewire-pulse
sudo pacman -S --noconfirm pipewire-audio


## Package Manager Set-up
cp ./pacman.conf /etc/pacman.conf
sudo pacman -S --noconfirm man-db
sudo pacman -S --noconfirm --needed base-devel git
cd ~
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin || exit 1
EDITOR=true makepkg -si --noconfirm --needed


## Essential Packages
sudo pacman -S --noconfirm waybar
sudo pacman -S --noconfirm btop
sudo pacman -S --noconfirm eza
sudo pacman -S --noconfirm bat
sudo pacman -S --noconfirm fastfetch
echo "fastfetch" >> .bashrc


## Fonts
sudo pacman -S --noconfirm ttf-jetbrains-mono-nerd 
sudo pacman -S --noconfirm ttf-nerd-fonts-symbols 
sudo pacman -S --noconfirm ttf-firacode-nerd 
sudo pacman -S --noconfirm noto-fonts-emoji


## User Packages
yay -S --noconfirm zen-browser-bin
yay -S --noconfirm vesktop-bin


## Development
yay -S --noconfirm vscodium
yay -S --noconfirm vscodium-all-marketplace
sudo pacman -S --noconfirm ghostty
sudo pacman -S --noconfirm neovim
sudo pacman -S --noconfirm zsh
chsh -s "$(which zsh)"