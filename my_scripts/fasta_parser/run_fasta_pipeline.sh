#!/bin/bash

INPUT="$1"
OUTPUT="$2"
AWK_BASE_COUNTER="/home/skeja/linux-shell-bioinformatics/my_scripts/fasta_parser/check_bases.awk"
AWK_PARSE_FASTA="/home/skeja/linux-shell-bioinformatics/my_scripts/fasta_parser/parse_fasta.awk"

if [ ! -f "$INPUT" ]; then
	echo "ERROR: Missing input file!"
	exit 1
fi

if [ -z "$OUTPUT" ]; then
	echo "Output file not provided"
	echo "Usage: $PWD/output.tsv"
	touch output.tsv
	OUTPUT=output.tsv
fi

awk -f "$AWK_NUC_COUNTER" "$INPUT" "$OUTPUT"
awk -f "$AWK_BASE_COUNTER" "$OUTPUT"
echo "Finished."

