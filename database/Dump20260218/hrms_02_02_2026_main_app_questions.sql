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
-- Table structure for table `main_app_questions`
--

DROP TABLE IF EXISTS `main_app_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_app_questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assesment_area_id` int NOT NULL,
  `question` varchar(1000) DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `created_by` int NOT NULL,
  `modified_by` int NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_MAIN_APP_QUESTIONS_ASSESMENT_AREA_ID_idx` (`assesment_area_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_app_questions`
--

LOCK TABLES `main_app_questions` WRITE;
/*!40000 ALTER TABLE `main_app_questions` DISABLE KEYS */;
INSERT INTO `main_app_questions` VALUES (1,1,'Performance Rating on the last two projects ','Rating of Overall Performance against the Goals Assigned in the last two projects',187,187,'2024-01-10 12:51:57','2024-01-10 12:51:57',1),(2,1,'Task completion within committed date ','Completion of tasks against committed date in each sprints or against goals ',187,187,'2024-01-10 12:52:12','2024-01-10 12:52:12',1),(3,1,'Independently Implements Solutions and Tasks ','One\'s ability to implement solution or tasks with no or minimal support from peers ',187,69,'2024-01-10 12:52:31','2024-01-12 10:45:30',1),(4,2,'Work Quality','Quality of deliverables to the standards expected at a project or department level ',187,187,'2024-01-10 12:52:54','2024-01-10 12:52:54',1),(5,2,'Re-Work Percentage','Ability to minimize to re-work percentage on the tasks or solutions ',187,187,'2024-01-10 12:53:12','2024-01-10 12:53:12',1),(6,3,'Interpersonal Skills','One\'s ability to work with different stakeholder seamless ',187,69,'2024-01-10 12:54:08','2024-01-12 10:45:12',1),(7,3,'Conflict Resolution','One\'s ability to resolve conflict without disruption with team and stakeholders ',187,69,'2024-01-10 12:54:40','2024-01-12 10:44:58',1),(8,4,'Adapting','Interest to learn and adapt to new process, technologies, frameworks, etc ',187,69,'2024-01-10 12:55:16','2024-01-12 10:46:50',1),(9,4,'Continuous Learning','One\'s ability to implement lessons learnt and avoid similar mistakes',187,69,'2024-01-10 12:55:52','2024-01-12 10:44:46',1),(10,5,'Customer First ','Ability to put customer request as highest priority ',187,187,'2024-01-10 12:56:25','2024-01-10 12:56:25',1),(11,5,'Emotional Quotient','Use one\'s Emotional Quotient while handling customers',187,187,'2024-01-10 12:56:43','2024-01-10 12:56:43',1),(12,6,'Process Improvement','One\'s ability to suggest process improvements ',187,187,'2024-01-10 12:57:51','2024-01-10 12:57:51',1),(13,6,'Process Adherence','Process compliance and adhering to the defined process and organization policies ',187,187,'2024-01-10 12:58:16','2024-01-10 12:58:16',1),(14,7,'Innovation First ','Ability to innovate and suggest innovation areas and enthusiastically participate in research and development ',187,187,'2024-01-10 12:58:43','2024-01-10 12:58:43',1),(15,8,'Org Initiatives','One\'s participation in all organization initiatives and embrace change',187,69,'2024-01-10 12:59:05','2024-01-12 10:44:33',1),(16,9,'Predictability ','Ability to keep ones word and Own ',187,187,'2024-01-10 12:59:29','2024-01-10 12:59:29',1),(17,9,'Receptiveness','Ability to hear thinking from other shoes and being empathetic',187,187,'2024-01-10 12:59:45','2024-01-10 12:59:45',1),(18,9,'Integrity ','Ability to do the right things ',187,187,'2024-01-10 13:00:00','2024-01-10 13:00:00',1),(19,9,'Context Focused ','Ability to think objective and start with Why ',187,69,'2024-01-10 13:00:16','2024-01-12 11:13:23',1),(20,9,'Empowerment','Ability to solve problem without being asked',187,187,'2024-01-10 13:00:29','2024-01-18 06:50:02',1);
/*!40000 ALTER TABLE `main_app_questions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:58:53
