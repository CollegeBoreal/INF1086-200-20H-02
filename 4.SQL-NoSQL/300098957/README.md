# Etudiants

### :zero: Créer son projet dans un répertoire :id:

```
$ cd ~/Developer/INF1086-200-20H-02/4.SQL-NoSQL
$ mkdir <id> && cd <id>
```


### :one: Créer le conteneur avec un volume (dans le répertoire de son projet)

:bulb: Le volume sert à charger le fichier `.json`

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

:pushpin: En éxécutant la commande suivante vos fichiers dans les conteneurs devraient s'afficher

```
% docker container exec --interactive some-mysqlds ls /var/lib/mysql-files
300098957-data.sql
300098957-dump.sql
300098957-schema.sql
README.md
images
students.json
```



### :two: Création de la base de données `Etudiants`

:pushpin: DCL création de la base de données


```
$ docker container exec --interactive some-mysqlds mysql --user root -ppassword \
                        --execute "CREATE DATABASE etudiants;"
```

### :three: DCL création de l'utilisateur

:pushpin: Contexte permettant d'utiliser `mysqlsh` 

```
$ docker container exec --interactive some-mysqlds mysql --user root -ppassword \
                        --execute "CREATE USER 'etudiants'@'127.0.0.1' IDENTIFIED BY 'etudiants_1';"
$ docker container exec --interactive some-mysqlds mysql --user root -ppassword \
                        --execute "GRANT ALL ON etudiants.* TO 'etudiants'@'127.0.0.1';"
```

:pushpin: Contexte permettant d'utiliser `Mysql Workbench` 


```
$ docker container exec --interactive some-mysqlds mysql --user root -ppassword \
                        --execute "CREATE USER 'etudiants'@'%' IDENTIFIED BY 'etudiants_1';"
$ docker container exec --interactive some-mysqlds mysql --user root -ppassword \
                        --execute "GRANT ALL ON etudiants.* TO 'etudiants'@'%';"
```

### :four: Récupération et chargement de la base de données `Etudiants`

:pushpin: Charger le `schema`

```
$ docker container exec --interactive some-mysqlds mysql --user root -ppassword \
          etudiants < ~/Developer/INF1086-200-20H-02/4.SQL-NoSQL/300098957/300098957-schema.sql
```

:pushpin:  Charger les données SQL

```
$ docker container exec --interactive some-mysqlds mysql --user root -ppassword \
         etudiants < ~/Developer/INF1086-200-20H-02/4.SQL-NoSQL/300098957/300098957-data.sql
```

:pushpin:  Vérifier les données SQL en se connectant à Workbench

<img src="images/connect-mysql.png" witdth=342 height=162 ></img>

### :five: ETL

:pushpin: Se connecter au conteneur

```
$ docker container exec --interactive --tty some-mysqlds bash
```

:pushpin: Se connecter à mysql SH en utilisant `JavaScript`

```
bash-4.2# mysqlsh --js --host localhost --user etudiants --password
```

:pushpin: Importer les fichiers `json` (i.e. ETL)

* students.json

```
MySQL JS> util.importJson(
              "/var/lib/mysql-files/students.json", 
              {
                  schema: "etudiants", 
                  collection: "import_students"
              }
          )
```

* programs.json

```
MySQL JS> util.importJson(
              "/var/lib/mysql-files/programs.json", 
              {
                  schema: "etudiants", 
                  collection: "import_programs"
              }
          )
```


:pushpin: Tester la collection

```
MySQL  JS > \use etudiants;
MySQL  JS > db.import_students.find()
```

### :six: XDEVAPI 

:pushpin: Utilisation de MySQL Python

Écrire le programme python permettant de rajouter des étudiants importés par le fichier `students.json`

```
$ docker container exec --interactive some-mysqlds mysqlsh --py \
                        --host localhost --user etudiants -petudiants_1 \
                   < ~/Developer/INF1086-200-20H-02/4.SQL-NoSQL/300098957/b300098957.py
```

### :seven: Modèle

Le modèle doit comporter l'image du schema et le fichier export :id:-dumb.sql (i.e. forward engineering)

<img src="images/schema.png" witdth=920 height=791 ></img>



# :x: Données
 
https://codebeautify.org/jsonviewer/cb5d0fd8

curl https://open.alberta.ca/dataset/3afb1138-ac83-4981-9177-45b0f9108208/resource/66131de0-996a-49e6-b521-90cadbe9646a/download/rows.json > programs.json
