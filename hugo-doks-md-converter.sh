#!/bin/bash

# Check if the file is passed as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <file.md>"
    exit 1
fi

MD_FILE="$1"

# Extract the filename without the path or extension
TITLE=$(basename "${MD_FILE%.*}")

# Check if the Markdown file exists
if [ ! -f "$MD_FILE" ]; then
    echo "Error: $MD_FILE does not exist."
    exit 1
fi

# Create a temporary file
TEMP_FILE=$(mktemp)

# Determine the OS and get the file permissions
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS or BSD
    ORIGINAL_PERMS=$(stat -f "%A" "$MD_FILE")
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    ORIGINAL_PERMS=$(stat --format "%a" "$MD_FILE")
else
    echo "Unsupported OS: $OSTYPE"
    exit 1
fi

# Set the same permissions on the temporary file as the original file
chmod "$ORIGINAL_PERMS" "$TEMP_FILE"

# Combine the new text and the original Markdown file
{
    echo "---"
    echo "title: $TITLE"
    echo "---"
    cat "$MD_FILE"
} > "$TEMP_FILE"

# Overwrite the original file
mv "$TEMP_FILE" "$MD_FILE"

echo "Doks title added successfully."
