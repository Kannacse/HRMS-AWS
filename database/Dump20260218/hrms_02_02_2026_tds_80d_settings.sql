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
-- Table structure for table `tds_80d_settings`
--

DROP TABLE IF EXISTS `tds_80d_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tds_80d_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(30) NOT NULL,
  `title` varchar(60) NOT NULL,
  `max_limit` int NOT NULL,
  `effective_from` date NOT NULL,
  `effective_to` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tds_80d_settings`
--

LOCK TABLES `tds_80d_settings` WRITE;
/*!40000 ALTER TABLE `tds_80d_settings` DISABLE KEYS */;
INSERT INTO `tds_80d_settings` VALUES (1,'medical_insurance_option','Self & family',25000,'2019-04-01','2020-03-31'),(3,'medical_insurance_option','Self & family including parents',50000,'2019-04-01','2020-03-31'),(4,'medical_insurance_option','Self & family including Senior citizen parents',55000,'2019-04-01','2020-03-31'),(5,'medical_expense_option','Self & family',30000,'2019-04-01','2020-03-31'),(6,'medical_expense_option','Self & family including parents',60000,'2019-04-01','2020-03-31'),(7,'medical_expense_option','Parents',30000,'2019-04-01','2020-03-31'),(8,'health_checkup_option','Self & family',5000,'2019-04-01','2020-03-31'),(9,'health_checkup_option','Parents',5000,'2019-04-01','2020-03-31'),(10,'health_checkup_option','Self & family & parents',5000,'2019-04-01','2020-03-31');
/*!40000 ALTER TABLE `tds_80d_settings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:59:32
