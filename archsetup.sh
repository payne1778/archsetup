## System Set-up

# Network
sudo iwconfig wlan0 essid $1
if [[ ping -c 1 8.8.8.8 > /dev/null ]]; then
    echo "FATAL: Could not connect to the internet"
    exit 1
fi
sudo pacman -S --noconfirm networkmanager
sudo systemctl enable --now NetworkManager
if !systemctl is-active NetworkManager; then 
    echo "ERROR: NetworkManager was not started"
fi

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
cp ./pacman.conf /etc/pacman.conf
sudo pacman -S --noconfirm man-db
sudo pacman -S --noconfirm git
cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
EDITOR=true makepkg -si --noconfirm --needed

## Essential Packages
yay -S --noconfirm zen-browser-bin
yay -S --noconfirm vesktop-bin
yay -S --noconfirm fastfetch
echo "fastfetch" >> .bashrc

## IDEs
yay -S --noconfirm zed
yay -S --noconfirm code
yay -S --noconfirm nvim

