## System Set-up

# Audio
sudo pacman -S --noconfirm pipewire
sudo pacman -S --noconfirm wireplumber
sudo pacman -S --noconfirm pavucontrol
if [[ !systemctl is-active pipewire || !systemctl is-active pipewire.socket ]]; then
  echo "ERROR: pipewire service is not active"
fi
sudo pacman -S --noconfirm pipewire-alsa
sudo pacman -S --noconfirm pipewire-pulse
sudo pacman -S --noconfirm pipewire-audio

## Package Manager Set-up
sudo pacman -S --noconfirm man-db
sudo pacman -S --noconfirm git
cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
EDITOR=true makepkg -si --noconfirm --needed

## Essential Packages
yay -S --noconfirm zen-browser-bin
yay -S --noconfirm vesktop-bin
