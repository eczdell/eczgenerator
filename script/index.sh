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

# Run generateTypes.sh with project name and JSON file
echo "Running generateTypes.sh..."
"$SCRIPT_DIR/generateTypes.sh" "$JSON_FILE" "$PROJECT_NAME"

# Run generateColumns.sh with project name and JSON file
echo "Running generateColumns.sh..."
"$SCRIPT_DIR/generateColumns.sh" "$JSON_FILE" "$PROJECT_NAME"

# Run generatePage.sh with project name and JSON file
echo "Running generatePage.sh..."
"$SCRIPT_DIR/generatePage.sh" "$JSON_FILE" "$PROJECT_NAME"

# Run generate_sidebar.sh with project name and JSON file
echo "Running generate_sidebar.sh..."
"$SCRIPT_DIR/generate_sidebar.sh" "$JSON_FILE" "$PROJECT_NAME"

# Run generateActions.sh with project name and JSON file
echo "Running generateActions.sh..."
"$SCRIPT_DIR/generateActions.sh" "$JSON_FILE" "$PROJECT_NAME"

echo "All scripts executed successfully!"
