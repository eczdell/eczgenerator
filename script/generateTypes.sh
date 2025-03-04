#!/bin/bash

# Check if the arguments (JSON file and project name) are provided
#  ./script/generateTypes.sh ./accounting.json testing
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 <path_to_accounting.json> <project_name>"
  exit 1
fi

# Get the arguments
JSON_FILE="$1"
PROJECT_NAME="$2"

# Read the schema keys and create directories and files
cat "$JSON_FILE" | jq -r '.components.schemas | keys | map(gsub("\\{"; "[") | gsub("\\}"; "]")) | .[]' | while read -r path; do
  mkdir -p "./$PROJECT_NAME/src/types/$path"  # Create directory with project name
  file="./$PROJECT_NAME/src/types/$path/type.ts"  # Define file path

  # Extract the schema and write to the file
  cat "$JSON_FILE" | jq -r --arg key "$path" '
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

