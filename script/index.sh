#!/bin/bash

# Exit if any command fails
set -e

SCRIPT_DIR="$(dirname "$0")"

echo "Running generateColumns.sh..."
"$SCRIPT_DIR/generateColumns.sh"

echo "Running generatePage.sh..."
"$SCRIPT_DIR/generatePage.sh"

echo "Running generateTypes.sh..."
"$SCRIPT_DIR/generateTypes.sh"

echo "All scripts executed successfully!"

