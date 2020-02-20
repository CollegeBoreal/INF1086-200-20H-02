



### :zero: Administration 



- [ ] Création du nouveau base de données [MySQL/Server](../3.ETL/.docs/MySQLDS.md)






```


docker container run `
         --name some-mysqlds `
         --env MYSQL_ROOT_PASSWORD=password `
         --publish 3306:3306 `
         --publish 33060:33060 `
         --volume C:\Users\LENOVO\Developer\INF1086-200-20H-02\4.SQL-NoSQL\300111671:/var/lib/mysql-files `
         --detach `
         mysql/mysql-server:latest


```

 - [ ] Volume pour importer de nouvelles données
 
 ``` 
 C:\Users\LENOVO\Developer\INF1086-200-20H-02\4.SQL-NoSQL\300111671
 
```


- [ ] Crétion de l'utilisateur permettant d'accéder au Document Store (DCL)


```

$ docker container exec --interactive some-mysqlds mysql --user root -ppassword \
                        --execute "CREATE USER 'abbas'@'127.0.0.1' IDENTIFIED BY 'password';"
$ docker container exec --interactive some-mysqlds mysql --user root -ppassword \
                        --execute "GRANT ALL ON Boubou.* TO 'abbas'@'127.0.0.1';"
```

:pushpin: Contexte permettant d'utiliser `Mysql Workbench` 


```
$ docker container exec --interactive some-mysqlds mysql --user root -ppassword \
                        --execute "CREATE USER 'abbas'@'%' IDENTIFIED BY 'password';"
$ docker container exec --interactive some-mysqlds mysql --user root -ppassword \
                        --execute "GRANT ALL ON Boubou.* TO 'abbas'@'%';"
```


### :one: Migration

- [ ] Récupération de l'ancien  projet [SQL](https://github.com/CollegeBoreal/INF1006-202-19A-01/tree/master/4.DML)

```
   INF1086-200-20H-02/4.SQL-NoSQL/300111671/300111671-data.sql
   INF1086-200-20H-02/4.SQL-NoSQL/300111671/300111671-schema.sql
```

- [ ] Importer votre base de données SQL


```
docker container exec --interactive some-mysqlds sh -c           ' exec mysql --user root -ppassword '            < ~/developer/INF1086-200-20H-02/4.SQL-NoSQL/300111671/300111671-data.sql
 mysql: [Warning] Using a password on the command line interface can be insecure.
 


 docker container exec --interactive some-mysqlds sh -c           ' exec mysql --user root -ppassword '            < ~/developer/INF1086-200-20H-02/4.SQL-NoSQL/300111671/300111671-schema.sql
 mysql: [Warning] Using a password on the command line interface can be insecure.
 
 
```


### :two: E.T.L

- [ ]  Données `json` correspondant à MON domaine d'activités

```
INF1086-200-20H-02/4.SQL-NoSQL/300111671/Boubou.json
```

se connecter avec JS 

```
 # mysqlsh --js --host localhost --user alade --password
 Please provide the password for 'alade@localhost': ********
MySQL Shell 8.0.18

Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.
Oracle is a registered trademark of Oracle Corporation and/or its affiliates.
Other names may be trademarks of their respective owners.

Type '\help' or '\?' for help; '\quit' to exit.
Creating a session to 'alade@localhost'
Fetching schema names for autocompletion... Press ^C to stop.
Your MySQL connection id is 186 (X protocol)
Server version: 8.0.18 MySQL Community Server - GPL
No default schema selected; type \use <schema> to set one.
 MySQL  localhost:33060+ ssl  JS >

 
 ```





- [ ] Importation de mes données dans ma collection Boubou

```

 MySQL  localhost:33060+ ssl  JS > util.importJson("/var/lib/mysql-files/Boubou.json", {schema: "Boubou", collection: "Boubou"})
Importing from file "/var/lib/mysql-files/Boubou.json" to collection `Boubou`.`Boubou` in MySQL Server at localhost:33060

.. 1.. 1
Processed 1.54 KB in 1 document in 0.0988 sec (10.12 documents/s)
Total successfully imported documents 1 (10.12 documents/s)


```
### :three: Scripting avec API

:pushpin: Utilisation de MySQL Python : XDEVAPI 



```
$   docker container exec --interactive some-mysqlds mysqlsh --py \
>                         --host localhost --user abbas -ppassword \
>                    < ~/Developer/INF1086-200-20H-02/4.SQL-NoSQL/300111671/b300111671.py
WARNING: Using a password on the command line interface can be insecure.
{"COULEUR": "noir", "GENRE": "dashiki", "QUANTITE": "1 a 3", "_id": "1"}
```
