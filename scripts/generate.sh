#!/bin/bash

OUTPUT="dist/TrabajoFinal_Sumifer_SO.docx"

mkdir -p dist

# Orden específico de capítulos según estructura del trabajo
pandoc \
  src/capitulos/00-introduccion-sistemas.md \
  src/capitulos/01-diagnostico-rendimiento-energia.md \
  src/capitulos/01-diagnostico-soberania-obsolescencia.md \
  src/capitulos/01-diagnostico-seguridad.md \
  src/capitulos/02-plan-de-mejora-integrado.md \
  src/capitulos/03-simulacion-evidencias.md \
  src/capitulos/04-informe-ejecutivo.md \
  -o $OUTPUT \
  --defaults pandoc.yaml

echo "Documento generado en: $OUTPUT"
echo "Tamaño: $(du -h $OUTPUT | cut -f1)"