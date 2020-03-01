                               PROJET: vente_portaaaable
                               
   📗 Créer son projet dans un répertoire 300111766
$ cd ~/Developer/INF1086-200-20H-02/4.SQL-NoSQL
$ mkdir 300111766 && cd 300111766

   📗 Chargement du fichier .jso
$ docker container run \
         --name some-mysqlds \
         --env MYSQL_ROOT_PASSWORD=password \
         --publish 3306:3306 \
         --publish 33060:33060 \
         --volume ${SRC}:/var/lib/mysql-files \
         --detach \
         mysql/mysql-server:latest
 
   📗 En éxécutant la commande suivante vos fichiers dans les conteneurs devraient s'afficher
$ docker container exec --interactive some-mysqlds sh -c "ls /var/lib/mysql-files"
300111766-data.sql
300111766-dump.sql
300111766-schema.sql
README.md
images
phone.json 

   📗 création de l'utilisateur: DCL
   
  📌 Contexte permettant d'utiliser mysqlsh

$ docker container exec --interactive some-mysqlds mysql --user root -ppassword \
                        --execute "CREATE USER 'cheikh'@'127.0.0.1' IDENTIFIED BY 'password';"

$ docker container exec --interactive some-mysqlds mysql --user root -ppassword \
                        --execute "GRANT ALL ON vente_portable.* TO 'CHEIKH'@'127.0.0.1';"
    
    
  📌Contexte permettant d'utiliser Mysql Workbench
  




         
