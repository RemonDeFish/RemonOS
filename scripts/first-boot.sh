#!/bin/bash

echo "=== Konfigurasi First Boot ==="

# Update sistem
apt update && apt upgrade -y

# Terapkan konfigurasi kernel sysctl
sysctl -p

# Set timezone
timedatectl set-timezone Asia/Jakarta

# Nonaktifkan suspend (lab friendly)
systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target

echo "Konfigurasi First boot selesai. Yey"
