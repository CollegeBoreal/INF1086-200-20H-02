## Programmation MySQLsh en Python

Salut,

Dans ce tutoriel, tu vas créer un programme utilisant les APIs de MySQL X Dev API en Python

## ETAPE 1
Avant de commencer, nous allons nous assurer que l'environnement de développement est prêt.

nous allons verifier si python,Git et Docker Desktop sont configurer 

🅰️ Verification et Installion de Python

Ouvrir un terminal et vérifier la version de Python avec la commande suivante
```
% python --version
```
Si Python est installé, le résultat de la commande donnera une version. Cette version doit être superieure à 3.x.x

Si Python n'est pas installé, utiliser powershell pour l'installer avec la commande suivante

```
PS > choco install anaconda3
```
🅱️ Verification et Installion de Git

Ouvrir un terminal et vérifier la version de Git avec la commande suivante
```
% git --version
```
Si git est installé, le résultat de la commande donnera un numero de version.

Si non,utiliser powershell pour l'installer avec la commande suivante

```
choco install git.install
```

## 3 Verification et Installion de doker

Ouvrir un terminal et vérifier la version de docker avec la commande suivante
```
% docker --version
```
Si docker est installé, le résultat de la commande donnera un numero de version.

Si non,utiliser powershell pour l'installer avec la commande suivante

```
PS > choco install docker-desktop -y

```
## ETAPE 2

# Installer la Base se Donnée MySQL Server

1-Créer le conteneur some-mysqlds

A-sous Powershell

```
PS> docker container run `
         --name some-mysqlds `
         --env MYSQL_ROOT_PASSWORD=password `
         --publish 3306:3306 `
         --publish 33060:33060 `
         --detach `
         mysql/mysql-server:latest
 ```

2-Créer la base de données world_x

B-sous PowerShell

```
PS > docker container exec --interactive some-mysqlds mysql `
                        --user root --password=password `
                        --execute "CREATE DATABASE world_x;"
```

3-Créer l'utilisateur root sous le sous-réseau déterminé par le pont Bridge du conteneur Docker

-Créons l'utilisateur 'root'@'172.17.0.1'
```
PS > docker container exec --interactive some-mysqlds `
                mysql --user root --password=password `
                --execute "CREATE USER 'root'@'172.17.0.1' IDENTIFIED BY 'password';"
```
Et donnons lui tous les droits d'accès à n'importe quelle base de données

```
PS > docker container exec --interactive some-mysqlds `
                mysql --user root --password=password `
                --execute "GRANT ALL ON *.* TO 'root'@'172.17.0.1';"
                
```
 X DevAPI en Python

installons la librairie nous permettant d'accéder à la base de données sous Python.

1-Installer MySQL Connector Python avec pip
```
PS > pip install mysql-connector-python
```
Si mysql-connector-python est installé, le résultat de la commande donnera un numero de version qui doit être de 8.x.x
```
PS > pip show mysql-connector-python 
```
🆗 Cloner le référentiel


Cloner le repertoire avec la commande 

```
git clone https://github.com/ordenrosae/lab-programmation-mysqlsh-en-python
```

## Etape 3 Ecrivons le programme python

# 👉Exécuter un programme Python
il y a une fonction main qui contiendra toutes les instructions pour écrire le programme et une fonction charge servant à importer les données du fichier json.

# 👉Utilisation de Variables
Dans cette section,on va créer deux variables session et db que l'on utilisera dans notre programme.
ensuite lire le fichier chargé en mémoire dans le Document Store. Ce qui signifie que le fichier en format JSON sera lu et converti en format du Document Store.La fonction lecture servira donc a chargé le fichier json

# 👉 Traverser la collection 
On manipule des enregistrements data items pour naviguer dans la collection,et l'instruction des manipulant est fetch. 
fetch se décline en deux configurations:
-par la récupération entière (d'un coup) des documents fetch_all

-par la récupération individuelle fetch_one

Pour récupérer les documents de la base de données, on utilise la fonction find de la collection.

# 👉 Rajouter manuellement un document

Avec la fonction 'maColl.add'

# Exécuter ton programme et Sauveguarde ta base de données (dump)

Remplace --MON-REPERTOIRE-- par le répertoire ou tu as cloné ton référentiel (par exemple Developer)

Sous PowerShell
```
PS > docker container exec some-mysqlds `
        mysqldump --user root --password=password world_x `
        > $ENV:UserProfile\--MON-REPERTOIRE--\lab-programmation-mysqlsh-en-python\b000000000.sql
```

## :two: Vérification: 

- [x] Copier le programme et le script SQL:	

- [x] Créer votre fichier README.md expliquant votre programme	

👍 Vérification de la collection dans Mysql workbench

![](image/w1.JPG )

![](image/w2.JPG )
* [x] Extraire une autre collection de world_x que les chefs de gouvernements	


![](image/w1.JPG )

## :three: Amélioration	


* [x] Extraire une autre collection de world_x que Population





