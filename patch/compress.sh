#!/bin/bash

# Script to compress image files (jpg/jpeg/png) in dwr directory and subdirectories
# using ffmpeg - Cross-platform compatible version

# Set the dwr directory path relative to the script location
# Using simple ../dwr since patch and dwr folders are siblings
DW_DIR="../dwr"

echo "Compressing image files in dwr directory..."

# Check if dwr directory exists
if [ ! -d "$DW_DIR" ]; then
    echo "Error: dwr directory not found at $DW_DIR"
    exit 1
fi

# Method 1: Use find command (most reliable)
# This approach works on both Linux and Windows/MinGW
find "$DW_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" \) -print0 | while IFS= read -r -d '' file; do
    echo "Compressing $file"
    # Using ffmpeg to compress the image
    # For JPEG: -q:v 85 (range 1-31)
    # For PNG: -define png:compression-level=9
    if [[ "$file" == *.jpg ]] || [[ "$file" == *.jpeg ]]; then
        ffmpeg -nostdin -v quiet -i "$file" -q:v 15  -y "$file"
    elif [[ "$file" == *.png ]]; then
        ffmpeg -nostdin -v quiet -i "$file" -define png:compression-level=9 -y "$file"
    fi
done

echo "Image compression completed."