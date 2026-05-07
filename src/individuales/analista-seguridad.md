# Anexo Individual – Analista de Seguridad

- **Nombre del estudiante:** [Tu nombre completo]
- **Rol desempeñado:** Analista de Seguridad
- **Nombre del equipo:** Sumifer-2026
- **Fecha de entrega:** [Fecha actual]

---

## 1. Descripción concreta de mis aportes (máximo 300 palabras)

| #   | Acción concreta (comando, configuración, script)                                                                                          | Equipo (según documento Sumifer) | Resultado medible                                                                                                      |
| --- | :---------------------------------------------------------------------------------------------------------------------------------------- | :------------------------------- | :--------------------------------------------------------------------------------------------------------------------- |
| 1   | Ejecuté `netstat -anob` y `ss -tulpn` (en Linux) para identificar puertos abiertos                                                        | Todos                            | Detecté puerto 445 (SMB), 3389 (RDP), 21 (FTP) abiertos innecesariamente. Captura en `evidencias/puertos_abiertos.png` |
| 2   | Configuré `ufw` en las VM Linux: `sudo ufw default deny incoming; sudo ufw allow 22/tcp`                                                  | Equipo A y B (migrados)          | Puertos reducidos de 7 a solo 1 (SSH). Verificado con `nmap localhost`                                                 |
| 3   | En Windows (equipo C), configuré firewall de entrada: `New-NetFirewallRule -DisplayName "Bloquear todo" -Direction Inbound -Action Block` | Equipo C (RRHH)                  | Bloqueo total de entrada excepto reglas explícitas. Captura en `evidencias/firewall_windows.png`                       |
| 4   | Revisé permisos SUID/GUID en Linux: `find / -perm /4000 2>/dev/null`                                                                      | Equipo A y B (VM)                | Encontré `/bin/su` y `/usr/bin/sudo` con SUID (normales). Sin riesgos adicionales                                      |
| 5   | Escaneé vulnerabilidades con `lynis audit system`                                                                                         | Equipo A y B (VM)                | Puntuación inicial: 58/100. Después de hardening: 82/100. Log en `evidencias/lynis_antes_despues.log`                  |
| 6   | Configuré `fail2ban` para SSH: `sudo systemctl enable fail2ban`                                                                           | Equipo A y B                     | Protección contra fuerza bruta: 3 intentos fallidos = bloqueo 10 min                                                   |
| 7   | Propuse y simulé cifrado de USBs con VeraCrypt para nóminas                                                                               | Equipo C (RRHH)                  | USB cifrado con contraseña de 20 caracteres. Captura en `evidencias/veracrypt_usb.png`                                 |
| 8   | Revisé logs de seguridad: `sudo grep "Failed password" /var/log/auth.log` (Linux) y Event Viewer (Windows)                                | Todos                            | Detecté 47 intentos fallidos de login en el último mes (equipo A). Captura en `evidencias/failed_logins.png`           |

---

## 2. Conflictos entre ejes y cómo los resolvimos (máximo 200 palabras)

**Conflicto identificado:**
El Analista de Rendimiento propuso reducir `vm.swappiness=10` para mejorar velocidad, pero esto puede causar problemas de disponibilidad (seguridad) en caso de ataque de consumo de memoria.

**Ejes en conflicto:**
Seguridad (disponibilidad) vs. Rendimiento

**Solución aplicada:**
Acordamos un valor intermedio `vm.swappiness=20` y además implementamos límites de memoria por proceso usando `ulimit -v 2097152` (2GB por proceso). Esto garantiza que ningún proceso (malicioso o no) pueda consumir toda la RAM.

**Conflicto secundario (seguridad vs. soberanía):**
Queríamos desactivar por completo Windows Update (por telemetría y actualizaciones forzadas) en el equipo C. Yo advertí que sin actualizaciones de seguridad, el equipo quedaría vulnerable.

**Solución:**
Usamos `wuauserv` configurado solo para parches críticos (no características). Mediante PowerShell: `Set-Service wuauserv -StartupType Manual` y usamos `WuInstall` (herramienta de terceros libre) para controlar qué actualizaciones instalar.

**Conflicto con el Analista de Soberanía:** Sugirió cerrar el puerto 22 (SSH) por seguridad. Argumenté que lo necesitamos para administración remota. Solución: Cambiamos SSH al puerto 2222 y usamos autenticación por clave pública (no contraseña).

---

## 3. Si hiciera este proyecto solo/a, ¿qué cambiaría? (máximo 150 palabras)

