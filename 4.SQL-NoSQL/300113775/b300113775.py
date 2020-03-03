# -*- coding: utf-8 -*-
"""
Created on 2020
@author: 300113775
"""

# Connecting to MySQL Server and working with a Collection
from mysqlsh import mysqlx

# La fonction mashup
def mashup(myDb):
   # Create a new collection 'my_collection'
   myColl = myDb.get_collection('photographie')

   # Accessing an existing table
   myTable = myDb.get_table('IMAGES')

   # Find objects from document
   objs = myColl.find().execute()

   for obj in objs.fetch_all():
      for description in obj.description:
         print("INSERT INTO IMAGES (Images) VALUES ('"+description+"')")
         # Insert SQL Table data
         myTable.insert(['Images']).values(description).execute()

# Connect to server
mySession = mysqlx.get_session( {
'host': 'localhost', 'port': 33060,
'user': 'widby', 'password': 'Password123'} )

myDb = mySession.get_schema('widesign')

mashup(myDb)
