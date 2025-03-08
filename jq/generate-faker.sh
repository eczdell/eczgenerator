#!/bin/bash

# Check if filename is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <swagger-json-file>"
  exit 1
fi

SWAGGER_FILE="$1"
OUTPUT_FILE="fakerFactory.js"

# Generate sample values based on type
jq -r '
  def generate_faker_sample(type):
    if type == "string" then
      "faker.word.noun()"
    elif type == "number" then
      "faker.number.float({ min: 10, max: 1000,fractionDigits: 2 })"
    elif type == "integer" then
      "faker.number.int({ min: 1, max: 100 })"
    elif type == "boolean" then
      "faker.datatype.boolean()"
    elif type == "array" then
      "[]"
    elif type == "object" then
      "{}"
    elif type == "date" then
      "faker.date.past().toISOString()"
    elif type == "datetime" then
      "faker.date.future().toISOString()"
    else
      "faker.word.noun()"
    end;

  "import { faker } from \"@faker-js/faker\";\n\n"
  +
  (
    .components.schemas
    | to_entries
    | map(
        "export const generate\(.key) = () => ({\n  " + (
          .value.properties
          | to_entries
          | map("\(.key): " + generate_faker_sample(.value.type))
          | join(",\n  ")
        ) + "\n});"
      )
    | join("\n\n")
  )
' "$SWAGGER_FILE" > "$OUTPUT_FILE"

echo "Faker factory file generated: $OUTPUT_FILE"

