# 🛡️ Hardening de Infraestructura Linux - Framework LMTM v2.0

![Hardening Index 82](https://shields.io)
![Security Level](https://shields.io)
![Architecture](https://shields.io)

Framework profesional de securización automatizada para entornos **Debian/Ubuntu Server**. Este ecosistema de scripts y configuraciones eleva la postura de seguridad de un sistema *out-of-the-box* a un **Hardening Index de 82/100**, eliminando vectores de ataque críticos identificados por la metodología de auditoría de **Lynis**.

**Autora:** Luz María Talavera Martínez  
**Fecha:** 14 de abril de 2026  
**Guía Metodológica:** Consultoría Avanzada Humano-IA

---

## 🤖 Ingeniería de Seguridad Asistida por IA

Este proyecto trasciende la ejecución de comandos simples; es el resultado de un proceso de **Ingeniería de Prompts y Consultoría Técnica Iterativa**. La Inteligencia Artificial fue integrada en el ciclo de vida del desarrollo como un **Arquitecto de Seguridad Senior**:

*   **Análisis de Hallazgos:** Interpretación semántica de los reportes de Lynis, priorizando controles basados en el impacto sobre la tríada de la seguridad (Confidencialidad, Integridad y Disponibilidad).
*   **Resolución de Conflictos de Kernel:** Ajuste fino de parámetros en `sysctl.conf` para cumplir con las exigencias del auditor sin degradar la conectividad de red ni romper la resolución de nombres (DNS).
*   **Automatización de Cifrado:** Desarrollo de lógica en Bash para la captura y despliegue dinámico de hashes PBKDF2, permitiendo que la protección del GRUB sea escalable y automatizable.
*   **Diseño de Herramientas Auxiliares:** Creación de un servidor forense en Python optimizado para la extracción segura de logs desde entornos virtualizados (VirtualBox) hacia el host de análisis (Windows).

---


## 🛠️ Pilares Técnicos (Hardening Index 82)


### 1. Networking & Kernel Tuning (LMTM-NetCore)

Se implementó una política de "Deny by Default" para tráfico de control:
*   **Protección ICMP:** Desactivación de *redirects* para mitigar ataques de envenenamiento de ruta (MitM).
*   **RFC 3704 Filtering:** Activación de filtrado de ruta inversa para prevenir el IP Spoofing.
*   **Protocol Hardening:** Remoción de soporte para protocolos de red obsoletos y vectores de hardware (USB Storage, TIPC).

### 2. Acceso y Autenticación (LMTM-Auth)

*   **OpenSSH Hardening:** Desactivación de login por Root, restricción de `MaxAuthTries` a 3 y eliminación de banners de versión de software para evitar el *fingerprinting*.
*   **Criptografía de Credenciales:** Escalado del algoritmo de hashing en `/etc/login.defs` a SHA512 con un factor de trabajo de **10,000 rondas**.
*   **PAM Quality:** Implementación de librerías para forzar la complejidad de contraseñas.

### 3. Seguridad del Arranque y FileSystem

*   **Boot Security:** Protección total del gestor de arranque GRUB. El sistema permite un inicio no restringido pero bloquea cualquier intento de edición de parámetros de kernel mediante credenciales administrativas cifradas.
*   **Integridad de Archivos:** Configuración de `Auditd` con reglas específicas para monitorear intentos de escritura en archivos de identidad (`/etc/passwd`, `/etc/shadow`) y privilegios (`/etc/sudoers`).

---


## 📂 Estructura del Ecosistema

```text
├── install.sh              # Orquestador Maestro: Lógica de despliegue y validación.
├── config/                 # Blueprints de configuración endurecida (Golden Image).
│   ├── sysctl.conf         # Configuración de Red segura.
│   ├── audit.rules         # Políticas de auditoría forense.
│   ├── sshd_config         # Configuración de SSH nivel paranoico.
│   └── 40_custom           # Plantilla de seguridad para GRUB.
├── tools/
│   └── report_server.py    # Servidor de extracción de reportes con detección automática de IP.
└── docs/
    ├── HARDENING_DETAILS.md # Bitácora técnica y justificación de cada control.
    └── IA_CONSULTANCY.md    # Detalle de la metodología Humano-IA aplicada.
