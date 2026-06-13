#!/bin/bash

INPUT="$1"

if [ ! -f "$INPUT" ]; then
	echo "ERROR: NO INPUT FILE!"
	exit 1
fi

zcat "$INPUT" | awk ' BEGIN { BARCODE = ""; UMI = ""; counter = 1; ORF = "\t" }  NR % 4 == 2 { BARCODE = substr($0,1,16); UMI = substr($0,17,12); counter++ } { print "BARCODES: ", BARCODE, "UMI: ", UMI } { print "READ COUNT: ",counter }'

