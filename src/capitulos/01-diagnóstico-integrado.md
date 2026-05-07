# 1. Diagnóstico Integrado

**Responsables:** Equipo completo (cada analista aporta su sección)

## Resumen Ejecutivo del Diagnóstico

[Redactar aquí un párrafo que resuma los hallazgos principales, unificando las tres perspectivas]

## Análisis por Equipo

### Equipo 1: Dirección General (Intel Pentium G4400, 4GB RAM, 1TB HDD, Windows 10 Ultimate)

#### a) Diagnóstico de Rendimiento y Energía (Analista de Rendimiento)

- **Problemas detectados:**
  - HDD de 1TB como disco principal, probablemente lento en lectura/escritura.
  - 4GB RAM insuficientes para Windows 10 + Office 2019 + Versat Sarasola.
  - [Agregar más problemas usando herramientas del PDF, ej. `powercfg /energy`]
- **Herramientas usadas:** `tasklist`, `resmon`, `powercfg /energy`.
- **Evidencia:** [Insertar capturas de alto uso de RAM/CPU]

#### b) Diagnóstico de Soberanía y Obsolescencia (Analista de Soberanía)

- **Problemas detectados:**
  - **Obsolescencia:** Windows 10 Ultimate (no oficial), fin de soporte de Win10 en 2025.
  - **Soberanía:** Dependencia de Microsoft Office (licencia no oficial), TeamViewer (software privativo).
  - **Telemetría:** Servicios de diagnóstico de Windows activos (potencial).
  - **Hardware:** Pentium G4400 (2015) - útil, pero frenado por HDD y poca RAM.
- **Acción identificada:** Potencial migración a Linux ligero (Xubuntu/Lubuntu).

#### c) Diagnóstico de Seguridad (Analista de Seguridad)

- **Problemas detectados:**
  - **Crítico:** Licencia de Windows no oficial → sin parches de seguridad.
  - **Puertos:** Verificar con `netstat -an` si TeamViewer deja puertos abiertos.
  - **Usuarios:** Sistema de contraseñas centralizado en papel (vulnerabilidad física).
  - **Antivirus:** Alertas por activación no oficial ignoradas.
- **Herramientas usadas:** `netstat -an`, `icacls`, `Event Viewer`.

---

### Equipo 2: Dirección Económica (Intel Core 2 Duo, 2GB RAM, 320GB HDD, Windows 10 32-bit)

#### a) Diagnóstico de Rendimiento y Energía

- **Problemas detectados:**
  - **Crítico:** 2GB RAM con Windows 10 32-bit es extremadamente lento.
  - Procesador Core 2 Duo (2006-2008) muy obsoleto, consume más energía por tarea completada.
  - Uso de Chrome (pesado) vs. Edge/Firefox.
- **Métrica estimada:** Tiempo de apertura de Excel > 2 minutos.
- **Evidencia:** [Insertar captura de `tasklist` mostrando alto uso de páginafile]

#### b) Diagnóstico de Soberanía y Obsolescencia

- **Problemas detectados:**
  - **Obsolescencia dura:** Hardware de hace ~18 años. Alargar vida útil 5 años es un reto extremo.
  - **Soberanía:** Windows 10 32-bit ya no es soportado por muchos fabricantes.
  - **Dependencia:** Archivos .DBF (antiguos, pero funcionan en Linux con LibreOffice).
- **Propuesta preliminar:** Evaluar si este equipo puede ser reemplazado funcionalmente por uno más eficiente (sin comprar nuevo, quizás reasignar hardware) o migrar a distro Linux ultra ligera (Puppy Linux, antiX).

#### c) Diagnóstico de Seguridad

- **Problemas detectados:**
  - **Riesgo alto:** Windows 10 32-bit sin soporte de seguridad.
  - **Periféricos:** Escáner Canon DR-C240: verificar si tiene drivers para Linux.
  - **USB:** Uso de memorias USB para transferir nóminas (riesgo de malware).
- **Herramientas usadas:** `sc query state= all` para servicios innecesarios.

---

### Equipo 3: Recursos Humanos (Intel Core i5, 8GB RAM, 1TB HDD, Windows 10 Ultimate)

#### a) Diagnóstico de Rendimiento y Energía

- **Problemas detectados:**
  - Es el equipo con mejores prestaciones, pero se usa AutoCAD LT (pesado) innecesariamente para RRHH.
  - HDD ralentiza el arranque del sistema y la impresión de etiquetas.
- **Mejora potencial:** Agregar un SSD (no implica comprar nuevo, quizás reutilizar de otro equipo dado de baja).

#### b) Diagnóstico de Soberanía y Obsolescencia

- **Problemas detectados:**
  - **Soberanía:** AutoCAD LT (software privativo costoso) para un rol que no lo requiere.
  - Windows 10 Ultimate con misma problemática de licencia.
  - Firefox con extensión "curiosa" para generar PDF (alternativa no controlada).
- **Acción:** Reemplazar AutoCAD LT con FreeCAD o LibreCAD (si realmente se necesita CAD).

#### c) Diagnóstico de Seguridad

- **Problemas detectados:**
  - **Fuga de datos:** Nóminas en USB sin cifrar hacia el banco.
  - Impresora Zebra conectada directamente → riesgo si no está en VLAN separada.
  - Permisos de acceso a la carpeta compartida en el servidor Ubuntu (FTP inseguro).
- **Herramientas usadas:** `icacls`, `ssh` (para revisar FTP anónimo en el servidor).

## Consolidado de Problemas (Vista general de los 5 ejes)

| Eje               | Problema principal                                         | Equipos afectados                    |
| :---------------- | :--------------------------------------------------------- | :----------------------------------- |
| **Rendimiento**   | RAM insuficiente y HDD lento                               | Dirección General y Económica        |
| **Energía**       | Hardware antiguo (Core 2 Duo) consume más para hacer menos | Dirección Económica                  |
| **Soberanía**     | Dependencia de Windows + Office sin licencias válidas      | Todos                                |
| **Obsolescencia** | Windows 10 sin soporte post-2025 y hardware pre-2010       | Todos (especialmente Dir. Económica) |
| **Seguridad**     | Ausencia de parches, contraseñas en papel, USB sin control | Todos                                |

_(Fin del diagnóstico grupal. Extensión objetivo: 3-5 páginas)_
