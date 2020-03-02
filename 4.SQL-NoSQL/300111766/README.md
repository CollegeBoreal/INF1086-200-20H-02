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
    
    
  📌 Contexte permettant d'utiliser Mysql Workbench
  
  docker container exec --interactive some-mysqlds mysql --user root -ppassword \
                        --execute "CREATE DATABASE vente_portable;"


docker container exec --interactive some-mysqlds mysql --user root -ppassword \
                        --execute "CREATE USER 'CHEIKH'@'%' IDENTIFIED BY 'password';"


docker container exec --interactive some-mysqlds mysql --user root -ppassword \
                        --execute "GRANT ALL ON vente_portable.* TO 'CHEIKH'@'%';"
                        
  📗 Migration

💡 Récupération et chargement de la base de données vente_portable

✔ Charger le schema

docker container exec --interactive some-mysqlds mysql --user root -ppassword \
          vente_portable < ~/Developer/INF1086-200-20H-02/4.SQL-NoSQL/300111766/300111766-schema.sql

✔ Charger les données SQL


docker container exec --interactive some-mysqlds mysql --user root -ppassword \
         vente_portable < ~/Developer/INF1086-200-20H-02/4.SQL-NoSQL/300111766/300111766-data.sql


  📗 Importer les fichiers json (i.e. ETL)

phone.json

 MySQL  localhost:33060+ ssl  JS > util.importJson(
                                ->               "/var/lib/mysql-files/phone.json",
                                ->               {
                                ->                   schema: "vente_portable",
                                ->                   collection: "import_phone"
                                ->               }
                                ->           )
                                ->
Importing from file "/var/lib/mysql-files/phone.json" to collection `vente_portable`.`import_phone` in MySQL Server at localhost:33060

.. 1.. 1
Processed 7.02 KB in 1 document in 0.2587 sec (3.87 documents/s)
Total successfully imported documents 1 (3.87 documents/s)

 
 📗 Tester la collection

MySQL  JS > \use vente_portable

MySQL  JS > db.import_phone.find()

 📗 Scripting avec API
 
📌 Using MySQL Python

docker container exec --interactive some-mysqlds mysqlsh --py \
                        --host localhost --user CHEIKH -ppassword \
                   < ~/Developer/INF1086-200-20H-02/4.SQL-NoSQL/300111766/b300111766.py
                   
 <img src="my db json.PNG" witdth=920 height=791 ></img>

                  

          
          
          
                        
                        

  




         
