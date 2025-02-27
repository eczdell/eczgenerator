#!/bin/bash

# Read the schema keys and create directories and files
cat accounting.json | jq -r '.components.schemas | keys | map(gsub("\\{"; "[") | gsub("\\}"; "]")) | .[]' | while read -r path; do
  mkdir -p "./types/$path"  # Create directory
  file="./types/$path/type.ts"  # Define file path

  # Extract the schema and write to the file
  cat accounting.json | jq -r --arg key "$path" '
    .components.schemas[$key] as $schema |
    "import { z } from \"zod\";\n\nexport const \($key)Schema = z.object({\n  " +
      ($schema.properties 
        | to_entries 
        | map("\(.key): z.string().max(\(.value.maxLength)).optional()") 
        | join(",\n  ")
      ) +
    "\n});\n\nexport type \($key) = z.infer<typeof \($key)Schema>;"
  ' > "$file"
done

