# -*- coding: utf-8 -*-
"""
Created on 2020

@author: 300098957
"""

# Connecting to MySQL Server and working with a Collection
from mysqlsh import mysqlx

# Connect to server
mySession = mysqlx.get_session( {
'host': 'localhost', 'port': 33060,
'user': 'etudiants', 'password': 'etudiants_1'} )

myDb = mySession.get_schema('etudiants')

# Create a new collection 'my_collection'
myColl = myDb.get_collection('import_students')

# Accessing an existing table
myTable = myDb.get_table('ETUDIANTS')

# Find objects from document
objs = myColl.find().execute()

obj = objs.fetch_one()
while obj:
   c_s = len(obj.students)
   i = 0
   while i < c_s:
     student = obj.students.student[i]
     print("INSERT INTO ETUDIANTS ( initiale, nom ) VALUES ('" + student.name.first_name + "', '" +  student.name.last_name + "')" )
     # Insert SQL Table data
     myTable.insert(['initial','nom']).values(student.name.first_name, student.name.last_name).execute()
     i = i + 1
   obj = objs.fetch_one()


