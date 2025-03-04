#!/bin/bash

# Check if the arguments (json file and project name) are provided
#
#  ./script/generatepage.sh ./accounting.json testing

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 <path_to_accounting.json> <project_name>"
  exit 1
fi

# Get the arguments
json_file="$1"
project_name="$2"

# Read paths from accounting.json and create directories & files
cat "$json_file" | jq -r '.paths | keys | map(gsub("\\{"; "[") | gsub("\\}"; "]")) | .[]' | while read -r path; do
  # Transform path: remove '/', capitalize segments, and join
  formatted_path=$(echo "$path" | awk -F'/' '{for (i=1; i<=NF; i++) $i=toupper(substr($i,1,1)) substr($i,2)}1' OFS='')

  # Create directory with project name
  mkdir -p "./$project_name/src/app/$formatted_path"  # Create the directory
  file="./$project_name/src/app/$formatted_path/page.tsx"  # Define file path

  # Replace $account with formatted path and save to page.tsx
  sed "s|\$account|$formatted_path|g" ./templates/page.txt > "$file"
done

