-- MySQL dump 10.13  Distrib 8.0.19, for Linux (x86_64)
--
-- Host: localhost    Database: musicshop
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
-- Table structure for table `COLOURS`
--

DROP TABLE IF EXISTS `COLOURS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COLOURS` (
  `colour` int NOT NULL,
  `Colors` varchar(30) NOT NULL,
  PRIMARY KEY (`colour`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COLOURS`
--

LOCK TABLES `COLOURS` WRITE;
/*!40000 ALTER TABLE `COLOURS` DISABLE KEYS */;
INSERT INTO `COLOURS` VALUES (1,'White'),(2,'Black'),(3,'Red'),(4,'Yellow'),(5,'Purple'),(6,'Blue');
/*!40000 ALTER TABLE `COLOURS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOMERS`
--

DROP TABLE IF EXISTS `CUSTOMERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CUSTOMERS` (
  `customer` int NOT NULL AUTO_INCREMENT,
  `customers` varchar(40) DEFAULT NULL,
  `Name` varchar(30) NOT NULL,
  `Phone_number` int NOT NULL,
  PRIMARY KEY (`customer`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMERS`
--

LOCK TABLES `CUSTOMERS` WRITE;
/*!40000 ALTER TABLE `CUSTOMERS` DISABLE KEYS */;
INSERT INTO `CUSTOMERS` VALUES (1,NULL,'John',64773),(2,NULL,'Jacques',64774),(3,NULL,'Carl',64778),(4,NULL,'Johnny',64777),(5,NULL,'Joseph',64772),(6,NULL,'Jean',64779);
/*!40000 ALTER TABLE `CUSTOMERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INSTRUMENTS`
--

DROP TABLE IF EXISTS `INSTRUMENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `INSTRUMENTS` (
  `instrument` int NOT NULL AUTO_INCREMENT,
  `Types` text NOT NULL,
  `Name` varchar(30) NOT NULL,
  PRIMARY KEY (`instrument`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INSTRUMENTS`
--

LOCK TABLES `INSTRUMENTS` WRITE;
/*!40000 ALTER TABLE `INSTRUMENTS` DISABLE KEYS */;
INSERT INTO `INSTRUMENTS` VALUES (1,'instrument a corde','Piano'),(2,'Instrument a corde','Guitar'),(3,'Percusion','Drums'),(4,'Instrument a vent','Saxophone'),(5,'Instrument a corde','Keyboard'),(6,'instrument a vent','Clarinette');
/*!40000 ALTER TABLE `INSTRUMENTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PAYMENTS`
--

DROP TABLE IF EXISTS `PAYMENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PAYMENTS` (
  `payment` int NOT NULL AUTO_INCREMENT,
  `transaction_date` date DEFAULT NULL,
  `price` int DEFAULT NULL,
  `customer` int DEFAULT NULL,
  PRIMARY KEY (`payment`),
  KEY `price` (`price`),
  KEY `customer` (`customer`),
  CONSTRAINT `PAYMENTS_ibfk_1` FOREIGN KEY (`price`) REFERENCES `PRICES` (`price`),
  CONSTRAINT `PAYMENTS_ibfk_2` FOREIGN KEY (`customer`) REFERENCES `CUSTOMERS` (`customer`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PAYMENTS`
--

LOCK TABLES `PAYMENTS` WRITE;
/*!40000 ALTER TABLE `PAYMENTS` DISABLE KEYS */;
INSERT INTO `PAYMENTS` VALUES (1,'2019-04-08',1,1),(2,'2019-05-07',2,2),(3,'2019-04-10',3,3),(4,'2019-04-11',4,4),(5,'2019-04-15',5,5),(6,'2019-04-18',6,6);
/*!40000 ALTER TABLE `PAYMENTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRICES`
--

DROP TABLE IF EXISTS `PRICES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PRICES` (
  `price` int NOT NULL AUTO_INCREMENT,
  `instrument` int NOT NULL,
  `colour` int DEFAULT NULL,
  `Prices` int DEFAULT NULL,
  PRIMARY KEY (`price`,`instrument`),
  KEY `instrument` (`instrument`),
  KEY `colour` (`colour`),
  CONSTRAINT `PRICES_ibfk_1` FOREIGN KEY (`instrument`) REFERENCES `INSTRUMENTS` (`instrument`),
  CONSTRAINT `PRICES_ibfk_2` FOREIGN KEY (`colour`) REFERENCES `COLOURS` (`colour`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRICES`
--

LOCK TABLES `PRICES` WRITE;
/*!40000 ALTER TABLE `PRICES` DISABLE KEYS */;
INSERT INTO `PRICES` VALUES (1,1,2,7000),(2,2,1,5000),(3,3,3,6000),(4,4,4,5600),(5,5,5,5800),(6,6,6,5900);
/*!40000 ALTER TABLE `PRICES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SERVICES_OFFERED`
--

DROP TABLE IF EXISTS `SERVICES_OFFERED`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SERVICES_OFFERED` (
  `service_offered` int NOT NULL,
  `Services` varchar(30) NOT NULL,
  PRIMARY KEY (`service_offered`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SERVICES_OFFERED`
--

LOCK TABLES `SERVICES_OFFERED` WRITE;
/*!40000 ALTER TABLE `SERVICES_OFFERED` DISABLE KEYS */;
INSERT INTO `SERVICES_OFFERED` VALUES (6,'Instruments');
/*!40000 ALTER TABLE `SERVICES_OFFERED` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instruments`
--

DROP TABLE IF EXISTS `instruments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instruments` (
  `doc` json DEFAULT NULL,
  `_id` varbinary(32) GENERATED ALWAYS AS (json_unquote(json_extract(`doc`,_utf8mb4'$._id'))) STORED NOT NULL,
  `_json_schema` json GENERATED ALWAYS AS (_utf8mb4'{"type":"object"}') VIRTUAL,
  PRIMARY KEY (`_id`),
  CONSTRAINT `$val_strict_58F5EE9E015B8771EA33C56BAB9470DEDA4B5B87` CHECK (json_schema_valid(`_json_schema`,`doc`)) /*!80016 NOT ENFORCED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instruments`
--

LOCK TABLES `instruments` WRITE;
/*!40000 ALTER TABLE `instruments` DISABLE KEYS */;
INSERT INTO `instruments` (`doc`) VALUES ('{\"_id\": \"00005e5da1860000000000000001\", \"description\": \"Musical Instruments\", \"instruments\": [\"accordian\", \"air horn\", \"baby grand piano\", \"bagpipe\", \"banjo\", \"bass guitar\", \"bassoon\", \"bugle\", \"calliope\", \"cello\", \"clarinet\", \"clavichord\", \"concertina\", \"didgeridoo\", \"dobro\", \"dulcimer\", \"fiddle\", \"fife\", \"flugelhorn\", \"flute\", \"French horn\", \"glockenspiel\", \"grand piano\", \"guitar\", \"harmonica\", \"harp\", \"harpsichord\", \"hurdy-gurdy\", \"kazoo\", \"kick drum\", \"lute\", \"lyre\", \"mandolin\", \"marimba\", \"mellotran\", \"melodica\", \"oboe\", \"pan flute\", \"piano\", \"piccolo\", \"pipe organ\", \"saxaphone\", \"sitar\", \"sousaphone\", \"tambourine\", \"theremin\", \"trombone\", \"tuba\", \"ukulele\", \"viola\", \"violin\", \"vuvuzela\", \"washtub bass\", \"xylophone\", \"zither\"]}');
/*!40000 ALTER TABLE `instruments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-03  1:28:09
