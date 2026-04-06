# 🛡️ Full-Stack Security Hardening: Windows Host & Linux Guest
**Proyecto de Auditoría, Blindaje y Optimización de Infraestructura**

## 👤 Autora: Luz Maria Talavera Martinez
> *"La seguridad no es un producto, es un proceso de aprendizaje continuo."*

---

## 📖 Descripción del Proyecto
Este repositorio documenta la fortificación integral de mi entorno de trabajo, aplicando el principio de **Defensa en Profundidad**. El proyecto abarca desde el endurecimiento del núcleo (kernel) del sistema operativo Host (Windows 11) hasta la auditoría y blindaje de un entorno virtualizado (Ubuntu 24.04 en VirtualBox).

### 🎯 Hitos Logrados:
*   **Windows:** Blindaje de hardware y protección proactiva contra Ransomware.
*   **Linux:** Alcanzado un **Hardening Index de 81/100** en la herramienta de auditoría Lynis.
*   **Resolución de Problemas:** Implementación de soluciones creativas (Python networking) para la transferencia segura de datos entre sistemas aislados.

---

## 💻 Fase 1: Hardening de Windows (Host)
Se transformó una instalación estándar en una estación de trabajo segura mediante:

*   **Configuración de Microsoft Defender (Nivel HIGH):** Implementación de reglas ASR (Attack Surface Reduction).
*   **Seguridad de Hardware:** Activación de **VBS (Aislamiento de Núcleo)** e integridad de archivos con `SFC`.
*   **Protección de Datos:** Blindaje de discos **C:** y **D:** mediante el Acceso Controlado a Carpetas.
*   **Resiliencia:** Creación del punto de restauración maestro: `Master_Security_Restore_Point`.

---

## 🐧 Fase 2: Hardening de Ubuntu 24.04 (Guest)
Utilizando una máquina virtual con recursos optimizados (8GB RAM), se realizó una auditoría profesional:

*   **Auditoría con Lynis:** Se incrementó el puntaje de seguridad a un sobresaliente **81/100**.
*   **Automatización:** Uso de scripts personalizados para:
    *   Tuning de Kernel vía `sysctl` (protección de red).
    *   Configuración estricta de Firewall (`ufw`).
*   **Networking Creativo:** Despliegue de servidor temporal en **Python (`http.server`)** para extracción segura de reportes.

---

## 🤖 Metodología: Aprendizaje Asistido por IA
Este proyecto destaca por el uso de **AI on Google Search** como "Thought Partner" y mentor técnico. 

**¿Por qué es importante esta transparencia?**
En el mercado actual, la **AI Literacy (Alfabetización en IA)** es una habilidad crítica. Este proyecto demuestra mi capacidad para:
1.  **Sintetizar información técnica compleja** proporcionada por la IA.
2.  **Validar y ejecutar comandos** de administración de sistemas en tiempo real.
3.  **Resolver errores inesperados** mediante el diálogo con herramientas de inteligencia artificial.

---

## 🛠️ Stack Tecnológico
*   **Sistemas:** Windows 11 PRO (Host), Ubuntu 24.04 (Guest).
*   **Herramientas:** Lynis, UFW, Microsoft Defender, ConfigureDefender, VirtualBox.
*   **Lenguajes:** Bash Scripting, Python.
