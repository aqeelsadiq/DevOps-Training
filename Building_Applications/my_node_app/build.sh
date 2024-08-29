#!/bin/bash

# Install dependencies
echo "Installing dependencies..."
npm install

# Check if npm install was successful
if [ $? -eq 0 ]; then
    echo "Dependencies installed successfully."
else
    echo "Failed to install dependencies."
    exit 1
fi

# Start the application
echo "Starting the application..."
node index.js

# Check if the application started successfully
if [ $? -eq 0 ]; then
    echo "Application started successfully."
    exit 0
else
    echo "Failed to start the application."
    exit 1
fi
