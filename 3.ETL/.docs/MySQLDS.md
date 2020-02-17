# MySQL DS

### Docker


# :a: Créer le conteneur avec un volume


:bulb: Les volumes dockers sont gérés par Linux

```
* Remplacer \ par /
ou doubler les `\` par example '\\'
```

:m: sous gitbash 

:pushpin: Assigner le répertoire courant à la variable `$src`

```
$ echo ${PWD}
/c/Users/300098957/Developer/INF1086-200-20H-02/3.ETL/300098957
$ src=${PWD}
```

:pushpin: Lancer le conteneur avec un volume `$src`

```
$ docker container run \
         --name some-mysqlds \
         --env MYSQL_ROOT_PASSWORD=password \
         --publish 3306:3306 \
         --publish 33060:33060 \
         --volume ${src}:/var/lib/mysql-files \
         --detach \
         mysql/mysql-server:latest
```

:m: sous PowerShell

:pushpin: Assigner le répertoire courant à la variable `$src`

```
PS > $pwd

Path
----
C:\Users\300098957\Developer\INF1086-200-20H-02\3.ETL\300098957
PS > $src = $pwd.Path | Foreach-Object {$_ -replace '\\','/'}
```
:pushpin: Lancer le conteneur avec un volume `$src`

```
$ docker container run `
         --name some-mysqlds `
         --env MYSQL_ROOT_PASSWORD=password `
         --publish 3306:3306 `
         --publish 33060:33060 `
         --volume C:/Users/Administrator/Developer/INF1086-200-20H-02/4.SQL-NoSQL/300098957:/var/lib/mysql-files `
         --detach `
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

