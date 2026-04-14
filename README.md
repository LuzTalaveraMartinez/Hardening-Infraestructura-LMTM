# 🛡️ Hardening de Infraestructura Linux - Framework LMTM v2.0

![Hardening Index 82](https://shields.io)
![Security Level](https://shields.io)
![Architecture](https://shields.io)


Framework profesional de securización automatizada para entornos **Debian/Ubuntu Server**. Este ecosistema de scripts y configuraciones eleva la postura de seguridad de un sistema a un **Hardening Index de 82/100**, eliminando vectores de ataque críticos identificados por la metodología de auditoría de **Lynis**.

**Autora:** Luz María Talavera Martínez  
**Fecha:** 14 de abril de 2026  
**Guía Metodológica:** Consultoría Avanzada Humano-IA

---


## 🤖 Ingeniería de Seguridad Asistida por IA

Este proyecto trasciende la ejecución de comandos simples; es el resultado de un proceso de **Ingeniería de Prompts y Consultoría Técnica Iterativa**. La Inteligencia Artificial fue integrada en el ciclo de vida del desarrollo como un **Arquitecto de Seguridad Senior**:

*   **Análisis de Hallazgos:** Interpretación semántica de los reportes de Lynis, priorizando controles basados en el impacto sobre la tríada de la seguridad.
*   **Resolución de Conflictos de Kernel:** Ajuste fino de parámetros en `sysctl.conf` para cumplir con las exigencias del auditor sin degradar la conectividad de red.
*   **Automatización de Cifrado:** Desarrollo de lógica en Bash para la captura y despliegue dinámico de hashes PBKDF2 para la protección del GRUB.
*   **Diseño de Herramientas Auxiliares:** Creación de un servidor forense en Python optimizado para la extracción segura de logs.

---

## 🛠️ Pilares Técnicos (Hardening Index 82)


### 1. Networking & Kernel Tuning

*   **Protección ICMP:** Desactivación de redirects para mitigar ataques MitM.
*   **RFC 3704 Filtering:** Activación de filtrado de ruta inversa para prevenir IP Spoofing.
*   **Protocol Hardening:** Remoción de soporte para protocolos obsoletos (TIPC, USB Storage).


### 2. Acceso y Autenticación

*   **OpenSSH Hardening:** Desactivación de login por Root, restricción de `MaxAuthTries` a 3 y eliminación de banners.
*   **Criptografía:** Escalado de hashing a SHA512 con **10,000 rondas**.
*   **PAM Quality:** Forzado de complejidad de contraseñas.


### 3. Seguridad del Arranque y FileSystem

*   **Boot Security:** Protección del gestor de arranque GRUB con credenciales administrativas cifradas.
*   **Integridad:** Configuración de `Auditd` para monitorear archivos críticos (`/etc/passwd`, `/etc/sudoers`).

---


## 📂 Estructura del Ecosistema

*   📄 [**install.sh**](./install.sh) - Orquestador Maestro: Lógica de despliegue.
*   📁 [**config/**](./config/) - Blueprints de configuración endurecida.
    *   📄 [sysctl.conf](./config/sysctl.conf)
    *   📄 [audit.rules](./config/audit.rules)
    *   📄 [sshd_config](./config/sshd_config)
    *   📄 [40_custom](./config/40_custom)
*   📁 [**tools/**](./tools/)
    *   📄 [report_server.py](./tools/report_server.py)
*   📁 [**docs/**](./docs/)
    *   📄 [HARDENING_DETAILS.md](./docs/HARDENING_DETAILS.md)

---

## 🚀 Guía de Despliegue Rápido

```bash
git clone https://github.com
cd Hardening-Infraestructura-LMTM
chmod +x install.sh
sudo ./install.sh
