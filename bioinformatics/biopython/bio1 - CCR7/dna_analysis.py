from Bio import Entrez, SeqIO
from Bio.SeqUtils import gc_fraction

Entrez.email = ' jasovicluka1@gmail.com '
genbank_id ='NM_001301717.2'
handle=Entrez.efetch(db='nucleotide', id=genbank_id, rettype='gb',retmode='text')
record = SeqIO.read(handle,"genbank")
handle.close()



sequence = record.seq
gc_content = gc_fraction(sequence) * 100 # To convert it to precentage 
print(f"Fetched {record.id}: {record.description}")
print(f"Sequence length: {len(sequence)}")
print(f"GC-content: {gc_content:.2f}%")

# Translation to protein structure:

protein_sequence = sequence.translate(to_stop=True)
print(f"Translated protein sequence: {protein_sequence}")

with open("dna_analysis_results.txt", "w") as f:
    f.write(f"Gene: {record.id} ({record.description})\n")
    f.write(f"Sequence Length: {len(sequence)}\n")
    f.write(f"GC-content: {gc_content:.2f}%\n")
    f.write(f"Protein Sequence: {protein_sequence}\n")

print("Analysis saved to dna_analysis_results.txt")