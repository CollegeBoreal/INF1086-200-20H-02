# Jeuxvideos

### :zero: Administration

- [] Créer son projet dans un répertoire :id:

```
$ cd ~/Developer/INF1086-200-20H-02/4.SQL-NoSQL
$ mkdir 300104541 && cd 300104541
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
         --volume C:\Users\Amichia\developer\INF1086-200-20H-02\4.SQL-NoSQL\300104541:/var/lib/mysql-files `
         --detach `
         mysql/mysql-server:latest
```

* En éxécutant la commande suivante vos fichiers dans les conteneurs devraient s'afficher

```
$ docker container exec --interactive some-mysqlds sh -c "ls /var/lib/mysql-files"
300104541-data.sql
300104541-schema.sql
README.md
vgame.json
```



- [] Création de la base de données `Jeuxvideos`

```
$ docker container exec --interactive some-mysqlds mysql --user root -ppassword \
                        --execute "CREATE DATABASE Jeuxvideos;"
```

- []  DCL création de l'utilisateur

:pushpin: Contexte permettant d'utiliser `mysqlsh` 

```
$ docker container exec --interactive some-mysqlds mysql --user root -ppassword \
                        --execute "CREATE USER 'Amichia'@'127.0.0.1' IDENTIFIED BY 'password';"
$ docker container exec --interactive some-mysqlds mysql --user root -ppassword \
                        --execute "GRANT ALL ON Jeuxvideos.* TO 'Amichia'@'127.0.0.1';"
```

:pushpin: Contexte permettant d'utiliser `Mysql Workbench` 


```
$ docker container exec --interactive some-mysqlds mysql --user root -ppassword \
                        --execute "CREATE USER 'Amichia'@'%' IDENTIFIED BY 'password';"
$ docker container exec --interactive some-mysqlds mysql --user root -ppassword \
                        --execute "GRANT ALL ON Jeuxvideos.* TO 'Amichia'@'%';"
```

### :one: Migration

:bulb: Récupération et chargement de la base de données `JeuxVideos`

- [] Charger le `schema`

```
$ docker container exec --interactive some-mysqlds mysql --user root -ppassword \
          Jeuxvideos < ~/Developer/INF1086-200-20H-02/4.SQL-NoSQL/300112917/300112917-schema.sql
```

- [] Charger les données SQL

```
$ docker container exec --interactive some-mysqlds mysql --user root -ppassword \
         Jeuxvideos < ~/Developer/INF1086-200-20H-02/4.SQL-NoSQL/300104541/300104541-data.sql
```

### :two: ETL

- [] Chercher des données `JSON`

```
$ curl https://raw.githubusercontent.com/h5p/h5p-boardgame/master/language/fr.json > vgame.json
```

- [] Importer ces données dans vos propres collections

:pushpin: Se connecter au conteneur

```
$ docker container exec --interactive --tty some-mysqlds bash
```

:pushpin: Se connecter à mysql SH en utilisant `JavaScript`

```
bash-4.2# mysqlsh --js --host localhost --user Amichia --password
```

:pushpin: Importer les fichiers `json` (i.e. ETL)

* vgame.json

```
MySQL JS> util.importJson(
              "/var/lib/mysql-files/vgame.json", 
              {
                  schema: "Jeuxvideos", 
                  collection: "products"
              }
          )
```

:pushpin: Tester la collection

```
MySQL  JS > \use Jeuxvideos
MySQL  JS > db.vgame.find()
```

### :three: Scripting avec API

:pushpin: Utilisation de MySQL Python : XDEVAPI 

- [ ] La fonction mashup doit gérer une table produite par des collections

Écrire le programme python [b300104541.py](b300104541.py) permettant de rajouter des étudiants importés par le fichier `products.json`

```
$ docker container exec --interactive some-mysqlds mysqlsh --py \
                        --host localhost --user Amichia -ppassword \
                   < ~/Developer/INF1086-200-20H-02/4.SQL-NoSQL/300104541/b300104541.py
```

### :four: Modèlisation

Le modèle doit comporter l'image du schema et le fichier export :id:-dumb.sql (i.e. forward engineering)

- [ ] présenter votre modèle relationel

- [ ] présenter votre modèle présentant les collections `dans un dossier`

<img src="Amichia.PNG" witdth=920 height=791 ></img>


### :five: Backup

- [ ] Sauvegarder la base de données dans un fichier SQL nommé 🆔-dump.sql
 
```
$ docker container exec some-mysqlds \
    sh -c 'exec mysqldump --user root -p"$MYSQL_ROOT_PASSWORD" Jeuxvideos ' \
    > ~/Developer/INF1086-200-20H-02/4.SQL-NoSQL/300104541/300104541-dump.sql
```
