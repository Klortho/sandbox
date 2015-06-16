# summarize_fasta.py

gene_count = 0
min_protein_length = -1
max_protein_length = -1
protein_length_sum = 0
hypothetical_count = 0

in_header = True
this_protein_length = 0
with open("e_coli_k12_dh10b.faa") as fasta:
    for _line in fasta:
        line = _line.rstrip('\n')
        if line.startswith('>'):

            if in_header:
                in_header = False

            else:
                if (min_protein_length != -1 and 
                    min_protein_length > this_protein_length):
                    min_protein_length = this_protein_length
                if (max_protein_length != -1 and
                    max_protein_length < this_protein_length):
                    max_protein_length = this_protein_length


            gene_count = gene_count + 1
            this_protein_length = 0
            print(": " + line)

