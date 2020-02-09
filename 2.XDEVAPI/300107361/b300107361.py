# -*- coding: utf-8 -*-
"""
Created on Tue Jan 21 10:53:57 2020

@author: Tochgaly-K.J.Etienne
"""
# Connecting to MySQL Server and working with a Collection
from mysqlsh import mysqlx

# Connect to a Server
mySession = mysqlx.get_session( {
        'host': 'localhost', 'port': 33060,
        'user': 'joker', 'password': 'password'} )

myDb = mySession.get_schema('world_x')

# Create a new Collection
myColl = myDb.create_collection('car_center')

# Insert documents
myColl.add({'_id': '1', 'country': 'Italy', 'Mfr_CommonName': 'Bugatti', 'Model': 'Veyron'}).execute()
myColl.add({'_id': '2', 'country': 'Italy', 'Mfr_CommonName': 'Lamborghini', 'Model': 'Aventador'}).execute()
myColl.add({'_id': '3', 'country': 'Japan', 'Mfr_CommonName': 'Toyota'}).execute()
myColl.add({'_id': '4', 'country': 'USA', 'Mfr_CommonName': 'Jeep', 'Model': 'Wrangler'}).execute()

# Find a document
docs = myColl.find('country like: param1 AND Model < : param2').limit(1).bind('param1', 'I%').bind('param2', 'V%').execute()

# Print document
doc = docs.fetch_one()
print(doc)

myDb.drop_collection('car_center')