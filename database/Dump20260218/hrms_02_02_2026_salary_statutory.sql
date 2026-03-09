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
-- Table structure for table `salary_statutory`
--

DROP TABLE IF EXISTS `salary_statutory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary_statutory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `salary_type_id` int DEFAULT NULL,
  `statutory_name` varchar(255) DEFAULT NULL,
  `parent` varchar(255) DEFAULT NULL,
  `shortcode` varchar(255) DEFAULT NULL,
  `value_type` varchar(255) DEFAULT NULL,
  `min` varchar(255) DEFAULT NULL,
  `max` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `deduction_from` varchar(255) DEFAULT NULL,
  `isactive` tinyint DEFAULT NULL,
  `createdby` int DEFAULT NULL,
  `modifiedby` int DEFAULT NULL,
  `createddate` datetime DEFAULT CURRENT_TIMESTAMP,
  `modifieddate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_SALARY_STATUTORY_SALARY_COMPONENTS_idx` (`salary_type_id`),
  CONSTRAINT `FK_SALARY_STATUTORY_SALARY_COMPONENTS` FOREIGN KEY (`salary_type_id`) REFERENCES `salary_components` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_statutory`
--

LOCK TABLES `salary_statutory` WRITE;
/*!40000 ALTER TABLE `salary_statutory` DISABLE KEYS */;
INSERT INTO `salary_statutory` VALUES (1,3,'PF','0','pf',NULL,NULL,NULL,NULL,NULL,1,1,1,'2024-03-28 18:33:49','2024-03-28 18:33:49'),(2,3,'PF','1','pf','percent','0','15000','24','basic',1,1,1,'2024-03-28 18:33:49','2024-03-28 18:33:49'),(3,3,'PF','1','pf','flat','15001','99999999999','3600','basic',1,1,1,'2024-03-28 18:33:49','2024-03-28 18:33:49'),(4,3,'ESI','0','esi',NULL,NULL,NULL,NULL,NULL,1,1,1,'2024-03-28 18:33:49','2024-03-28 18:33:49'),(5,3,'ESI','4','esi','percent','0','21000','4','gross',1,1,1,'2024-03-28 18:33:49','2024-03-28 18:33:49'),(6,3,'Professional Tax','0','professional_tax',NULL,NULL,NULL,NULL,NULL,1,1,1,'2024-03-28 18:33:49','2024-03-28 18:33:49'),(7,3,'Professional Tax','6','professional_tax','flat','1','21000','0','gross',1,1,1,'2024-03-28 18:33:49','2024-03-28 18:33:49'),(8,3,'Professional Tax','6','professional_tax','flat','21001','30000','135','gross',1,1,1,'2024-03-28 18:33:49','2024-03-28 18:33:49'),(9,3,'Professional Tax','6','professional_tax','flat','30001','45000','315','gross',1,1,1,'2024-03-28 18:33:49','2024-03-28 18:33:49'),(10,3,'Professional Tax','6','professional_tax','flat','45001','60000','690','gross',1,1,1,'2024-03-28 18:33:49','2024-03-28 18:33:49'),(11,3,'Professional Tax','6','professional_tax','flat','60001','75000','1025','gross',1,1,1,'2024-03-28 18:33:49','2024-03-28 18:33:49'),(12,3,'Professional Tax','6','professional_tax','flat','75001','999999999','1250','gross',1,1,1,'2024-03-28 18:33:49','2024-03-28 18:33:49');
/*!40000 ALTER TABLE `salary_statutory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:58:57
