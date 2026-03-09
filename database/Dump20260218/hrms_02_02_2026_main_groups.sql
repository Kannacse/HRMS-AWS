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
-- Table structure for table `main_groups`
--

DROP TABLE IF EXISTS `main_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(60) NOT NULL,
  `description` varchar(150) DEFAULT NULL,
  `level` int unsigned DEFAULT NULL,
  `isactive` tinyint unsigned DEFAULT '1' COMMENT '1=active,0=inactive',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `createdby` int unsigned DEFAULT NULL,
  `modifiedby` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_groups`
--

LOCK TABLES `main_groups` WRITE;
/*!40000 ALTER TABLE `main_groups` DISABLE KEYS */;
INSERT INTO `main_groups` VALUES (1,'Management','This is Management group.',1,1,'2013-08-19 11:51:14','2013-08-19 11:51:14',1,1),(2,'Manager','This is manager group.',2,1,'2013-08-19 11:51:14','2013-08-19 11:51:14',1,1),(3,'HR','This is hr group.',3,1,'2013-08-19 11:51:14','2013-08-19 11:51:14',1,1),(4,'Employees','This is employees group.',4,1,'2013-08-19 11:51:14','2013-08-19 11:51:14',1,1),(5,'External Users','This is user group.',5,1,'2013-08-19 16:29:14','2013-08-19 16:29:14',1,1),(6,'System Admin','This is the system administration group',6,0,'2013-08-19 16:29:14','2013-08-19 16:29:14',1,1);
/*!40000 ALTER TABLE `main_groups` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:59:24
