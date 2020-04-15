

# Programmation MySQLsh en Python




## installer la base de donnée MySQL Server

:one: Créer le conteneur `some-mysqlds` [x]

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

:two: Créer la base de données `world_x` [x]

:pushpin: sous PowerShell

```
PS > docker container exec --interactive some-mysqlds mysql `
                        --user root --password=password `
                        --execute "CREATE DATABASE world_x;"
```


:three: Créer l'utilisateur `root` sous le sous-réseau déterminé par le pont  [x]

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

## X DevAPI en Python


:four: Installer MySQL Connector Python avec pip [x]

Sous Anaconda Powershell Propmt

```
PS > pip install mysql-connector-python
```
:round_pushpin: Vérifier l'installaiton du connecteur MySQL 

```
PS > pip show mysql-connector-python 
```
Version: 8.0.19

## Dans son referentiel INF1087\7.Programm\:id:

Recuperer les fichiers .Json et .Python du lab-github:lab-mysql-python-DevAPI avec b:id: comme nom


## :one: Écrire le programme Python

📌 Utilisation de variables: Dans cette section, on va créer deux variables session et db

* "la variable session" : permet d'obtenir une session d'entrée auprès de la base world_x .

* "la variable db": permet de garder l'information de la base .

📌 Charger la collection temporaire:

* lire et convertir le fichier en format JSON en format du Document Store en utilisant la fonction "lecture", Ce Document sera stoqué dans une collection
 
📌Traverser la collection: 

En utilisant la fonction fetch. fetch se décline en deux configurations:

- par la récupération entière (d'un coup) des documents fetch_all

- par la récupération individuelle fetch_one

📌Rajouter manuellement un document

En utilisant "myColl.add"


## :two: Vérification: 

- [x] Copier le programme et le script SQL:	

* [b300107361.py](b300107361.py)
* [b300107361.sql](b300107361.sql)

- [x] Créer votre fichier README.md expliquant votre programme	



## :three: Amélioration	

* Extraire une autre collection de world_x que les chefs de gouvernements
 
- [x]  Extraction d'une autre  collection 'systeme_politique' 

A l'execution du programme b300107361.py il va chercher dans la collection `systeme_politique` pour afficher le pays dont le nom commence par un H et qui a comme systeme de gouvernement une Republique.
 
![image](test.PNG)
 