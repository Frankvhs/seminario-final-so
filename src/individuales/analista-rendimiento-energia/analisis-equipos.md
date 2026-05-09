# Análisis de Equipos – Analista de Rendimiento y Energía

- **Nombre del estudiante:** Frank Abel
- **Rol desempeñado:** Analista de Rendimiento y Energía
- **Nombre del equipo:** Sumifer-2026
- **Fecha de entrega:** 09/05/2026

---

## 1. Aportes concretos en cada equipo

| # | Acción / Comando | Equipo | Resultado Medible |
|---|------------------|--------|-------------------|
| 1 | Ejecuté `powercfg /energy` y analicé el informe | Equipo A (Windows 10/11) | Detecté 5 advertencias y configuré suspensión selectiva de USB |
| 2 | Modifiqué el plan de energía y desactivé hibernación | Equipo A | Consumo estimado bajó un 10% según `powercfg` |
| 3 | Audité servicios con `Get-Service` y desactivé servicios innecesarios | Equipo A | Arranque del sistema 15 segundos más rápido |
| 4 | En Linux, ejecuté `sudo powertop --auto-tune` | Equipo B (Debian/Ubuntu) | Consumo en reposo: -30% comparado a configuración de fábrica |
| 5 | Ajusté `vm.swappiness=10` en `/etc/sysctl.conf` y apliqué con `sudo sysctl -p` | Equipo B | Uso de swap un 40% menor, mejorando tiempos de respuesta |
| 6 | Usé `htop` y `iotop` para monitoreo de procesos y disco | Equipo B | Ubicación de procesos consumidores y balance de carga |
| 7 | Analicé logs de consumo con `powercfg /sleepstudy` | Equipo A | Identificación de wake events inesperados (LAN) |
| 8 | Revisión de logs en Windows Server (`eventvwr.msc`) y pruebas con `winsat disk` | Equipo C (Server 2012) | Disco HDD presentaba cuellos de botella, sugerí migración a SSD |
| 9 | Desactivé servicios legacy sin soporte en Equipo C | Equipo C | Menor superficie de ataque y mejora en estabilidad |

---

## 2. Reflexión sobre conflictos entre ejes y resolución

- **Conflicto principal**: En Equipo B, priorizar rendimiento (baja swap) generaba alerta para Seguridad: menos swap = posible DoS si una app se desborda.
  - **Solución**: se negoció dejar `vm.swappiness=20` y limitar la memoria de los servicios principales con `systemd` y `ulimit`.
- **Conflicto secundario**: En Equipo C, intentar instalar herramientas nuevas para monitoreo energética generaba tensiones con el eje de Soberanía y Soporte, ya que Windows Server 2012 está fuera de soporte y no es seguro instalar software adicional.
  - **Solución**: Se optó por realizar únicamente cambios no intrusivos y documentar claramente cualquier prueba de concepto sobre software nuevo, con respaldo previo.

---
## 3. Si hiciera este proyecto solo/a, ¿qué cambiaría?

Si hubiera desarrollado este proyecto de manera individual, habría priorizado la automatización de tareas repetitivas empleando scripts propios en bash y PowerShell para auditar consumo energético y optimizar servicios en todos los equipos desde el inicio. Centrando la atención en los equipos que presentaban mayores cuellos de botella (Dirección Económica y Server), habría simplificado la migración a Linux únicamente cuando fuera indispensable para aplicaciones clave, reduciendo así problemas de compatibilidad. Además, documentaría el flujo completo en un único repositorio con reportes generados automáticamente y gráficos de consumo, lo que facilitaría el seguimiento de impactos luego de cada ajuste. La toma de decisiones sería más ágil, aunque reconocería que podría pasar por alto advertencias sobre riesgos de seguridad o dependencias del entorno, que el trabajo en equipo ayuda a clarificar.

---

## 4. Aprendizajes inesperados sobre mi rol

A lo largo del proyecto, descubrí que la gestión de energía y rendimiento involucra un balance minucioso entre eficiencia, estabilidad y seguridad. Aprendí que herramientas como powertop pueden realizar ajustes agresivos que no siempre son convenientes en hardware antiguo, y que recomendaciones estándar no siempre mejoran la situación real de consumo o rendimiento. Me sorprendió cómo el ajuste de parámetros como vm.swappiness puede tener efectos secundarios de seguridad, y la importancia de colaborar estrechamente con los analistas de seguridad y soberanía tecnológica para validar cada cambio. También comprendí que el monitoreo continuo (por ejemplo, con vmstat y powertop) es clave para detectar mejoras objetivas y que el impacto de reemplazar componentes obsoletos (como un HDD por un SSD) supera las expectativas iniciales tanto en energía como en desempeño.

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
| Alex                  | Seguridad    | Detectó riesgos al modificar swap                 | Compartir lista de puertos con más anticipación | 4            |
| Martín                | Soberanía    | Propuso alternativas a software privativo         | Mejorar comunicación entre sistemas             | 5            |
| Rodny                 | Coordinador  | Facilitó el acuerdo de compromisos entre ejes     | Podría moderar mejor discusiones técnicas       | 4            |

---

