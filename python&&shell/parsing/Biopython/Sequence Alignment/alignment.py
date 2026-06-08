from Bio import pairwise2
from Bio.pairwise2 import format_alignment

# Two random DNA sequence
seq1 = "GATTACA"
seq2 = "GCATGCU"

# Global
alignments_global = pairwise2.align.globalxx(seq1, seq2)

# and Local (Smith-Waterman) Alignment
alignments_local = pairwise2.align.localxx(seq1, seq2)


print("### Global Alignment (Needleman-Wunsch) ###") #always forget the Wunsch
for alignment in alignments_global:
    print(format_alignment(*alignment))

print("### Local Alignment (Smith-Waterman) ###")
for alignment in alignments_local:
    print(format_alignment(*alignment))

with open("alignment_results.txt", "w") as f:
    f.write("### Global Alignment (Needleman-Wunsch) ###\n")
    for alignment in alignments_global:
        f.write(format_alignment(*alignment) + "\n")

    f.write("\n### Local Alignment (Smith-Waterman) ###\n")
    for alignment in alignments_local:
        f.write(format_alignment(*alignment) + "\n")

print("Alignment results saved to alignment_results.txt")
