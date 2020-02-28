# technical supprot

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



- [] Création de la base de données `magasin`

```
$ docker container exec --interactive some-mysqlds mysql --user root -ppassword \
                        --execute "CREATE DATABASE technical support;"
```

- []  DCL création de l'utilisateur

:pushpin: Contexte permettant d'utiliser `mysqlsh` 

```
$ docker container exec --interactive some-mysqlds mysql --user root -ppassword \
                        --execute "CREATE USER 'Geneus'@'127.0.0.1' IDENTIFIED BY 'password';"
$ docker container exec --interactive some-mysqlds mysql --user root -ppassword \
                        --execute "GRANT ALL ON technical support.* TO 'Geneus'@'127.0.0.1';"
```

:pushpin: Contexte permettant d'utiliser `Mysql Workbench` 


```
$ docker container exec --interactive some-mysqlds mysql --user root -ppassword \
                        --execute "CREATE USER 'Geneus'@'%' IDENTIFIED BY 'password';"
$ docker container exec --interactive some-mysqlds mysql --user root -ppassword \
                        --execute "GRANT ALL ON technical support.* TO 'Geneus'@'%';"
```

### :one: Migration

:bulb: Récupération et chargement de la base de données `technical support`

- [] Charger le `schema`

```
$ docker container exec --interactive some-mysqlds mysql --user root -ppassword \
          technical support < ~/Developer/INF1086-200-20H-02/4.SQL-NoSQL/300104524/300104524-schema.sql
```

- [] Charger les données SQL

```
$ docker container exec --interactive some-mysqlds mysql --user root -ppassword \
         technical support < ~/Developer/INF1086-200-20H-02/4.SQL-NoSQL/300104524/300104524-data.sql
```

### :two: ETL

- [] Chercher des données `JSON`

```
$ curl https:https://github.com/danielgtaylor/arista/blob/master/presets/computer.json > computer.json
```

- [] Importer ces données dans vos propres collections

:pushpin: Se connecter au conteneur

```
$ docker container exec --interactive --tty some-mysqlds bash
```

:pushpin: Se connecter à mysql SH en utilisant `JavaScript`

```
bash-4.2# mysqlsh --js --host localhost --user ador --password
```

:pushpin: Importer les fichiers `json` (i.e. ETL)

* computer.json

```
MySQL JS> util.importJson(
              "/var/lib/mysql-files/computer.json", 
              {
                  schema: "technical support", 
                  collection: "computer"
              }
          )
```

:pushpin: Tester la collection

```
MySQL  JS > \use technical support;
MySQL  JS > db.computer.find()
```
