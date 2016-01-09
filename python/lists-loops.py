#!/usr/bin/env python3

apes = ["Homo sapiens", "Pan troglodytes", "Gorilla gorilla", "Pan paniscus", 
        "Gorilla beringei", ]
conserved_sites = [24, 56, 132]
len(conserved_sites)             #=> 3

# Print out an array slice: the first two elements:
print(apes[0:2])

# What is the index number of this element?
print("Index of chimps: " + str(apes.index("Pan troglodytes")))

# Count backwards from the end
print("Second from the end: " + str(apes[-2]))

# Use append method to add an item or items:
apes.append("Pongo borneo")


# Concatenate two lists:
monkeys = ["Papio ursinus", "Macaca mulatta"]
primates = apes + monkeys

# Length of list:
print("Number of primates: " + str(len(primates)))

# sort and reverse
# Note that the
primates.sort()
print("Sorted: " + str(primates))
primates.reverse()
print("Reversed: " + str(primates))


# For loop
for i in range(5):
    print(i)
for ape in apes:
    print(ape + " is an ape")
for c in "Chris":
    print(c)

# Splitting a string
words = "You and me are going to go round and round".split()
print(str(words))
tokens = "fee,fie,foo,fum".split(',')
print(str(tokens))
