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
-- Table structure for table `emp_bonus_config`
--

DROP TABLE IF EXISTS `emp_bonus_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp_bonus_config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `refer_for` int DEFAULT NULL,
  `bonus_id` int NOT NULL,
  `refer_slab` int DEFAULT NULL,
  `year` varchar(255) NOT NULL,
  `month` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `created_by` int DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_bonus_config`
--

LOCK TABLES `emp_bonus_config` WRITE;
/*!40000 ALTER TABLE `emp_bonus_config` DISABLE KEYS */;
INSERT INTO `emp_bonus_config` VALUES (1,288,NULL,1,NULL,'2024','7','100000',18,18,'2024-12-14 11:05:31','2024-12-14 11:05:31',1),(2,306,NULL,1,NULL,'2024','12','50000',322,322,'2025-01-21 06:40:28','2025-01-21 06:40:28',1),(3,306,NULL,1,NULL,'2025','1','5000',322,322,'2025-02-03 10:50:13','2025-02-03 10:50:13',1),(4,327,NULL,1,NULL,'2025','4','25000',322,322,'2025-05-12 06:56:51','2025-05-12 06:56:51',1),(5,327,NULL,1,NULL,'2025','7','25000',322,322,'2025-05-12 06:56:51','2025-05-12 06:56:51',1);
/*!40000 ALTER TABLE `emp_bonus_config` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:59:54
