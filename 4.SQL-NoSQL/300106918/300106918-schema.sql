
 -- Mon domaine

CREATE DATABASE IF NOT EXISTS network_IT;

-- Mon utilisateur

CREATE USER IF NOT EXISTS 'AEK'@'localhost' IDENTIFIED BY 'etudiants_1';

GRANT ALL ON etudiants.* TO 'AEK'@'localhost';

-- selectionner la base de donnees

use network_IT;

-- Mes Tables

CREATE TABLE SOLUTIONS ( solution INT NOT NULL AUTO_INCREMENT, date Date,
                       Nom_solution VARCHAR(30) NOT NULL,
                       PRIMARY KEY(solution)
                       );
  
CREATE TABLE PRODUCTS ( IDproduit INT AUTO_INCREMENT,
                       Nom_produit VARCHAR(30) NOT NULL, total_en_stock INT, date Date,
                      PRIMARY KEY(IDproduit)
                      );

CREATE TABLE CLIENTS (IDclient INT NOT NULL AUTO_INCREMENT, 
                      Nom_client VARCHAR(30) NOT NULL, Ville VARCHAR(30) NOT NULL,
                      PRIMARY KEY(IDclient)
                     );
 
 CREATE TABLE COMMANDES (IDproduit INT NOT NULL AUTO_INCREMENT,
                          IDclient INT,
                          IDfacture INT, 
                          Quantité INT , 
                         
            PRIMARY KEY (IDproduit, IDclient),
            FOREIGN KEY(IDproduit) 
            REFERENCES PRODUCTS (IDproduit),
            FOREIGN KEY (IDclient) 
            REFERENCES CLIENTS (IDclient)
                  );
                     
CREATE TABLE INSTALLATIONS (installation INT NOT NULL AUTO_INCREMENT,
                           Nom_installation VARCHAR(30) NOT NULL,
                           PRIMARY KEY(installation)
                           );
  
CREATE TABLE PRIX (
        solution INT,
        installation INT,
        IDclient INT,
        prix INT,
 
        PRIMARY KEY (solution, installation, IDclient),
        FOREIGN KEY(solution)
        REFERENCES SOLUTIONS(solution),
        FOREIGN KEY(installation)
        REFERENCES INSTALLATIONS(installation),
        FOREIGN KEY(IDclient)
        REFERENCES CLIENTS(IDclient)
    
       );
