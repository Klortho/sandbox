#!/usr/bin/env python

dna_file = open("dna.txt")
dna = dna_file.read().rstrip('\n')   # rstrip is like chomp
print("Sequence = " + dna + ".")
dna_file.close()

# Open a file for writing
out = open("my_output.txt", "w")
out.write("And that's all she wrote.\n")
out.close()

# To read a file one line at a time:
with open('dna.txt') as dna:
    for line in dna:
        print('"' + line.rstrip('\n') + '"')
dna.close()
