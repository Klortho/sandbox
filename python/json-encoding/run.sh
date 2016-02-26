#!/bin/bash -v

python --version


#############################################
# Run with UTF-8 locale
export LC_ALL=en_US.UTF-8
python get.py
mv results.txt results-lc-utf8.txt
cat results-lc-utf8.txt

#############################################
# Run with default (ASCII) locale

export LC_ALL=
python get.py
mv results.txt results-lc-ascii.txt
cat results-lc-ascii.txt

