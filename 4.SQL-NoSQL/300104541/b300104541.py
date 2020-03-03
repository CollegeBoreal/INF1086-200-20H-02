# -*- coding: utf-8 -*-
"""
Created on 2020
@author: Amichia
"""

# Connecting to MySQL Server and working with a Collection
from mysqlsh import mysqlx

# La fonction mashup
def mashup(myDb):
   # Create a new collection 'my_collection'
   myColl = myDb.get_collection('products')

   # Accessing an existing table
   myTable = myDb.get_table('JEUX')

   # Find objects from document
   objs = myColl.find().execute()

   for obj in objs.fetch_all():
      for label in obj.semantics.label:
         print("INSERT INTO JEUX (Categorie) VALUES ('"+semantics.label"')")
         # Insert SQL Table data
         myTable.insert([Categorie]).values(semantics.label).execute()

# Connect to server
mySession = mysqlx.get_session( {
'host': 'localhost', 'port': 33060,
'user': 'Amichia', 'password': 'password'} )

myDb = mySession.get_schema('Jeuxvideos')

mashup(myDb)
