# INFORME DE AUDITORÍA: HOST LINUX (SISTEMA REAL)

**Propietaria:** Luz María Talavera Martínez  
**Estado de Seguridad:** **EXCELENTE - NIVEL DE PRODUCCIÓN SEGURO**  
**Hardening Index (Lynis):** **78 / 100**  
**Alertas Críticas (Warnings):** **0**

---

### 1. RESUMEN EJECUTIVO
Se ha realizado una auditoría profunda sobre el sistema operativo Host (Linux físico). Tras aplicar múltiples capas de endurecimiento (Hardening), se ha logrado eliminar la totalidad de las advertencias de seguridad.

### 2. ACCIONES TÉCNICAS REALIZADAS
* **Gestión de Red:** Política "Deny All" y Nameservers de respaldo.
* **Seguridad de Acceso:** Restricción de permisos en compiladores (gcc, as).
* **Cumplimiento:** Banners legales en /etc/issue.net.
* **Prevención:** Instalación de fail2ban.

### CONCLUSIÓN
El sistema ha alcanzado el "punto óptimo" de seguridad para una estación de trabajo real.
