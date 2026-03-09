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
-- Table structure for table `main_adhoc_app_question_map`
--

DROP TABLE IF EXISTS `main_adhoc_app_question_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_adhoc_app_question_map` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_init_id` int DEFAULT NULL,
  `app_approver_req_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  `role_id` int DEFAULT NULL,
  `req_approver_id` int NOT NULL,
  `assessment_area_id` int NOT NULL,
  `questions` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `remarks` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `comments` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `year` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `rating_id` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_adhoc_app_question_map`
--

LOCK TABLES `main_adhoc_app_question_map` WRITE;
/*!40000 ALTER TABLE `main_adhoc_app_question_map` DISABLE KEYS */;
INSERT INTO `main_adhoc_app_question_map` VALUES (1,1,1,115,1,115,1,'Performance Rating on the last two projects ','Rating of Overall Performance against the Goals Assigned in the last two projects',NULL,'2024',4,322,115,'2025-10-17 10:46:36','2025-10-17 10:55:48',1),(2,1,1,115,1,115,1,'Task completion within committed date ','Completion of tasks against committed date in each sprints or against goals ','My task completed in committed date','2024',5,322,115,'2025-10-17 10:46:36','2025-10-17 10:55:48',1),(3,1,1,115,1,115,1,'Independently Implements Solutions and Tasks ','One\'s ability to implement solution or tasks with no or minimal support from peers ',NULL,'2024',4,322,115,'2025-10-17 10:46:36','2025-10-17 10:55:48',1),(4,1,1,115,1,115,2,'Work Quality','Quality of deliverables to the standards expected at a project or department level ',NULL,'2024',4,322,115,'2025-10-17 10:46:36','2025-10-17 10:55:48',1),(5,1,1,115,1,115,2,'Re-Work Percentage','Ability to minimize to re-work percentage on the tasks or solutions ',NULL,'2024',4,322,115,'2025-10-17 10:46:36','2025-10-17 10:55:48',1),(6,1,1,115,1,115,3,'Interpersonal Skills','One\'s ability to work with different stakeholder seamless ',NULL,'2024',4,322,115,'2025-10-17 10:46:36','2025-10-17 10:55:48',1),(7,1,1,115,1,115,3,'Conflict Resolution','One\'s ability to resolve conflict without disruption with team and stakeholders ',NULL,'2024',4,322,115,'2025-10-17 10:46:36','2025-10-17 10:55:48',1),(8,1,1,115,1,115,4,'Adapting','Interest to learn and adapt to new process, technologies, frameworks, etc ',NULL,'2024',4,322,115,'2025-10-17 10:46:36','2025-10-17 10:55:48',1),(9,1,1,115,1,115,4,'Continuous Learning','One\'s ability to implement lessons learnt and avoid similar mistakes',NULL,'2024',4,322,115,'2025-10-17 10:46:36','2025-10-17 10:55:48',1),(10,1,1,115,1,115,5,'Customer First ','Ability to put customer request as highest priority ',NULL,'2024',4,322,115,'2025-10-17 10:46:36','2025-10-17 10:55:48',1),(11,1,1,115,1,115,5,'Emotional Quotient','Use one\'s Emotional Quotient while handling customers',NULL,'2024',4,322,115,'2025-10-17 10:46:36','2025-10-17 10:55:48',1),(12,1,1,115,1,115,6,'Process Improvement','One\'s ability to suggest process improvements ',NULL,'2024',4,322,115,'2025-10-17 10:46:36','2025-10-17 10:55:48',1),(13,1,1,115,1,115,6,'Process Adherence','Process compliance and adhering to the defined process and organization policies ',NULL,'2024',4,322,115,'2025-10-17 10:46:36','2025-10-17 10:55:48',1),(14,1,1,115,1,115,7,'Innovation First ','Ability to innovate and suggest innovation areas and enthusiastically participate in research and development ',NULL,'2024',4,322,115,'2025-10-17 10:46:36','2025-10-17 10:55:48',1),(15,1,1,115,1,115,8,'Org Initiatives','One\'s participation in all organization initiatives and embrace change',NULL,'2024',3,322,115,'2025-10-17 10:46:36','2025-10-17 10:55:48',1),(16,1,1,115,1,115,9,'Predictability ','Ability to keep ones word and Own ',NULL,'2024',4,322,115,'2025-10-17 10:46:36','2025-10-17 10:55:48',1),(17,1,1,115,1,115,9,'Receptiveness','Ability to hear thinking from other shoes and being empathetic',NULL,'2024',4,322,115,'2025-10-17 10:46:36','2025-10-17 10:55:48',1),(18,1,1,115,1,115,9,'Integrity ','Ability to do the right things ',NULL,'2024',4,322,115,'2025-10-17 10:46:36','2025-10-17 10:55:48',1),(19,1,1,115,1,115,9,'Context Focused ','Ability to think objective and start with Why ',NULL,'2024',4,322,115,'2025-10-17 10:46:36','2025-10-17 10:55:48',1),(20,1,1,115,1,115,9,'Empowerment','Ability to solve problem without being asked',NULL,'2024',4,322,115,'2025-10-17 10:46:36','2025-10-17 10:55:48',1),(21,1,2,115,2,24,1,'Performance Rating on the last two projects ','Rating of Overall Performance against the Goals Assigned in the last two projects',NULL,'2024',4,322,24,'2025-10-17 10:46:44','2025-10-17 11:15:28',1),(22,1,2,115,2,24,1,'Task completion within committed date ','Completion of tasks against committed date in each sprints or against goals ',NULL,'2024',4,322,24,'2025-10-17 10:46:44','2025-10-17 11:15:28',1),(23,1,2,115,2,24,1,'Independently Implements Solutions and Tasks ','One\'s ability to implement solution or tasks with no or minimal support from peers ',NULL,'2024',3,322,24,'2025-10-17 10:46:44','2025-10-17 11:15:28',1),(24,1,2,115,2,24,2,'Work Quality','Quality of deliverables to the standards expected at a project or department level ',NULL,'2024',4,322,24,'2025-10-17 10:46:44','2025-10-17 11:15:28',1),(25,1,2,115,2,24,2,'Re-Work Percentage','Ability to minimize to re-work percentage on the tasks or solutions ',NULL,'2024',3,322,24,'2025-10-17 10:46:44','2025-10-17 11:15:28',1),(26,1,2,115,2,24,3,'Interpersonal Skills','One\'s ability to work with different stakeholder seamless ',NULL,'2024',3,322,24,'2025-10-17 10:46:44','2025-10-17 11:15:28',1),(27,1,2,115,2,24,3,'Conflict Resolution','One\'s ability to resolve conflict without disruption with team and stakeholders ',NULL,'2024',4,322,24,'2025-10-17 10:46:44','2025-10-17 11:15:28',1),(28,1,2,115,2,24,4,'Adapting','Interest to learn and adapt to new process, technologies, frameworks, etc ',NULL,'2024',4,322,24,'2025-10-17 10:46:44','2025-10-17 11:15:28',1),(29,1,2,115,2,24,4,'Continuous Learning','One\'s ability to implement lessons learnt and avoid similar mistakes',NULL,'2024',4,322,24,'2025-10-17 10:46:44','2025-10-17 11:15:28',1),(30,1,2,115,2,24,5,'Customer First ','Ability to put customer request as highest priority ','Always putting customers interest as priority even it meant working late nights or sometimes weekends','2024',5,322,24,'2025-10-17 10:46:44','2025-10-17 11:15:28',1),(31,1,2,115,2,24,5,'Emotional Quotient','Use one\'s Emotional Quotient while handling customers','Always polite and respective towards client even when client is aggressive towards him. also escalate the issues to me in a precise and polite manner','2024',5,322,24,'2025-10-17 10:46:44','2025-10-17 11:15:28',1),(32,1,2,115,2,24,6,'Process Improvement','One\'s ability to suggest process improvements ',NULL,'2024',4,322,24,'2025-10-17 10:46:44','2025-10-17 11:15:28',1),(33,1,2,115,2,24,6,'Process Adherence','Process compliance and adhering to the defined process and organization policies ',NULL,'2024',4,322,24,'2025-10-17 10:46:44','2025-10-17 11:15:28',1),(34,1,2,115,2,24,7,'Innovation First ','Ability to innovate and suggest innovation areas and enthusiastically participate in research and development ',NULL,'2024',4,322,24,'2025-10-17 10:46:44','2025-10-17 11:15:28',1),(35,1,2,115,2,24,8,'Org Initiatives','One\'s participation in all organization initiatives and embrace change',NULL,'2024',3,322,24,'2025-10-17 10:46:44','2025-10-17 11:15:28',1),(36,1,2,115,2,24,9,'Predictability ','Ability to keep ones word and Own ','Once he has given a feature delivery timeline. he make sure he delivers on time or ask for extention with clear reason and early as possible','2024',5,322,24,'2025-10-17 10:46:44','2025-10-17 11:15:28',1),(37,1,2,115,2,24,9,'Receptiveness','Ability to hear thinking from other shoes and being empathetic',NULL,'2024',4,322,24,'2025-10-17 10:46:44','2025-10-17 11:15:28',1),(38,1,2,115,2,24,9,'Integrity ','Ability to do the right things ',NULL,'2024',4,322,24,'2025-10-17 10:46:44','2025-10-17 11:15:28',1),(39,1,2,115,2,24,9,'Context Focused ','Ability to think objective and start with Why ',NULL,'2024',4,322,24,'2025-10-17 10:46:44','2025-10-17 11:15:28',1),(40,1,2,115,2,24,9,'Empowerment','Ability to solve problem without being asked',NULL,'2024',4,322,24,'2025-10-17 10:46:44','2025-10-17 11:15:28',1);
/*!40000 ALTER TABLE `main_adhoc_app_question_map` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 15:00:22
