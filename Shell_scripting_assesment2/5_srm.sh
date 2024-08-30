#!/bin/bash

USER_DIR="/home/ubuntu/trash"
TRASH_DIR="$USER_DIR/trash"
THRESHOLD_AGE=48 

# Function to check if a file is already compressed
function is_compressed() {
  local filename="$1"
  mime_type=$(file -b --mime-type "$filename")
  [[ $mime_type == "application/gzip" ]]
}

# Function to handle safe delete for a file
function safe_delete() {
  local filename="$1"

  # Check if file exists
  if [[ ! -f "$filename" ]]; then
    echo "Error: File '$filename' does not exist."
    return 1
  fi

  # Check if already compressed
  if is_compressed "$filename"; then
    echo "File '$filename' is already compressed. Skipping compression."
  else
    # Compress the file
    gzip "$filename"
  fi

  # Move the compressed file to trash directory
  compressed_filename="$filename.gz"
  mv "$compressed_filename" "$TRASH_DIR" && echo "$(date '+%Y-%m-%d %H:%M:%S'): Compressed and moved $filename to trash"
  echo "File '$filename' compressed and moved to trash."
}

# Process each file argument
for filename in "$@"; do # $@ represent all arguments passed to the script from command line
  safe_delete "$filename"
done

# Clean up old trash files
find "$TRASH_DIR" -type f -mtime +"$THRESHOLD_AGE" -print -delete
echo "Deleted files older than $THRESHOLD_AGE hours from trash directory."

echo "Finished processing files."
