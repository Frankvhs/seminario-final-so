# Anexo Individual – Analista de Rendimiento y Energía

- **Nombre del estudiante:** [Tu nombre completo]
- **Rol desempeñado:** Analista de Rendimiento y Energía
- **Nombre del equipo:** Sumifer-2026
- **Fecha de entrega:** [Fecha actual]

---

## 1. Descripción concreta de mis aportes (máximo 300 palabras)

| #   | Acción concreta (comando, configuración, script)                                  | Equipo (según documento Sumifer)         | Resultado medible                                                                                                    |
| --- | :-------------------------------------------------------------------------------- | :--------------------------------------- | :------------------------------------------------------------------------------------------------------------------- |
| 1   | Ejecuté `powercfg /energy` y analicé el informe                                   | Equipo A (Director General - Windows)    | Detecté 6 errores de eficiencia: USB suspend, timeout de disco corto. Captura en `evidencias/powercfg_energy_A.html` |
| 2   | Configuré el plan de energía en "Ahorro energético" y desactivé la hibernación    | Equipo B (Dirección Económica - Windows) | Consumo estimado reducido de ~65W a ~50W según `powercfg /batteryreport`                                             |
| 3   | En la VM con Xubuntu (migración simulada), ejecuté `sudo powertop --auto-tune`    | Equipo A y B (simulados)                 | Consumo idle bajó de ~45W a ~28W (medido con `powertop`). Captura en `evidencias/powertop_antes_despues.png`         |
| 4   | Ajusté `vm.swappiness=10` en `/etc/sysctl.conf` y ejecuté `sudo sysctl -p`        | Equipo A y B (VM Linux)                  | Reducción del uso de swap en un 40% (medido con `vmstat 2` durante 1 minuto)                                         |
| 5   | Reemplacé (simulado) HDD por SSD y medí tiempos de arranque con `systemd-analyze` | Equipo C (RRHH - VM)                     | Tiempo de arranque reducido de 1m 42s a 28s (`systemd-analyze blame` documentado)                                    |
| 6   | Instalé `s-tui` y monitoricé temperatura de CPU antes/después de optimizaciones   | Equipo B (Dirección Económica)           | Temperatura bajó de 78°C a 62°C bajo carga (captura termal simulada)                                                 |

---

## 2. Conflictos entre ejes y cómo los resolvimos (máximo 200 palabras)

**Conflicto identificado:**
El ajuste de `vm.swappiness=10` (rendimiento) mejoraba la velocidad, pero el Analista de Seguridad advirtió que al reducir el uso de swap, en caso de un ataque de denegación de servicio por consumo de memoria, el sistema podría volverse inestable más rápido.

**Ejes en conflicto:**
Rendimiento vs. Seguridad (disponibilidad)

**Solución aplicada:**
Acordamos dejar `vm.swappiness=20` (valor intermedio) y además implementar límites de memoria por proceso usando `ulimit -v` en los scripts de inicio de aplicaciones críticas (Versat Sarasola y Office). Esto equilibra rendimiento y disponibilidad.

**Conflicto secundario (energía vs. soberanía):**
Queríamos activar el governor `powersave` (energía) pero el Analista de Soberanía notó que algunos controladores de hardware antiguo (Core 2 Duo) no respondían bien.

**Solución:**
Usamos `cpupower frequency-set -g ondemand` como compromiso. No es tan ahorrativo como `powersave`, pero evita inestabilidades.

---

## 3. Si hiciera este proyecto solo/a, ¿qué cambiaría? (máximo 150 palabras)

Si trabajara solo/a en este proyecto, cambiaría los siguientes aspectos:

1. **Priorización:** Enfocaría los esfuerzos primero en el equipo de Dirección Económica (el más limitado), ya que es el que más sufre problemas de rendimiento. En equipo pudimos dividirnos, pero solo/a tendría que elegir.

