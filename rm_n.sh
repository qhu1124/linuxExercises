#!/bin/bash
# Usage: ./rm_n.sh <dir> <n>
# Deletes all files in <dir> larger than <n> bytes

if [ $# -ne 2 ]; then
  echo "usage: $0 <dir> <n>" 1>&2
  exit 1
fi

dir=$1
n=$2
if [ ! -d "$dir" ]; then
  echo "Error: $dir is not a directory." 1>&2
  exit 1
fi
if ! [[ "$n" =~ ^[0-9]+$ ]]; then
  echo "Error: $n is not a valid number." 1>&2
  exit 1
fi
find "$dir" -type f -size +"${n}"c -exec rm -v {} \;

echo "All files larger than $n bytes in $dir have been removed."
