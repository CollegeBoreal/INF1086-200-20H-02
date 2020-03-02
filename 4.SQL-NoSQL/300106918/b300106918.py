
# -*- coding: utf-8 -*-

"""

Created on Tue Jan 21 10:45:03 2020


@author: acer

"""


import mysql.connector
mydb = mysql.connector.connect(
  host="localhost",
  user="AEK",
  passwd="etudiants_1",
  database="network_IT"
)
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
