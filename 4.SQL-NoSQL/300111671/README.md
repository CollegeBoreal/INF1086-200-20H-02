



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

 -[ ]  Volume pour importer de nouvelles données
 
 ``` 
 C:\Users\LENOVO\Developer\INF1086-200-20H-02\4.SQL-NoSQL\300111671
 
```


- [ ] Crétion de l'utilisateur permettant d'accéder au Document Store (DCL)


```

CREATE USER 'alade'@'%' IDENTIFIED BY 'password';

```


```
GRANT ALL ON Boubou.* TO 'alade'@'%';

```

```

 docker container exec --interactive some-mysqlds sh -c           ' exec mysql --user root -ppassword '            < ~/developer/INF1086-200-20H-02/4.SQL-NoSQL/300111671/300111671-schema.sql


```
