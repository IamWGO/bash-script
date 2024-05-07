#!/bin/bash

read -p "Do you want to continue? : " username

# Run top command to get system information
top -b -n 1 -u "$username" | grep "$username" > top_output.tmp
# Check if the top command was successful
if [ $? -ne 0 ]; then
    echo "Error: Failed to run top command."
    exit 1
fi

# Process top output (example: display first 10 lines)
head -n 10 top_output.tmp

# Optionally, you can add further processing of the top output here

# Remove temporary file
#rm top_output.tmp