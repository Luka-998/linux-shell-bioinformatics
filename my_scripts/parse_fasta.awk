BEGIN {
    seq = ""
    header = ""
    OFS = "\t"
}

/^>/ {
    if (header != "" && seq !~ /N/) {
        print header, length(seq), seq
    }

    header = $0
    sub(/^>/, "", header)
    seq = ""
    next
}

!/^>/ {
    seq = seq $0
}

END {
    if (header != "" && seq !~ /N/) {
        print header, length(seq), seq
    }
}


