# -*- coding: utf-8 -*-
"""
Created on Mon Mar  2 17:43:59 2020

@author: djumaster
"""

# Connecting to MySQL Server and working with a Collection
from mysqlsh import mysqlx

# La fonction mashup
def mashup(myDb):
   # Create a new collection 'my_collection'
   myColl = myDb.get_collection('products')

   # Accessing an existing table
   myTable = myDb.get_table('PRODUITS')

   # Find objects from document
   objs = myColl.find().execute()

   for obj in objs.fetch_all():
      for title in obj.mOilCat.title:
         print("INSERT INTO PRODUITS (modele) VALUES ('"+mOilCat.title+"')")
         # Insert SQL Table data
         myTable.insert(['modele']).values(mOilCat.title).execute()

# Connect to server
mySession = mysqlx.get_session( {
'host': 'localhost', 'port': 33060,
'user': 'djumaster', 'password': 'password'} )

myDb = mySession.get_schema('hairasset')

mashup(myDb)


