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
   | map("\(.key): \(
      if .value.enum then 
        "z.enum([\(.value.enum | map("\"" + . + "\"") | join(", "))])"
      elif .value.type == "string" then
        if .value.format == "date" or .value.format == "date-time" then "z.string().datetime()"
        elif .value.format == "binary" then "z.instanceof(File)"
        else "z.string().max(\(.value.maxLength // 255))"
        end
      elif .value.type == "number" then "z.number()"
      elif .value.type == "integer" then "z.number().int()"
      elif .value.type == "boolean" then "z.boolean()"
      elif .value.type == "array" then 
        if .value.items.type then "z.array(z.\(.value.items.type)())" else "z.array(z.unknown())" end
      elif .value.type == "object" then "z.object({})"  # Adjust for nested properties
      else "z.unknown()" end
    )\((.value.nullable // false) | if . then ".nullable()" else "" end).optional()")
       | join(",\n  ")
      ) +
    "\n});\n\nexport type \($key) = z.infer<typeof \($key)Schema>;"
  ' > "$file"
done

