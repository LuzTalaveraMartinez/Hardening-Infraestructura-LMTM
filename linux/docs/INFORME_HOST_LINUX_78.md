    INFORME DE AUDITORÍA: HOST LINUX (SISTEMA REAL)

    Propietaria: Luz María Talavera Martínez
    Estado de Seguridad: EXCELENTE - NIVEL DE PRODUCCIÓN SEGURO
    Hardening Index (Lynis): 78 / 100
    Alertas Críticas (Warnings): 0



    1. RESUMEN EJECUTIVO

    Se ha realizado una auditoría profunda sobre el sistema operativo Host
    (Ubuntu/Linux físico). Tras aplicar múltiples capas de endurecimiento
    (Hardening), se ha logrado eliminar la totalidad de las advertencias de
    seguridad, manteniendo el sistema plenamente operativo para tareas de
    estudio, desarrollo y navegación diaria.



    2. FORTALECIMIENTO DE RED (NETW)

   Gestión de Firewalls (UFW): Se ha implementado una política de "Deny All"
    para tráfico entrante, permitiendo únicamente conexiones de salida
    autorizadas.

   Resiliencia de DNS: Se han configurado servidores de nombres
    (Nameservers) de respaldo cifrados ( 8.8.8.8 y 1.1.1.1 ) para garantizar la
    disponibilidad y privacidad de la navegación ante fallos del ISP.

   Mitigación de Ataques de Red: Desactivación de redireccionamientos ICMP
    y protección contra IP Spoofing mediante el ajuste de parámetros en el stack
    de red.



    3. SEGURIDAD DEL KERNEL Y ACCESO (BANN / HRDN)

   Hardening de Compiladores: Se ha restringido el acceso a compiladores
    críticos ( gcc , as ) únicamente al usuario administrador ( chmod 700 ), impidiendo
    que posibles exploits locales compilen código malicioso en el sistema.
   Cumplimiento de Banners: Implementación de avisos legales ( /etc/issue.net )
    para advertir sobre accesos no autorizados, cumpliendo con los estándares
    de auditoría internacional.

   Protección del Kernel: Ajuste de valores sysctl para prevenir ataques de
    desbordamiento de búfer y manipulación de memoria.



    4. GESTIÓN DE PAQUETES Y VULNERABILIDADES (PKGS)

   Higiene de Software: Se han saneado todas las dependencias vulnerables
    identificadas en el escaneo inicial ( PKGS-7392 ).

   Control de Intrusiones: Instalación y configuración de fail2ban para prevenir
    ataques de fuerza bruta en servicios expuestos.



    CONCLUSIÓN TÉCNICA

    El sistema presenta un estado de Alta Fidelidad y Seguridad. Se ha
    alcanzado un índice de 78/100, el cual se considera el "punto óptimo" para
    una estación de trabajo real.
    Se ha decidido no aplicar las sugerencias restantes de particionado de disco
    ( FILE-6310 ) para preservar la integridad de los datos existentes y la
    estabilidad del arranque, priorizando la disponibilidad del sistema sobre el
    puntaje teórico de auditoría.
