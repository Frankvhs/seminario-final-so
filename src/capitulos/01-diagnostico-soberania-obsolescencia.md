# 1. Diagnóstico de Soberanía y Obsolescencia

*Analista: [Nombre del estudiante]*

## 1.1. Inventario de software instalado

### Por tipo de puesto

| Puesto | SO | Suite ofimática | Software nacional | Otros |
|--------|-----|-----------------|-------------------|-------|
| Administrativo (×3) | Windows 10 | Office 2019 | Versat Sarasola | Chrome, AVG Free |
| Dirección | Windows 10 | Office 2019 | Versat Sarasola | TeamViewer |
| Técnico | Windows 10 | Office 2019 | Versat Sarasola | AutoCAD LT |
| Recepción | Windows 10 | Office 2010 | Versat Sarasola | — |
| Despacho (×2) | Windows 10 | Office 2016 | Versat Sarasola | Chrome |
| Servidor | Ubuntu 20.04 | — | — | Samba, SSH, BackupPC |

## 1.2. Análisis de dependencias propietarias

### Microsoft Windows 10 (todos los puestos)
- **Estado licencias**: Activación no oficial (KMS/LOADER)
- **Telemetría activa**: DiagTrack, CompatTelRunner, Experiencias del Usuario
- **Bloatware detectado**: Xbox, Skype, Candy Crush, OneDrive
- **Fin soporte 21H2**: Octubre 2025
- **Riesgo**: 8 puestos quedarán sin soporte en 18 meses

### Microsoft Office (versiones 2010-2019)
- **Licenciamiento**: No oficial en todos los casos
- **Alternativas viables**: LibreOffice, OnlyOffice
- **Compatibilidad**: 95% con documentos .docx/.xlsx
- **Macros/VBA**: Solo 2 puestos los utilizan (contabilidad)

### Versat Sarasola (software nacional)
- **Naturaleza**: Software privativo pero nacional
- **Dependencia**: Obligatorio por normativa MIPYME
- **Alternativas**: No aplica (requisito legal)
- **Observación**: Corre sobre WINE/Linux con configuración adecuada

### AutoCAD LT (puesto técnico)
- **Licencia**: Versión de prueba vencida
- **Alternativa libre**: FreeCAD, LibreCAD
- **Curva aprendizaje**: 2-3 semanas
- **Formato DWG**: LibreCAD importa/exporta nativamente

## 1.3. Telemetría y recolección de datos

### Windows 10 - Servicios de telemetría activos
```powershell
# Servicios identificados
DiagTrack (Connected User Experiences and Telemetry)
dmwappushservice (WAP Push Message Routing)
Diagnostic Execution Service
Microsoft (R) Diagnostics Hub Standard Collector
```

### Consumo de ancho de banda estimado
- Telemetría básica: ~5-10 MB/día por equipo
- Con "mejoras de experiencia": ~50-200 MB/día
- Para 8 equipos: hasta 1.6 GB/día innecesarios

### Método de bloqueo propuesto
```powershell
# Bloquear mediante hosts file
echo "0.0.0.0 vortex.data.microsoft.com" >> C:\Windows\System32\drivers\etc\hosts
echo "0.0.0.0 settings-win.data.microsoft.com" >> C:\Windows\System32\drivers\etc\hosts
```

## 1.4. Obsolescencia de hardware

### Clasificación por antigüedad

| Equipo | Aprox. antigüedad | Estado | Vida útil restante |
|--------|-------------------|--------|---------------------|
| PC-TEC (i5) | 4 años | Bueno | 3-4 años |
| PC-ADM (i3) | 5 años | Regular | 2-3 años |
| PC-DIR (Pentium) | 6 años | Regular | 2 años |
| Servidor (Xeon) | 5 años | Bueno | 4-5 años |
| PC-REC (Celeron) | 7 años | Crítico | 1 año |
| PC-DES (Core 2 Duo) | 10+ años | Obsoleto | <1 año |

### Obsolescencia de software crítico

| Componente | Versión actual | Soporte hasta | Recomendación |
|------------|----------------|---------------|---------------|
| Ubuntu Server | 20.04 LTS | Abril 2025 | Actualizar a 24.04 LTS |
| Windows 10 | 21H2 | Octubre 2025 | Migrar o actualizar |
| Windows 10 (PC-REC/DES) | 21H2 | Octubre 2025 | Migrar a Linux urgente |
| Kernel (servidor) | 5.4 | Abril 2025 | Upgrade a 6.8+ |

## 1.5. Propuesta de migración

### Por puesto

| Puesto | Acción | SO destino | Justificación |
|--------|--------|------------|----------------|
| PC-REC | Migración inmediata | Xubuntu 22.04 | Hardware obsoleto, 2GB RAM insuficientes |
| PC-DES1,2 | Migración inmediata | Linux Mint Xfce | Core 2 Duo, extensión vida útil +5 años |
| PC-ADM1-3 | Migración opcional | Dual boot o VM | Pueden mantener Windows con optimización |
| PC-DIR | Migración + VM | Xubuntu + Windows VM | Mantener compatibilidad Versat |
| PC-TEC | Evaluar migración | Ubuntu Studio | AutoCAD → FreeCAD |
| Servidor | Actualizar | Ubuntu 24.04 LTS | Soporte hasta 2029 |

### Cronograma de migración

| Fase | Plazo | Puestos | Responsable |
|------|-------|---------|--------------|
| 1 | Semana 1 | PC-REC, PC-DES | Analista soberanía |
| 2 | Semana 2 | PC-DIR (migración) | Analista soberanía |
| 3 | Semana 3 | PC-ADM (evaluación) | Coordinador |
| 4 | Semana 4 | Servidor | Analista seguridad |

## 1.6. Beneficios de soberanía tecnológica

| Indicador | Estado actual | Post-migración |
|-----------|---------------|----------------|
| % software libre | 12% (solo servidor) | 75% |
| Dependencia Microsoft | Total (8 equipos) | 1 equipo (VM) |
| Costo licencias (evitado) | ~8000 USD | 0 |
| Telemetría activa | 8 equipos | 0 |
| Control de actualizaciones | Automático forzado | Manual/controlado |
| Vida útil extendida | 1-2 años | 5+ años |