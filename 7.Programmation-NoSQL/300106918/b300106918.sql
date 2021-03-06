-- MySQL dump 10.13  Distrib 8.0.19, for Linux (x86_64)
--
-- Host: localhost    Database: world_x
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
-- Table structure for table `chefs_de_gouvernement`
--

DROP TABLE IF EXISTS `chefs_de_gouvernement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chefs_de_gouvernement` (
  `doc` json DEFAULT NULL,
  `_id` varbinary(32) GENERATED ALWAYS AS (json_unquote(json_extract(`doc`,_utf8mb4'$._id'))) STORED NOT NULL,
  `_json_schema` json GENERATED ALWAYS AS (_utf8mb4'{"type":"object"}') VIRTUAL,
  PRIMARY KEY (`_id`),
  CONSTRAINT `$val_strict_4F3089EC51AED678E8E191B720400D45A96EE0A1` CHECK (json_schema_valid(`_json_schema`,`doc`)) /*!80016 NOT ENFORCED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chefs_de_gouvernement`
--

LOCK TABLES `chefs_de_gouvernement` WRITE;
/*!40000 ALTER TABLE `chefs_de_gouvernement` DISABLE KEYS */;
INSERT INTO `chefs_de_gouvernement` (`doc`) VALUES ('{\"_id\": \"00005e95e8c10000000000000216\", \"HeadOfState\": \"Marc Ravalomanana\", \"GovernmentForm\": \"Republic\"}'),('{\"_id\": \"00005e95e8c10000000000000217\", \"HeadOfState\": \"Thabo Mbeki\", \"GovernmentForm\": \"Republic\"}'),('{\"_id\": \"00005e95e8c10000000000000218\", \"HeadOfState\": \"Jean-Bertrand Aristide\", \"GovernmentForm\": \"Republic\"}'),('{\"_id\": \"00005e95e8c10000000000000219\", \"HeadOfState\": \"Elisabeth II\", \"GovernmentForm\": \"Constitutional Monarchy\"}'),('{\"_id\": \"00005e95e8c1000000000000021a\", \"HeadOfState\": \"Mohammed VI\", \"GovernmentForm\": \"Constitutional Monarchy\"}'),('{\"_id\": \"00005e95e8c1000000000000021b\", \"HeadOfState\": \"Akihito\", \"GovernmentForm\": \"Constitutional Monarchy\"}'),('{\"_id\": \"00005e95e8c1000000000000021c\", \"HeadOfState\": \"Sellapan Rama Nathan\", \"GovernmentForm\": \"Republic\"}'),('{\"_id\": \"00005e95e8c1000000000000021d\", \"HeadOfState\": \"Blaise Compaor├â┬⌐\", \"GovernmentForm\": \"Republic\"}'),('{\"_id\": \"00005e95e8c1000000000000021e\", \"HeadOfState\": \"Joseph Kabila Kabange\", \"GovernmentForm\": \"Republic\"}'),('{\"_id\": \"00005e95e8c1000000000000021f\", \"HeadOfState\": \"Mathieu K├â┬⌐r├â┬⌐kou\", \"GovernmentForm\": \"Republic\"}'),('{\"_id\": \"00005e95e8c10000000000000220\", \"HeadOfState\": \"Abdoulaye Wade\", \"GovernmentForm\": \"Republic\"}'),('{\"_id\": \"00005e95e8c10000000000000221\", \"HeadOfState\": \"Pierre Buyoya\", \"GovernmentForm\": \"Republic\"}');
/*!40000 ALTER TABLE `chefs_de_gouvernement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `la_population`
--

DROP TABLE IF EXISTS `la_population`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `la_population` (
  `doc` json DEFAULT NULL,
  `_id` varbinary(32) GENERATED ALWAYS AS (json_unquote(json_extract(`doc`,_utf8mb4'$._id'))) STORED NOT NULL,
  `_json_schema` json GENERATED ALWAYS AS (_utf8mb4'{"type":"object"}') VIRTUAL,
  PRIMARY KEY (`_id`),
  CONSTRAINT `$val_strict_93EC6797E2F4ADD33677DD0DE82116A71F5367DF` CHECK (json_schema_valid(`_json_schema`,`doc`)) /*!80016 NOT ENFORCED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `la_population`
--

LOCK TABLES `la_population` WRITE;
/*!40000 ALTER TABLE `la_population` DISABLE KEYS */;
INSERT INTO `la_population` (`doc`) VALUES ('{\"_id\": \"00005e95e8c10000000000000222\", \"Continent\": \"Amerique\", \"Population\": 3567000, \"SurfaceArea\": 24000071}'),('{\"_id\": \"00005e95e8c10000000000000223\", \"Population\": 40377000, \"LifeExpectancy\": 51.099998474121094}'),('{\"_id\": \"00005e95e8c10000000000000224\", \"Population\": 8222000, \"LifeExpectancy\": 49.20000076293945}'),('{\"_id\": \"00005e95e8c10000000000000225\", \"Population\": 2583000, \"LifeExpectancy\": 75.19999694824219}'),('{\"_id\": \"00005e95e8c10000000000000226\", \"Population\": 28351000, \"LifeExpectancy\": 69.0999984741211}'),('{\"_id\": \"00005e95e8c10000000000000227\", \"Population\": 126714000, \"LifeExpectancy\": 80.69999694824219}'),('{\"_id\": \"00005e95e8c10000000000000228\", \"Population\": 3567000, \"LifeExpectancy\": 80.0999984741211}'),('{\"_id\": \"00005e95e8c10000000000000229\", \"Population\": 11937000, \"LifeExpectancy\": 46.70000076293945}'),('{\"_id\": \"00005e95e8c1000000000000022a\", \"Population\": 81340000, \"LifeExpectancy\": 69.47269439697276}'),('{\"_id\": \"00005e95e8c1000000000000022b\", \"Population\": 6097000, \"LifeExpectancy\": 50.20000076293945}'),('{\"_id\": \"00005e95e8c1000000000000022c\", \"Population\": 9481000, \"LifeExpectancy\": 62.20000076293945}'),('{\"_id\": \"00005e95e8c1000000000000022d\", \"Population\": 6695000, \"LifeExpectancy\": 46.20000076293945}');
/*!40000 ALTER TABLE `la_population` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-14 19:59:14
