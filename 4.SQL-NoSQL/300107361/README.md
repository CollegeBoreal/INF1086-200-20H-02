# GAME ON 

# Projet

:bulb: Dans votre propre répertoire c.f. :id:

### :zero: Administration 

- [ ] Créer votre base de données [MySQL/Server](../3.ETL/.docs/MySQLDS.md)

- [ ] Assurez vous qu'il utilise un volume pour importer de nouvelles données


- [ ] Créer l'utilisateur permettant d'accéder au Document Store (DCL)


* Lancer `PS> pwd` pour avoir le path du fichier pour vous assurez qu'il utilise un volume: 

```
 docker container run `
         --name some-mysqlds `
         --env MYSQL_ROOT_PASSWORD=password `
         --publish 3306:3306 `
         --publish 33060:33060 `
         --volume C:\Users\Tochgaly-K.J.Etienne\developer\INF1086-200-20H-02\4.SQL-NoSQL\300107361:/var/lib/mysql-files `
         --detach `
         mysql/mysql-server:latest
```

* Creer l'utilisateur permettant d'acceder au Document Store

```
mysql> CREATE USER 'joker'@'%' IDENTIFIED BY 'password';
mysql> GRANT ALL ON car_center.* TO 'joker'@'%';
```

### :one: Migration

- [ ] Récupérer votre ancien projet [SQL](https://github.com/CollegeBoreal/INF1006-202-19A-01/tree/master/4.DML)
```
$  docker container exec --interactive some-mysqlds sh -c \
>           ' exec mysql --user root -ppassword --execute "CREATE DATABASE Car_Center;" '

mysql: [Warning] Using a password on the command line interface can be insecure.
```

- [ ] Importer votre base de données SQL
 ```
$ docker container exec --interactive some-mysqlds sh -c           ' exec mysql --user root -ppassword '            < ~/developer/INF1006-202-19A-01/Q.Query/300107361/300107361-schema.sql

mysql: [Warning] Using a password on the command line interface can be insecure.
```
### :two: E.T.L

- [ ] Chercher des données `json` correspondant à votre domaine d'activités


- [ ] Importer ces données dans vos propres collections
```
util.importJson("/var/lib/mysql-files/car.json", {schema: "Car_Center", collection: "cars"})
```

### :three: Scripting avec API

:bulb: En vous aidant de python, démontrer que vous utilisez le XDEVAPI

:pushpin: Nom de fichier votre :id: précéder par un b

:pushpin: avec un nom de fonction nommé

```python
def mashup():

```


- [ ] La fonction `mashup` doit créer une table produite par des collections


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
