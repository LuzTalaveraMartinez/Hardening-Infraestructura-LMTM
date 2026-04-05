#!/bin/bash
echo "--- Aplicando Hardening - Luz Mari Talavera Martínez ---"

# Firewall
sudo ufw allow ssh
sudo ufw --force enable

# Kernel
cat <<EOF | sudo tee -a /etc/sysctl.conf
# Seguridad Luz Talavera
net.ipv4.conf.all.send_redirects = 0
net.ipv4.conf.default.send_redirects = 0
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.conf.default.accept_redirects = 0
net.ipv4.icmp_echo_ignore_broadcasts = 1
kernel.sysrq = 0
EOF

sudo sysctl -p
echo "--- Hardening completado con éxito ---"
