#!/bin/bash

# Script usage message
echo "This script manages files and directories."
echo "Choose an action:"
echo "1. select this option to create directories and inside each directory you can create empty files by just writing a number"
echo "2. Copy an existing file"
echo "3. Exit"

# Read user input for action
read -p "Enter choice (1, 2, or 3): " choice

# Function to create directories and files
function create_files() {
  # Ask the user if they want to create directories
  read -p "Enter the number of directories to create: " num_dirs

  # Create directories
  directories=()
  for i in $(seq 1 "$num_dirs"); do
    dir="dir$i"
    mkdir -p "$dir"
    directories+=("$dir")
  done

  # Get the number of files to create from user
  read -p "Enter the number of files to create in each directory: " num_files

  # Loop to create empty files in each directory
  for dir in "${directories[@]}"; do
    for i in $(seq 1 "$num_files"); do
      touch "$dir/file$i"
    done
  done

  echo "Created $num_files empty files in each directory."
}

# Function to copy a file
function copy_file() {
  # Ask the user if they want to create directories
  read -p "Do you want to create directories? (yes/no): " create_dirs

  if [[ "$create_dirs" == "yes" ]]; then
    # Get the directory names from the user
    read -p "Enter directory names separated by space: " -a directories

    # Create directories
    for dir in "${directories[@]}"; do
      mkdir -p "$dir"
    done
  fi

  # Get the source and destination file paths from user
  read -p "Enter the source file path: " source_file

  # Check if source file exists
  if [[ ! -f "$source_file" ]]; then
    echo "Error: Source file '$source_file' does not exist."
    return 1
  fi

  # Get the destination directory name from the user
  read -p "Enter the destination directory (e.g., dir1, dir2, dir3): " dest_dir

  # Copy the file to each directory
  for dir in "${directories[@]}"; do
    cp "$source_file" "$dir/$dest_dir"
  done

  echo "Copied '$source_file' to all directories under '$dest_dir'."
}

# Handle user choice
case $choice in
1)
  create_files
  ;;
2)
  copy_file
  ;;
3)
  echo "Exiting script."
  ;;
*)
  echo "Invalid choice."
  ;;
esac
