#!/usr/bin/env python

from operator import attrgetter, itemgetter
from functools import partial, reduce
from functional import compose
import sys


class TestClass:
    def __init__(self, data):
        self.data = data
    # mock "validate" method
    def validate(self, valid):
        self.valid = valid
        return self
    def is_valid(self):
        return bool(self.valid)

ta = TestClass('a').validate(True)
test_object_list = [
    ta,
    TestClass('b').validate(False),
    TestClass('c').validate(True)
]


#---------------------------------------------------------------------------
# Function composition

f = '-{}-'.format
g = '>{}<'.format
print('Function composition: ' + compose(f, g)('fleegle'))  #=> ->fleegle<-

#---------------------------------------------------------------------------
# Attribute getter function

get_data = attrgetter('data')
print('Attribute getter function: ' + get_data(ta))

#---------------------------------------------------------------------------
# String format as a function

numsums = map( 'number {}'.format, [0, 1, 2, 3] )
print('Number list: ' + ', '.join(numsums))

#---------------------------------------------------------------------------
# Function to format a list of numbers

mapper = partial(map, 'number {}'.format)
numlist_formatter = compose(', '.join, mapper)
print('Number list: ' + numlist_formatter([4, 5, 6, 7]))

#---------------------------------------------------------------------------
# Function to format data extracted from a list of objects

datalist_summary = compose(
    ', '.join,
    partial(map, compose('data: {}'.format, get_data))
)
print('Object list data: ' + datalist_summary(test_object_list))


#---------------------------------------------------------------------------
# Filtering using an object method

# Note that in the filter call, we just reference the method without any lambda
valids = filter(TestClass.is_valid, test_object_list)
print('Filtered: ' + datalist_summary(valids))

#---------------------------------------------------------------------------
# Filtering, more functional

summarize_valids = compose(
    datalist_summary,
    partial(filter, TestClass.is_valid)
)
print('Filtered: ' + summarize_valids(test_object_list))

#---------------------------------------------------------------------------
# Using a constructor in `map` to create a list of objects

tests = map(TestClass, ['Z', 5, {'type': 6}, 'hello'])
print('New object list: ' + datalist_summary(tests))


#---------------------------------------------------------------------------
global_items = list(globals().items())

pluck_name = itemgetter(0)
is_system = lambda name: name.startswith('__') and name.endswith('__')

pluck_names = partial(map, pluck_name)
filter_system = partial(filter, is_system)
system_names = compose(filter_system, pluck_names)

for name in system_names(global_items):
    print(name + ': ' + str(is_system(name)))
