#!/bin/bash

#  note
awk=$1
file=$2
output=$3
SECONDS=0
if [ ! "$#" -eq 3 ]; then # skripta mora imati tacno 2 argumenta
	echo "Sript must receive exactly 3 input arguments"
	echo "./ should use AWK script as 1st and target file as 2nd arg."
	exit 1
fi
for var in "${@:1:2}"; do
	if [ ! -f "$var" ]; then
		echo "$var does not exist"
		exit 1
	else 
		echo "$var exists"
	fi
done
echo "Processing futher operations..."
awk -f "$awk" "$file" 
awk_status="$?"
var2="123123123"
if [ "$awk_status" -eq 0 ]; then
	echo "All rows are valid URS rows"
	echo "$SECONDS"
	if [ ! -f "$output" ]; then
		touch "$output" 
		echo "$output file created at $PWD"
	else
		echo "$awk_status">"$output"
	fi
else
	echo "Invalid row detected"
fi
