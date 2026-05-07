# 2. Plan de Mejora Integrado

## Tabla Maestra de Acciones

### 1. Acciones de Rendimiento y Energía (Analista: [Nombre])

| Acción concreta                                                                  | Equipo(s) objetivo     | Impacto esperado                          | Relación con otros ejes                       |
| :------------------------------------------------------------------------------- | :--------------------- | :---------------------------------------- | :-------------------------------------------- |
| Reducir `vm.swappiness` a 10 y aumentar páginafile en SSD (si se añade)          | Director General       | Menor uso de disco como RAM               | Seguridad: sin impacto negativo               |
| Cambiar plan de energía a "Ahorro energético" y desactivar servicios de indexado | Director Económico     | Reduce consumo eléctrico ~15%             | Obsolescencia: reduce calor en hardware viejo |
| Reemplazar HDD por SSD (reutilizado de otro equipo)                              | RRHH                   | Aumenta velocidad de arranque y respuesta | Soberanía: no depende de HW nuevo             |
| Aplicar `powertop --auto-tune` si se migra a Linux                               | Todos (post-migración) | Ahorro energético adicional 20-30%        | -                                             |

### 2. Acciones de Soberanía y Lucha contra Obsolescencia (Analista: [Nombre])

| Acción concreta                                                           | Equipo(s) objetivo           | Justificación                                                | Relación con otros ejes                        |
| :------------------------------------------------------------------------ | :--------------------------- | :----------------------------------------------------------- | :--------------------------------------------- |
| **Migración planificada a Xubuntu 24.04** (Linux ligero)                  | Director General y Económico | Extiende vida útil en >5 años, elimina dependencia Microsoft | Rendimiento: mejora en equipos con 4GB o menos |
| Reemplazar Office por **LibreOffice** + **OnlyOffice**                    | Todos                        | Soberanía tecnológica, sin coste de licencia                 | Seguridad: parches regulares de la comunidad   |
| Desactivar servicios de telemetría (si se mantiene Windows temporalmente) | RRHH                         | Evita degradación por tiempo y spyware                       | Rendimiento: libera CPU/RAM                    |
| Migrar AutoCAD LT a **FreeCAD** + Formación básica                        | RRHH                         | Elimina software privativo no usado realmente                | Energía: menor uso de GPU innecesario          |

### 3. Acciones de Seguridad (Analista: [Nombre])

| Acción concreta                                                              | Equipo(s) objetivo        | Herramienta               | Relación con otros ejes                           |
| :--------------------------------------------------------------------------- | :------------------------ | :------------------------ | :------------------------------------------------ |
| Configurar **ufw** deny incoming, allow SSH                                  | Todos (si migran a Linux) | `ufw`, `iptables`         | Aumenta seguridad sin afectar rendimiento         |
| Sustituir FTP por **SFTP** en el servidor Ubuntu                             | Servidor + todos          | `vsftpd` con SSL o `sshd` | Confidencialidad de los archivos compartidos      |
| Cifrar memorias USB con **VeraCrypt** o LUKS                                 | RRHH (nóminas)            | `veracrypt`               | Impacta usabilidad (mejorable con automatización) |
| Implementar gestor de contraseñas (Bitwarden) y deshabilitar cuenta invitado | Director General          | Bitwarden                 | Soberanía: Bitwarden es open source               |

## Matriz de Consistencia (Coordinador técnico)

Verificar que ninguna acción de un rol anula la de otro:

- ¿Desactivar telemetría en Windows bloquea actualizaciones de seguridad? → **Solución:** Usar `wuauserv` solo para parches críticos (vía PowerShell).
- ¿Migrar a Linux afecta el uso de Versat Sarasola? → **Riesgo alto:** Versat Sarasola (software cubano) **no tiene** versión nativa Linux. → **Acción correctora:** Mantener Windows en un equipo (RRHH) como servidor de aplicaciones o usar Wine/Crossover (probado previamente en VM).
- ¿El firewall restrictivo bloquea la impresión Zebra? → Permitir puerto 9100 solo desde la IP de RRHH.

## Plan de Implementación (Simulación)

| Fase            | Acciones                                                 | Responsable          | Entorno de simulación                  |
| :-------------- | :------------------------------------------------------- | :------------------- | :------------------------------------- |
| 1. Preparación  | Instalar VirtualBox, clonar Windows 10 actual en VM      | Coordinador          | VM con 2GB RAM (simula Dir. Económica) |
| 2. Migración    | Instalar Xubuntu en VM, configurar LibreOffice           | Analista Soberanía   | VM Xubuntu                             |
| 3. Hardening    | Aplicar `ufw`, `lynis audit`, deshabilitar servicios     | Analista Seguridad   | Ambas VMs                              |
| 4. Rendimiento  | Ejecutar `powertop`, ajustar `swappiness`, medir tiempos | Analista Rendimiento | VM Linux                               |
| 5. Verificación | Probar Versat Sarasola con Wine (si aplica)              | Coordinador          | VM Linux                               |

_(Fin del plan de mejora. Extensión: máximo 4 páginas)_
