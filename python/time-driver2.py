#!/usr/bin/env python

# This imports just the class definition Time from the module time.py.
# See also time-driver1.py

from time import Time

start = Time(9, 45, 00)
start.print_time()

end = start.increment(1337)
end.print_time()

print 'Is end after start?',
print end.is_after(start)

print 'Using __str__'
print start, end

start = Time(9, 45)
duration = Time(1, 35)
print start + duration
print start + 1337
print 1337 + start

print 'Example of polymorphism'
t1 = Time(7, 43)
t2 = Time(7, 41)
t3 = Time(7, 37)
total = sum([t1, t2, t3])
print total
