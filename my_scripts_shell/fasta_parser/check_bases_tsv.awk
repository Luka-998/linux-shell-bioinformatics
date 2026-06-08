# script as base counter in the parsed fasta output => TSV file
# sequence is fixed at 3rd column => $3

BEGIN {
	OFS = "|"
	FS = "\t"
	}
{
	seq = $3
}
	{ for (i=1; i<=length(seq); i++) { base = substr(seq,i,1); count[base]++ } }
END {
	for (base in count) {
		print base, count[base] }
}

