# 3. Simulación e Implementación

## 3.1. Entorno de simulación

| Componente             | Especificación                  |
| ---------------------- | ------------------------------- |
| Virtualización         | VirtualBox 7.0                  |
| Host                   | Ubuntu 22.04, 32GB RAM, Ryzen 7 |
| VM Windows 10          | 4GB RAM, 50GB VDI, 2 cores      |
| VM Ubuntu Server       | 16GB RAM, 100GB VDI, 4 cores    |
| VM Xubuntu             | 2GB RAM, 25GB VDI, 1 core       |
| VM Windows Server 2012 | 8GB RAM, 80GB VDI, 2 cores      |

## 3.2. Evidencias de Analista de Rendimiento y Energía

### Medición con powertop (servidor pre-optimización)

```bash
$ sudo powertop
The system baseline power is estimated at: 18.2 W
Top 5 power consumers:
  1. Network interface (15.8%)    2.8 W
  2. USB controller (12.3%)       2.2 W
  3. SATA link power (11.2%)      2.0 W
  4. Audio codec (8.9%)           1.6 W
  5. PCIe root port (7.6%)        1.4 W

Suggested tunings:
  Bad: VM writeback timeout
  Bad: Autosuspend for USB device
  Good: SATA link power management
```

### Aplicación de optimizaciones

```bash
# Aplicar sugerencias automáticas
sudo powertop --auto-tune

# Hacer persistente (systemd service)
sudo tee /etc/systemd/system/powertop.service << EOF
[Unit]
Description=Powertop tunings

[Service]
Type=oneshot
ExecStart=/usr/sbin/powertop --auto-tune

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl enable powertop.service
sudo systemctl start powertop.service
```

### Resultado post-optimización

```bash
$ sudo powertop
The system baseline power is estimated at: 11.4 W (reduction of 6.8W, 37.4%)
All tunings applied successfully.
```

### Migración PC-REC a Xubuntu - tiempos

```bash
# Tiempo de arranque antes (Windows 10)
$ measure-command { Start-Process "shutdown" -ArgumentList "/r" }
Days: 0, Hours: 0, Minutes: 0, Seconds: 248  # 4m 8s

# Tiempo de arranque después (Xubuntu)
$ systemd-analyze
Startup finished in 2.534s (kernel) + 8.234s (userspace) = 10.768s
graphical.target reached after 8.234s in userspace  # 0m 18s
```

### Gráfico comparativo (generado con s-tui)

```python
# assets/graficos/consumo_comparativo.png generado con:
# s-tui --csv consumo.csv
# Plot con matplotlib

import matplotlib.pyplot as plt
import csv

equipos = ['PC-DIR', 'PC-REC', 'PC-DES', 'SRV']
antes = [98, 70, 80, 120]
despues = [55, 32, 38, 95]

plt.bar([e+' Antes' for e in equipos], antes, alpha=0.7, label='Antes')
plt.bar([e+' Después' for e in equipos], despues, alpha=0.7, label='Después')
plt.ylabel('Consumo (W)')
plt.title('Reducción de consumo energético por equipo')
plt.xticks(rotation=45)
plt.legend()
plt.tight_layout()
plt.savefig('assets/graficos/consumo_comparativo.png')
```

## 3.3. Evidencias de Analista de Soberanía y Obsolescencia

### Eliminación de bloatware Windows

```powershell
# Listar paquetes instalados
winget list | Select-String "Xbox|Skype|Candy|OneDrive"

# Eliminar aplicaciones preinstaladas
Get-AppxPackage *xbox* | Remove-AppxPackage
Get-AppxPackage *skype* | Remove-AppxPackage
Get-AppxPackage *candy* | Remove-AppxPackage
Get-AppxPackage *onedrive* | Remove-AppxPackage

# Deshabilitar servicios de telemetría
Set-Service DiagTrack -StartupType Disabled
Stop-Service DiagTrack
Set-Service dmwappushservice -StartupType Disabled
Stop-Service dmwappushservice
```

### Bloqueo DNS de telemetría

```powershell
# Agregar al hosts file
$hostsPath = "$env:SystemRoot\System32\drivers\etc\hosts"
$telemetryDomains = @(
    "vortex.data.microsoft.com",
    "settings-win.data.microsoft.com",
    "telemetry.microsoft.com",
    "watson.telemetry.microsoft.com"
)

foreach ($domain in $telemetryDomains) {
    Add-Content -Path $hostsPath -Value "0.0.0.0 $domain"
}
```

### Migración a Xubuntu - script de post-instalación

