#!/bin/bash

OUTPUT="dist/TrabajoFinal_Sumifer_SO.docx"
INDIVIDUAL_DIR="dist/individuales"

mkdir -p dist "$INDIVIDUAL_DIR"

pandoc \
  src/capitulos/*.md \
  -o "$OUTPUT" \
  --defaults pandoc.yaml

echo "Documento grupal generado en: $OUTPUT"

find src/individuales -name "anexo.md" | while read -r anexo; do
    rol_dir=$(basename "$(dirname "$anexo")")
    output_file="$INDIVIDUAL_DIR/Anexo_${rol_dir}.docx"
    
    pandoc \
      "$anexo" \
      -o "$output_file" \
      --defaults pandoc.yaml
    
    echo "Anexo individual generado: $output_file"
done

echo "Todos los documentos generados correctamente."
