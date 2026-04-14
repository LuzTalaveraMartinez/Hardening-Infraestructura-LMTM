#!/usr/bin/env python3
import http.server
import socketserver
import socket
import os
import sys

# --- CONFIGURACIÓN ---
PORT = 8080
DIRECTORY = "/var/log" # Carpeta donde Lynis guarda los reportes
# ---------------------

class LMTMHandler(http.server.SimpleHTTPRequestHandler):
    """Manejador personalizado para servir reportes de auditoría"""
    def __init__(self, *args, **kwargs):
        # Establece el directorio de trabajo antes de iniciar
        super().__init__(*args, directory=DIRECTORY, **kwargs)

def get_ip():
    """Obtiene la IP local de la VM para facilitar la conexión"""
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    try:
        # No necesita conexión real, solo para obtener la interfaz
        s.connect(('8.8.8.8', 1))
        IP = s.getsockname()[0]
    except Exception:
        IP = '127.0.0.1'
    finally:
        s.close()
    return IP

def start_server():
    # Verificar si el directorio existe
    if not os.path.exists(DIRECTORY):
        print(f"❌ Error: El directorio {DIRECTORY} no existe.")
        sys.exit(1)

    my_ip = get_ip()
    
    print("="*60)
    print("🛡️  LMTM INFRASTRUCTURE - REPORT SERVER 🛡️")
    print("="*60)
    print(f"✅ Servidor activo exitosamente.")
    print(f"📂 Sirviendo archivos desde: {DIRECTORY}")
    print(f"🌐 Acceso desde tu Windows:")
    print(f"   👉 http://{my_ip}:{PORT}")
    print("-"*60)
    print("📝 Archivos recomendados para descargar:")
    print("   - lynis.log")
    print("   - lynis-report.dat")
    print("-"*60)
    print("Presiona CTRL+C para apagar el servidor.")

    # Iniciar el servidor
    try:
        with socketserver.TCPServer(("", PORT), LMTMHandler) as httpd:
            httpd.allow_reuse_address = True
            httpd.serve_forever()
    except KeyboardInterrupt:
        print("\n🛑 Servidor apagado por el usuario.")
        sys.exit(0)
    except Exception as e:
        print(f"❌ Error crítico: {e}")
        sys.exit(1)

if __name__ == "__main__":
    start_server()
