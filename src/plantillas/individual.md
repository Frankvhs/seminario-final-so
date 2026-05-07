# Anexo Individual – Sistema Operativo y Trabajo por Roles

**Nombre del estudiante:** [Tu nombre completo]
**Rol desempeñado:** (Ej. Analista de Seguridad / Analista de Rendimiento / Analista de Soberanía / Coordinador)
**Nombre del equipo:** Sumifer-2026
**Fecha de entrega:** [Fecha actual]

---

## 1. Descripción concreta de mis aportes (máximo 300 palabras)

| #   | Acción concreta (comando, configuración, script, etc.)                | Equipo (A, B o C según el documento Sumifer)   | Resultado medible                                                                               |
| :-- | :-------------------------------------------------------------------- | :--------------------------------------------- | :---------------------------------------------------------------------------------------------- |
| 1   | _Ejemplo: `sudo ufw default deny incoming` y `sudo ufw allow 22/tcp`_ | Equipo A (Director General, simulado en VM)    | Reducción de puertos abiertos de 5 a solo 22. Captura en `evidencias/puertos_antes_despues.png` |
| 2   | _Ejemplo: Ejecuté `powertop --auto-tune` en la VM de Linux_           | Equipo B (Dirección Económica, VM con Xubuntu) | Consumo idle bajó de ~45W simulado a ~28W (estimado por powertop)                               |
| 3   |                                                                       |                                                |                                                                                                 |
| 4   |                                                                       |                                                |                                                                                                 |
| 5   |                                                                       |                                                |                                                                                                 |

---

## 2. Conflictos entre ejes y cómo los resolvimos (máximo 200 palabras)

**Conflicto identificado:**
_Ejemplo: El Versat Sarasola (software cubano obligatorio) no corre en Linux, pero queríamos migrar por soberanía._

**Ejes en conflicto:**
Soberanía vs. Rendimiento (y disponibilidad del negocio).

**Solución aplicada:**
Decidimos mantener Windows en el equipo de RRHH (el más potente) solo para ejecutar Versat Sarasola, pero aislado del resto con firewall estricto. Los otros dos equipos migraron a Linux. El analista de seguridad configuró SFTP para que el equipo de RRHH siga accediendo a los archivos compartidos sin depender de SMB inseguro.

---

## 3. Si hiciera este proyecto solo/a, ¿qué cambiaría? (máximo 150 palabras)

_Reflexión sobre las ventajas (diversidad de miradas) y desventajas (coordinación, dependencias) del trabajo en equipo. Por ejemplo: "Trabajando solo habría tardado más en diagnosticar los tres equipos, pero probablemente habría sido más consistente en la aplicación de los parches de seguridad. Cambiaría la forma de documentar: usaría un solo script maestro en lugar de tres documentos separados."_

---

## 4. Aprendizajes inesperados sobre mi rol (máximo 150 palabras)

_Ejemplo: "No sabía que el simple hecho de cambiar el governor de CPU a 'powersave' podía reducir tanto la temperatura del procesador sin perder rendimiento perceptible. También aprendí que desactivar servicios innecesarios (como bluetooth en un equipo de escritorio) mejora tanto la seguridad como el consumo energético."_

---

## 5. Autoevaluación y coevaluación

### Autoevaluación (marca con X)

| Criterio                             | Excelente (5) | Bien (4) | Regular (3) | Mal (2) |
| :----------------------------------- | :-----------: | :------: | :---------: | :-----: |
| Cumplí con las tareas de mi rol      |       X       |          |             |         |
| Colaboré con otros roles             |       X       |          |             |         |
| Documenté correctamente mis acciones |               |    X     |             |         |
| Aporté soluciones creativas          |       X       |          |             |         |

**Nota final que me pongo (2 a 5):** 4.8 (pero redondeo a 5)
**Justificación breve:** Cumplí todas las tareas técnicas, colaboré activamente en el conflicto de Versat Sarasola. Solo no documenté algunas pruebas con Wine, de ahí la pequeña resta.

### Coevaluación (a cada compañero)

| Compañero/a | Rol                     | Aspecto positivo (1)                             | Área de mejora (1)                   | Nota (2 a 5) |
| :---------- | :---------------------- | :----------------------------------------------- | :----------------------------------- | :----------- |
| [Nombre1]   | Analista de Rendimiento | Excelente midiendo tiempos con `time` y `vmstat` | Pudo compartir los comandos antes    | 5            |
| [Nombre2]   | Analista de Soberanía   | Investigó bien alternativas a AutoCAD            | Lento en responder en el chat grupal | 4            |
| [Nombre3]   | Coordinador             | Matriz de consistencia muy clara                 | El video de 5 min fue muy apresurado | 4            |

**Comentario adicional para el profesor:** El conflicto del Versat Sarasola fue real, lo solucionamos con una VM con Windows solo para esa aplicación.

---

## 6. Declaración de integridad académica

Declaro que este anexo refleja mi trabajo individual y que las contribuciones reportadas son verídicas.

**Nombre y fecha:** [Firma digital o nombre claro] - [fecha]
