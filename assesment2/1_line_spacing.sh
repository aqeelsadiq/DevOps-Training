#!/bin/bash

# Check if the correct number of arguments is provided
if [ $# -ne 1 ]; then   # $# it is a special variable that represent no of positional parameter (arg passed  to the script)
    echo "Usage: $0 text.txt "
    exit 1
fi

# Check if the target file exists
if [ ! -f "$1" ]; then  #! not operator  -f tell target the file not directory
    echo "Target file not found!"
    exit 1 #this line shows if the file does not exist terminating the code with error msg
fi

# Read each line of the target file and print it with an extra blank line
while IFS= read -r line; do   #IFS- internel field separator -r this option read to treat backslashes litterally ( not to interpret as escape char)
    echo "$line"
    echo ""
done < "$1"
