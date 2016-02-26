Run a local server with Node.js's `http-server`, then:

```
virtualenv -p python3 env
. env/bin/activate
pip install requests
./run.sh
```

Results show that the library works as expected. It honor the content-type
header of the server, which, for the iso-8859 responses, is wrong. It has no
problem interpreting UTF-8 json data, and json data that uses json's `\uxxxx`
encoding, or in writing it to the output file.

```
$ ./run.sh
#!/bin/bash -v

python --version
Python 3.4.3

curl -s -I http://localhost:8080/i-iso-8859.json | grep charset
content-type: application/json; charset=utf-8
curl -s -I http://localhost:8080/i-utf8.json | grep charset
content-type: application/json; charset=utf-8
curl -s -I http://localhost:8080/i-json.json | grep charset
content-type: application/json; charset=utf-8


#############################################
# Run with UTF-8 locale
export LC_ALL=en_US.UTF-8
python get.py
mv results.txt results-lc-utf8.txt
cat results-lc-utf8.txt
file: i-iso-8859.json
  r.encoding: utf-8
  r.text: "�"
  r.json(): �
  After encoding=utf8, r.json(): �
file: i-utf8.json
  r.encoding: utf-8
  r.text: "í"
  r.json(): í
  After encoding=utf8, r.json(): í
file: i-json.json
  r.encoding: utf-8
  r.text: "\u00ed"
  r.json(): í
  After encoding=utf8, r.json(): í
file: A-iso-8859.json
  r.encoding: utf-8
  r.text: "�"
  r.json(): �
  After encoding=utf8, r.json(): �
file: A-utf8.json
  r.encoding: utf-8
  r.text: "Ã"
  r.json(): Ã
  After encoding=utf8, r.json(): Ã
file: A-json.json
  r.encoding: utf-8
  r.text: "\u00c3"
  r.json(): Ã
  After encoding=utf8, r.json(): Ã

#############################################
# Run with default (ASCII) locale

export LC_ALL=
python get.py
mv results.txt results-lc-ascii.txt
cat results-lc-ascii.txt
file: i-iso-8859.json
  r.encoding: utf-8
  r.text: "�"
  r.json(): �
  After encoding=utf8, r.json(): �
file: i-utf8.json
  r.encoding: utf-8
  r.text: "í"
  r.json(): í
  After encoding=utf8, r.json(): í
file: i-json.json
  r.encoding: utf-8
  r.text: "\u00ed"
  r.json(): í
  After encoding=utf8, r.json(): í
file: A-iso-8859.json
  r.encoding: utf-8
  r.text: "�"
  r.json(): �
  After encoding=utf8, r.json(): �
file: A-utf8.json
  r.encoding: utf-8
  r.text: "Ã"
  r.json(): Ã
  After encoding=utf8, r.json(): Ã
file: A-json.json
  r.encoding: utf-8
  r.text: "\u00c3"
  r.json(): Ã
  After encoding=utf8, r.json(): Ã
```
