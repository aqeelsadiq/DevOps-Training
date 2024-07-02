#!/bin/bash

# Define variables
USER_DIR="/home/ubuntu/Templates"  # Update with the actual username
LOG_FILE="disk_space_management.log"
THRESHOLD_SIZE=100000  # Threshold size in bytes (100KB)

# Function to display file details and prompt for action
function handle_file() {
  local filename="$1"
  filesize=$(du -h "$filename" | cut -f1) # cut The command used to extract sections from lines of input

  echo "Found file: $filename ($filesize)"
  echo "Press d to delete the file, c to compress the file, or any other key to skip."
  read -p "Enter your choice: " choice

  case $choice in
  d)
    rm -f "$filename" && echo "$(date '+%Y-%m-%d %H:%M:%S'): Deleted $filename" >> "$LOG_FILE"
    echo "File deleted."
    ;;
  c)
    gzip "$filename" && echo "$(date '+%Y-%m-%d %H:%M:%S'): Compressed $filename" >> "$LOG_FILE"
    echo "File compressed."
    ;;
  *)
    echo "Skipping."
    ;;
  esac
}

# Find large files recursively
find "$USER_DIR" -type f -size +"$THRESHOLD_SIZE"c -print | while read filename; do
 handle_file "$filename"
done



read -p "Enter the file name to check if it exists: " filename

#construct file path
file_path="$USER_DIR/$filename"

# to Check if the file exists and file size is llarger than 100kb
if [ -f "$file_path" ] && [ $(stat -c%s "$file_path") -gt $THRESHOLD_SIZE ]; then
  handle_file "$file_path"
else
  echo "File does not exist or is smaller than the threshold size. Exiting."
  exit 1 #this line shows if the file does not exist terminating the code with error msg
fi

echo "Finished processing files."
