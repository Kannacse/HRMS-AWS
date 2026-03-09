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
-- Table structure for table `main_jobtitles`
--

DROP TABLE IF EXISTS `main_jobtitles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_jobtitles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `jobtitlecode` varchar(255) DEFAULT NULL,
  `jobtitlename` varchar(255) DEFAULT NULL,
  `jobdescription` varchar(255) DEFAULT NULL,
  `minexperiencerequired` float DEFAULT NULL,
  `jobpaygradecode` varchar(255) DEFAULT NULL,
  `jobpayfrequency` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `createdby` int unsigned DEFAULT NULL,
  `modifiedby` int unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_jobtitles`
--

LOCK TABLES `main_jobtitles` WRITE;
/*!40000 ALTER TABLE `main_jobtitles` DISABLE KEYS */;
INSERT INTO `main_jobtitles` VALUES (1,'TL','Team Lead','A team leader or team lead is someone who provides guidance, instruction, direction and leadership to a group of other individuals for the purpose of achieving a key result or group of aligned results',3,'B','1','Team Lead',1,1,'2019-06-14 05:31:35','2022-07-12 09:57:18',0),(2,'HR','Human Resource','Human resource management is the management process of an organizations workforce, or human resources.',2,'B','1','Human Resource',1,1,'2019-06-14 05:32:28','2022-07-12 09:57:15',0),(3,'SE','Software Engineer','Software engineers apply the principles of engineering to the design, development, maintenance, testing, and evaluation of the software.',0,'C','1','Software Engineer',1,1,'2019-06-14 05:33:31','2022-07-12 09:57:12',0),(4,'MGR','Manager','A Manager is the person responsible for planning and directing the work of a group of individuals, monitoring their work, and taking corrective action when necessary.',8,'A','1','Manager',1,1,'2019-06-14 05:34:35','2022-07-12 09:57:09',0),(5,'MD','Managing Director','He is responsible for the entire operations of the Organization.',NULL,'A','1','Managing Director',1,1,'2019-06-14 05:49:52','2022-07-12 09:57:06',0),(6,'HK','House keeping','cleaning',0,'C','1',NULL,1,1,'2019-09-20 10:47:44','2022-07-12 09:57:00',0),(7,'CDO','Chief Development officer','test',15,'1sdq','1','test',1,1,'2019-09-23 05:58:46','2019-11-25 06:16:28',0),(8,'SSE','Senior Software Engineer',NULL,2,'A','1',NULL,1,1,'2020-02-26 06:06:16','2022-07-12 09:56:57',0),(9,'finance and accounts','finance and accounts executive','GST\r\nTDS \r\nTALLY\r\nall transition\r\nAccount audit',NULL,'C','1',NULL,1,1,'2022-06-06 09:06:12','2022-07-12 09:56:53',0),(10,'ADMIN','Admin','Admin',NULL,'3','1',NULL,1,1,'2022-07-12 09:38:01','2022-07-12 09:38:01',1),(11,'APO','Associate Product Owner','Associate Product Owner',NULL,'2','1',NULL,1,1,'2022-07-12 09:38:36','2022-07-12 09:38:36',1),(12,'JSD','Junior Software Developer','Junior Software Developer',NULL,'3','1',NULL,1,1,'2022-07-12 09:38:58','2022-07-12 09:38:58',1),(13,'SD','Software Developer','Software Developer',NULL,'3','1',NULL,1,1,'2022-07-12 09:39:24','2022-07-12 09:39:24',1),(14,'SSD','Senior Software Developer','Senior Software Developer',NULL,'2','1',NULL,1,1,'2022-07-12 09:39:48','2022-07-12 09:39:48',1),(15,'QA','Quality Assurance Engineer','Quality Assurance Engineer',NULL,'2','1',NULL,1,1,'2022-07-12 09:40:06','2022-07-12 09:40:06',1),(16,'JQA','Junior Quality Assurance Engineer','Junior Quality Assurance Engineer',NULL,'3','1',NULL,1,1,'2022-07-12 09:40:31','2022-07-12 09:40:31',1),(17,'SQA','Senior Quality Assurance Engineer','Senior Quality Assurance Engineer',NULL,'2','1',NULL,1,1,'2022-07-12 09:41:04','2022-07-12 09:41:04',1),(18,'BA','Business Analyst','Business Analyst',NULL,'2','1',NULL,1,1,'2022-07-12 09:41:31','2022-07-12 09:41:31',1),(19,'JBA','Junior Business Analyst','Junior Business Analyst',NULL,'3','1',NULL,1,1,'2022-07-12 09:41:56','2022-07-12 09:41:56',1),(20,'SBA','Senior Business Analyst','Senior Business Analyst',NULL,'2','1',NULL,1,1,'2022-07-12 09:42:28','2022-07-12 09:42:28',1),(21,'SC','Scrum Master','Scrum Master',NULL,'2','1',NULL,1,1,'2022-07-12 09:43:46','2022-07-12 09:43:46',1),(22,'JSM','Junior Scrum Master','Junior Scrum Master',NULL,'3','1',NULL,1,1,'2022-07-12 09:44:09','2022-07-13 11:46:34',1),(23,'SSM','Senior Scrum Master','Senior Scrum Master',NULL,'2','1',NULL,1,1,'2022-07-12 09:46:43','2022-07-13 11:52:21',1),(24,'HRG','HR Generalist','HR Generalist',NULL,'2','1',NULL,1,1,'2022-07-12 09:49:45','2022-07-12 09:49:45',1),(25,'HRR','HR Recruiter','HR Recruiter',NULL,'3','1',NULL,1,1,'2022-07-12 09:50:01','2022-07-12 09:50:01',1),(26,'SHRR','Senior HR Recruiter','Senior HR Recruiter',NULL,'2','1',NULL,1,1,'2022-07-12 09:50:20','2022-07-12 09:50:20',1),(27,'ACC','Accounts & Finance Executive','Accounts & Finance Executive',NULL,'3','1',NULL,1,1,'2022-07-12 09:50:48','2022-07-12 09:50:48',1),(28,'J UI UX Design','Junior UI UX designer','Junior UI UX designer',NULL,'3','1',NULL,1,1,'2022-07-12 09:51:10','2022-07-12 09:51:10',1),(29,'UI UX Design','UI UX designer','UI UX designer',NULL,'2','1',NULL,1,1,'2022-07-12 09:51:36','2022-07-12 09:51:36',1),(30,'CEO','CEO','CEO',NULL,'1','1',NULL,1,1,'2022-07-12 09:51:51','2022-07-12 09:51:51',1),(31,'Director','Director','Director',NULL,'1','1',NULL,1,1,'2022-07-12 09:52:11','2022-07-12 09:52:11',1),(32,'HE','Hardware Engineer',NULL,NULL,'4','1',NULL,64,64,'2022-07-26 08:56:43','2022-07-26 08:56:43',1),(33,'BDE','Business Development Executive',NULL,NULL,'4','1',NULL,64,64,'2022-08-03 11:54:09','2022-08-03 11:54:09',1),(34,'LGS','Lead Generation Specialist','Lead Generation Specialist ',NULL,'2','1',NULL,1,1,'2023-03-28 07:23:21','2023-03-28 07:23:21',1),(35,'AM','Account Manager','Account Manager',NULL,'2','1',NULL,1,1,'2023-03-30 05:45:13','2023-03-30 05:45:13',1),(36,'SDT','Software Developer Trainee','Software Developer Trainee',NULL,'3','1',NULL,1,1,NULL,NULL,1),(37,'QAT','Quality Assurance Trainee','Quality Assurance Trainee',NULL,'3','1',NULL,1,1,NULL,NULL,1),(38,'TJA','Trainee junior accountant','junior accountant',0,'1','1',NULL,18,18,'2023-07-25 11:31:44','2023-07-25 11:31:44',1),(39,'TPM','Technical Project Manager',NULL,NULL,'2','1',NULL,187,187,'2024-02-23 11:17:59','2024-02-23 11:18:16',1),(40,'HRM','HR Manager',NULL,NULL,'2','1',NULL,187,187,'2024-02-23 12:38:18','2024-02-23 12:38:18',1),(41,'JTL','Java Team Lead',NULL,NULL,'2','1',NULL,187,187,'2024-03-27 04:14:28','2024-03-27 04:14:28',1),(42,'PL','Project Lead',NULL,NULL,'2','1',NULL,187,187,'2024-05-09 04:43:14','2024-05-09 04:43:14',1),(43,'SBDM','Senior Business Development Manager',NULL,NULL,'2','1',NULL,187,187,'2024-05-13 11:09:42','2024-05-13 11:09:42',1),(44,'QAL','QA Lead',NULL,NULL,'2','1',NULL,187,187,'2024-05-14 05:36:18','2024-05-14 05:36:18',1),(45,'SBDE','Senior Business Development Executive',NULL,NULL,'2','1',NULL,187,187,'2024-07-10 07:49:02','2024-07-10 07:49:02',1),(46,'EPM','Executive Project Manager','Executive Project Manager',10,'2','1',NULL,239,239,'2024-07-24 10:48:47','2024-07-24 10:48:47',1),(47,'CS','Construction Supervisor',NULL,NULL,'2','1',NULL,187,187,'2024-09-03 05:41:40','2024-09-03 05:41:40',1),(48,'BDM','Business Development Manager',NULL,NULL,'A','1',NULL,239,239,'2024-09-12 14:12:30','2024-09-12 14:12:30',1),(49,'SCA','Senior Cloud Architect',NULL,NULL,'2','1',NULL,187,187,'2024-11-14 11:04:07','2024-11-14 11:04:07',1),(50,'DM','Delivery Manager',NULL,NULL,'1','1',NULL,187,187,'2024-11-18 10:09:18','2024-11-18 10:09:18',1),(51,'SHE','Senior HR Executive',NULL,NULL,'2','1',NULL,187,187,'2024-12-12 07:51:13','2024-12-12 07:51:13',1),(52,'OA','Office Assistant',NULL,NULL,'3','1',NULL,187,187,'2024-12-20 06:09:02','2024-12-20 06:09:02',1),(53,'STPM','Senior Technical Project Manager',NULL,NULL,'2','1',NULL,322,322,'2025-01-07 09:43:34','2025-01-07 09:43:34',1),(54,'SHRM','Senior HR Manager','Senior HR Manager',15,'2','1',NULL,322,322,'2025-01-20 09:56:30','2025-01-20 09:56:30',1),(55,'ISO001','ISO Lead',NULL,NULL,'C','1',NULL,239,239,'2025-03-19 06:38:46','2025-03-19 06:38:46',1),(56,'JM','Junior Account Manager',NULL,NULL,'3','1',NULL,322,322,'2025-04-15 06:21:19','2025-04-15 06:21:19',1),(57,'UX','UX Designer',NULL,NULL,'1','1',NULL,322,322,'2025-06-09 06:12:03','2025-06-09 06:12:03',1),(58,'HR Executive','HR Executive',NULL,NULL,'3','1',NULL,322,322,'2025-06-09 07:57:16','2025-06-09 07:57:16',1),(59,'CBT4','Head Of Operations',NULL,NULL,'3000000','1',NULL,322,322,'2025-09-02 09:54:46','2025-09-02 09:54:46',1),(60,'Appian','Appian Lead','We are seeking a highly skilled Appian Low-Code Technical Lead to architect and drive the delivery of complex banking solutions',5,'AL','1',NULL,396,396,'2025-10-08 09:52:38','2025-10-08 09:52:38',1),(61,'SAE','Senior Accounts Executive',NULL,NULL,'2','1',NULL,322,322,'2025-10-17 07:05:49','2025-10-17 07:05:49',1),(62,'MK','Marketing Manager','Experience in B2B marketing for IT products and services.\r\nDemonstrated success in lead generation, marketing automation, and campaign execution.',4,'10','1',NULL,396,396,'2025-10-30 11:54:32','2025-10-30 11:54:32',1),(63,'DMM','Digital Marketing Manager','Edited Job Description',4,'10','1',NULL,396,187,'2025-10-30 12:04:28','2026-02-13 07:16:17',1),(64,'Software Test Eng','Software Test Engineer','Minimum of 3+ years of experience in QA, with focused on automation testing using Selenium. \r\nProficiency in programming languages such as Java or Python. \r\nExperience with automation frameworks such',3,'40000','1',NULL,396,396,'2025-11-13 05:37:11','2025-11-13 05:37:11',1),(65,'Sr','Senior Software Test Engineer','Minimum of 4+ years of experience in QA, with focused on automation testing using Selenium. \r\nProficiency in programming languages such as Java or Python. \r\nExperience with automation frameworks such',4,'50000','1','Hi',396,396,'2025-11-13 05:42:17','2025-11-13 05:42:17',1),(66,'SAD','Senior Appian Developer',NULL,NULL,'2','1',NULL,187,187,'2026-01-22 12:08:31','2026-01-22 12:16:41',1),(67,'AWS','AWS','AWS',NULL,'B','3',NULL,187,187,'2026-02-12 07:24:21','2026-02-12 07:24:21',1),(68,'IEtIcE','bNSib','Testing Description',2,'test','3','Testing Comments',187,187,'2026-02-12 07:32:41','2026-02-12 07:32:41',1),(69,'OKaIMw','TACkY','Testing Description',2,'test','3','Testing Comments',187,187,'2026-02-12 07:38:05','2026-02-12 07:38:05',1),(70,'TFtpik','ZEEBY','Testing Description',2,'test','3','Testing Comments',187,187,'2026-02-12 11:04:51','2026-02-12 11:04:51',1);
/*!40000 ALTER TABLE `main_jobtitles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:59:11
