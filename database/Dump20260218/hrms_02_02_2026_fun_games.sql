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
-- Table structure for table `fun_games`
--

DROP TABLE IF EXISTS `fun_games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fun_games` (
  `id` int NOT NULL AUTO_INCREMENT,
  `game_name` varchar(255) NOT NULL,
  `game_date` date NOT NULL,
  `points_split` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `year` varchar(100) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fun_games`
--

LOCK TABLES `fun_games` WRITE;
/*!40000 ALTER TABLE `fun_games` DISABLE KEYS */;
INSERT INTO `fun_games` VALUES (1,'Testing','2024-06-07','15,10,5',NULL,'2024',187,187,'2024-06-07 07:20:43','2024-06-07 07:25:54',0),(2,'Testing 2','2024-07-26','30,20,10',NULL,'2024',187,187,'2024-06-07 07:21:34','2024-06-07 07:26:00',0),(3,'cricket','2024-06-14','10,9,8,7,6,5',NULL,'2024',187,187,'2024-06-14 15:12:58','2024-06-14 15:13:52',0),(4,'Hula Hoop Ring Pass','2024-06-28','25,20,15,10,5','preview_0_121445.jpg','2024',187,187,'2024-06-24 12:14:45','2024-12-19 10:27:31',1),(5,'Build The Dominoes','2024-07-26','25,20,15,10,5','preview_0_072225.png','2024',187,187,'2024-07-25 07:22:25','2024-12-19 10:27:31',1),(6,'Jump in Jump out ','2024-08-14','25,20,15,10,5','preview_0_084200.png','2024',187,187,'2024-08-13 08:42:00','2024-08-13 09:26:01',0),(7,'Balloon Stomp','2024-08-14','25,20,15,10,5',NULL,'2024',187,187,'2024-08-13 08:53:23','2024-08-13 09:25:53',0),(8,'Carrom competition','2024-08-19','25,20,15,10,5','preview_0_090135.png','2024',187,187,'2024-08-13 09:01:35','2024-12-19 10:27:31',1),(9,'Balloon Stomp','2024-08-14','25,20,15,10,5','preview_0_110450.png','2024',187,187,'2024-08-13 11:04:50','2024-08-14 05:48:04',0),(10,'Jump in Jump out ','2024-08-14','25,20,15,10,5','preview_0_110528.png','2024',187,187,'2024-08-13 11:05:28','2024-12-19 10:27:31',1),(11,'Independence Day- Poster making ','2024-08-14','25,20,15,10,5','preview_0_043940.png','2024',187,187,'2024-08-19 04:39:40','2024-12-19 10:27:31',1),(12,'Independence Day- Dress code','2024-08-14','5,4,3,2,1','preview_0_060355.png','2024',187,187,'2024-08-19 05:59:59','2024-12-19 10:27:31',1),(13,'Onam- pookalam competition','2024-09-13','25,20,15,10,5','preview_0_085340.png','2024',187,187,'2024-09-17 08:53:40','2024-12-19 10:27:31',1),(14,'Onam- Traditional Dress Code','2024-09-17','5,4,3,2,1','preview_0_085608.png','2024',187,187,'2024-09-17 08:56:08','2024-12-19 10:27:31',1),(15,'Cricket Tournament','2024-09-20','25,20,15,10,5','preview_0_063930.png','2024',187,187,'2024-09-19 06:39:30','2024-12-19 10:27:31',1),(16,'Potluck','2024-10-25','25,20,15,10,5','preview_0_044940.png','2024',187,187,'2024-10-14 04:49:40','2024-12-19 10:27:31',1),(17,'Diwali Dress code','2024-10-25','5,4,3,2,1','preview_0_045731.png','2024',187,187,'2024-10-14 04:57:31','2024-12-19 10:27:31',1),(18,'TT Tournament','2024-11-29','25,20,15,10,5','preview_0_045919.png','2024',187,187,'2024-10-14 04:59:19','2024-12-19 10:27:31',1),(19,'Diwali- Diya Painting competition','2024-10-25','25,20,15,10,5','preview_0_064614.png','2024',187,187,'2024-10-26 06:46:14','2024-12-19 10:27:31',1),(20,'Fitness Challenge','2024-12-06','25,20,15,10,5','preview_0_104442.png','2024',187,187,'2024-11-13 10:44:42','2024-12-19 10:27:31',1),(21,'Guess the song','2024-12-20','25,20,15,10,5','preview_0_105130.png','2024',187,187,'2024-11-13 10:51:30','2024-12-19 10:27:31',1),(22,'Balloon Stomp','2024-12-13','25,20,15,10,5','preview_0_105916.png','2024',187,187,'2024-11-13 10:59:16','2024-12-19 10:27:31',1),(23,'Adzap','2024-12-27','25,20,15,10,5','preview_0_110103.png','2024',187,187,'2024-11-13 11:01:03','2024-12-19 10:27:31',1),(24,'Paper Peak Challenge','2025-07-25',',,,',NULL,'2025',322,322,'2025-07-24 10:42:34','2025-07-24 11:35:53',0),(25,'Paper Peak Challenge','2025-07-25','10,8,6,4','preview_0_170800.jpeg','2025',322,187,'2025-07-24 11:38:00','2025-10-17 05:47:48',1),(26,'Independence Day Quiz','2025-08-14','10,8,6,4','preview_0_181848.jpg','2025',322,187,'2025-08-13 04:46:18','2025-10-17 05:47:48',1),(27,'Independence Day Dress Code','2025-08-14','5,4,3,2','preview_1_181848.jpg','2025',322,187,'2025-08-14 12:45:49','2025-10-17 05:47:48',1),(28,'Cup coordination challenge','2025-09-01','10,8,6,4','preview_0_093640.jpg','2025',322,187,'2025-09-01 04:06:40','2025-10-17 05:47:48',1),(29,'Poo Kolam','2025-09-05','10,8,6,4','preview_0_122327.jpg','2025',322,187,'2025-09-05 12:18:32','2025-10-17 05:47:48',1),(30,'Onam Dress Code','2025-09-05','5,4,3,2','preview_0_151054.jpg','2025',322,187,'2025-09-09 09:40:54','2025-10-17 05:47:48',1),(31,'Badminton','2025-09-26','10,8,6,4','preview_0_083520.png','2025',322,187,'2025-09-29 03:05:20','2025-10-17 05:47:48',1),(32,'Straw Bangle Relay','2025-10-17','10,8,6,4','preview_0_101832.png','2025',187,187,'2025-10-17 04:48:32','2025-10-17 05:47:48',1),(33,'Guess the Song','2025-10-17','10,8,6,4','preview_0_102030.png','2025',187,187,'2025-10-17 04:50:30','2025-10-17 05:47:48',1),(34,'Diwali Dress Code','2025-10-16','5,4,3,2','preview_0_111748.png','2025',187,187,'2025-10-17 05:46:01','2025-10-17 05:47:48',1),(35,'Potluck','2025-12-17','10,8,6,4','preview_0_110203.png','2025',187,187,'2025-12-23 05:32:03','2025-12-23 05:32:03',1),(36,'Leg Dodge Ball','2025-12-24','10,8,6,4','preview_0_183019.png','2025',187,187,'2025-12-24 13:00:19','2025-12-24 13:00:19',1),(37,'Christmas Dress Code','2025-12-24','5,4,3,2','preview_0_183341.png','2025',187,187,'2025-12-24 13:03:41','2025-12-24 13:03:41',1),(38,'Guess the sketch','2025-12-31','10,8,6,4','preview_0_181505.png','2025',187,187,'2025-12-31 12:45:05','2025-12-31 12:45:05',1),(39,'Guess the sketch','2025-12-31','10,8,6,4','preview_0_192424.png','2025',187,187,'2025-12-31 13:54:24','2025-12-31 13:54:24',1);
/*!40000 ALTER TABLE `fun_games` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:58:22
