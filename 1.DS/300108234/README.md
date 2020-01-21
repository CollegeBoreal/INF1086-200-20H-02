
## :pushpin: Requettes:

 ### :one: R1: Afficher les informations du pays "Maroc" :
 
```
db.countryinfo.find('_id like :param').limit(1).bind('param','MAR%')
```

### :two: R2: Afficher l'espérance de vie des pays qu'ils arrivent à 80% :

```
db.countryinfo.find('demographics.LifeExpectancy like :param').bind('param','80%')
```
