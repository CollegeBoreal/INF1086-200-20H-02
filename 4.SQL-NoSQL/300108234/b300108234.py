# -*- coding: utf-8 -*-
"""
Created on Tue Jan 21 10:45:16 2020

@author: halima
"""

## Connecting to MySQL Server and working with a Collection
from mysqlsh import mysqlx

# La fonction mashup
def mashup(myDb):
   # Create a new collection 'my_collection'
   myColl = myDb.get_collection('import_hijab')

   # Accessing an existing table
   myTable = myDb.get_table('TISSU')

   # Find objects from document
   objs = myColl.find().execute()

   for obj in objs.fetch_all():
      for tissu in obj.tissu:
         print("INSERT INTO TISSUS (id, type) VALUES ('"+id+"', '"+type+"')")
         # Insert SQL Table data
         myTable.insert(['id','type']).values(tissu.id, tissu.type).execute()

# Connect to server
mySession = mysqlx.get_session( {
'host': 'localhost', 'port': 33060,
'user': 'halima', 'password': 'password'} )

myDb = mySession.get_schema('Hijabfashion')

mashup(myDb)

