# https://www.programiz.com/python-programming/json

import json
with open('mp3.json') as f:
  data = json.load(f)
# Output: {'name': 'Bob', 'languages': ['English', 'Fench']}
print(data)
