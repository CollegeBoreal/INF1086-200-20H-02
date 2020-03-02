

# Connecting to MySQL Server and working with a Collection
from mysqlsh import mysqlx

#
def connect():
  return mysqlx.get_session( { 'host': 'localhost', 'port': 33060, 'user': 'etudiants', 'password': 'etudiants_1'} )

# Connect to DB
def dbConnect(session, myDb):
  return session.get_schema(myDb)

# Create a new collection
def dbCreateCollection(myDb, myCollection):
  return myDb.create_collection(myCollection)

# Insert documents
def dbCRUD(myColl):
  myColl.add({'_type_visa': '1', 'passport': 'diplomatie', 'profession': ambassadeur}).execute()
  myColl.add({'_type_visa': '2', 'passport': 'resident permanent', 'profession': comptable}).execute()
  myColl.add({'_itype_visa': '3', 'passport': 'visiteur', 'profession': menagere}).execute()

# Find a document
def dbFind(myColl):
  return myColl.find('name like :param1 AND age < :param2') \
            .limit(1) \
            .bind('param1','L%') \
            .bind('param2',20) \
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