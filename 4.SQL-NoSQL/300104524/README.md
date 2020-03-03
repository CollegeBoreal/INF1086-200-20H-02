# technical_supprot

### :zero: Administration

- [] Créer son projet dans un répertoire :id:

```
$ cd ~/Developer/INF1086-200-20H-02/4.SQL-NoSQL
$ mkdir 300104524&& cd 300104524
```


- [] Créer le conteneur avec un volume (dans le répertoire de son projet)


:bulb: Le volume sert à charger le fichier `.json`



<sup>:m:</sup> sous `Powershell`

```
PS > docker container run `
         --name some-mysqlds `
         --env MYSQL_ROOT_PASSWORD=password `
         --publish 3306:3306 `
         --publish 33060:33060 `
         --volume C:\Users\Geneus\developer\INF1086-200-20H-02\4.SQL-NoSQL\300104524:/var/lib/mysql-files `
         --detach `
         mysql/mysql-server:latest
```

* En éxécutant la commande suivante vos fichiers dans les conteneurs devraient s'afficher

```
$ docker container exec --interactive some-mysqlds sh -c "ls /var/lib/mysql-files"
300104524-data.sql
300104524-schema.sql
README.md
computer.json
```



- [] Création de la base de données `technical_support`

```
$ docker container exec --interactive some-mysqlds mysql --user root -ppassword \
                        --execute "CREATE DATABASE technical_support;"
```

- []  DCL création de l'utilisateur

:pushpin: Contexte permettant d'utiliser `mysqlsh` 

```
$ docker container exec --interactive some-mysqlds mysql --user root -ppassword \
                        --execute "CREATE USER 'Geneus'@'127.0.0.1' IDENTIFIED BY 'password';"
$ docker container exec --interactive some-mysqlds mysql --user root -ppassword \
                        --execute "GRANT ALL ON technical_support.* TO 'Geneus'@'127.0.0.1';"
```

:pushpin: Contexte permettant d'utiliser `Mysql Workbench` 


```
$ docker container exec --interactive some-mysqlds mysql --user root -ppassword \
                        --execute "CREATE USER 'Geneus'@'%' IDENTIFIED BY 'password';"
$ docker container exec --interactive some-mysqlds mysql --user root -ppassword \
                        --execute "GRANT ALL ON technical_support.* TO 'Geneus'@'%';"
```

### :one: Migration

:bulb: Récupération et chargement de la base de données `technical_support`

- [] Charger le `schema`

```
$ docker container exec --interactive some-mysqlds mysql --user root -ppassword \
          technical_support < ~/Developer/INF1086-200-20H-02/4.SQL-NoSQL/300104524/300104524-schema.sql
```

- [] Charger les données SQL

```
$ docker container exec --interactive some-mysqlds mysql --user root -ppassword \
         technical_support < ~/Developer/INF1086-200-20H-02/4.SQL-NoSQL/300104524/300104524-data.sql
```

### :two: ETL

- [] Chercher des données `JSON`

```
$ curl https://raw.githubusercontent.com/danielgtaylor/arista/master/presets/computer.json
```

- [] Importer ces données dans vos propres collections

:pushpin: Se connecter au conteneur

```
$ docker container exec --interactive --tty some-mysqlds bash
```

:pushpin: Se connecter à mysql SH en utilisant `JavaScript`

```
bash-4.2# mysqlsh --js --host localhost --user Geneus --password
```

:pushpin: Importer les fichiers `json` (i.e. ETL)

* computer.json

```
MySQL JS> util.importJson(
              "/var/lib/mysql-files/computer.json", 
              {
                  schema: "technical_support", 
                  collection: "computer"
              }
          )
```

:pushpin: Tester la collection

```
MySQL  JS > \use technical_support;
MySQL  JS > db.computer.find()
```

### :three: Scripting avec API

:pushpin: Utilisation de MySQL Python : XDEVAPI 

- [x] La fonction mashup doit gérer une table produite par des collections

Écrire le programme python [b300104524.py](b300104524.py) permettant de rajouter des étudiants importés par le fichier `computer.json`

```
$ docker container exec --interactive some-mysqlds mysqlsh --py \
                        --host localhost --user Geneus -password \
                   < ~/Developer/INF1086-200-20H-02/4.SQL-NoSQL/300104524/b300104524.py
```

### :four: IMAGE

<img src="ts.PNG" witdth=920 height=791 ></img>



### :five: Backup

-Sauvegarder la base de données dans un fichier SQL nommé 🆔-dump.sql
 
```
$ docker container exec some-mysqlds \
    sh -c 'exec mysqldump --user root -p"$MYSQL_ROOT_PASSWORD" technical_support ' \
    > ~/Developer/INF1086-200-20H-02/4.SQL-NoSQL/300104524/300104524-dump.sql
```
