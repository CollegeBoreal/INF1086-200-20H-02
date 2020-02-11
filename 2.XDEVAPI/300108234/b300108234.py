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
  myColl.add({'_id': '1', 'name': 'Canada', 'code_postal': 1234}).execute()
  myColl.add({'_id': '2', 'name': 'USA', 'code_postal': 2345}).execute()
  myColl.add({'_id': '3', 'name': 'France', 'code_postal': 6789}).execute()

# Find a document
def dbFind(myColl):
  return myColl.find('_id like :param').limit(1).bind('param','C%') \
            .limit(1) \
            .bind('param','C%') \
            .execute()

# Drop the collection
def dbDropCollection(myDb, myCollection):
  return myDb.drop_collection(myCollection)

# Program
def run(myDb, myCollection):
  session = connect()
  db = dbConnect(session, myDb)
  col = dbCreateCollection(db, myCollection)
  dbCRUD(col)
  docs = dbFind(col)
  # Print document
  doc = docs.fetch_one()
  print(doc)
  dbDropCollection(db, myCollection)

# Program
def main():
  myDb = 'world_x'
  myCollection = 'my_collection'
  run(myDb, myCollection)

if __name__== "__main__":
    main()
