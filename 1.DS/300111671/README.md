## :pushpin: Requettes:

 ### :one: :Afficher les informations de mon pays le  "Benin" :

```
db.countryinfo.find('_id like :param').limit(1).bind('param','BEN%')
