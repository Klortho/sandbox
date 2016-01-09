#!/usr/bin/env python

# This imports the module time.py, which contains a definition of
# the class Time. Every use of `Time` has to be prefixed by `time.`.
# See also time-driver2.py

import time

# Of course, you could "manually import" the class def this way:
#Time = time.Time

start = time.Time(9, 45, 00)
start.print_time()

end = start.increment(1337)
end.print_time()

print 'Is end after start?',
print end.is_after(start)

print 'Using __str__'
print start, end

start = time.Time(9, 45)
duration = time.Time(1, 35)
print start + duration
print start + 1337
print 1337 + start

print 'Example of polymorphism'
t1 = time.Time(7, 43)
t2 = time.Time(7, 41)
t3 = time.Time(7, 37)
total = sum([t1, t2, t3])
print total
