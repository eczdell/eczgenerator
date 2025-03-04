#!/bin/bash

# Exit if any command fails
set -e

# Check if the argument (JSON file) is provided
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 <path_to_accounting.json> <project_name>"
  exit 1
fi

# Get the arguments
JSON_FILE="$1"
PROJECT_NAME="$2"

# Read paths from accounting.json, filter top-level paths (no subpaths), and create directories & files
cat "$JSON_FILE" | jq -r '.paths | keys | map(gsub("\\{"; "[") | gsub("\\}"; "]")) | .[]' | grep -P '^/[^/]+$' | while read -r path; do
  # Transform path: capitalize the first letter of the path (no slashes involved here)
  formatted_path=$(echo "$path" | awk -F'/' '{for (i=1; i<=NF; i++) $i=toupper(substr($i,1,1)) substr($i,2)}1' OFS='')

  # Create the directory under the project folder
  mkdir -p "./$PROJECT_NAME/src/actions/$path"  # Create the directory
  file="./$PROJECT_NAME/src/actions/$path/action.ts"  # Define file path

  # Replace $Account with formatted path and save to action.ts
  sed "s|\$Account|$formatted_path|g" ./templates/action.txt > "$file"
done

echo "Actions generated successfully under $PROJECT_NAME/src/actions/"

