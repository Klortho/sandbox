#!/usr/bin/env python3

# Regular expressions in python
# See https://docs.python.org/2/library/re.html

import re


seq = "ATTGCGTTAG"
if re.search(r"^ATTG[ATGC]+$", seq):
    print("Sequence found")


multiline = ("Now is the time for all good men\n"
             "to come to the aid of their country.\n")

# By default, ^ matches the beginning of the whole string, and matches
# don't cross line boundaries:
if re.search(r"^Now.*to", multiline):  # fails
    print("multiline: found 1")

if re.search(r"^to", multiline):       # fails
    print("multiline: found 2")

if re.search(r"^to", multiline, re.M):  # succeeds (re.M == re.MULTILINE)
    print("multiline: found 3")

if re.search(r"^Now.*to", multiline, re.S):  # succeeds (re.S == re.DOTALL)
    print("multiline: found 4")

# Getting the part of the string that matched
# match() and search() return `None` when there is no match
match = re.search(r"CGT([AT]+)", seq)
if match:
    print("Match: " + match.group() + ", from [" + str(match.start()) + ", " +
          str(match.end()) + "]")
    print("  group 1: " + match.group(1) + ", from [" + str(match.start(1)) + ", " +
          str(match.end(1)) + "]")

# But you can't do this:
#if match = re.search("AT", seq):
#    print(match.group())

# Splitting a string
print("Split: " + str(re.split("T", seq)))

# Finding all matches
print(re.findall(r"[AT]{2,5}", seq))  # Return a list of string
for m in re.finditer(r"[AT]{2,5}", seq):  # Returns a list of match objects
    print("  match: '" + m.group() + "' at [" + str(m.start()) + ", " + 
          str(m.end()) + "]")