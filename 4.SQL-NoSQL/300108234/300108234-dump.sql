-- MySQL dump 10.13  Distrib 8.0.18, for Linux (x86_64)
--
-- Host: localhost    Database: Hijabfashion
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `ACCESSOIRES`
--

DROP TABLE IF EXISTS `ACCESSOIRES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACCESSOIRES` (
  `accessoire` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  PRIMARY KEY (`accessoire`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACCESSOIRES`
--

LOCK TABLES `ACCESSOIRES` WRITE;
/*!40000 ALTER TABLE `ACCESSOIRES` DISABLE KEYS */;
INSERT INTO `ACCESSOIRES` VALUES (1,'perle','coloree'),(2,'Motif','broderie');
/*!40000 ALTER TABLE `ACCESSOIRES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ADRESSES`
--

DROP TABLE IF EXISTS `ADRESSES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ADRESSES` (
  `adresse` int(11) NOT NULL AUTO_INCREMENT,
  `rue` varchar(30) NOT NULL,
  `ville` varchar(30) NOT NULL,
  `pays` varchar(30) NOT NULL,
  `code_postal` varchar(30) NOT NULL,
  PRIMARY KEY (`adresse`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADRESSES`
--

LOCK TABLES `ADRESSES` WRITE;
/*!40000 ALTER TABLE `ADRESSES` DISABLE KEYS */;
INSERT INTO `ADRESSES` VALUES (1,'1765 victoria park drive','toronto','canada','m1s3r4'),(2,'89 amal','oran','algerie','2456'),(3,'1254 river street','chicago','usa','s4r1m2');
/*!40000 ALTER TABLE `ADRESSES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENTS`
--

DROP TABLE IF EXISTS `CLIENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENTS` (
  `adresse` int(11) NOT NULL,
  `vente` int(11) NOT NULL,
  `prix` int(11) NOT NULL,
  `client` int(11) DEFAULT NULL,
  PRIMARY KEY (`adresse`,`vente`,`prix`),
  KEY `vente` (`vente`),
  KEY `prix` (`prix`),
  CONSTRAINT `CLIENTS_ibfk_1` FOREIGN KEY (`adresse`) REFERENCES `ADRESSES` (`adresse`),
  CONSTRAINT `CLIENTS_ibfk_2` FOREIGN KEY (`vente`) REFERENCES `VENTES` (`vente`),
  CONSTRAINT `CLIENTS_ibfk_3` FOREIGN KEY (`prix`) REFERENCES `PRIX` (`prix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENTS`
--

LOCK TABLES `CLIENTS` WRITE;
/*!40000 ALTER TABLE `CLIENTS` DISABLE KEYS */;
INSERT INTO `CLIENTS` VALUES (1,3,2,55),(2,1,3,45),(3,2,3,60);
/*!40000 ALTER TABLE `CLIENTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COULEURS`
--

DROP TABLE IF EXISTS `COULEURS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COULEURS` (
  `couleur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  PRIMARY KEY (`couleur`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COULEURS`
--

LOCK TABLES `COULEURS` WRITE;
/*!40000 ALTER TABLE `COULEURS` DISABLE KEYS */;
INSERT INTO `COULEURS` VALUES (1,'noir'),(2,'pale'),(3,'bleu');
/*!40000 ALTER TABLE `COULEURS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PAYS_DE_FABRICATION`
--

DROP TABLE IF EXISTS `PAYS_DE_FABRICATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PAYS_DE_FABRICATION` (
  `pays_de_fabrication` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  `devise` varchar(30) NOT NULL,
  `livraison` date DEFAULT NULL,
  PRIMARY KEY (`pays_de_fabrication`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PAYS_DE_FABRICATION`
--

LOCK TABLES `PAYS_DE_FABRICATION` WRITE;
/*!40000 ALTER TABLE `PAYS_DE_FABRICATION` DISABLE KEYS */;
INSERT INTO `PAYS_DE_FABRICATION` VALUES (1,'maroc','dirham','2019-11-15'),(2,'yemen','riyal','2019-11-30'),(3,'arabie saoudite','riyal','2019-12-30');
/*!40000 ALTER TABLE `PAYS_DE_FABRICATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRIX`
--

DROP TABLE IF EXISTS `PRIX`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PRIX` (
  `prix` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  `tarif` varchar(30) NOT NULL,
  PRIMARY KEY (`prix`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRIX`
--

LOCK TABLES `PRIX` WRITE;
/*!40000 ALTER TABLE `PRIX` DISABLE KEYS */;
INSERT INTO `PRIX` VALUES (1,'10','5'),(2,'15','5'),(3,'20','5');
/*!40000 ALTER TABLE `PRIX` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TAILLES`
--

DROP TABLE IF EXISTS `TAILLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TAILLES` (
  `taille` int(11) NOT NULL AUTO_INCREMENT,
  `largeur` varchar(30) NOT NULL,
  `longeur` varchar(30) NOT NULL,
  `unite_de_mesure` varchar(30) NOT NULL,
  PRIMARY KEY (`taille`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TAILLES`
--

LOCK TABLES `TAILLES` WRITE;
/*!40000 ALTER TABLE `TAILLES` DISABLE KEYS */;
INSERT INTO `TAILLES` VALUES (1,'55','140','cm'),(2,'60','160','cm'),(3,'65','180','cm');
/*!40000 ALTER TABLE `TAILLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TISSUS`
--

DROP TABLE IF EXISTS `TISSUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TISSUS` (
  `taille` int(11) NOT NULL,
  `couleur` int(11) NOT NULL,
  `accessoire` int(11) NOT NULL,
  `pays_de_fabrication` int(11) NOT NULL,
  `tissu` int(11) DEFAULT NULL,
  PRIMARY KEY (`taille`,`couleur`,`accessoire`,`pays_de_fabrication`),
  KEY `couleur` (`couleur`),
  KEY `accessoire` (`accessoire`),
  KEY `pays_de_fabrication` (`pays_de_fabrication`),
  CONSTRAINT `TISSUS_ibfk_1` FOREIGN KEY (`taille`) REFERENCES `TAILLES` (`taille`),
  CONSTRAINT `TISSUS_ibfk_2` FOREIGN KEY (`couleur`) REFERENCES `COULEURS` (`couleur`),
  CONSTRAINT `TISSUS_ibfk_3` FOREIGN KEY (`accessoire`) REFERENCES `ACCESSOIRES` (`accessoire`),
  CONSTRAINT `TISSUS_ibfk_4` FOREIGN KEY (`pays_de_fabrication`) REFERENCES `PAYS_DE_FABRICATION` (`pays_de_fabrication`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TISSUS`
--

LOCK TABLES `TISSUS` WRITE;
/*!40000 ALTER TABLE `TISSUS` DISABLE KEYS */;
INSERT INTO `TISSUS` VALUES (1,1,1,3,50),(2,2,2,1,18),(3,3,1,2,13);
/*!40000 ALTER TABLE `TISSUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VENTES`
--

DROP TABLE IF EXISTS `VENTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VENTES` (
  `vente` int(11) NOT NULL AUTO_INCREMENT,
  `commande` date DEFAULT NULL,
  PRIMARY KEY (`vente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VENTES`
--

LOCK TABLES `VENTES` WRITE;
/*!40000 ALTER TABLE `VENTES` DISABLE KEYS */;
INSERT INTO `VENTES` VALUES (1,'2019-11-10'),(2,'2019-11-15'),(3,'2019-11-30');
/*!40000 ALTER TABLE `VENTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_hijab`
--

DROP TABLE IF EXISTS `import_hijab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `import_hijab` (
  `doc` json DEFAULT NULL,
  `_id` varbinary(32) GENERATED ALWAYS AS (json_unquote(json_extract(`doc`,_utf8mb4'$._id'))) STORED NOT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_hijab`
--

LOCK TABLES `import_hijab` WRITE;
/*!40000 ALTER TABLE `import_hijab` DISABLE KEYS */;
INSERT INTO `import_hijab` (`doc`) VALUES ('{\"_id\": \"00005e557a6b0000000000000001\", \"tissu\": [{\"id\": \"134\", \"city\": \"toronto\", \"type\": \"coton\", \"state\": \"ON\", \"acronym\": null, \"country\": \"Canada\"}, {\"id\": \"123\", \"city\": \"Agadir\", \"type\": \"muslin\", \"state\": \"AG\", \"acronym\": null, \"country\": \"Maroc\"}, {\"id\": \"190\", \"city\": \"Agadir\", \"type\": \"muslin\", \"state\": \"AG\", \"acronym\": null, \"country\": \"Maroc\"}, {\"id\": \"34\", \"city\": \"ottawa\", \"type\": \"printed\", \"state\": \"ON\", \"acronym\": null, \"country\": \"Canada\"}, {\"id\": \"908\", \"city\": \"Paris\", \"type\": \"cotton\", \"state\": \"PR\", \"acronym\": null, \"country\": \"France\"}]}'),('{\"_id\": \"00005e557a6b0000000000000002\", \"tissu\": [{\"id\": \"134\", \"city\": \"toronto\", \"type\": \"coton\", \"state\": \"ON\", \"acronym\": null, \"country\": \"Canada\"}, {\"id\": \"123\", \"city\": \"Agadir\", \"type\": \"muslin\", \"state\": \"AG\", \"acronym\": null, \"country\": \"Maroc\"}, {\"id\": \"190\", \"city\": \"Agadir\", \"type\": \"muslin\", \"state\": \"AG\", \"acronym\": null, \"country\": \"Maroc\"}, {\"id\": \"34\", \"city\": \"ottawa\", \"type\": \"printed\", \"state\": \"ON\", \"acronym\": null, \"country\": \"Canada\"}, {\"id\": \"908\", \"city\": \"Paris\", \"type\": \"cotton\", \"state\": \"PR\", \"acronym\": null, \"country\": \"France\"}]}'),('{\"_id\": \"00005e557a6b0000000000000003\", \"tissu\": [{\"id\": \"134\", \"city\": \"toronto\", \"type\": \"coton\", \"state\": \"ON\", \"acronym\": null, \"country\": \"Canada\"}, {\"id\": \"123\", \"city\": \"Agadir\", \"type\": \"muslin\", \"state\": \"AG\", \"acronym\": null, \"country\": \"Maroc\"}, {\"id\": \"190\", \"city\": \"Agadir\", \"type\": \"muslin\", \"state\": \"AG\", \"acronym\": null, \"country\": \"Maroc\"}, {\"id\": \"34\", \"city\": \"ottawa\", \"type\": \"printed\", \"state\": \"ON\", \"acronym\": null, \"country\": \"Canada\"}, {\"id\": \"908\", \"city\": \"Paris\", \"type\": \"cotton\", \"state\": \"PR\", \"acronym\": null, \"country\": \"France\"}]}'),('{\"_id\": \"00005e557a6b0000000000000004\", \"tissu\": [{\"id\": \"134\", \"city\": \"toronto\", \"type\": \"coton\", \"state\": \"ON\", \"acronym\": null, \"country\": \"Canada\"}, {\"id\": \"123\", \"city\": \"Agadir\", \"type\": \"muslin\", \"state\": \"AG\", \"acronym\": null, \"country\": \"Maroc\"}, {\"id\": \"190\", \"city\": \"Agadir\", \"type\": \"muslin\", \"state\": \"AG\", \"acronym\": null, \"country\": \"Maroc\"}, {\"id\": \"34\", \"city\": \"ottawa\", \"type\": \"printed\", \"state\": \"ON\", \"acronym\": null, \"country\": \"Canada\"}, {\"id\": \"908\", \"city\": \"Paris\", \"type\": \"cotton\", \"state\": \"PR\", \"acronym\": null, \"country\": \"France\"}]}'),('{\"_id\": \"00005e557a6b0000000000000005\", \"tissu\": [{\"id\": \"134\", \"city\": \"toronto\", \"type\": \"coton\", \"state\": \"ON\", \"acronym\": null, \"country\": \"Canada\"}, {\"id\": \"123\", \"city\": \"Agadir\", \"type\": \"muslin\", \"state\": \"AG\", \"acronym\": null, \"country\": \"Maroc\"}, {\"id\": \"190\", \"city\": \"Agadir\", \"type\": \"muslin\", \"state\": \"AG\", \"acronym\": null, \"country\": \"Maroc\"}, {\"id\": \"34\", \"city\": \"ottawa\", \"type\": \"printed\", \"state\": \"ON\", \"acronym\": null, \"country\": \"Canada\"}, {\"id\": \"908\", \"city\": \"Paris\", \"type\": \"cotton\", \"state\": \"PR\", \"acronym\": null, \"country\": \"France\"}]}');
/*!40000 ALTER TABLE `import_hijab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_shipment`
--

DROP TABLE IF EXISTS `import_shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `import_shipment` (
  `doc` json DEFAULT NULL,
  `_id` varbinary(32) GENERATED ALWAYS AS (json_unquote(json_extract(`doc`,_utf8mb4'$._id'))) STORED NOT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_shipment`
--

LOCK TABLES `import_shipment` WRITE;
/*!40000 ALTER TABLE `import_shipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_shipment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-03 16:15:08
