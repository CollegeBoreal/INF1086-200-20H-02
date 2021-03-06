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
INSERT INTO `chefs_de_gouvernement` (`doc`) VALUES ('{\"_id\": \"00005e8fb2f0000000000000002a\", \"HeadOfState\": \"Marc Ravalomanana\", \"GovernmentForm\": \"Republic\"}'),('{\"_id\": \"00005e8fb2f0000000000000002b\", \"HeadOfState\": \"Thabo Mbeki\", \"GovernmentForm\": \"Republic\"}'),('{\"_id\": \"00005e8fb2f0000000000000002c\", \"HeadOfState\": \"Jean-Bertrand Aristide\", \"GovernmentForm\": \"Republic\"}'),('{\"_id\": \"00005e8fb2f0000000000000002d\", \"HeadOfState\": \"Elisabeth II\", \"GovernmentForm\": \"Constitutional Monarchy\"}'),('{\"_id\": \"00005e8fb2f0000000000000002e\", \"HeadOfState\": \"Mohammed VI\", \"GovernmentForm\": \"Constitutional Monarchy\"}'),('{\"_id\": \"00005e8fb2f0000000000000002f\", \"HeadOfState\": \"Akihito\", \"GovernmentForm\": \"Constitutional Monarchy\"}'),('{\"_id\": \"00005e8fb2f00000000000000030\", \"HeadOfState\": \"Sellapan Rama Nathan\", \"GovernmentForm\": \"Republic\"}'),('{\"_id\": \"00005e8fb2f00000000000000031\", \"HeadOfState\": \"Blaise Compaor├â┬⌐\", \"GovernmentForm\": \"Republic\"}'),('{\"_id\": \"00005e8fb2f00000000000000032\", \"HeadOfState\": \"Joseph Kabila Kabange\", \"GovernmentForm\": \"Republic\"}'),('{\"_id\": \"00005e8fb2f00000000000000033\", \"HeadOfState\": \"Mathieu K├â┬⌐r├â┬⌐kou\", \"GovernmentForm\": \"Republic\"}'),('{\"_id\": \"00005e8fb2f00000000000000034\", \"HeadOfState\": \"Abdoulaye Wade\", \"GovernmentForm\": \"Republic\"}'),('{\"_id\": \"00005e8fb2f00000000000000035\", \"HeadOfState\": \"Pierre Buyoya\", \"GovernmentForm\": \"Republic\"}');
/*!40000 ALTER TABLE `chefs_de_gouvernement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systeme_politique`
--

DROP TABLE IF EXISTS `systeme_politique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `systeme_politique` (
  `doc` json DEFAULT NULL,
  `_id` varbinary(32) GENERATED ALWAYS AS (json_unquote(json_extract(`doc`,_utf8mb4'$._id'))) STORED NOT NULL,
  `_json_schema` json GENERATED ALWAYS AS (_utf8mb4'{"type":"object"}') VIRTUAL,
  PRIMARY KEY (`_id`),
  CONSTRAINT `$val_strict_53231E1AC8EEBEB26A255EA41AE7883225991D46` CHECK (json_schema_valid(`_json_schema`,`doc`)) /*!80016 NOT ENFORCED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systeme_politique`
--

LOCK TABLES `systeme_politique` WRITE;
/*!40000 ALTER TABLE `systeme_politique` DISABLE KEYS */;
INSERT INTO `systeme_politique` (`doc`) VALUES ('{\"_id\": \"1\", \"country\": \"England\", \"systeme\": \"Kingdom\", \"HofState\": \"Their Majesty the Queen Elisabeth II\"}'),('{\"_id\": \"2\", \"country\": \"France\", \"systeme\": \"Republic\", \"HofState\": \"Francois Rolland\"}'),('{\"_id\": \"3\", \"country\": \"Haiti\", \"systeme\": \"Republic\", \"HofState\": \"Jovenel Moise\"}'),('{\"_id\": \"4\", \"country\": \"USA\", \"systeme\": \"Republic\", \"HofState\": \"Donald Trump\"}');
/*!40000 ALTER TABLE `systeme_politique` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp`
--

DROP TABLE IF EXISTS `temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp` (
  `doc` json DEFAULT NULL,
  `_id` varbinary(32) GENERATED ALWAYS AS (json_unquote(json_extract(`doc`,_utf8mb4'$._id'))) STORED NOT NULL,
  `_json_schema` json GENERATED ALWAYS AS (_utf8mb4'{"type":"object"}') VIRTUAL,
  PRIMARY KEY (`_id`),
  CONSTRAINT `$val_strict_92D3FC821547543FCC854DE4426B7BFD3A0EE2ED` CHECK (json_schema_valid(`_json_schema`,`doc`)) /*!80016 NOT ENFORCED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp`
--

LOCK TABLES `temp` WRITE;
/*!40000 ALTER TABLE `temp` DISABLE KEYS */;
INSERT INTO `temp` (`doc`) VALUES ('{\"_id\": \"00005e8fb2f00000000000000029\", \"countries\": [{\"GNP\": 116729, \"_id\": \"ZAF\", \"Name\": \"South Africa\", \"IndepYear\": 1910, \"geography\": {\"Region\": \"Southern Africa\", \"Continent\": \"Africa\", \"SurfaceArea\": 1221037}, \"government\": {\"HeadOfState\": \"Thabo Mbeki\", \"GovernmentForm\": \"Republic\"}, \"demographics\": {\"Population\": 40377000, \"LifeExpectancy\": 51.099998474121094}}, {\"GNP\": 3459, \"_id\": \"HTI\", \"Name\": \"Haiti\", \"IndepYear\": 1804, \"geography\": {\"Region\": \"Caribbean\", \"Continent\": \"North America\", \"SurfaceArea\": 27750}, \"government\": {\"HeadOfState\": \"Jean-Bertrand Aristide\", \"GovernmentForm\": \"Republic\"}, \"demographics\": {\"Population\": 8222000, \"LifeExpectancy\": 49.20000076293945}}, {\"GNP\": 6871, \"_id\": \"JAM\", \"Name\": \"Jamaica\", \"IndepYear\": 1962, \"geography\": {\"Region\": \"Caribbean\", \"Continent\": \"North America\", \"SurfaceArea\": 10990}, \"government\": {\"HeadOfState\": \"Elisabeth II\", \"GovernmentForm\": \"Constitutional Monarchy\"}, \"demographics\": {\"Population\": 2583000, \"LifeExpectancy\": 75.19999694824219}}, {\"GNP\": 36124, \"_id\": \"MAR\", \"Name\": \"Morocco\", \"IndepYear\": 1956, \"geography\": {\"Region\": \"Northern Africa\", \"Continent\": \"Africa\", \"SurfaceArea\": 446550}, \"government\": {\"HeadOfState\": \"Mohammed VI\", \"GovernmentForm\": \"Constitutional Monarchy\"}, \"demographics\": {\"Population\": 28351000, \"LifeExpectancy\": 69.0999984741211}}, {\"GNP\": 3787042, \"_id\": \"JPN\", \"Name\": \"Japan\", \"IndepYear\": -660, \"geography\": {\"Region\": \"Eastern Asia\", \"Continent\": \"Asia\", \"SurfaceArea\": 377829}, \"government\": {\"HeadOfState\": \"Akihito\", \"GovernmentForm\": \"Constitutional Monarchy\"}, \"demographics\": {\"Population\": 126714000, \"LifeExpectancy\": 80.69999694824219}}, {\"GNP\": 86503, \"_id\": \"SGP\", \"Name\": \"Singapore\", \"IndepYear\": 1965, \"geography\": {\"Region\": \"Southeast Asia\", \"Continent\": \"Asia\", \"SurfaceArea\": 618}, \"government\": {\"HeadOfState\": \"Sellapan Rama Nathan\", \"GovernmentForm\": \"Republic\"}, \"demographics\": {\"Population\": 3567000, \"LifeExpectancy\": 80.0999984741211}}, {\"GNP\": 2425, \"_id\": \"BFA\", \"Name\": \"Burkina Faso\", \"IndepYear\": 1960, \"geography\": {\"Region\": \"Western Africa\", \"Continent\": \"Africa\", \"SurfaceArea\": 274000}, \"government\": {\"HeadOfState\": \"Blaise Compaor├â┬⌐\", \"GovernmentForm\": \"Republic\"}, \"demographics\": {\"Population\": 11937000, \"LifeExpectancy\": 46.70000076293945}}, {\"GNP\": 7073, \"_id\": \"RDC\", \"Name\": \"Democratic Republic of Congo\", \"IndepYear\": 1960, \"geography\": {\"Region\": \"Central Africa\", \"Continent\": \"Africa\", \"SurfaceArea\": 2345409}, \"government\": {\"HeadOfState\": \"Joseph Kabila Kabange\", \"GovernmentForm\": \"Republic\"}, \"demographics\": {\"Population\": 81340000, \"LifeExpectancy\": 69.47269439697276}}, {\"GNP\": 2357, \"_id\": \"BEN\", \"Name\": \"Benin\", \"IndepYear\": 1960, \"geography\": {\"Region\": \"Western Africa\", \"Continent\": \"Africa\", \"SurfaceArea\": 112622}, \"government\": {\"HeadOfState\": \"Mathieu K├â┬⌐r├â┬⌐kou\", \"GovernmentForm\": \"Republic\"}, \"demographics\": {\"Population\": 6097000, \"LifeExpectancy\": 50.20000076293945}}, {\"GNP\": 4787, \"_id\": \"SEN\", \"Name\": \"Senegal\", \"IndepYear\": 1960, \"geography\": {\"Region\": \"Western Africa\", \"Continent\": \"Africa\", \"SurfaceArea\": 196722}, \"government\": {\"HeadOfState\": \"Abdoulaye Wade\", \"GovernmentForm\": \"Republic\"}, \"demographics\": {\"Population\": 9481000, \"LifeExpectancy\": 62.20000076293945}}, {\"GNP\": 903, \"_id\": \"BDI\", \"Name\": \"Burundi\", \"IndepYear\": 1962, \"geography\": {\"Region\": \"Eastern Africa\", \"Continent\": \"Africa\", \"SurfaceArea\": 27834}, \"government\": {\"HeadOfState\": \"Pierre Buyoya\", \"GovernmentForm\": \"Republic\"}, \"demographics\": {\"Population\": 6695000, \"LifeExpectancy\": 46.20000076293945}}]}');
/*!40000 ALTER TABLE `temp` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-11  0:04:20
