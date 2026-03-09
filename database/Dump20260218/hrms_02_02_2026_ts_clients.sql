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
-- Table structure for table `ts_clients`
--

DROP TABLE IF EXISTS `ts_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ts_clients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_type` int DEFAULT NULL,
  `client_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_no` varchar(255) DEFAULT NULL,
  `poc` int unsigned DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `country_id` int DEFAULT NULL,
  `state_id` int DEFAULT NULL,
  `is_active` tinyint DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `TS_CLIENTS_POC_MAIN_USERS_idx` (`poc`),
  CONSTRAINT `TS_CLIENTS_POC_MAIN_USERS` FOREIGN KEY (`poc`) REFERENCES `main_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ts_clients`
--

LOCK TABLES `ts_clients` WRITE;
/*!40000 ALTER TABLE `ts_clients` DISABLE KEYS */;
INSERT INTO `ts_clients` VALUES (1,2,'ICON PLC','zenifer.pks@flokilabs.com','1234567890',NULL,NULL,100,514,1,145,145,'2024-03-21 06:55:36','2024-03-21 06:55:36'),(2,2,'Charges Back Gurus','zenifer.pks@flokilabs.com','1234567890',NULL,NULL,100,514,1,145,145,'2024-03-21 06:52:04','2024-03-21 06:52:04'),(3,2,'HR','hr.m@codeboardtech.com','4567890321',NULL,'mmahhbubs',100,514,0,187,187,'2024-02-05 12:26:44','2024-03-21 06:49:41'),(4,2,'iLife','ak@codeboardtech.com','+918925688895',NULL,NULL,100,514,0,178,178,'2024-03-27 07:12:18','2024-07-10 15:05:52'),(5,2,'sridharss','sriannsmalai3@gmail.com','9345628333',NULL,'Pu konalavadi',100,498,0,242,242,'2024-07-10 15:53:24','2024-07-10 15:53:38'),(6,2,'Hitachi','zenifer.pks@flokilabs.com','07418842350',NULL,NULL,100,514,1,145,145,'2024-07-30 07:35:52','2024-07-30 07:35:52'),(7,2,'IFF','zenifer.pks@flokilabs.com','07418842350',NULL,NULL,100,514,1,145,145,'2024-11-26 12:12:36','2024-11-26 12:12:36'),(8,1,'CBT',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2025-02-14 06:15:30','2025-02-14 06:15:30'),(9,1,'Floki',NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,'2025-02-14 06:15:30','2025-02-14 06:15:30'),(10,2,'Secure Traces','zenifer.pks@codeboardtech.com','1234567890',NULL,NULL,100,514,1,239,239,'2025-03-27 07:09:36','2025-03-27 07:09:36'),(11,2,'Excelencia','zenifer.pks@codeboardtech.com','1234567890',NULL,NULL,100,514,1,239,239,'2025-03-27 07:10:26','2025-03-27 07:10:26'),(12,2,'Bureau ID','zenifer.pks@codeboardtech.com','1234567890',NULL,NULL,100,514,1,239,239,'2025-03-27 07:10:58','2025-03-27 07:10:58'),(13,2,'Caterpillar','zenifer.pks@codeboardtech.com','1234567890',NULL,NULL,100,514,1,239,239,'2025-03-27 07:11:32','2025-03-27 07:11:32'),(14,2,'Flatirons','zenifer.pks@codeboardtech.com','1234567890',NULL,NULL,100,514,1,239,239,'2025-03-27 07:11:59','2025-03-27 07:11:59'),(15,2,'Internal','hr@codeboardtech.com','1234567890',NULL,NULL,100,514,1,239,239,'2025-03-27 07:12:38','2025-03-27 07:12:38'),(16,2,'iLife ','hr@codeboardtech.com','1234567890',NULL,NULL,100,514,1,239,239,'2025-03-27 07:13:11','2025-03-27 07:13:11'),(17,2,'SIMSCO','hr@codeboardtech.com','7810060785',NULL,NULL,100,514,1,145,145,'2025-07-24 07:42:59','2025-07-24 07:42:59'),(18,2,'BlueBirdAI','rohan.sanil@blue-bird.ai','510 710 5807',NULL,NULL,224,1286,1,325,325,'2025-11-28 06:24:54','2025-11-28 06:24:54'),(19,2,'sridhar','srianqwnamalai2003@gmail.com','9345628924',NULL,'qwe',2,2,1,4,4,'2026-02-17 12:33:57','2026-02-17 12:33:57');
/*!40000 ALTER TABLE `ts_clients` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:59:34
