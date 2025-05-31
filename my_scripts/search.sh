esearch -db nucleotide -query "GPX4[Gene] AND Rat[Organism]" | efetch -format acc > "Rat_GPX4_ACC".txt

# If -format is followed by acc it returns only the accession codes of requested query 
# if -format txt or -format only it returns full document summaries (DocSum) in plain-text format. It includes;
# title , organism, accession, lenght, GI number, Kwrds  and more metadata

#Step 2: Fetch FASTA for multiple accession numbers.

cat Rat_GPX4_ACC.txt | tr "\n" ","  > "test1".txt && mv test1.txt "$HOME/Luka_work/code_area/"

efetch -db nucleotide -id $(cat test1.txt) -format fasta > gpx4_multi.fasta 
