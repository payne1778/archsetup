## System Set-up

# Network
sudo iwconfig wlan0 essid $1
ping -c 1 8.8.8.8 > /dev/null
if [[ $? -ne 0 ]]; then
    echo "FATAL: Could not connect to the internet"
    exit 1
fi
sudo pacman -S --noconfirm networkmanager
sudo systemctl enable --now NetworkManager
## check if this is active using systemctl is-active --quiet NetworkManager

# Audio
sudo pacman -S --noconfirm pipewire
sudo pacman -S --noconfirm wireplumber
sudo pacman -S --noconfirm pavucontrol
systemctl --user status pipewire	        # Ensure active
systemctl --user status pipewire.socket     # Ensure active
sudo pacman -S --noconfirm pipewire-alsa
sudo pacman -S --noconfirm pipewire-pulse
sudo pacman -S --noconfirm pipewire-audio

## Package Manager Set-up
cp ./pacman.conf /etc/
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

