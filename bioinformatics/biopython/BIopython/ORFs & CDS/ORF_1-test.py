from Bio import Entrez,SeqIO,SeqUtils, SeqRecord
from Bio.Seq import Seq
import os
Entrez.email = 'jasovicluka1@gmail.com'
handle = Entrez.esearch(db='nucleotide',term='E. coli', retmax=100,idtype='acc')
record = Entrez.read(handle,'gb')
handle.close()

id_list = record['IdList']
id_list
selected_ids = []
for i,id in enumerate(id_list):
    selected_ids = id_list[17]
print(f'My selected ID: {selected_ids}')

fetch = Entrez.efetch(db='nucleotide',id=selected_ids,rettype='gb',retmode='text')
read = SeqIO.read(fetch,'gb')
handle.close()
record_1 = read.seq
print(len(record_1))


with open('ORF_1.txt','r') as file:
    record = SeqIO.read(file,"fasta")
sequence = record.seq

#START:ATG STOP:TAA, TGA TAG

reverse_complement = sequence.reverse_complement()
reverse_complement
def orf_reader(sequence,found_item=True):
    rfs1 =[[],[],[]]
    for i in [0,1,2]:
        found_item= False
        current_frame = []
        for j in range(i,len(sequence) -2,3):
            codons = str(sequence[j:j+3])                        
            if codons == 'ATG' and not found_item:
                current_frame =['ATG']
                found_item = True
                continue # to escape adding 2x ATG
            if found_item:
                current_frame.append(codons)
                if codons in ['TAA','TAG','TGA']:
                    rfs1[i].append(current_frame)
                    current_frame = []
                    found_item = False

    
    return rfs1

results = orf_reader(sequence,found_item=True)
results_frame0=orf_reader(sequence,found_item=True)[0]
print(results_frame0)
print(f"total len: {len([[results]])} and len of 1st frame {len(results_frame0)}")





#orf_reader(sequence)


# Sta hocu da uradim
# funckija koja ce da procita sve sto je storovano iz sequence , i reverse complement 