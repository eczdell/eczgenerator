#!/bin/bash

# Check if filename is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <swagger-json-file>"
  exit 1
fi

# Read the Swagger JSON file
SWAGGER_FILE="$1"

# Generate sample values based on the type
jq -r '
  def generate_faker_sample(type):
    if type == "string" then
      "faker.lorem.word()"
    elif type == "number" then
      "faker.datatype.number()"
    elif type == "integer" then
      "faker.datatype.number({ min: 1, max: 100 })"
    elif type == "boolean" then
      "faker.datatype.boolean()"
    elif type == "array" then
      "faker.datatype.array()"
    elif type == "object" then
      "{}"  # Empty object for simplicity
    elif type == "date" then
      "faker.date.recent()"
    elif type == "datetime" then
      "faker.date.recent().toISOString()"
    else
      "faker.random.word()"
    end;

  .components.schemas
  | to_entries
  | map("\(.key): { 
    " + (
      .value.properties
      | to_entries
      | map(
        "\(.key): " + (
          generate_faker_sample(.value.type)
        )
      )
      | join(", ")
    ) + " }"
  )' "$SWAGGER_FILE"

