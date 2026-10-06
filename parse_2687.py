import json

with open('metadata_2687.json', 'r', encoding='utf-8') as f:
    d = json.load(f)

text = d['result']['content'][0]['text']
lines = text.splitlines()

with open('parsed_2687.txt', 'w', encoding='utf-8') as out:
    out.write(lines[0] + '\n')
    for line in lines:
        if line.startswith('  <frame ') or line.startswith('    <frame '):
            out.write(line[:140] + '\n')

print("Done parsing 2687")
