# GAME ON 

# Projet

:bulb: Creer son projet dans un repertoire avec son :id:
``$ cd ~/Developer/INF1086-200-20H-02/4.SQL-NoSQL``
``$ mkdir 300107361`` && `$ cd 300107361`

### :zero: Administration 

- [ ] Créer votre base de données [MySQL/Server](../3.ETL/.docs/MySQLDS.md)

- [ ] Assurez vous qu'il utilise un volume pour importer de nouvelles données
  Le volume sert à charger les fichiers `.json`

- [ ] Créer l'utilisateur permettant d'accéder au Document Store (DCL)


* Lancer `PS> pwd` pour avoir le path du fichier pour vous assurez qu'il utilise un volume: 

Sous Powershell 
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
* En éxécutant la commande suivante vos fichiers dans les conteneurs devraient s'afficher
```
$ docker container exec --interactive some-mysqlds sh -c "ls /var/lib/mysql-files"

300107361-data.sql
300107361-schema.sql
README.md
b300107361.py
car.json

```

### :one: Migration

- [ ] Ceer votre base de données
```
$   docker container exec --interactive some-mysqlds mysql --user root -ppassword                        --execute "CREATE DATABASE car_center;"

mysql: [Warning] Using a password on the command line interface can be insecure.
```

* Creer l'utilisateur permettant d'acceder au Document Store

```
 docker container exec --interactive some-mysqlds mysql --user root -ppassword \
>                         --execute "CREATE USER 'joker'@'%' IDENTIFIED BY 'password';"

docker container exec --interactive some-mysqlds mysql --user root -ppassword                        --execute "GRANT ALL ON car_center.* TO 'joker'@'%';"
```

- [ ] Importer votre base de données SQL
- [ ] Charger le `schema`
 ```
$  docker container exec --interactive some-mysqlds mysql --user root -ppassword \
>           car_center < ~/Developer/INF1086-200-20H-02/4.SQL-NoSQL/300107361/300107361-schema.sql

mysql: [Warning] Using a password on the command line interface can be insecure.
```
- [ ] Charger les `données` SQL
```
$  docker container exec --interactive some-mysqlds mysql --user root -ppassword \
>           car_center < ~/Developer/INF1086-200-20H-02/4.SQL-NoSQL/300107361/300107361-data.sql
```


### :two: E.T.L

- [ ] Chercher des données `json` correspondant à votre domaine d'activités

Tochgaly-K.J.Etienne@XXX MINGW64 ~/developer/INF1086-200-20H-02/4.SQL-NoSQL/300107361 (master)

```$ curl 'https://vpic.nhtsa.dot.gov/api/vehicles/getallmanufacturers?format=json&page=2' | jq > car.json ```

  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 14168  100 14168    0     0  16192      0 --:--:-- --:--:-- --:--:-- 16192

- [ ] Importer ces données dans vos propres collections
:a: Se connecter au conteneur
```
$ docker container exec --interactive --tty some-mysqlds bash
$ winpty  docker container exec --interactive --tty some-mysqlds bash
```
:b: Se connecter à mysqlSH en utilisant `JavaScript`
```
bash-4.2# mysqlsh --js --user joker -ppassword
```
:ab: Importer les donnees Json
```
 MySQL  localhost:33060+ ssl  JS > util.importJson("/var/lib/mysql-files/car.json", {schema: "car_center", collection: "cars"})
Importing from file "/var/lib/mysql-files/car.json" to collection `Car_Center`.`cars` in MySQL Server at localhost:33060

.. 1.. 1
Processed 10.87 KB in 1 document in 0.0563 sec (17.75 documents/s)
Total successfully imported documents 1 (17.75 documents/s)
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
