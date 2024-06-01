#!/bin/bash
#

source ./exports.sh

# Directory containing the script files
SCRIPT_DIR="./scripts"

# Check if the directory exists
if [ ! -d "$SCRIPT_DIR" ]; then
  echo "Directory $SCRIPT_DIR does not exist."
  exit 1
fi

# Find all script files in the directory, sort them, and store in an array
SCRIPTS=($(ls $SCRIPT_DIR/*.sh | sort))

# Loop through each script and execute it
for SCRIPT in "${SCRIPTS[@]}"; do
  echo "Executing $SCRIPT..."
  pushd scripts/
  bash `basename $SCRIPT`
  popd
done

echo "All scripts executed successfully."

