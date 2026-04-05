#!/bin/bash
# ==============================================================================
# SCRIPT DE HARDENING AUTOMATIZADO - LYNIS 3.0.9
# Guardar como: hardening_final.sh
# ==============================================================================

# Solo ejecutar como root
if [ "$EUID" -ne 0 ]; then echo "Ejecuta con sudo"; exit 1; fi

echo "[+] 1. Corrigiendo Sincronización de Hora (TIME-3185)..."
systemctl restart systemd-timesyncd && timedatectl set-ntp true

echo "[+] 2. Instalando Herramientas de Seguridad (DEB-0810, FINT-4350)..."
apt update -qq && apt install -y auditd sysstat aide -qq

echo "[+] 3. Configurando Banners Legales (BANN-7126)..."
echo "ACCESO RESTRINGIDO: Solo personal autorizado." > /etc/issue
echo "ACCESO RESTRINGIDO: Solo personal autorizado." > /etc/issue.net

echo "[+] 4. Activando Auditoría y Sysstat (ACCT-9626)..."
sed -i 's/ENABLED="false"/ENABLED="true"/' /etc/default/sysstat
systemctl enable --now sysstat && systemctl restart sysstat

echo "[+] 5. Hardening del Kernel (KRNL-6000)..."
cat <<EOF > /etc/sysctl.d/99-hardening.conf
net.ipv4.conf.all.rp_filter = 1
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.tcp_syncookies = 1
EOF
sysctl -p /etc/sysctl.d/99-hardening.conf > /dev/null

echo "=========================================================="
echo "   HARDENING COMPLETADO - VUELVE A CORRER LYNIS"
echo "=========================================================="
