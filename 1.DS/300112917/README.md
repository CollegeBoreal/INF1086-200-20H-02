# Requete FIND

Trouver le pays qui a pris son abbreviation US

```
world_x  JS > db.countryinfo.find('_id like :param').limit(2).bind('param' ,'Z%')

 ```
