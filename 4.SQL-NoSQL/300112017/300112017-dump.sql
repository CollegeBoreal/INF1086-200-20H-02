-- MySQL dump 10.13  Distrib 8.0.18, for Linux (x86_64)
--
-- Host: localhost    Database: magasin
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
-- Table structure for table `CLIENTS`
--

DROP TABLE IF EXISTS `CLIENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENTS` (
  `client` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) DEFAULT NULL,
  `prenom` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`client`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENTS`
--

LOCK TABLES `CLIENTS` WRITE;
/*!40000 ALTER TABLE `CLIENTS` DISABLE KEYS */;
INSERT INTO `CLIENTS` VALUES (1,'Paul','Rocher'),(2,'EncoreVous','Ducobu');
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
  `Couleurs` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`couleur`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COULEURS`
--

LOCK TABLES `COULEURS` WRITE;
/*!40000 ALTER TABLE `COULEURS` DISABLE KEYS */;
INSERT INTO `COULEURS` VALUES (1,'Bleu'),(2,'Gris'),(3,'Noir'),(4,'Orange'),(5,'Turquoise');
/*!40000 ALTER TABLE `COULEURS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MARCHANDISES`
--

DROP TABLE IF EXISTS `MARCHANDISES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MARCHANDISES` (
  `marchandise` int(11) NOT NULL AUTO_INCREMENT,
  `Marchandises` varchar(20) DEFAULT NULL,
  `description_marchandise` text,
  PRIMARY KEY (`marchandise`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MARCHANDISES`
--

LOCK TABLES `MARCHANDISES` WRITE;
/*!40000 ALTER TABLE `MARCHANDISES` DISABLE KEYS */;
INSERT INTO `MARCHANDISES` VALUES (1,'Accessoires de moto','Casques, Gants, Lunettes'),(2,'Types de Motos','Les Cross, Les Trials, Les Roadsters');
/*!40000 ALTER TABLE `MARCHANDISES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MARQUES`
--

DROP TABLE IF EXISTS `MARQUES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MARQUES` (
  `marque` int(11) NOT NULL AUTO_INCREMENT,
  `Marques` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`marque`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MARQUES`
--

LOCK TABLES `MARQUES` WRITE;
/*!40000 ALTER TABLE `MARQUES` DISABLE KEYS */;
INSERT INTO `MARQUES` VALUES (1,'BMW'),(2,'HONDA'),(3,'KAWASAKI'),(4,'YAMAHA');
/*!40000 ALTER TABLE `MARQUES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MODELS`
--

DROP TABLE IF EXISTS `MODELS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MODELS` (
  `model` int(11) NOT NULL,
  `marque` int(11) NOT NULL,
  `couleur` int(11) DEFAULT NULL,
  `paysdefabrication` int(11) DEFAULT NULL,
  `Models` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`model`,`marque`),
  KEY `marque` (`marque`),
  KEY `paysdefabrication` (`paysdefabrication`),
  KEY `couleur` (`couleur`),
  CONSTRAINT `MODELS_ibfk_1` FOREIGN KEY (`marque`) REFERENCES `MARQUES` (`marque`),
  CONSTRAINT `MODELS_ibfk_2` FOREIGN KEY (`paysdefabrication`) REFERENCES `PaysDeFabrications` (`paysdefabrication`),
  CONSTRAINT `MODELS_ibfk_3` FOREIGN KEY (`couleur`) REFERENCES `COULEURS` (`couleur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MODELS`
--

LOCK TABLES `MODELS` WRITE;
/*!40000 ALTER TABLE `MODELS` DISABLE KEYS */;
INSERT INTO `MODELS` VALUES (1,1,2,3,'F800 GS'),(2,2,3,3,'CRF250R EXPERT'),(3,3,1,3,'Z650 ABS'),(4,4,4,3,'YZF-R1M');
/*!40000 ALTER TABLE `MODELS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Moto`
--

DROP TABLE IF EXISTS `Moto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Moto` (
  `doc` json DEFAULT NULL,
  `_id` varbinary(32) GENERATED ALWAYS AS (json_unquote(json_extract(`doc`,_utf8mb4'$._id'))) STORED NOT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Moto`
--

LOCK TABLES `Moto` WRITE;
/*!40000 ALTER TABLE `Moto` DISABLE KEYS */;
INSERT INTO `Moto` (`doc`) VALUES ('{\"_id\": \"00005e545ce60000000000000001\", \"data\": [{\"id\": 1, \"name\": \"AJP\"}, {\"id\": 2, \"name\": \"Adiva\"}, {\"id\": 3, \"name\": \"Aeon\"}, {\"id\": 4, \"name\": \"Aprilia\"}, {\"id\": 5, \"name\": \"Aspess Power\"}, {\"id\": 6, \"name\": \"Axy\"}, {\"id\": 7, \"name\": \"Azel\"}, {\"id\": 8, \"name\": \"BMW\"}, {\"id\": 9, \"name\": \"Bajaj\"}, {\"id\": 10, \"name\": \"Benelli\"}, {\"id\": 11, \"name\": \"Beta\"}, {\"id\": 12, \"name\": \"Bimota\"}, {\"id\": 13, \"name\": \"Borile\"}, {\"id\": 14, \"name\": \"Boss Hoss\"}, {\"id\": 15, \"name\": \"Buell\"}, {\"id\": 16, \"name\": \"Bultaco\"}, {\"id\": 17, \"name\": \"CCM\"}, {\"id\": 18, \"name\": \"CF Moto\"}, {\"id\": 19, \"name\": \"CH Racing\"}, {\"id\": 20, \"name\": \"CMC\"}, {\"id\": 21, \"name\": \"CPI\"}, {\"id\": 22, \"name\": \"CR&S\"}, {\"id\": 23, \"name\": \"Cagiva\"}, {\"id\": 24, \"name\": \"Dado Motors\"}, {\"id\": 25, \"name\": \"Daelim\"}, {\"id\": 26, \"name\": \"Derbi\"}, {\"id\": 27, \"name\": \"Ducati\"}, {\"id\": 28, \"name\": \"E-Tropolis\"}, {\"id\": 29, \"name\": \"E-max\"}, {\"id\": 30, \"name\": \"Ecomission\"}, {\"id\": 31, \"name\": \"Fantic Motor\"}, {\"id\": 32, \"name\": \"Garelli\"}, {\"id\": 33, \"name\": \"Gas Gas\"}, {\"id\": 34, \"name\": \"Generic\"}, {\"id\": 35, \"name\": \"Ghezzi-Brian\"}, {\"id\": 36, \"name\": \"GiMotori\"}, {\"id\": 37, \"name\": \"GiPuma\"}, {\"id\": 38, \"name\": \"Gilera\"}, {\"id\": 39, \"name\": \"Green Mobility Italia\"}, {\"id\": 40, \"name\": \"HDM\"}, {\"id\": 41, \"name\": \"HM\"}, {\"id\": 42, \"name\": \"HP Power\"}, {\"id\": 43, \"name\": \"Harley-Davidson\"}, {\"id\": 44, \"name\": \"Headbanger\"}, {\"id\": 45, \"name\": \"Honda\"}, {\"id\": 46, \"name\": \"Honda Dall\'Ara\"}, {\"id\": 47, \"name\": \"Hupper\"}, {\"id\": 48, \"name\": \"Husaberg\"}, {\"id\": 49, \"name\": \"Husqvarna\"}, {\"id\": 50, \"name\": \"Hyosung\"}, {\"id\": 51, \"name\": \"Indian\"}, {\"id\": 52, \"name\": \"Italjet\"}, {\"id\": 53, \"name\": \"Jawa\"}, {\"id\": 54, \"name\": \"KRC\"}, {\"id\": 55, \"name\": \"KTM\"}, {\"id\": 56, \"name\": \"Kawasaki\"}, {\"id\": 57, \"name\": \"Kawasaki KL\"}, {\"id\": 58, \"name\": \"Keeway\"}, {\"id\": 59, \"name\": \"Kreidler\"}, {\"id\": 60, \"name\": \"Kymco\"}, {\"id\": 61, \"name\": \"LML\"}, {\"id\": 62, \"name\": \"Lambretta\"}, {\"id\": 63, \"name\": \"Laverda\"}, {\"id\": 64, \"name\": \"Leonart\"}, {\"id\": 65, \"name\": \"Lingben\"}, {\"id\": 66, \"name\": \"Linhai\"}, {\"id\": 67, \"name\": \"MBK\"}, {\"id\": 68, \"name\": \"MV Agusta\"}, {\"id\": 69, \"name\": \"MZ\"}, {\"id\": 70, \"name\": \"Magni\"}, {\"id\": 71, \"name\": \"Maico\"}, {\"id\": 72, \"name\": \"Malaguti\"}, {\"id\": 73, \"name\": \"Mash\"}, {\"id\": 74, \"name\": \"Millepercento\"}, {\"id\": 75, \"name\": \"Mondial\"}, {\"id\": 76, \"name\": \"Montesa\"}, {\"id\": 77, \"name\": \"Moto Bellini\"}, {\"id\": 78, \"name\": \"Moto Guzzi\"}, {\"id\": 79, \"name\": \"Moto Morini\"}, {\"id\": 80, \"name\": \"Moto Rumi\"}, {\"id\": 81, \"name\": \"MotoBi\"}, {\"id\": 82, \"name\": \"Motom\"}, {\"id\": 83, \"name\": \"Motor Union\"}, {\"id\": 84, \"name\": \"Nipponia\"}, {\"id\": 85, \"name\": \"Norton\"}, {\"id\": 86, \"name\": \"Nox\"}, {\"id\": 87, \"name\": \"Ossa\"}, {\"id\": 88, \"name\": \"Over\"}, {\"id\": 89, \"name\": \"PGO\"}, {\"id\": 90, \"name\": \"Paton\"}, {\"id\": 91, \"name\": \"Peda Motor\"}, {\"id\": 92, \"name\": \"Peugeot\"}, {\"id\": 93, \"name\": \"Piaggio\"}, {\"id\": 94, \"name\": \"Polini\"}, {\"id\": 95, \"name\": \"Quadro\"}, {\"id\": 96, \"name\": \"Quantya\"}, {\"id\": 97, \"name\": \"RedMoto Honda\"}, {\"id\": 98, \"name\": \"Renault\"}, {\"id\": 99, \"name\": \"Rieju\"}, {\"id\": 100, \"name\": \"Royal Enfield\"}, {\"id\": 101, \"name\": \"SWM\"}, {\"id\": 102, \"name\": \"Sachs\"}, {\"id\": 103, \"name\": \"Scorpa\"}, {\"id\": 104, \"name\": \"Sherco\"}, {\"id\": 105, \"name\": \"Siamoto\"}, {\"id\": 106, \"name\": \"Steed\"}, {\"id\": 107, \"name\": \"Suzuki\"}, {\"id\": 108, \"name\": \"Suzuki Valenti\"}, {\"id\": 109, \"name\": \"Sym\"}, {\"id\": 110, \"name\": \"TGB\"}, {\"id\": 111, \"name\": \"TM Racing\"}, {\"id\": 112, \"name\": \"Terra Modena\"}, {\"id\": 113, \"name\": \"Triumph\"}, {\"id\": 114, \"name\": \"Ural\"}, {\"id\": 115, \"name\": \"Vectrix\"}, {\"id\": 116, \"name\": \"Vertemati\"}, {\"id\": 117, \"name\": \"Victory\"}, {\"id\": 118, \"name\": \"Vor\"}, {\"id\": 119, \"name\": \"WT Motors\"}, {\"id\": 120, \"name\": \"Yamaha\"}]}');
/*!40000 ALTER TABLE `Moto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PAYMENTS`
--

DROP TABLE IF EXISTS `PAYMENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PAYMENTS` (
  `payment` int(11) NOT NULL AUTO_INCREMENT,
  `vente` int(11) DEFAULT NULL,
  `client` int(11) NOT NULL,
  `Montant` double DEFAULT NULL,
  PRIMARY KEY (`payment`,`client`),
  KEY `vente` (`vente`),
  KEY `client` (`client`),
  CONSTRAINT `PAYMENTS_ibfk_1` FOREIGN KEY (`vente`) REFERENCES `VENTES` (`vente`),
  CONSTRAINT `PAYMENTS_ibfk_2` FOREIGN KEY (`client`) REFERENCES `CLIENTS` (`client`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PAYMENTS`
--

LOCK TABLES `PAYMENTS` WRITE;
/*!40000 ALTER TABLE `PAYMENTS` DISABLE KEYS */;
INSERT INTO `PAYMENTS` VALUES (1,1,1,20300.99),(2,2,2,16789.7);
/*!40000 ALTER TABLE `PAYMENTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRICES`
--

DROP TABLE IF EXISTS `PRICES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PRICES` (
  `price` int(11) NOT NULL AUTO_INCREMENT,
  `model` int(11) NOT NULL,
  `Prices` double DEFAULT NULL,
  PRIMARY KEY (`price`,`model`),
  KEY `model` (`model`),
  CONSTRAINT `PRICES_ibfk_1` FOREIGN KEY (`model`) REFERENCES `MODELS` (`model`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRICES`
--

LOCK TABLES `PRICES` WRITE;
/*!40000 ALTER TABLE `PRICES` DISABLE KEYS */;
INSERT INTO `PRICES` VALUES (1,1,17800),(2,2,15400),(3,3,19800);
/*!40000 ALTER TABLE `PRICES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PaysDeFabrications`
--

DROP TABLE IF EXISTS `PaysDeFabrications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PaysDeFabrications` (
  `paysdefabrication` int(11) NOT NULL AUTO_INCREMENT,
  `Pays` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`paysdefabrication`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaysDeFabrications`
--

LOCK TABLES `PaysDeFabrications` WRITE;
/*!40000 ALTER TABLE `PaysDeFabrications` DISABLE KEYS */;
INSERT INTO `PaysDeFabrications` VALUES (1,'France'),(2,'Italie'),(3,'Japon');
/*!40000 ALTER TABLE `PaysDeFabrications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VENTES`
--

DROP TABLE IF EXISTS `VENTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VENTES` (
  `vente` int(11) NOT NULL AUTO_INCREMENT,
  `DateDeVente` date DEFAULT NULL,
  `marchandise` int(11) DEFAULT NULL,
  PRIMARY KEY (`vente`),
  KEY `marchandise` (`marchandise`),
  CONSTRAINT `VENTES_ibfk_1` FOREIGN KEY (`marchandise`) REFERENCES `MARCHANDISES` (`marchandise`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VENTES`
--

LOCK TABLES `VENTES` WRITE;
/*!40000 ALTER TABLE `VENTES` DISABLE KEYS */;
INSERT INTO `VENTES` VALUES (1,'2019-03-14',1),(2,'2019-12-28',2);
/*!40000 ALTER TABLE `VENTES` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-02 21:06:50
