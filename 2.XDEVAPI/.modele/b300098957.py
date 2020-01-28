# -*- coding: utf-8 -*-
"""
Created on Tue Jan 21 10:44:57 2020

@author: 300098957
"""

# Connecting to MySQL Server and working with a Collection
from mysqlsh import mysqlx

# Connect to server
mySession = mysqlx.get_session( {
'host': 'localhost', 'port': 33060,
'user': 'etudiants', 'password': 'etudiants_1'} )

myDb = mySession.get_schema('world_x')

# Create a new collection 'my_collection'
myColl = myDb.create_collection('my_collection')

# Insert documents
myColl.add({'_id': '1', 'name': 'Laurie', 'age': 19}).execute()
myColl.add({'_id': '2', 'name': 'Nadya', 'age': 54}).execute()
myColl.add({'_id': '3', 'name': 'Lukas', 'age': 32}).execute()

# Find a document
docs = myColl.find('name like :param1 AND age < :param2') \
          .limit(1) \
          .bind('param1','L%') \
          .bind('param2',20) \
          .execute()

# Print document
doc = docs.fetch_one()
print(doc)

# Drop the collection
myDb.drop_collection('my_collection')
