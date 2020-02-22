```
mkdir 300108234 cd 300108234
```
```
pwd /c/Users/User/Developer/INF1086-200-20H-02/4.SQL-NoSQL/300108234
```
```
docker container run \
         --name some-mysqlds \
         --env MYSQL_ROOT_PASSWORD=password \
         --publish 3306:3306 \
         --publish 33060:33060 \
         --volume ${SRC}:C:/Users/User/Developer/INF1086-200-20H-02/4.SQL-NoSQL/300108234:/var/lib/mysql-files \
         --detach \
         mysql/mysql-server:latest
```

```
docker container exec --interactive some-mysqlds sh -c "ls C:/Users/User/Developer/INF1086-200-20H-02/4.SQL-NoSQL/300108234:/var/lib/mysql-files"
```

```
 docker container exec --interactive some-mysqlds mysql --user root -ppassword \
>                         --execute "CREATE DATABASE Hijabfashion;"
mysql: [Warning] Using a password on the command line interface can be insecure.
```

### Pour utiliser mysqlsh
```
 docker container exec --interactive some-mysqlds mysql --user root -ppassword \
>                         --execute "CREATE USER 'halima'@'127.0.0.1' IDENTIFIED BY 'password';"
mysql: [Warning] Using a password on the command line interface can be insecure.
```
```
 docker container exec --interactive some-mysqlds mysql --user root -ppassword \
>                         --execute "GRANT ALL ON Hijabfashion.* TO 'halima'@'127.0.0.1';"
mysql: [Warning] Using a password on the command line interface can be insecure.
```


### Pour utiliser Mysql Workbench
```
 docker container exec --interactive some-mysqlds mysql --user root -ppassword \
>                         --execute "CREATE USER 'halima'@'%' IDENTIFIED BY 'password';"
mysql: [Warning] Using a password on the command line interface can be insecure.
```
```
 docker container exec --interactive some-mysqlds mysql --user root -ppassword                         --execute "GRANT ALL ON Hijabfashion.* TO 'halima'@'%';"        mysql: [Warning] Using a password on the command line interface can be insecure
```
### Chargement de schema
```
docker container exec --interactive some-mysqlds mysql --user root -ppassword           Hijabfashion < ~/Developer/INF1086-200-20H-02/4.SQL-NoSQL/300108234/300108234-schema.sql
mysql: [Warning] Using a password on the command line interface can be insecure.
```

### Chargement des données SQL
```
 docker container exec --interactive some-mysqlds mysql --user root -ppassword           Hijabfashion < ~/Developer/INF1086-200-20H-02/4.SQL-NoSQL/300108234/300108234-data.sql
mysql: [Warning] Using a password on the command line interface can be insecure.

```
### ETL

#### Se connecter au conteneur

```
 winpty docker container exec --interactive --tty some-mysqlds bash
```
#### Se connecter à mysql SH en utilisant JavaScript
```
bash-4.2# mysqlsh --js --host localhost --user halima --password
Please provide the password for 'halima@localhost': ********
```

```
MySQL JS> util.importJson(
              "C:/Users/User/Developer/INF1086-200-20H-02/4.SQL-NoSQL/300108234:/var/lib/mysql-files/students.json", 
              {
                  schema: "Hijabfashion", 
                  collection: "import_hijab"
              }
          )
