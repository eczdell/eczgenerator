## create file and folders
cat accounting.json | jq -r '.paths | keys | map(gsub("\\{"; "[") | gsub("\\}"; "]")) | .[]' | while read -r path; do mkdir -p "./app/$path"  # Create the directory
  touch "./app/$path/page.tsx"  # Create the file inside it
done

-----------------------
 cat accounting.json | jq -r '.paths | keys | map(gsub("\\{"; "[") | gsub("\\}"; "]")) | .[]' | while read -r path; do   mkdir -p "./app/$path"  # Create the directory
  file="./app/$path/page.tsx"  # Define file path

  cp pageTemplate.txt "$file"; done
-----------------------

eczdell@archlinux ~/personal/next-15/test
$ #!/bin/bash

# Read paths from accounting.json and create directories & files
cat accounting.json | jq -r '.paths | keys | map(gsub("\\{"; "[") | gsub("\\}"; "]")) | .[]' | while read -r path; do
  # Transform path: remove '/', capitalize segments, and join
  formatted_path=$(echo "$path" | awk -F'/' '{for (i=1; i<=NF; i++) $i=toupper(substr($i,1,1)) substr($i,2)}1' OFS='')

  mkdir -p "./app/$path"  # Create the directory
  file="./app/$path/page.tsx"  # Define file path

  # Replace $Account with formatted path and save to page.tsx
  sed "s|\$Account|$formatted_path|g" ./templates/page.txt > "$file"
done

