# 1. Diagnóstico de Rendimiento y Energía

*Analista: [Nombre del estudiante]*

## 1.1. Inventario de equipos analizados

| Equipo | Procesador | RAM | Almacenamiento | SO | Función |
|--------|------------|-----|----------------|-----|---------|
| PC-ADM1 | Intel Core i3 | 4 GB | 500 GB HDD | Windows 10 | Gestión administrativa |
| PC-ADM2 | Intel Core i3 | 4 GB | 500 GB HDD | Windows 10 | Gestión administrativa |
| PC-ADM3 | Intel Core i3 | 4 GB | 500 GB HDD | Windows 10 | Gestión administrativa |
| PC-DIR | Intel Pentium G4400 | 4 GB | 1 TB HDD | Windows 10 | Dirección |
| PC-TEC | Intel Core i5 | 8 GB | 1 TB HDD | Windows 10 | Gestión técnica |
| PC-REC | Intel Celeron | 2 GB | 250 GB HDD | Windows 10 | Recepción |
| PC-DES1 | Intel Core 2 Duo | 2 GB | 320 GB HDD | Windows 10 | Despacho |
| PC-DES2 | Intel Core 2 Duo | 2 GB | 320 GB HDD | Windows 10 | Despacho |
| SRV-LOCAL | Intel Xeon E3 | 16 GB | 2×1 TB RAID1 | Ubuntu 20.04 | Servidor archivos |

## 1.2. Métricas de rendimiento actuales

### Equipos de escritorio (muestra representativa)

| Métrica | PC-ADM1 | PC-DIR | PC-TEC | PC-REC | PC-DES1 |
|---------|---------|--------|--------|--------|---------|
| Tiempo arranque (min) | 2.8 | 3.2 | 2.5 | 4.1 | 3.5 |
| CPU idle (%) | 12-18% | 5-8% | 8-12% | 25-35% | 15-22% |
| RAM usada en reposo | 82% | 72% | 58% | 91% | 88% |
| Temperatura CPU (°C) | 65 | 68 | 62 | 58 | 63 |
| Procesos en ejecución | 112 | 98 | 124 | 86 | 94 |

### Servidor local

| Métrica | Valor actual | Valor óptimo |
|---------|--------------|--------------|
| CPU idle (%) | 1-2% | <5% (bueno) |
| RAM usada | 3.5/16 GB (22%) | Óptimo |
| Carga promedio (1/5/15 min) | 0.8/0.6/0.5 | Normal |
| Tiempo de respuesta SMB | 12ms | Bueno |
| Procesos en ejecución | 156 | Normal |

## 1.3. Herramientas de medición utilizadas

### Windows
```powershell
# Informe energético detallado
powercfg /energy

# Monitor de confiabilidad
perfmon /rel

# Uso de CPU por proceso
wmic cpu get loadpercentage
Get-Process | Sort-Object CPU -Descending | Select-Object -First 10

# Herramientas gráficas
resmon
perfmon
```

### Linux (servidor)
```bash
# Herramienta interactiva de energía
sudo powertop

# Información de frecuencia CPU
cpupower frequency-info

# Estadísticas de sistema
vmstat 2 10
iostat -x 2 5

# Temperaturas
sensors
```

## 1.4. Problemas críticos identificados

### Equipo de dirección (PC-DIR)
- Disco duro mecánico 1TB 5400rpm → cuello de botella principal
- Outlook + Excel + Chrome consumen >3.5GB RAM → swap intensivo
- Governor de energía en "Equilibrado" → respuesta lenta
- Arranque de 3 minutos afecta productividad diaria

### Equipos administrativos (PC-ADM1-3)
- Memoria insuficiente (4GB) para Windows 10 + Office 2019
- Múltiples procesos de telemetría de Microsoft consumiendo CPU
- Antivirus AVG Free realizando escaneos en horario laboral

### Equipos de despacho (PC-DES1-2)
- Hardware más antiguo (Core 2 Duo, 2GB RAM)
- Windows 10 funciona extremadamente lento
- Ideal para migración a Linux ligero

### Servidor local
- Governor `ondemand` no persistente tras reinicios
- Servicios innecesarios activos (FTP anónimo)
- Sin optimización de swappiness (valor por defecto 60)

### Equipo de recepción (PC-REC)
- Crítico: 2GB RAM con Windows 10 → 91% uso continuo
- Office 2010 pesado para el hardware
- Celeron sin soporte de instrucciones modernas

## 1.5. Consumo energético estimado

| Equipo | Potencia idle (W) | Potencia carga (W) | Uso diario (h) | kWh/día |
|--------|-------------------|--------------------|----------------|---------|
| PC-ADM (×3) | 85 | 120 | 8 | 2.04 |
| PC-DIR | 98 | 140 | 9 | 0.88 |
| PC-TEC | 95 | 135 | 8 | 0.76 |
| PC-REC | 70 | 100 | 7 | 0.49 |
| PC-DES (×2) | 80 | 115 | 6 | 0.96 |
| Servidor | 120 | 180 | 24 | 2.88 |
| **Total** | — | — | — | **8.01 kWh/día** |

## 1.6. Propuestas iniciales de mejora

| Acción | Impacto esperado | Prioridad |
|--------|------------------|-----------|
| Migrar PC-REC, PC-DES a Linux Lite/Xubuntu | +70% rendimiento, -40% consumo | Alta |
| Governor `powersave` persistente en servidor | -15W idle, ahorro anual ~130 kWh | Alta |
| Deshabilitar telemetría en Windows restantes | -5% CPU, -8% RAM | Media |
| Ajustar swappiness en servidor a 10 | Reduce escritura disco, extiende vida útil | Media |
| Desfragmentación programada en HDD | Mejora tiempos de lectura | Baja |

## 1.7. Métricas post-optimización (proyectadas)

| Equipo | RAM libre actual | RAM libre post | Tiempo arranque actual | Tiempo post |
|--------|------------------|----------------|------------------------|-------------|
| PC-REC | 180 MB | 1.2 GB (Linux) | 4.1 min | 0.9 min |
| PC-DES | 240 MB | 1.0 GB (Linux) | 3.5 min | 0.8 min |
| PC-DIR | 1.1 GB | 2.5 GB | 3.2 min | 1.8 min |
| Servidor | 12.5 GB | 14.0 GB | — | — |