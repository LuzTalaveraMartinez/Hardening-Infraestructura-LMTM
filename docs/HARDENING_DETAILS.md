# 📑 Bitácora Técnica de Hardening - Framework LMTM

Este documento detalla las configuraciones específicas aplicadas para alcanzar un **Hardening Index de 82/100**, eliminando vulnerabilidades y optimizando la respuesta del sistema ante incidentes.

## 🛡️ 1. Seguridad de Red (Kernel Tuning)
Se modificó `/etc/sysctl.conf` para endurecer la pila TCP/IP:
- **Mitigación de ataques MitM:** Se deshabilitó la aceptación de redirecciones ICMP (`accept_redirects = 0`).
- **IP Spoofing:** Activación de filtros de ruta inversa (RFC 3704).
- **Protección DoS:** Desactivación de respuestas a pings de broadcast para evitar amplificación de ataques.

## 🔐 2. Autenticación y Control de Acceso
- **SSH Hardening:** 
  - Desactivación de login directo para el usuario `root`.
  - Configuración de `MaxAuthTries 3` para mitigar fuerza bruta.
  - Eliminación de banners de sistema para evitar fingerprinting.
- **Hashing de Contraseñas:** Se incrementó el factor de trabajo a **10,000 rondas (SHA512)** en `/etc/login.defs`, superando el estándar por defecto de 5,000.

## 📊 3. Auditoría Forense y Monitoreo
- **Auditd:** Se implementaron reglas específicas para vigilar intentos de modificación en:
  - `/etc/passwd` y `/etc/shadow` (Cuentas de usuario).
  - `/etc/sudoers` (Escalada de privilegios).
  - `/etc/sysctl.conf` (Cambios en la seguridad del Kernel).
- **Accounting:** Instalación y activación de los servicios `acct` y `sysstat` para registro de procesos y rendimiento.

## 🚀 4. Seguridad de Arranque (Boot Security)
- Se protegió el menú del **GRUB** con una cuenta de superusuario (`admin`) y una contraseña cifrada mediante `PBKDF2`.
- Se aplicó el parámetro `--unrestricted` en `/etc/grub.d/10_linux` para permitir un arranque normal pero bloquear la edición maliciosa de las opciones de arranque.

## 🤖 5. Metodología de Desarrollo con IA
El éxito de este proyecto radica en el uso de la **Inteligencia Artificial como Consultora Técnica**. La IA permitió:
1. Traducir las sugerencias de Lynis en comandos de configuración seguros.
2. Debuguear errores de sintaxis en el archivo `sysctl.conf` que bloqueaban el arranque limpio del sistema.
3. Automatizar scripts complejos que capturan dinámicamente hashes de seguridad.
