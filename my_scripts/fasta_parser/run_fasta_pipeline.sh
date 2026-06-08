#!/bin/bash


INPUT="$1"
OUTPUT="$2"
AWK_BASE_COUNTER="/home/skeja/linux-shell-bioinformatics/my_scripts/fasta_parser/check_bases.awk"
AWK_PARSE_FASTA="/home/skeja/linux-shell-bioinformatics/my_scripts/fasta_parser/parse_fasta.awk"
AWK_BASE_COUNTER_TSV="/home/skeja/linux-shell-bioinformatics/my_scripts/fasta_parser/check_bases_tsv.awk"
if [ ! -f "$INPUT" ]; then
	echo "ERROR: Missing input file!"
	exit 1
fi

if [ -z "$OUTPUT" ]; then
	echo "Output file not provided"
	echo "Usage: $PWD/output.tsv"
	touch clean_sequence.tsv
	OUTPUT=output.tsv
fi

if [[  "$INPUT" == *.gz ]]; then
	SECONDS=0
	echo "> Bases in raw input file"
	zcat "$INPUT" | awk -f "$AWK_BASE_COUNTER"
	echo "> Executing fasta parser..."
	zcat "$INPUT" | awk -f "$AWK_PARSE_FASTA" > "$OUTPUT"
	echo "> DONE"

else	
	SECONDS=0

	echo "> Bases in raw input file"
	awk -f "$AWK_BASE_COUNTER" "$INPUT"

	echo "> Executing fasta parser..."
	awk -f "$AWK_PARSE_FASTA" "$INPUT" > "$OUTPUT"

	echo "> DONE"
	echo "> Checking bases in clean sequence"
fi	       
	awk -f "$AWK_BASE_COUNTER_TSV" "$OUTPUT"

echo "script done in $SECONDS seconds"
