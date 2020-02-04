# MySQL DS

### Docker

https://hub.docker.com/r/mysql/mysql-server/

* Créer le conteneur

```
$ docker container run \
         --name some-mysqlds \
         --env MYSQL_ROOT_PASSWORD=password \
         --publish 3306:3306 \
         --publish 33060:33060 \
         --detach \
         mysql/mysql-server:latest
```

### Charger les données dans la base `world_x`

* Recupérer le fichier SQL

[world_x-db.zip](http://downloads.mysql.com/docs/world_x-db.zip)

* Créer la base de données `world_x`

```
$ docker container exec --interactive some-mysqlds sh -c \
          ' exec mysql --user root -ppassword --execute "CREATE DATABASE world_x;" '
```

* Charger la base de données

```
$ docker container exec --interactive some-mysqlds sh -c \
          ' exec mysql --user root -ppassword world_x ' \
           < ~/Downloads/world_x-db/world_x.sql
```


### mysql shell:

https://dev.mysql.com/doc/mysql-shell/8.0/en/mysql-shell-commands.html

. lancer le CLI (Command Level Interface) de MySQL Shell


[Creation de l'utilisateur etudiant](https://github.com/CollegeBoreal/Tutoriels/tree/master/B.BD/MySQL.md#one-tous-les-ip)

```
# mysqlsh --js --host localhost --user etudiants --password
```

:bulb: socket access avec root

```
# mysqlsh --user root --socket=/var/run/mysqld/mysqlx.sock
```

* le prompt est :

```
 MySQL localhost+ ssl world_x  JS >
```


. Dans le Shell CLI

https://dev.mysql.com/doc/refman/8.0/en/mysql-shell-tutorial-javascript-documents-collections.html

Se connecter a une DB 

```
> \use world_x
```

.. liste des collections de la BD

```
> db.getCollections()
[
    <Collection:countryinfo>
]
```

** afficher tout le contenu de la collection

```
> db.countryinfo.find()
```

** une partie de la collection

```
> db.countryinfo.find('_id like :param').limit(1).bind('param','Z%')
{
    "GNP": 116729,
    "_id": "ZAF",
    "Name": "South Africa",
    "IndepYear": 1910,
    "geography": {
        "Region": "Southern Africa",
        "Continent": "Africa",
        "SurfaceArea": 1221037
    },
    "government": {
        "HeadOfState": "Thabo Mbeki",
        "GovernmentForm": "Republic"
    },
    "demographics": {
        "Population": 40377000,
        "LifeExpectancy": 51.099998474121094
    }
}
1 document in set (0.0008 sec)
```

** une partie plus fine de la collection

```
> db.countryinfo.find('geography.Continent like :param').bind('param','Afri%')
```

.. Creer d'autres collections

https://dev.mysql.com/doc/x-devapi-userguide/en/working-with-collections-basic-crud.html


# :b: Créer le conteneur avec un volume

```
$ docker container run \
         --name some-mysqlds \
         --env MYSQL_ROOT_PASSWORD=password \
         --publish 3306:3306 \
         --publish 33060:33060 \
         --volume ${PWD}:/var/lib/mysql-files \
         --detach \
         mysql/mysql-server:latest
```

** Import d'un fichier dans une collection

https://dev.mysql.com/doc/mysql-shell/8.0/en/mysql-shell-utilities-json.html

```
MySQL JS> util.importJson("/var/lib/mysql-files/mp3.json", {schema: "world_x", collection: "mp3"})
Importing from file "/var/lib/mysql-files/mp3.json" to collection `world_x`.`mp3` in MySQL Server at localhost:33060


Processed 1.04 MB in 494 documents in 0.0193 sec (25.57K documents/s)
Total successfully imported documents 0 (0.00 documents/s)
Util.importJson: Input does not start with a JSON object at offset 1041012 (ArgumentError)
```

* use vi :goto offset command

```
:goto 1041012
[mjpeg @ 0000016b857b5340] No JPEG data found in image
```

```
MySQL JS>  util.importJson("/var/lib/mysql-files/mp3.json", {schema: "world_x", collection: "mp3"})
Importing from file "/var/lib/mysql-files/mp3.json" to collection `world_x`.`mp3` in MySQL Server at localhost:33060

.. 3686.. 3686
Processed 8.20 MB in 3686 documents in 0.7606 sec (4.85K documents/s)
Total successfully imported documents 3686 (4.85K documents/s)
```

# References

https://mysqlserverteam.com/import-json-to-mysql-made-easy-with-the-mysql-shell/
