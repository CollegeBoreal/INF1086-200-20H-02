-- MySQL dump 10.13  Distrib 8.0.19, for Linux (x86_64)
--
-- Host: localhost    Database: Car_Center
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
  `colour` varchar(30) NOT NULL,
  `Colours` varchar(255) NOT NULL,
  PRIMARY KEY (`colour`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COLOURS`
--

LOCK TABLES `COLOURS` WRITE;
/*!40000 ALTER TABLE `COLOURS` DISABLE KEYS */;
INSERT INTO `COLOURS` VALUES ('blk','BLACK'),('blu','BLUEU'),('grn','GREEN'),('gry','GRAY'),('wht','WHITE');
/*!40000 ALTER TABLE `COLOURS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOMERS`
--

DROP TABLE IF EXISTS `CUSTOMERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CUSTOMERS` (
  `customer` varchar(4) NOT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `FirstName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`customer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMERS`
--

LOCK TABLES `CUSTOMERS` WRITE;
/*!40000 ALTER TABLE `CUSTOMERS` DISABLE KEYS */;
INSERT INTO `CUSTOMERS` VALUES ('EJ','Etienne','Joky');
/*!40000 ALTER TABLE `CUSTOMERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ENGIN_TYPES`
--

DROP TABLE IF EXISTS `ENGIN_TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ENGIN_TYPES` (
  `engin_type` int NOT NULL AUTO_INCREMENT,
  `Engins` varchar(255) NOT NULL,
  PRIMARY KEY (`engin_type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ENGIN_TYPES`
--

LOCK TABLES `ENGIN_TYPES` WRITE;
/*!40000 ALTER TABLE `ENGIN_TYPES` DISABLE KEYS */;
INSERT INTO `ENGIN_TYPES` VALUES (1,'Electric'),(2,'Hybrid'),(3,'Petrol');
/*!40000 ALTER TABLE `ENGIN_TYPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MAINTENANCES`
--

DROP TABLE IF EXISTS `MAINTENANCES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MAINTENANCES` (
  `maintenance` int NOT NULL AUTO_INCREMENT,
  `service_offered` int DEFAULT NULL,
  `Maintenances` varchar(255) NOT NULL,
  PRIMARY KEY (`maintenance`),
  KEY `service_offered` (`service_offered`),
  CONSTRAINT `MAINTENANCES_ibfk_1` FOREIGN KEY (`service_offered`) REFERENCES `SERVICES_OFFERED` (`service_offered`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MAINTENANCES`
--

LOCK TABLES `MAINTENANCES` WRITE;
/*!40000 ALTER TABLE `MAINTENANCES` DISABLE KEYS */;
INSERT INTO `MAINTENANCES` VALUES (1,NULL,'Brake'),(2,NULL,'Repair'),(3,NULL,'Tires'),(4,NULL,'Transmission');
/*!40000 ALTER TABLE `MAINTENANCES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MAKES`
--

DROP TABLE IF EXISTS `MAKES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MAKES` (
  `make` varchar(30) NOT NULL,
  `origin` varchar(30) NOT NULL,
  `Makes` varchar(30) NOT NULL,
  PRIMARY KEY (`make`,`origin`),
  KEY `origin` (`origin`),
  CONSTRAINT `MAKES_ibfk_1` FOREIGN KEY (`origin`) REFERENCES `ORIGINS` (`origin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MAKES`
--

LOCK TABLES `MAKES` WRITE;
/*!40000 ALTER TABLE `MAKES` DISABLE KEYS */;
INSERT INTO `MAKES` VALUES ('acura','japan','ACURA'),('jeep','usa','JEEP'),('lamborghini','italy','LAMBORGHINI');
/*!40000 ALTER TABLE `MAKES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MODELS`
--

DROP TABLE IF EXISTS `MODELS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MODELS` (
  `model` int NOT NULL AUTO_INCREMENT,
  `make` varchar(30) DEFAULT NULL,
  `year` int DEFAULT NULL,
  `colour` varchar(30) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `Models` varchar(50) NOT NULL,
  PRIMARY KEY (`model`),
  KEY `year` (`year`),
  KEY `price` (`price`),
  KEY `make` (`make`),
  KEY `colour` (`colour`),
  CONSTRAINT `MODELS_ibfk_1` FOREIGN KEY (`year`) REFERENCES `YEARS` (`year`),
  CONSTRAINT `MODELS_ibfk_2` FOREIGN KEY (`price`) REFERENCES `PRICES` (`price`),
  CONSTRAINT `MODELS_ibfk_3` FOREIGN KEY (`make`) REFERENCES `MAKES` (`make`),
  CONSTRAINT `MODELS_ibfk_4` FOREIGN KEY (`colour`) REFERENCES `COLOURS` (`colour`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MODELS`
--

LOCK TABLES `MODELS` WRITE;
/*!40000 ALTER TABLE `MODELS` DISABLE KEYS */;
INSERT INTO `MODELS` VALUES (1,'acura',1,'blk',2,'NSX'),(2,'jeep',2,'wht',1,'WRANGLER'),(3,'lamborghini',3,'grn',3,'AVENTADOR');
/*!40000 ALTER TABLE `MODELS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORIGINS`
--

DROP TABLE IF EXISTS `ORIGINS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ORIGINS` (
  `origin` varchar(30) NOT NULL,
  `Origins` text NOT NULL,
  PRIMARY KEY (`origin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORIGINS`
--

LOCK TABLES `ORIGINS` WRITE;
/*!40000 ALTER TABLE `ORIGINS` DISABLE KEYS */;
INSERT INTO `ORIGINS` VALUES ('italy','ITALY'),('japan','JAPAN'),('usa','USA');
/*!40000 ALTER TABLE `ORIGINS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PAYMENTS`
--

DROP TABLE IF EXISTS `PAYMENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PAYMENTS` (
  `payment` int NOT NULL AUTO_INCREMENT,
  `customer` varchar(4) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `Amount` decimal(10,0) NOT NULL DEFAULT '50000',
  `DateOfTransaction` date DEFAULT '2019-11-27',
  PRIMARY KEY (`payment`),
  KEY `customer` (`customer`),
  KEY `price` (`price`),
  CONSTRAINT `PAYMENTS_ibfk_1` FOREIGN KEY (`customer`) REFERENCES `CUSTOMERS` (`customer`),
  CONSTRAINT `PAYMENTS_ibfk_2` FOREIGN KEY (`price`) REFERENCES `PRICES` (`price`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PAYMENTS`
--

LOCK TABLES `PAYMENTS` WRITE;
/*!40000 ALTER TABLE `PAYMENTS` DISABLE KEYS */;
INSERT INTO `PAYMENTS` VALUES (1,'EJ',1,50000,'2019-11-27'),(2,'EJ',2,50000,'2019-11-27');
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
  `Prices` int NOT NULL,
  PRIMARY KEY (`price`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRICES`
--

LOCK TABLES `PRICES` WRITE;
/*!40000 ALTER TABLE `PRICES` DISABLE KEYS */;
INSERT INTO `PRICES` VALUES (1,43000),(2,39000),(3,1430000);
/*!40000 ALTER TABLE `PRICES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SERVICES_OFFERED`
--

DROP TABLE IF EXISTS `SERVICES_OFFERED`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SERVICES_OFFERED` (
  `service_offered` int NOT NULL AUTO_INCREMENT,
  `Sale` text,
  `Country` text,
  PRIMARY KEY (`service_offered`)
) ENGINE=InnoDB AUTO_INCREMENT=521 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SERVICES_OFFERED`
--

LOCK TABLES `SERVICES_OFFERED` WRITE;
/*!40000 ALTER TABLE `SERVICES_OFFERED` DISABLE KEYS */;
INSERT INTO `SERVICES_OFFERED` VALUES (1,'Sport_Car',NULL),(2,'SUV',NULL),(3,'Truck',NULL),(4,NULL,'UNITED STATES (USA)'),(5,NULL,'CHINA'),(6,NULL,'JAPAN'),(7,NULL,'MEXICO'),(8,NULL,'UNITED STATES (USA)'),(9,NULL,'CANADA'),(10,NULL,'UNITED STATES (USA)'),(11,NULL,'UNITED STATES (USA)'),(12,NULL,'UNITED STATES (USA)'),(13,NULL,'UNITED STATES (USA)'),(14,NULL,'UNITED STATES (USA)'),(15,NULL,'UNITED STATES (USA)'),(16,NULL,'UNITED STATES (USA)'),(17,NULL,'UNITED STATES (USA)'),(18,NULL,'ENGLAND'),(19,NULL,'UNITED STATES (USA)'),(20,NULL,'UNITED STATES (USA)'),(21,NULL,'ENGLAND'),(22,NULL,'UNITED STATES (USA)'),(23,NULL,'UNITED STATES (USA)'),(24,NULL,'UNITED STATES (USA)'),(25,NULL,'UNITED STATES (USA)'),(26,NULL,'UNITED STATES (USA)'),(27,NULL,'UNITED STATES (USA)'),(28,NULL,'UNITED STATES (USA)'),(29,NULL,'UNITED STATES (USA)'),(30,NULL,'UNITED STATES (USA)'),(31,NULL,'JAPAN'),(32,NULL,'UNITED STATES (USA)'),(33,NULL,'UNITED STATES (USA)'),(34,NULL,'UNITED STATES (USA)'),(35,NULL,'UNITED STATES (USA)'),(36,NULL,'UNITED STATES (USA)'),(37,NULL,'UNITED STATES (USA)'),(38,NULL,'UNITED STATES (USA)'),(39,NULL,'UNITED STATES (USA)'),(40,NULL,'UNITED STATES (USA)'),(41,NULL,'UNITED STATES (USA)'),(42,NULL,'UNITED STATES (USA)'),(43,NULL,'UNITED STATES (USA)'),(44,NULL,'UNITED STATES (USA)'),(45,NULL,'TURKEY'),(46,NULL,'UNITED STATES (USA)'),(47,NULL,'UNITED STATES (USA)'),(48,NULL,'UNITED STATES (USA)'),(49,NULL,'ITALY'),(50,NULL,'CANADA'),(51,NULL,'TAIWAN'),(52,NULL,'UNITED STATES (USA)'),(53,NULL,'UNITED STATES (USA)'),(54,NULL,''),(55,NULL,'ITALY'),(56,NULL,'UNITED STATES (USA)'),(57,NULL,'UNITED STATES (USA)'),(58,NULL,'UNITED STATES (USA)'),(59,NULL,'UNITED STATES (USA)'),(60,NULL,''),(61,NULL,''),(62,NULL,'UNITED STATES (USA)'),(63,NULL,'GERMANY'),(64,NULL,''),(65,NULL,''),(66,NULL,'UNITED STATES (USA)'),(67,NULL,''),(68,NULL,'TAIWAN'),(69,NULL,'UNITED STATES (USA)'),(70,NULL,'FRANCE'),(71,NULL,''),(72,NULL,'UNITED STATES (USA)'),(73,NULL,'UNITED STATES (USA)'),(74,NULL,'UNITED STATES (USA)'),(75,NULL,''),(76,NULL,'UNITED STATES (USA)'),(77,NULL,'BELGIUM'),(78,NULL,'UNITED STATES (USA)'),(79,NULL,'AUSTRIA'),(80,NULL,'BRAZIL'),(81,NULL,'CHINA'),(82,NULL,'UNITED STATES (USA)'),(83,NULL,'UNITED STATES (USA)'),(84,NULL,'JAPAN'),(85,NULL,'UNITED STATES (USA)'),(86,NULL,'UNITED STATES (USA)'),(87,NULL,'UNITED STATES (USA)'),(88,NULL,'UNITED STATES (USA)'),(89,NULL,'UNITED STATES (USA)'),(90,NULL,'UNITED STATES (USA)'),(91,NULL,'CHINA'),(92,NULL,'CHINA'),(93,NULL,'JAPAN'),(94,NULL,'JAPAN'),(95,NULL,'MEXICO'),(96,NULL,'MEXICO'),(97,NULL,'UNITED STATES (USA)'),(98,NULL,'UNITED STATES (USA)'),(99,NULL,'CANADA'),(100,NULL,'CANADA'),(101,NULL,'UNITED STATES (USA)'),(102,NULL,'UNITED STATES (USA)'),(103,NULL,'UNITED STATES (USA)'),(104,NULL,'UNITED STATES (USA)'),(105,NULL,'UNITED STATES (USA)'),(106,NULL,'UNITED STATES (USA)'),(107,NULL,'UNITED STATES (USA)'),(108,NULL,'UNITED STATES (USA)'),(109,NULL,'UNITED STATES (USA)'),(110,NULL,'UNITED STATES (USA)'),(111,NULL,'UNITED STATES (USA)'),(112,NULL,'UNITED STATES (USA)'),(113,NULL,'UNITED STATES (USA)'),(114,NULL,'UNITED STATES (USA)'),(115,NULL,'UNITED STATES (USA)'),(116,NULL,'UNITED STATES (USA)'),(117,NULL,'ENGLAND'),(118,NULL,'ENGLAND'),(119,NULL,'UNITED STATES (USA)'),(120,NULL,'UNITED STATES (USA)'),(121,NULL,'UNITED STATES (USA)'),(122,NULL,'UNITED STATES (USA)'),(123,NULL,'ENGLAND'),(124,NULL,'ENGLAND'),(125,NULL,'UNITED STATES (USA)'),(126,NULL,'UNITED STATES (USA)'),(127,NULL,'UNITED STATES (USA)'),(128,NULL,'UNITED STATES (USA)'),(129,NULL,'UNITED STATES (USA)'),(130,NULL,'UNITED STATES (USA)'),(131,NULL,'UNITED STATES (USA)'),(132,NULL,'UNITED STATES (USA)'),(133,NULL,'UNITED STATES (USA)'),(134,NULL,'UNITED STATES (USA)'),(135,NULL,'UNITED STATES (USA)'),(136,NULL,'UNITED STATES (USA)'),(137,NULL,'UNITED STATES (USA)'),(138,NULL,'UNITED STATES (USA)'),(139,NULL,'UNITED STATES (USA)'),(140,NULL,'UNITED STATES (USA)'),(141,NULL,'UNITED STATES (USA)'),(142,NULL,'UNITED STATES (USA)'),(143,NULL,'JAPAN'),(144,NULL,'JAPAN'),(145,NULL,'UNITED STATES (USA)'),(146,NULL,'UNITED STATES (USA)'),(147,NULL,'UNITED STATES (USA)'),(148,NULL,'UNITED STATES (USA)'),(149,NULL,'UNITED STATES (USA)'),(150,NULL,'UNITED STATES (USA)'),(151,NULL,'UNITED STATES (USA)'),(152,NULL,'UNITED STATES (USA)'),(153,NULL,'UNITED STATES (USA)'),(154,NULL,'UNITED STATES (USA)'),(155,NULL,'UNITED STATES (USA)'),(156,NULL,'UNITED STATES (USA)'),(157,NULL,'UNITED STATES (USA)'),(158,NULL,'UNITED STATES (USA)'),(159,NULL,'UNITED STATES (USA)'),(160,NULL,'UNITED STATES (USA)'),(161,NULL,'UNITED STATES (USA)'),(162,NULL,'UNITED STATES (USA)'),(163,NULL,'UNITED STATES (USA)'),(164,NULL,'UNITED STATES (USA)'),(165,NULL,'UNITED STATES (USA)'),(166,NULL,'UNITED STATES (USA)'),(167,NULL,'UNITED STATES (USA)'),(168,NULL,'UNITED STATES (USA)'),(169,NULL,'UNITED STATES (USA)'),(170,NULL,'UNITED STATES (USA)'),(171,NULL,'TURKEY'),(172,NULL,'TURKEY'),(173,NULL,'UNITED STATES (USA)'),(174,NULL,'UNITED STATES (USA)'),(175,NULL,'UNITED STATES (USA)'),(176,NULL,'UNITED STATES (USA)'),(177,NULL,'UNITED STATES (USA)'),(178,NULL,'UNITED STATES (USA)'),(179,NULL,'ITALY'),(180,NULL,'ITALY'),(181,NULL,'CANADA'),(182,NULL,'CANADA'),(183,NULL,'TAIWAN'),(184,NULL,'TAIWAN'),(185,NULL,'UNITED STATES (USA)'),(186,NULL,'UNITED STATES (USA)'),(187,NULL,'UNITED STATES (USA)'),(188,NULL,'UNITED STATES (USA)'),(189,NULL,''),(190,NULL,''),(191,NULL,'ITALY'),(192,NULL,'ITALY'),(193,NULL,'UNITED STATES (USA)'),(194,NULL,'UNITED STATES (USA)'),(195,NULL,'UNITED STATES (USA)'),(196,NULL,'UNITED STATES (USA)'),(197,NULL,'UNITED STATES (USA)'),(198,NULL,'UNITED STATES (USA)'),(199,NULL,'UNITED STATES (USA)'),(200,NULL,'UNITED STATES (USA)'),(201,NULL,''),(202,NULL,''),(203,NULL,''),(204,NULL,''),(205,NULL,'UNITED STATES (USA)'),(206,NULL,'UNITED STATES (USA)'),(207,NULL,'GERMANY'),(208,NULL,'GERMANY'),(209,NULL,''),(210,NULL,''),(211,NULL,''),(212,NULL,''),(213,NULL,'UNITED STATES (USA)'),(214,NULL,'UNITED STATES (USA)'),(215,NULL,''),(216,NULL,''),(217,NULL,'TAIWAN'),(218,NULL,'TAIWAN'),(219,NULL,'UNITED STATES (USA)'),(220,NULL,'UNITED STATES (USA)'),(221,NULL,'FRANCE'),(222,NULL,'FRANCE'),(223,NULL,''),(224,NULL,''),(225,NULL,'UNITED STATES (USA)'),(226,NULL,'UNITED STATES (USA)'),(227,NULL,'UNITED STATES (USA)'),(228,NULL,'UNITED STATES (USA)'),(229,NULL,'UNITED STATES (USA)'),(230,NULL,'UNITED STATES (USA)'),(231,NULL,''),(232,NULL,''),(233,NULL,'UNITED STATES (USA)'),(234,NULL,'UNITED STATES (USA)'),(235,NULL,'BELGIUM'),(236,NULL,'BELGIUM'),(237,NULL,'UNITED STATES (USA)'),(238,NULL,'UNITED STATES (USA)'),(239,NULL,'AUSTRIA'),(240,NULL,'AUSTRIA'),(241,NULL,'BRAZIL'),(242,NULL,'BRAZIL'),(243,NULL,'CHINA'),(244,NULL,'CHINA'),(245,NULL,'UNITED STATES (USA)'),(246,NULL,'UNITED STATES (USA)'),(247,NULL,'UNITED STATES (USA)'),(248,NULL,'UNITED STATES (USA)'),(249,NULL,'JAPAN'),(250,NULL,'JAPAN'),(251,NULL,'UNITED STATES (USA)'),(252,NULL,'UNITED STATES (USA)'),(253,NULL,'UNITED STATES (USA)'),(254,NULL,'UNITED STATES (USA)'),(255,NULL,'UNITED STATES (USA)'),(256,NULL,'UNITED STATES (USA)'),(257,NULL,'UNITED STATES (USA)'),(258,NULL,'UNITED STATES (USA)'),(259,NULL,'UNITED STATES (USA)'),(260,NULL,'UNITED STATES (USA)'),(261,NULL,'UNITED STATES (USA)'),(262,NULL,'UNITED STATES (USA)'),(263,NULL,'CHINA'),(264,NULL,'CHINA'),(265,NULL,'JAPAN'),(266,NULL,'JAPAN'),(267,NULL,'MEXICO'),(268,NULL,'MEXICO'),(269,NULL,'UNITED STATES (USA)'),(270,NULL,'UNITED STATES (USA)'),(271,NULL,'CANADA'),(272,NULL,'CANADA'),(273,NULL,'UNITED STATES (USA)'),(274,NULL,'UNITED STATES (USA)'),(275,NULL,'UNITED STATES (USA)'),(276,NULL,'UNITED STATES (USA)'),(277,NULL,'UNITED STATES (USA)'),(278,NULL,'UNITED STATES (USA)'),(279,NULL,'UNITED STATES (USA)'),(280,NULL,'UNITED STATES (USA)'),(281,NULL,'UNITED STATES (USA)'),(282,NULL,'UNITED STATES (USA)'),(283,NULL,'UNITED STATES (USA)'),(284,NULL,'UNITED STATES (USA)'),(285,NULL,'UNITED STATES (USA)'),(286,NULL,'UNITED STATES (USA)'),(287,NULL,'UNITED STATES (USA)'),(288,NULL,'UNITED STATES (USA)'),(289,NULL,'ENGLAND'),(290,NULL,'ENGLAND'),(291,NULL,'UNITED STATES (USA)'),(292,NULL,'UNITED STATES (USA)'),(293,NULL,'UNITED STATES (USA)'),(294,NULL,'UNITED STATES (USA)'),(295,NULL,'ENGLAND'),(296,NULL,'ENGLAND'),(297,NULL,'UNITED STATES (USA)'),(298,NULL,'UNITED STATES (USA)'),(299,NULL,'UNITED STATES (USA)'),(300,NULL,'UNITED STATES (USA)'),(301,NULL,'UNITED STATES (USA)'),(302,NULL,'UNITED STATES (USA)'),(303,NULL,'UNITED STATES (USA)'),(304,NULL,'UNITED STATES (USA)'),(305,NULL,'UNITED STATES (USA)'),(306,NULL,'UNITED STATES (USA)'),(307,NULL,'UNITED STATES (USA)'),(308,NULL,'UNITED STATES (USA)'),(309,NULL,'UNITED STATES (USA)'),(310,NULL,'UNITED STATES (USA)'),(311,NULL,'UNITED STATES (USA)'),(312,NULL,'UNITED STATES (USA)'),(313,NULL,'UNITED STATES (USA)'),(314,NULL,'UNITED STATES (USA)'),(315,NULL,'JAPAN'),(316,NULL,'JAPAN'),(317,NULL,'UNITED STATES (USA)'),(318,NULL,'UNITED STATES (USA)'),(319,NULL,'UNITED STATES (USA)'),(320,NULL,'UNITED STATES (USA)'),(321,NULL,'UNITED STATES (USA)'),(322,NULL,'UNITED STATES (USA)'),(323,NULL,'UNITED STATES (USA)'),(324,NULL,'UNITED STATES (USA)'),(325,NULL,'UNITED STATES (USA)'),(326,NULL,'UNITED STATES (USA)'),(327,NULL,'UNITED STATES (USA)'),(328,NULL,'UNITED STATES (USA)'),(329,NULL,'UNITED STATES (USA)'),(330,NULL,'UNITED STATES (USA)'),(331,NULL,'UNITED STATES (USA)'),(332,NULL,'UNITED STATES (USA)'),(333,NULL,'UNITED STATES (USA)'),(334,NULL,'UNITED STATES (USA)'),(335,NULL,'UNITED STATES (USA)'),(336,NULL,'UNITED STATES (USA)'),(337,NULL,'UNITED STATES (USA)'),(338,NULL,'UNITED STATES (USA)'),(339,NULL,'UNITED STATES (USA)'),(340,NULL,'UNITED STATES (USA)'),(341,NULL,'UNITED STATES (USA)'),(342,NULL,'UNITED STATES (USA)'),(343,NULL,'TURKEY'),(344,NULL,'TURKEY'),(345,NULL,'UNITED STATES (USA)'),(346,NULL,'UNITED STATES (USA)'),(347,NULL,'UNITED STATES (USA)'),(348,NULL,'UNITED STATES (USA)'),(349,NULL,'UNITED STATES (USA)'),(350,NULL,'UNITED STATES (USA)'),(351,NULL,'ITALY'),(352,NULL,'ITALY'),(353,NULL,'CANADA'),(354,NULL,'CANADA'),(355,NULL,'TAIWAN'),(356,NULL,'TAIWAN'),(357,NULL,'UNITED STATES (USA)'),(358,NULL,'UNITED STATES (USA)'),(359,NULL,'UNITED STATES (USA)'),(360,NULL,'UNITED STATES (USA)'),(361,NULL,''),(362,NULL,''),(363,NULL,'ITALY'),(364,NULL,'ITALY'),(365,NULL,'UNITED STATES (USA)'),(366,NULL,'UNITED STATES (USA)'),(367,NULL,'UNITED STATES (USA)'),(368,NULL,'UNITED STATES (USA)'),(369,NULL,'UNITED STATES (USA)'),(370,NULL,'UNITED STATES (USA)'),(371,NULL,'UNITED STATES (USA)'),(372,NULL,'UNITED STATES (USA)'),(373,NULL,''),(374,NULL,''),(375,NULL,''),(376,NULL,''),(377,NULL,'UNITED STATES (USA)'),(378,NULL,'UNITED STATES (USA)'),(379,NULL,'GERMANY'),(380,NULL,'GERMANY'),(381,NULL,''),(382,NULL,''),(383,NULL,''),(384,NULL,''),(385,NULL,'UNITED STATES (USA)'),(386,NULL,'UNITED STATES (USA)'),(387,NULL,''),(388,NULL,''),(389,NULL,'TAIWAN'),(390,NULL,'TAIWAN'),(391,NULL,'UNITED STATES (USA)'),(392,NULL,'UNITED STATES (USA)'),(393,NULL,'FRANCE'),(394,NULL,'FRANCE'),(395,NULL,''),(396,NULL,''),(397,NULL,'UNITED STATES (USA)'),(398,NULL,'UNITED STATES (USA)'),(399,NULL,'UNITED STATES (USA)'),(400,NULL,'UNITED STATES (USA)'),(401,NULL,'UNITED STATES (USA)'),(402,NULL,'UNITED STATES (USA)'),(403,NULL,''),(404,NULL,''),(405,NULL,'UNITED STATES (USA)'),(406,NULL,'UNITED STATES (USA)'),(407,NULL,'BELGIUM'),(408,NULL,'BELGIUM'),(409,NULL,'UNITED STATES (USA)'),(410,NULL,'UNITED STATES (USA)'),(411,NULL,'AUSTRIA'),(412,NULL,'AUSTRIA'),(413,NULL,'BRAZIL'),(414,NULL,'BRAZIL'),(415,NULL,'CHINA'),(416,NULL,'CHINA'),(417,NULL,'UNITED STATES (USA)'),(418,NULL,'UNITED STATES (USA)'),(419,NULL,'UNITED STATES (USA)'),(420,NULL,'UNITED STATES (USA)'),(421,NULL,'JAPAN'),(422,NULL,'JAPAN'),(423,NULL,'UNITED STATES (USA)'),(424,NULL,'UNITED STATES (USA)'),(425,NULL,'UNITED STATES (USA)'),(426,NULL,'UNITED STATES (USA)'),(427,NULL,'UNITED STATES (USA)'),(428,NULL,'UNITED STATES (USA)'),(429,NULL,'UNITED STATES (USA)'),(430,NULL,'UNITED STATES (USA)'),(431,NULL,'UNITED STATES (USA)'),(432,NULL,'UNITED STATES (USA)'),(433,NULL,'UNITED STATES (USA)'),(434,NULL,'UNITED STATES (USA)'),(435,NULL,'CHINA'),(436,NULL,'JAPAN'),(437,NULL,'MEXICO'),(438,NULL,'UNITED STATES (USA)'),(439,NULL,'CANADA'),(440,NULL,'UNITED STATES (USA)'),(441,NULL,'UNITED STATES (USA)'),(442,NULL,'UNITED STATES (USA)'),(443,NULL,'UNITED STATES (USA)'),(444,NULL,'UNITED STATES (USA)'),(445,NULL,'UNITED STATES (USA)'),(446,NULL,'UNITED STATES (USA)'),(447,NULL,'UNITED STATES (USA)'),(448,NULL,'ENGLAND'),(449,NULL,'UNITED STATES (USA)'),(450,NULL,'UNITED STATES (USA)'),(451,NULL,'ENGLAND'),(452,NULL,'UNITED STATES (USA)'),(453,NULL,'UNITED STATES (USA)'),(454,NULL,'UNITED STATES (USA)'),(455,NULL,'UNITED STATES (USA)'),(456,NULL,'UNITED STATES (USA)'),(457,NULL,'UNITED STATES (USA)'),(458,NULL,'UNITED STATES (USA)'),(459,NULL,'UNITED STATES (USA)'),(460,NULL,'UNITED STATES (USA)'),(461,NULL,'JAPAN'),(462,NULL,'UNITED STATES (USA)'),(463,NULL,'UNITED STATES (USA)'),(464,NULL,'UNITED STATES (USA)'),(465,NULL,'UNITED STATES (USA)'),(466,NULL,'UNITED STATES (USA)'),(467,NULL,'UNITED STATES (USA)'),(468,NULL,'UNITED STATES (USA)'),(469,NULL,'UNITED STATES (USA)'),(470,NULL,'UNITED STATES (USA)'),(471,NULL,'UNITED STATES (USA)'),(472,NULL,'UNITED STATES (USA)'),(473,NULL,'UNITED STATES (USA)'),(474,NULL,'UNITED STATES (USA)'),(475,NULL,'TURKEY'),(476,NULL,'UNITED STATES (USA)'),(477,NULL,'UNITED STATES (USA)'),(478,NULL,'UNITED STATES (USA)'),(479,NULL,'ITALY'),(480,NULL,'CANADA'),(481,NULL,'TAIWAN'),(482,NULL,'UNITED STATES (USA)'),(483,NULL,'UNITED STATES (USA)'),(484,NULL,''),(485,NULL,'ITALY'),(486,NULL,'UNITED STATES (USA)'),(487,NULL,'UNITED STATES (USA)'),(488,NULL,'UNITED STATES (USA)'),(489,NULL,'UNITED STATES (USA)'),(490,NULL,''),(491,NULL,''),(492,NULL,'UNITED STATES (USA)'),(493,NULL,'GERMANY'),(494,NULL,''),(495,NULL,''),(496,NULL,'UNITED STATES (USA)'),(497,NULL,''),(498,NULL,'TAIWAN'),(499,NULL,'UNITED STATES (USA)'),(500,NULL,'FRANCE'),(501,NULL,''),(502,NULL,'UNITED STATES (USA)'),(503,NULL,'UNITED STATES (USA)'),(504,NULL,'UNITED STATES (USA)'),(505,NULL,''),(506,NULL,'UNITED STATES (USA)'),(507,NULL,'BELGIUM'),(508,NULL,'UNITED STATES (USA)'),(509,NULL,'AUSTRIA'),(510,NULL,'BRAZIL'),(511,NULL,'CHINA'),(512,NULL,'UNITED STATES (USA)'),(513,NULL,'UNITED STATES (USA)'),(514,NULL,'JAPAN'),(515,NULL,'UNITED STATES (USA)'),(516,NULL,'UNITED STATES (USA)'),(517,NULL,'UNITED STATES (USA)'),(518,NULL,'UNITED STATES (USA)'),(519,NULL,'UNITED STATES (USA)'),(520,NULL,'UNITED STATES (USA)');
/*!40000 ALTER TABLE `SERVICES_OFFERED` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `YEARS`
--

DROP TABLE IF EXISTS `YEARS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `YEARS` (
  `year` int NOT NULL AUTO_INCREMENT,
  `Years` date DEFAULT NULL,
  PRIMARY KEY (`year`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `YEARS`
--

LOCK TABLES `YEARS` WRITE;
/*!40000 ALTER TABLE `YEARS` DISABLE KEYS */;
INSERT INTO `YEARS` VALUES (1,'2019-02-20'),(2,'2019-01-03'),(3,'2019-11-09');
/*!40000 ALTER TABLE `YEARS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cars` (
  `doc` json DEFAULT NULL,
  `_id` varbinary(32) GENERATED ALWAYS AS (json_unquote(json_extract(`doc`,_utf8mb4'$._id'))) STORED NOT NULL,
  `_json_schema` json GENERATED ALWAYS AS (_utf8mb4'{"type":"object"}') VIRTUAL,
  PRIMARY KEY (`_id`),
  CONSTRAINT `$val_strict_DA10F702C42E99164BC1A5780503227F9F69061A` CHECK (json_schema_valid(`_json_schema`,`doc`)) /*!80016 NOT ENFORCED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` (`doc`) VALUES ('{\"_id\": \"00005e5418af0000000000000001\", \"Cars\": {\"Carz\": [{\"Mfr_ID\": 1080, \"Country\": \"CHINA\", \"Mfr_Name\": \"GEELY GROUP ZHEJIANG MOTORCYCLE CO., LTD.\", \"VehicleTypes\": [{\"Name\": \"Motorcycle\", \"IsPrimary\": false}], \"Mfr_CommonName\": null}, {\"Mfr_ID\": 1081, \"Country\": \"JAPAN\", \"Mfr_Name\": \"MITSUBISHI FUSO TRUCK & BUS CORPORATION\", \"VehicleTypes\": [], \"Mfr_CommonName\": \"Mitsubishi Fuso Truck\"}, {\"Mfr_ID\": 1083, \"Country\": \"MEXICO\", \"Mfr_Name\": \"MAZDA MOTOR MANUFACTURING DE MEXICO S.A. DE C.V.\", \"VehicleTypes\": [], \"Mfr_CommonName\": \"Mazda\"}, {\"Mfr_ID\": 1084, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"FOREST RIVER, INC.\", \"VehicleTypes\": [{\"Name\": \"Truck \", \"IsPrimary\": false}, {\"Name\": \"Bus\", \"IsPrimary\": false}, {\"Name\": \"Trailer\", \"IsPrimary\": true}], \"Mfr_CommonName\": \"FOREST RIVER, INC.\"}, {\"Mfr_ID\": 1085, \"Country\": \"CANADA\", \"Mfr_Name\": \"TOYOTA MOTOR MANUFACTURING CANADA\", \"VehicleTypes\": [], \"Mfr_CommonName\": \"Toyota\"}, {\"Mfr_ID\": 1086, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"Thomas Built Buses, Inc\", \"VehicleTypes\": [], \"Mfr_CommonName\": \"Thomas Built\"}, {\"Mfr_ID\": 1087, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"TOYOTA MOTOR MANUFACTURING, INDIANA, INC.\", \"VehicleTypes\": [], \"Mfr_CommonName\": \"Toyota\"}, {\"Mfr_ID\": 1088, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"TOYOTA MOTOR MANUFACTURING, KENTUCKY, INC.\", \"VehicleTypes\": [], \"Mfr_CommonName\": \"Toyota\"}, {\"Mfr_ID\": 1089, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"JOHN THOMAS, INC\", \"VehicleTypes\": [{\"Name\": \"Trailer\", \"IsPrimary\": true}], \"Mfr_CommonName\": null}, {\"Mfr_ID\": 1090, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"TOYOTA MOTOR MANUFACTURING, TEXAS, INC.\", \"VehicleTypes\": [], \"Mfr_CommonName\": \"Toyota\"}, {\"Mfr_ID\": 1091, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"TOYOTA MOTOR MANUFACTURING, NORTHERN KENTUCKY, INC.\", \"VehicleTypes\": [], \"Mfr_CommonName\": \"Toyota\"}, {\"Mfr_ID\": 1092, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"THOMAS GRINDING INC.\", \"VehicleTypes\": [{\"Name\": \"Trailer\", \"IsPrimary\": true}], \"Mfr_CommonName\": \"Thomas Grinding\"}, {\"Mfr_ID\": 1093, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"AM GENERAL CORPORATION \", \"VehicleTypes\": [{\"Name\": \"Multipurpose Passenger Vehicle (MPV)\", \"IsPrimary\": false}], \"Mfr_CommonName\": \"AM GENERAL\"}, {\"Mfr_ID\": 1094, \"Country\": \"ENGLAND\", \"Mfr_Name\": \"Morgan Motor Company Ltd\", \"VehicleTypes\": [], \"Mfr_CommonName\": \"Morgan Motor\"}, {\"Mfr_ID\": 1095, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"MORGAN TRAILERS, INC\", \"VehicleTypes\": [{\"Name\": \"Trailer\", \"IsPrimary\": true}], \"Mfr_CommonName\": \"Morgan Trailers\"}, {\"Mfr_ID\": 1096, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"Altec Environmental Products, LLC\", \"VehicleTypes\": [], \"Mfr_CommonName\": \"Altec\"}, {\"Mfr_ID\": 1097, \"Country\": \"ENGLAND\", \"Mfr_Name\": \"The Morgan 3 Wheeler Limited\", \"VehicleTypes\": [], \"Mfr_CommonName\": \"Morgan 3 Wheeler\"}, {\"Mfr_ID\": 1098, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"ISUZU MANUFACTURING SERVICES OF AMERICA, INC.\", \"VehicleTypes\": [], \"Mfr_CommonName\": \"Isuzu\"}, {\"Mfr_ID\": 1099, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"CENTRAL OHIO FABRICATION LLC\", \"VehicleTypes\": [{\"Name\": \"Trailer\", \"IsPrimary\": true}], \"Mfr_CommonName\": \"Central Ohio Fabrication\"}, {\"Mfr_ID\": 1100, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"THOR MOTOR COACH INC.\", \"VehicleTypes\": [], \"Mfr_CommonName\": \"Thor Motor Coach\"}, {\"Mfr_ID\": 1101, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"Thor Industries, Inc.\", \"VehicleTypes\": [], \"Mfr_CommonName\": \"Thor Industries\"}, {\"Mfr_ID\": 1102, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"BRECKENRIDGE\", \"VehicleTypes\": [], \"Mfr_CommonName\": \"Breckenridge\"}, {\"Mfr_ID\": 1104, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"CRUISER RV \", \"VehicleTypes\": [{\"Name\": \"Trailer\", \"IsPrimary\": true}], \"Mfr_CommonName\": \"Cruiser RV\"}, {\"Mfr_ID\": 1106, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"MVP RV INC. (THOR CALIFORNIA, INC.)\", \"VehicleTypes\": [{\"Name\": \"Trailer\", \"IsPrimary\": true}], \"Mfr_CommonName\": null}, {\"Mfr_ID\": 1107, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"THOR MANUFACTURING LLC\", \"VehicleTypes\": [{\"Name\": \"Trailer\", \"IsPrimary\": false}], \"Mfr_CommonName\": \"Thor Manufacturing\"}, {\"Mfr_ID\": 1108, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"WINNEBAGO OF INDIANA, LLC\", \"VehicleTypes\": [{\"Name\": \"Trailer\", \"IsPrimary\": true}], \"Mfr_CommonName\": \"Winnebago Of Indiana\"}, {\"Mfr_ID\": 1109, \"Country\": \"JAPAN\", \"Mfr_Name\": \"HINO MOTORS, LTD.\", \"VehicleTypes\": [{\"Name\": \"Truck \", \"IsPrimary\": false}, {\"Name\": \"Incomplete Vehicle\", \"IsPrimary\": false}], \"Mfr_CommonName\": \"HINO TRUCKS\"}, {\"Mfr_ID\": 1110, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"SUPREME CORPORATION\", \"VehicleTypes\": [{\"Name\": \"Truck \", \"IsPrimary\": true}, {\"Name\": \"Trailer\", \"IsPrimary\": false}, {\"Name\": \"Incomplete Vehicle\", \"IsPrimary\": false}], \"Mfr_CommonName\": \"Supreme Corp.\"}, {\"Mfr_ID\": 1115, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"KNAPHEIDE TRUCK EQUIPMENT COMPANY SOUTHWEST\", \"VehicleTypes\": [{\"Name\": \"Truck \", \"IsPrimary\": false}], \"Mfr_CommonName\": \"KNAPHEIDE Truck\"}, {\"Mfr_ID\": 1116, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"COLLINS WELDING, INC.\", \"VehicleTypes\": [{\"Name\": \"Trailer\", \"IsPrimary\": true}], \"Mfr_CommonName\": \"Collins Welding\"}, {\"Mfr_ID\": 1118, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"GILLIG LLC\", \"VehicleTypes\": [{\"Name\": \"Bus\", \"IsPrimary\": true}], \"Mfr_CommonName\": \"Gillig\"}, {\"Mfr_ID\": 1119, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"CHAMPION TRIKE MANUFACTURING INC.\", \"VehicleTypes\": [{\"Name\": \"Motorcycle\", \"IsPrimary\": true}], \"Mfr_CommonName\": \"Champion Trike\"}, {\"Mfr_ID\": 1120, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"CHAMPION TELECOM, INC.\", \"VehicleTypes\": [{\"Name\": \"Trailer\", \"IsPrimary\": false}], \"Mfr_CommonName\": null}, {\"Mfr_ID\": 1121, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"CHAMPION BRIDGE CO., INC.\", \"VehicleTypes\": [{\"Name\": \"Trailer\", \"IsPrimary\": false}], \"Mfr_CommonName\": null}, {\"Mfr_ID\": 1122, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"Champion Trailers, Inc.\", \"VehicleTypes\": [{\"Name\": \"Trailer\", \"IsPrimary\": false}], \"Mfr_CommonName\": null}, {\"Mfr_ID\": 1123, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"MICRO-LITE TRAILER MFG. LLC\", \"VehicleTypes\": [], \"Mfr_CommonName\": \"Micro-Lite Trailer\"}, {\"Mfr_ID\": 1124, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"PIERCE MANUFACTURING INC.\", \"VehicleTypes\": [{\"Name\": \"Truck \", \"IsPrimary\": true}], \"Mfr_CommonName\": \"PIERCE MANUFACTURING\"}, {\"Mfr_ID\": 1126, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"MOTOR COACH INDUSTRIES, INC.\", \"VehicleTypes\": [{\"Name\": \"Bus\", \"IsPrimary\": true}, {\"Name\": \"Incomplete Vehicle\", \"IsPrimary\": false}], \"Mfr_CommonName\": \"MCI\"}, {\"Mfr_ID\": 1127, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"TURTLEBACK TRAILERS LLC\", \"VehicleTypes\": [{\"Name\": \"Trailer\", \"IsPrimary\": false}], \"Mfr_CommonName\": null}, {\"Mfr_ID\": 1128, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"PREVOST A DIVISION OF PREVOST CAR (US) INC. (NOVA BUS, INCORPORATED)\", \"VehicleTypes\": [{\"Name\": \"Bus\", \"IsPrimary\": true}], \"Mfr_CommonName\": \"Prevost\"}, {\"Mfr_ID\": 1129, \"Country\": \"TURKEY\", \"Mfr_Name\": \"TEMSA ULASIM ARACLARI SANAYI VE TICARET A.S.\", \"VehicleTypes\": [{\"Name\": \"Bus\", \"IsPrimary\": false}], \"Mfr_CommonName\": \"TEMSA \"}, {\"Mfr_ID\": 1130, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"YAMAHA MOTOR CORPORATION\", \"VehicleTypes\": [{\"Name\": \"Motorcycle\", \"IsPrimary\": true}], \"Mfr_CommonName\": \"Yamaha\"}, {\"Mfr_ID\": 1131, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"TRIUMPH MOTORCYCLES (AMERICA) LIMITED\", \"VehicleTypes\": [{\"Name\": \"Motorcycle\", \"IsPrimary\": true}], \"Mfr_CommonName\": \"Triumph Motorcycles\"}, {\"Mfr_ID\": 1132, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"POLARIS INDUSTRIES INC.\", \"VehicleTypes\": [{\"Name\": \"Motorcycle\", \"IsPrimary\": true}, {\"Name\": \"Low Speed Vehicle (LSV)\", \"IsPrimary\": false}], \"Mfr_CommonName\": \"Polaris\"}, {\"Mfr_ID\": 1133, \"Country\": \"ITALY\", \"Mfr_Name\": \"DUCATI MOTOR HOLDING S.p.A. \", \"VehicleTypes\": [{\"Name\": \"Motorcycle\", \"IsPrimary\": true}], \"Mfr_CommonName\": \"Ducati\"}, {\"Mfr_ID\": 1134, \"Country\": \"CANADA\", \"Mfr_Name\": \"BOMBARDIER RECREATIONAL PRODUCTS INC \", \"VehicleTypes\": [{\"Name\": \"Low Speed Vehicle (LSV)\", \"IsPrimary\": true}], \"Mfr_CommonName\": \"BRP\"}, {\"Mfr_ID\": 1135, \"Country\": \"TAIWAN\", \"Mfr_Name\": \"MOTIVE POWER INDUSTRY CO LTD\", \"VehicleTypes\": [{\"Name\": \"Motorcycle\", \"IsPrimary\": false}], \"Mfr_CommonName\": \"Genuine Scooters\"}, {\"Mfr_ID\": 1136, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"GENUINE JACKS MANUFACTURING INC\", \"VehicleTypes\": [{\"Name\": \"Trailer\", \"IsPrimary\": true}], \"Mfr_CommonName\": null}, {\"Mfr_ID\": 1137, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"SAAB CARS NORTH AMERICA, INC.\", \"VehicleTypes\": [], \"Mfr_CommonName\": \"SAAB\"}, {\"Mfr_ID\": 1138, \"Country\": \"\", \"Mfr_Name\": \"Doosan Infracore Portable Power\", \"VehicleTypes\": [], \"Mfr_CommonName\": \"Bobcat\"}, {\"Mfr_ID\": 1139, \"Country\": \"ITALY\", \"Mfr_Name\": \"MOTO GUZZI S.P.A\", \"VehicleTypes\": [{\"Name\": \"Motorcycle\", \"IsPrimary\": true}], \"Mfr_CommonName\": \"Moto Guzzi\"}, {\"Mfr_ID\": 1140, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"VICTORY SWEEPERS INC\", \"VehicleTypes\": [], \"Mfr_CommonName\": null}, {\"Mfr_ID\": 1141, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"VICTORY INDUSTRIAL PRODUCTS\", \"VehicleTypes\": [{\"Name\": \"Trailer\", \"IsPrimary\": true}], \"Mfr_CommonName\": null}, {\"Mfr_ID\": 1142, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"KTLL Group LLC dBa VICTORY TRAILERS\", \"VehicleTypes\": [{\"Name\": \"Trailer\", \"IsPrimary\": false}], \"Mfr_CommonName\": null}, {\"Mfr_ID\": 1144, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"ROCKET ROGERS VICTORY OLD 97 CHOPPERS INC\", \"VehicleTypes\": [{\"Name\": \"Motorcycle\", \"IsPrimary\": true}], \"Mfr_CommonName\": null}, {\"Mfr_ID\": 1145, \"Country\": \"\", \"Mfr_Name\": \"TOYOTA MOTOR MANUFACTURING, MISSISSIPPI, INC.\", \"VehicleTypes\": [], \"Mfr_CommonName\": \"Toyota\"}, {\"Mfr_ID\": 1146, \"Country\": \"\", \"Mfr_Name\": \"DAIMLER CHRYSLER AG\", \"VehicleTypes\": [], \"Mfr_CommonName\": \"Daimler Chrysler\"}, {\"Mfr_ID\": 1147, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"VOLKSWAGEN GROUP OF AMERICA, INC.\", \"VehicleTypes\": [{\"Name\": \"Passenger Car\", \"IsPrimary\": false}, {\"Name\": \"Multipurpose Passenger Vehicle (MPV)\", \"IsPrimary\": false}], \"Mfr_CommonName\": \"Volkswagen\"}, {\"Mfr_ID\": 1148, \"Country\": \"GERMANY\", \"Mfr_Name\": \"VOLKSWAGEN AG\", \"VehicleTypes\": [], \"Mfr_CommonName\": \"Volkswagen\"}, {\"Mfr_ID\": 1149, \"Country\": \"\", \"Mfr_Name\": \"AUDI\", \"VehicleTypes\": [], \"Mfr_CommonName\": \"Audi\"}, {\"Mfr_ID\": 1150, \"Country\": \"\", \"Mfr_Name\": \"quattro GmbH\", \"VehicleTypes\": [], \"Mfr_CommonName\": \"quattro GmbH\"}, {\"Mfr_ID\": 1151, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"GOOGLE AUTO LLC\", \"VehicleTypes\": [{\"Name\": \"Low Speed Vehicle (LSV)\", \"IsPrimary\": true}], \"Mfr_CommonName\": \"Google Auto\"}, {\"Mfr_ID\": 1152, \"Country\": \"\", \"Mfr_Name\": \"KAWASAKI MOTORS CORP., U.S.A.\", \"VehicleTypes\": [], \"Mfr_CommonName\": \"Kawasaki\"}, {\"Mfr_ID\": 1153, \"Country\": \"TAIWAN\", \"Mfr_Name\": \"YAMAHA MOTOR TAIWAN CO., LTD.\", \"VehicleTypes\": [{\"Name\": \"Motorcycle\", \"IsPrimary\": true}], \"Mfr_CommonName\": \"Yamaha\"}, {\"Mfr_ID\": 1154, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"AMERICAN HONDA MOTOR CO., INC.\", \"VehicleTypes\": [{\"Name\": \"Motorcycle\", \"IsPrimary\": false}, {\"Name\": \"Passenger Car\", \"IsPrimary\": true}, {\"Name\": \"Truck \", \"IsPrimary\": false}, {\"Name\": \"Multipurpose Passenger Vehicle (MPV)\", \"IsPrimary\": false}], \"Mfr_CommonName\": \"Honda\"}, {\"Mfr_ID\": 1155, \"Country\": \"FRANCE\", \"Mfr_Name\": \"TOYOTA MOTOR MANUFACTURING, FRANCE, S.A.S.\", \"VehicleTypes\": [], \"Mfr_CommonName\": \"Toyota\"}, {\"Mfr_ID\": 1156, \"Country\": \"\", \"Mfr_Name\": \"Workhorse Manufacturing, Inc\", \"VehicleTypes\": [], \"Mfr_CommonName\": \"Workhorse Manufacturing Inc\"}, {\"Mfr_ID\": 1157, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"WATERTRAILERS.NET, INC.\", \"VehicleTypes\": [{\"Name\": \"Trailer\", \"IsPrimary\": true}], \"Mfr_CommonName\": \"Workhorse Water Trailer\"}, {\"Mfr_ID\": 1158, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"WORKHORSE INDUSTRIES OF TEXAS\", \"VehicleTypes\": [], \"Mfr_CommonName\": null}, {\"Mfr_ID\": 1159, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"Shasta Industries LLC\", \"VehicleTypes\": [], \"Mfr_CommonName\": \"Shasta\"}, {\"Mfr_ID\": 1160, \"Country\": \"\", \"Mfr_Name\": \"detroit chassis llc, usa\", \"VehicleTypes\": [], \"Mfr_CommonName\": null}, {\"Mfr_ID\": 1162, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"BUELL MOTORCYCLE COMPANY\", \"VehicleTypes\": [], \"Mfr_CommonName\": \"Buell\"}, {\"Mfr_ID\": 1163, \"Country\": \"BELGIUM\", \"Mfr_Name\": \"VAN HOOL N.V.\", \"VehicleTypes\": [{\"Name\": \"Bus\", \"IsPrimary\": true}, {\"Name\": \"Incomplete Vehicle\", \"IsPrimary\": false}], \"Mfr_CommonName\": \"Van Hool\"}, {\"Mfr_ID\": 1164, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"VOLVO INDUSTRIAL DE MEXICO, S.A. DE C.V.\", \"VehicleTypes\": [{\"Name\": \"Bus\", \"IsPrimary\": true}], \"Mfr_CommonName\": \"Volvo Bus (Mexico)\"}, {\"Mfr_ID\": 1165, \"Country\": \"AUSTRIA\", \"Mfr_Name\": \"KTM SPORTMOTORCYCLE AG\", \"VehicleTypes\": [{\"Name\": \"Motorcycle\", \"IsPrimary\": false}], \"Mfr_CommonName\": \"KTM\"}, {\"Mfr_ID\": 1166, \"Country\": \"BRAZIL\", \"Mfr_Name\": \"BUSSCAR ONIBUS S.A.\", \"VehicleTypes\": [{\"Name\": \"Bus\", \"IsPrimary\": true}], \"Mfr_CommonName\": \"Busscar\"}, {\"Mfr_ID\": 1167, \"Country\": \"CHINA\", \"Mfr_Name\": \"ZheJiang LingYun Motorcycle Co., Ltd.\", \"VehicleTypes\": [{\"Name\": \"Motorcycle\", \"IsPrimary\": true}], \"Mfr_CommonName\": \"ZheJiang LingYun\"}, {\"Mfr_ID\": 1168, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"KTMMEX SA. DE CV.\", \"VehicleTypes\": [], \"Mfr_CommonName\": \"KTMMEX \"}, {\"Mfr_ID\": 1169, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"FERRARI NORTH AMERICA, INC.\", \"VehicleTypes\": [{\"Name\": \"Passenger Car\", \"IsPrimary\": true}], \"Mfr_CommonName\": \"Ferrari\"}, {\"Mfr_ID\": 1171, \"Country\": \"JAPAN\", \"Mfr_Name\": \"ISUZU MOTORS LIMITED, JAPAN\", \"VehicleTypes\": [{\"Name\": \"Passenger Car\", \"IsPrimary\": false}, {\"Name\": \"Truck \", \"IsPrimary\": false}, {\"Name\": \"Multipurpose Passenger Vehicle (MPV)\", \"IsPrimary\": false}, {\"Name\": \"Incomplete Vehicle\", \"IsPrimary\": false}], \"Mfr_CommonName\": \"Isuzu\"}, {\"Mfr_ID\": 1173, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"DAMON CORPORATION\", \"VehicleTypes\": [{\"Name\": \"Multipurpose Passenger Vehicle (MPV)\", \"IsPrimary\": true}], \"Mfr_CommonName\": \"BRECKENRIDGE PARK\"}, {\"Mfr_ID\": 1174, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"AM GENERAL LLC\", \"VehicleTypes\": [{\"Name\": \"Multipurpose Passenger Vehicle (MPV)\", \"IsPrimary\": false}], \"Mfr_CommonName\": \"MOBILITY VENTURES\"}, {\"Mfr_ID\": 1175, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"O3 INDUSTRIES LLC\", \"VehicleTypes\": [{\"Name\": \"Trailer\", \"IsPrimary\": false}], \"Mfr_CommonName\": \"Q3\"}, {\"Mfr_ID\": 1176, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"280 TRAILERS LLC\", \"VehicleTypes\": [{\"Name\": \"Trailer\", \"IsPrimary\": true}], \"Mfr_CommonName\": \"280 Trailers\"}, {\"Mfr_ID\": 1177, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"3D CUSTOM ALUMINUM, LLC\", \"VehicleTypes\": [], \"Mfr_CommonName\": \"3D Custom Aluminum\"}, {\"Mfr_ID\": 1178, \"Country\": \"UNITED STATES (USA)\", \"Mfr_Name\": \"3T MFG.\", \"VehicleTypes\": [{\"Name\": \"Trailer\", \"IsPrimary\": false}, {\"Name\": \"Incomplete Vehicle\", \"IsPrimary\": false}], \"Mfr_CommonName\": null}], \"Count\": 86, \"Message\": \"Response returned successfully\", \"SearchCriteria\": null}}');
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-24 19:26:32
