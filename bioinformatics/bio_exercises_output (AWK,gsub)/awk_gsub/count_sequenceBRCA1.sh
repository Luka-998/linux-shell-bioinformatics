grep -c ">" BRCA1.fasta

#Introducing the awk command . It takes kinds 2 inputs: text file and a set of instructions
#here awk is used to check if sequence start with header line in fasta format file ">"
# if does , so sequnce already has some lenghy, print sequence lenght; reset it to 0 and move to next -> actual sequence

# AWK AWK AWK learn