
#!/bin/bash

# ==========================================================
# Script de Hardening - Auditoría y Blindaje de Servidor
# Autora: Luz Maria Talavera Martinez
# Basado en estándares de seguridad CIS y Auditoría Lynis
# ==========================================================

echo "--- Iniciando proceso de Hardening de Sistema ---"

# 1. FIREWALL (UFW)
# Permitimos SSH pero limitamos el resto por defecto
echo "[+] Configurando Firewall..."
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw --force enable

# 2. SEGURIDAD DE ACCESO (SSH)
# Desactivamos el login directo como Root (Práctica de Seguridad Vital)
echo "[+] Asegurando servicio SSH..."
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config
sudo systemctl restart ssh

# 3. KERNEL HARDENING (sysctl)
# Configuraciones para prevenir ataques de red (Spoofing, Redirects, etc.)
echo "[+] Aplicando políticas de seguridad al Kernel..."

cat <<EOF | sudo tee -a /etc/sysctl.conf
# Configuración de Seguridad - Hardening de Red
net.ipv4.conf.all.send_redirects = 0
net.ipv4.conf.default.send_redirects = 0
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.conf.default.accept_redirects = 0
net.ipv4.conf.all.accept_source_route = 0
net.ipv4.conf.default.accept_source_route = 0
net.ipv4.icmp_echo_ignore_broadcasts = 1
kernel.sysrq = 0
EOF

# Aplicar los cambios del kernel inmediatamente
sudo sysctl -p

# 4. BANNER DE SEGURIDAD
# Aviso legal para cualquier intento de acceso
echo "ACCESO RESTRINGIDO: Este sistema es monitoreado y solo para personal autorizado." | sudo tee /etc/issue.net

echo "--- Hardening completado con éxito ---"
echo "Se recomienda reiniciar el sistema para aplicar todos los cambios."
