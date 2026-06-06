!/^>/ {
	for (i=1; i <=length($0); i++) {
		base = substr($0,i,1)
		count[base]++
		}
	}


