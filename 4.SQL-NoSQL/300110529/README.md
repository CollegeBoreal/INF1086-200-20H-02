# Carte_graphique

### :zero: Administration 

Créer son répertoire :id:

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

:pushpin: Executer la commande suivante pour afficher vos fichiers dans les conteneurs

```
% docker container exec --interactive some-mysqlds ls /var/lib/mysql-files
300110529-data.sql
300110529-dump.sql
300110529-schema.sql
README.md
image
Carte_graphique.json

```
