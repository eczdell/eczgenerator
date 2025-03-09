#!/bin/bash

# Check if the arguments (JSON file and project name) are provided
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 <path_to_accounting.json> <project_name>"
  exit 1
fi

# Get the arguments
accounting_json="$1"
project_name="$2"

# Set the dynamic output file path using the project name
output_file="${project_name}/src/fakerFactory.ts"  # Project name added to the path

# Create the directory if it does not exist
output_dir=$(dirname "$output_file")
mkdir -p "$output_dir"  # This creates the directory if it doesn't exist

# Check if accounting.json exists
if [ ! -f "$accounting_json" ]; then
  echo "Error: accounting.json file not found at $accounting_json"
  exit 1
fi

# Generate faker factory using jq
jq -r '
  def generate_faker_sample(type):
    if type == "string" then
      "faker.word.noun()"
    elif type == "number" then
      "faker.number.float({ min: 10, max: 1000, fractionDigits: 2 })"
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
' "$accounting_json" > "$output_file"

# Confirmation message
echo "The faker factory file has been generated and saved to $output_file"

