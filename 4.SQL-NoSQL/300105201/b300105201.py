# -*- coding: utf-8 -*-
"""
Created on 2020
@author: User
"""

# Connecting to MySQL Server and working with a Collection
from mysqlsh import mysqlx

# La fonction mashup
def mashup(myDb):
   # Create a new collection 'my_collection'
   myColl = myDb.get_collection('instruments')

   # Accessing an existing table
   myTable = myDb.get_table('INSTRUMENTS')

   # Find objects from document
   objs = myColl.find().execute()

   for obj in objs.fetch_all():
      for instruments in obj.music.instruments:
         print("INSERT INTO INSTRUMENTS (Name) VALUES ('"+music.instruments+"')")
         # Insert SQL Table data
         myTable.insert(['Name']).values(music.instruments).execute()

# Connect to server
mySession = mysqlx.get_session( {
'host': 'localhost', 'port': 33060,
'user': 'roland', 'password': 'jacques_1'} )

myDb = mySession.get_schema('musicshop')

mashup(myDb)


