#!/bin/bash

INPUT="$1"
OUTPUT="$2"

if [ ! -f "$INPUT" ]; then
	echo "ERROR: No input file!"
	exit 1
fi

if [ -z "$OUTPUT" ]; then
	echo "Using regular path created by fastqc"
fi

echo "Files ready for fastqc:"
find *.gz | xargs -I {} echo {} 

echo "Processing..."
find *.gz | xargs -I {} fastqc -t 12 -0 "$OUTPUT"
