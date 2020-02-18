# Projet no sql



### :zero: Administration 

- [ ] Créer votre base de données [MySQL/Server](../3.ETL/.docs/MySQLDS.md)


- [ ] Assurez vous qu'il utilise un volume pour importer de nouvelles données


- [ ] Créer l'utilisateur permettant d'accéder au Document Store (DCL)



### :one: Migration

- [ ] Récupérer votre ancien projet [SQL](https://github.com/CollegeBoreal/INF1006-202-19A-01/tree/master/4.DML)


- [ ] Importer votre base de données SQL


### :two: E.T.L

- [ ] Chercher des données `json` correspondant à votre domaine d'activités


- [ ] Importer ces données dans vos propres collections


### :three: Scripting avec API

:bulb: En vous aidant de python, démontrer que vous utilisez le XDEVAPI

:pushpin: Nom de fichier votre :id: précéder par un b

:pushpin: avec un nom de fonction nommé

```python
def mashup(myDb):

```


- [ ] La fonction `mashup` doit gérer une table produite par des collections


- [ ] ` ou ` La fonction `mashup` doit créer une collection produite par des collections `importées `


### :four: Modelisation

:bulb: À l'aide de MySQL Workbench,

- [ ] présenter votre modèle relationel


- [ ] présenter votre modèle présentant les collections `dans un dossier`



### :five: Backup

- [ ] Sauvegarder la base de données dans un fichier SQL nommé :id:-dump.sql

```
$ docker exec some-mysqlds \
    sh -c 'exec mysqldump --user root -p"$MYSQL_ROOT_PASSWORD" world_x ' \
    > ~/Developer/INF1086-200-20H-02/4.SQL-NoSQL/300098957/300098957-dump.sql
```

### :o: Présenter le tout dans un fichier README.md

# [Participation](.scripts/Participation.md)


# References

[Learn API Documentation with JSON and XML](https://www.linkedin.com/learning/learn-api-documentation-with-json-and-xml)