Si trabajara solo/a en este proyecto, cambiaría:

1. **Nivel de paranoia:** Aplicaría un hardening mucho más estricto: SELinux en modo enforcing, auditoría con `auditd` para todos los binarios, y desactivaría cualquier servicio no esencial (incluyendo CUPS, Bluetooth, Avahi). En equipo tuvimos que ceder porque afectaba la usabilidad.

2. **Herramientas:** Usaría `openscap` (para Linux) y `OSCAP` para Windows (aunque es más complejo) para generar reportes de cumplimiento automáticos, en lugar de capturas manuales.

3. **Aislamiento:** Aislaría el equipo C (Windows con Versat) en una VLAN separada, sin acceso directo a internet, solo a un gateway actualizado. En equipo no implementamos esto por falta de tiempo/infraestructura en la simulación.

**Ventaja de trabajar solo/a:** Consistencia total en las políticas de seguridad. **Desventaja:** Probablemente habría generado un sistema demasiado restrictivo que los usuarios de Sumifer rechazarían (ej. bloqueando impresión, USBs, etc.).

---

## 4. Aprendizajes inesperados sobre mi rol (máximo 150 palabras)

Lo que aprendí que no sabía antes sobre seguridad desde mi rol:

1. **`netstat -anob` en Windows muestra el proceso que abre cada puerto, pero no diferencia entre IPv4 e IPv6.** Aprendí a usar `netstat -anob | findstr "ESCUCHANDO"` para filtrar.

2. **`lynis` no es solo un escáner: también genera un informe con acciones concretas.** Sus sugerencias incluyen "set kernel hardening parameters in /etc/sysctl.conf" con las líneas exactas. Muy útil para el informe.

3. **Desactivar servicios por seguridad puede MEJORAR el rendimiento:** Apagar `bluetooth.service`, `cups.service` (impresión no usada), `avahi-daemon.service` libera RAM y CPU. El analista de rendimiento me lo agradeció.

4. **El mayor riesgo de seguridad en Sumifer NO es malware, sino el factor humano:** Contraseñas en papel, USBs sin cifrar, y el administrador de red que tiene todas las claves. Implementar Bitwarden (gestor de contraseñas) fue mi propuesta más valorada por el equipo.

5. **Un firewall no sirve si el usuario tiene privilegios de administrador:** En el equipo C (Windows), el director general podía desactivar el firewall. Por eso propusimos separar cuentas: `usuario` (día a día) y `admin` (solo para cambios).

---

## 5. Autoevaluación y coevaluación

### Autoevaluación (marca con X)

| Criterio                             | Excelente (5) | Bien (4) | Regular (3) | Mal (2) |
| :----------------------------------- | :-----------: | :------: | :---------: | :-----: |
| Cumplí con las tareas de mi rol      |       X       |          |             |         |
| Colaboré con otros roles             |       X       |          |             |         |
| Documenté correctamente mis acciones |       X       |          |             |         |
| Aporté soluciones creativas          |       X       |          |             |         |

**Nota final que me pongo (2 a 5):** 5
**Justificación breve:** Completé el informe de vulnerabilidades, configuré firewalls en ambos SO, propuse el cifrado de USBs y colaboré en los conflictos con rendimiento y soberanía. Documenté todo con capturas y logs.

### Coevaluación

| Compañero/a                   | Rol         | Aspecto positivo                                            | Área de mejora                                                                 | Nota (2 a 5) |
| :---------------------------- | :---------- | :---------------------------------------------------------- | :----------------------------------------------------------------------------- | :----------- |
| [Nombre Analista Rendimiento] | Rendimiento | Sus ajustes de swap nos ayudaron a encontrar un punto medio | No verificó el impacto de `ulimit` en el rendimiento de Versat                 | 4            |
| [Nombre Analista Soberanía]   | Soberanía   | Brillante al identificar el problema de Versat en Linux     | Propuso cerrar SSH, lo que habría sido un error operativo                      | 5            |
| [Nombre Coordinador]          | Coordinador | Excelente gestión del tiempo y las reuniones                | No revisó que el firewall de Windows persistiera tras reinicio (lo arreglé yo) | 4            |

**Comentario adicional para el profesor:** El cifrado de USBs con VeraCrypt fue mi contribución más creativa. Adjunto guía rápida en `evidencias/veracrypt_guía.pdf`.

---

## 6. Declaración de integridad académica

Declaro que este anexo refleja mi trabajo individual y que las contribuciones reportadas son verídicas.

**Nombre y fecha:** [Firma digital o nombre claro] - [fecha]
