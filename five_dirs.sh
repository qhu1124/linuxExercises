#!/bin/bash
rm -rf five
mkdir five

for i in {1..5}; do
  dir="five/dir$i"
  mkdir -p "$dir"

  for j in {1..4}; do
    file="$dir/file$j"
    yes "$j" | head -n "$j" > "$file"
  done
done

echo "Directory structure created successfully!"
