# MySQL DS

### Docker


# :a: Créer le conteneur avec un volume

:bangbang: Donner le nom du répertoire source à la variable `SRC` (respectez les backticks)

<sup>:m:</sup> sous `gitbash` afficher le format Windows `-W`

```
$ SRC=`pwd -W`
```

<sup>:m:</sup> sous un terminal classique afficher le format (Linux, MacOS)

```
$ SRC=`pwd -L`
```

:bulb: Lancer le conteneur avec un volume

```
$ docker container run \
         --name some-mysqlds \
         --env MYSQL_ROOT_PASSWORD=password \
         --publish 3306:3306 \
         --publish 33060:33060 \
         --volume ${SRC}:/var/lib/mysql-files \
         --detach \
         mysql/mysql-server:latest
```

** Import d'un fichier dans une collection

https://dev.mysql.com/doc/mysql-shell/8.0/en/mysql-shell-utilities-json.html

```
MySQL JS>  util.importJson("/var/lib/mysql-files/mp3.json", {schema: "world_x", collection: "mp3"})
Importing from file "/var/lib/mysql-files/mp3.json" to collection `world_x`.`mp3` in MySQL Server at localhost:33060

.. 3686.. 3686
Processed 8.20 MB in 3686 documents in 0.7606 sec (4.85K documents/s)
Total successfully imported documents 3686 (4.85K documents/s)
```

** faire une requete sur la collection


```
MySQL JS>  db.mp3.find('format.tags.genre = :param').bind('param','R&B')
```



## :o: jq test

```
% cat mp3.json | jq '. | select (.format.tags.genre | contains("R&B")) | { "song": .format.filename, "title": .format.tags.title }'
```

```
% cat mp3.json | jq '. | select(.format.tags.genre !=null ) | select (.format.tags.genre | contains("R&B")) | { "song": .format.filename, "title": .format.tags.title }'
```
# References

https://mysqlserverteam.com/import-json-to-mysql-made-easy-with-the-mysql-shell/





## :x: Quelques erreurs en example


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

