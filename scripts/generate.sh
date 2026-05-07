#!/bin/bash

OUTPUT="dist/TrabajoFinal_Sumifer_SO.docx"

mkdir -p dist

pandoc \
  src/capitulos/*.md \
  -o $OUTPUT \
  --defaults pandoc.yaml

echo "Generada en: $OUTPUT"
