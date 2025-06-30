cd ~

## System Set-up

# Network
sudo iwconfig wlan0 essid $1
sudo pacman -S --noconfirm networkmanager
sudo systemctl enable --now NetworkManager

# Audio
sudo pacman -S --noconfirm pipewire
sudo pacman -S --noconfirm wireplumber
sudo pacman -S --noconfirm pavucontrol
systemctl --user status pipewire	    # Ensure active
systemctl --user status pipewire.socket # Ensure active
sudo pacman -S --noconfirm pipewire-alsa
sudo pacman -S --noconfirm pipewire-pulse
sudo pacman -S --noconfirm pipewire-audio

## Package Manager Set-up
sudo pacman -S --noconfirm man-db
sudo pacman -S --noconfirm git
git clone https://aur.archlinux.org/yay.git
cd yay
EDITOR=true makepkg -si --noconfirm --needed
cd ~

## Essential Packages
yay -S --noconfirm zen-browser-bin
yay -S --noconfirm vesktop-bin

## IDEs
yay -S --noconfirm zed
yay -S --noconfirm code
