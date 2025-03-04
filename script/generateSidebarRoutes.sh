## dont use subpath
 cat accounting.json | jq -r '.paths | keys | map(gsub("\\{"; "[") | gsub("\\}"; "]")) | .[]' | grep -P '^/[^/]+$'| while read -r path; do
  # Transform path: remove '/', capitalize segments, and join
  formatted_path=$(echo "$path" | awk -F'/' '{for (i=1; i<=NF; i++) $i=toupper(substr($i,1,1)) substr($i,2)}1' OFS='')

  mkdir -p "./src/actions/$path"  # Create the directory
  file="./src/actions/$path/action.ts"  # Define file path

  # Replace $Account with formatted path and save to page.tsx
  sed "s|\$Account|$formatted_path|g" ./templates/action.txt > "$file"
done

----------------------
#!/bin/bash

# Step 1: Extract paths from the accounting.json using jq
paths=$(cat accounting.json | jq -r '.paths | keys | map(gsub("\\{"; "[") | gsub("\\}"; "]"))[]')

# Step 2: Create the base structure for the sidebar data
echo '{
  "versions": ["1.0.1"],
  "navMain": ['

# Step 3: Process each path and generate the sidebar items
first=true
for path in $paths; do
  # Clean and create a title for the path (remove slashes and [id] parts)
  title=$(echo "$path" | sed -E 's/[\/\[\]]/ /g' | awk '{print toupper(substr($0,1,1)) tolower(substr($0,2))}')

  # Check if the path contains a dynamic [id] part
  is_dynamic=false
  if [[ "$path" == *"[id]"* ]]; then
    is_dynamic=true
  fi

  # If not the first item, add a comma for proper JSON formatting
  if [ "$first" = true ]; then
    first=false
  else
    echo ','
  fi

  # Add the sidebar item for the path
  echo "    {
    \"title\": \"$title\",
    \"url\": \"#\",
    \"items\": [
      {
        \"title\": \"View All\",
        \"url\": \"$path\",
        \"isActive\": $([ "$is_dynamic" = true ] && echo false || echo true)
      }
    ]
  }"
done

# Step 4: Close the JSON structure
echo '  ]
}'

