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
output_file="${project_name}/src/sidebar/sidebarRoutes.ts"  # Project name added to the path

# Create the directory if it does not exist
output_dir=$(dirname "$output_file")
mkdir -p "$output_dir"  # This creates the directory if it doesn't exist

# Check if accounting.json exists
if [ ! -f "$accounting_json" ]; then
  echo "Error: accounting.json file not found at $accounting_json"
  exit 1
fi

# Extract paths from accounting.json using jq
paths=$(cat "$accounting_json" | jq -r '.paths | keys | map(gsub("\\{"; "[") | gsub("\\}"; "]"))[]')

# Step 1: Create and write the header of the TypeScript file (sidebarRoutes.ts)
cat <<EOF > "$output_file"
const sidebarRoutes = {
  versions: ["1.0.1"],
  navMain: [
EOF

# Step 2: Process each path and generate the sidebar items
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
    echo ',' >> "$output_file"
  fi

  # Write the sidebar item to the TypeScript file
  cat <<EOF >> "$output_file"
    {
      title: "$title",
      url: "#",
      items: [
        {
          title: "View All",
          url: "$path",
          isActive: $([ "$is_dynamic" = true ] && echo false || echo true)
        }
      ]
    }
EOF
done

# Step 3: Write the closing part of the TypeScript file
echo '  ]' >> "$output_file"
echo '};' >> "$output_file"
echo 'export default sidebarRoutes;' >> "$output_file"

# Confirmation message
echo "The sidebar data has been generated and saved to $output_file"

