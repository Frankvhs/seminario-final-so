# Trabajo Final - Introducción a los Sistemas Operativos

Aquí se encuentra el contenido del trabajo final de la asignatura Introducción a los Sistemas Operativos, curso 2026.  
El proyecto se basa en la entidad **Sumifer** (Empresa de Suministros Logísticos de Ferrocarriles) y aborda diagnóstico, optimización, migración y seguridad de sus sistemas.

> [!note]
> Las orientaciones completas están en [Orientación.md](./Orientación.md).

## Generar el documento `docx`

Para producir el informe grupal final se utiliza Pandoc.  
Consulta la guía de instalación: https://pandoc.org/installing.html

Ejecutar:

```shell
bash scripts/generate.sh
```

El documento compilado aparecerá en la carpeta `dist/`.

## Estructura del repositorio

```
.
├── assets/               # Capturas de pantalla y evidencias
├── src/
│   ├── capitulos/        # Secciones del grupo (Markdown)
│   ├── frontpage.docx    # Plantilla de portada
│   ├── metadata.yaml     # Metadatos (título, autores, fecha)
│   └── styles.dotx       # Estilos de Word para Pandoc
├── scripts/
│   └── generate.sh       # Script de generación
├── .github/workflows/    # CI/CD (build y release)
├── pandoc.yaml           # Configuración de Pandoc
└── .gitignore
```

## Roles del equipo

- **Coordinador/a técnico**
- **Analista de rendimiento y energía**
- **Analista de soberanía y obsolescencia**
- **Analista de seguridad**
