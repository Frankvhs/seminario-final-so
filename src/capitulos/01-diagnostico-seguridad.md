# 1. Diagnóstico de Seguridad

*Analista: [Nombre del estudiante]*

## 1.1. Inventario de vulnerabilidades por equipo

### Equipos Windows (PC-ADM1-3, PC-DIR, PC-TEC, PC-REC, PC-DES1-2)

| Vulnerabilidad | PC-ADM | PC-DIR | PC-TEC | PC-REC | PC-DES | Gravedad |
|----------------|--------|--------|--------|--------|--------|----------|
| Sin contraseña BIOS | ✓ | ✓ | ✓ | ✓ | ✓ | Media |
| Usuario invitado activo | ✓ | — | — | ✓ | ✓ | Media |
| UAC nivel bajo | ✓ | ✓ | — | ✓ | ✓ | Alta |
| Firewall reglas por defecto | ✓ | ✓ | ✓ | ✓ | ✓ | Media |
| Antivirus desactualizado | ✓ | ✓ | ✓ | ✓ | ✓ | Alta |
| RDP habilitado | — | ✓ | ✓ | — | — | Crítica |
| SMBv1 activo | — | — | — | ✓ | ✓ | Crítica |
| Puertos abiertos (135,445,3389) | ✓ | ✓ | ✓ | ✓ | ✓ | Media |

### Servidor Ubuntu (SRV-LOCAL)

| Vulnerabilidad | Estado | Gravedad |
|----------------|--------|----------|
| FTP anónimo habilitado | Activo | Crítica |
| SSH permite contraseña | Sí | Alta |
| Root login por SSH | Permitido | Alta |
| Firewall (ufw) inactivo | Desactivado | Crítica |
| Contraseña root débil | 8 chars, alfanumérica | Media |
| SUID binaries no auditados | Parcial | Media |
| Fail2ban no instalado | No | Media |
| Logs sin rotación automática | No | Baja |

### Servidor legacy (no operativo pero conectado a red)

| Vulnerabilidad | Estado | Gravedad |
|----------------|--------|----------|
| Windows Server 2012 (sin soporte) | Activo | Crítica |
| Telnet habilitado (puerto 23) | Activo | Crítica |
| Firewall desactivado | Sí | Crítica |
| Cuenta adminbackup (Admin123) | Activa | Crítica |
| Sin antivirus | Sí | Alta |

## 1.2. Herramientas de diagnóstico utilizadas

### Windows
```powershell
# Puertos abiertos y conexiones
netstat -an | findstr LISTENING
netstat -an | findstr ESTABLISHED

# Procesos con permisos elevados
Get-Process | Where-Object {$_.StartInfo.Verb -eq 'RunAs'}

# Usuarios locales
net user
wmic useraccount get name,sid,status

# Políticas de contraseña
net accounts
secedit /export /cfg C:\secpol.cfg

# Firewall
netsh advfirewall show allprofiles
netsh advfirewall firewall show rule name=all

# Historial de eventos de seguridad
Get-EventLog -LogName Security -Newest 50 | Where-Object {$_.EntryType -eq "FailureAudit"}
```

### Linux (Servidor)
```bash
# Puertos y servicios escuchando
ss -tulpn
netstat -tulpn

# Auditoría de seguridad completa
sudo lynis audit system

# Búsqueda de rootkits
sudo rkhunter --check

# Binarios con SUID
find / -perm /4000 2>/dev/null

# Usuarios sin contraseña
sudo awk -F: '($2=="") {print $1}' /etc/shadow

# Intentos de login fallidos
sudo lastb | head -20
sudo grep "Failed password" /var/log/auth.log

# Configuración sysctl insegura
sysctl -a | grep -E "ip_forward|tcp_syncookies|rp_filter"
```

## 1.3. Hallazgos críticos documentados

### Evidencia 1: FTP anónimo en servidor
```bash
# Captura de ss -tulpn
tcp   LISTEN 0      32          0.0.0.0:21        0.0.0.0:*    users:(("vsftpd",pid=832,fd=4))
tcp   LISTEN 0      32             [::]:21           [::]:*    users:(("vsftpd",pid=832,fd=5))
```

