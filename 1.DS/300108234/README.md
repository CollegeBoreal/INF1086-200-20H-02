
## :pushpin: Requettes:

 ### :one: R1: Afficher les informations du pays "Maroc" :

```
db.countryinfo.find('_id like :param').limit(1).bind('param','MAR%')
```
