
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

```

CREATE USER 'alade'@'%' IDENTIFIED BY 'password';

```


```
GRANT ALL ON Boubou.* TO 'alade'@'%';

```

```

 docker container exec --interactive some-mysqlds sh -c           ' exec mysql --user root -ppassword '            < ~/developer/INF1086-200-20H-02/4.SQL-NoSQL/300111671/300111671-schema.sql


```
