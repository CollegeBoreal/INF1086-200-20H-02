Created on 2020
	
	@author: 300111766
	"""
	

	# Connecting to MySQL Server and working with a Collection
	from mysqlsh import mysqlx
	

	# La fonction mashup
	def mashup(myDb):
	   # Create a new collection 'my_collection'
	   myColl = myDb.get_collection('import_phone')
	

	   # Accessing an existing table
	   myTable = myDb.get_table('vente_portable')
# Accessing an existing table
   myTable = myDb.get_table('MARK')

   # Find objects from document
   objs = myColl.find().execute()

   for obj in objs.fetch_one():
      for MARK in obj.MARK:
         print("INSERT INTO MARK(mark, name) VALUES ('"+mark+"', '"+name+"')")
         # Insert SQL Table data
         myTable.insert(['mark','name']).values(MARK.mark, MARK.name).execute()

# Connect to server
mySession = mysqlx.get_session( {
'host': 'localhost', 'port': 33060,
'user': 'CHEIKH', 'password': 'password'} )

myDb = mySession.get_schema('vente_portable')

mashup(myDb)

