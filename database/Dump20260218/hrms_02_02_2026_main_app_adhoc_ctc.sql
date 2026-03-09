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
-- Table structure for table `main_app_adhoc_ctc`
--

DROP TABLE IF EXISTS `main_app_adhoc_ctc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_app_adhoc_ctc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_init_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `ctc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `job_title_id` int DEFAULT NULL,
  `year` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `goals` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` enum('pending','approved') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `rating_id` int DEFAULT NULL,
  `performance_rating` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `letter_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `appraisal_letter` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `created_by` int DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_app_adhoc_ctc`
--

LOCK TABLES `main_app_adhoc_ctc` WRITE;
/*!40000 ALTER TABLE `main_app_adhoc_ctc` DISABLE KEYS */;
INSERT INTO `main_app_adhoc_ctc` VALUES (1,0,115,'ppqYnquX',16,'2024',NULL,'approved',NULL,NULL,NULL,NULL,24,24,'2025-10-17 11:17:30','2025-10-17 11:17:30',1),(2,1,115,'q5OYmaSX',15,'2025','Should work on leading a QA team','approved',5,'4','840','\n<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n    <meta charset=\"UTF-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n    <title>Appraisal Letter</title>\n    <style>\n        body {\n            font-family: Arial, sans-serif;\n            line-height: 1.6;\n            margin: 20px;\n        }\n\n        header {\n            text-align: center;\n            margin-bottom: 20px;\n        }\n\n        /* h1 {\n            color: #3394D4;\n        } */\n\n        p {\n            margin-bottom: 15px;\n            text-shadow:0px 0px 0 rgba(0, 0, 0, 0.5);\n        }\n\n        .value_app{\n          font-weight: bold;\n        }\n        .date_left{\n          text-align: right;\n        }\n        table, td,th {\n          border: 1px solid black;\n          border-collapse: collapse;\n          padding:2px;\n          text-shadow:0px 0px 0 rgba(0, 0, 0, 0.5);\n        }\n        .team{\n        margin-top:34px;\n        \n        \n        }\n    </style>\n</head>\n<body>\n\n\n  <img src=\"https://hrms.codeboardtech.com//public/uploads/organisation/organisation_image_1675951337.png\">\n\n\n    <header>\n        <h3>Appraisal Letter – CONFIDENTIAL</h3>\n    </header>\n\n    \n\n    <p class=\"date_left\">Date: 17-10-2025</p>\n\n    <p class=\"value_app\">APPS/840/Chennai/Sep/V1</p>\n\n    <p>Dear Santhoshraj N,</p>\n\n    <p>Codeboard Technology would like to take this opportunity to congratulate, recognize and thank you for your contributions toward the growth of the organization.</p>\n\n    <p>We have revised your CTC from <span class=\"value_app\">370570/- per annum to INR 800000/- per annum</span> effective from <span class=\"value_app\">September 5th, 2025</span>. For your reference, you can find your salary break up in the below Annexure A.</p>\n\n    <p>We wish you tremendous success in the coming years and look forward to your long-term association with Codeboard Technology.</p>\n\n    <p>Best Regards,</p>\n    <p class=\"team\">Team RMO</p>\n\n    <h4>Annexure A</h4>\n\n    <p>Your revised CTC is as mentioned below.</p>\n\n    <table>\n        <tr>\n            <th>Component</th>\n            <th>Amount</th>\n        </tr>\n      <tr>\n        <td>BASIC+DA</td><td>33333.33</td>\n      </tr>\n      <tr>\n        <td>HRA</td><td>16666.67</td>\n      </tr>\n      <tr>\n        <td>Medical</td><td>1666</td>\n      </tr>\n      <tr>\n        <td>Conveyance</td><td>1600</td>\n      </tr>\n      <tr>\n        <td>LTA</td><td>1666.67</td>\n      </tr>\n      <tr>\n        <td>Performance Bonus</td><td>3333.33</td>\n      </tr>\n      <tr>\n        <td>Other Allowance</td><td>8400.67</td>\n      </tr>\n      <tr>\n        <td>Actual Earned</td><td>66666.67</td>\n      </tr>\n      <tr>\n        <td>EPFO</td><td>3600</td>\n      </tr>\n      <tr>\n        <td>Insurance</td><td>1003</td>\n      </tr>\n      <tr>\n        <td>Professional Tax</td><td>208.33</td>\n      </tr>\n      <tr>\n        <td>Total Deduction</td><td>4811.33</td>\n      </tr>\n      <tr>\n        <td>Net Salary</td><td>61855.34</td>\n      </tr>\n    </table>\n    <br>\n    <footer class=\"footer_app\">\n              <img src=\"https://hrms.codeboardtech.com/public//uploads/organisation/footer.png\" alt=\"\">\n          </footer>\n\n</body>\n</html>',24,322,'2025-10-17 11:17:30','2025-10-17 11:26:22',1);
/*!40000 ALTER TABLE `main_app_adhoc_ctc` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:59:06
