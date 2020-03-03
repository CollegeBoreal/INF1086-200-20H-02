# Carte_graphique

### :zero: Administration 

Créer son répertoire avec son :id:

```
$ cd ~/Developer/INF1086-200-20H-02/4.SQL-NoSQL
$ mkdir <300110529>
cd <300110529>
```

### :one: Créer le conteneur dans le répertoire

```
$ docker container run `
         --name some-mysqlds `
         --env MYSQL_ROOT_PASSWORD=password `
         --publish 3306:3306 `
         --publish 33060:33060 `
         --volume C:\Users\THK\developer\INF1086-200-20H-02\4.SQL-NoSQL\300110529:/var/lib/mysql-files `
         --detach `
         mysql/mysql-server:latest
```

### :two: Migration

Création de la base de données `Carte_graphique`

```
$ docker container exec --interactive some-mysqlds mysql --user root -ppassword \
                        --execute "CREATE DATABASE etudiants;"
```
création de l'utilisateur

```
$ docker container exec --interactive some-mysqlds mysql --user root -ppassword \
                        --execute "CREATE USER 'joker'@'127.0.0.1' IDENTIFIED BY 'password';"
$ docker container exec --interactive some-mysqlds mysql --user root -ppassword \
                        --execute "GRANT ALL ON Car_Center.* TO 'joker'@'127.0.0.1';"
```

utilisation `Mysql Workbench`

```
$ docker container exec --interactive some-mysqlds mysql --user root -ppassword \
                        --execute "CREATE USER 'joker'@'%' IDENTIFIED BY 'password';"

$ docker container exec --interactive some-mysqlds mysql --user root -ppassword  \
                        --execute "GRANT ALL ON Car_Center.* TO 'joker'@'%';"
```

Importation de la base de données SQL

```
$ docker container exec --interactive some-mysqlds mysql --user root -ppassword \
          etudiants < ~/Developer/INF1086-200-20H-02/4.SQL-NoSQL/300098957/300098957-schema.sql
```

```
$ docker container exec --interactive some-mysqlds mysql --user root -ppassword \
         etudiants < ~/Developer/INF1086-200-20H-02/4.SQL-NoSQL/300098957/300098957-data.sql
```



