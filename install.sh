#!/bin/bash
# =================================================================
# Hardening Automático LMTM - Target 82 Pts
# Desarrollado en colaboración Humano-IA
# =================================================================

echo "--- Iniciando Despliegue de Seguridad ---"

# 1. Actualización y Herramientas
sudo apt update && sudo apt dist-upgrade -y
sudo apt install auditd fail2ban rkhunter sysstat acct libpam-pwquality -y

# 1.5 Descarga y Auditoría con Lynis 3.1.2
echo "--- Instalando Lynis 3.1.2 ---"
cd /tmp
wget https://downloads.cisofy.com/lynis/lynis-3.1.2.tar.gz
tar xfvz lynis-3.1.2.tar.gz
sudo chown -R root:root /tmp/lynis
cd /tmp/lynis
sudo ./lynis audit system

# 2. Aplicar configuraciones desde carpeta config/
# Asegúrate de haber creado la carpeta config y movido los archivos ahí
sudo cp config/sysctl.conf /etc/sysctl.conf
sudo sysctl -p
sudo cp config/audit.rules /etc/audit/rules.d/audit.rules
sudo cp config/sshd_config /etc/ssh/sshd_config

# 3. Banners Legales (Reconocidos por Lynis)
sudo bash -c 'echo "Legal Notice: Restricted access only. All activities are logged." > /etc/issue'
sudo cp /etc/issue /etc/issue.net

# 4. Configuración de GRUB (Automatización de contraseña)
echo "Configurando protección de GRUB..."
echo "Introduce la contraseña para proteger el GRUB (menú de arranque):"
GRUB_HASH=$(grub-mkpasswd-pbkdf2 | grep "grub.pbkdf2" | awk '{print $NF}')

sudo bash -c "cat <<EOF > /etc/grub.d/40_custom
#!/bin/sh
exec tail -n +3 \$0
set superusers=\"admin\"
password_pbkdf2 admin $GRUB_HASH
EOF"
sudo sed -i 's/CLASS="--class gnu-linux --class gnu --class os"/CLASS="--class gnu-linux --class gnu --class os --unrestricted"/g' /etc/grub.d/10_linux
sudo update-grub

# 5. Reiniciar servicios y Malware Scan
sudo systemctl restart ssh
sudo systemctl restart auditd
sudo rkhunter --propupd

echo "--- Proceso completado. Hardening Index esperado: 82 ---"
echo "Nota: Se ha configurado el usuario 'admin' para el GRUB."

