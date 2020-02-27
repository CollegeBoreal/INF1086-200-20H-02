
-- Dans le domaine

use network_IT;

-- Données de la table SOLUTIONS


INSERT INTO SOLUTIONS ( solution, Nom_solution, date ) VALUES (21, 'configuration', '2020-01-01');
INSERT INTO SOLUTIONS ( solution, Nom_solution, date  ) VALUES (31, 'vlan', '2019-01-10');
INSERT INTO SOLUTIONS ( solution, Nom_solution, date  ) VALUES (51, 'routeur', '2020-12-12');

-- Données de la table PRODUITS

INSERT INTO PRODUCTS ( IDproduit, Nom_produit, date, total_en_stock ) VALUES (10, 'router', '2020-11-09', 233);
INSERT INTO PRODUCTS ( IDproduit, Nom_produit, Date, total_en_stock ) VALUES (20, 'switches','2014-10-04', 130);
INSERT INTO PRODUCTS ( IDproduit, Nom_produit, Date, total_en_stock) VALUES (30, 'camera', '2014-10-01', 144);


-- Données de la table CLIENTS

INSERT INTO CLIENTS ( IDclient, Nom_client, ville) VALUES (70, 'check', 'toronto');
INSERT INTO CLIENTS ( IDclient, Nom_client, ville) VALUES (80, 'abbas', 'toronto');
INSERT INTO CLIENTS ( IDclient, Nom_client, ville) VALUES (90, 'amir', 'sudbury');


-- Données de la table insttalation

INSERT INTO INSTALLATIONS (installation, Nom_installation  ) VALUES (7, 'firewall');
INSERT INTO INSTALLATIONS (installation, Nom_installation ) VALUES (8, 'anti-virus');
INSERT INTO INSTALLATIONS (installation, Nom_installation ) VALUES (9, 'mise a jours');
                                                  
  -- Données de la table prix
INSERT INTO PRIX (solution, installation, IDclient, prix ) VALUES (22, 4, 40, 1000);
INSERT INTO PRIX (solution, installation, IDclient, prix ) VALUES (34, 5, 50, 3000);
INSERT INTO PRIX (solution, installation, IDclient, prix ) VALUES (56, 6, 60, 3335);
