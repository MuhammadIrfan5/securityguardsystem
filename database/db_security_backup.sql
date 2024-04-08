-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: database-1.c14ww2m0kkdl.us-west-1.rds.amazonaws.com    Database: db_security
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `country_id` bigint unsigned NOT NULL,
  `state_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cities_country_id_foreign` (`country_id`),
  KEY `cities_state_id_foreign` (`state_id`),
  CONSTRAINT `cities_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `cities_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,1,1,'KHI',NULL,'2023-10-31 09:41:42',NULL);
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_locations`
--

DROP TABLE IF EXISTS `client_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `location_id` bigint unsigned NOT NULL,
  `client_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_designation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_locations_location_id_foreign` (`location_id`),
  CONSTRAINT `client_locations_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_locations`
--

LOCK TABLES `client_locations` WRITE;
/*!40000 ALTER TABLE `client_locations` DISABLE KEYS */;
INSERT INTO `client_locations` VALUES (1,1,NULL,NULL,NULL,NULL,NULL,NULL),(2,2,'ahmed','Site Manager','Ali012094@gmail.com','2136-54436-553',NULL,NULL),(3,3,'farah','Superintendent','Ali012094@gmail.com','2136-54436-553',NULL,NULL),(4,4,'Ali Raza','MANAGER','RAZA@GMAIL.COM','112-252-3323',NULL,NULL),(5,5,'Ahmed','Site Manager','Ahmed@gmail.com','2136-54436-553',NULL,NULL),(6,6,NULL,NULL,NULL,NULL,NULL,NULL),(7,7,'ABDUL RAZAQ','Manager','Raxzaq@gmail.com','112-111-11111',NULL,NULL),(8,8,'Awad','Site Supervisor','Awad@gmail.com','222-111-2121',NULL,NULL),(9,9,'ASAD','Site Manager','Ali012094@gmail.com','123-333-3231',NULL,NULL),(10,10,'Ahmed','Site Supervisor','Ahmed@gmail.com','123-421-2321',NULL,NULL),(11,11,'Abdelrehman','Site Manager','Abdelrehman@gmail.com','111-222-3333',NULL,NULL),(12,12,'JOhnny','Site Manager','Johnny@gmail.com','111-222-1111',NULL,NULL),(13,13,'David Hoyis','Supervisor','Hoyos@gmail.com','123-213-4567',NULL,NULL),(14,14,'Jeff','supritendent','jeff@gmail.com','123-213-5454',NULL,NULL),(15,15,'Bezos','Manager','dad@gmail.com','999-524-5858',NULL,NULL),(16,16,'Bruce','CEO','bruce@gmail','515-525-2561',NULL,NULL),(17,17,'instine','Manager','instine@gmail.com','200-252-2526',NULL,NULL);
/*!40000 ALTER TABLE `client_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `confirmation_calls`
--

DROP TABLE IF EXISTS `confirmation_calls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `confirmation_calls` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `schedule_id` bigint unsigned NOT NULL,
  `location_id` bigint unsigned NOT NULL,
  `employee_id` bigint unsigned NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `confirmation_calls_schedule_id_foreign` (`schedule_id`),
  KEY `confirmation_calls_location_id_foreign` (`location_id`),
  KEY `confirmation_calls_employee_id_foreign` (`employee_id`),
  CONSTRAINT `confirmation_calls_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `confirmation_calls_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`),
  CONSTRAINT `confirmation_calls_schedule_id_foreign` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `confirmation_calls`
--

LOCK TABLES `confirmation_calls` WRITE;
/*!40000 ALTER TABLE `confirmation_calls` DISABLE KEYS */;
/*!40000 ALTER TABLE `confirmation_calls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `iso2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dialling_pattern` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'PAK','PAK','PAKISTAN','+92','.','.','.','1',NULL,'2023-10-31 09:40:36',NULL),(2,'SA','SA','South Africa','+92','','','','1',NULL,'2024-01-11 02:41:41','2024-01-11 02:41:41'),(3,'SA','SA','South Africa','+92','','','','1',NULL,'2024-01-11 02:42:38','2024-01-11 02:42:38'),(4,'SA','SA','South Africa','+92','','','','1',NULL,'2024-01-11 02:43:03','2024-01-11 02:43:03'),(5,'XQRFWUGW','XQRFWUGW','around','+92','','','','1',NULL,'2024-01-11 02:43:18','2024-01-11 02:43:18'),(6,'XQRFWUGW','XQRFWUGW','around','+92','','','','1',NULL,'2024-01-11 02:43:44','2024-01-11 02:43:44'),(7,'XQRFWUGW','XQRFWUGW','around','+92','','','','1',NULL,'2024-01-11 02:43:54','2024-01-11 02:43:54');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_categories`
--

DROP TABLE IF EXISTS `employee_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_categories`
--

LOCK TABLES `employee_categories` WRITE;
/*!40000 ALTER TABLE `employee_categories` DISABLE KEYS */;
INSERT INTO `employee_categories` VALUES (1,'Regular',1,NULL,NULL),(2,'Shack',1,NULL,NULL);
/*!40000 ALTER TABLE `employee_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_one` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_two` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guard_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `issue_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiry_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pay_rate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `manager_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `employees_user_id_foreign` (`user_id`),
  KEY `employees_category_id_foreign` (`category_id`),
  CONSTRAINT `employees_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `employee_categories` (`id`),
  CONSTRAINT `employees_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (2,1,1,'Ahmed Malik','101','619-733-3355','','1','2023-03-03','2024-03-04','3','Omer Muridi','',1,'2024-03-30 05:37:05','2024-03-30 05:37:05','Twin Oaks & City Drive'),(3,1,1,'Warsame, Abdi Shakur','78','(619) 773-3105','','2','2002-03-20','2024-03-30','1','Omer Muridi','',1,'2024-03-30 05:59:43','2024-03-30 05:59:43','Pinnick # 1594 Chula Vista'),(4,1,1,'Isse, Jama M','191','619-540-1388','','1','2003-03-20','2024-03-20','1','Omer Muridi','',1,'2024-03-30 06:09:18','2024-03-30 06:09:18','1785 Millenia Ave Chula Vista, CA  91915'),(5,1,1,'Muhamed Abdirasad Nuur','485','619-302-1814','','1','2000-02-23','2024-02-02','1','Omer Muridi','',1,'2024-03-30 06:10:59','2024-03-30 06:10:59','10329 Channel Rd, Lakeside, CA 92040'),(6,1,1,'Said, Abdirizak O','511','619-751-0097','','1','2003-02-02','2025-02-12','1','Sir Rehan','',1,'2024-03-30 06:12:40','2024-03-30 06:12:40','6006 Mira Mar Rd San Diego CA'),(7,1,1,'Omar, Aden Dahir','1026','619-389-4125','','1','2002-02-03','2025-05-15','1','Omer Muridi','',1,'2024-03-30 06:18:09','2024-03-30 06:18:09','5618 Copely Dr San Diego CA : 92111'),(8,1,1,'Ali, Omar M','1329','619-319-7713','','3','2020-02-03','2025-03-02','1','Omer Muridi','',1,'2024-03-30 06:26:28','2024-03-30 06:26:28','KZ Companies, LLC.  3180 University Avenue, San Diego, CA 92104'),(9,1,1,'Mawlid Mahomud','1381','858-667-3066','','4','2004-01-05','2026-02-04','1','Omer Muridi','',1,'2024-03-30 06:28:17','2024-03-30 06:28:17','Pinnick # 1594 Chula Vista'),(10,1,1,'Awaleh, Mohamed A','1477','619-549-1294','','4','2021-02-03','2028-02-12','1','Omer Muridi','',1,'2024-03-30 06:32:15','2024-03-30 06:32:15','Shea Patria  Chula Vista  2049 Paseo Levanten Chula Vista CA 91913'),(11,1,1,'Abdulahi, Faisa Ahmed','1481','818-518-4007','','4','2003-02-03','2028-12-05','1','Omer Muridi','',1,'2024-03-30 06:35:46','2024-03-30 06:35:46','Shea Homes Chula Vista  (Savona) Paseo Levanten'),(12,1,1,'Abubakar, Mustafa Mohamud','1524','619-316-1361','','3','2006-02-06','2025-04-06','1','Omer Muridi','',1,'2024-03-30 06:37:20','2024-03-30 06:37:20','1595 Radar Rd, San Diego, CA 92154'),(13,1,1,'Aden, Awaleh Mohamed','1551','858-833-7455','','2','2001-02-02','2028-02-23','1','Omer Muridi','',1,'2024-03-30 06:40:27','2024-03-30 06:40:27','Lennar lilac Whidney Line San Diego California'),(14,1,1,'Yusuf, Saddik Jama','1603','619-717-7143','','5','2002-02-02','2025-03-30','1','Omer Muridi','',1,'2024-03-30 06:42:36','2024-03-30 06:42:36','5897 Oberlin Drive San Diego 92121'),(15,1,1,'Omar, Abdulahi Dahir','1615','619-885-9048','','5','2005-02-05','2024-03-31','1','Omer Muridi','',1,'2024-03-30 06:44:24','2024-03-30 06:44:24','2345 Fenton Pkwy, San Diego, CA 92108'),(16,1,1,'Mkoma, Abdirehman Ramadan','1617','619-384-3216','','5','2001-02-20','2026-03-31','1','Omer Muridi','',1,'2024-03-30 06:48:53','2024-03-30 06:48:53','1150 Quail Garden Dr. Encinitas CA'),(17,1,1,'Ahmed, Abdikarim Mohamed','1629','615-775-1344','','5','2001-02-23','2028-11-12','1','Omer Muridi','',1,'2024-03-30 06:50:16','2024-03-30 06:50:16','563 Greenbrier Dr. Oceanside, CA 92054'),(18,1,1,'Omar, Abdirahman Dahir D','1644','619-653-9031','','4','2003-02-25','2025-11-11','1','Omer Muridi','',1,'2024-03-30 07:14:40','2024-03-30 07:14:40','5618 Copely Dr San Diego CA : 92111'),(19,1,1,'Ali, Yusuf Omar','1649','619-432-9367','','1','2001-02-28','2030-02-23','1','Omer Muridi','',1,'2024-03-30 07:23:10','2024-03-30 07:23:10','Pinnick, Inc #1570 Twin Oaks & City Drive'),(20,1,1,'Ali, Hussein Nassib','1651','619-565-9920','','1','2005-02-25','2025-03-30','1','Omer Muridi','',1,'2024-03-30 07:25:59','2024-03-30 07:25:59','10329 Channel Rd, Lakeside, CA 92040'),(21,1,1,'Ali, Kadija','1740','619-432-8993','','1','2022-02-03','2041-02-05','1','Omer Muridi','',1,'2024-03-30 07:27:12','2024-03-30 07:27:12','870 Showroom Place Chula Vista, CA : 91914'),(22,1,1,'Ali, Hassan M','1880','308-833-0022','','5','2002-12-05','2025-12-16','1','Omer Muridi','',1,'2024-03-30 07:32:49','2024-03-30 07:32:49','Pinnick # 1591 Oceanside'),(23,1,1,'Abdille, Ahmedhadi W','1938','619-707-2877','','5','2023-02-12','2025-05-06','1','Omer Muridi','',1,'2024-03-30 07:51:57','2024-03-30 07:51:57','1120 Nestor Way San Diego, CA 92154'),(24,1,1,'Abdelrhman, Mustafa','Not aware','619-764-2898','','1','2002-02-22','2028-05-05','4','Omer Muridi','',1,'2024-03-30 07:54:54','2024-03-30 07:54:54','Whidney Line San Diego California'),(25,1,1,'Asad Salad','not confirm yet','310-654-2539','','1','2021-02-22','2008-02-23','1','Omer Muridi','',1,'2024-03-30 07:56:30','2024-03-30 07:56:30','2020 Piper Ranch Rd San Diego, CA 92154'),(26,1,1,'Kamal Sagal','-','720-592-9639','','1','2220-02-22','2025-02-22','1','Omer Muridi','',1,'2024-03-30 07:58:39','2024-03-30 07:58:39','2020 Piper Ranch Rd San Diego, CA 92154'),(27,1,1,'Abdul Aziz Mustafa Mohamud','--','316-558-0101','','1','2220-02-22','2222-02-22','1','Omer Muridi','',1,'2024-03-30 08:00:30','2024-03-30 08:00:30','1595 Radar Rd, San Diego, CA 92154');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint unsigned NOT NULL,
  `location_id` bigint unsigned NOT NULL,
  `type` enum('check-in','check-out') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `calling_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_approved` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_employee_id_foreign` (`employee_id`),
  KEY `jobs_location_id_foreign` (`location_id`),
  CONSTRAINT `jobs_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `jobs_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_types`
--

DROP TABLE IF EXISTS `location_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_types`
--

LOCK TABLES `location_types` WRITE;
/*!40000 ALTER TABLE `location_types` DISABLE KEYS */;
INSERT INTO `location_types` VALUES (1,'Commercial','0',1,NULL,NULL),(2,'Construction','0',1,NULL,NULL),(3,'Los Angeles A','2',1,NULL,NULL),(4,'Los Angeles B','2',1,NULL,NULL),(5,'North','2',1,NULL,NULL),(6,'Mendota','2',1,NULL,NULL),(7,'San Diego','2',1,NULL,NULL);
/*!40000 ALTER TABLE `location_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `timezone_id` bigint unsigned NOT NULL,
  `timezone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `coverage_start_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `coverage_end_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_sub_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `license_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `schedule_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_monitoring` tinyint(1) NOT NULL DEFAULT '0',
  `notes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `locations_user_id_foreign` (`user_id`),
  KEY `locations_timezone_id_foreign` (`timezone_id`),
  CONSTRAINT `locations_timezone_id_foreign` FOREIGN KEY (`timezone_id`) REFERENCES `time_zones` (`id`),
  CONSTRAINT `locations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,6,'Bills Signs and Trucking','10329 Channel Rd, Lakeside, CA 92040',425,'UTC','12:00:00','12:00:00','7','',NULL,'[{\"day\":\"Monday\",\"start_time\":\"20:00\",\"end_time\":\"03:00\"}]',0,NULL,'2024-03-31 04:18:28','2024-03-31 04:18:28'),(2,6,'Costco Mission Valley','2345 Fenton Pkwy, San Diego, CA 92108',425,'UTC','12:00:00','12:00:00','7','',NULL,'[{\"day\":\"Monday\",\"start_time\":\"18:00\",\"end_time\":\"00:00\"},{\"day\":\"Tuesday\",\"start_time\":\"18:00\",\"end_time\":\"00:00\"},{\"day\":\"Wednesday\",\"start_time\":\"18:00\",\"end_time\":\"00:00\"},{\"day\":\"Thursday\",\"start_time\":\"18:00\",\"end_time\":\"00:00\"},{\"day\":\"Friday\",\"start_time\":\"18:00\",\"end_time\":\"00:00\"},{\"day\":\"Saturday\",\"start_time\":\"18:00\",\"end_time\":\"00:00\"},{\"day\":\"Sunday\",\"start_time\":\"18:00\",\"end_time\":\"00:00\"}]',0,NULL,'2024-04-05 07:18:39','2024-04-05 07:18:39'),(3,6,'Commerce Otay Mesa & piper ranch blvd San Diego','2020 Piper Ranch Rd San Diego, CA 92154',425,'UTC','12:00:00','12:00:00','7','',NULL,'[{\"day\":\"Monday\",\"start_time\":\"15:00\",\"end_time\":\"06:00\"},{\"day\":\"Tuesday\",\"start_time\":\"15:00\",\"end_time\":\"06:00\"},{\"day\":\"Wednesday\",\"start_time\":\"15:00\",\"end_time\":\"06:00\"},{\"day\":\"Thursday\",\"start_time\":\"15:00\",\"end_time\":\"06:00\"},{\"day\":\"Friday\",\"start_time\":\"15:00\",\"end_time\":\"06:00\"},{\"day\":\"Saturday\",\"start_time\":\"18:00\",\"end_time\":\"06:00\"},{\"day\":\"Sunday\",\"start_time\":\"18:00\",\"end_time\":\"06:00\"}]',0,NULL,'2024-04-05 07:27:54','2024-04-05 07:27:54'),(4,6,'Frieghtliner San Diego','6006 Mira Mar Rd San Diego CA',425,'UTC','12:00:00','12:00:00','7','',NULL,'[{\"day\":\"Monday\",\"start_time\":\"21:00\",\"end_time\":\"05:00\"},{\"day\":\"Tuesday\",\"start_time\":\"21:00\",\"end_time\":\"05:00\"},{\"day\":\"Wednesday\",\"start_time\":\"21:00\",\"end_time\":\"05:00\"},{\"day\":\"Thursday\",\"start_time\":\"21:00\",\"end_time\":\"05:00\"},{\"day\":\"Friday\",\"start_time\":\"21:00\",\"end_time\":\"05:00\"},{\"day\":\"Saturday\",\"start_time\":\"20:30\",\"end_time\":\"05:00\"},{\"day\":\"Sunday\",\"start_time\":\"20:30\",\"end_time\":\"05:00\"}]',0,NULL,'2024-04-05 07:30:48','2024-04-05 07:30:48'),(5,6,'KZ Companies, LLC.','3180 University Avenue, San Diego, CA 92104',425,'UTC','12:00:00','12:00:00','7','',NULL,'[{\"day\":\"Monday\",\"start_time\":\"08:00\",\"end_time\":\"16:00\"}]',0,NULL,'2024-04-05 07:35:57','2024-04-05 07:35:57'),(6,6,'Lennar','Janal way San Diego  CA 92129 United state',425,'UTC','12:00:00','12:00:00','7','',NULL,'[{\"day\":\"Monday\",\"start_time\":\"16:00\",\"end_time\":\"06:00\"},{\"day\":\"Tuesday\",\"start_time\":\"16:00\",\"end_time\":\"06:00\"}]',0,NULL,'2024-04-05 07:36:51','2024-04-05 07:36:51'),(7,6,'McCarthy Holdings Inc. \"Millenia\"','1785 Millenia Ave Chula Vista, CA  91915',425,'UTC','12:00:00','12:00:00','7','',NULL,'[{\"day\":\"Monday\",\"start_time\":\"19:00\",\"end_time\":\"05:00\"},{\"day\":\"Tuesday\",\"start_time\":\"19:00\",\"end_time\":\"05:00\"},{\"day\":\"Wednesday\",\"start_time\":\"19:00\",\"end_time\":\"05:00\"},{\"day\":\"Thursday\",\"start_time\":\"19:00\",\"end_time\":\"05:00\"},{\"day\":\"Friday\",\"start_time\":\"19:00\",\"end_time\":\"05:00\"},{\"day\":\"Saturday\",\"start_time\":\"19:00\",\"end_time\":\"05:00\"},{\"day\":\"Sunday\",\"start_time\":\"19:00\",\"end_time\":\"05:00\"}]',0,NULL,'2024-04-05 07:40:20','2024-04-05 07:40:20'),(8,6,'McCarthy Holdings \"Bioterra\"','5897 Oberlin Drive San Diego 92121',425,'UTC','12:00:00','12:00:00','7','',NULL,'[{\"day\":\"Monday\",\"start_time\":\"18:30\",\"end_time\":\"04:30\"},{\"day\":\"Tuesday\",\"start_time\":\"18:30\",\"end_time\":\"04:30\"},{\"day\":\"Wednesday\",\"start_time\":\"18:30\",\"end_time\":\"04:30\"},{\"day\":\"Thursday\",\"start_time\":\"18:30\",\"end_time\":\"04:30\"},{\"day\":\"Friday\",\"start_time\":\"18:30\",\"end_time\":\"16:30\"},{\"day\":\"Saturday\",\"start_time\":\"18:30\",\"end_time\":\"04:30\"},{\"day\":\"Sunday\",\"start_time\":\"18:30\",\"end_time\":\"04:30\"}]',0,NULL,'2024-04-05 07:42:57','2024-04-05 07:42:57'),(9,6,'Nestor Senior Village','1120 Nestor Way San Diego, CA 92154',425,'UTC','12:00:00','12:00:00','7','',NULL,'[{\"day\":\"Monday\",\"start_time\":\"16:00\",\"end_time\":\"06:00\"},{\"day\":\"Tuesday\",\"start_time\":\"16:00\",\"end_time\":\"06:00\"},{\"day\":\"Wednesday\",\"start_time\":\"16:00\",\"end_time\":\"06:00\"},{\"day\":\"Thursday\",\"start_time\":\"16:00\",\"end_time\":\"06:00\"},{\"day\":\"Friday\",\"start_time\":\"16:00\",\"end_time\":\"06:00\"},{\"day\":\"Saturday\",\"start_time\":\"06:00\",\"end_time\":\"06:00\"},{\"day\":\"Sunday\",\"start_time\":\"06:00\",\"end_time\":\"06:00\"}]',0,NULL,'2024-04-05 07:44:54','2024-04-05 07:44:54'),(10,6,'NCR \"Greenbrier Oceanside\"','563 Greenbrier Dr. Oceanside, CA 92054',425,'UTC','12:00:00','12:00:00','7','',NULL,'[{\"day\":\"Monday\",\"start_time\":\"17:00\",\"end_time\":\"05:00\"},{\"day\":\"Tuesday\",\"start_time\":\"16:00\",\"end_time\":\"06:00\"},{\"day\":\"Wednesday\",\"start_time\":\"16:00\",\"end_time\":\"06:00\"},{\"day\":\"Thursday\",\"start_time\":\"16:00\",\"end_time\":\"06:00\"},{\"day\":\"Friday\",\"start_time\":\"16:00\",\"end_time\":\"06:00\"},{\"day\":\"Saturday\",\"start_time\":\"06:00\",\"end_time\":\"06:00\"},{\"day\":\"Sunday\",\"start_time\":\"06:00\",\"end_time\":\"06:00\"}]',0,NULL,'2024-04-05 07:47:53','2024-04-05 07:47:53'),(11,9,'Pinnick, Inc #1570','Twin Oaks & City Drive',425,'UTC','12:00:00','12:00:00','7','',NULL,'[{\"day\":\"Monday\",\"start_time\":\"15:30\",\"end_time\":\"07:00\"},{\"day\":\"Tuesday\",\"start_time\":\"15:30\",\"end_time\":\"07:00\"},{\"day\":\"Wednesday\",\"start_time\":\"15:30\",\"end_time\":\"07:00\"},{\"day\":\"Thursday\",\"start_time\":\"15:30\",\"end_time\":\"07:00\"},{\"day\":\"Friday\",\"start_time\":\"15:30\",\"end_time\":\"07:00\"},{\"day\":\"Saturday\",\"start_time\":\"07:00\",\"end_time\":\"07:00\"},{\"day\":\"Sunday\",\"start_time\":\"07:00\",\"end_time\":\"07:00\"}]',0,NULL,'2024-04-05 09:09:53','2024-04-05 09:09:53'),(12,9,'Pinnick # 1591 Oceanside','NO Addres',425,'UTC','12:00:00','12:00:00','7','',NULL,'[{\"day\":\"Monday\",\"start_time\":\"15:30\",\"end_time\":\"07:00\"},{\"day\":\"Tuesday\",\"start_time\":\"15:30\",\"end_time\":\"07:00\"},{\"day\":\"Wednesday\",\"start_time\":\"15:30\",\"end_time\":\"07:00\"},{\"day\":\"Thursday\",\"start_time\":\"15:30\",\"end_time\":\"07:00\"},{\"day\":\"Friday\",\"start_time\":\"15:30\",\"end_time\":\"07:00\"},{\"day\":\"Saturday\",\"start_time\":\"07:00\",\"end_time\":\"19:00\"},{\"day\":\"Sunday\",\"start_time\":\"07:00\",\"end_time\":\"07:00\"}]',0,NULL,'2024-04-05 19:20:38','2024-04-05 19:20:38'),(13,9,'RD Olson Construction SpringHill Suites by Marriott','870 Showroom Place Chula Vista, CA : 91914',425,'UTC','12:00:00','12:00:00','7','',NULL,'[{\"day\":\"Monday\",\"start_time\":\"18:00\",\"end_time\":\"06:00\"},{\"day\":\"Tuesday\",\"start_time\":\"18:00\",\"end_time\":\"06:00\"},{\"day\":\"Wednesday\",\"start_time\":\"18:00\",\"end_time\":\"06:00\"},{\"day\":\"Thursday\",\"start_time\":\"18:00\",\"end_time\":\"06:00\"},{\"day\":\"Friday\",\"start_time\":\"18:00\",\"end_time\":\"06:00\"},{\"day\":\"Saturday\",\"start_time\":\"06:00\",\"end_time\":\"06:00\"},{\"day\":\"Sunday\",\"start_time\":\"06:00\",\"end_time\":\"06:00\"}]',0,NULL,'2024-04-05 19:29:28','2024-04-05 19:29:28'),(14,9,'StreAMline Development','3090 Polk Ave San Diego, CA  92104',425,'UTC','12:00:00','12:00:00','7','',NULL,'[{\"day\":\"Monday\",\"start_time\":\"15:30\",\"end_time\":\"06:30\"},{\"day\":\"Tuesday\",\"start_time\":\"15:30\",\"end_time\":\"06:30\"},{\"day\":\"Wednesday\",\"start_time\":\"15:30\",\"end_time\":\"06:30\"},{\"day\":\"Thursday\",\"start_time\":\"15:30\",\"end_time\":\"06:30\"},{\"day\":\"Friday\",\"start_time\":\"15:30\",\"end_time\":\"06:30\"},{\"day\":\"Saturday\",\"start_time\":\"06:30\",\"end_time\":\"18:30\"},{\"day\":\"Sunday\",\"start_time\":\"18:30\",\"end_time\":\"06:30\"}]',0,NULL,'2024-04-05 19:35:46','2024-04-05 19:35:46'),(15,9,'Sinanian Devlopment','5256 Naranja St, San Diego, CA 92114, USA',425,'UTC','12:00:00','12:00:00','7','',NULL,'[{\"day\":\"Monday\",\"start_time\":\"18:00\",\"end_time\":\"06:00\"},{\"day\":\"Tuesday\",\"start_time\":\"18:00\",\"end_time\":\"06:00\"},{\"day\":\"Wednesday\",\"start_time\":\"18:00\",\"end_time\":\"06:00\"},{\"day\":\"Thursday\",\"start_time\":\"18:00\",\"end_time\":\"06:00\"},{\"day\":\"Friday\",\"start_time\":\"18:00\",\"end_time\":\"06:00\"},{\"day\":\"Saturday\",\"start_time\":\"18:00\",\"end_time\":\"06:00\"},{\"day\":\"Sunday\",\"start_time\":\"18:00\",\"end_time\":\"06:00\"}]',0,NULL,'2024-04-05 19:40:32','2024-04-05 19:40:32'),(16,9,'Shea Homes Chula Vista','(Savona) Paseo Levanten',425,'UTC','12:00:00','12:00:00','7','',NULL,'[{\"day\":\"Monday\",\"start_time\":\"16:00\",\"end_time\":\"07:00\"},{\"day\":\"Tuesday\",\"start_time\":\"16:00\",\"end_time\":\"07:00\"},{\"day\":\"Wednesday\",\"start_time\":\"16:00\",\"end_time\":\"07:00\"},{\"day\":\"Thursday\",\"start_time\":\"16:00\",\"end_time\":\"07:00\"},{\"day\":\"Friday\",\"start_time\":\"16:00\",\"end_time\":\"07:00\"},{\"day\":\"Saturday\",\"start_time\":\"07:00\",\"end_time\":\"07:00\"},{\"day\":\"Sunday\",\"start_time\":\"07:00\",\"end_time\":\"07:00\"}]',0,NULL,'2024-04-05 19:47:58','2024-04-05 19:47:58'),(17,9,'Shea Homes','1150 Quail Garden Dr. Encinitas CA',425,'UTC','12:00:00','12:00:00','7','',NULL,'[{\"day\":\"Monday\",\"start_time\":\"17:00\",\"end_time\":\"07:00\"},{\"day\":\"Tuesday\",\"start_time\":\"17:00\",\"end_time\":\"07:00\"},{\"day\":\"Wednesday\",\"start_time\":\"17:00\",\"end_time\":\"07:00\"},{\"day\":\"Thursday\",\"start_time\":\"17:00\",\"end_time\":\"07:00\"},{\"day\":\"Friday\",\"start_time\":\"17:00\",\"end_time\":\"07:00\"},{\"day\":\"Saturday\",\"start_time\":\"07:00\",\"end_time\":\"07:00\"},{\"day\":\"Sunday\",\"start_time\":\"07:00\",\"end_time\":\"07:00\"}]',1,NULL,'2024-04-05 20:07:28','2024-04-05 20:07:28');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_100000_create_password_reset_tokens_table',1),(2,'2019_08_19_000000_create_failed_jobs_table',1),(3,'2019_12_14_000001_create_personal_access_tokens_table',1),(4,'2023_10_02_160808_create_countries_table',1),(5,'2023_10_02_160820_create_states_table',1),(6,'2023_10_02_160918_create_cities_table',1),(7,'2023_10_02_160933_create_roles_table',1),(8,'2023_10_03_000000_create_users_table',1),(9,'2023_10_04_181753_create_user_two_factors_table',1),(10,'2023_10_17_063524_create_time_zones_table',1),(12,'2023_10_17_073040_create_location_types_table',1),(17,'2023_11_01_061712_create_employee_categories_table',2),(19,'2023_10_17_073224_create_locations_table',3),(20,'2023_10_30_172736_create_client_locations_table',3),(21,'2023_10_30_173059_create_monitor_locations_table',3),(22,'2023_10_17_072545_create_employees_table',4),(24,'2023_11_14_055816_create_schedule_days_table',5),(29,'2023_10_18_100635_create_jobs_table',7),(36,'2024_01_11_063203_create_privileges_table',13),(38,'2024_01_11_063544_create_user_privileges_table',14),(40,'2023_11_14_055601_create_schedules_table',16),(43,'2023_11_15_063754_create_monitorings_table',18),(44,'2023_12_22_103520_create_time_sheets_table',19),(45,'2023_12_23_135546_create_confirmation_calls_table',20);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monitor_locations`
--

DROP TABLE IF EXISTS `monitor_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monitor_locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `location_id` bigint unsigned NOT NULL,
  `number_of_camera` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `camera_tower_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nvr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `monitor_locations_location_id_foreign` (`location_id`),
  CONSTRAINT `monitor_locations_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitor_locations`
--

LOCK TABLES `monitor_locations` WRITE;
/*!40000 ALTER TABLE `monitor_locations` DISABLE KEYS */;
INSERT INTO `monitor_locations` VALUES (1,17,'6','545','yes','2024-04-05 20:07:28','2024-04-05 20:07:28');
/*!40000 ALTER TABLE `monitor_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monitorings`
--

DROP TABLE IF EXISTS `monitorings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monitorings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `location_id` bigint unsigned NOT NULL,
  `employee_id` bigint unsigned NOT NULL,
  `monitor_location_id` int NOT NULL DEFAULT '0',
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `monitorings_location_id_foreign` (`location_id`),
  KEY `monitorings_employee_id_foreign` (`employee_id`),
  CONSTRAINT `monitorings_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `monitorings_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitorings`
--

LOCK TABLES `monitorings` WRITE;
/*!40000 ALTER TABLE `monitorings` DISABLE KEYS */;
/*!40000 ALTER TABLE `monitorings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privileges`
--

DROP TABLE IF EXISTS `privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `privileges` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `privilige_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `privilige_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privileges`
--

LOCK TABLES `privileges` WRITE;
/*!40000 ALTER TABLE `privileges` DISABLE KEYS */;
INSERT INTO `privileges` VALUES (5,'employee list','/employee/',1,'2024-01-11 10:05:42',NULL),(6,'employee edit','/employee/{employee}/edit',1,'2024-01-11 10:05:42',NULL),(7,'employee show','/employee/{employee}',0,'2024-01-11 10:05:42',NULL),(8,'employee create','/employee/create',1,'2024-01-11 10:05:42',NULL),(13,'locationType list','/locationType/',1,'2024-01-11 10:05:42',NULL),(14,'locationType edit','/locationType/{locationType}/edit',1,'2024-01-11 10:05:42',NULL),(15,'locationType show','/locationType/{locationType}',1,'2024-01-11 10:05:42',NULL),(16,'locationType create','/locationType/create',1,'2024-01-11 10:05:42',NULL),(17,'confirmation-call list','/confirmation-call/',1,'2024-01-11 10:05:42',NULL),(18,'confirmation-call edit','/confirmation-call/{confirmation-call}/edit',1,'2024-01-11 10:05:42',NULL),(19,'confirmation-call show','/confirmation-call/{confirmation-call}',1,'2024-01-11 10:05:42',NULL),(20,'confirmation-call create','/confirmation-call/create',1,'2024-01-11 10:05:42',NULL),(21,'time-sheet list','/time-sheet/',1,'2024-01-11 10:05:42',NULL),(22,'time-sheet edit','/time-sheet/{time-sheet}/edit',1,'2024-01-11 10:05:42',NULL),(23,'time-sheet show','/time-sheet/{time-sheet}',1,'2024-01-11 10:05:42',NULL),(24,'time-sheet create','/time-sheet/create',1,'2024-01-11 10:05:42',NULL),(25,'monitoring list','/monitoring/',1,'2024-01-11 10:05:42',NULL),(26,'monitoring edit','/monitoring/{monitoring}/edit',1,'2024-01-11 10:05:42',NULL),(27,'monitoring show','/monitoring/{monitoring}',1,'2024-01-11 10:05:42',NULL),(28,'monitoring create','/monitoring/create',1,'2024-01-11 10:05:42',NULL),(29,'schedule','/schedule/',1,'2024-01-19 12:56:28',NULL);
/*!40000 ALTER TABLE `privileges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'SuperAdmin',1,'2024-01-12 05:36:27',NULL),(2,'Admin',1,'2024-01-12 05:36:31',NULL),(3,'User',1,'2024-01-12 05:36:34',NULL),(4,'Dispatch',1,'2024-01-12 05:32:47',NULL),(5,'Monitoring',1,'2024-01-12 05:35:52',NULL),(6,'Time Sheet',1,'2024-01-12 05:35:52',NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_days`
--

DROP TABLE IF EXISTS `schedule_days`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule_days` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `schedule_id` bigint unsigned NOT NULL,
  `day` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `schedule_days_schedule_id_foreign` (`schedule_id`),
  CONSTRAINT `schedule_days_schedule_id_foreign` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_days`
--

LOCK TABLES `schedule_days` WRITE;
/*!40000 ALTER TABLE `schedule_days` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule_days` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedules`
--

DROP TABLE IF EXISTS `schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `employee_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_id` bigint unsigned NOT NULL,
  `start_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comments` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `schedules_location_id_foreign` (`location_id`),
  CONSTRAINT `schedules_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules`
--

LOCK TABLES `schedules` WRITE;
/*!40000 ALTER TABLE `schedules` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `country_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `states_country_id_foreign` (`country_id`),
  CONSTRAINT `states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,1,'SINDH',NULL,'2023-10-31 09:41:21',NULL);
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_sheets`
--

DROP TABLE IF EXISTS `time_sheets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_sheets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `schedule_id` bigint unsigned NOT NULL,
  `employee_id` bigint unsigned NOT NULL,
  `location_id` bigint unsigned NOT NULL,
  `check_in_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `check_out_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_approved` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time_sheets_schedule_id_foreign` (`schedule_id`),
  KEY `time_sheets_employee_id_foreign` (`employee_id`),
  KEY `time_sheets_location_id_foreign` (`location_id`),
  CONSTRAINT `time_sheets_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `time_sheets_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`),
  CONSTRAINT `time_sheets_schedule_id_foreign` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_sheets`
--

LOCK TABLES `time_sheets` WRITE;
/*!40000 ALTER TABLE `time_sheets` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_sheets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zones`
--

DROP TABLE IF EXISTS `time_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_zones` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `timezone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=426 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zones`
--

LOCK TABLES `time_zones` WRITE;
/*!40000 ALTER TABLE `time_zones` DISABLE KEYS */;
INSERT INTO `time_zones` VALUES (1,'Africa/Abidjan',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(2,'Africa/Accra',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(3,'Africa/Addis_Ababa',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(4,'Africa/Algiers',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(5,'Africa/Asmara',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(6,'Africa/Bamako',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(7,'Africa/Bangui',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(8,'Africa/Banjul',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(9,'Africa/Bissau',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(10,'Africa/Blantyre',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(11,'Africa/Brazzaville',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(12,'Africa/Bujumbura',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(13,'Africa/Cairo',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(14,'Africa/Casablanca',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(15,'Africa/Ceuta',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(16,'Africa/Conakry',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(17,'Africa/Dakar',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(18,'Africa/Dar_es_Salaam',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(19,'Africa/Djibouti',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(20,'Africa/Douala',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(21,'Africa/El_Aaiun',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(22,'Africa/Freetown',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(23,'Africa/Gaborone',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(24,'Africa/Harare',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(25,'Africa/Johannesburg',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(26,'Africa/Juba',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(27,'Africa/Kampala',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(28,'Africa/Khartoum',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(29,'Africa/Kigali',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(30,'Africa/Kinshasa',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(31,'Africa/Lagos',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(32,'Africa/Libreville',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(33,'Africa/Lome',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(34,'Africa/Luanda',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(35,'Africa/Lubumbashi',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(36,'Africa/Lusaka',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(37,'Africa/Malabo',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(38,'Africa/Maputo',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(39,'Africa/Maseru',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(40,'Africa/Mbabane',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(41,'Africa/Mogadishu',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(42,'Africa/Monrovia',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(43,'Africa/Nairobi',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(44,'Africa/Ndjamena',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(45,'Africa/Niamey',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(46,'Africa/Nouakchott',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(47,'Africa/Ouagadougou',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(48,'Africa/Porto-Novo',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(49,'Africa/Sao_Tome',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(50,'Africa/Tripoli',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(51,'Africa/Tunis',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(52,'Africa/Windhoek',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(53,'America/Adak',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(54,'America/Anchorage',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(55,'America/Anguilla',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(56,'America/Antigua',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(57,'America/Araguaina',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(58,'America/Argentina/Buenos_Aires',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(59,'America/Argentina/Catamarca',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(60,'America/Argentina/Cordoba',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(61,'America/Argentina/Jujuy',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(62,'America/Argentina/La_Rioja',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(63,'America/Argentina/Mendoza',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(64,'America/Argentina/Rio_Gallegos',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(65,'America/Argentina/Salta',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(66,'America/Argentina/San_Juan',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(67,'America/Argentina/San_Luis',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(68,'America/Argentina/Tucuman',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(69,'America/Argentina/Ushuaia',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(70,'America/Aruba',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(71,'America/Asuncion',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(72,'America/Atikokan',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(73,'America/Bahia',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(74,'America/Bahia_Banderas',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(75,'America/Barbados',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(76,'America/Belem',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(77,'America/Belize',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(78,'America/Blanc-Sablon',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(79,'America/Boa_Vista',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(80,'America/Bogota',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(81,'America/Boise',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(82,'America/Cambridge_Bay',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(83,'America/Campo_Grande',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(84,'America/Cancun',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(85,'America/Caracas',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(86,'America/Cayenne',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(87,'America/Cayman',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(88,'America/Chicago',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(89,'America/Chihuahua',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(90,'America/Costa_Rica',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(91,'America/Creston',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(92,'America/Cuiaba',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(93,'America/Curacao',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(94,'America/Danmarkshavn',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(95,'America/Dawson',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(96,'America/Dawson_Creek',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(97,'America/Denver',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(98,'America/Detroit',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(99,'America/Dominica',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(100,'America/Edmonton',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(101,'America/Eirunepe',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(102,'America/El_Salvador',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(103,'America/Fort_Nelson',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(104,'America/Fortaleza',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(105,'America/Glace_Bay',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(106,'America/Goose_Bay',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(107,'America/Grand_Turk',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(108,'America/Grenada',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(109,'America/Guadeloupe',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(110,'America/Guatemala',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(111,'America/Guayaquil',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(112,'America/Guyana',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(113,'America/Halifax',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(114,'America/Havana',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(115,'America/Hermosillo',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(116,'America/Indiana/Indianapolis',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(117,'America/Indiana/Knox',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(118,'America/Indiana/Marengo',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(119,'America/Indiana/Petersburg',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(120,'America/Indiana/Tell_City',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(121,'America/Indiana/Vevay',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(122,'America/Indiana/Vincennes',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(123,'America/Indiana/Winamac',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(124,'America/Inuvik',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(125,'America/Iqaluit',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(126,'America/Jamaica',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(127,'America/Juneau',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(128,'America/Kentucky/Louisville',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(129,'America/Kentucky/Monticello',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(130,'America/Kralendijk',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(131,'America/La_Paz',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(132,'America/Lima',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(133,'America/Los_Angeles',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(134,'America/Lower_Princes',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(135,'America/Maceio',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(136,'America/Managua',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(137,'America/Manaus',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(138,'America/Marigot',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(139,'America/Martinique',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(140,'America/Matamoros',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(141,'America/Mazatlan',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(142,'America/Menominee',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(143,'America/Merida',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(144,'America/Metlakatla',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(145,'America/Mexico_City',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(146,'America/Miquelon',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(147,'America/Moncton',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(148,'America/Monterrey',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(149,'America/Montevideo',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(150,'America/Montserrat',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(151,'America/Nassau',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(152,'America/New_York',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(153,'America/Nipigon',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(154,'America/Nome',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(155,'America/Noronha',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(156,'America/North_Dakota/Beulah',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(157,'America/North_Dakota/Center',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(158,'America/North_Dakota/New_Salem',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(159,'America/Nuuk',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(160,'America/Ojinaga',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(161,'America/Panama',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(162,'America/Pangnirtung',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(163,'America/Paramaribo',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(164,'America/Phoenix',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(165,'America/Port-au-Prince',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(166,'America/Port_of_Spain',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(167,'America/Porto_Velho',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(168,'America/Puerto_Rico',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(169,'America/Punta_Arenas',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(170,'America/Rainy_River',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(171,'America/Rankin_Inlet',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(172,'America/Recife',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(173,'America/Regina',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(174,'America/Resolute',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(175,'America/Rio_Branco',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(176,'America/Santarem',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(177,'America/Santiago',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(178,'America/Santo_Domingo',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(179,'America/Sao_Paulo',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(180,'America/Scoresbysund',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(181,'America/Sitka',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(182,'America/St_Barthelemy',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(183,'America/St_Johns',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(184,'America/St_Kitts',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(185,'America/St_Lucia',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(186,'America/St_Thomas',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(187,'America/St_Vincent',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(188,'America/Swift_Current',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(189,'America/Tegucigalpa',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(190,'America/Thule',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(191,'America/Thunder_Bay',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(192,'America/Tijuana',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(193,'America/Toronto',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(194,'America/Tortola',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(195,'America/Vancouver',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(196,'America/Whitehorse',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(197,'America/Winnipeg',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(198,'America/Yakutat',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(199,'America/Yellowknife',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(200,'Antarctica/Casey',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(201,'Antarctica/Davis',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(202,'Antarctica/DumontDUrville',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(203,'Antarctica/Macquarie',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(204,'Antarctica/Mawson',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(205,'Antarctica/McMurdo',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(206,'Antarctica/Palmer',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(207,'Antarctica/Rothera',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(208,'Antarctica/Syowa',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(209,'Antarctica/Troll',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(210,'Antarctica/Vostok',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(211,'Arctic/Longyearbyen',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(212,'Asia/Aden',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(213,'Asia/Almaty',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(214,'Asia/Amman',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(215,'Asia/Anadyr',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(216,'Asia/Aqtau',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(217,'Asia/Aqtobe',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(218,'Asia/Ashgabat',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(219,'Asia/Atyrau',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(220,'Asia/Baghdad',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(221,'Asia/Bahrain',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(222,'Asia/Baku',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(223,'Asia/Bangkok',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(224,'Asia/Barnaul',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(225,'Asia/Beirut',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(226,'Asia/Bishkek',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(227,'Asia/Brunei',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(228,'Asia/Chita',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(229,'Asia/Choibalsan',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(230,'Asia/Colombo',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(231,'Asia/Damascus',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(232,'Asia/Dhaka',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(233,'Asia/Dili',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(234,'Asia/Dubai',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(235,'Asia/Dushanbe',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(236,'Asia/Famagusta',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(237,'Asia/Gaza',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(238,'Asia/Hebron',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(239,'Asia/Ho_Chi_Minh',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(240,'Asia/Hong_Kong',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(241,'Asia/Hovd',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(242,'Asia/Irkutsk',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(243,'Asia/Jakarta',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(244,'Asia/Jayapura',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(245,'Asia/Jerusalem',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(246,'Asia/Kabul',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(247,'Asia/Kamchatka',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(248,'Asia/Karachi',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(249,'Asia/Kathmandu',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(250,'Asia/Khandyga',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(251,'Asia/Kolkata',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(252,'Asia/Krasnoyarsk',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(253,'Asia/Kuala_Lumpur',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(254,'Asia/Kuching',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(255,'Asia/Kuwait',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(256,'Asia/Macau',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(257,'Asia/Magadan',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(258,'Asia/Makassar',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(259,'Asia/Manila',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(260,'Asia/Muscat',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(261,'Asia/Nicosia',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(262,'Asia/Novokuznetsk',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(263,'Asia/Novosibirsk',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(264,'Asia/Omsk',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(265,'Asia/Oral',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(266,'Asia/Phnom_Penh',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(267,'Asia/Pontianak',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(268,'Asia/Pyongyang',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(269,'Asia/Qatar',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(270,'Asia/Qostanay',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(271,'Asia/Qyzylorda',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(272,'Asia/Riyadh',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(273,'Asia/Sakhalin',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(274,'Asia/Samarkand',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(275,'Asia/Seoul',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(276,'Asia/Shanghai',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(277,'Asia/Singapore',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(278,'Asia/Srednekolymsk',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(279,'Asia/Taipei',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(280,'Asia/Tashkent',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(281,'Asia/Tbilisi',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(282,'Asia/Tehran',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(283,'Asia/Thimphu',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(284,'Asia/Tokyo',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(285,'Asia/Tomsk',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(286,'Asia/Ulaanbaatar',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(287,'Asia/Urumqi',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(288,'Asia/Ust-Nera',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(289,'Asia/Vientiane',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(290,'Asia/Vladivostok',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(291,'Asia/Yakutsk',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(292,'Asia/Yangon',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(293,'Asia/Yekaterinburg',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(294,'Asia/Yerevan',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(295,'Atlantic/Azores',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(296,'Atlantic/Bermuda',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(297,'Atlantic/Canary',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(298,'Atlantic/Cape_Verde',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(299,'Atlantic/Faroe',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(300,'Atlantic/Madeira',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(301,'Atlantic/Reykjavik',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(302,'Atlantic/South_Georgia',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(303,'Atlantic/St_Helena',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(304,'Atlantic/Stanley',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(305,'Australia/Adelaide',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(306,'Australia/Brisbane',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(307,'Australia/Broken_Hill',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(308,'Australia/Darwin',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(309,'Australia/Eucla',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(310,'Australia/Hobart',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(311,'Australia/Lindeman',1,'2023-10-31 04:40:08','2023-10-31 04:40:08'),(312,'Australia/Lord_Howe',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(313,'Australia/Melbourne',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(314,'Australia/Perth',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(315,'Australia/Sydney',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(316,'Europe/Amsterdam',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(317,'Europe/Andorra',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(318,'Europe/Astrakhan',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(319,'Europe/Athens',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(320,'Europe/Belgrade',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(321,'Europe/Berlin',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(322,'Europe/Bratislava',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(323,'Europe/Brussels',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(324,'Europe/Bucharest',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(325,'Europe/Budapest',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(326,'Europe/Busingen',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(327,'Europe/Chisinau',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(328,'Europe/Copenhagen',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(329,'Europe/Dublin',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(330,'Europe/Gibraltar',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(331,'Europe/Guernsey',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(332,'Europe/Helsinki',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(333,'Europe/Isle_of_Man',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(334,'Europe/Istanbul',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(335,'Europe/Jersey',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(336,'Europe/Kaliningrad',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(337,'Europe/Kiev',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(338,'Europe/Kirov',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(339,'Europe/Lisbon',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(340,'Europe/Ljubljana',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(341,'Europe/London',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(342,'Europe/Luxembourg',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(343,'Europe/Madrid',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(344,'Europe/Malta',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(345,'Europe/Mariehamn',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(346,'Europe/Minsk',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(347,'Europe/Monaco',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(348,'Europe/Moscow',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(349,'Europe/Oslo',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(350,'Europe/Paris',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(351,'Europe/Podgorica',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(352,'Europe/Prague',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(353,'Europe/Riga',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(354,'Europe/Rome',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(355,'Europe/Samara',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(356,'Europe/San_Marino',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(357,'Europe/Sarajevo',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(358,'Europe/Saratov',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(359,'Europe/Simferopol',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(360,'Europe/Skopje',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(361,'Europe/Sofia',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(362,'Europe/Stockholm',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(363,'Europe/Tallinn',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(364,'Europe/Tirane',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(365,'Europe/Ulyanovsk',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(366,'Europe/Uzhgorod',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(367,'Europe/Vaduz',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(368,'Europe/Vatican',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(369,'Europe/Vienna',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(370,'Europe/Vilnius',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(371,'Europe/Volgograd',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(372,'Europe/Warsaw',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(373,'Europe/Zagreb',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(374,'Europe/Zaporozhye',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(375,'Europe/Zurich',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(376,'Indian/Antananarivo',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(377,'Indian/Chagos',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(378,'Indian/Christmas',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(379,'Indian/Cocos',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(380,'Indian/Comoro',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(381,'Indian/Kerguelen',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(382,'Indian/Mahe',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(383,'Indian/Maldives',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(384,'Indian/Mauritius',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(385,'Indian/Mayotte',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(386,'Indian/Reunion',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(387,'Pacific/Apia',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(388,'Pacific/Auckland',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(389,'Pacific/Bougainville',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(390,'Pacific/Chatham',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(391,'Pacific/Chuuk',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(392,'Pacific/Easter',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(393,'Pacific/Efate',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(394,'Pacific/Fakaofo',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(395,'Pacific/Fiji',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(396,'Pacific/Funafuti',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(397,'Pacific/Galapagos',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(398,'Pacific/Gambier',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(399,'Pacific/Guadalcanal',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(400,'Pacific/Guam',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(401,'Pacific/Honolulu',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(402,'Pacific/Kanton',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(403,'Pacific/Kiritimati',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(404,'Pacific/Kosrae',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(405,'Pacific/Kwajalein',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(406,'Pacific/Majuro',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(407,'Pacific/Marquesas',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(408,'Pacific/Midway',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(409,'Pacific/Nauru',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(410,'Pacific/Niue',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(411,'Pacific/Norfolk',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(412,'Pacific/Noumea',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(413,'Pacific/Pago_Pago',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(414,'Pacific/Palau',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(415,'Pacific/Pitcairn',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(416,'Pacific/Pohnpei',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(417,'Pacific/Port_Moresby',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(418,'Pacific/Rarotonga',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(419,'Pacific/Saipan',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(420,'Pacific/Tahiti',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(421,'Pacific/Tarawa',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(422,'Pacific/Tongatapu',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(423,'Pacific/Wake',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(424,'Pacific/Wallis',1,'2023-10-31 04:40:09','2023-10-31 04:40:09'),(425,'UTC',1,'2023-10-31 04:40:09','2023-10-31 04:40:09');
/*!40000 ALTER TABLE `time_zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_privileges`
--

DROP TABLE IF EXISTS `user_privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_privileges` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `privilege_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  `assign_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_privileges_privilege_id_foreign` (`privilege_id`),
  KEY `user_privileges_user_id_foreign` (`user_id`),
  KEY `user_privileges_role_id_foreign` (`role_id`),
  CONSTRAINT `user_privileges_privilege_id_foreign` FOREIGN KEY (`privilege_id`) REFERENCES `privileges` (`id`),
  CONSTRAINT `user_privileges_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `user_privileges_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_privileges`
--

LOCK TABLES `user_privileges` WRITE;
/*!40000 ALTER TABLE `user_privileges` DISABLE KEYS */;
INSERT INTO `user_privileges` VALUES (6,15,5,6,'admin',NULL,NULL),(7,21,5,6,'admin',NULL,NULL),(8,22,5,6,'admin',NULL,NULL),(9,23,5,6,'admin',NULL,NULL),(10,24,5,6,'admin',NULL,NULL),(11,29,5,6,'admin',NULL,NULL),(12,17,6,3,'admin',NULL,NULL),(13,18,6,3,'admin',NULL,NULL),(14,19,6,3,'admin',NULL,NULL),(15,20,6,3,'admin',NULL,NULL),(16,5,5,6,'admin',NULL,NULL),(17,6,5,6,'admin',NULL,NULL),(18,8,5,6,'admin',NULL,NULL),(19,13,5,6,'admin',NULL,NULL),(20,14,5,6,'admin',NULL,NULL),(21,15,5,6,'admin',NULL,NULL),(22,16,5,6,'admin',NULL,NULL),(23,21,5,6,'admin',NULL,NULL),(24,22,5,6,'admin',NULL,NULL),(25,23,5,6,'admin',NULL,NULL),(26,24,5,6,'admin',NULL,NULL),(27,29,5,6,'admin',NULL,NULL),(28,13,5,6,'admin',NULL,NULL),(29,14,5,6,'admin',NULL,NULL),(30,15,5,6,'admin',NULL,NULL),(31,16,5,6,'admin',NULL,NULL);
/*!40000 ALTER TABLE `user_privileges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_two_factors`
--

DROP TABLE IF EXISTS `user_two_factors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_two_factors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `opt_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `browser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `platform` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_mobile` tinyint(1) NOT NULL,
  `is_desktop` tinyint(1) NOT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_two_factors_user_id_foreign` (`user_id`),
  CONSTRAINT `user_two_factors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_two_factors`
--

LOCK TABLES `user_two_factors` WRITE;
/*!40000 ALTER TABLE `user_two_factors` DISABLE KEYS */;
INSERT INTO `user_two_factors` VALUES (1,1,'1234','111.88.221.142','Chrome','115.0.0.0','Linux',0,1,0,'2024-03-17 22:24:10','2024-03-17 22:24:10'),(2,1,'1234','137.59.222.4','Chrome','122.0.0.0','Windows',0,1,0,'2024-03-18 07:20:01','2024-03-18 07:20:01'),(3,1,'1234','39.57.192.39','Chrome','122.0.0.0','AndroidOS',1,0,0,'2024-03-19 20:14:17','2024-03-19 20:14:17'),(4,1,'1234','180.178.135.82','Chrome','122.0.0.0','Windows',0,1,0,'2024-03-20 04:39:50','2024-03-20 04:39:50'),(5,1,'1234','202.47.36.173','Chrome','122.0.0.0','Windows',0,1,0,'2024-03-20 04:40:44','2024-03-20 04:40:44'),(6,5,'1234','202.47.36.173','Chrome','122.0.0.0','Windows',0,1,0,'2024-03-21 10:01:28','2024-03-21 10:01:28'),(7,6,'1234','180.178.135.82','Chrome','122.0.0.0','Windows',0,1,0,'2024-03-21 10:08:18','2024-03-21 10:08:18'),(8,1,'1234','111.88.208.187','Chrome','122.0.0.0','AndroidOS',1,0,0,'2024-03-21 11:12:11','2024-03-21 11:12:11'),(9,1,'1234','111.88.218.199','Chrome','122.0.0.0','AndroidOS',1,0,0,'2024-03-21 17:36:24','2024-03-21 17:36:24'),(10,1,'1234','111.88.214.53','Chrome','115.0.0.0','Linux',0,1,0,'2024-03-23 00:54:02','2024-03-23 00:54:02'),(11,1,'1234','111.88.26.125','Chrome','123.0.0.0','Windows',0,1,0,'2024-03-23 02:19:02','2024-03-23 02:19:02'),(12,1,'1234','137.59.222.4','Chrome','123.0.0.0','Windows',0,1,0,'2024-03-29 06:44:36','2024-03-29 06:44:36'),(13,1,'1234','180.178.135.82','Chrome','123.0.0.0','Windows',0,1,0,'2024-03-30 04:28:18','2024-03-30 04:28:18'),(14,1,'1234','110.93.236.23','Chrome','123.0.0.0','Windows',0,1,0,'2024-04-04 03:43:28','2024-04-04 03:43:28'),(15,1,'1234','111.88.215.58','Chrome','115.0.0.0','Linux',0,1,0,'2024-04-04 21:00:42','2024-04-04 21:00:42'),(16,1,'1234','111.88.222.245','Chrome','123.0.0.0','AndroidOS',1,0,0,'2024-04-05 15:25:31','2024-04-05 15:25:31');
/*!40000 ALTER TABLE `user_two_factors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint unsigned NOT NULL,
  `country_id` bigint unsigned NOT NULL,
  `state_id` bigint unsigned NOT NULL,
  `city_id` bigint unsigned NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `secondary_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `opt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opt_expiry` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_approved` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_phone1_unique` (`phone1`),
  KEY `users_role_id_foreign` (`role_id`),
  KEY `users_country_id_foreign` (`country_id`),
  KEY `users_state_id_foreign` (`state_id`),
  KEY `users_city_id_foreign` (`city_id`),
  CONSTRAINT `users_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  CONSTRAINT `users_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `users_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,1,1,1,'admin','admin','',NULL,'admin@gmail.com',NULL,'23739493',NULL,'','admin','male',NULL,NULL,'$2y$10$xNYVTYzI/HRkpmr7k7st3ORmOblEqvJIyPRnbhR7K405mau5rNGbq',NULL,NULL,0,NULL,NULL,NULL,NULL),(5,6,1,1,1,'Zainab','Timesheet','','Prestige','Timesheet@prestigeinternationalsecurity.com',NULL,'9232508235',NULL,'Plot no 49C, Tauheed Commercial DHA Phase V, Karachi South.','2003-01-22','female',NULL,NULL,'$2y$10$IoC.9f5K/E7A0Jul3YOCDeJ3Ifj.seJh9UEq3We.qtGHUNX57Ot6i',NULL,NULL,1,NULL,NULL,'2024-03-21 09:59:46','2024-03-21 10:03:03'),(6,3,1,1,1,'Asad','Bhatti','','Ali','Construction@prestigeinternationalsecurity.com',NULL,'923093678338',NULL,'Plot no 49C, Tauheed Commercial DHA Phase V, Karachi South.','20003-01-22','male',NULL,NULL,'$2y$10$4oBynN4wHRlXeiBbSCGtPuuU4Bm6Js358SwYxadWD3927wzIh/0Ii',NULL,NULL,1,NULL,NULL,'2024-03-21 10:04:59','2024-03-21 10:04:59'),(7,4,1,1,1,'Talha','Saeed','',NULL,'talha@2421gmailcom',NULL,'56468316584631',NULL,'3rd st','2000-09-13','male',NULL,NULL,'$2y$10$3e4VxbUe79GGkkVp1n4HDugkjqARy/aggQB.6DvmLIhQp3K71AjgC',NULL,NULL,1,NULL,NULL,'2024-03-23 19:02:13','2024-03-23 19:02:13'),(8,4,1,1,1,'Ali','Muhammad','',NULL,'alimuhammad@gmal.com',NULL,'00000022214',NULL,'Karachi Sindh','2000-11-12','male',NULL,NULL,'$2y$10$Y9qUx1PvbrfSG0dgrewceu6jLeQpN8snFI3VevolW1UM1RBrcAG0q',NULL,NULL,1,NULL,NULL,'2024-04-05 07:13:57','2024-04-05 07:13:57'),(9,3,1,1,1,'Talha','Saeed','',NULL,'talha@gmail.com',NULL,'03211211212',NULL,'Karachi, Sindh','2002-11-29','male',NULL,NULL,'$2y$10$LBE6GqQ3uhXJ41MdreRxp.ktUxstGlbaJG4d.4goqzzHiDBD6k4Za',NULL,NULL,1,NULL,NULL,'2024-04-05 09:07:28','2024-04-05 09:07:28');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-08  5:07:48
