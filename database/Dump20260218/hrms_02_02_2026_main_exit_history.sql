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
-- Table structure for table `main_exit_history`
--

DROP TABLE IF EXISTS `main_exit_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_exit_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `exit_request_id` int NOT NULL,
  `description` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdby` int NOT NULL,
  `modifiedby` int DEFAULT NULL,
  `createddate` datetime NOT NULL,
  `modifieddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isactive` tinyint NOT NULL DEFAULT '1' COMMENT '0-No,1-Yes',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_exit_history`
--

LOCK TABLES `main_exit_history` WRITE;
/*!40000 ALTER TABLE `main_exit_history` DISABLE KEYS */;
INSERT INTO `main_exit_history` VALUES (1,1,'<name> has initiated exit procedure on <createddate>',322,NULL,'2025-05-13 05:02:43','2025-05-13 05:02:43',1),(2,2,'<name> has initiated exit procedure on <createddate>',322,NULL,'2025-05-13 05:14:13','2025-05-13 05:14:13',1),(3,3,'<name> has initiated exit procedure on <createddate>',322,NULL,'2025-05-13 05:22:07','2025-05-13 05:22:07',1),(4,4,'<name> has initiated exit procedure on <createddate>',322,NULL,'2025-05-29 12:20:01','2025-05-29 12:20:01',1),(5,5,'<name> has initiated exit procedure on <createddate>',322,NULL,'2025-06-06 11:11:54','2025-06-06 11:11:54',1),(6,6,'<name> has initiated exit procedure on <createddate>',322,NULL,'2025-06-06 11:14:11','2025-06-06 11:14:11',1),(7,6,'<name> has initiated exit procedure on <createddate>',322,NULL,'2025-06-06 12:44:31','2025-06-06 12:44:31',1),(8,7,'<name> has initiated exit procedure on <createddate>',322,NULL,'2025-06-11 12:24:49','2025-06-11 12:24:49',1),(9,8,'<name> has initiated exit procedure on <createddate>',322,NULL,'2025-06-30 13:19:00','2025-06-30 13:19:00',1),(10,9,'<name> has initiated exit procedure on <createddate>',322,NULL,'2025-07-02 12:40:40','2025-07-02 12:40:40',1),(11,10,'<name> has initiated exit procedure on <createddate>',322,NULL,'2025-07-04 11:55:27','2025-07-04 11:55:27',1),(12,11,'<name> has initiated exit procedure on <createddate>',322,NULL,'2025-07-28 11:33:55','2025-07-28 11:33:55',1),(13,12,'<name> has initiated exit procedure on <createddate>',322,NULL,'2025-07-29 04:55:21','2025-07-29 04:55:21',1),(14,13,'<name> has initiated exit procedure on <createddate>',322,NULL,'2025-07-29 12:57:52','2025-07-29 12:57:52',1),(15,14,'<name> has initiated exit procedure on <createddate>',322,NULL,'2025-08-05 12:49:36','2025-08-05 12:49:36',1),(16,15,'<name> has initiated exit procedure on <createddate>',322,NULL,'2025-08-12 13:02:56','2025-08-12 13:02:56',1),(17,16,'<name> has initiated exit procedure on <createddate>',322,NULL,'2025-08-14 12:58:02','2025-08-14 12:58:02',1),(18,17,'<name> has initiated exit procedure on <createddate>',322,NULL,'2025-08-18 12:59:32','2025-08-18 12:59:32',1),(19,17,'<name> has initiated exit procedure on <createddate>',322,NULL,'2025-08-19 05:17:48','2025-08-19 05:17:48',1),(20,17,'<name> has initiated exit procedure on <createddate>',322,NULL,'2025-08-19 05:18:25','2025-08-19 05:18:25',1),(21,16,'<name> has initiated exit procedure on <createddate>',322,NULL,'2025-08-19 05:20:12','2025-08-19 05:20:12',1),(22,18,'<name> has initiated exit procedure on <createddate>',322,NULL,'2025-09-12 13:38:28','2025-09-12 13:38:28',1),(23,19,'<name> has initiated exit procedure on <createddate>',322,NULL,'2025-09-18 12:40:27','2025-09-18 12:40:27',1),(24,20,'<name> has initiated exit procedure on <createddate>',322,NULL,'2025-09-24 06:10:55','2025-09-24 06:10:55',1),(25,21,'<name> has initiated exit procedure on <createddate>',322,NULL,'2025-09-24 06:16:12','2025-09-24 06:16:12',1),(26,22,'<name> has initiated exit procedure on <createddate>',322,NULL,'2025-09-30 12:51:26','2025-09-30 12:51:26',1),(27,23,'<name> has initiated exit procedure on <createddate>',322,NULL,'2025-10-07 03:18:55','2025-10-07 03:18:55',1),(28,24,'<name> has initiated exit procedure on <createddate>',322,NULL,'2025-10-07 03:23:53','2025-10-07 03:23:53',1),(29,25,'<name> has initiated exit procedure on <createddate>',322,NULL,'2025-10-23 12:30:39','2025-10-23 12:30:39',1),(30,26,'<name> has initiated exit procedure on <createddate>',322,NULL,'2025-11-03 06:15:38','2025-11-03 06:15:38',1),(31,27,'<name> has initiated exit procedure on <createddate>',322,NULL,'2025-11-05 05:30:58','2025-11-05 05:30:58',1),(32,28,'<name> has initiated exit procedure on <createddate>',187,NULL,'2025-11-07 12:53:13','2025-11-07 12:53:13',1),(33,29,'<name> has initiated exit procedure on <createddate>',322,NULL,'2025-11-25 12:31:28','2025-11-25 12:31:28',1),(34,30,'<name> has initiated exit procedure on <createddate>',322,NULL,'2025-11-28 04:48:00','2025-11-28 04:48:00',1),(35,31,'<name> has initiated exit procedure on <createddate>',322,NULL,'2025-12-05 13:03:03','2025-12-05 13:03:03',1),(36,32,'<name> has initiated exit procedure on <createddate>',322,NULL,'2025-12-11 04:44:15','2025-12-11 04:44:15',1),(37,33,'<name> has initiated exit procedure on <createddate>',322,NULL,'2025-12-22 11:45:35','2025-12-22 11:45:35',1),(38,34,'<name> has initiated exit procedure on <createddate>',322,NULL,'2025-12-24 13:16:31','2025-12-24 13:16:31',1),(39,35,'<name> has initiated exit procedure on <createddate>',322,NULL,'2025-12-29 12:44:03','2025-12-29 12:44:03',1),(40,36,'<name> has initiated exit procedure on <createddate>',187,NULL,'2026-01-14 05:26:37','2026-01-14 05:26:37',1),(41,37,'<name> has initiated exit procedure on <createddate>',187,NULL,'2026-01-14 05:35:49','2026-01-14 05:35:49',1),(42,38,'<name> has initiated exit procedure on <createddate>',187,NULL,'2026-01-22 06:35:54','2026-01-22 06:35:54',1),(43,39,'<name> has initiated exit procedure on <createddate>',187,NULL,'2026-01-22 06:38:18','2026-01-22 06:38:18',1),(44,40,'<name> has initiated exit procedure on <createddate>',187,NULL,'2026-01-22 06:41:08','2026-01-22 06:41:08',1),(45,41,'<name> has initiated exit procedure on <createddate>',187,NULL,'2026-01-22 06:41:48','2026-01-22 06:41:48',1),(46,42,'<name> has initiated exit procedure on <createddate>',187,NULL,'2026-01-22 06:44:08','2026-01-22 06:44:08',1),(47,43,'<name> has initiated exit procedure on <createddate>',187,NULL,'2026-01-22 06:44:51','2026-01-22 06:44:51',1),(48,44,'<name> has initiated exit procedure on <createddate>',187,NULL,'2026-01-22 06:46:45','2026-01-22 06:46:45',1),(49,45,'<name> has initiated exit procedure on <createddate>',187,NULL,'2026-02-03 12:33:42','2026-02-03 12:33:42',1);
/*!40000 ALTER TABLE `main_exit_history` ENABLE KEYS */;
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
