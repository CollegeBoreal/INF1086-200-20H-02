
-- Mon domaine

CREATE DATABASE Carte_graphique;

-- Mon utilisateur

CREATE USER 'Carte_graphique'@'localhost' IDENTIFIED BY 'Carte_graphique';
GRANT ALL ON Carte_graphique.* TO 'Carte_graphique'@'localhost';


-- selectionner la base de donnees

use Carte_graphique;


-- Mes Tables

CREATE TABLE VENTES (idvente INT NOT NULL AUTO_INCREMENT, date Date,

                       Num_vente INT NOT NULL,

                       PRIMARY KEY(idvente)

                       );


CREATE TABLE CLIENTS (IDclient INT NOT NULL AUTO_INCREMENT, 
                      Nom_client VARCHAR(30) NOT NULL, Ville VARCHAR(30) NOT NULL,
                      PRIMARY KEY(IDclient)
                     );

		    
		      

CREATE TABLE MARCHANDISES ( marchandise INT NOT NULL AUTO_INCREMENT, 
			   date Date,  
			   nom_marchandise VARCHAR(30) NOT NULL,
			   prix INT,
                           description_marchandise VARCHAR(30), 
			   PRIMARY KEY(marchandise)   
			  );
  
  
  
CREATE TABLE PAYMENT (IDclient INT,
			      marchandise INT,
			      Idvente INT,
			      payment INT, 
			      PRIMARY KEY (IDclient, marchandise, idvente), 
			      FOREIGN KEY(iDclient) 
			      REFERENCES CLIENTS(Idclient),
		              FOREIGN KEY(idvente) 
			      REFERENCES VENTES(idvente) ,
			      FOREIGN KEY(marchandise) 
			      REFERENCES MARCHANDISES(marchandise)
			      
			     );

