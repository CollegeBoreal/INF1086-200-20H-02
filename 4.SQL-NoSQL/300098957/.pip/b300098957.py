import mysqlx

# Connect to server on localhost
session = mysqlx.get_session({
    'host': 'localhost',
    'port': 33060,
    'user': 'etudiants',
    'password': 'etudiants_1'
})

schema = session.get_schema('etudiants')

# Use the collection 'my_collection'
collection = schema.get_collection('import_programs')

# Specify which document to find with Collection.find()
result = collection.find().execute()

# Print document
docs = result.fetch_all()
print(docs)

session.close()
