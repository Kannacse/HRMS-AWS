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
-- Table structure for table `prev_emp_education_details`
--

DROP TABLE IF EXISTS `prev_emp_education_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prev_emp_education_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `request_id` int DEFAULT NULL,
  `course_id` int unsigned NOT NULL,
  `course` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `institution` varchar(255) DEFAULT NULL,
  `percentage` varchar(255) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `is_active` tinyint DEFAULT NULL,
  `createddate` datetime DEFAULT CURRENT_TIMESTAMP,
  `modifieddate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_PREV_EMP_EDUCATION_DETAILS_USER_ID_MAIN_USERS_idx` (`user_id`),
  KEY `FK_PREV_EMP_EDUCATION_DETAILS_REQUEST_ID_idx` (`request_id`),
  KEY `PREV_EMP_EDUCATION_DETAILS_COURSE_ID_idx` (`course_id`),
  CONSTRAINT `FK_PREV_EMP_EDUCATION_DETAILS_REQUEST_ID` FOREIGN KEY (`request_id`) REFERENCES `prev_emp_details_request` (`id`),
  CONSTRAINT `FK_PREV_EMP_EDUCATION_DETAILS_USER_ID_MAIN_USERS` FOREIGN KEY (`user_id`) REFERENCES `main_users` (`id`),
  CONSTRAINT `PREV_EMP_EDUCATION_DETAILS_COURSE_ID` FOREIGN KEY (`course_id`) REFERENCES `main_educationlevelcode` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prev_emp_education_details`
--

LOCK TABLES `prev_emp_education_details` WRITE;
/*!40000 ALTER TABLE `prev_emp_education_details` DISABLE KEYS */;
INSERT INTO `prev_emp_education_details` VALUES (1,57,2,5,'Sslc','Government higher secondary school','73','2005-02-10','2007-04-18',1,'2024-02-05 12:54:05','2024-02-05 12:54:05'),(2,57,2,2,'BCA','Sri Akilandeshwari, women\'s college, Wandiwash,','34','2015-02-11','2017-02-15',0,'2024-02-05 12:54:05','2024-02-05 12:54:05'),(3,57,2,4,'asfg','ascsdf','23','2018-02-15','2019-02-05',0,'2024-02-05 13:02:36','2024-02-05 13:02:36'),(4,57,2,2,'mca','svfdvfdvsd sdfg ','67','2021-09-15','2023-02-15',0,'2024-02-05 13:05:26','2024-02-05 13:05:26'),(5,57,2,2,'fesrserg','government higher secondary school ','45','2015-02-18','2017-02-15',0,'2024-02-05 13:13:29','2024-02-05 13:13:29'),(6,57,2,3,'HSC','Government higher secondary school','8','2021-02-17','2022-02-23',1,'2024-02-05 13:13:29','2024-02-05 13:13:29'),(7,57,2,2,'BCA','Sri Akilandeshwari women\'s college vandavasi','34','2015-02-18','2018-02-15',1,'2024-02-05 13:16:17','2024-02-05 13:16:17'),(8,57,2,1,'MCA','Sri Akhilandeshwar, Women\'s college wandiwash','53','2018-02-14','2019-02-20',1,'2024-02-05 15:45:38','2024-02-05 15:45:38'),(9,77,265,1,'NxM73a6Pq1WBHw2LbezFkxHOBhr7TD34kRE6b+xtO/c=','NxM73a6Pq1WBHw2LbezFkzylNoQ7bGV6XJTFtTh7RLdGhCDcSsD5bfNwcmR9c+6w','NxM73a6Pq1WBHw2LbezFk6a71QMKyh+0NePjLhuCZHE=','2017-07-03','2020-04-15',1,'2025-04-16 05:19:16','2025-04-16 05:19:16'),(10,242,355,3,'6fi2UK5vItadaQVnpRRWvsoTFgpIhMlkdJLjP7pAseQ=','6fi2UK5vItadaQVnpRRWvmKL6AFTRF03hFyyASFTMbIkE4JU1c6Jqsos03WbYgrH','6fi2UK5vItadaQVnpRRWvkSkFukUoJzbpEAXHHG2Bdo=','2019-06-04','2020-03-24',1,'2026-02-12 05:35:34','2026-02-12 05:35:34'),(11,242,355,2,'zt7JyLnJtaHNwSVsl1IAuGkX1QZOjkXHqMD5LvpR9j+H39CvDK62E7YqTZqrvxZ7','zt7JyLnJtaHNwSVsl1IAuMT0xu/brj8FUFT0nTf8oXrABfa19+WysYEnwN4tO6mz','zt7JyLnJtaHNwSVsl1IAuDy8iD4CbJLBfQ3E7mEQxLo=','2021-05-18','2023-04-19',1,'2026-02-12 05:35:35','2026-02-12 05:35:35');
/*!40000 ALTER TABLE `prev_emp_education_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:58:44
