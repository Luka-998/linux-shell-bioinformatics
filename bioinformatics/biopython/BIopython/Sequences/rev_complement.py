dna = "AGTCGTATGATGGACCGAATAGGACTGGA"

# 5'-3' 
# 3'-5 antiparallel

def get_complement(fragment):
    mapper = {'A':'T','C':'G','T':'A','G':'C'}
    complementDNA = ''
    for d in dna:
        complementDNA+=mapper[d]
    return complementDNA

def get_reverse(strand):
    return strand[::-1]

def get_transcription(strand):
    mapper = {'A':'U'}
    irna = ''
    for d in strand:
        if d == 'A':
            d = 'U'
        irna+=d
    return irna

complement_dna = get_complement(dna)
print(f"CODING STRAND: 5'- {dna} - 3'")
print(f"TEMPLATE STRAND: 3'- {get_reverse(complement_dna)} - 5'")
print(f"Transcript: 5' -{get_transcription(dna)} -3'")
