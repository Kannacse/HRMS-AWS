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
-- Table structure for table `main_positions`
--

DROP TABLE IF EXISTS `main_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_positions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `positionname` varchar(100) DEFAULT NULL,
  `jobtitleid` int unsigned DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdby` int DEFAULT NULL,
  `modifiedby` int DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_positions`
--

LOCK TABLES `main_positions` WRITE;
/*!40000 ALTER TABLE `main_positions` DISABLE KEYS */;
INSERT INTO `main_positions` VALUES (1,'Team Lead',1,'Teamwork is vital to the success of any business, but unfortunately groups of people wonâ€™t always work well together.',1,1,'2019-06-14 05:35:49','2022-07-12 09:57:18',0),(2,'HR Executive',2,'A Manager is the person responsible for planning and directing the work of a group of individuals, monitoring their work, and taking corrective action when necessary.',1,1,'2019-06-14 05:36:38','2022-07-12 09:57:15',0),(3,'Jr Software developer trainee',3,'Before you enter the IT industry as a graduate/trainee, youre likely to have an idea of where your interests lie.',1,1,'2019-06-14 05:37:25','2022-07-12 09:57:12',0),(4,'Sr Software Engineer',3,'Software engineers apply the principles of engineering to the design, development, maintenance, testing, and evaluation of the software.',1,1,'2019-06-14 05:37:46','2022-07-12 09:57:12',0),(5,'Manager',4,'A Manager is the person responsible for planning and directing the work of a group of individuals, monitoring their work, and taking corrective action when necessary.',1,1,'2019-06-14 05:38:20','2022-07-12 09:57:09',0),(6,'Management',5,'He is responsible for the entire operations of the Organization.',1,1,'2019-06-14 05:50:32','2022-07-12 09:57:06',0),(7,'mid',3,NULL,1,1,'2019-09-20 12:19:46','2022-07-12 09:57:12',0),(8,'top',7,'test',1,1,'2019-09-23 05:59:21','2019-11-25 06:16:28',0),(9,'medium',2,'test',1,1,'2019-09-23 06:19:47','2022-07-12 09:57:15',0),(10,'Jr Software developer',3,NULL,1,1,'2019-11-26 11:13:20','2022-07-12 09:57:12',0),(11,'Sr Software developer',3,NULL,1,1,'2019-11-26 11:13:45','2022-07-12 09:57:12',0),(12,'Jr Software analyst trainee',3,NULL,1,1,'2019-11-26 11:14:47','2022-07-12 09:57:12',0),(13,'Jr Software analyst',3,NULL,1,1,'2019-11-26 11:15:04','2022-07-12 09:57:12',0),(14,'Sr Software analyst',3,NULL,1,1,'2019-11-26 11:15:17','2022-07-12 09:57:12',0),(15,'HR Trainee',2,NULL,1,1,'2019-11-26 11:43:11','2022-07-12 09:57:15',0),(16,'Java',1,NULL,1,1,'2020-02-26 06:04:47','2022-07-12 09:57:18',0),(17,'Java Exp',8,NULL,1,1,'2020-02-26 06:07:19','2022-07-12 09:56:57',0),(18,'CEO',5,NULL,1,1,'2020-08-19 08:34:02','2022-07-12 09:57:06',0),(19,'Finance and Accounts Head',9,NULL,1,1,'2022-06-06 09:08:13','2022-07-12 09:56:53',0),(20,'Developer',8,NULL,1,1,'2022-06-20 13:46:15','2022-07-12 09:56:57',0),(21,'Sr Business Analyst',18,NULL,6,6,'2024-02-17 09:34:40','2024-02-17 09:34:40',1),(22,'Senior HR Manager',54,'Senior HR Manager',322,322,'2025-01-20 09:57:42','2025-01-20 09:57:42',1),(23,'UX',57,NULL,322,322,'2025-06-09 06:13:23','2025-06-09 06:13:23',1);
/*!40000 ALTER TABLE `main_positions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:58:28
