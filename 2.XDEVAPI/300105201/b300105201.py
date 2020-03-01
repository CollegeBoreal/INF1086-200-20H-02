# -*- coding: utf-8 -*-
"""
Created on Tue Jan 21 10:45:16 2020
@author: Jacques
"""

# Connecting to MySQL Server and working with a Collection
from mysqlsh import mysqlx

# Connect to server
def connect():
  return mysqlx.get_session( { 'host': 'localhost', 'port': 33060, 'user': 'yamaha', 'password': 'Jacques'} )

# Connect to DB
def dbConnect(session, myDb):
  return session.get_schema('world_x')

# Create a new collection
def dbCreateCollection(myDb, myCollection):
  return myDb.create_collection(myCollection)

# Insert documents
def dbCRUD(myColl):
  myColl.add({'_id': '1', 'name': 'Yamaha', 'model': DGX-660}).execute()
  myColl.add({'_id': '2', 'name': 'Roland', 'model': DGZ-800}).execute()
  myColl.add({'_id': '3', 'name': 'Casio', 'model': DGX-750}).execute()

# Find a document
def dbFind(myColl):
  return myColl.find('name like :param1 AND model < :param2') \
            .limit(1) \
            .bind('param1','Y%') \
            .bind('param2','DGX%') \
            .execute()

# Drop the collection
def dbDropCollection(myDb, myCollection):
  return myDb.drop_collection(musicshop)

# Program
def run(myDb, myCollection):
  session = connect()
  db = dbConnect(session, myDb)
  col = dbCreateCollection(db, musicshop)
  dbCRUD(col)
  docs = dbFind(col)
  # Print document
  doc = docs.fetch_one()
  print(doc)
  dbDropCollection(db, musicshop)

# Program
def main():
  myDb = 'world_x'
  myCollection = 'musichop'
  run(myDb, musichop)

if __name__== "__main__":
    main()