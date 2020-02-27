# -*- coding: utf-8 -*-
"""
Created on Tue Jan 21 10:52:48 2020

@author: Ador
"""
<<<<<<< HEAD

=======
>>>>>>> 002815afbd6007dd598bf7d0807f2d84dd2d15b9
# Connecting to MySQL Server and working with a Collection
from mysqlsh import mysqlx

# Connect to a Server
mySession = mysqlx.get_session( {
        'host': 'localhost', 'port': 33060,
        'user': 'magasin', 'password': 'etudiants_1'} )

myDb = mySession.get_schema('world_x')

# Create a new Collection
myColl = myDb.create_collection('magasin')

# Insert documents
myColl.add({'_id': '1', 'couleur': 'Bleu', 'Marque': 'BMW', 'Model': 'F800 GS'}).execute()
myColl.add({'_id': '2', 'couleur': 'gris', 'Marque': 'Honda', 'Model': '2650 ABS'}).execute()

# Find a document
docs = myColl.find('couleur like: param1 AND Model like : param2').limit(1).bind('param1', 'B%').bind('param2', 'F%').execute()

# Print document
doc = docs.fetch_one()
print(doc)

myDb.drop_collection('magasin')
<<<<<<< HEAD
=======


>>>>>>> 002815afbd6007dd598bf7d0807f2d84dd2d15b9
