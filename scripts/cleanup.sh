#!/bin/bash

echo "=== System Cleanup ==="

apt autoremove -y
apt autoclean -y
rm -rf /tmp/*
rm -rf /var/tmp/*

echo "Selesai Bersih Bersih."
