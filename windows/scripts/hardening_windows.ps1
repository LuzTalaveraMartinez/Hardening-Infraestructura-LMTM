# Script de Remediación de Seguridad - Windows Host (PowerShell)
# Basado en auditoría proactiva de Microsoft Defender

Write-Host "Iniciando Hardening de Windows..." -ForegroundColor Cyan

# 1. Activar Reglas ASR (Attack Surface Reduction)
# Bloquea comportamientos comunes usados por malware y ransomware
Set-MpPreference -AttackSurfaceReductionRules_Ids D1E49DB7-9171-41F1-883B-66396377444A -AttackSurfaceReductionRules_Actions Enabled

# 2. Activar el Acceso Controlado a Carpetas (Anti-Ransomware)
# Protege documentos y archivos contra modificaciones no autorizadas
Set-MpPreference -EnableControlledFolderAccess Enabled

# 3. Forzar actualización de firmas de virus y escaneo rápido
Update-MpSignature
Start-MpScan -ScanType QuickScan

Write-Host "✅ Hardening de Windows completado con éxito." -ForegroundColor Green