### Evidencia 2: Cuentas débiles
```powershell
# Equipo C (legacy)
C:\> net user adminbackup
User name                    adminbackup
Full Name                    Admin Backup
Comment                      
Country code                 000 (System Default)
Account active               Yes
Password last set            10/05/2024 9:34:17 AM
Password expires             Never
Password changeable          10/05/2024 9:34:17 AM
Password required            Yes
User may change password     Yes
```

### Evidencia 3: Logs de seguridad con intentos fallidos
```powershell
# Event ID 4625 - Logon fallido desde IP 192.168.1.105 (PC-DIR a PC-ADM1)
10/05/2026 14:23:17 - Logon Failure - Account: Admin, Source: 192.168.1.105
10/05/2026 15:01:42 - Logon Failure - Account: Admin, Source: 192.168.1.105
10/05/2026 16:33:19 - Logon Failure - Account: user, Source: 192.168.1.105
```

## 1.4. Checklist de hardening aplicado (inicial)

### Servidor Linux
```bash
# 1. Configurar firewall UFW
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow from 192.168.1.0/24 to any port 22 proto tcp  # SSH solo LAN
sudo ufw allow from 192.168.1.0/24 to any port 445 proto tcp  # Samba solo LAN
sudo ufw enable

# 2. Deshabilitar FTP anónimo
sudo sed -i 's/anonymous_enable=YES/anonymous_enable=NO/' /etc/vsftpd.conf
sudo systemctl restart vsftpd

# 3. Hardening SSH
echo "PasswordAuthentication no" | sudo tee -a /etc/ssh/sshd_config
echo "PermitRootLogin no" | sudo tee -a /etc/ssh/sshd_config
echo "MaxAuthTries 3" | sudo tee -a /etc/ssh/sshd_config
sudo systemctl restart sshd

# 4. Instalar y configurar fail2ban
sudo apt install fail2ban -y
sudo systemctl enable fail2ban
sudo systemctl start fail2ban

# 5. Hardening sysctl
cat << EOF | sudo tee -a /etc/sysctl.conf
net.ipv4.tcp_syncookies = 1
net.ipv4.ip_forward = 0
net.ipv4.conf.all.rp_filter = 1
net.ipv4.conf.default.rp_filter = 1
net.ipv4.icmp_echo_ignore_all = 1
EOF
sudo sysctl -p
```

### Equipos Windows
```powershell
# 1. Configurar firewall avanzado
New-NetFirewallRule -DisplayName "Bloquear RDP externo" -Direction Inbound -LocalPort 3389 -Protocol TCP -Action Block -RemoteAddress Any

# 2. Deshabilitar SMBv1 (PC-REC y PC-DES)
Disable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol -Remove

# 3. Configurar UAC a nivel máximo
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -Value 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorAdmin" -Value 2

# 4. Deshabilitar cuenta invitado
Disable-LocalUser -Name "Guest"

# 5. Configurar política de contraseñas
net accounts /minpwlen:8 /maxpwage:90 /minpwage:1 /uniquepw:3
```

## 1.5. Riesgos residuales post-hardening inicial

| Riesgo | Impacto | Mitigación pendiente | Prioridad |
|--------|---------|---------------------|-----------|
| Windows sin soporte (PC-REC, DES) | Crítico | Migración a Linux | Alta |
| Servidor legacy Windows 2012 en red | Crítico | Aislar o apagar | Alta |
| Parches de seguridad manuales | Medio | Calendario mensual de actualización | Media |
| Sin backup de configuraciones de seguridad | Medio | Documentar y respaldar scripts | Media |
| Usuarios con contraseñas débiles | Medio | Política y capacitación | Media |
| Sin monitoreo de logs centralizado | Bajo | Implementar rsyslog | Baja |

## 1.6. Matriz de riesgos

```
Impacto
  ↑
Crítico│  [C-legacy]  [FTP] [RDP]
  │     [Telnet]     [sin firewall]
Alto   │  [SMBv1]     [sin parches]
  │     [UAC bajo]   [pass débiles]
Medio  │  [telemetría] [logs]
  │
Bajo   │  [sin backups]
  │
  └────────────────────────────────→ Probabilidad
         Baja    Media    Alta   Crítica
```