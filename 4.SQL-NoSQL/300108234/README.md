
mkdir 300108234 cd 300108234

pwd /c/Users/User/Developer/INF1086-200-20H-02/4.SQL-NoSQL/300108234

$ docker container run --name some-mysqlds --env MYSQL_ROOT_PASSWORD=password --publish 3306:3306 --publish 33060:33060 --volume C:/Users/User/Developer/INF1086-200-20H-02/4.SQL-NoSQL/300108234 --detach mysql/mysql-server:latest

771b59cc85e5f9965dee00c64da386f364caf0a83a379d6b0478f79fe386d93a

$ winpty docker container exec --interactive --tty some-mysqlds bash

bash-4.2# mysql --user root --password

mysql> CREATE USER IF NOT EXISTS 'halima'@'localhost' IDENTIFIED BY 'password'; Query OK, 0 rows affected (0.01 sec)

mysql> GRANT ALL ON Hijabfashion.* TO 'halima'@'localhost'; Query OK, 0 rows affected, 1 warning (0.01 sec)

docker container exec --interactive some-mysqlds mysql --user root -ppassword \

                    --execute "CREATE DATABASE Hijabfashion;"
mysql: [Warning] Using a password on the command line interface can be insecure.

$ docker container exec --interactive some-mysqlds mysql --user root -ppassword Hijabfashion < ~/Developer/INF1006-202-19A-01/Q.Query/300108234/300108234-schema.sql mysql: [Warning] Using a password on the command line interface can be insecure.

$ docker container exec --interactive some-mysqlds mysql --user root -ppassword Hijabfashion < ~/Developer/INF1006-202-19A-01/Q.Query/300108234/300108234-data.sql mysql: [Warning] Using a password on the command line interface can be insecure.
