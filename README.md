# Trabajo Final - Introducción a los Sistemas Operativos

Aquí se encuentra el contenido del trabajo final de la asignatura Introducción a los Sistemas Operativos, curso 2026.  
El proyecto se basa en la entidad **Sumifer** (Empresa de Suministros Logísticos de Ferrocarriles) y aborda diagnóstico, optimización, migración y seguridad de sus sistemas.

> [!note]
> Las orientaciones completas están en [Orientación.md](./Orientación.md).

## Generar los documentos `docx`

Para producir los informes (grupal e individuales) se utiliza Pandoc.  
Consulta la guía de instalación: https://pandoc.org/installing.html

Ejecutar:

```shell
bash scripts/generate.sh
```

Los documentos compilados aparecerán en la carpeta `dist/`:

- `dist/TrabajoFinal_Sumifer_SO.docx` - Informe grupal
- `dist/individuales/Anexo_*.docx` - Anexos individuales por rol

## Estructura del repositorio

```
.
├── assets/                    # Capturas de pantalla y evidencias
├── src/
│   ├── capitulos/             # Secciones del informe grupal (Markdown)
│   │   ├── 00-introduccion-sistemas.md
│   │   ├── 01-diagnóstico-integrado.md
│   │   ├── 02-plan-de-mejora-integrado.md
│   │   ├── 03-simulacion-evidencias.md
│   │   └── 04-informe-ejecutivo.md
│   ├── individuales/          # Anexos por rol (cada uno con su .md)
│   │   ├── analista-rendimiento-energia/
│   │   │   ├── anexo.md
│   │   │   └── evidencias/
│   │   ├── analista-seguridad/
│   │   │   ├── anexo.md
│   │   │   └── evidencias/
│   │   ├── analista-soberania-obsolescencia/
│   │   │   ├── anexo.md
│   │   │   └── evidencias/
│   │   └── coordinador/
│   │       └── anexo.md
│   ├── plantillas/            # Plantilla base para anexos individuales
│   │   └── individual.md
│   ├── frontpage.docx         # Plantilla de portada
│   ├── metadata.yaml          # Metadatos (título, autores, fecha)
│   └── styles.dotx            # Estilos de Word para Pandoc
├── scripts/
│   └── generate.sh            # Script de generación (grupal + individuales)
├── .github/workflows/         # CI/CD (build y release)
├── pandoc.yaml                # Configuración de Pandoc
└── .gitignore
```

## Roles del equipo

| Rol                                       | Nombre                           |
| :---------------------------------------- | :------------------------------- |
| **Coordinador/a técnico**                 | Rodny Roberto Estrada León       |
| **Analista de rendimiento y energía**     | Frank Abel                       |
| **Analista de soberanía y obsolescencia** | Martín Alejandro García Babastro |
| **Analista de seguridad**                 | Alex Dayan Rodríguez Hernández   |

## Flujo de trabajo

1. Cada analista escribe su diagnóstico y plan de mejora en los archivos Markdown dentro de `src/capitulos/`
2. Cada miembro completa su anexo individual en `src/individuales/[rol]/anexo.md`
3. Las evidencias (capturas, scripts, logs) se colocan en `evidencias/` dentro de cada carpeta individual
4. El coordinador ejecuta `bash scripts/generate.sh` para generar todos los documentos `.docx`
5. Los archivos generados se encuentran en `dist/`
