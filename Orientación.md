# Introducción a los Sistemas Operativos

Orientaciones para el trabajo final  
Curso 2025‑2026

## Introducción

El trabajo final es continuación del seminario final de Arquitectura de Computadoras, ampliado a la asignatura Introducción a los Sistemas Operativos. El equipo debe atender los problemas de equipamiento y sistemas operativos de la empresa **Sumifer** (u otra entidad asignada), una PYME que ofrece servicios de soporte técnico y administración de servidores.

Actualmente Sumifer enfrenta problemas de rendimiento, gestión de procesos, uso de memoria y seguridad en equipos con sistemas operativos diferentes. Se busca optimizar sin comprar hardware nuevo, alargar la vida útil al menos 5 años, reducir el consumo eléctrico y aumentar la soberanía tecnológica, todo ello respetando los principios de seguridad: integridad, confidencialidad, disponibilidad y mínimo privilegio.

Equipos a analizar (ejemplo, ajustar según entidad):

- Equipo A: Windows 10/11 (puesto de administración)
- Equipo B: Distribución Linux basada en Debian/Ubuntu (servidor de archivos local)
- Equipo C: Windows Server 2012 (servidor legacy, fuera de soporte oficial)

## Conformación de equipos y roles

Equipos de 3 o 4 estudiantes con los siguientes roles:

| Rol                                   | Responsabilidad principal                                                                                                                                       | Aportes evaluables individualmente                                                                                     |
| ------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| Analista de rendimiento y energía     | Diagnosticar uso de CPU, RAM, E/S; proponer ajustes de planificación, memoria y consumo energético.                                                             | Tabla de métricas antes/después, comandos de optimización energética, gráficos de mejora.                              |
| Analista de soberanía y obsolescencia | Identificar dependencias de software propietario, telemetría, actualizaciones forzadas; proponer migración a alternativas libres y ligeras.                     | Lista de servicios desactivados, propuesta de migración a Linux, justificación de extensión de vida útil.              |
| Analista de seguridad                 | Revisar permisos, procesos sospechosos, puertos abiertos, políticas de contraseñas, parches, y asegurar que las optimizaciones no introduzcan vulnerabilidades. | Informe de vulnerabilidades detectadas, cambios en permisos, configuración de firewall local, evidencias de hardening. |
| Coordinador/a técnico \*              | Integra los tres análisis, asegura consistencia entre las propuestas, redacta el informe ejecutivo final y presenta los resultados.                             | Acta de reuniones, matriz de consistencia entre seguridad/rendimiento/soberanía, presentación oral.                    |

\*En equipos de 3, el coordinador asume además el rol de uno de los analistas.

## Entregables grupales

1. **Diagnóstico integrado** (3‑5 páginas): Consolida el diagnóstico de los tres equipos usando herramientas como `top`, `powertop`, `netstat`, `ss`, `systemctl`, etc.
2. **Plan de mejora** (máx. 4 páginas): Tabla que vincula acciones concretas con los cinco ejes (rendimiento, energía, soberanía, obsolescencia, seguridad).
3. **Simulación e implementación** (carpeta compartida + video ≤ 5 min): Evidencias de comandos, capturas, scripts y una breve demostración de los cambios aplicados.
4. **Informe ejecutivo** (2 páginas, lenguaje no técnico): Responde a qué problemas había, qué se hizo sin comprar hardware, cuánto se extiende la vida útil, ahorro energético, mejora en soberanía y riesgos de seguridad mitigados.

## Entregables individuales (Anexos personales)

Cada estudiante sube por separado un anexo (1 página) con:

- Lista concreta de sus contribuciones (comandos ejecutados, configuraciones, análisis)
- Reflexión sobre conflictos entre ejes y cómo se resolvieron
- Autoevaluación y coevaluación
- Planilla de autoevaluación y coevaluación según plantilla proporcionada en el documento guía.

## Criterios de evaluación

| Criterio                                     | Peso | Evaluación |
| -------------------------------------------- | ---- | ---------- |
| Diagnóstico completo (5 ejes)                | 15%  | Grupal     |
| Plan de mejora integrado                     | 20%  | Grupal     |
| Simulación con evidencia                     | 20%  | Grupal     |
| Informe ejecutivo                            | 15%  | Grupal     |
| Aporte específico del rol (anexo individual) | 30%  | Individual |

## Documentación de apoyo

En el documento guía se incluyen:

- Plantilla del anexo individual
- Guía rápida de herramientas de seguridad (Windows y Linux)
- Guía de comandos transversales para todos los roles

Se recomienda consultar el curso en Moodle y el grupo de Telegram para aclaraciones.

_Colectivo de Profesores de Introducción a los Sistemas Operativos, 2026._