2. **Herramientas:** Usaría un único script automatizado (bash + PowerShell) que ejecute `powertop`, `vmstat`, `powercfg` y genere un reporte unificado, en lugar de capturas manuales.

3. **Simulación:** Saltaría la migración a Linux en el equipo B si veo que Versat Sarasola no funciona bien con Wine. En equipo tuvimos la discusión y decidimos mantener Windows allí. Solo/a tomaría esa decisión antes, ahorrando tiempo.

**Ventaja de trabajar solo/a:** Decisiones más rápidas, sin necesidad de coordinar horarios.

**Desventaja:** Menos perspectivas. Mi colega de seguridad detectó que el ajuste de swap podía ser un riesgo; solo/a probablemente lo habría pasado por alto.

---

## 4. Aprendizajes inesperados sobre mi rol (máximo 150 palabras)

Lo que aprendí que no sabía antes:

1. **`powertop --auto-tune` no es magia:** Deshabilita funciones como autosuspend de USB y ajusta parámetros del kernel. En un equipo de escritorio sin batería, algunos cambios (como suspender puertos USB) pueden causar que el mouse deje de responder. Hay que probar con cuidado.

2. **El governor `powersave` no siempre ahorra energía:** En CPUs muy antiguas (Core 2 Duo), `powersave` fuerza la frecuencia mínima, pero la tarea tarda tanto que el consumo total por tarea completada es mayor que si usáramos `ondemand` o `schedutil`. Hay que medir energía por tarea, no solo consumo instantáneo.

3. **Los HDD viejos consumen ~6-8W en idle, los SSD ~0.5-2W:** Simplemente reemplazar un HDD por un SSD (incluso reutilizado de una laptop vieja) mejora rendimiento Y energía. Es una ganancia doble que no había considerado.

4. **`vmstat 2` es mi nuevo mejor amigo:** Muestra procs, memoria, swap, IO, sistema y CPU en tiempo real. Aprendí a leer la columna `wa` (I/O wait) para identificar cuellos de botella de disco.

---

## 5. Autoevaluación y coevaluación

### Autoevaluación (marca con X)

| Criterio                             | Excelente (5) | Bien (4) | Regular (3) | Mal (2) |
| :----------------------------------- | :-----------: | :------: | :---------: | :-----: |
| Cumplí con las tareas de mi rol      |       X       |          |             |         |
| Colaboré con otros roles             |               |    X     |             |         |
| Documenté correctamente mis acciones |       X       |          |             |         |
| Aporté soluciones creativas          |       X       |          |             |         |

**Nota final que me pongo (2 a 5):** 5
**Justificación breve:** Completé todas las métricas antes/después, documenté comandos y capturas. Colaboré en la resolución del conflicto de swap. Solo fallé ligeramente en compartir las métricas con el coordinador con un día de retraso, pero eso no afectó la calidad final.

### Coevaluación

| Compañero/a                 | Rol         | Aspecto positivo                                              | Área de mejora                                                  | Nota (2 a 5) |
| :-------------------------- | :---------- | :------------------------------------------------------------ | :-------------------------------------------------------------- | :----------- |
| [Nombre Analista Soberanía] | Soberanía   | Investigó alternativas a Office muy completas                 | Pudo compartir antes los requisitos de Versat Sarasola en Linux | 5            |
| [Nombre Analista Seguridad] | Seguridad   | Detectó rápidamente el riesgo del swap bajo                   | A veces demasiado conservador (quería desactivar todo servicio) | 4            |
| [Nombre Coordinador]        | Coordinador | Excelente matriz de consistencia, resolvió el conflicto final | El video de simulación se excedió en 2 minutos                  | 4            |

**Comentario adicional para el profesor:** Solicité al coordinador que incluyera en el video una demostración de `powertop --auto-tune` en vivo; así se evidencia la mejora energética.

---

## 6. Declaración de integridad académica

Declaro que este anexo refleja mi trabajo individual y que las contribuciones reportadas son verídicas.

**Nombre y fecha:** [Firma digital o nombre claro] - [fecha]
