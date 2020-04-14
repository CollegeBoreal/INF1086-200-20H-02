-- MySQL dump 10.13  Distrib 8.0.18, for Linux (x86_64)
--
-- Host: localhost    Database: world_x
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
-- Table structure for table `chefs_de_gouvernement`
--

DROP TABLE IF EXISTS `chefs_de_gouvernement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chefs_de_gouvernement` (
  `doc` json DEFAULT NULL,
  `_id` varbinary(32) GENERATED ALWAYS AS (json_unquote(json_extract(`doc`,_utf8mb4'$._id'))) STORED NOT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chefs_de_gouvernement`
--

LOCK TABLES `chefs_de_gouvernement` WRITE;
/*!40000 ALTER TABLE `chefs_de_gouvernement` DISABLE KEYS */;
INSERT INTO `chefs_de_gouvernement` (`doc`) VALUES ('{\"_id\": \"00005e94deb20000000000000010\", \"HeadOfState\": \"Marc Ravalomanana\", \"GovernmentForm\": \"Republic\"}'),('{\"_id\": \"00005e94deb20000000000000011\", \"HeadOfState\": \"Thabo Mbeki\", \"GovernmentForm\": \"Republic\"}'),('{\"_id\": \"00005e94deb20000000000000012\", \"HeadOfState\": \"Jean-Bertrand Aristide\", \"GovernmentForm\": \"Republic\"}'),('{\"_id\": \"00005e94deb20000000000000013\", \"HeadOfState\": \"Elisabeth II\", \"GovernmentForm\": \"Constitutional Monarchy\"}'),('{\"_id\": \"00005e94deb20000000000000014\", \"HeadOfState\": \"Mohammed VI\", \"GovernmentForm\": \"Constitutional Monarchy\"}'),('{\"_id\": \"00005e94deb20000000000000015\", \"HeadOfState\": \"Akihito\", \"GovernmentForm\": \"Constitutional Monarchy\"}'),('{\"_id\": \"00005e94deb20000000000000016\", \"HeadOfState\": \"Sellapan Rama Nathan\", \"GovernmentForm\": \"Republic\"}'),('{\"_id\": \"00005e94deb20000000000000017\", \"HeadOfState\": \"Blaise Compaor├â┬®\", \"GovernmentForm\": \"Republic\"}'),('{\"_id\": \"00005e94deb20000000000000018\", \"HeadOfState\": \"Joseph Kabila Kabange\", \"GovernmentForm\": \"Republic\"}'),('{\"_id\": \"00005e94deb20000000000000019\", \"HeadOfState\": \"Mathieu K├â┬®r├â┬®kou\", \"GovernmentForm\": \"Republic\"}'),('{\"_id\": \"00005e94deb2000000000000001a\", \"HeadOfState\": \"Abdoulaye Wade\", \"GovernmentForm\": \"Republic\"}'),('{\"_id\": \"00005e94deb2000000000000001b\", \"HeadOfState\": \"Pierre Buyoya\", \"GovernmentForm\": \"Republic\"}');
/*!40000 ALTER TABLE `chefs_de_gouvernement` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-14  1:37:13
