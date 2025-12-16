#!/bin/bash

echo "=== Mengaktifkan Stateless Live Mode ==="

# Menghapus cache dan data user saat shutdown
cat <<EOF > /etc/systemd/system/stateless-cleanup.service
[Unit]
Description=Stateless User Cleanup
Before=shutdown.target reboot.target

[Service]
Type=oneshot
ExecStart=/bin/rm -rf /home/labuser/*

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reexec
systemctl enable stateless-cleanup.service

echo "Mode stateless aktif."
