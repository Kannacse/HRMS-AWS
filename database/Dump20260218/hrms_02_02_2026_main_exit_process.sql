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
-- Table structure for table `main_exit_process`
--

DROP TABLE IF EXISTS `main_exit_process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_exit_process` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `employee_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `department_id` int NOT NULL,
  `job_title_id` int NOT NULL,
  `exit_type_id` int NOT NULL,
  `overall_status` enum('Pending','Approved') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'Pending',
  `overall_comments` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `relieving_date` date NOT NULL,
  `notice_days_present` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `total_working_days` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `reporting_manager` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `hr_manager` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `accounts_manager` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `admin_manager` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `hr_status` enum('pending','completed') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `hr_remarks` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `rep_man_status` enum('pending','completed') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `rep_man_remarks` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `admin_status` enum('pending','completed') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `admin_remarks` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `finance_status` enum('pending','completed') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `finance_remarks` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `relieving_letter_status` enum('generated','not_generate') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'not_generate',
  `createdby` int DEFAULT NULL,
  `modifiedby` int DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_exit_process`
--

LOCK TABLES `main_exit_process` WRITE;
/*!40000 ALTER TABLE `main_exit_process` DISABLE KEYS */;
INSERT INTO `main_exit_process` VALUES (1,77,'CBT720690',15,13,1,'Pending','Testing','2025-05-13',NULL,'3 years 1 month','334','322','305','242',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'not_generate',322,322,'2025-05-13 05:02:43','2025-05-12 23:34:06',0),(2,77,'CBT720690',15,13,1,'Approved','Testing','2025-05-13','13','3 years 1 month','334','322','305','242','completed',NULL,'completed','testing','completed',NULL,NULL,NULL,'not_generate',322,322,'2025-05-13 05:14:13','2025-05-12 23:50:42',0),(3,77,'CBT720690',15,13,1,'Approved','Testing','2025-05-13','13','3 years 1 month','334','322','18','242','completed',NULL,'completed','testing','completed','testttttttt','completed',NULL,'not_generate',322,322,'2025-05-13 05:22:07','2025-05-12 23:59:09',0),(4,334,'CBT720925',15,16,1,'Approved','Personal reasons-Family Emergency ','2025-05-29',NULL,'0 years 3 months','4','322','305','103','completed',NULL,'completed','Good','completed','charger and laptop received laptop condition ok  ','completed',NULL,'not_generate',322,322,'2025-05-29 12:20:01','2025-05-30 02:12:25',1),(5,252,'CBT720848',15,18,1,'Approved','Better Opportunity','2025-06-06','9','1 year 2 months','145','322','305','103','completed',NULL,'completed','All clear','completed','All are received','completed',NULL,'not_generate',322,322,'2025-06-06 11:11:54','2025-06-09 05:50:24',1),(6,56,'CBT720670',15,13,1,'Approved','Better Opportunity','2025-06-06','9','3 years 4 months','24','322','305','103','completed',NULL,'completed',NULL,'completed','laptop conduction is good. screw 2 no\'s & bottom bushes missing  ','completed',NULL,'not_generate',322,322,'2025-06-06 12:44:31','2025-06-11 12:28:48',1),(7,60,'CBT720673',15,13,1,'Approved','Career growth','2025-06-11','14','3 years 4 months','24','322','305','103','completed',NULL,'completed',NULL,'completed','keyboard kyes damage but working',NULL,NULL,'not_generate',322,322,'2025-06-11 12:24:49','2025-06-18 07:10:24',1),(8,42,'CBT720685',15,13,1,'Approved','Better Growth','2025-06-30',NULL,'3 years 3 months','325','322','18','103','completed',NULL,'completed','Client credentials will be removed by Excelencia by EOB 10PM, and CBT credentials can be revoked by 10PM on June 30th, as the shift finishes at 10PM.\r\n\r\nAML Tech KT has been provided to Vinoth and Excelencia KT has been taken care by client.','completed','hp laptop back cover bush damage & Bi70 Lenovo mouse missing ','completed',NULL,'generated',322,322,'2025-06-30 13:19:00','2025-07-16 09:12:19',1),(9,147,'CBT720751',9,25,1,'Approved','Career Growth','2025-07-02',NULL,'2 years 6 months','374','322','305','103','completed',NULL,'completed',NULL,'completed','laptop mother board failure and mouse missing ','completed',NULL,'generated',322,322,'2025-07-02 12:40:40','2025-08-19 05:19:47',1),(10,88,'CBT720645',15,15,1,'Approved','Career growth','2025-07-04','6','3 years 9 months','325','322','305','103','completed',NULL,'completed','Informed Christy-ilife to revoke the status.',NULL,NULL,'completed',NULL,'generated',322,322,'2025-07-04 11:55:27','2025-07-16 09:15:40',1),(11,63,'CBT720626',15,14,1,'Pending','Career Growth ','2025-07-28',NULL,'4 years 5 months','24','322','305','103',NULL,NULL,NULL,NULL,'completed','Wired Mouse cbt06 missing and ide card not handover ',NULL,NULL,'not_generate',322,322,'2025-07-28 11:33:55','2025-07-28 11:50:18',1),(12,68,'CBT720745',15,14,1,'Approved','Carrer growth','2022-08-31',NULL,'0 years 2 months','6','322','18','103','completed',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'generated',322,322,'2025-07-29 04:55:21','2025-07-29 04:56:14',1),(13,87,'CBT720714',15,13,1,'Approved','Career growth','2025-07-29',NULL,'3 years 5 months','228','322','305','103','completed',NULL,NULL,NULL,'completed','laptop back cover bush damage screws missing  ',NULL,NULL,'generated',322,322,'2025-07-29 12:57:52','2025-08-21 05:05:52',1),(14,156,'CBT720759',9,25,1,'Pending','Better opportunity','2025-08-05','8','2 years 5 months','4','322','18','103',NULL,NULL,NULL,NULL,NULL,NULL,'completed',NULL,'generated',322,322,'2025-08-05 12:49:36','2025-09-05 08:57:31',1),(15,293,'CBT720884',15,13,1,'Approved','Career Growth','2025-08-12','15','1 year 1 month','325','322','305','103','completed',NULL,'completed',NULL,NULL,NULL,'completed',NULL,'generated',322,322,'2025-08-12 13:02:56','2025-09-05 08:56:07',1),(16,50,'CBT720665',15,15,1,'Pending','Career Growth','2025-08-13',NULL,'3 years 7 months','20','322','18','103',NULL,NULL,NULL,NULL,NULL,NULL,'completed',NULL,'generated',322,322,'2025-08-19 05:20:12','2025-09-05 08:52:55',1),(17,188,'CBT720799',9,58,1,'Pending','Career Growth','2025-08-18',NULL,'2 years 3 months','396','322','18','103','completed',NULL,'completed','Yes, go ahead','completed','laptop top cover damage & headset damage  ','completed',NULL,'generated',322,322,'2025-08-19 05:18:25','2025-09-05 08:58:17',1),(18,292,'CBT720883',12,45,1,'Pending','Higher Education','2025-09-12',NULL,'1 year 2 months','5','322','305','103',NULL,NULL,'completed',NULL,NULL,NULL,'completed',NULL,'generated',322,322,'2025-09-12 13:38:28','2025-10-22 06:48:29',1),(19,152,'CBT720756',15,17,3,'Pending',' Termination','2025-07-17',NULL,'2 years 5 months','145','322','305','103',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'generated',322,322,'2025-09-18 12:40:27','2025-09-18 12:45:44',1),(20,378,'CBT720957',15,13,1,'Pending','Project Ended','2025-09-22',NULL,'0 years 3 months','145','322','305','103',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'generated',322,322,'2025-09-24 06:10:55','2025-10-10 04:48:29',1),(21,371,'CBT720953',15,13,1,'Pending','Project Ended','2025-09-12',NULL,'0 years 3 months','145','322','305','103',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'generated',322,322,'2025-09-24 06:16:11','2025-09-24 06:16:53',1),(22,288,'CBT720879',15,39,1,'Pending','Project Ended','2025-09-30',NULL,'1 year 3 months','145','322','305','103',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'generated',322,322,'2025-09-30 12:51:26','2025-10-22 06:40:22',1),(23,327,'CBT720919',15,14,1,'Pending','Carrer Growth','2025-10-06',NULL,'0 years 9 months','145','322','305','103',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'generated',322,322,'2025-10-07 03:18:55','2025-10-22 06:39:39',1),(24,337,'CBT720931',14,55,1,'Pending','ISO Audit Over ','2025-09-01',NULL,'0 years 6 months','3','322','18','103',NULL,NULL,NULL,NULL,NULL,NULL,'completed',NULL,'not_generate',322,322,'2025-10-07 03:23:53','2025-10-07 03:45:31',1),(25,97,'CBT720702',15,13,1,'Pending','Career growth','2025-10-23','25','3 years 3 months','7','322','305','103',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'generated',322,322,'2025-10-23 12:30:39','2025-11-28 09:58:58',1),(26,98,'CBT720705',15,13,1,'Pending','Career Growth','2025-10-27',NULL,'3 years 3 months','7','322','305','103',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'generated',322,322,'2025-11-03 06:15:38','2025-12-11 04:42:45',1),(27,226,'CBT720822',15,14,1,'Pending','Code of Conduct','2025-11-05',NULL,'2 years 2 months','145','322','18','103',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'generated',322,322,'2025-11-05 05:30:58','2025-11-19 06:25:07',1),(28,301,'CBT720892',15,14,1,'Approved','Moving to Icon directly','2025-11-07',NULL,'1 year 3 months','145','187','305','103','completed','undefined',NULL,NULL,NULL,NULL,NULL,NULL,'generated',187,187,'2025-11-07 12:53:13','2025-11-18 13:04:19',1),(29,390,'CBT720964',15,14,1,'Pending','Project Ended ','2025-11-21',NULL,'0 years 4 months','7','322','305','103',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'generated',322,322,'2025-11-25 12:31:28','2025-12-11 04:22:44',1),(30,123,'CBT720717',15,13,1,'Pending','Performance Issues \r\n','2025-11-27',NULL,'3 years 2 months','7','322','305','103',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'not_generate',322,322,'2025-11-28 04:48:00','2025-11-27 23:18:00',1),(31,121,'CBT720715',15,12,1,'Pending','Better Opportunity ','2025-12-05',NULL,'3 years 3 months','7','322','305','103',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'not_generate',322,322,'2025-12-05 13:03:03','2025-12-05 07:33:03',1),(32,403,'CBT720970',15,14,1,'Pending','Career Growth','2025-12-09',NULL,'0 years 3 months','325','322','305','103',NULL,NULL,'completed',NULL,NULL,NULL,NULL,NULL,'generated',322,322,'2025-12-11 04:44:15','2025-12-30 03:37:04',1),(33,120,'CBT720674',15,12,1,'Pending','Career growth','2025-12-17',NULL,'3 years 3 months','7','322','305','103',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'generated',322,322,'2025-12-22 11:45:35','2026-01-07 06:53:13',1),(34,18,'CBT720648',14,27,1,'Pending','Career Growth ','2025-12-24',NULL,'4 years 1 month','3','322','305','103',NULL,NULL,'completed',NULL,NULL,NULL,NULL,NULL,'not_generate',322,322,'2025-12-24 13:16:31','2025-12-24 13:20:13',1),(35,405,'CBT720972',15,14,1,'Pending','Carrer growth ','2025-12-24',NULL,'0 years 3 months','325','322','305','103',NULL,NULL,'completed','Knowledge Transfer Status to Abisheek (Bluebird)',NULL,NULL,NULL,NULL,'generated',322,322,'2025-12-29 12:44:03','2026-01-22 06:49:07',1),(36,347,'CBT720941',15,14,1,'Pending','Career Growth','2025-12-29',NULL,'0 years 8 months','7','187','305','103',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'not_generate',187,187,'2026-01-14 05:26:37','2026-01-13 23:56:37',1),(37,345,'CBT720939',15,14,1,'Pending','Career Growth','2026-01-14',NULL,'0 years 10 months','24','187','305','103',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'not_generate',187,187,'2026-01-14 05:35:49','2026-01-14 00:05:49',1),(38,114,'CBT720726',15,13,1,'Pending','Career Growth','2026-01-14',NULL,'3 years 2 months','325','187','305','103',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'not_generate',187,187,'2026-01-22 06:35:54','2026-01-22 01:08:57',0),(39,349,'CBT720943',15,18,1,'Pending','Career Growth','2026-01-16',NULL,'0 years 9 months','20','187','305','103',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'not_generate',187,187,'2026-01-22 06:38:18','2026-01-22 01:08:18',1),(40,114,'CBT720726',15,13,1,'Pending','Career Growth','2026-01-16',NULL,'3 years 2 months','325','187','305','103',NULL,NULL,'completed','Knowledge Transfer Status to Bharathwaj-Lowcode',NULL,NULL,NULL,NULL,'not_generate',187,187,'2026-01-22 06:41:08','2026-01-22 06:48:32',1),(41,379,'CBT720958',9,25,1,'Pending','Career Growth','2026-01-16',NULL,'0 years 6 months','396','187','305','103',NULL,NULL,'completed','Done',NULL,NULL,NULL,NULL,'not_generate',187,187,'2026-01-22 06:41:48','2026-01-22 06:45:30',1),(42,122,'CBT720716',15,12,1,'Pending','Career Growth','2026-01-19',NULL,'3 years 4 months','20','187','305','103',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'not_generate',187,187,'2026-01-22 06:44:08','2026-01-22 01:14:08',1),(43,135,'CBT720738',15,16,1,'Pending','Career Growth','2026-01-19',NULL,'3 years 0 months','228','187','305','103',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'not_generate',187,187,'2026-01-22 06:44:51','2026-01-22 01:14:51',1),(44,346,'CBT720940',15,15,1,'Pending','Career Growth','2026-01-20',NULL,'0 years 10 months','325','187','305','103',NULL,NULL,'completed',NULL,NULL,NULL,NULL,NULL,'not_generate',187,187,'2026-01-22 06:46:45','2026-01-22 06:48:05',1),(45,128,'CBT720729',15,15,1,'Approved','test','2026-01-13','32','3 years 1 month','4','187','305','242','completed','undefined','completed','Test','completed','qw',NULL,NULL,'not_generate',187,187,'2026-02-03 12:33:42','2026-02-03 12:42:58',1);
/*!40000 ALTER TABLE `main_exit_process` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 15:00:26
