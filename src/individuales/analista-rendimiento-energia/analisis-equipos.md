# Análisis de Equipos – Analista de Rendimiento y Energía

- **Nombre del estudiante:** Frank Abel
- **Rol desempeñado:** Analista de Rendimiento y Energía
- **Nombre del equipo:** Sumifer-2026
- **Fecha de entrega:** 09/05/2026

---

## 1. Aportes concretos en cada equipo

| # | Acción / Comando | Equipo | Resultado Medible |
|---|------------------|--------|-------------------|
| 1 | Ejecuté `powercfg /energy` y analicé el informe | Equipo A (Director General – Windows 10 Ultimate) | Detecté 5 advertencias y configuré suspensión selectiva de USB |
| 2 | Modifiqué el plan de energía y desactivé hibernación | Equipo A | Consumo estimado bajó un 10% según `powercfg` |
| 3 | Audité servicios con `Get-Service` y desactivé servicios innecesarios | Equipo A | Arranque del sistema 15 segundos más rápido |
| 4 | Ejecuté `powercfg /energy` y revisé gestión energética | Equipo B (Directora Económica – Windows 10 Ultimate 32 bits) | Identifiqué drivers antiguos y deshabilité hardware innecesario, reduciendo advertencias energéticas |
| 5 | Ajusté efectos visuales y configuré paginación de memoria | Equipo B | Mejor desempeño, apertura de Office 2016 un 20% más rápida |
| 6 | Revisé procesos con `taskmgr` y desinstalé software no crítico | Equipo B | CPU en reposo bajó de 40% a 20% |
| 7 | Analicé wake events y suspendí reactivación desde LAN | Equipo A | Disminución de encendidos accidentales y ahorro energético nocturno |
| 8 | Ejecuté `winsat disk` y revisé logs de eventos | Equipo C (Técnica de Recursos Humanos – Windows 10 Ultimate) | HDD presentaba cuellos de botella, sugerí defragmentación y respaldo de datos |
| 9 | Optimizé inicio deshabilitando autoarranque no esencial (Office 2019, Versat Sarasola, AutoCAD LT) | Equipo C | Inicio de sesión 18 segundos más rápido y menor uso de RAM al inicio |

---

## 2. Reflexión sobre conflictos entre ejes y resolución

- **Conflicto principal**: En Equipo B, limitar el uso de recursos para mejorar energía y rendimiento (p. ej. reducir paginación) generaba alerta en Seguridad, ya que menor swap expone a fallos si la RAM se llena.
  - **Solución**: Se negoció dejar paginación ajustada y limitar programas en segundo plano, avisando a Seguridad de la nueva configuración y monitoreando posibles fallos.
- **Conflicto secundario**: En Equipo C, desinstalar software poco usado (como versiones viejas) mejoraba rendimiento, pero generaba preocupación en Soberanía y Obsolescencia sobre la disponibilidad en caso de necesitarse a futuro y soporte.
  - **Solución**: Se optó por mantener solo el software estrictamente necesario, verificando licencia y soporte, y documentando opciones de reinstalación futura.

---

## 3. Si hiciera este proyecto solo/a, ¿qué cambiaría?

Si hubiera desarrollado este proyecto de manera individual, habría priorizado la automatización de tareas repetitivas en PowerShell para auditar consumo y servicios, y crearía guías visuales para que otros usuarios pudieran repetir mejoras energéticas fácilmente.

Además, sería posible implementar un monitoreo más sistemático utilizando scripts programados para registrar el consumo energético y rendimiento en intervalos regulares. Guardaría automáticamente informes de `powercfg`, estadísticas de procesos y uso de memoria en archivos de registro, y propondría un dashboard sencillo en Excel/LibreOffice para visualizar tendencias.

También, al trabajar solo, dedicaría más tiempo a investigar el impacto de cada servicio deshabilitado en el sistema, verificando en detalle la compatibilidad de cada acción con el software clave utilizado por cada puesto, minimizando así el riesgo de incompatibilidades.

Aprovecharía la flexibilidad para experimentar con otras herramientas gratuitas de optimización y análisis, como Latencymon o HWMonitor para identificar posibles cuellos de botella en disco o temperatura, y documentaría recomendaciones específicas para upgrades futuros orientados a bajo costo, como cambiar el HDD por un SSD en los equipos más lentos.

Finalmente, al prescindir de la coordinación grupal, intentaría dejar todo parametrizado y bien documentado para facilitar una futura transferencia de conocimientos o replicabilidad por otros técnicos.

---

## 4. Aprendizajes inesperados sobre mi rol

Al analizar equipos con configuraciones tan diferentes, comprendí la importancia de adaptar cada acción (comando, ajuste) a las particularidades del puesto y las aplicaciones clave de cada usuario. Herramientas como `powercfg` aportan visibilidad pero requieren interpretación según el caso y rol.

Otro aprendizaje fue la necesidad de negociar y consensuar cambios con otros roles, como seguridad o soberanía, para evitar que una optimización energética derive en incidentes operativos o vulnerabilidades. Esto me obligó a desarrollar habilidades de comunicación técnica y a fundamentar cada decisión con evidencia medible.

Descubrí que el trabajo del Analista de Rendimiento y Energía va más allá de la aplicación de comandos: implica anticipar conflictos, preparar argumentaciones para defender ciertas acciones y, sobre todo, medir de forma cuantificable los resultados (usando logs, informes y pruebas de usuario).

Finalmente, aprendí a valorar la importancia de mantener registros detallados de cada intervención, lo que facilita tanto la reversión de cambios ante errores como la transferencia de conocimientos dentro del equipo o a responsables futuros. Esta experiencia me mostró la relevancia de un enfoque proactivo en la mejora continua y la documentación sistemática del ciclo de intervención técnica.

---

## 5. Autoevaluación y coevaluación

### Autoevaluación

| Criterio                             | Excelente (5) | Bien (4) | Regular (3) | Mal (2) |
|--------------------------------------|:-------------:|:--------:|:-----------:|:-------:|
| Cumplí con las tareas de mi rol      |      X        |          |             |         |
| Colaboré con otros roles             |               |    X     |             |         |
| Documenté correctamente mis acciones |      X        |          |             |         |
| Aporté soluciones creativas          |      X        |          |             |         |

**Nota final que me pongo (2 a 5):** 5  
**Justificación breve:** Cumplí con cada métrica pedida, compartí reportes y resultados, y negocié soluciones balanceando rendimiento, energía y seguridad.

### Coevaluación

| Compañero/a           | Rol          | Aspecto positivo                                  | Área de mejora                                  | Nota (2 a 5) |
|-----------------------|--------------|---------------------------------------------------|-------------------------------------------------|--------------|
| Alex                  | Seguridad    | Detectó riesgos en los cambios de paginación      | Compartir lista de puertos con más anticipación | 4            |
| Martín                | Soberanía    | Propuso alternativas a software privativo         | Mejorar comunicación entre sistemas             | 5            |
| Rodny                 | Coordinador  | Facilitó el acuerdo de compromisos entre ejes     | Podría moderar mejor discusiones técnicas       | 4            |

---
