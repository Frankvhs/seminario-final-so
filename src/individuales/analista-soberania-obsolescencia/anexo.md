# Anexo Individual – Analista de Soberanía y Obsolescencia

- **Nombre del estudiante:** [Tu nombre completo]
- **Rol desempeñado:** Analista de Soberanía y Obsolescencia
- **Nombre del equipo:** Sumifer-2026
- **Fecha de entrega:** [Fecha actual]

---

## 1. Descripción concreta de mis aportes (máximo 300 palabras)

| #   | Acción concreta (comando, configuración, script)                                                                    | Equipo (según documento Sumifer) | Resultado medible                                                                                                                         |
| --- | :------------------------------------------------------------------------------------------------------------------ | :------------------------------- | :---------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------- |
| 1   | Identifiqué servicios de telemetría activos: `Get-Service DiagTrack, dmwappushservice`                              | Equipo A, B, C (Windows)         | 2 servicios de telemetría activos por equipo. Captura en `evidencias/telemetria_activa.png`                                               |
| 2   | Desactivé servicios en PowerShell: `Stop-Service DiagTrack -Force; Set-Service DiagTrack -StartupType Disabled`     | Equipo A y C (simulado)          | Reducción de ~8% de uso de CPU en segundo plano (medido con `tasklist`)                                                                   |
| 3   | Instalé Xubuntu 24.04 en VM, configuré LibreOffice y solo-Office como alternativa                                   | Equipo A y B (simulados)         | Migración funcional: documentos .docx/.xlsx abren correctamente. Captura en `evidencias/libreoffice_sumifer.png`                          |
| 4   | Investigué compatibilidad de Versat Sarasola con Wine (probé en VM)                                                 | Equipo B (Dirección Económica)   | Versat Sarasola **no** funciona completamente en Wine (falla módulo de impresión fiscal). Documentado en `evidencias/wine_versat_log.txt` |
| 5   | Propuse mantener Windows en un solo equipo (RRHH) como "servidor de aplicaciones" para Versat, aislado por firewall | Todos                            | Acuerdo grupal: 2 equipos migran a Linux, 1 equipo mantiene Windows solo para Versat                                                      |
| 6   | Eliminé bloatware de Windows (simulado): `Get-AppPackage _xbox_ _candy_ _skype_                                     | Remove-AppPackage`               | Equipo A y C                                                                                                                              | Liberación de ~1.2GB en disco y ~200MB de RAM |
| 7   | Reemplacé AutoCAD LT por FreeCAD en la simulación                                                                   | Equipo C (RRHH)                  | FreeCAD ocupa 1.2GB menos de disco y es 100% libre. Captura de interfaz en `evidencias/freecad_alternativa.png`                           |

---

## 2. Conflictos entre ejes y cómo los resolvimos (máximo 200 palabras)

**Conflicto identificado:**
Queríamos migrar totalmente a Linux para lograr soberanía tecnológica, pero Versat Sarasola (software cubano obligatorio por la Unión de Ferrocarriles) no funciona en Linux ni con Wine.

**Ejes en conflicto:**
Soberanía vs. Disponibilidad/Continuidad del negocio (dentro del eje Seguridad)

**Solución aplicada:**
Propuse una **migración parcial**:

- Equipo A (Director General) y Equipo B (Dirección Económica) → Migran a Xubuntu (aligeran hardware, soberanía).
- Equipo C (RRHH, el más potente) → Sigue con Windows, pero solo para ejecutar Versat Sarasola. Se aisla con firewall y se elimina todo bloatware/telemetría.

Además, configuramos SFTP en el servidor Ubuntu para que el equipo C acceda a los archivos compartidos sin depender de SMB (que es propietario).

**Conflicto secundario (obsolescencia vs. rendimiento):**
El equipo B (Core 2 Duo, 2GB RAM) es muy viejo. Migrar a Xubuntu alarga su vida útil pero el rendimiento sigue siendo bajo.

