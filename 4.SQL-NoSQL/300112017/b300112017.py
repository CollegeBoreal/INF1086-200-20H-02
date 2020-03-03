# -*- coding: utf-8 -*-
"""
Created on Sat Feb 29 19:58:50 2020

@author: Ador
"""

	# Connecting to MySQL Server and working with a Collection
	from mysqlsh import mysqlx
	

	# La fonction mashup
	def mashup(myDb):
	   # Create a new collection 'my_collection'
	   myColl = myDb.get_collection('import_moto')
	

	   # Accessing an existing table
	   myTable = myDb.get_table('CLIENTS')
	

	   # Find objects from document
	   objs = myColl.find().execute()
	

	   for obj in objs.fetch_all():
	      for moto in obj.moto.moto:
	         print("INSERT INTO CLIENTS (client,nom,prenom) VALUES ('"+client.name.first_name+"', '"+ clients.name.last_name+"')")
	         # Insert SQL Table data
	         myTable.insert([' client,nom,prenom ']).values(clients.name.first_name, clients.name.last_name).execute()
	

	# Connect to server
	mySession = mysqlx.get_session( {
	'host': 'localhost', 'port': 33060,
	'user': 'ador', 'password': 'password'} )
	

	myDb = mySession.get_schema('magasin')
	

	mashup(myDb)
