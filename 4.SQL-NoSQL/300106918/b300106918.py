
# -*- coding: utf-8 -*-

"""

Created on Tue Jan 21 10:45:03 2020


@author: acer

"""
from mysqlsh import mysqlx

def mashup(myDb):

    myColl = myDb.get_collection('import_cisco')

    myTable = myDb.get_table('PRODUCTS')

    objs = myColl.find().execute()

    for obj in objs.fetch_all():

       for pagination_response_record in obj.product_list.product_name:

         print("INSERT INTO network_IT (PRODUCTS.Nom_produit) VALUES ('"+product_list.type.product_type+"')")

         # Insert SQL Table data

        myTable.insert(['Nom_produit']).values(product_list.type.product_type).execute()

mySession = mysqlx.get_session( {

'host': 'localhost', 'port': 33060,

'user': 'AEK', 'password': 'etudiants_1'} )

myDb = mySession.get_schema('network_IT')

mashup(myDb)
