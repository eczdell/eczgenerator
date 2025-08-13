#!/bin/bash

# Exit if any command fails
set -e

# Check if the arguments (JSON file and project name) are provided
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 <path_to_accounting.json> <project_name>"
  exit 1
fi

# Get the arguments
JSON_FILE="$1"
PROJECT_NAME="$2"

# Read paths from accounting.json and create directories & files
cat "$JSON_FILE" | jq -r '.paths | keys | map(gsub("\\{"; "[") | gsub("\\}"; "]")) | .[]' | while read -r path; do
  # Preserve original path (no uppercase transformation)
  formatted_path="$path"

  # Create the directory under the project folder
  mkdir -p "./$PROJECT_NAME/src/app/$formatted_path"  # Create the directory
  file="./$PROJECT_NAME/src/app/$formatted_path/columns.tsx"  # Define file path

  # Replace $Account with the original path and save to columns.tsx
  sed "s|\$Account|$formatted_path|g" ./templates/columns.txt > "$file"
done

echo "Columns generated successfully under $PROJECT_NAME/src/app/"

