# -*- coding: utf-8 -*-
"""
Created on Tue Jan 21 10:52:47 2020

@author: CHEIKH
"""
# Connecting to MySQL Server and working with a Collection
from mysqlsh import mysqlx

# Connect to server
def connect():
  return mysqlx.get_session( { 'host': 'localhost', 'port': 33060, 'user': 'etudiants', 'password': 'password'} )

# Connect to DB
def dbConnect(session, myDb):
  return session.get_schema(vente_portable)

# Create a new collection
def dbCreateCollection(myDb, myCollection):
  return myDb.create_collection(myCollection)

# Insert documents
def dbCRUD(myColl):
  myColl.add({'_id': '1', 'mark': 'iphone', 'model': 'iphone11'}).execute()
  myColl.add({'_id': '2', 'mark': 'samsung', 'model': 'galaxyS10'}).execute()
  myColl.add({'_id': '3', 'mark': 'motorola', 'model': 'motorolaG7'}).execute()

# Find a document
def dbFind(myColl):
  return myColl.find('mark like :param1 AND model < :param2') \
            .limit(1) \
            .bind('param1','s%') \
            .bind('param2','g%') \
            .execute()

# Print document
doc = docs.fetch_one()
print(doc)

myDb.drop_collection('vente_portable')
