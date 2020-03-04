# -*- coding: utf-8 -*-
"""
Created on Thu Feb 13 11:50:15 2020

@author: THK
"""
# Connecting to MySQL Server and working with a Collection
from mysqlsh import mysqlx

# La fonction mashup
def mashup(myDb):
    # Create a new collection 'my_collection'
    myColl = myDb.get_collection('Carte_graphique')
    
    # Accessing an existing table
    myTable = myDb.get_table('MARCHANDISES')
    
    # Find objects from document
    objs = myColl.find().execute()
    
    for obj in objs.fetch_all():
        for marchandise in obj.marchandise:
            print("INSERT INTO MARCHANDISES (nom_marchandise) VALUES ('"+marchandise+"')")
            myTable.insert(['nom_marchandise']).values(marchandise).execute()
        
            
# Connect to Server
mySession = mysqlx.get_session( {
        'host': 'localhost', 'port': 33060,
        'user': 'THK', 'password': 'password'})
    
myDb = mySession.get_schema('Carte_graphique')

mashup(myDb)
