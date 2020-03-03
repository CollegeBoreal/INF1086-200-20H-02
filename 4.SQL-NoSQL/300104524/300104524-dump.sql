-- MySQL dump 10.13  Distrib 8.0.19, for Linux (x86_64)
--
-- Host: localhost    Database: technical_support
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
  `client` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) DEFAULT NULL,
  `prenom` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`client`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENTS`
--

LOCK TABLES `CLIENTS` WRITE;
/*!40000 ALTER TABLE `CLIENTS` DISABLE KEYS */;
INSERT INTO `CLIENTS` VALUES (1,'Jean','William'),(2,'Medgine','Pierre'),(3,'Jacques','Gerome');
/*!40000 ALTER TABLE `CLIENTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NOTES`
--

DROP TABLE IF EXISTS `NOTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NOTES` (
  `archivre_num` int NOT NULL AUTO_INCREMENT,
  `demarche` varchar(120) NOT NULL,
  `documentation` varchar(120) NOT NULL,
  PRIMARY KEY (`archivre_num`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NOTES`
--

LOCK TABLES `NOTES` WRITE;
/*!40000 ALTER TABLE `NOTES` DISABLE KEYS */;
INSERT INTO `NOTES` VALUES (1,'Test 1 a 1','HP SUPPORT'),(2,'Installer une pate thermique','INTEL PROCESSOR');
/*!40000 ALTER TABLE `NOTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PAYMENTS`
--

DROP TABLE IF EXISTS `PAYMENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PAYMENTS` (
  `payment` int NOT NULL AUTO_INCREMENT,
  `article` varchar(30) NOT NULL,
  `quantity` int DEFAULT NULL,
  `vente` int NOT NULL,
  PRIMARY KEY (`payment`,`vente`),
  KEY `vente` (`vente`),
  CONSTRAINT `PAYMENTS_ibfk_1` FOREIGN KEY (`vente`) REFERENCES `VENTES` (`vente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PAYMENTS`
--

LOCK TABLES `PAYMENTS` WRITE;
/*!40000 ALTER TABLE `PAYMENTS` DISABLE KEYS */;
INSERT INTO `PAYMENTS` VALUES (1,'LAPTOP',1,1),(2,'DESKTOP',1,2);
/*!40000 ALTER TABLE `PAYMENTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REPAIRS`
--

DROP TABLE IF EXISTS `REPAIRS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REPAIRS` (
  `repair` int NOT NULL AUTO_INCREMENT,
  `service` int DEFAULT NULL,
  `mac_adress` varchar(30) DEFAULT NULL,
  `brand` varchar(30) NOT NULL,
  PRIMARY KEY (`repair`),
  KEY `service` (`service`),
  CONSTRAINT `REPAIRS_ibfk_1` FOREIGN KEY (`service`) REFERENCES `SERVICES` (`service`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REPAIRS`
--

LOCK TABLES `REPAIRS` WRITE;
/*!40000 ALTER TABLE `REPAIRS` DISABLE KEYS */;
INSERT INTO `REPAIRS` VALUES (1,1,'10:25:69:69','HP'),(2,2,'56:98:75:54','DELL');
/*!40000 ALTER TABLE `REPAIRS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SERVICES`
--

DROP TABLE IF EXISTS `SERVICES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SERVICES` (
  `service` int NOT NULL AUTO_INCREMENT,
  `BRAND` varchar(30) NOT NULL,
  `problem` varchar(30) NOT NULL,
  `description` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`service`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SERVICES`
--

LOCK TABLES `SERVICES` WRITE;
/*!40000 ALTER TABLE `SERVICES` DISABLE KEYS */;
INSERT INTO `SERVICES` VALUES (1,'HP','hard drive','Not Bootable'),(2,'DELL','cpu','Heating');
/*!40000 ALTER TABLE `SERVICES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VENTES`
--

DROP TABLE IF EXISTS `VENTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VENTES` (
  `vente` int NOT NULL AUTO_INCREMENT,
  `date_vente` date DEFAULT NULL,
  `article` varchar(120) DEFAULT NULL,
  `service` int DEFAULT NULL,
  `client` int NOT NULL,
  PRIMARY KEY (`vente`,`client`),
  KEY `client` (`client`),
  KEY `service` (`service`),
  CONSTRAINT `VENTES_ibfk_1` FOREIGN KEY (`client`) REFERENCES `CLIENTS` (`client`),
  CONSTRAINT `VENTES_ibfk_2` FOREIGN KEY (`service`) REFERENCES `SERVICES` (`service`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VENTES`
--

LOCK TABLES `VENTES` WRITE;
/*!40000 ALTER TABLE `VENTES` DISABLE KEYS */;
INSERT INTO `VENTES` VALUES (1,'2019-12-06','Reparation Immediat LAPTOP',1,1),(2,'2019-12-09','Reparation sur Rendez-Vous DESKTOP',2,2);
/*!40000 ALTER TABLE `VENTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `computer`
--

DROP TABLE IF EXISTS `computer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `computer` (
  `doc` json DEFAULT NULL,
  `_id` varbinary(32) GENERATED ALWAYS AS (json_unquote(json_extract(`doc`,_utf8mb4'$._id'))) STORED NOT NULL,
  `_json_schema` json GENERATED ALWAYS AS (_utf8mb4'{"type":"object"}') VIRTUAL,
  PRIMARY KEY (`_id`),
  CONSTRAINT `$val_strict_81101DED975D54BD76A3C8EAD293597AE9BB143F` CHECK (json_schema_valid(`_json_schema`,`doc`)) /*!80016 NOT ENFORCED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `computer`
--

LOCK TABLES `computer` WRITE;
/*!40000 ALTER TABLE `computer` DISABLE KEYS */;
INSERT INTO `computer` (`doc`) VALUES ('{\"_id\": \"00005e5985900000000000000001\", \"icon\": \"file://computer.svg\", \"make\": \"Generic\", \"model\": \"Computer\", \"author\": {\"name\": \"Daniel G. Taylor\", \"email\": \"dan@programmer-art.org\"}, \"default\": \"WebM\", \"presets\": [{\"icon\": \"file://computer-live.svg\", \"name\": \"Live Input H.264\", \"acodec\": {\"name\": \"faac\", \"rate\": [8000, 96000], \"depth\": [8, 24], \"width\": [8, 24], \"passes\": [\"bitrate=192000\"], \"channels\": [1, 6], \"container\": \"mp4mux\"}, \"vcodec\": {\"name\": \"x264enc\", \"rate\": [1, 30], \"width\": [320, 1920], \"height\": [240, 1080], \"passes\": [\"pass=cbr bitrate=2048 subme=4 threads=0\"], \"container\": \"mp4mux\"}, \"container\": \"mp4mux\", \"extension\": \"mp4\", \"description\": \"Constant bitrate fast H.264 / AAC in MP4\"}, {\"name\": \"H.264\", \"acodec\": {\"name\": \"faac\", \"rate\": [8000, 96000], \"depth\": [8, 24], \"width\": [8, 24], \"passes\": [\"bitrate=192000\"], \"channels\": [1, 6], \"container\": \"mp4mux\"}, \"vcodec\": {\"name\": \"x264enc\", \"rate\": [1, 30], \"width\": [320, 1920], \"height\": [240, 1080], \"passes\": [\"pass=qual quantizer=21 me=umh subme=6 ref=3 threads=0\"], \"container\": \"mp4mux\"}, \"container\": \"mp4mux\", \"extension\": \"mp4\", \"description\": \"H.264/AAC in MP4 for the computer\"}, {\"name\": \"Theora\", \"acodec\": {\"name\": \"vorbisenc\", \"rate\": [8000, 96000], \"depth\": [8, 24], \"width\": [8, 32], \"passes\": [\"quality=0.5\"], \"channels\": [1, 2], \"container\": \"matroskamux\"}, \"vcodec\": {\"name\": \"theoraenc\", \"rate\": [1, 30], \"width\": [320, 1920], \"height\": [240, 1080], \"passes\": [\"border=0 quality=40 keyframe-freq=30\"], \"container\": \"matroskamux\"}, \"container\": \"matroskamux\", \"extension\": \"mkv\", \"description\": \"Theora/Vorbis in Ogg for the computer\"}, {\"icon\": \"file://computer-webm.svg\", \"name\": \"WebM\", \"acodec\": {\"name\": \"vorbisenc\", \"rate\": [8000, 96000], \"depth\": [8, 24], \"width\": [8, 32], \"passes\": [\"quality=0.4\"], \"channels\": [1, 2], \"container\": \"webmmux\"}, \"vcodec\": {\"name\": \"vp8enc\", \"rate\": [1, 60], \"width\": [120, 1920], \"height\": [120, 1080], \"passes\": [\"quality=6 threads=%(threads)s speed=2\"], \"container\": \"webmmux\"}, \"container\": \"webmmux\", \"extension\": \"webm\", \"description\": \"WebM for the computer\"}], \"version\": \"1.9\", \"description\": \"WebM, H.264/AAC and Theora/Vorbis for the computer\"}');
/*!40000 ALTER TABLE `computer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-03  2:31:25
