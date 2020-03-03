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
   myTable = myDb.get_table('PAYS_DE_FABRICATION')

   # Find objects from document
   objs = myColl.find().execute()

   obj = objs.fetch_one()
   for tissu in obj.tissu:
      #print("INSERT INTO TISSUS (tissu, pays_de_fabrication) VALUES ('"+id+"', '"+pays_de_fabrication+"')")
      # Insert SQL Table data
      myTable.insert(['nom','devise']).values(tissu.country, 'usd').execute()

# Connect to server
mySession = mysqlx.get_session( {
'host': 'localhost', 'port': 33060,
'user': 'halima', 'password': 'password'} )

myDb = mySession.get_schema('Hijabfashion')

mashup(myDb)

