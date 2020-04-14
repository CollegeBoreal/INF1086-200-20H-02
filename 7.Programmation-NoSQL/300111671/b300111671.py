
# -*- coding: utf-8 -*-
"""

@author: AbbasSadissou
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

  # Crée la collection temporaire maColl
  maColl = db.create_collection(nomColl)

  # charge le fichier dans la variable json
  json = charge(fichier)
    
  # Ajoute le contenu du fichier json dans la collection temporaire maColl
  maColl.add(json).execute()

  # Lis toute les documents convertis de la collection et les stocker dans la variable docs
  docs = maColl.find().execute()

  # Détruit la collection temporaire
  db.drop_collection(nomColl)

  # Retourne un dictionnaire Python du fichier json converti
  return docs

def former_des_chefs(docs):

  # Crée une nouvelle collection 'chefs_de_gouvernement'
  nomColl = 'chefs_de_gouvernement'
  maColl = db.create_collection(nomColl)
  
   # Ajout manuel
  maColl.add({"HeadOfState": "Marc Ravalomanana","GovernmentForm": "Republic"}).execute()

  # Manipuler la collection et la rajouter à la nouvelle
  for doc in docs.fetch_all():
    for country in doc.countries:
      # Insert des documents JSON de type government
      maColl.add(country['government']).execute()

  # Trouver tous les documents JSON et les mettre en mémoire
  docs = maColl.find().execute()

  # Détruit la collection
  db.drop_collection(nomColl)
  
  return docs

 
# Create a new collection 'my_collegues'
myColl = db.create_collection('my_collegues')

# Insert documents
myColl.add({'_id': '300110500', 'name': 'Didier', 'age': 29}).execute()
myColl.add({'_id': '3001112917', 'name': 'Djuma', 'age': 35}).execute()
myColl.add({'_id': '300111671', 'name': 'Abbas', 'age': 29}).execute()

# Find a document
docs = myColl.find('name like :param1 AND age < :param2') \
          .limit(1) \
          .bind('param1','L%') \
          .bind('param2',20) \
          .execute()

# Print document
doc = docs.fetch_one()
print(doc)

# Drop the collection
# myDb.drop_collection('my_collection')
  

def main():
  docs = lecture('b000000000.json')
  chefs = former_des_chefs(docs)
  print(len(chefs.fetch_all()))
  # Ne pas oublier de remercier le gestionnaire de BD
  session.close
 

if __name__== "__main__":
    main()


