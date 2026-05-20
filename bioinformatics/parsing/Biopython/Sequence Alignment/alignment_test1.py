# 2 sequences local alignment

from Bio.Align import PairwiseAligner


seq1 = "ATGCGTACGTAGCTAG"
seq2 = "CGTACGTA"

aligner = PairwiseAligner()

# local

aligner.mode = "local"

# define scores

aligner.match_score = 2
aligner.mismatch_score = -1
aligner.open_gap_score= -2
aligner.extend_gap_score = -0.5


alignments = aligner.align(seq1,seq2)

print(type(alignments))

print("Best alignment score:", alignments.score)
print(alignments)

