import os 
import subprocess
from pathlib import Path

# files and path construction
file_name = "fasta.fasta" 
current_directory = os.getcwd()
output_dir = os.path.join(current_directory,'output')
output_filename = "parsed_fasta.fasta"
os.makedirs(output_dir, exist_ok=True)
print(output_dir)

file_path = None

# path to load fasta
for root, dirs, files in os.walk(current_directory):
    for file in files:
        if file == file_name:
            file_path = os.path.join(root, file)
            break
if file_path is None:
    raise FileNotFoundError(f"File {file_name} was not found.")
    
# complete file path
print(file_path)


## fasta parser

# reads line by line, returns dict with key value pair as 
# {header name : sequence}
# remove ">"

def load_fasta(path):
    result = {}
    found_header = False
    current_header = None
    current_sequence = []
    with open(path,'r') as f1:
        for line in f1:
            line = line.strip()
            if line.startswith('>'):
                if found_header:
                    result[current_header] = "".join(current_sequence)
                current_header = line[1:]
                current_sequence = []
                found_header = True
            else:
                current_sequence.append(line)
        if found_header:
            result[current_header]= "".join(current_sequence)
    return result
       
def save_fasta(path,result):
    with open(os.path.join(output_dir,output_filename),'w') as f1:
        for header,seq in result.items():
            f1.write(f">{header}\n")
            f1.write(f"{seq}\n")
    return path
def open_notepad(path_to_open):
    subprocess.run(['notepad.exe',path_to_open])

results = load_fasta(file_path)
save_file = save_fasta(output_dir,results)
open_notepad(os.path.join(output_dir,output_filename))
