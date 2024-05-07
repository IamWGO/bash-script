#!/bin/bash

read -p "File or folder name do you want to backup? : " $input_backup


backup_dir="backup_$(date +'%Y%m%d_%H%M%S')"
mkdir "$backup_dir"

for item in "$input_backup"; do
    if [ -f "$item" ]; then
        cp "$item" "$backup_dir"
        echo "File $item copied to $backup_dir"
    elif [ -d "$item" ]; then
        cp -r "$item" "$backup_dir"
        echo "Dir $item copied $backup_dir"
    else
        echo "Warning: $item is not a valid file or directory."
    fi
done

tar -czf "$backup_dir.tar.gz" "$backup_dir"

echo "Backup created: $backup_dir.tar.gz"
