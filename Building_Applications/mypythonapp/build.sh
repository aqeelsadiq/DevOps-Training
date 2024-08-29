#!/bin/bash

# Define the name of the Python script and the output executable
PYTHON_SCRIPT="main.py"
OUTPUT_EXECUTABLE="script"

# Install PyInstaller if not already installed
if ! command -v pyinstaller &> /dev/null
then
    echo "PyInstaller could not be found, installing..."
    pip install pyinstaller
fi

# Create the executable using PyInstaller
echo "Creating executable..."
pyinstaller --onefile --name $OUTPUT_EXECUTABLE $PYTHON_SCRIPT

# Check if the executable was created successfully
if [ $? -eq 0 ]; then
    echo "Executable created successfully."
else
    echo "Failed to create executable."
fi
