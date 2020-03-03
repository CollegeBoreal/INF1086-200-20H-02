-- MySQL dump 10.13  Distrib 8.0.19, for Linux (x86_64)
--
-- Host: localhost    Database: network_IT
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
-- Table structure for table `CLIENTS`
--

DROP TABLE IF EXISTS `CLIENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENTS` (
  `IDclient` int NOT NULL AUTO_INCREMENT,
  `Nom_client` varchar(30) NOT NULL,
  `Ville` varchar(30) NOT NULL,
  PRIMARY KEY (`IDclient`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENTS`
--

LOCK TABLES `CLIENTS` WRITE;
/*!40000 ALTER TABLE `CLIENTS` DISABLE KEYS */;
INSERT INTO `CLIENTS` VALUES (71,'check','toronto'),(81,'abbas','toronto'),(91,'amir','sudbury');
/*!40000 ALTER TABLE `CLIENTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INSTALLATIONS`
--

DROP TABLE IF EXISTS `INSTALLATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `INSTALLATIONS` (
  `installation` int NOT NULL AUTO_INCREMENT,
  `Nom_installation` varchar(30) NOT NULL,
  PRIMARY KEY (`installation`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INSTALLATIONS`
--

LOCK TABLES `INSTALLATIONS` WRITE;
/*!40000 ALTER TABLE `INSTALLATIONS` DISABLE KEYS */;
INSERT INTO `INSTALLATIONS` VALUES (7,'firewall'),(8,'anti-virus'),(9,'mise a jours');
/*!40000 ALTER TABLE `INSTALLATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRIX`
--

DROP TABLE IF EXISTS `PRIX`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PRIX` (
  `solution` int NOT NULL,
  `installation` int NOT NULL,
  `IDclient` int NOT NULL,
  `prix` int DEFAULT NULL,
  PRIMARY KEY (`solution`,`installation`,`IDclient`),
  KEY `installation` (`installation`),
  KEY `IDclient` (`IDclient`),
  CONSTRAINT `PRIX_ibfk_1` FOREIGN KEY (`solution`) REFERENCES `SOLUTIONS` (`solution`),
  CONSTRAINT `PRIX_ibfk_2` FOREIGN KEY (`installation`) REFERENCES `INSTALLATIONS` (`installation`),
  CONSTRAINT `PRIX_ibfk_3` FOREIGN KEY (`IDclient`) REFERENCES `CLIENTS` (`IDclient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRIX`
--

LOCK TABLES `PRIX` WRITE;
/*!40000 ALTER TABLE `PRIX` DISABLE KEYS */;
INSERT INTO `PRIX` VALUES (21,7,71,1000),(31,8,81,3000),(51,9,91,3335);
/*!40000 ALTER TABLE `PRIX` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCTS`
--

DROP TABLE IF EXISTS `PRODUCTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PRODUCTS` (
  `IDproduit` int NOT NULL AUTO_INCREMENT,
  `Nom_produit` varchar(30) NOT NULL,
  `total_en_stock` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`IDproduit`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCTS`
--

LOCK TABLES `PRODUCTS` WRITE;
/*!40000 ALTER TABLE `PRODUCTS` DISABLE KEYS */;
INSERT INTO `PRODUCTS` VALUES (11,'router',233,'2020-11-09'),(22,'switches',130,'2014-10-04'),(33,'camera',144,'2014-10-01');
/*!40000 ALTER TABLE `PRODUCTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SOLUTIONS`
--

DROP TABLE IF EXISTS `SOLUTIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SOLUTIONS` (
  `solution` int NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `Nom_solution` varchar(30) NOT NULL,
  PRIMARY KEY (`solution`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SOLUTIONS`
--

LOCK TABLES `SOLUTIONS` WRITE;
/*!40000 ALTER TABLE `SOLUTIONS` DISABLE KEYS */;
INSERT INTO `SOLUTIONS` VALUES (21,'2020-01-01','configuration'),(31,'2019-01-10','vlan'),(51,'2020-12-12','routeur');
/*!40000 ALTER TABLE `SOLUTIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_cisco`
--

DROP TABLE IF EXISTS `import_cisco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `import_cisco` (
  `doc` json DEFAULT NULL,
  `_id` varbinary(32) GENERATED ALWAYS AS (json_unquote(json_extract(`doc`,_utf8mb4'$._id'))) STORED NOT NULL,
  `_json_schema` json GENERATED ALWAYS AS (_utf8mb4'{"type":"object"}') VIRTUAL,
  PRIMARY KEY (`_id`),
  CONSTRAINT `$val_strict_34CD39E2921E145F835EACF2B4BE4DE95B7BEED8` CHECK (json_schema_valid(`_json_schema`,`doc`)) /*!80016 NOT ENFORCED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_cisco`
--

LOCK TABLES `import_cisco` WRITE;
/*!40000 ALTER TABLE `import_cisco` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_cisco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_collection`
--

DROP TABLE IF EXISTS `my_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `my_collection` (
  `doc` json DEFAULT NULL,
  `_id` varbinary(32) GENERATED ALWAYS AS (json_unquote(json_extract(`doc`,_utf8mb4'$._id'))) STORED NOT NULL,
  `_json_schema` json GENERATED ALWAYS AS (_utf8mb4'{"type":"object"}') VIRTUAL,
  PRIMARY KEY (`_id`),
  CONSTRAINT `$val_strict_0701039582AD6DF2CC0D8111682BD3CBD1432FDD` CHECK (json_schema_valid(`_json_schema`,`doc`)) /*!80016 NOT ENFORCED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_collection`
--

LOCK TABLES `my_collection` WRITE;
/*!40000 ALTER TABLE `my_collection` DISABLE KEYS */;
/*!40000 ALTER TABLE `my_collection` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-03 16:37:51
