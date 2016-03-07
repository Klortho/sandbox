This snippet is a test of Python's requests module, and how it handles encoding
of various JSON responses, and how that might interact with the user's
locale setting.

The results show that the library works as expected. It honors the content-type
header of the server, which always includes (for the server I was running)
`charset=utf-8`. Note that for the iso-8859 responses, this is wrong.
The python library has no
problem interpreting UTF-8 json data, and json data that uses json's `\uxxxx`
encoding, or in writing it correctly to the output file.

Run a local server with Node.js's `http-server`, then:

```
virtualenv -p python3 env
. env/bin/activate
pip install requests
./run.sh
```

Results:
=======

```
Python 3.4.3
HTTP responses
    i-iso-8859.json: content-type: application/json; charset=utf-8
    i-utf8.json: content-type: application/json; charset=utf-8
    i-json.json: content-type: application/json; charset=utf-8
LOCALE UTF-8
    file: i-iso-8859.json
        Before encoding=utf8
            r.encoding: utf-8
            r.text: "�"
            r.json(): �
        After encoding=utf8
            r.encoding: utf-8
            r.text: "�"
            r.json(): �
    file: i-utf8.json
        Before encoding=utf8
            r.encoding: utf-8
            r.text: "í"
            r.json(): í
        After encoding=utf8
            r.encoding: utf-8
            r.text: "í"
            r.json(): í
    file: i-json.json
        Before encoding=utf8
            r.encoding: utf-8
            r.text: "\u00ed"
            r.json(): í
        After encoding=utf8
            r.encoding: utf-8
            r.text: "\u00ed"
            r.json(): í
    file: A-iso-8859.json
        Before encoding=utf8
            r.encoding: utf-8
            r.text: "�"
            r.json(): �
        After encoding=utf8
            r.encoding: utf-8
            r.text: "�"
            r.json(): �
    file: A-utf8.json
        Before encoding=utf8
            r.encoding: utf-8
            r.text: "Ã"
            r.json(): Ã
        After encoding=utf8
            r.encoding: utf-8
            r.text: "Ã"
            r.json(): Ã
    file: A-json.json
        Before encoding=utf8
            r.encoding: utf-8
            r.text: "\u00c3"
            r.json(): Ã
        After encoding=utf8
            r.encoding: utf-8
            r.text: "\u00c3"
            r.json(): Ã
LOCALE US-ASCII
    file: i-iso-8859.json
        Before encoding=utf8
            r.encoding: utf-8
            r.text: "�"
            r.json(): �
        After encoding=utf8
            r.encoding: utf-8
            r.text: "�"
            r.json(): �
    file: i-utf8.json
        Before encoding=utf8
            r.encoding: utf-8
            r.text: "í"
            r.json(): í
        After encoding=utf8
            r.encoding: utf-8
            r.text: "í"
            r.json(): í
    file: i-json.json
        Before encoding=utf8
            r.encoding: utf-8
            r.text: "\u00ed"
            r.json(): í
        After encoding=utf8
            r.encoding: utf-8
            r.text: "\u00ed"
            r.json(): í
    file: A-iso-8859.json
        Before encoding=utf8
            r.encoding: utf-8
            r.text: "�"
            r.json(): �
        After encoding=utf8
            r.encoding: utf-8
            r.text: "�"
            r.json(): �
    file: A-utf8.json
        Before encoding=utf8
            r.encoding: utf-8
            r.text: "Ã"
            r.json(): Ã
        After encoding=utf8
            r.encoding: utf-8
            r.text: "Ã"
            r.json(): Ã
    file: A-json.json
        Before encoding=utf8
            r.encoding: utf-8
            r.text: "\u00c3"
            r.json(): Ã
        After encoding=utf8
            r.encoding: utf-8
            r.text: "\u00c3"
            r.json(): Ã
```
