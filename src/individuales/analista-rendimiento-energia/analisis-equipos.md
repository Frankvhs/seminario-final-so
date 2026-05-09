# Análisis de Equipos – Analista de Rendimiento y Energía

- **Nombre del estudiante:** [Tu nombre completo]
- **Rol desempeñado:** Analista de Rendimiento y Energía
- **Nombre del equipo:** [Nombre del equipo]
- **Fecha de entrega:** [Fecha actual]

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

## 3. Autoevaluación y coevaluación

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
| [Nombre compañero 1]  | Seguridad    | Detectó riesgos al modificar swap                 | Compartir lista de puertos con más anticipación | 4            |
| [Nombre compañero 2]  | Soberanía    | Propuso alternativas a software privativo         | Mejorar comunicación entre sistemas             | 5            |
| [Nombre compañero 3]  | Coordinador  | Facilitó el acuerdo de compromisos entre ejes     | Podría moderar mejor discusiones técnicas       | 4            |

---

## 4. Planilla de autoevaluación y coevaluación (plantilla anexo.md)

(Puedes copiar y adaptar el formato de tablas exactamente igual a lo mostrado en el archivo `anexo.md` para cumplir con el formato.)

---

**Nombre y fecha:** [Firma digital o nombre claro] - [Fecha]
