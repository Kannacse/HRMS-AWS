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
-- Table structure for table `main_resignation`
--

DROP TABLE IF EXISTS `main_resignation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_resignation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `reporting_manager` int NOT NULL,
  `resignation_raise_date` date NOT NULL,
  `last_working_date` date DEFAULT NULL,
  `project` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `comments` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` enum('employee_initiated','reporting_manager_approved','reporting_manager_rejected','employee_revocked') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `resignation_block_date` date DEFAULT NULL,
  `manager_approval_comments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `manager_reject_comments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `revoke_comments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `created_by` int DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `is_active` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_resignation`
--

LOCK TABLES `main_resignation` WRITE;
/*!40000 ALTER TABLE `main_resignation` DISABLE KEYS */;
INSERT INTO `main_resignation` VALUES (1,322,239,'2025-02-17','2025-02-17','HR','NA','employee_revocked','2025-02-18','Testing','Test','NA',322,322,'2025-02-17 06:25:44','2025-02-20 03:49:51',0),(2,56,24,'2025-03-10','2025-06-06','Dalko','Looking for new career growth opportunities','reporting_manager_approved',NULL,'Manikandan has completed all his tasks and trained his replacement well to carry on his work. He has completed his KT sessions and Documentations (Date: June 6th 2025)',NULL,NULL,56,24,'2025-03-10 18:26:52','2025-06-06 12:10:55',1),(3,60,228,'2025-03-14',NULL,'Dalko','Need a Location shift','employee_initiated',NULL,NULL,NULL,NULL,60,60,'2025-03-14 08:31:17','2025-03-14 08:31:17',1),(4,239,3,'2025-03-21',NULL,'Human Resources','Resignation mail has been sent to Anand and Madhu on 17th Mar 2025 - Monday','employee_initiated',NULL,NULL,NULL,NULL,239,239,'2025-03-21 10:52:24','2025-03-21 10:52:24',1),(5,147,239,'2025-03-25',NULL,'HR ','Due to father\'s health issues, I would like to resign the job ','employee_initiated',NULL,NULL,NULL,NULL,147,147,'2025-03-25 14:41:27','2025-03-25 14:41:27',1),(6,42,20,'2025-03-26','2025-08-22','iCollab','I am resigning from my current position as I am looking for exploration in new challenges and opportunities to grow both personally and professionally.','reporting_manager_approved',NULL,'Already relieved. ',NULL,NULL,42,20,'2025-03-26 04:48:53','2025-08-22 07:34:04',1),(7,241,312,'2025-04-10','2025-05-09','Lowcode platform (FLOBUILD)','NA','reporting_manager_approved',NULL,'Approved',NULL,NULL,241,312,'2025-04-10 11:07:36','2025-04-17 06:58:20',1),(8,299,312,'2025-04-10','2025-05-09','Lowcode , DMS, Crazy deals','Here learnt lot from experience employee\n\nthanks for giving opportunity ','reporting_manager_approved',NULL,'Approved',NULL,NULL,299,312,'2025-04-10 11:27:46','2025-04-17 06:58:02',1),(9,332,24,'2025-04-25',NULL,'Dalko','NA','employee_initiated',NULL,NULL,NULL,NULL,332,332,'2025-04-25 05:42:42','2025-04-25 05:42:42',1),(10,87,228,'2025-04-30',NULL,'Dalko','Looking for new career growth opportunities','employee_initiated',NULL,NULL,NULL,NULL,87,87,'2025-04-30 12:01:15','2025-04-30 12:01:15',1),(11,37,325,'2025-05-05',NULL,'Excelencia','Resignation is due to personal circumstances.','employee_initiated',NULL,NULL,NULL,NULL,37,37,'2025-05-05 15:27:15','2025-05-05 15:27:15',1),(12,23,325,'2025-05-06',NULL,'Infras(ilife)','Appreciate the experience gained here, I’m stepping into the next phase of my career.','employee_initiated',NULL,NULL,NULL,NULL,23,23,'2025-05-06 07:18:05','2025-05-06 07:18:05',1),(13,88,325,'2025-05-06',NULL,'infras','Thankful for the experience, I’ve learned a lot here, but I’m ready to take the next step in my career journey.','employee_initiated',NULL,NULL,NULL,NULL,88,88,'2025-05-06 07:22:43','2025-05-06 07:22:43',1),(14,156,350,'2025-05-07',NULL,'Recruiter ','Career growth','employee_initiated',NULL,NULL,NULL,NULL,156,156,'2025-05-07 06:39:47','2025-05-07 06:39:47',1),(15,50,312,'2025-05-09',NULL,'CRM','Thank you for the opportunities and support during my time here. I’ve gained valuable experience and appreciated being part of the team.','employee_initiated',NULL,NULL,NULL,NULL,50,50,'2025-05-09 13:12:44','2025-05-09 13:12:44',1),(16,334,4,'2025-05-14',NULL,'HRMS','I’m resigning from my current role due to a family emergency that needs my immediate attention. I truly appreciate the support and experience gained here.','employee_initiated',NULL,NULL,NULL,NULL,334,334,'2025-05-14 03:47:53','2025-05-14 03:47:53',1),(17,188,4,'2025-05-20',NULL,'HR','Career Growth ','employee_initiated',NULL,NULL,NULL,NULL,188,188,'2025-05-20 03:59:57','2025-05-20 03:59:57',1),(18,293,325,'2025-06-17',NULL,'Infras','After thoughtful consideration, I’ve decided to step down due to health reasons and to explore career opportunities that are better aligned with my professional goals and geographically closer to my residence.','employee_initiated',NULL,NULL,NULL,NULL,293,293,'2025-06-17 09:33:34','2025-06-17 09:33:34',1),(19,97,325,'2025-07-28',NULL,'Sunpower Solar','I’ve learned a lot and grown professionally here. Thank you to everyone who made this experience so valuable. Wishing the team continued success','employee_initiated',NULL,NULL,NULL,NULL,97,97,'2025-07-28 17:00:51','2025-07-28 17:00:51',1),(20,95,7,'2025-07-29',NULL,'Low Code Platform','Thank you for the opportunities and support during my time here. I’ve gained valuable experience and appreciated being part of the team.','reporting_manager_rejected','2026-07-29',NULL,'-',NULL,95,7,'2025-07-29 15:37:04','2025-12-30 11:21:06',1),(21,98,7,'2025-07-29',NULL,'LowCode','It’s been an incredible journey filled with learning, growth, and great people. I’m thankful to everyone who supported and inspired me along the way. Wishing the entire team continued success and great milestones ahead!','employee_initiated',NULL,NULL,NULL,NULL,98,98,'2025-07-29 16:32:09','2025-07-29 16:32:09',1),(22,327,145,'2025-08-08',NULL,'Hitachi','I’m writing to formally resign from my position at Code Board Technology. My time here has been valuable, and I truly appreciate the learning and support I’ve received.\n\nThank you for the opportunities and memories. Wishing the team all the best ahead.','employee_initiated',NULL,NULL,NULL,NULL,327,327,'2025-08-08 07:56:53','2025-08-08 07:56:53',1),(23,102,228,'2025-09-01',NULL,'Dalko','It’s been an incredible journey filled with learning, growth, and great people. I’m thankful to everyone who supported and inspired me along the way. Wishing the entire team continued success and great milestones ahead!','employee_initiated',NULL,NULL,NULL,NULL,102,102,'2025-09-01 14:27:46','2025-09-01 14:27:46',1),(24,123,7,'2025-09-06',NULL,'CRM','I am grateful for the opportunities and support I have received during my time here. I have decided to move on to pursue new challenges in my career. I truly value the experience and guidance from my colleagues and management.','employee_initiated',NULL,NULL,NULL,NULL,123,123,'2025-09-06 16:12:39','2025-09-06 16:12:39',1),(25,120,7,'2025-09-08',NULL,'CRM','I\'m thankful for the opportunities and support I\'ve received throughout my time here. I\'ve made the decision to explore new challenges in my career journey. I sincerely appreciate the guidance and experience shared by my colleagues and the management team','employee_initiated',NULL,NULL,NULL,NULL,120,120,'2025-09-08 04:57:30','2025-09-08 04:57:30',1),(26,117,24,'2025-09-08',NULL,'Dalko','It’s been an incredible journey filled with learning, growth, and great people. I’m thankful to everyone who supported and inspired me along the way. Wishing the entire team continued success and great milestones ahead!','employee_initiated',NULL,NULL,NULL,NULL,117,117,'2025-09-08 05:01:08','2025-09-08 05:01:08',1),(27,121,24,'2025-09-08',NULL,'DALKO','I am formally resigning from my position at Code board Technology.','employee_initiated',NULL,NULL,NULL,NULL,121,121,'2025-09-08 13:37:59','2025-09-08 13:37:59',1),(28,18,3,'2025-09-20',NULL,'Accounts ','Resignation Requst','employee_initiated',NULL,NULL,NULL,NULL,18,18,'2025-09-20 09:59:32','2025-09-20 09:59:32',1),(29,189,20,'2025-09-29',NULL,'BOP - KYC process','I am moving forward to pursue a new direction in my career journey','reporting_manager_rejected','2026-01-02',NULL,'Since he revoked the resignation, rejecting this request. ',NULL,189,20,'2025-09-29 05:02:57','2026-01-02 09:51:15',1),(30,301,145,'2025-09-29',NULL,'ICON','Requesting team to release me with one month notice period','employee_initiated',NULL,NULL,NULL,NULL,301,301,'2025-09-29 09:52:53','2025-09-29 09:52:53',1),(31,146,145,'2025-10-27',NULL,'ICON-IOD','I’m resigning from my position to explore better career growth opportunities. I’ve really enjoyed working with the team and appreciate all the support and learning during my time here.','employee_initiated',NULL,NULL,NULL,NULL,146,146,'2025-10-26 22:31:07','2025-10-26 22:31:07',1),(32,114,325,'2025-11-11',NULL,'Ilife','I would like to resign my position as Software developer.\nAlready sent mail on Nov 10 2025.\nApplying this to indicate resignation ','employee_initiated',NULL,NULL,NULL,NULL,114,114,'2025-11-10 18:48:57','2025-11-10 18:48:57',1),(33,403,325,'2025-12-09',NULL,'Blue Bird','Long Distance to travel','employee_initiated',NULL,NULL,NULL,NULL,403,403,'2025-12-09 07:07:08','2025-12-09 07:07:08',1),(34,55,7,'2026-01-31',NULL,'CRM','I had resigned effective 23.01.26. However, since the HRMS was not working until today, I am submitting the resignation application now.','employee_initiated',NULL,NULL,NULL,NULL,55,55,'2026-01-31 10:18:33','2026-01-31 10:18:33',1),(35,242,4,'2026-02-17','2026-02-18','Hrms','qwe','reporting_manager_rejected','2026-02-17','qwd','jy',NULL,242,187,'2026-02-17 10:27:13','2026-02-17 11:09:56',1);
/*!40000 ALTER TABLE `main_resignation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:59:59