**Solución:**
Acordamos con el Analista de Rendimiento recomendar el reemplazo de este equipo por uno reacondicionado (de algún otro puesto dado de baja), sin comprar nuevo. Mientras tanto, usamos Xubuntu + LXQt (más ligero que XFCE).

---

## 3. Si hiciera este proyecto solo/a, ¿qué cambiaría? (máximo 150 palabras)

Si trabajara solo/a en este proyecto, cambiaría:

1. **Enfoque más radical:** Migraría los 3 equipos a Linux de inmediato y buscaría una alternativa web a Versat Sarasola si existe (no investigamos eso en equipo por falta de tiempo). Solo/a dedicaría tiempo a contactar al proveedor de Versat.

2. **Documentación:** Crearía un script bash (`migrar_sumifer.sh`) que automatice la desactivación de telemetría, la instalación de LibreOffice y la configuración del firewall. En equipo coordinamos manualmente, pero solo/a necesitaría eficiencia.

3. **Riesgo calculado:** Aceptaría mantener Windows en un solo equipo (como hicimos) pero configuraría además una máquina virtual con Linux dentro de ese Windows para tareas sensibles (nóminas), evitando exponer datos en el SO inseguro.

**Aprendizaje del trabajo en equipo:** La decisión de migración parcial fue más equilibrada gracias a las preocupaciones de seguridad y rendimiento de mis compañeros. Solo/a probablemente habría forzado la migración total y causado problemas con Versat.

---

## 4. Aprendizajes inesperados sobre mi rol (máximo 150 palabras)

Lo que aprendí que no sabía antes sobre soberanía y obsolescencia:

1. **La telemetría NO es solo "spyware":** En Windows, servicios como `DiagTrack` también consumen CPU, RAM y ancho de banda. Desactivarlos mejora el rendimiento en equipos antiguos. Es un ganar-ganar.

2. **La fecha de fin de soporte es un límite duro, pero no insalvable:** Windows 10 muere en 2025, pero eso no obliga a tirar el hardware. Linux extiende la vida útil del equipo, no del sistema operativo. Hardware de 2010 puede correr Linux hasta ~2030.

3. **No todo el software "libre" es ligero:** Snap packages (como Firefox en Ubuntu) consumen más RAM que la versión .deb. Para equipos de 2GB RAM, hay que evitar snaps y usar paquetes tradicionales o AppImages.

4. **El mayor riesgo de obsolescencia no es el hardware viejo, sino el software privativo que ata a ese hardware:** Encontramos que Versat Sarasola nos obliga a mantener Windows. Eso es peor que tener un Core 2 Duo. La soberanía empieza por las aplicaciones, no solo por el SO.

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
**Justificación breve:** Investigé a fondo la compatibilidad de Versat con Wine, propuse la migración parcial (clave para el proyecto), documenté cada paso. Colaboré activamente con el analista de seguridad para aislar el equipo C.

### Coevaluación

| Compañero/a                   | Rol         | Aspecto positivo                                                     | Área de mejora                                                            | Nota (2 a 5) |
| :---------------------------- | :---------- | :------------------------------------------------------------------- | :------------------------------------------------------------------------ | :----------- |
| [Nombre Analista Rendimiento] | Rendimiento | Sus métricas de consumo energético justificaron la migración a Linux | No midió el impacto de desactivar telemetría (lo hicimos juntos al final) | 4            |
| [Nombre Analista Seguridad]   | Seguridad   | Excelente en configurar firewall para aislar equipo C                | Un poco lento en responder sobre el cifrado de USBs                       | 5            |
| [Nombre Coordinador]          | Coordinador | Buena matriz de consistencia, nos recordó los plazos                 | No incluyó mi script de migración en el repositorio compartido            | 4            |

**Comentario adicional para el profesor:** El conflicto de Versat Sarasola fue real y lo resolvimos creativamente. Incluyo el log de Wine como evidencia en `evidencias/wine_versat_log.txt`.

---

## 6. Declaración de integridad académica

Declaro que este anexo refleja mi trabajo individual y que las contribuciones reportadas son verídicas.

**Nombre y fecha:** [Firma digital o nombre claro] - [fecha]
