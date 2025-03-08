#!/bin/bash

# Check if filename is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <json-file>"
  exit 1
fi

# Read the JSON file
JSON_FILE="$1"

jq -r '
  .components.schemas.VendorToUpdate.properties
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
    )\((.value.nullable // false) | if . then ".nullable()" else "" end).optional(),")
  | join("\n")' "$JSON_FILE"

