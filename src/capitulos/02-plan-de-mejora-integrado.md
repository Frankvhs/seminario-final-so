# 2. Plan de Mejora Integrado

## 2.1. Resumen de acciones por equipo

### PC-REC (Recepción - Celeron, 2GB RAM)
| Acción | Ejes | Descripción | Responsable |
|--------|------|-------------|--------------|
| Migrar a Xubuntu 22.04 | R,S,O | Instalación limpia, Xfce ligero | Analista soberanía |
| Instalar LibreOffice | R,S | Suite ofimática libre | Analista rendimiento |
| Configurar Versat en WINE | S | Software nacional obligatorio | Analista seguridad |
| Cifrado de /home | Seg | Protección datos clientes | Analista seguridad |

### PC-DES1-2 (Despacho - Core 2 Duo, 2GB RAM)
| Acción | Ejes | Descripción | Responsable |
|--------|------|-------------|--------------|
| Migrar a Linux Mint Xfce | R,S,O | Extensión vida útil +5 años | Analista soberanía |
| Configurar governor powersave | R,E | Ahorro energético 25% | Analista rendimiento |
| Deshabilitar servicios innecesarios | R,E,S | Limpieza de bloatware | Analista seguridad |

### PC-DIR (Dirección - Pentium, 4GB RAM)
| Acción | Ejes | Descripción | Responsable |
|--------|------|-------------|--------------|
| Dual boot Xubuntu + Windows | S,O | Mantener compatibilidad | Analista soberanía |
| VM Windows para Versat | S | Aislado optimizado | Analista seguridad |
| Desfragmentación HDD semanal | R | Mejora tiempos acceso | Analista rendimiento |
| Reducir swappiness en Windows | R,RAM | 4GB RAM limitada | Analista rendimiento |

### PC-ADM1-3 (Administrativos - i3, 4GB RAM)
| Acción | Ejes | Descripción | Responsable |
|--------|------|-------------|--------------|
| Deshabilitar telemetría | R,S | +5% CPU libre | Analista soberanía |
| Eliminar bloatware | R,S | winget remove | Analista soberanía |
| Aumentar espacio swap a 8GB | R | Manejo RAM limitada | Analista rendimiento |
| Configurar actualizaciones manuales | Seg | Control sobre parches | Analista seguridad |

### PC-TEC (Técnico - i5, 8GB RAM)
| Acción | Ejes | Descripción | Responsable |
|--------|------|-------------|--------------|
| Evaluar migración a Ubuntu Studio | S,O | Alternativa a AutoCAD | Analista soberanía |
| Instalar FreeCAD como alternativa | S | Soberanía tecnológica | Analista soberanía |
| Mantener Windows con hardening | Seg | Por si requiere AutoCAD | Analista seguridad |

### SRV-LOCAL (Servidor - Xeon, 16GB RAM)
| Acción | Ejes | Descripción | Responsable |
|--------|------|-------------|--------------|
| Actualizar a Ubuntu 24.04 LTS | O,Seg | Soporte hasta 2029 | Analista soberanía |
| Configurar governor powersave persistente | E,R | systemd service | Analista rendimiento |
| Hardening SSH (solo clave) | Seg | fail2ban + no root | Analista seguridad |
| Deshabilitar FTP, usar SFTP | Seg | Más seguro | Analista seguridad |
| Ajustar swappiness=10 | R,E | Reduce escritura disco | Analista rendimiento |
| Configurar logwatch | Seg | Monitoreo diario | Analista seguridad |

### Servidor legacy C (Windows Server 2012)
| Acción | Ejes | Descripción | Responsable |
|--------|------|-------------|--------------|
| Apagar y desconectar de red | O,Seg,E | Elimina consumo 145W | Coordinador |
| Migrar datos a SRV-LOCAL | O | Preservar información | Analista soberanía |
| Conservar solo para pruebas offline | O | Hardware de respaldo | Analista seguridad |

## 2.2. Acciones transversales

| Acción | Ejes | Equipos | Comando/Procedimiento |
|--------|------|---------|----------------------|
| Bloquear telemetría Microsoft | R,S | Todos Windows | Modificar hosts |
| Configurar política contraseñas | Seg | Todos | net accounts /minpwlen:8 |
| Programa de desfragmentación | R | HDD | Tarea programada |
| Backup semanal automático | Seg,O | Servidor | rsync + cron |
| Documentación de configuraciones | Todos | Todos | Wiki interna |

## 2.3. Conflictos y resoluciones

### Conflicto 1: Telemetría vs Parches de seguridad
**Problema**: Deshabilitar telemetría también bloquea actualizaciones críticas.
**Resolución**: Configurar Windows Update para descargar solo parches de seguridad, permitir en firewall IPs oficiales de Microsoft Update, aplicar manualmente parches críticos mensualmente.

### Conflicto 2: Rendimiento vs Seguridad (firewall restrictivo)
**Problema**: Firewalls muy restrictivos afectan conexiones legítimas al servidor.
**Resolución**: Reglas por subred /24, permitiendo tráfico interno total pero bloqueando todo entrante desde WAN.

### Conflicto 3: Migración a Linux vs Versat Sarasola
**Problema**: Versat Sarasola requiere Windows.
**Resolución**: VM de Windows minimalista (4GB RAM, 50GB HDD) con recursos justos, o WINE con configuración específica en puestos con suficiente RAM.

## 2.4. Cronograma de implementación

| Semana | Analista rendimiento | Analista soberanía | Analista seguridad | Coordinador |
|--------|---------------------|-------------------|-------------------|-------------|
| 1 | Medición baseline | Inventario software | Escaneo vulnerabilidades | Consolidar diagnóstico |
| 2 | Ajustes governor, swappiness | Migración PC-REC, PC-DES | Hardening servidor | Documentar avances |
| 3 | Optimización PC-ADM | Configurar VM Versat | Firewall, fail2ban | Revisión consistencia |
| 4 | Validación métricas | Actualización servidor | Logs, backups | Informe final |

## 2.5. Matriz de trazabilidad requisito-acción

| Requisito No Funcional | Acciones relacionadas | Verificación |
|------------------------|----------------------|---------------|
| Vida útil +5 años | Migración a Linux, actualización servidor | Fecha soporte OS |
| Consumo -30% | Governor powersave, apagar C | Medición powertop |
| Soberanía tecnológica | LibreOffice, Linux, eliminar telemetría | % software libre |
| Confidencialidad | Cifrado /home, SSH solo clave | Auditoría |
| Disponibilidad | RAID1, backup automático | Prueba restauración |
| Mínimo privilegio | Deshabilitar root SSH, UAC alto | Revisión permisos |