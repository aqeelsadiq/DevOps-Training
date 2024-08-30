
#!/bin/bash

# Set the archive directory.
archive_dir="/home/ubuntu/Templates"

# Get the current date
date=$(date +%Y-%m-%d)

# Create the archive directory if it does not exist
if [[ ! -d "$archive_dir" ]]; then
  mkdir -p "$archive_dir"  # -p means a prompt string that will be displayed before the user is prompted to enter input.
fi

# Archive modified files in the users home directory
find /home/ubuntu/Templates -type f -mtime -1 -print | tar -czvf "$archive_dir/$date.tar.gz" -T -
# -mtime This option allows you to search for files based on their modification time.
# -1 this option show last 24 hours.
# -T - this option tells the tar to read the list of files to include in the archive from standard input.
echo "Files modified in the last 24 hours archived to: $archive_dir/$date.tar.gz"
