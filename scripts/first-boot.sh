#!/bin/bash
set -e

echo "=== Informatika Lab Distro | First Boot Script (Cinnamon) ==="

# ==============================
# 1. KERNEL CONFIGURATION
# ==============================
echo "[1/4] Applying kernel parameters..."

sysctl -p

# ==============================
# 2. PACKAGE MANAGEMENT
# ==============================
echo "[2/4] Installing and removing packages..."

apt update

install_packages() {
    while read -r pkg; do
        [ -z "$pkg" ] && continue
        apt install -y "$pkg"
    done < "$1"
}

install_packages /opt/packages/install/productivity.txt
install_packages /opt/packages/install/education.txt
install_packages /opt/packages/install/lab-tools.txt

while read -r pkg; do
    [ -z "$pkg" ] && continue
    apt purge -y "$pkg"
done < /opt/packages/remove/bloatware.txt

apt autoremove -y

# ==============================
# 3. USER & CONFIGS (CINNAMON)
# ==============================
echo "[3/4] Applying Cinnamon desktop configs..."

# Buat user lab
if ! id userlab &>/dev/null; then
    useradd -m -s /bin/bash userlab
fi

# Pastikan tidak sudo
deluser userlab sudo 2>/dev/null || true

# Cinnamon themes & icons
runuser -l userlab -c "gsettings set org.cinnamon.desktop.interface gtk-theme 'Mint-Y-Dark'"
runuser -l userlab -c "gsettings set org.cinnamon.desktop.interface icon-theme 'Papirus-Dark'"
runuser -l userlab -c "gsettings set org.cinnamon.theme name 'Mint-Y-Dark'"

# Set wallpaper Cinnamon
runuser -l userlab -c "gsettings set org.cinnamon.desktop.background picture-uri 'file:///usr/share/backgrounds/remonos/remonosbg.png'"
runuser -l userlab -c "gsettings set org.cinnamon.desktop.background picture-options 'zoom'"

# Apply Cinnamon desktop config
runuser -l userlab -c "dconf load /org/cinnamon/ < /opt/configs/desktop/cinnamon-settings.dconf"

# Disable desklets & applets (minim distraksi)
runuser -l userlab -c "gsettings set org.cinnamon enabled-desklets []"
runuser -l userlab -c "gsettings set org.cinnamon enabled-applets []"

# ==============================
# 4. FINAL SETUP
# ==============================
echo "[4/4] Finalizing setup..."

timedatectl set-timezone Asia/Jakarta

systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target

echo "First boot setup telah selesai."
echo "Mematikan first-boot service..."

systemctl disable first-boot.service

echo "First boot service mati. System siap."

