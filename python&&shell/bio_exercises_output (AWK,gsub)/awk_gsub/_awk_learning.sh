#!/bin/bash
#AWK --- understanding

# Task 1. Print All Lines (Default Behavior)
#awk '{print}' BRCA1.fasta

# Task 2. Search lines with a keyword:
# awk '/^>/ {print}' BRCA1.fasta 

# Task 3. Write an awk command that counts only the lines containing sequence data (i.e., lines not starting with >)
# awk '/^>/ { if (seqlen) print seqlen; seqlen=0; next} { seqlen += length($0) } END { print seqlen }' awk1.fasta

# Task 4. Calculate GC Content for Each Sequence in a FASTA File 'awk_GC.fasta'
# For each sequence in a FASTA file, print the header line and its GC content as a percentage (rounded to 2 decimals).
# my logic is to escape the header lines with 

awk '/^>/ { print $1}' awk1.fasta # for header lines 
awk '!/^>/ { gc += gsub(/[GCgc]/,X); total += length($0) } END { print "GC content: ", gc/total*100}' awk1.fasta # GC content

# gsub is making the substitution of desired nucleotides in this case, given both upper and lower case, and they are swaped with X here.
# For this purpose it matters that, gsub returns the number of swapped nucleotides and stores in the gc variable
# total nucleotides are stored in the total variable.