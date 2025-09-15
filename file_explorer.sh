#!/bin/bash
# file_explorer.sh
# Aaron Wulff
# 9/9/2025

read -p "Enter directory name: " dir

for file in "$dir"/*; do

    path=$(readlink -f "$file")

    if [ -d "$file" ]; then
        type="dir"
        size="--"

    else
        type="file"
        size=$(stat -c %s "$file" | numfmt --to=iec --suffix=B --padding=7) #format file size
    fi

    mimetype=$(file -b --mime-type "$file") # get file type

    printf "%-40s %-6s %-8s %s\n" "$path" "[$type]" "$size" "$mimetype"
done