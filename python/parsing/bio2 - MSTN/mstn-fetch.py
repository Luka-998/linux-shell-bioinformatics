from Bio import Entrez

def fetch_myostatin_data():
    Entrez.email = " jasovicluka1@gmail.com "  
    search_term = "myostatin"
    
    # Search for myostatin gene in NCBI Gene database
    handle = Entrez.esearch(db="gene", term=search_term, retmax=5)
    record = Entrez.read(handle)
    handle.close()
    
    # Check results are valid
    if record['IdList']:
        gene_id = record['IdList'][0]  # Get the first gene ID
    else:
        print("No results found for myostatin.")
        return None
    
    # Fetch gene data
    handle = Entrez.efetch(db="gene", id=gene_id, retmode="xml")
    gene_record = Entrez.read(handle)
    handle.close()
    
    return gene_record


gene_data = fetch_myostatin_data()
if gene_data:
    print(gene_data)



