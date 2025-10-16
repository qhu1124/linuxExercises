#!/bin/bash

if [ "$#" -lt 1 ]; then
    echo "usage: ./mean.sh <column> [file.csv]" >&2
    exit 1
fi

COLUMN=$1
FILE_PATH=${2:-/dev/stdin}

if [ "$FILE_PATH" != "/dev/stdin" ] && [ ! -r "$FILE_PATH" ]; then
    echo "Error" >&2
    exit 1
fi

cut -d ',' -f "$COLUMN" "$FILE_PATH" | tail -n +2 | {
    sum=0
    count=0
    while read val; do
        if [[ -n "$val" ]]; then
            sum=$(echo "$sum + $val" | bc -l)
            count=$((count + 1))
        fi
    done

    if [ $count -gt 0 ]; then
	echo "$sum / $count" | bc -l
    else
	echo "0"
    fi
}
    
