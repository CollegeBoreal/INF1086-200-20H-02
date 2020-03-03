-- MySQL dump 10.13  Distrib 8.0.19, for Linux (x86_64)
--
-- Host: localhost    Database: widesign
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
-- Table structure for table `COLORS`
--

DROP TABLE IF EXISTS `COLORS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COLORS` (
  `color` int NOT NULL AUTO_INCREMENT,
  `Colors` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`color`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COLORS`
--

LOCK TABLES `COLORS` WRITE;
/*!40000 ALTER TABLE `COLORS` DISABLE KEYS */;
INSERT INTO `COLORS` VALUES (8,'blue'),(9,'original'),(10,'blacknwhite'),(11,'sepian'),(12,'mono'),(13,'dramatic'),(14,'argentic');
/*!40000 ALTER TABLE `COLORS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOMERS`
--

DROP TABLE IF EXISTS `CUSTOMERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CUSTOMERS` (
  `customer` varchar(4) NOT NULL,
  `nom` varchar(40) DEFAULT NULL,
  `prenom` varchar(40) DEFAULT NULL,
  `adresse` varchar(100) DEFAULT NULL,
  `codepostal` varchar(8) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`customer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMERS`
--

LOCK TABLES `CUSTOMERS` WRITE;
/*!40000 ALTER TABLE `CUSTOMERS` DISABLE KEYS */;
INSERT INTO `CUSTOMERS` VALUES ('1','Tochgaly','Etienne','1 yonge','M5E 1A7','416 -289-5130'),('2','Fabrice','Jacques','2 yonge st','M5E 1B7','416 -289-5230'),('3','widby','Armand','3 yonge street','M5E 1C7','416 -289-5330'),('4','Mark','Jean','1 yonge street','M5E 1D7','416 -289-5430'),('5','Armand','Widby','8 yonge','M5E 1E7','416 -289-5530'),('6','Sadissou','Abbas','2 yonge','M5E 1F7','416 -289-5630'),('7','Joseph','Jhon','5 yonge','M5E 1D7','416 -289-5730'),('8','Pierre','Magalie','7 yonge','M5E 1G7','416 -289-5830');
/*!40000 ALTER TABLE `CUSTOMERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DELIVERIES`
--

DROP TABLE IF EXISTS `DELIVERIES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DELIVERIES` (
  `delivery` int NOT NULL AUTO_INCREMENT,
  `social_networks` varchar(50) NOT NULL,
  PRIMARY KEY (`delivery`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DELIVERIES`
--

LOCK TABLES `DELIVERIES` WRITE;
/*!40000 ALTER TABLE `DELIVERIES` DISABLE KEYS */;
/*!40000 ALTER TABLE `DELIVERIES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FRAMES`
--

DROP TABLE IF EXISTS `FRAMES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FRAMES` (
  `frame` varchar(40) NOT NULL,
  `woodframe` varchar(40) NOT NULL,
  `metalframe` varchar(40) NOT NULL,
  `papier` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`frame`),
  KEY `papier` (`papier`),
  CONSTRAINT `frames_ibfk_1` FOREIGN KEY (`papier`) REFERENCES `papiers` (`papier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FRAMES`
--

LOCK TABLES `FRAMES` WRITE;
/*!40000 ALTER TABLE `FRAMES` DISABLE KEYS */;
/*!40000 ALTER TABLE `FRAMES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IMAGES`
--

DROP TABLE IF EXISTS `IMAGES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IMAGES` (
  `image` int NOT NULL AUTO_INCREMENT,
  `Images` varchar(30) NOT NULL,
  `format` int DEFAULT NULL,
  `color` int DEFAULT NULL,
  PRIMARY KEY (`image`),
  KEY `color` (`color`),
  CONSTRAINT `images_ibfk_1` FOREIGN KEY (`color`) REFERENCES `colors` (`color`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IMAGES`
--

LOCK TABLES `IMAGES` WRITE;
/*!40000 ALTER TABLE `IMAGES` DISABLE KEYS */;
INSERT INTO `IMAGES` VALUES (4,'portrait',NULL,NULL),(5,'paysage',NULL,NULL),(6,'flyer',NULL,NULL),(7,'S',NULL,NULL),(8,'c',NULL,NULL),(9,'h',NULL,NULL),(10,'e',NULL,NULL),(11,'m',NULL,NULL),(12,'a',NULL,NULL),(13,' ',NULL,NULL),(14,'d',NULL,NULL),(15,'e',NULL,NULL),(16,'f',NULL,NULL),(17,'i',NULL,NULL),(18,'n',NULL,NULL),(19,'i',NULL,NULL),(20,'t',NULL,NULL),(21,'i',NULL,NULL),(22,'o',NULL,NULL),(23,'n',NULL,NULL),(24,' ',NULL,NULL),(25,'o',NULL,NULL),(26,'f',NULL,NULL),(27,' ',NULL,NULL),(28,'P',NULL,NULL),(29,'i',NULL,NULL),(30,'n',NULL,NULL),(31,'t',NULL,NULL),(32,'e',NULL,NULL),(33,'r',NULL,NULL),(34,'e',NULL,NULL),(35,'s',NULL,NULL),(36,'t',NULL,NULL),(37,' ',NULL,NULL),(38,'i',NULL,NULL),(39,'m',NULL,NULL),(40,'a',NULL,NULL),(41,'g',NULL,NULL),(42,'e',NULL,NULL),(43,'S',NULL,NULL),(44,'c',NULL,NULL),(45,'h',NULL,NULL),(46,'e',NULL,NULL),(47,'m',NULL,NULL),(48,'a',NULL,NULL),(49,' ',NULL,NULL),(50,'d',NULL,NULL),(51,'e',NULL,NULL),(52,'f',NULL,NULL),(53,'i',NULL,NULL),(54,'n',NULL,NULL),(55,'i',NULL,NULL),(56,'t',NULL,NULL),(57,'i',NULL,NULL),(58,'o',NULL,NULL),(59,'n',NULL,NULL),(60,' ',NULL,NULL),(61,'o',NULL,NULL),(62,'f',NULL,NULL),(63,' ',NULL,NULL),(64,'P',NULL,NULL),(65,'i',NULL,NULL),(66,'n',NULL,NULL),(67,'t',NULL,NULL),(68,'e',NULL,NULL),(69,'r',NULL,NULL),(70,'e',NULL,NULL),(71,'s',NULL,NULL),(72,'t',NULL,NULL),(73,' ',NULL,NULL),(74,'i',NULL,NULL),(75,'m',NULL,NULL),(76,'a',NULL,NULL),(77,'g',NULL,NULL),(78,'e',NULL,NULL);
/*!40000 ALTER TABLE `IMAGES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INVOICES`
--

DROP TABLE IF EXISTS `INVOICES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `INVOICES` (
  `invoice` int NOT NULL AUTO_INCREMENT,
  `customer` varchar(4) NOT NULL,
  `reduction` varchar(20) DEFAULT NULL,
  `retour` date DEFAULT NULL,
  `remboursement` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  `shipping` int DEFAULT NULL,
  `delivery` int DEFAULT NULL,
  PRIMARY KEY (`invoice`,`customer`),
  KEY `customer` (`customer`),
  KEY `price` (`price`),
  KEY `delivery` (`delivery`),
  KEY `shipping` (`shipping`),
  CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`customer`) REFERENCES `customers` (`customer`),
  CONSTRAINT `invoices_ibfk_2` FOREIGN KEY (`price`) REFERENCES `prices` (`price`),
  CONSTRAINT `invoices_ibfk_3` FOREIGN KEY (`delivery`) REFERENCES `deliveries` (`delivery`),
  CONSTRAINT `invoices_ibfk_4` FOREIGN KEY (`shipping`) REFERENCES `shippings` (`shipping`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INVOICES`
--

LOCK TABLES `INVOICES` WRITE;
/*!40000 ALTER TABLE `INVOICES` DISABLE KEYS */;
/*!40000 ALTER TABLE `INVOICES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PAPIERS`
--

DROP TABLE IF EXISTS `PAPIERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PAPIERS` (
  `papier` varchar(40) NOT NULL,
  `nomdupapier` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`papier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PAPIERS`
--

LOCK TABLES `PAPIERS` WRITE;
/*!40000 ALTER TABLE `PAPIERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `PAPIERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRICES`
--

DROP TABLE IF EXISTS `PRICES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PRICES` (
  `price` int NOT NULL AUTO_INCREMENT,
  `image` int DEFAULT NULL,
  `prices` int DEFAULT NULL,
  PRIMARY KEY (`price`),
  KEY `image` (`image`),
  CONSTRAINT `prices_ibfk_1` FOREIGN KEY (`image`) REFERENCES `images` (`image`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRICES`
--

LOCK TABLES `PRICES` WRITE;
/*!40000 ALTER TABLE `PRICES` DISABLE KEYS */;
INSERT INTO `PRICES` VALUES (15,NULL,80),(16,NULL,70),(17,NULL,60),(18,NULL,50),(19,NULL,40),(20,NULL,30),(21,NULL,20),(22,NULL,85),(23,NULL,75),(24,NULL,65),(25,NULL,55),(26,NULL,45),(27,NULL,35),(28,NULL,22);
/*!40000 ALTER TABLE `PRICES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHIPPINGS`
--

DROP TABLE IF EXISTS `SHIPPINGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHIPPINGS` (
  `shipping` int NOT NULL AUTO_INCREMENT,
  `shipp` date DEFAULT NULL,
  PRIMARY KEY (`shipping`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHIPPINGS`
--

LOCK TABLES `SHIPPINGS` WRITE;
/*!40000 ALTER TABLE `SHIPPINGS` DISABLE KEYS */;
INSERT INTO `SHIPPINGS` VALUES (1,'2019-03-27'),(2,'2019-06-28'),(3,'2019-08-15'),(4,'2019-09-22'),(5,'2019-03-25');
/*!40000 ALTER TABLE `SHIPPINGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photographie`
--

DROP TABLE IF EXISTS `photographie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photographie` (
  `doc` json DEFAULT NULL,
  `_id` varbinary(32) GENERATED ALWAYS AS (json_unquote(json_extract(`doc`,_utf8mb4'$._id'))) STORED NOT NULL,
  `_json_schema` json GENERATED ALWAYS AS (_utf8mb4'{"type":"object"}') VIRTUAL,
  PRIMARY KEY (`_id`),
  CONSTRAINT `$val_strict_CB24BEE1BE243ABEC6AAEA9F2EBF463099480744` CHECK (json_schema_valid(`_json_schema`,`doc`)) /*!80016 NOT ENFORCED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photographie`
--

LOCK TABLES `photographie` WRITE;
/*!40000 ALTER TABLE `photographie` DISABLE KEYS */;
INSERT INTO `photographie` (`doc`) VALUES ('{\"id\": \"image.json\", \"_id\": \"00005e4d8f880000000000000001\", \"type\": \"object\", \"title\": \"image\", \"$schema\": \"http://json-schema.org/schema#\", \"properties\": {\"url\": {\"type\": \"string\", \"format\": \"uri\"}, \"width\": {\"type\": \"integer\"}, \"height\": {\"type\": \"integer\"}}, \"description\": \"Schema definition of Pinterest image\"}');
/*!40000 ALTER TABLE `photographie` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-03 20:49:50
