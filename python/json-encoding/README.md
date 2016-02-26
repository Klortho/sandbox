Run a local server with Node.js's `http-server`, then:

```
bash ./run.sh
```


Results (works as expected):

```
(evn)maloneyc@ncbimac1131:~/temp/json-encoding$ bash ./run.sh
Python 3.4.3
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