import requests

out = open('results.txt', 'w', encoding='utf-8')
files = [
    'i-iso-8859.json',
    'i-utf8.json',
    'i-json.json',
    'A-iso-8859.json',
    'A-utf8.json',
    'A-json.json',
]
for f in files:
    r = requests.get('http://localhost:8080/' + f)
    out.write('    file: ' + f + '\n')

    out.write('        Before encoding=utf8' + '\n')
    out.write('            r.encoding: ' + r.encoding + '\n')
    out.write('            r.text: ' + r.text + '\n')
    out.write('            r.json(): ' + r.json() + '\n')

    r.encoding = 'utf-8'
    out.write('        After encoding=utf8' + '\n')
    out.write('            r.encoding: ' + r.encoding + '\n')
    out.write('            r.text: ' + r.text + '\n')
    out.write('            r.json(): ' + r.json() + '\n')
