#!/bin/bash

# Exit if any command fails
set -e

# Check if the JSON file argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <path_to_accounting.json>"
  exit 1
fi

# Get the JSON file from the argument
JSON_FILE="$1"

# Prompt for the project name
echo -n "Enter the project name: "
read PROJECT_NAME

# Check if the project name is empty
if [ -z "$PROJECT_NAME" ]; then
  echo "Project name cannot be empty!"
  exit 1
fi

SCRIPT_DIR="$(dirname "$0")"

# Run all generation scripts
echo "Running generateTypes.sh..."
"$SCRIPT_DIR/generateTypes.sh" "$JSON_FILE" "$PROJECT_NAME"

echo "Running generateColumns.sh..."
"$SCRIPT_DIR/generateColumns.sh" "$JSON_FILE" "$PROJECT_NAME"

echo "Running generatePage.sh..."
"$SCRIPT_DIR/generatePage.sh" "$JSON_FILE" "$PROJECT_NAME"

echo "Running generate_sidebar.sh..."
"$SCRIPT_DIR/generate_sidebar.sh" "$JSON_FILE" "$PROJECT_NAME"

echo "Running generateActions.sh..."
"$SCRIPT_DIR/generateActions.sh" "$JSON_FILE" "$PROJECT_NAME"

# Run generateFactory.sh to generate the faker factory
echo "Running generateFactory.sh..."
"$SCRIPT_DIR/generateFaker.sh" "$JSON_FILE" "$PROJECT_NAME"

echo "All scripts executed successfully!"

