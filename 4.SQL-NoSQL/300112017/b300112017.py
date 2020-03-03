# -*- coding: utf-8 -*-
"""
Created on Sat Feb 29 19:58:50 2020

@author: Ador
"""

# Connecting to MySQL Server and working with a Collection
from mysqlsh import mysqlx


# La fonction mashup
def mashup(myDb):
    # Create a new collection 'my_collection'
    myColl = myDb.get_collection('Moto')


    # Accessing an existing table
    myTable = myDb.get_table('MODELS')


    # Find objects from document
    objs = myColl.find().execute()


    for obj in objs.fetch_all():
      for data in obj.data:
        print("INSERT INTO MODELS (Models) VALUES ('"+data.name+"')")
        # Insert SQL Table data
        myTable.insert(['Models']).values(data.name).execute()


# Connect to server
mySession = mysqlx.get_session( {
'host': 'localhost', 'port': 33060,
'user': 'ador', 'password': 'password'} )


myDb = mySession.get_schema('magasin')


mashup(myDb)
