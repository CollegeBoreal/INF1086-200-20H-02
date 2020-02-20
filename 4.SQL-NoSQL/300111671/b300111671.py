# -*- coding: utf-8 -*-
"""
Created on Wed Feb 19 18:43:39 2020

@author: LENOVO
"""

from mysqlsh import mysqlx 

# Connect to a Server
mySession = mysqlx.get_session( {
        'host': 'localhost', 'port': 33060,
        'user': 'abbas', 'password': 'password'} )

myDb = mySession.get_schema('Boubou')

# Create a new Collection
myColl = myDb.create_collection('Boubou2')

# Insert documents
myColl.add({'_id': '1', 'COULEUR': 'noir', 'GENRE': 'dashiki', 'QUANTITE':'1 a 3'}).execute()
myColl.add({'_id': '2', 'COULEUR': 'bleu', 'GENRE': 'alabe', 'QUANTITE': '1 douzaine'}).execute()

# Find a document
docs = myColl.find('COULEUR like: param').limit(1).bind('param', 'noir').execute()

# Print document
doc = docs.fetch_one()
print(doc)

myDb.drop_collection('Boubou2')
