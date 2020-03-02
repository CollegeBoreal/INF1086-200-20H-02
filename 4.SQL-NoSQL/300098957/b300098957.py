# -*- coding: utf-8 -*-
"""
Created on 2020

@author: 300098957
"""

# Connecting to MySQL Server and working with a Collection
import mysqlx



def mashup(myDb):

    myColl = myDb.get_collection('cisco')

    myTable = myDb.get_table('network_IT')

    objs = myColl.find().execute()

    for obj in objs.fetch_all():

      for product_list in obj.cisco.product_list:

         print("INSERT INTO network_IT (Nom_produit, date) VALUES ('"+product_list.type.product_type+"', '"+ product_list.date.release_date+"')")

         # Insert SQL Table data

         myTable.insert(['Nom_produit','date']).values(product_list.type.product_type, product_list.date.release_date).execute()

         mashup(myDb)



