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
-- Table structure for table `main_budget_sub_categories`
--

DROP TABLE IF EXISTS `main_budget_sub_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_budget_sub_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `sub_category_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `total_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `used_value` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `is_active` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_budget_sub_categories`
--

LOCK TABLES `main_budget_sub_categories` WRITE;
/*!40000 ALTER TABLE `main_budget_sub_categories` DISABLE KEYS */;
INSERT INTO `main_budget_sub_categories` VALUES (1,1,'Cashew','17580',17580,187,187,'2025-10-13 09:56:22','2025-10-17 12:55:11',1),(2,1,'Badam','14920',14920,187,187,'2025-10-13 09:56:22','2025-10-17 12:55:11',1),(3,1,'Dates','7800',7800,187,187,'2025-10-13 09:56:22','2025-10-17 12:55:11',1),(4,1,'uhdueejdk6158399372@-','190999',NULL,187,187,'2025-10-13 10:30:59','2025-10-13 10:31:09',0),(5,1,'Raisins','9442',9442,187,187,'2025-10-13 11:17:09','2025-10-17 12:55:11',1),(6,1,'Box','19000',19000,187,187,'2025-10-13 18:30:37','2025-10-17 12:55:11',1),(7,1,'Crackers','3000',3000,187,187,'2025-10-13 18:30:37','2025-10-17 12:55:11',1),(8,1,'Sticker','1500',NULL,187,187,'2025-10-13 18:30:37','2025-10-14 16:42:28',0),(9,1,'Packing cover for nuts','450',450,187,187,'2025-10-13 18:30:37','2025-10-17 12:55:11',1),(10,1,'Double side & normal cello tape','250',250,187,187,'2025-10-13 18:30:37','2025-10-17 12:55:11',1),(11,1,'Box Sticker','700',700,187,187,'2025-10-13 18:30:37','2025-10-17 12:55:11',1),(12,1,'Sweets for client','2100',NULL,187,187,'2025-10-13 18:30:37','2025-10-15 13:24:56',0),(13,1,'Straws and bangles','200',60,187,187,'2025-10-14 16:54:08','2025-10-17 12:55:11',1);
/*!40000 ALTER TABLE `main_budget_sub_categories` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:58:32
