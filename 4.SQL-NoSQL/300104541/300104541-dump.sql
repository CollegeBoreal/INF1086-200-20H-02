-- MySQL dump 10.13  Distrib 8.0.19, for Linux (x86_64)
--
-- Host: localhost    Database: Jeuxvideos
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `CONSOLES`
--

DROP TABLE IF EXISTS `CONSOLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CONSOLES` (
  `Consoles` varchar(250) NOT NULL,
  `console` int NOT NULL,
  PRIMARY KEY (`console`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CONSOLES`
--

LOCK TABLES `CONSOLES` WRITE;
/*!40000 ALTER TABLE `CONSOLES` DISABLE KEYS */;
INSERT INTO `CONSOLES` VALUES ('PS4',1),('XBOX ONE',2),('XBOX 360',3);
/*!40000 ALTER TABLE `CONSOLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOMERS`
--

DROP TABLE IF EXISTS `CUSTOMERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CUSTOMERS` (
  `customer` int NOT NULL AUTO_INCREMENT,
  `FullName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`customer`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMERS`
--

LOCK TABLES `CUSTOMERS` WRITE;
/*!40000 ALTER TABLE `CUSTOMERS` DISABLE KEYS */;
INSERT INTO `CUSTOMERS` VALUES (1,'Jean Marc');
/*!40000 ALTER TABLE `CUSTOMERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DIFFUSIONS`
--

DROP TABLE IF EXISTS `DIFFUSIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DIFFUSIONS` (
  `Diffusions` varchar(250) NOT NULL,
  `diffusion` int NOT NULL,
  PRIMARY KEY (`diffusion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DIFFUSIONS`
--

LOCK TABLES `DIFFUSIONS` WRITE;
/*!40000 ALTER TABLE `DIFFUSIONS` DISABLE KEYS */;
INSERT INTO `DIFFUSIONS` VALUES ('Streaming',1),('Mode Story',2);
/*!40000 ALTER TABLE `DIFFUSIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JEUX`
--

DROP TABLE IF EXISTS `JEUX`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JEUX` (
  `Jeux_Videos` varchar(250) NOT NULL,
  `Categorie` varchar(250) NOT NULL,
  `jeux` int NOT NULL AUTO_INCREMENT,
  `console` int DEFAULT NULL,
  `diffusion` int DEFAULT NULL,
  PRIMARY KEY (`jeux`),
  KEY `console` (`console`),
  KEY `diffusion` (`diffusion`),
  CONSTRAINT `JEUX_ibfk_1` FOREIGN KEY (`console`) REFERENCES `CONSOLES` (`console`),
  CONSTRAINT `JEUX_ibfk_2` FOREIGN KEY (`diffusion`) REFERENCES `DIFFUSIONS` (`diffusion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JEUX`
--

LOCK TABLES `JEUX` WRITE;
/*!40000 ALTER TABLE `JEUX` DISABLE KEYS */;
INSERT INTO `JEUX` VALUES ('Modern Combat','Action',1,1,2),('FIFA19','Sport',2,3,1),('Naruto','Adventure',3,2,2);
/*!40000 ALTER TABLE `JEUX` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRICES`
--

DROP TABLE IF EXISTS `PRICES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PRICES` (
  `price` int NOT NULL AUTO_INCREMENT,
  `console` int DEFAULT NULL,
  `Prices` int DEFAULT NULL,
  PRIMARY KEY (`price`),
  KEY `console` (`console`),
  CONSTRAINT `PRICES_ibfk_1` FOREIGN KEY (`console`) REFERENCES `CONSOLES` (`console`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRICES`
--

LOCK TABLES `PRICES` WRITE;
/*!40000 ALTER TABLE `PRICES` DISABLE KEYS */;
INSERT INTO `PRICES` VALUES (1,1,300),(2,2,400),(3,3,250);
/*!40000 ALTER TABLE `PRICES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHIPPINGS`
--

DROP TABLE IF EXISTS `SHIPPINGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHIPPINGS` (
  `price` int NOT NULL,
  `customer` int NOT NULL,
  `DateDeLivraison` date DEFAULT NULL,
  PRIMARY KEY (`price`,`customer`),
  KEY `customer` (`customer`),
  CONSTRAINT `SHIPPINGS_ibfk_1` FOREIGN KEY (`price`) REFERENCES `PRICES` (`price`),
  CONSTRAINT `SHIPPINGS_ibfk_2` FOREIGN KEY (`customer`) REFERENCES `CUSTOMERS` (`customer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHIPPINGS`
--

LOCK TABLES `SHIPPINGS` WRITE;
/*!40000 ALTER TABLE `SHIPPINGS` DISABLE KEYS */;
INSERT INTO `SHIPPINGS` VALUES (1,1,'2019-12-09');
/*!40000 ALTER TABLE `SHIPPINGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SUPPORTS`
--

DROP TABLE IF EXISTS `SUPPORTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SUPPORTS` (
  `support` int NOT NULL AUTO_INCREMENT,
  `vente_virtuelle` int DEFAULT NULL,
  `Supports` varchar(250) DEFAULT NULL,
  `vente_physique` int DEFAULT NULL,
  PRIMARY KEY (`support`),
  KEY `vente_physique` (`vente_physique`),
  KEY `vente_virtuelle` (`vente_virtuelle`),
  CONSTRAINT `SUPPORTS_ibfk_1` FOREIGN KEY (`vente_physique`) REFERENCES `VENTE_PHYSIQUES` (`vente_physique`),
  CONSTRAINT `SUPPORTS_ibfk_2` FOREIGN KEY (`vente_virtuelle`) REFERENCES `VENTE_VIRTUELLES` (`vente_virtuelle`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SUPPORTS`
--

LOCK TABLES `SUPPORTS` WRITE;
/*!40000 ALTER TABLE `SUPPORTS` DISABLE KEYS */;
INSERT INTO `SUPPORTS` VALUES (1,1,'Clavardage',NULL),(2,2,'Appel',NULL),(3,NULL,'Guichet',3),(4,NULL,'Check-Out',2);
/*!40000 ALTER TABLE `SUPPORTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VENTE_PHYSIQUES`
--

DROP TABLE IF EXISTS `VENTE_PHYSIQUES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VENTE_PHYSIQUES` (
  `Ventes` varchar(250) NOT NULL,
  `vente_physique` int NOT NULL,
  PRIMARY KEY (`vente_physique`),
  UNIQUE KEY `vente_physique_UNIQUE` (`vente_physique`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VENTE_PHYSIQUES`
--

LOCK TABLES `VENTE_PHYSIQUES` WRITE;
/*!40000 ALTER TABLE `VENTE_PHYSIQUES` DISABLE KEYS */;
INSERT INTO `VENTE_PHYSIQUES` VALUES ('En Store',1),('THE SOURCE',2),('EB GAMES',3);
/*!40000 ALTER TABLE `VENTE_PHYSIQUES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VENTE_VIRTUELLES`
--

DROP TABLE IF EXISTS `VENTE_VIRTUELLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VENTE_VIRTUELLES` (
  `Ventes` varchar(250) NOT NULL,
  `vente_virtuelle` int NOT NULL,
  PRIMARY KEY (`vente_virtuelle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VENTE_VIRTUELLES`
--

LOCK TABLES `VENTE_VIRTUELLES` WRITE;
/*!40000 ALTER TABLE `VENTE_VIRTUELLES` DISABLE KEYS */;
INSERT INTO `VENTE_VIRTUELLES` VALUES ('En ligne',1),('PS+',2);
/*!40000 ALTER TABLE `VENTE_VIRTUELLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `doc` json DEFAULT NULL,
  `_id` varbinary(32) GENERATED ALWAYS AS (json_unquote(json_extract(`doc`,_utf8mb4'$._id'))) STORED NOT NULL,
  `_json_schema` json GENERATED ALWAYS AS (_utf8mb4'{"type":"object"}') VIRTUAL,
  PRIMARY KEY (`_id`),
  CONSTRAINT `$val_strict_4D49A65250F41B97D806A640E3316F8AAC3BEC71` CHECK (json_schema_valid(`_json_schema`,`doc`)) /*!80016 NOT ENFORCED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`doc`) VALUES ('{\"_id\": \"00005e5dab5b0000000000000001\", \"semantics\": [{\"label\": \"Titre du jeu\", \"description\": \"Titre du jeu que vous créez.\", \"placeholder\": \"Vos connaissances sur l\'Arctique\"}, {\"label\": \"Arrière-plan du plateau\", \"description\": \"Choisissez une image d\'arrière-plan appropriée pour votre plateau de jeu.\"}, {\"label\": \"Taille du plateau\", \"fields\": [{}, {}], \"description\": \"Indiquez la taille (en px) que doit avoir le plateau de jeu. Le ratio doit correspondre à celui de votre image d\'arrière-plan.\"}, {\"label\": \"Afficher une ombre portée\", \"description\": \"Afficher une ombre portée sur le contour du plateau de jeu. Si l\'option est activée, le plateau prendra un peu plus de place que prévu.\"}, {\"label\": \"Introduction du jeu\", \"fields\": [{\"label\": \"Message d\'accueil et instructions\", \"description\": \"Exposez à l\'utilisateur ce qu\'il doit faire et le but du jeu.\", \"placeholder\": \"Bonjour, jeune voyageur ! Es-tu prêt à tester tes connaissances sur l\'Arctique ?\"}, {\"label\": \"Bouton \\\"Commencer\\\"\", \"default\": \"Commencer\", \"description\": \"Texte du bouton qui permet à l\'utilisateur de lancer le jeu.\"}]}, {\"field\": {\"label\": \"Mini-jeu\", \"fields\": [{\"label\": \"Titre\", \"description\": \"Donnez un nom à votre mini-jeu.\"}, {\"label\": \"Icône du mini-jeu\", \"description\": \"Image utilisée pour identifier le mini-jeu sur le plateau.\"}, {\"label\": \"Icône du mini-jeu en cas de réussite\", \"description\": \"Cette icône sera utilisée quand le mini-jeu aura été complété et réussi.\"}, {\"label\": \"Icône du mini-jeu en cas d\'échec\", \"description\": \"Cette icône sera utilisée quand le mini-jeu aura été complété mais échoué.\"}, {\"label\": \"Emplacement du mini-jeu\", \"fields\": [{}, {}], \"default\": {}, \"description\": \"Placez le mini-jeu sur le plateau en saisissant ses coordonnées en pixels.\"}, {\"label\": \"Action\", \"description\": \"Sélectionnez l\'activité à lancer si l\'utilisateur choisit ce mini-jeu.\"}]}, \"label\": \"Minis-jeux\", \"entity\": \"mini-jeu\", \"description\": \"Ce sont les minis-jeux placés sur le plateau (exemples : quiz, pendu).\"}, {\"label\": \"Indicateur de progression\", \"fields\": [{\"label\": \"Activer l\'indicateur de progression\"}, {\"field\": {\"label\": 0}, \"entity\": \"Image\", \"description\": \"Choisissez les images à utiliser pour visualiser la progression : une pour chaque étape franchie et une pour les étapes restant à franchir.\"}, {\"label\": \"Emplacement de l\'indicateur de progression\", \"fields\": [{}, {}], \"description\": \"Placez l\'indicateur de progression sur le plateau en saisissant ses coordonnées en pixels.\"}]}, {\"label\": \"Jeu terminé\", \"fields\": [{\"label\": \"Vidéo de fin\", \"description\": \"Vidéo à jouer avant que les résultats du jeu ne s\'affichent.\"}, {\"label\": \"Permettre de passer la vidéo de fin du jeu.\"}, {\"label\": \"Texte du bouton permettant de passer la vidéo\", \"default\": \"Passer la vidéo\", \"description\": \"Intitulé du bouton permettant à l\'utilisateur de passer la vidéo de fin du jeu.\"}]}, {\"label\": \"Résultats du jeu\", \"fields\": [{\"label\": \"Texte affiché lors des résultats du jeu\", \"default\": \"Vous avez @score sur @total, soit @percentage % de réussite\", \"description\": \"Ce texte explique le score au jeu. Variables disponibles : @score, @total, @percentage.\"}, {\"label\": \"Texte du bouton \\\"Recommencer\\\"\", \"default\": \"Recommencer\", \"description\": \"Texte du bouton qui permet de faire une nouvelle tentative.\"}, {\"label\": \"Texte du bouton \\\"Voir la correction\\\"\", \"default\": \"Voir la correction\", \"description\": \"Texte du bouton qui permet à l\'utilisateur de voir la correction.\"}]}, {\"label\": \"Options pour les boutons \\\"Voir la correction\\\" et \\\"Recommencer\\\".\", \"fields\": [{\"label\": \"Ecraser les réglages individuels des boutons \\\"Voir la correction\\\" et \\\"Recommencer\\\".\", \"description\": \"Si vous activez cette option, les réglages individuels de ces boutons seront ignorés et écrasés par ce réglage, uniformément appliqué à l\'ensemble des questions.\"}, {\"label\": \"Activer le bouton \\\"Voir la correction\\\".\", \"description\": \"Activez cette option pour afficher le bouton \\\"Voir la correction\\\" sur toutes les questions.\"}, {\"label\": \"Activer le bouton \\\"Recommencer\\\".\", \"description\": \"Activez cette option pour afficher le bouton \\\"Recommencer\\\" sur toutes les questions.\"}], \"description\": \"Ces options vous permettent de choisir quand afficher les boutons \\\"Voir la correction\\\" et \\\"Recommencer\\\" dans vos activités h5p.\"}]}');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-03  1:32:57
