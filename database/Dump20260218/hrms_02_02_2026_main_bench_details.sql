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
-- Table structure for table `main_bench_details`
--

DROP TABLE IF EXISTS `main_bench_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_bench_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `prev_project_id` int DEFAULT NULL,
  `prev_man_id` int NOT NULL,
  `skill` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `experience` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bench_date` date NOT NULL,
  `new_project` int DEFAULT NULL,
  `new_manager_id` int DEFAULT NULL,
  `proj_alloc_date` date DEFAULT NULL,
  `moved_new_project` int DEFAULT NULL COMMENT '1-Yes,2-No',
  `manager_review` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_bench_details`
--

LOCK TABLES `main_bench_details` WRITE;
/*!40000 ALTER TABLE `main_bench_details` DISABLE KEYS */;
INSERT INTO `main_bench_details` VALUES (1,242,1,77,'PHP','4','2025-05-14',12,77,'2025-05-15',1,NULL,'2025-05-15 13:29:43','2025-05-15 13:30:19',77,322,1),(2,148,2,145,'Automation QA','5','2025-05-19',8,325,'2025-06-23',1,NULL,'2025-05-19 08:00:24','2025-06-30 05:42:39',145,322,1),(3,37,18,325,'Java Back end Developer - Primary\nAngular and Vue Js as secondary','3 ','2025-06-09',5,312,'2025-06-18',1,NULL,'2025-06-10 06:54:28','2025-06-19 07:31:06',325,322,1),(4,83,8,325,'Java Back end Developer','3 ','2025-06-06',2,145,'2025-07-15',1,NULL,'2025-06-10 06:55:02','2025-07-17 04:54:37',325,322,1),(5,347,NULL,325,'AWS Devops Engineer','5 ','2025-06-02',11,145,'2025-07-14',1,NULL,'2025-06-10 06:55:36','2025-07-21 04:12:33',325,322,1),(6,122,17,325,'Manual and Automation Tester','2.9','2025-06-05',4,20,'2025-06-26',1,NULL,'2025-06-10 06:56:52','2025-06-30 05:41:49',325,322,1),(7,208,19,20,'Quality Testing, Automation','1.9','2025-01-31',4,20,'2025-06-12',1,NULL,'2025-06-11 04:48:43','2025-06-19 07:34:14',20,322,1),(8,181,19,20,'Quality Testing, Automation','2.2','2025-01-31',3,312,'2025-06-12',1,NULL,'2025-06-11 04:49:39','2025-06-19 07:34:42',20,322,1),(9,121,8,325,'Java Back end','3 ','2025-07-01',3,24,'2025-07-07',1,NULL,'2025-07-03 13:20:04','2025-07-08 03:59:47',325,322,1),(10,88,8,325,'Playwritght Automation Tester','3 ','2025-06-27',NULL,NULL,NULL,2,NULL,'2025-07-03 13:20:59','2025-07-03 13:20:59',325,325,0),(11,293,8,325,'Java Backend','4 ','2025-08-12',NULL,NULL,NULL,2,NULL,'2025-08-12 05:14:48','2025-08-12 05:14:48',325,325,1),(12,380,NULL,240,'.Net Core','4 years','2025-08-26',NULL,NULL,NULL,2,'Unavailability and limited contribution affecting client deliverables; moved to bench for HR action.','2025-08-26 06:44:41','2025-08-26 06:44:41',240,240,1),(13,390,NULL,325,'Mobile app developer (flutter)','4+','2025-09-16',4,7,'2025-10-23',1,'from BB','2025-09-18 12:44:00','2025-10-23 04:59:21',325,322,1),(14,55,10,145,'Java full stack developer','4','2025-09-30',5,7,'2025-11-03',1,'Good','2025-10-07 07:02:30','2025-11-13 14:35:58',145,322,1),(15,117,3,24,'Springboot Angular Mysql MongoDB','3','2025-10-09',5,7,'2025-10-10',1,'Outstanding contributor','2025-10-09 06:47:20','2025-10-24 05:35:55',24,322,1),(16,89,18,24,'Angular','3.5','2025-10-09',4,7,'2025-10-10',1,'Good','2025-10-09 06:47:55','2025-10-23 05:00:21',24,322,1),(17,121,3,24,'Springboot Angular Mysql MongoDB','3','2025-10-09',4,7,'2025-10-10',1,'Outstanding contributor','2025-10-09 06:48:25','2025-10-23 04:58:40',24,322,1),(18,181,3,24,'QA - Manual and Automation','2+','2025-10-09',5,20,'2025-10-09',1,'Good','2025-10-09 06:49:28','2025-10-09 09:50:43',24,322,1),(19,347,11,145,'AWS Cloud Engineer','5','2025-10-13',4,7,'2025-10-23',1,'Good','2025-10-24 04:45:05','2025-10-24 04:47:58',145,322,1),(20,345,3,24,'Angular Springboot','3','2025-10-24',NULL,NULL,NULL,2,'Good in Angular, Average in Springboot','2025-10-24 05:44:54','2025-10-24 05:44:54',24,24,1),(21,217,3,24,'Angular Springboot Mongodb','2+','2025-10-27',6,7,'2025-11-04',1,'Good in Springboot, average in Angular','2025-10-24 05:46:12','2025-11-07 05:36:29',24,322,1),(22,174,3,24,'Springboot, Angular, Mongodb, Mysql','2+','2025-10-27',4,7,'2025-11-04',1,'Good','2025-10-24 05:47:43','2025-11-07 05:37:11',24,322,1),(23,194,3,24,'Springboot, Angular, MongoDB, MySQL','2+','2025-10-27',5,7,'2025-11-04',1,'Good','2025-10-24 05:49:28','2025-11-07 05:36:51',24,322,1),(24,360,3,24,'springboot angular','fresher','2025-10-27',4,7,'2025-11-04',1,'average','2025-10-24 10:46:46','2025-11-07 05:37:32',24,322,1),(25,256,3,228,'Manual and Automation Testing (selenium testing)','1.5','2025-10-28',NULL,NULL,NULL,2,'Good','2025-10-24 10:54:37','2025-10-24 10:54:37',228,228,1),(26,262,3,228,'Manual and Automation (Selenium testing)','1.5','2025-10-28',NULL,NULL,NULL,2,'Good','2025-10-24 10:55:22','2025-10-24 10:55:22',228,228,1),(27,114,17,325,'Java BE','3+','2025-12-12',NULL,NULL,NULL,2,'\"Met expectation\" based on the last ilife client engagement. He needs improvement on proactiveness and accountability.  ','2025-12-12 06:16:01','2025-12-12 06:16:01',325,325,1),(28,310,7,240,'React.js, JavaScript (ES6+), TypeScript, Redux, HTML5, CSS3','4 years','2025-12-16',NULL,NULL,NULL,2,'He has taken unplanned leave without prior notice three times, each time being unavailable for a full week, impacting customer commitments and frustrating the customer, who has requested a replacement','2025-12-16 12:27:10','2025-12-16 12:27:10',240,240,1),(29,346,NULL,325,'QA Automation - Playwright','4+','2025-12-31',NULL,NULL,NULL,2,'Met Expectation','2025-12-29 06:20:09','2025-12-29 06:20:09',325,325,1),(30,174,5,24,'JAVA, Springboot, Angular, Mysql, MongoDB','2.5+','2025-12-31',NULL,NULL,NULL,2,'Good','2025-12-30 05:29:28','2025-12-30 05:29:28',24,24,1),(31,329,3,24,'JAVA, SPRINGBOOT, MYSQL, MONGODB','2.5+','2026-01-02',NULL,NULL,NULL,2,'GOOD','2026-01-01 14:01:43','2026-01-01 14:01:43',24,24,1),(32,96,18,24,'JAVA, SPRINGBOOT, MYSQL, MONGODB, ANGULAR','3+','2026-01-02',NULL,NULL,NULL,2,'GOOD','2026-01-01 14:02:15','2026-01-01 14:02:15',24,24,1),(33,416,NULL,24,'JAVA, SPRINGBOOT, MYSQL, MONGODB, ANGULAR','2+','2026-01-02',NULL,NULL,NULL,2,'GOOD','2026-01-01 14:02:40','2026-01-01 14:02:40',24,24,1),(34,357,3,24,'JAVA, SPRINGBOOT, MYSQL, MONGODB, ANGULAR','7 MONTHS','2026-01-02',NULL,NULL,NULL,2,'GOOD','2026-01-01 14:03:29','2026-01-01 14:03:29',24,24,1),(35,349,NULL,20,'BA','*','2026-01-02',NULL,NULL,NULL,2,'Not met the expectation','2026-01-02 08:16:12','2026-01-02 08:16:12',20,20,1),(36,125,4,20,'Manual Testing\r\nAutomation Testing - Selenium Playwright','3.3','2026-01-02',NULL,NULL,NULL,2,'Somewhat met the expectation still needs improvement','2026-01-02 08:17:15','2026-01-02 08:17:15',20,20,1),(37,296,4,20,'Manual Testing\r\nAutomation Testing - Selenium Playwright','*','2026-01-02',NULL,NULL,NULL,2,'Not met expectation','2026-01-02 08:17:47','2026-01-02 08:17:47',20,20,1),(38,122,4,20,'Automation and Manual Testing','3+','2026-01-02',NULL,NULL,NULL,2,'need improvement','2026-01-02 08:18:44','2026-01-02 08:18:44',20,20,1),(39,242,1,4,'test','2','2025-05-06',12,4,'2025-05-06',1,'test','2026-02-03 12:54:16','2026-02-03 12:55:02',4,187,1);
/*!40000 ALTER TABLE `main_bench_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:58:42
