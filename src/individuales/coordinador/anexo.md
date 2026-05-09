# Anexo Individual – Sistema Operativo y Trabajo por Roles

- **Nombre del estudiante:** Rodny Roberto Estrada León  
  **Rol desempeñado:** Coordinador Técnico (asume también funciones de enlace entre analistas)
- **Nombre del equipo:** Sumifer-2026
- **Fecha de entrega:** 09/05/2026

---

## 1. Descripción concreta de mis aportes

| #   | Acción concreta                                                                                                                                                             | Equipo                        | Resultado medible                                                                                                                                                                                                              |
| --- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| 1   | Organicé y facilité 3 reuniones de sincronización (actas en `actas/`).                                                                                                      | Equipos A, B, C (transversal) | Se resolvió el conflicto central (Versat Sarasola vs Linux) en la 2ª reunión, reduciendo retrasos.                                                                                                                             |
| 2   | Construí la **matriz de consistencia** entre acciones de rendimiento, soberanía y seguridad.                                                                                | Global                        | Se identificaron 2 incompatibilidades (telemetría vs parches, FTP vs firewall) y se documentaron soluciones acordadas.                                                                                                         |
| 3   | Redacté el **Informe Ejecutivo** para la dirección (lenguaje no técnico).                                                                                                   | Global                        | Documento de 2 páginas aprobado por el equipo; resume ahorro energético, extensión de vida útil y mejoras de soberanía.                                                                                                        |
| 4   | Coordiné la simulación en VM: unifiqué los scripts de los tres analistas en un solo flujo (`scripts/integrar.sh`).                                                          | VMs de Xubuntu y Windows      | Reducción del tiempo de simulación de 3 horas a 1.5 horas; se generó un video único de 4:30 min.                                                                                                                               |
| 5   | Actué como árbitro en el conflicto **Seguridad ↔ Soberanía** (telemetría vs parches críticos).                                                                              | Equipo A, B, C                | Se adoptó solución híbrida: desactivar solo telemetría no crítica, mantener notificación de parches manuales.                                                                                                                  |
| 6   | Implementé un flujo de trabajo basado en **Git + GitHub** (repo <https://github.com/rodnydevcujae/seminario-final-so>) y un grupo de **WhatsApp** para comunicación rápida. | Global                        | Todo el código, scripts y versiones de los informes quedaron centralizados y con historial. Los múltiples estilos de Word dejaron de ser un problema porque usamos **Pandoc** para generar los `.docx` finales desde Markdown. |

---

## 2. Conflictos entre ejes y cómo los resolvimos

**Conflicto identificado:**  
El analista de soberanía propuso desactivar completamente Windows Update y telemetría para eliminar dependencia de Microsoft y evitar que actualizaciones automáticas rompieran los activadores no oficiales. El analista de seguridad objetó que sin actualizaciones de seguridad quedaríamos expuestos a exploits públicos (ej. PrintNightmare, BlueKeep).

**Ejes en conflicto:**  
Soberanía + Obsolescencia (querer cortar totalmente con Microsoft) vs. Seguridad (necesidad de parches críticos).

**Solución aplicada:**  
Tras debate, acordamos mantener Windows Update en modo **“Notificar antes de descargar”** mediante directiva de grupo local. Solo se deshabilitaron los servicios puramente de telemetría (DiagTrack, dmwappushservice) que no afectan a la entrega de parches. Se estableció un procedimiento mensual manual: el analista de seguridad descarga los parches acumulativos desde otro equipo con conexión y los instala con `wusa.exe`. Esto preserva la soberanía (no hay actualizaciones automáticas forzadas) y la seguridad (los parches críticos igual se aplican).

---

## 3. Si hiciera este proyecto solo/a, ¿qué cambiaría?

Si trabajara solo, hubiera unificado desde el principio el diagnóstico en una sola matriz multicriterio (en lugar de tres documentos separados) y habría automatizado la generación de informes con scripts en Python. También priorizaría la migración total a Linux sin contemplar la opción de mantener Windows en ningún equipo, porque coordinar tres visiones distintas me llevó tiempo y tuve que ceder en algunos puntos (por ejemplo, mantener un equipo con Windows para Versat Sarasola). La ventaja del equipo fue la profundidad: cada analista exploró herramientas que yo solo habría ignorado. La desventaja fue la necesidad de conciliar plazos y estilos de documentación. En solitario, cambiaría la comunicación: usaría un tablero Kanban público y reuniones asíncronas (no síncronas) para no depender de horarios compartidos. Aun así, el sistema que montamos con **GitHub + Pandoc** me demostró que trabajar con múltiples formatos y estilos de Word no es un problema si se estandariza la fuente en Markdown y se compila centralizadamente.

---

## 4. Aprendizajes inesperados sobre mi rol

Aprendí que el coordinador técnico no es un mero recolector de textos, sino un **integrador de restricciones**. No esperaba que los conflictos más agudos no fueran técnicos, sino de prioridades: el analista de rendimiento quería desactivar servicios para aligerar el sistema, pero eso dejaba al equipo sin logs necesarios para el análisis de seguridad. Tuve que aprender a leer informes de `lynis` y `powercfg` para poder discutir de igual a igual.

También descubrí técnicas de facilitación: usar una matriz RACI (Responsable, Accountable, Consultado, Informado) para que cada uno supiera cuándo debía opinar y cuándo solo ser informado. A nivel técnico, me sorprendió lo poderoso que es **Wine** para resolver el problema del Versat Sarasola: no es perfecto, pero permite migrar a Linux sin perder la aplicación crítica. Ahora sé que la soberanía no es binaria (todo libre o nada libre) sino gradual. Además, el uso de **Pandoc** y un repositorio compartido en GitHub demostró ser una solución robusta para evitar los dolores de cabeza típicos de “guerra de estilos” en los informes grupales.

---

## 5. Autoevaluación y coevaluación

### Autoevaluación (marca con X)

| Criterio                             | Excelente (5) | Bien (4) | Regular (3) | Mal (2) |
| ------------------------------------ | :-----------: | :------: | :---------: | :-----: |
| Cumplí con las tareas de mi rol      |       X       |          |             |         |
| Colaboré con otros roles             |       X       |          |             |         |
| Documenté correctamente mis acciones |               |    X     |             |         |
| Aporté soluciones creativas          |       X       |          |             |         |

**Nota final que me pongo (2 a 5):** 5  
**Justificación breve:** Cumplí con todas las responsabilidades de coordinación: actas, matriz de consistencia, informe ejecutivo, integración de simulación, resolución de conflictos y la implementación del flujo de trabajo con GitHub y Pandoc. La documentación podría haber sido más estructurada (un solo repositorio de actas en lugar de varias versiones), pero el resultado final es sólido.

### Coevaluación (a cada compañero)

| Compañero/a                      | Rol                                   | Aspecto positivo (1)                                                | Área de mejora (1)                                                                  | Nota (2 a 5) |
| -------------------------------- | ------------------------------------- | ------------------------------------------------------------------- | ----------------------------------------------------------------------------------- | ------------ |
| Frank Abel                       | Analista de Rendimiento y Energía     | Excelente manejo de `powertop` y métricas cuantitativas             | Presentó sus informes fuera de plazo en dos ocasiones                               | 4            |
| Martín Alejandro García Babastro | Analista de Soberanía y Obsolescencia | Propuso la migración a Xubuntu y la solución con Wine, muy creativa | Documentación un poco desordenada (faltaban capturas)                               | 5            |
| Alex Dayan Rodríguez Hernández   | Analista de Seguridad                 | Hardening muy meticuloso, usó `lynis` y `fail2ban` con éxito        | Podría haber compartido los comandos de firewall antes para alinear con rendimiento | 5            |

**Comentario adicional para el profesor:** El mayor acierto fue resolver el conflicto Versat Sarasola vs. Linux mediante Wine + VM de respaldo. El mayor desacierto fue no tener un canal único de comunicación desde el principio (usamos Telegram, WhatsApp y correo), lo que generó duplicación. Pero el equipo supo reaccionar y el producto final es coherente. La adopción de **GitHub** (<https://github.com/rodnydevcujae/seminario-final-so>) y **Pandoc** eliminó los problemas típicos de formatos y estilos de Word; cada analista escribió en Markdown y yo compilé el informe final unificado sin pérdida de tiempo.

---

## 6. Declaración de integridad académica

Declaro que este anexo refleja mi trabajo individual y que las contribuciones reportadas son verídicas.

**Nombre y fecha:** Rodny Roberto Estrada León - 09/05/2026
