## installer la base de donnée MySQL Server

:one: Créer le conteneur `some-mysqlds`

:pushpin: sous Powershell

```
PS> docker container run `
         --name some-mysqlds `
         --env MYSQL_ROOT_PASSWORD=password `
         --publish 3306:3306 `
         --publish 33060:33060 `
         --detach `
         mysql/mysql-server:latest
```

:two: Créer la base de données `world_x`

:pushpin: sous PowerShell

```
PS > docker container exec --interactive some-mysqlds mysql `
                        --user root --password=password `
                        --execute "CREATE DATABASE world_x;"
```


:three: Créer l'utilisateur `root` sous le sous-réseau déterminé par le pont 

* Pour creer l'utilisateur : `'root'@'172.17.0.1'`

```
PS > docker container exec --interactive some-mysqlds `
                mysql --user root --password=password `
                --execute "CREATE USER 'root'@'172.17.0.1' IDENTIFIED BY 'password';"
```

* Pour donner les droits d'accès à n'importe quelle base de données

```
PS > docker container exec --interactive some-mysqlds `
                mysql --user root --password=password `
                --execute "GRANT ALL ON *.* TO 'root'@'172.17.0.1';"
```

##  X DevAPI en Python

:four: Installer MySQL Connector Python avec pip

```
PS > pip install mysql-connector-python
```
:round_pushpin: Vérifier l'installaiton du connecteur MySQL 

```
PS > pip show mysql-connector-python 
```

## ✔ Cloner le référentiel

Dans un terminal tapes `git clone https://github.com/halimabzn/lab-programmation-mysqlsh-en-python`, en chosissant la version `SSH` 































## :b: Vérification:

  - [ ] Copier le fichier `b000000000.py` dans votre :id: `Boréal` et le renommer avec votre :id: `b`:id:`.py`

  - [ ] Copier le fichier `b000000000.sql` dans votre :id: `Boréal` et le renommer avec votre :id: `b`:id:`.sql`


  - [ ] Créer votre fichier README.md expliquant votre programme


