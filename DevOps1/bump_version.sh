#!/bin/bash

# File containing the version number
version_file="version.md"

# Check if the version file exists
if [ ! -f "$version_file" ]; then
    echo "Error: $version_file not found."
    exit 1
fi

# Check if flag exists
if [ $# -eq 0 ]; then
    echo "Usage: $0 (major|minor|patch)"
    exit 1
fi

# Extract current version number
current_version=$(grep 'Version:' "$version_file" | grep -o '[0-9]\+\.[0-9]\+\.[0-9]\+')

# Check if the version number was successfully extracted
if [ -z "$current_version" ]; then
    echo "Error: Failed to extract current version from $version_file."
    exit 1
fi

# Parse major, minor, and patch versions
major=$(echo "$current_version" | cut -d. -f1)
minor=$(echo "$current_version" | cut -d. -f2)
patch=$(echo "$current_version" | cut -d. -f3)

echo "major: $major, minor: $minor, patch: $patch"

# Determine which part of the version to increment
case "$1" in
    "major")
        major=$((major + 1))
        minor=0
        patch=0
        ;;
    "minor")
        minor=$((minor + 1))
        patch=0
        ;;
    "patch")
        patch=$((patch + 1))
        ;;
    *)
        echo "Error: Invalid parameter. Usage: $0 <major|minor|patch>"
        exit 1
        ;;
esac

#Update version in file
new_version="$major.$minor.$patch"
echo Version: $new_version > $version_file
echo "Version bumped to $new_version"
