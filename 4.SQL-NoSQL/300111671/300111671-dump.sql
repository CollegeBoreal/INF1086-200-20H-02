-- MySQL dump 10.13  Distrib 8.0.18, for Linux (x86_64)
--
-- Host: localhost    Database: Boubou
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
-- Table structure for table `AGE`
--

DROP TABLE IF EXISTS `AGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AGE` (
  `age` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(30) NOT NULL,
  PRIMARY KEY (`age`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AGE`
--

LOCK TABLES `AGE` WRITE;
/*!40000 ALTER TABLE `AGE` DISABLE KEYS */;
/*!40000 ALTER TABLE `AGE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Boubou`
--

DROP TABLE IF EXISTS `Boubou`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Boubou` (
  `doc` json DEFAULT NULL,
  `_id` varbinary(32) GENERATED ALWAYS AS (json_unquote(json_extract(`doc`,_utf8mb4'$._id'))) STORED NOT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Boubou`
--

LOCK TABLES `Boubou` WRITE;
/*!40000 ALTER TABLE `Boubou` DISABLE KEYS */;
INSERT INTO `Boubou` (`doc`) VALUES ('{\"_id\": \"00005e4746900000000000000001\", \"clothes\": [\"baby grow\", \"ball gown\", \"belt\", \"bikini\", \"blazer\", \"blouse\", \"boots\", \"bow tie\", \"boxers\", \"bra\", \"bra & knicker set\", \"briefs\", \"camisole\", \"cap\", \"cardigan\", \"cargos\", \"catsuit\", \"chemise\", \"coat\", \"corset\", \"cravat\", \"cufflinks\", \"cummerbund\", \"dinner jacket\", \"dress\", \"dressing gown\", \"dungarees\", \"fleece\", \"gloves\", \"hat\", \"hoody\", \"jacket\", \"jeans\", \"jogging suit\", \"jumper\", \"kaftan\", \"kilt\", \"knickers\", \"kurta\", \"lingerie\", \"nightgown\", \"nightwear\", \"pants\", \"pashmina\", \"polo shirt\", \"poncho\", \"pyjamas\", \"raincoat\", \"robe\", \"romper\", \"sandals\", \"sarong\", \"scarf\", \"shawl\", \"shellsuit\", \"shirt\", \"shoes\", \"shorts\", \"skirt\", \"slacks\", \"slippers\", \"socks\", \"stockings\", \"suit\", \"sunglasses\", \"sweater\", \"sweatshirt\", \"swimming costume\", \"swimming shorts\", \"swimming trunks\", \"swimwear\", \"t-shirt\", \"tailcoat\", \"tankini\", \"thong\", \"tie\", \"tights\", \"top\", \"tracksuit\", \"trainers\", \"trousers\", \"underclothes\", \"underpants\", \"undershirt\", \"underwear\", \"vest\", \"vest underwear\", \"waistcoat\", \"waterproof\", \"zip\"], \"description\": \"List of clothing types\"}'),('{\"_id\": \"00005e4c09460000000000000001\", \"clothes\": [\"baby grow\", \"ball gown\", \"belt\", \"bikini\", \"blazer\", \"blouse\", \"boots\", \"bow tie\", \"boxers\", \"bra\", \"bra & knicker set\", \"briefs\", \"camisole\", \"cap\", \"cardigan\", \"cargos\", \"catsuit\", \"chemise\", \"coat\", \"corset\", \"cravat\", \"cufflinks\", \"cummerbund\", \"dinner jacket\", \"dress\", \"dressing gown\", \"dungarees\", \"fleece\", \"gloves\", \"hat\", \"hoody\", \"jacket\", \"jeans\", \"jogging suit\", \"jumper\", \"kaftan\", \"kilt\", \"knickers\", \"kurta\", \"lingerie\", \"nightgown\", \"nightwear\", \"pants\", \"pashmina\", \"polo shirt\", \"poncho\", \"pyjamas\", \"raincoat\", \"robe\", \"romper\", \"sandals\", \"sarong\", \"scarf\", \"shawl\", \"shellsuit\", \"shirt\", \"shoes\", \"shorts\", \"skirt\", \"slacks\", \"slippers\", \"socks\", \"stockings\", \"suit\", \"sunglasses\", \"sweater\", \"sweatshirt\", \"swimming costume\", \"swimming shorts\", \"swimming trunks\", \"swimwear\", \"t-shirt\", \"tailcoat\", \"tankini\", \"thong\", \"tie\", \"tights\", \"top\", \"tracksuit\", \"trainers\", \"trousers\", \"underclothes\", \"underpants\", \"undershirt\", \"underwear\", \"vest\", \"vest underwear\", \"waistcoat\", \"waterproof\", \"zip\"], \"description\": \"List of clothing types\"}');
/*!40000 ALTER TABLE `Boubou` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Boubou2`
--

DROP TABLE IF EXISTS `Boubou2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Boubou2` (
  `doc` json DEFAULT NULL,
  `_id` varbinary(32) GENERATED ALWAYS AS (json_unquote(json_extract(`doc`,_utf8mb4'$._id'))) STORED NOT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Boubou2`
--

LOCK TABLES `Boubou2` WRITE;
/*!40000 ALTER TABLE `Boubou2` DISABLE KEYS */;
INSERT INTO `Boubou2` (`doc`) VALUES ('{\"_id\": \"1\", \"GENRE\": \"dashiki\", \"COULEUR\": \"noir\", \"QUANTITE\": \"1 a 3\"}'),('{\"_id\": \"2\", \"GENRE\": \"alabe\", \"COULEUR\": \"bleu\", \"QUANTITE\": \"1 douzaine\"}');
/*!40000 ALTER TABLE `Boubou2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMMANDE`
--

DROP TABLE IF EXISTS `COMMANDE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMMANDE` (
  `genre` int(11) NOT NULL,
  `age` int(11) NOT NULL,
  `prix` int(11) NOT NULL,
  `commande` int(11) DEFAULT NULL,
  PRIMARY KEY (`genre`,`age`,`prix`),
  UNIQUE KEY `age_UNIQUE` (`age`),
  UNIQUE KEY `prix_UNIQUE` (`prix`),
  KEY `age` (`age`),
  KEY `prix` (`prix`),
  CONSTRAINT `COMMANDE_ibfk_1` FOREIGN KEY (`genre`) REFERENCES `GENRE` (`genre`),
  CONSTRAINT `COMMANDE_ibfk_2` FOREIGN KEY (`age`) REFERENCES `AGE` (`age`),
  CONSTRAINT `COMMANDE_ibfk_3` FOREIGN KEY (`prix`) REFERENCES `PRIX` (`prix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMMANDE`
--

LOCK TABLES `COMMANDE` WRITE;
/*!40000 ALTER TABLE `COMMANDE` DISABLE KEYS */;
/*!40000 ALTER TABLE `COMMANDE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COULEUR`
--

DROP TABLE IF EXISTS `COULEUR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COULEUR` (
  `couleur` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(30) NOT NULL,
  PRIMARY KEY (`couleur`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COULEUR`
--

LOCK TABLES `COULEUR` WRITE;
/*!40000 ALTER TABLE `COULEUR` DISABLE KEYS */;
INSERT INTO `COULEUR` VALUES (4,'noir'),(5,'bleu'),(6,'rouge'),(7,'noir'),(8,'bleu'),(9,'rouge');
/*!40000 ALTER TABLE `COULEUR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DELAI`
--

DROP TABLE IF EXISTS `DELAI`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DELAI` (
  `delai` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(30) NOT NULL,
  PRIMARY KEY (`delai`),
  UNIQUE KEY `delai_UNIQUE` (`delai`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DELAI`
--

LOCK TABLES `DELAI` WRITE;
/*!40000 ALTER TABLE `DELAI` DISABLE KEYS */;
/*!40000 ALTER TABLE `DELAI` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DUREE`
--

DROP TABLE IF EXISTS `DUREE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DUREE` (
  `DUREE` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(30) NOT NULL,
  PRIMARY KEY (`DUREE`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DUREE`
--

LOCK TABLES `DUREE` WRITE;
/*!40000 ALTER TABLE `DUREE` DISABLE KEYS */;
INSERT INTO `DUREE` VALUES (4,'24 heures'),(5,'3 jours '),(6,'1 semaine'),(7,'24 heures'),(8,'3 jours '),(9,'1 semaine');
/*!40000 ALTER TABLE `DUREE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GENRE`
--

DROP TABLE IF EXISTS `GENRE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GENRE` (
  `genre` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(30) NOT NULL,
  PRIMARY KEY (`genre`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GENRE`
--

LOCK TABLES `GENRE` WRITE;
/*!40000 ALTER TABLE `GENRE` DISABLE KEYS */;
INSERT INTO `GENRE` VALUES (4,'dashiki'),(5,'alabe'),(6,'dashiki'),(7,'alabe');
/*!40000 ALTER TABLE `GENRE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LOGISTIQUE`
--

DROP TABLE IF EXISTS `LOGISTIQUE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LOGISTIQUE` (
  `logistique` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(30) NOT NULL,
  PRIMARY KEY (`logistique`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LOGISTIQUE`
--

LOCK TABLES `LOGISTIQUE` WRITE;
/*!40000 ALTER TABLE `LOGISTIQUE` DISABLE KEYS */;
/*!40000 ALTER TABLE `LOGISTIQUE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MODELE`
--

DROP TABLE IF EXISTS `MODELE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MODELE` (
  `genre` int(11) NOT NULL,
  `couleur` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `modele` int(11) DEFAULT NULL,
  PRIMARY KEY (`genre`,`couleur`,`quantite`),
  UNIQUE KEY `modele_UNIQUE` (`modele`),
  KEY `couleur` (`couleur`),
  KEY `quantite` (`quantite`),
  CONSTRAINT `MODELE_ibfk_1` FOREIGN KEY (`genre`) REFERENCES `GENRE` (`genre`),
  CONSTRAINT `MODELE_ibfk_2` FOREIGN KEY (`couleur`) REFERENCES `COULEUR` (`couleur`),
  CONSTRAINT `MODELE_ibfk_3` FOREIGN KEY (`quantite`) REFERENCES `QUANTITE` (`quantite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MODELE`
--

LOCK TABLES `MODELE` WRITE;
/*!40000 ALTER TABLE `MODELE` DISABLE KEYS */;
/*!40000 ALTER TABLE `MODELE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PAIEMENT`
--

DROP TABLE IF EXISTS `PAIEMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PAIEMENT` (
  `paiement` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(30) NOT NULL,
  PRIMARY KEY (`paiement`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PAIEMENT`
--

LOCK TABLES `PAIEMENT` WRITE;
/*!40000 ALTER TABLE `PAIEMENT` DISABLE KEYS */;
INSERT INTO `PAIEMENT` VALUES (4,'debit card'),(5,'mastercard'),(6,'pay pal'),(7,'debit card'),(8,'mastercard'),(9,'pay pal');
/*!40000 ALTER TABLE `PAIEMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PAYS`
--

DROP TABLE IF EXISTS `PAYS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PAYS` (
  `pays` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(30) NOT NULL,
  PRIMARY KEY (`pays`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PAYS`
--

LOCK TABLES `PAYS` WRITE;
/*!40000 ALTER TABLE `PAYS` DISABLE KEYS */;
INSERT INTO `PAYS` VALUES (4,'senegal'),(5,'benin'),(6,'mali'),(7,'senegal'),(8,'benin'),(9,'mali');
/*!40000 ALTER TABLE `PAYS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRIX`
--

DROP TABLE IF EXISTS `PRIX`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PRIX` (
  `prix` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(30) NOT NULL,
  PRIMARY KEY (`prix`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRIX`
--

LOCK TABLES `PRIX` WRITE;
/*!40000 ALTER TABLE `PRIX` DISABLE KEYS */;
/*!40000 ALTER TABLE `PRIX` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QUANTITE`
--

DROP TABLE IF EXISTS `QUANTITE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QUANTITE` (
  `quantite` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(30) NOT NULL,
  PRIMARY KEY (`quantite`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QUANTITE`
--

LOCK TABLES `QUANTITE` WRITE;
/*!40000 ALTER TABLE `QUANTITE` DISABLE KEYS */;
INSERT INTO `QUANTITE` VALUES (4,'1 a 3'),(5,'1 douzaine '),(6,'2 douzaine '),(7,'1 a 3'),(8,'1 douzaine '),(9,'2 douzaine ');
/*!40000 ALTER TABLE `QUANTITE` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-22  0:37:48
