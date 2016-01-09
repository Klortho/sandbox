#!/usr/bin/env python3

level = 3
if level > 15:
    print("Woah!")
elif level < 0:
    print("Dag!")
else:
    print("Meh")

count = 1
while count < 10:
    print(count)
    count = count + 1   # Note, no `++` operator!
