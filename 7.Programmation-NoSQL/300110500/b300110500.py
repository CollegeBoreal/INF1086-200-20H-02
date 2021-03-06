# -*- coding: utf-8 -*-
"""

@author: 300110500
"""

import json

def charge(fichier):
   with open(fichier) as f:
      return json.load(f)

import mysqlx
session = mysqlx.get_session({
    "host": "localhost",
    "port": 33060,
    "user": "root",
    "password": "password"
})

db = session.get_schema("world_x")



def lecture(fichier):

  # Le nom de la collection temporaire
  nomColl = "temp"

  # Cr�e la collection temporaire maColl
  maColl = db.create_collection(nomColl)

  # charge le fichier dans la variable json
  json = charge(fichier)
    
  # Ajoute le contenu du fichier json dans la collection temporaire maColl
  maColl.add(json).execute()

  # Lis toute les documents convertis de la collection et les stocker dans la variable docs
  docs = maColl.find().execute()

  # D�truit la collection temporaire
  db.drop_collection(nomColl)

  # Retourne un dictionnaire Python du fichier json converti
  return docs

def former_des_chefs(docs):
 
  # Cr�e une nouvelle collection 'chefs_de_gouvernement'
  nomColl = 'chefs_de_gouvernement'
  maColl = db.create_collection(nomColl)

# Ajout manuel
  maColl.add({"HeadOfState": "Marc Ravalomanana","GovernmentForm": "Republic"}).execute()

  # Manipuler la collection et la rajouter � la nouvelle
  for doc in docs.fetch_all():
    for country in doc.countries:
      # Insert des documents JSON de type government
      maColl.add(country['government']).execute()

  # Trouver tous les documents JSON et les mettre en m�moire
  docs = maColl.find().execute()

# D�truit la collection
  #db.drop_collection(nomColl)


  return docs

def former_des_regions(docs):

  # Cr�e une nouvelle collection 'les_regions'
  nomColl = 'les_regions'
  maColl = db.create_collection(nomColl)

# Ajout manuel
  maColl.add({"Region": "Southern Africa","Continent": "Afrique","SurfaceArea": 1221037}).execute()
  
# Manipuler la collection et la rajouter � la nouvelle
  for doc in docs.fetch_all():
    for country in doc.countries:
      # Insert des documents JSON de type geography
      maColl.add(country['geography']).execute()
  # Trouver tous les documents JSON et les mettre en m�moire
  docs = maColl.find().execute() 

# D�truit la collection
  #db.drop_collection(nomColl)

  return docs

def main():
  docs = lecture('b300110500.json')
  chefs = former_des_chefs(docs)
  regions = former_des_regions(docs)
  print(len(chefs.fetch_all()))
  # Ne pas oublier de remercier le gestionnaire de BD
  session.close

if __name__== "__main__":
    main()


