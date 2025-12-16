#!/bin/bash

echo "=== Mengunci akses root dan sudo ==="

# Kunci akun root
passwd -l root

# Hapus user lab dari grup sudo (jaga-jaga)
deluser labuser sudo || true

echo "Root login dan sudo telah dinonaktifkan."
