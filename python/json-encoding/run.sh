#!/bin/bash

python --version

echo "HTTP responses"
for f in i-iso-8859.json i-utf8.json i-json.json
do
  printf "    $f: "
  echo `curl -s -I http://localhost:8080/$f | grep charset`
done


#############################################
# Run with UTF-8 locale
export LC_ALL=en_US.UTF-8
echo 'LOCALE UTF-8'
python get.py
cat results.txt

#############################################
# Run with default (ASCII) locale

export LC_ALL=en_US.ASCII
echo 'LOCALE US-ASCII'
python get.py
cat results.txt

