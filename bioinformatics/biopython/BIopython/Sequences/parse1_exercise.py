from Bio.Seq import Seq
from Bio import SeqRecord,Entrez, SeqIO
import os
#Fetching gene from genbank

Entrez.email ='jasovicluka1@gmail.com'
handle = Entrez.esearch(db='nucleotide',retmax = 10, term='Yersinia pestis biovar Microtus',idtype='acc')
record = Entrez.read(handle)
print(record)

id_list = record['IdList']

print(id_list)

first_five = id_list[:5]
results = []
print(first_five)
for i in first_five:
    fetch_handle = Entrez.efetch(db='nucleotide', id=i,rettype='gb',retmode='text')
    e_record = SeqIO.read(fetch_handle,format='gb')
    fetch_handle.close()
    results.append(e_record)

record_1 =results[0]
print(record_1)
print(record_1.seq,record_1.id)

for path,dir,files in os.walk(os.getcwd()):
    print(path,dir,files)
    fullpath = os.path.join(path,'record_1_seq.txt')
    isExist = os.path.exists(fullpath)
    if isExist:
        print('File already exists!')
    else:
        print("No, but I will make it")
        with open("record_1_seq.txt",'w') as file_1:
            SeqIO.write(record_1,file_1,'fasta')
            print(os.getcwd())


