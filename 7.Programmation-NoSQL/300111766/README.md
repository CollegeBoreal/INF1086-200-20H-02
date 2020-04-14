
## Programme MySQLsh en Python

Salut,

Dans ce tutoriel, tu vas créer un programme utilisant les APIs de MySQL X Dev API en Python


## ETAPE 1
Pour commencer, nous allons d'abord vérifier si Python, Gi Docker Desktop sont déjà configurés

1️⃣ Verification et l'installation de Python


Ouvrir un terminalet verifier la version de Python avec la commande suivante :


% python --version


Si Python est installé, vous aurez un resultat de la version comme 3.x.x


Si Python n'est pas installé, tapez sous Powershell la commande suivante suivante:


PS > choco install anaconda3


2️⃣ Verification et installation de Git


Vérifier la version de Git avec la commande suivante:


% git --version


Si vous avez Git vous verrez la version .


Si non utiliser powrshell et tapez la commmande suivantee pour l'installation



choco install git.install


3️⃣ Verification et installation de docker


Verifier la version de docker avec la commande suivante:


% docker --version


Si docker est intaller vous aurez la versin . Si non taper la commande suivante sur


powershell pour l'installation


PS > choco install docker-desktop -y


# ETAPE 2


## Installer la Base se Donnée MySQL Server


1- Creer le container some-mysqlds


🟥 Sous powerShell


PS> docker container run `

         --name some-mysqlds `
         
         --env MYSQL_ROOT_PASSWORD=password `
         
         --publish 3306:3306 `
         
         --publish 33060:33060 `
         
         --detach `
         
         mysql/mysql-server:latest
         
         
 2- Creer la base de donnee world_X
 
 
🟥 Sous powerShell


PS > docker container exec --interactive some-mysqlds mysql `
                        --user root --password=password `
                        --execute "CREATE DATABASE world_x;"
                        
                        
 3- Creer l'utilisateur root sous-reseau determine par le pont Bridge du container Docker
 
 
 -Créons l'utilisateur 'root'@'172.17.0.1'
 
 
 PS > docker container exec --interactive some-mysqlds `
                mysql --user root --password=password `
                --execute "CREATE USER 'root'@'172.17.0.1' IDENTIFIED BY 'password';"
                
                
 - Donner les droits d'acces 
 
 
 PS > docker container exec --interactive some-mysqlds `
                mysql --user root --password=password `
                --execute "GRANT ALL ON *.* TO 'root'@'172.17.0.1';"
                
                
 X DevAPI en Python
 
 
Nous allons installe la librairie qui nous permettrad'acceder a la base de donnees sous Python


🟥 Installer MYSQL ConnectorPython avec pip





 
 
 
 
 
                
                
 
 
 
 
                
                
  
 
 
 
 
                        
                        
                        
































