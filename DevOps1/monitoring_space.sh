#!/bin/bash

# Set the threshold for free space in percentage
threshold=50

# Get the percentage of free space on the disk
free_space=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

# Check if the free space is above the threshold
if [ "$free_space" -gt "$threshold" ]; then
    echo "Free space is above the threshold $threshold%."
else
    echo "Free space is below the threshold $threshold%."
fi

echo "Free space: $free_space%"
