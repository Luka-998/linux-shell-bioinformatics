# AWK skripta, ne treba shebang

BEGIN {
	row=""; leng=""; i=0
}

!/^URS/ {
	row=$1; leng=length(row); sub1=substr(row,1,3); ((i++));  print row, sub1, NR 
}  

END {
 print "DONE"; if (i > 0) exit 1; else exit 0}
	
