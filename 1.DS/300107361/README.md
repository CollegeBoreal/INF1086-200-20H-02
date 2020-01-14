# Requete FIND

:1: Trouver un pays qui a pris son independance en 1804
```
world_x  JS > db.countryinfo.find('IndepYear like: param').limit(1).bind('param', '1804')
 ```
