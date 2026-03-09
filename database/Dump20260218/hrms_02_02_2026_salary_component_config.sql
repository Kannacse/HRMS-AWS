-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 10.30.0.93    Database: hrms_02_02_2026
-- ------------------------------------------------------
-- Server version	8.0.45-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `salary_component_config`
--

DROP TABLE IF EXISTS `salary_component_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary_component_config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `types` text NOT NULL,
  `ctc_from` int NOT NULL,
  `ctc_to` int NOT NULL,
  `value` int NOT NULL,
  `value_type` varchar(30) NOT NULL,
  `effective_from` date NOT NULL,
  `effective_to` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_component_config`
--

LOCK TABLES `salary_component_config` WRITE;
/*!40000 ALTER TABLE `salary_component_config` DISABLE KEYS */;
INSERT INTO `salary_component_config` VALUES (7,'professional_tax',0,21000,0,'flat','2019-04-01','2020-03-31'),(8,'professional_tax',21001,30000,135,'flat','2019-04-01','2020-03-31'),(9,'professional_tax',30001,45000,315,'flat','2019-04-01','2020-03-31'),(10,'professional_tax',45001,60000,690,'flat','2019-04-01','2020-03-31'),(11,'professional_tax',60001,75000,1025,'flat','2019-04-01','2020-03-31'),(12,'professional_tax',75001,99999999,1250,'flat','2019-04-01','2020-03-31'),(13,'conveyance',0,10000,1600,'flat','0000-00-00','0000-00-00'),(14,'conveyance',10001,999999999,1600,'flat','0000-00-00','0000-00-00'),(16,'medical',0,999999999,1666,'flat','0000-00-00','0000-00-00'),(17,'lta',0,999999999,10,'percent','0000-00-00','0000-00-00'),(18,'hra',0,999999999,50,'percent','0000-00-00','0000-00-00'),(19,'performance_bonus',0,999999999,10,'percent','0000-00-00','0000-00-00'),(20,'pf',0,14999,24,'percent','0000-00-00','0000-00-00'),(21,'pf',15000,999999999,3600,'flat','0000-00-00','0000-00-00'),(22,'esi',0,21000,4,'percent','0000-00-00','0000-00-00'),(23,'esi',21000,999999999,1250,'flat','0000-00-00','0000-00-00');
/*!40000 ALTER TABLE `salary_component_config` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:59:28
