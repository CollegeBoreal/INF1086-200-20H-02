# -*- coding: utf-8 -*-
"""
Created on Tue Jan 21 10:45:16 2020

@author: halima
"""

# Connecting to MySQL Server and working with a Collection
from mysqlsh import mysqlx

# Connect to server
def connect():
  return mysqlx.get_session( { 'host': 'localhost', 'port': 33060, 'user': 'haliuser', 'password': 'password'} )

# Connect to DB
def dbConnect(session, myDb):
  return session.get_schema(myDb)

# Create a new collection
def dbCreateCollection(myDb, myCollection):
  return myDb.create_collection(myCollection)

# Insert documents
def dbCRUD(myColl):
  myColl.add({'_id': '1', 'country': 'Canada', 'tissue': muslin}).execute()
  myColl.add({'_id': '2', 'country': 'Maroc', 'tissue': coton}).execute()
  myColl.add({'_id': '3', 'country': 'France', 'tissue': Printed}).execute()

# Find a document
def dbFind(myColl):
  return myColl.find('_id like :param').limit(1).bind('param','C%') \
            .limit(1) \
            .bind('param','C%') \
            .execute()

# Drop the collection
def dbDropCollection(myDb, hijabfashion):
  return myDb.drop_collection(hijabfashion)

# Program
def run(myDb, hijabfashion):
  session = connect()
  db = dbConnect(session, myDb)
  col = dbCreateCollection(db, hijabfashion)
  dbCRUD(col)
  docs = dbFind(col)
  # Print document
  doc = docs.fetch_one()
  print(doc)
  dbDropCollection(db, hijabfashion)

# Program
def main():
  myDb = 'world_x'
  myCollection = 'my_collection'
  run(myDb, hijabfashion)

if __name__== "__main__":
    main()
