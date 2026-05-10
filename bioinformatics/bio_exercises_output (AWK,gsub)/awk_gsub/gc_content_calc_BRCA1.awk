# Extract Accession and Sequence Lengths from a GenBank File

# Work with a GenBank flat file and extract two pieces of information using awk:

# 1) The accession number (lines starting with ACCESSION)
# 2) The number of bases in the ORIGIN section (the actual DNA sequence at the bottom of the file)

#esearch -db nucleotide -query "BRCA1[Gene] AND Homo sapiens[Organism]" | efetch -format gb > BRCA1.gb

# detect and store accession number - ACCESSION 

# $0 whole line, $1 first field ,$2 second.. etc

awk '/^ACCESSION/ { acc = $2; print acc } { if (ORIGIN); print ORIGIN}' BRCA1.gb

"""
🔄 Typical Flow:

    Match and store ACCESSION line (e.g., $2 is the code).

    Find the line that says ORIGIN — this marks the start of the nucleotide sequence.

    From the line after ORIGIN, read until you hit //, which marks the end of the sequence.

    Clean up the sequence (remove numbers, spaces) and analyze it.
"""