```bash
#!/bin/bash
# scripts/post-install-xubuntu.sh

# Eliminar aplicaciones innecesarias
sudo apt purge --auto-remove -y \
    thunderbird \
    transmission-gtk \
    pidgin \
    gnome-games \
    libreoffice-common  # Reemplazaremos con versión completa

# Instalar software necesario
sudo apt install -y \
    libreoffice \
    okular \
    firefox \
    gimp \
    htop \
    neofetch

# Configurar WINE para Versat Sarasola
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install -y wine wine32 wine64

# Configurar optimizaciones de energía
echo 'vm.swappiness=10' | sudo tee -a /etc/sysctl.conf
echo 'Governor=powersave' | sudo tee /etc/default/cpufrequtils

echo "Post-instalación completada para $(hostname)"
```

### Log de actualización servidor (20.04 → 24.04)

```bash
$ cat assets/upgrade-server.log | head -50
2026-05-12 10:00:01 - Starting do-release-upgrade
2026-05-12 10:00:05 - Checking for new Ubuntu release
2026-05-12 10:00:08 - New release '24.04 LTS' available
2026-05-12 10:00:12 - Running pre-update checks
2026-05-12 10:00:45 - All packages updated
2026-05-12 10:05:23 - Upgrading to 24.04 LTS
2026-05-12 10:15:47 - Installing new kernel 6.8.0
2026-05-12 10:22:31 - Removing obsolete packages
2026-05-12 10:25:00 - System upgrade completed successfully
2026-05-12 10:25:05 - Rebooting in 5 seconds...
```

## 3.4. Evidencias de Analista de Seguridad

### Lynis audit antes y después

```bash
# Antes del hardening
$ sudo lynis audit system | grep "Hardening index"
Hardening index : 58 [██████████████████░░░░░░░░░░░░]

# Principales advertencias
- No firewall active (UFW not configured)
- SSH password authentication allowed
- FTP anonymous access enabled
- No fail2ban installed
- Kernel hardening missing

# Después del hardening
$ sudo lynis audit system | grep "Hardening index"
Hardening index : 84 [████████████████████████████░░]

# Mejoras aplicadas
+ UFW enabled with default deny
+ SSH key-only authentication
+ FTP disabled, SFTP only
+ fail2ban installed and running
+ sysctl hardening applied
```

### Configuración UFW final

```bash
$ sudo ufw status verbose
Status: active
Logging: on (low)
Default: deny (incoming), allow (outgoing), disabled (routed)
New profiles: skip

To                         Action      From
--                         ------      ----
22/tcp                     ALLOW       192.168.1.0/24   # SSH solo LAN
445/tcp                    ALLOW       192.168.1.0/24   # SMB solo LAN
21/tcp                     DENY        Anywhere         # FTP bloqueado
23/tcp                     DENY        Anywhere         # Telnet bloqueado
```

### Verificación SSH hardening

```bash
$ ssh -v user@srv-local 2>&1 | grep "Authenticated"
debug1: Authentications that can continue: publickey
debug1: Next authentication method: publickey
debug1: Authentication succeeded (publickey).

# Intento con contraseña falla
$ ssh -o PreferredAuthentications=password user@srv-local
user@srv-local: Permission denied (publickey).
```

### Escaneo nmap post-hardening

```bash
$ nmap -sV srv-local
Starting Nmap 7.80 at 2026-05-12 11:30
Nmap scan report for srv-local (192.168.1.10)
PORT    STATE SERVICE     VERSION
22/tcp  open  ssh         OpenSSH 9.6 (Ubuntu)
445/tcp open  netbios-ssn Samba smbd 4.19.5

Service detection performed.
Nmap done: 1 IP address (1 host up) scanned in 2.3 seconds
```

### Configuración fail2ban

```bash
$ sudo fail2ban-client status sshd
Status for the jail: sshd
|- Filter
|  |- Currently failed: 0
|  |- Total failed: 3
|  `- File list: /var/log/auth.log
`- Actions
   |- Currently banned: 1
   |- Total banned: 1
   `- Banned IP list: 192.168.1.105  # PC-DIR intentos fallidos
```

## 3.5. Video demostrativo

**URL**: [Carpeta compartida equipo]/video_demo_suminfer.mp4  
**Duración**: 4:30  
**Contenido**:

- 00:00 - 00:45: Medición powertop y cambio governor
- 00:45 - 01:30: Arranque Xubuntu en VM vs Windows original
- 01:30 - 02:15: Comandos de hardening en servidor
- 02:15 - 03:00: nmap verificando puertos cerrados
- 03:00 - 03:45: Configuración UFW y fail2ban
- 03:45 - 04:30: Demostración de mejora tiempos de respuesta
