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
-- Table structure for table `fun_teams`
--

DROP TABLE IF EXISTS `fun_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fun_teams` (
  `id` int NOT NULL AUTO_INCREMENT,
  `team_name` varchar(255) NOT NULL,
  `team_logo` varchar(255) DEFAULT NULL,
  `year` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by` int DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fun_teams`
--

LOCK TABLES `fun_teams` WRITE;
/*!40000 ALTER TABLE `fun_teams` DISABLE KEYS */;
INSERT INTO `fun_teams` VALUES (1,'HRMS',NULL,'2024',0,187,187,'2024-06-07 07:15:58','2024-06-07 07:25:45'),(2,'HR',NULL,'2024',0,187,187,'2024-06-07 07:17:41','2024-06-07 07:25:42'),(3,'CRM',NULL,'2024',0,187,187,'2024-06-07 07:17:53','2024-06-07 07:25:40'),(4,'iudhsjknm,x','preview_095007.jpg','2024',0,187,187,'2024-06-07 09:50:12','2024-06-07 09:51:28'),(5,'Team A','preview_051934.jpg','2024',0,187,NULL,'2024-06-10 05:17:59','2024-06-10 11:23:39'),(6,'Ghilli','preview_072827.jpg','2024',1,187,NULL,'2024-06-11 04:50:09','2024-08-20 07:28:32'),(7,'Destroyer','preview_090640.jpg','2024',1,187,NULL,'2024-06-11 04:50:29','2024-08-20 09:06:42'),(8,'Hyenas','preview_073008.jpg','2024',1,187,NULL,'2024-06-11 04:50:48','2024-08-20 07:30:11'),(9,'Devil Desk Cobra','preview_072943.png','2024',1,187,NULL,'2024-06-11 04:51:16','2024-08-20 07:29:46'),(10,'Kodari Gang','preview_080918.jpg','2024',1,187,NULL,'2024-06-11 04:51:56','2024-08-20 08:09:23'),(11,'HR',NULL,'2024',0,187,187,'2024-06-14 15:12:12','2024-06-14 15:13:11'),(12,'Fight Club ','preview_160321.jpg','2025',1,322,322,'2025-07-24 10:33:22','2025-07-24 10:33:22'),(13,'The Immortals','preview_160448.jpg','2025',1,322,322,'2025-07-24 10:34:51','2025-07-24 10:34:51'),(14,'Weekend Warriors','preview_160704.jpg','2025',1,322,322,'2025-07-24 10:37:07','2025-07-24 10:37:07'),(15,'Red Dragon','preview_160806.png','2025',1,322,322,'2025-07-24 10:38:19','2025-07-24 10:38:19');
/*!40000 ALTER TABLE `fun_teams` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 15:00:10
