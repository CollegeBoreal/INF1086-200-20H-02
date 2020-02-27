# -*- coding: utf-8 -*-
"""
Created on Thu Feb 13 09:46:51 2020

@author: Tochgaly-K.J.Etienne
"""

# Connecting to MySQL Server and working with a Collection
from mysqlsh import mysqlx

# La fonction mashup
def mashup(myDb):
    # Create a new collection 'Cars'
    myColl = myDb.get_collection('cars')
    
    # Accessing an existing table
    myTable = myDb.get_table('SERVICES_OFFERED')
    
    # Find objects from document
    objs = myColl.find().execute()
    
    for obj in objs.fetch_all():
        for Carz in obj.Cars.Carz:
            print("INSERT INTO SERVICES_OFFERED.Country VALUES ('"+Carz.Country+"')")
            myTable.insert(['Country']).values(Carz.Country).execute()
        
            
# Connect to Server
mySession = mysqlx.get_session( {
        'host': 'localhost', 'port': 33060,
        'user': 'joker', 'password': 'password'})
    
myDb = mySession.get_schema('Car_Center')

mashup(myDb)