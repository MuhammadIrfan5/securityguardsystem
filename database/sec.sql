-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 08, 2024 at 01:48 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sec`
--

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `country_id`, `state_id`, `name`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'KHI', NULL, '2023-10-31 09:41:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `client_locations`
--

CREATE TABLE `client_locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `client_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client_locations`
--

INSERT INTO `client_locations` (`id`, `location_id`, `client_name`, `client_designation`, `client_email`, `client_phone`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 2, 'ahmed', 'Site Manager', 'Ali012094@gmail.com', '2136-54436-553', NULL, NULL),
(3, 3, 'farah', 'Superintendent', 'Ali012094@gmail.com', '2136-54436-553', NULL, NULL),
(4, 4, 'Ali Raza', 'MANAGER', 'RAZA@GMAIL.COM', '112-252-3323', NULL, NULL),
(5, 5, 'Ahmed', 'Site Manager', 'Ahmed@gmail.com', '2136-54436-553', NULL, NULL),
(6, 6, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 7, 'ABDUL RAZAQ', 'Manager', 'Raxzaq@gmail.com', '112-111-11111', NULL, NULL),
(8, 8, 'Awad', 'Site Supervisor', 'Awad@gmail.com', '222-111-2121', NULL, NULL),
(9, 9, 'ASAD', 'Site Manager', 'Ali012094@gmail.com', '123-333-3231', NULL, NULL),
(10, 10, 'Ahmed', 'Site Supervisor', 'Ahmed@gmail.com', '123-421-2321', NULL, NULL),
(11, 11, 'Abdelrehman', 'Site Manager', 'Abdelrehman@gmail.com', '111-222-3333', NULL, NULL),
(12, 12, 'JOhnny', 'Site Manager', 'Johnny@gmail.com', '111-222-1111', NULL, NULL),
(13, 13, 'David Hoyis', 'Supervisor', 'Hoyos@gmail.com', '123-213-4567', NULL, NULL),
(14, 14, 'Jeff', 'supritendent', 'jeff@gmail.com', '123-213-5454', NULL, NULL),
(15, 15, 'Bezos', 'Manager', 'dad@gmail.com', '999-524-5858', NULL, NULL),
(16, 16, 'Bruce', 'CEO', 'bruce@gmail', '515-525-2561', NULL, NULL),
(17, 17, 'instine', 'Manager', 'instine@gmail.com', '200-252-2526', NULL, NULL),
(18, 18, 'Anthony', 'Site Manager', 'Anthon123@gmail.com', '123-213-5454', NULL, NULL),
(19, 19, 'Asad Bhatti', 'Manager', 'asad@gmail.com', '111-252-0202', NULL, NULL),
(20, 20, 'Bhatti', 'suprvisor', 'bhatt@gmail.com', '021-111-222', NULL, NULL),
(21, 21, 'ibrahim', 'sUPERVISOR', 'iBRAHIM@GMAIL.COM', '111-222-3333', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `confirmation_calls`
--

CREATE TABLE `confirmation_calls` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `time_sheet_id` bigint(20) UNSIGNED NOT NULL,
  `schedule_id` bigint(20) UNSIGNED NOT NULL,
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `gate_combo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `call_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `iso2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dialling_pattern` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `region` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_region` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `iso2`, `iso3`, `name`, `phone_code`, `dialling_pattern`, `region`, `sub_region`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'PAK', 'PAK', 'PAKISTAN', '+92', '.', '.', '.', '1', NULL, '2023-10-31 09:40:36', NULL),
(2, 'SA', 'SA', 'South Africa', '+92', '', '', '', '1', NULL, '2024-01-11 02:41:41', '2024-01-11 02:41:41'),
(3, 'SA', 'SA', 'South Africa', '+92', '', '', '', '1', NULL, '2024-01-11 02:42:38', '2024-01-11 02:42:38'),
(4, 'SA', 'SA', 'South Africa', '+92', '', '', '', '1', NULL, '2024-01-11 02:43:03', '2024-01-11 02:43:03'),
(5, 'XQRFWUGW', 'XQRFWUGW', 'around', '+92', '', '', '', '1', NULL, '2024-01-11 02:43:18', '2024-01-11 02:43:18'),
(6, 'XQRFWUGW', 'XQRFWUGW', 'around', '+92', '', '', '', '1', NULL, '2024-01-11 02:43:44', '2024-01-11 02:43:44'),
(7, 'XQRFWUGW', 'XQRFWUGW', 'around', '+92', '', '', '', '1', NULL, '2024-01-11 02:43:54', '2024-01-11 02:43:54');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_one` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_two` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guard_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `issue_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiry_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pay_rate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `manager_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `user_id`, `category_id`, `name`, `id_number`, `phone_one`, `phone_two`, `guard_number`, `issue_date`, `expiry_date`, `pay_rate`, `manager_name`, `notes`, `is_active`, `created_at`, `updated_at`, `address`) VALUES
(2, 1, 1, 'Ahmed Malik', '101', '619-733-3355', '', '1', '2023-03-03', '2024-03-04', '3', 'Omer Muridi', '', 1, '2024-03-30 05:37:05', '2024-03-30 05:37:05', 'Twin Oaks & City Drive'),
(3, 1, 1, 'Warsame, Abdi Shakur', '78', '(619) 773-3105', '', '2', '2002-03-20', '2024-03-30', '1', 'Omer Muridi', '', 1, '2024-03-30 05:59:43', '2024-03-30 05:59:43', 'Pinnick # 1594 Chula Vista'),
(4, 1, 1, 'Isse, Jama M', '191', '619-540-1388', '', '1', '2003-03-20', '2024-03-20', '1', 'Omer Muridi', '', 1, '2024-03-30 06:09:18', '2024-03-30 06:09:18', '1785 Millenia Ave Chula Vista, CA  91915'),
(5, 1, 1, 'Muhamed Abdirasad Nuur', '485', '619-302-1814', '', '1', '2000-02-23', '2024-02-02', '1', 'Omer Muridi', '', 1, '2024-03-30 06:10:59', '2024-03-30 06:10:59', '10329 Channel Rd, Lakeside, CA 92040'),
(6, 1, 1, 'Said, Abdirizak O', '511', '619-751-0097', '', '1', '2003-02-02', '2025-02-12', '1', 'Sir Rehan', '', 1, '2024-03-30 06:12:40', '2024-03-30 06:12:40', '6006 Mira Mar Rd San Diego CA'),
(7, 1, 1, 'Omar, Aden Dahir', '1026', '619-389-4125', '', '1', '2002-02-03', '2025-05-15', '1', 'Omer Muridi', '', 1, '2024-03-30 06:18:09', '2024-03-30 06:18:09', '5618 Copely Dr San Diego CA : 92111'),
(8, 1, 1, 'Ali, Omar M', '1329', '619-319-7713', '', '3', '2020-02-03', '2025-03-02', '1', 'Omer Muridi', '', 1, '2024-03-30 06:26:28', '2024-03-30 06:26:28', 'KZ Companies, LLC.  3180 University Avenue, San Diego, CA 92104'),
(9, 1, 1, 'Mawlid Mahomud', '1381', '858-667-3066', '', '4', '2004-01-05', '2026-02-04', '1', 'Omer Muridi', '', 1, '2024-03-30 06:28:17', '2024-03-30 06:28:17', 'Pinnick # 1594 Chula Vista'),
(10, 1, 1, 'Awaleh, Mohamed A', '1477', '619-549-1294', '', '4', '2021-02-03', '2028-02-12', '1', 'Omer Muridi', '', 1, '2024-03-30 06:32:15', '2024-03-30 06:32:15', 'Shea Patria  Chula Vista  2049 Paseo Levanten Chula Vista CA 91913'),
(11, 1, 1, 'Abdulahi, Faisa Ahmed', '1481', '818-518-4007', '', '4', '2003-02-03', '2028-12-05', '1', 'Omer Muridi', '', 1, '2024-03-30 06:35:46', '2024-03-30 06:35:46', 'Shea Homes Chula Vista  (Savona) Paseo Levanten'),
(12, 1, 1, 'Abubakar, Mustafa Mohamud', '1524', '619-316-1361', '', '3', '2006-02-06', '2025-04-06', '1', 'Omer Muridi', '', 1, '2024-03-30 06:37:20', '2024-03-30 06:37:20', '1595 Radar Rd, San Diego, CA 92154'),
(13, 1, 1, 'Aden, Awaleh Mohamed', '1551', '858-833-7455', '', '2', '2001-02-02', '2028-02-23', '1', 'Omer Muridi', '', 1, '2024-03-30 06:40:27', '2024-03-30 06:40:27', 'Lennar lilac Whidney Line San Diego California'),
(14, 1, 1, 'Yusuf, Saddik Jama', '1603', '619-717-7143', '', '5', '2002-02-02', '2025-03-30', '1', 'Omer Muridi', '', 1, '2024-03-30 06:42:36', '2024-03-30 06:42:36', '5897 Oberlin Drive San Diego 92121'),
(15, 1, 1, 'Omar, Abdulahi Dahir', '1615', '619-885-9048', '', '5', '2005-02-05', '2024-03-31', '1', 'Omer Muridi', '', 1, '2024-03-30 06:44:24', '2024-03-30 06:44:24', '2345 Fenton Pkwy, San Diego, CA 92108'),
(16, 1, 1, 'Mkoma, Abdirehman Ramadan', '1617', '619-384-3216', '', '5', '2001-02-20', '2026-03-31', '1', 'Omer Muridi', '', 1, '2024-03-30 06:48:53', '2024-03-30 06:48:53', '1150 Quail Garden Dr. Encinitas CA'),
(17, 1, 1, 'Ahmed, Abdikarim Mohamed', '1629', '615-775-1344', '', '5', '2001-02-23', '2028-11-12', '1', 'Omer Muridi', '', 1, '2024-03-30 06:50:16', '2024-03-30 06:50:16', '563 Greenbrier Dr. Oceanside, CA 92054'),
(18, 1, 1, 'Omar, Abdirahman Dahir D', '1644', '619-653-9031', '', '4', '2003-02-25', '2025-11-11', '1', 'Omer Muridi', '', 1, '2024-03-30 07:14:40', '2024-03-30 07:14:40', '5618 Copely Dr San Diego CA : 92111'),
(19, 1, 1, 'Ali, Yusuf Omar', '1649', '619-432-9367', '', '1', '2001-02-28', '2030-02-23', '1', 'Omer Muridi', '', 1, '2024-03-30 07:23:10', '2024-03-30 07:23:10', 'Pinnick, Inc #1570 Twin Oaks & City Drive'),
(20, 1, 1, 'Ali, Hussein Nassib', '1651', '619-565-9920', '', '1', '2005-02-25', '2025-03-30', '1', 'Omer Muridi', '', 1, '2024-03-30 07:25:59', '2024-03-30 07:25:59', '10329 Channel Rd, Lakeside, CA 92040'),
(21, 1, 1, 'Ali, Kadija', '1740', '619-432-8993', '', '1', '2022-02-03', '2041-02-05', '1', 'Omer Muridi', '', 1, '2024-03-30 07:27:12', '2024-03-30 07:27:12', '870 Showroom Place Chula Vista, CA : 91914'),
(22, 1, 1, 'Ali, Hassan M', '1880', '308-833-0022', '', '5', '2002-12-05', '2025-12-16', '1', 'Omer Muridi', '', 1, '2024-03-30 07:32:49', '2024-03-30 07:32:49', 'Pinnick # 1591 Oceanside'),
(23, 1, 1, 'Abdille, Ahmedhadi W', '1938', '619-707-2877', '', '5', '2023-02-12', '2025-05-06', '1', 'Omer Muridi', '', 1, '2024-03-30 07:51:57', '2024-03-30 07:51:57', '1120 Nestor Way San Diego, CA 92154'),
(24, 1, 1, 'Abdelrhman, Mustafa', 'Not aware', '619-764-2898', '', '1', '2002-02-22', '2028-05-05', '4', 'Omer Muridi', '', 1, '2024-03-30 07:54:54', '2024-03-30 07:54:54', 'Whidney Line San Diego California'),
(25, 1, 1, 'Asad Salad', 'Not Aware', '310-654-2539', '', '1', '2021-02-22', '2008-02-23', '1', 'Omer Muridi', '', 1, '2024-03-30 07:56:30', '2024-04-13 22:26:28', '2020 Piper Ranch Rd San Diego, CA 92154'),
(26, 1, 1, 'Kamal Sagal', '-', '720-592-9639', '', '1', '2220-02-22', '2025-02-22', '1', 'Omer Muridi', '', 1, '2024-03-30 07:58:39', '2024-03-30 07:58:39', '2020 Piper Ranch Rd San Diego, CA 92154'),
(27, 1, 1, 'Abdul Aziz Mustafa Mohamud', '--', '316-558-0101', '', '1', '2220-02-22', '2222-02-22', '1', 'Omer Muridi', '', 1, '2024-03-30 08:00:30', '2024-03-30 08:00:30', '1595 Radar Rd, San Diego, CA 92154'),
(28, 1, 1, 'Asad Ali', '0110', '1234567890', '', '55', '2024-05-01', '2028-02-01', '10', 'Tayyab Awan', '', 1, '2024-05-08 05:41:28', '2024-05-08 05:41:28', '49c tauheed commercial'),
(29, 1, 1, 'SALEH', '2000', '222-111-3333', '', '3353215535355332', '2023-01-03', '2026-02-02', '1', 'IBRAHIM', '', 1, '2024-05-24 17:01:03', '2024-05-24 17:01:03', 'OMER'),
(30, 1, 1, 'Tayyab', '223', '111-233-2222', '', '0000000', '2020-05-15', '2024-06-15', '1', 'ali', '', 1, '2024-06-01 17:29:39', '2024-06-01 17:29:39', 'tauheed'),
(31, 1, 2, 'Konain', '1222', '222-222-2222', '', '00000000000', '2020-01-11', '2024-06-01', '0', 'Ali', '', 1, '2024-06-01 17:31:14', '2024-06-01 17:31:14', 'Neelum'),
(32, 1, 1, 'Talha', '111', '122-131-3213', '', '0000000', '2020-06-10', '2024-06-12', '0', 'Ali', '', 1, '2024-06-01 17:32:08', '2024-06-01 17:32:08', 'NAZIMABAD');

-- --------------------------------------------------------

--
-- Table structure for table `employee_categories`
--

CREATE TABLE `employee_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employee_categories`
--

INSERT INTO `employee_categories` (`id`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Regular', 1, NULL, NULL),
(2, 'Shack', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('check-in','check-out') COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `calling_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_approved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `timezone_id` bigint(20) UNSIGNED NOT NULL,
  `timezone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coverage_start_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coverage_end_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_sub_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `license_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `schedule_list` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_monitoring` tinyint(1) NOT NULL DEFAULT 0,
  `notes` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `user_id`, `name`, `address`, `timezone_id`, `timezone`, `coverage_start_time`, `coverage_end_time`, `location_type`, `location_sub_type`, `license_number`, `schedule_list`, `is_monitoring`, `notes`, `created_at`, `updated_at`) VALUES
(1, 6, 'Bills Signs and Trucking', '10329 Channel Rd, Lakeside, CA 92040', 425, 'UTC', '12:00:00', '12:00:00', '7', '', NULL, '[{\"day\":\"Monday\",\"start_time\":\"20:00\",\"end_time\":\"03:00\"}]', 0, NULL, '2024-03-31 04:18:28', '2024-03-31 04:18:28'),
(2, 6, 'Costco Mission Valley', '2345 Fenton Pkwy, San Diego, CA 92108', 425, 'UTC', '12:00:00', '12:00:00', '7', '', NULL, '[{\"day\":\"Monday\",\"start_time\":\"18:00\",\"end_time\":\"00:00\"},{\"day\":\"Tuesday\",\"start_time\":\"18:00\",\"end_time\":\"00:00\"},{\"day\":\"Wednesday\",\"start_time\":\"18:00\",\"end_time\":\"00:00\"},{\"day\":\"Thursday\",\"start_time\":\"18:00\",\"end_time\":\"00:00\"},{\"day\":\"Friday\",\"start_time\":\"18:00\",\"end_time\":\"00:00\"},{\"day\":\"Saturday\",\"start_time\":\"18:00\",\"end_time\":\"00:00\"},{\"day\":\"Sunday\",\"start_time\":\"18:00\",\"end_time\":\"00:00\"}]', 0, NULL, '2024-04-05 07:18:39', '2024-04-05 07:18:39'),
(3, 6, 'Commerce Otay Mesa & piper ranch blvd San Diego', '2020 Piper Ranch Rd San Diego, CA 92154', 425, 'UTC', '12:00:00', '12:00:00', '7', '', NULL, '[{\"day\":\"Monday\",\"start_time\":\"15:00\",\"end_time\":\"06:00\"},{\"day\":\"Tuesday\",\"start_time\":\"15:00\",\"end_time\":\"06:00\"},{\"day\":\"Wednesday\",\"start_time\":\"15:00\",\"end_time\":\"06:00\"},{\"day\":\"Thursday\",\"start_time\":\"15:00\",\"end_time\":\"06:00\"},{\"day\":\"Friday\",\"start_time\":\"15:00\",\"end_time\":\"06:00\"},{\"day\":\"Saturday\",\"start_time\":\"18:00\",\"end_time\":\"06:00\"},{\"day\":\"Sunday\",\"start_time\":\"18:00\",\"end_time\":\"06:00\"}]', 0, NULL, '2024-04-05 07:27:54', '2024-04-05 07:27:54'),
(4, 6, 'Frieghtliner San Diego', '6006 Mira Mar Rd San Diego CA', 425, 'UTC', '12:00:00', '12:00:00', '7', '', NULL, '[{\"day\":\"Monday\",\"start_time\":\"21:00\",\"end_time\":\"05:00\"},{\"day\":\"Tuesday\",\"start_time\":\"21:00\",\"end_time\":\"05:00\"},{\"day\":\"Wednesday\",\"start_time\":\"21:00\",\"end_time\":\"05:00\"},{\"day\":\"Thursday\",\"start_time\":\"21:00\",\"end_time\":\"05:00\"},{\"day\":\"Friday\",\"start_time\":\"21:00\",\"end_time\":\"05:00\"},{\"day\":\"Saturday\",\"start_time\":\"20:30\",\"end_time\":\"05:00\"},{\"day\":\"Sunday\",\"start_time\":\"20:30\",\"end_time\":\"05:00\"}]', 0, NULL, '2024-04-05 07:30:48', '2024-04-05 07:30:48'),
(5, 6, 'KZ Companies, LLC.', '3180 University Avenue, San Diego, CA 92104', 425, 'UTC', '12:00:00', '12:00:00', '7', '', NULL, '[{\"day\":\"Monday\",\"start_time\":\"08:00\",\"end_time\":\"16:00\"}]', 0, NULL, '2024-04-05 07:35:57', '2024-04-05 07:35:57'),
(6, 6, 'Lennar', 'Janal way San Diego  CA 92129 United state', 425, 'UTC', '12:00:00', '12:00:00', '7', '', NULL, '[{\"day\":\"Monday\",\"start_time\":\"16:00\",\"end_time\":\"06:00\"},{\"day\":\"Tuesday\",\"start_time\":\"16:00\",\"end_time\":\"06:00\"}]', 0, NULL, '2024-04-05 07:36:51', '2024-04-05 07:36:51'),
(7, 6, 'McCarthy Holdings Inc. \"Millenia\"', '1785 Millenia Ave Chula Vista, CA  91915', 425, 'UTC', '12:00:00', '12:00:00', '7', '', NULL, '[{\"day\":\"Monday\",\"start_time\":\"19:00\",\"end_time\":\"05:00\"},{\"day\":\"Tuesday\",\"start_time\":\"19:00\",\"end_time\":\"05:00\"},{\"day\":\"Wednesday\",\"start_time\":\"19:00\",\"end_time\":\"05:00\"},{\"day\":\"Thursday\",\"start_time\":\"19:00\",\"end_time\":\"05:00\"},{\"day\":\"Friday\",\"start_time\":\"19:00\",\"end_time\":\"05:00\"},{\"day\":\"Saturday\",\"start_time\":\"19:00\",\"end_time\":\"05:00\"},{\"day\":\"Sunday\",\"start_time\":\"19:00\",\"end_time\":\"05:00\"}]', 0, NULL, '2024-04-05 07:40:20', '2024-04-05 07:40:20'),
(8, 6, 'McCarthy Holdings \"Bioterra\"', '5897 Oberlin Drive San Diego 92121', 425, 'UTC', '12:00:00', '12:00:00', '7', '', NULL, '[{\"day\":\"Monday\",\"start_time\":\"18:30\",\"end_time\":\"04:30\"},{\"day\":\"Tuesday\",\"start_time\":\"18:30\",\"end_time\":\"04:30\"},{\"day\":\"Wednesday\",\"start_time\":\"18:30\",\"end_time\":\"04:30\"},{\"day\":\"Thursday\",\"start_time\":\"18:30\",\"end_time\":\"04:30\"},{\"day\":\"Friday\",\"start_time\":\"18:30\",\"end_time\":\"16:30\"},{\"day\":\"Saturday\",\"start_time\":\"18:30\",\"end_time\":\"04:30\"},{\"day\":\"Sunday\",\"start_time\":\"18:30\",\"end_time\":\"04:30\"}]', 0, NULL, '2024-04-05 07:42:57', '2024-04-05 07:42:57'),
(9, 6, 'Nestor Senior Village', '1120 Nestor Way San Diego, CA 92154', 425, 'UTC', '12:00:00', '12:00:00', '7', '', NULL, '[{\"day\":\"Monday\",\"start_time\":\"16:00\",\"end_time\":\"06:00\"},{\"day\":\"Tuesday\",\"start_time\":\"16:00\",\"end_time\":\"06:00\"},{\"day\":\"Wednesday\",\"start_time\":\"16:00\",\"end_time\":\"06:00\"},{\"day\":\"Thursday\",\"start_time\":\"16:00\",\"end_time\":\"06:00\"},{\"day\":\"Friday\",\"start_time\":\"16:00\",\"end_time\":\"06:00\"},{\"day\":\"Saturday\",\"start_time\":\"06:00\",\"end_time\":\"06:00\"},{\"day\":\"Sunday\",\"start_time\":\"06:00\",\"end_time\":\"06:00\"}]', 0, NULL, '2024-04-05 07:44:54', '2024-04-05 07:44:54'),
(10, 6, 'NCR \"Greenbrier Oceanside\"', '563 Greenbrier Dr. Oceanside, CA 92054', 425, 'UTC', '12:00:00', '12:00:00', '7', '', NULL, '[{\"day\":\"Monday\",\"start_time\":\"17:00\",\"end_time\":\"05:00\"},{\"day\":\"Tuesday\",\"start_time\":\"16:00\",\"end_time\":\"06:00\"},{\"day\":\"Wednesday\",\"start_time\":\"16:00\",\"end_time\":\"06:00\"},{\"day\":\"Thursday\",\"start_time\":\"16:00\",\"end_time\":\"06:00\"},{\"day\":\"Friday\",\"start_time\":\"16:00\",\"end_time\":\"06:00\"},{\"day\":\"Saturday\",\"start_time\":\"06:00\",\"end_time\":\"06:00\"},{\"day\":\"Sunday\",\"start_time\":\"06:00\",\"end_time\":\"06:00\"}]', 0, NULL, '2024-04-05 07:47:53', '2024-04-05 07:47:53'),
(11, 9, 'Pinnick, Inc #1570', 'Twin Oaks & City Drive', 425, 'UTC', '12:00:00', '12:00:00', '7', '', NULL, '[{\"day\":\"Monday\",\"start_time\":\"15:30\",\"end_time\":\"07:00\"},{\"day\":\"Tuesday\",\"start_time\":\"15:30\",\"end_time\":\"07:00\"},{\"day\":\"Wednesday\",\"start_time\":\"15:30\",\"end_time\":\"07:00\"},{\"day\":\"Thursday\",\"start_time\":\"15:30\",\"end_time\":\"07:00\"},{\"day\":\"Friday\",\"start_time\":\"15:30\",\"end_time\":\"07:00\"},{\"day\":\"Saturday\",\"start_time\":\"07:00\",\"end_time\":\"07:00\"},{\"day\":\"Sunday\",\"start_time\":\"07:00\",\"end_time\":\"07:00\"}]', 0, NULL, '2024-04-05 09:09:53', '2024-04-05 09:09:53'),
(12, 9, 'Pinnick # 1591 Oceanside', 'NO Addres', 425, 'UTC', '12:00:00', '12:00:00', '7', '', NULL, '[{\"day\":\"Monday\",\"start_time\":\"15:30\",\"end_time\":\"07:00\"},{\"day\":\"Tuesday\",\"start_time\":\"15:30\",\"end_time\":\"07:00\"},{\"day\":\"Wednesday\",\"start_time\":\"15:30\",\"end_time\":\"07:00\"},{\"day\":\"Thursday\",\"start_time\":\"15:30\",\"end_time\":\"07:00\"},{\"day\":\"Friday\",\"start_time\":\"15:30\",\"end_time\":\"07:00\"},{\"day\":\"Saturday\",\"start_time\":\"07:00\",\"end_time\":\"19:00\"},{\"day\":\"Sunday\",\"start_time\":\"07:00\",\"end_time\":\"07:00\"}]', 0, NULL, '2024-04-05 19:20:38', '2024-04-05 19:20:38'),
(13, 9, 'RD Olson Construction SpringHill Suites by Marriott', '870 Showroom Place Chula Vista, CA : 91914', 425, 'UTC', '12:00:00', '12:00:00', '7', '', NULL, '[{\"day\":\"Monday\",\"start_time\":\"18:00\",\"end_time\":\"06:00\"},{\"day\":\"Tuesday\",\"start_time\":\"18:00\",\"end_time\":\"06:00\"},{\"day\":\"Wednesday\",\"start_time\":\"18:00\",\"end_time\":\"06:00\"},{\"day\":\"Thursday\",\"start_time\":\"18:00\",\"end_time\":\"06:00\"},{\"day\":\"Friday\",\"start_time\":\"18:00\",\"end_time\":\"06:00\"},{\"day\":\"Saturday\",\"start_time\":\"06:00\",\"end_time\":\"06:00\"},{\"day\":\"Sunday\",\"start_time\":\"06:00\",\"end_time\":\"06:00\"}]', 0, NULL, '2024-04-05 19:29:28', '2024-04-05 19:29:28'),
(14, 9, 'StreAMline Development', '3090 Polk Ave San Diego, CA  92104', 425, 'UTC', '12:00:00', '12:00:00', '7', '', NULL, '[{\"day\":\"Monday\",\"start_time\":\"15:30\",\"end_time\":\"06:30\"},{\"day\":\"Tuesday\",\"start_time\":\"15:30\",\"end_time\":\"06:30\"},{\"day\":\"Wednesday\",\"start_time\":\"15:30\",\"end_time\":\"06:30\"},{\"day\":\"Thursday\",\"start_time\":\"15:30\",\"end_time\":\"06:30\"},{\"day\":\"Friday\",\"start_time\":\"15:30\",\"end_time\":\"06:30\"},{\"day\":\"Saturday\",\"start_time\":\"06:30\",\"end_time\":\"18:30\"},{\"day\":\"Sunday\",\"start_time\":\"18:30\",\"end_time\":\"06:30\"}]', 0, NULL, '2024-04-05 19:35:46', '2024-04-05 19:35:46'),
(15, 9, 'Sinanian Devlopment', '5256 Naranja St, San Diego, CA 92114, USA', 425, 'UTC', '12:00:00', '12:00:00', '7', '', NULL, '[{\"day\":\"Monday\",\"start_time\":\"18:00\",\"end_time\":\"06:00\"},{\"day\":\"Tuesday\",\"start_time\":\"18:00\",\"end_time\":\"06:00\"},{\"day\":\"Wednesday\",\"start_time\":\"18:00\",\"end_time\":\"06:00\"},{\"day\":\"Thursday\",\"start_time\":\"18:00\",\"end_time\":\"06:00\"},{\"day\":\"Friday\",\"start_time\":\"18:00\",\"end_time\":\"06:00\"},{\"day\":\"Saturday\",\"start_time\":\"18:00\",\"end_time\":\"06:00\"},{\"day\":\"Sunday\",\"start_time\":\"18:00\",\"end_time\":\"06:00\"}]', 0, NULL, '2024-04-05 19:40:32', '2024-04-05 19:40:32'),
(16, 9, 'Shea Homes Chula Vista', '(Savona) Paseo Levanten', 425, 'UTC', '12:00:00', '12:00:00', '7', '', NULL, '[{\"day\":\"Monday\",\"start_time\":\"16:00\",\"end_time\":\"07:00\"},{\"day\":\"Tuesday\",\"start_time\":\"16:00\",\"end_time\":\"07:00\"},{\"day\":\"Wednesday\",\"start_time\":\"16:00\",\"end_time\":\"07:00\"},{\"day\":\"Thursday\",\"start_time\":\"16:00\",\"end_time\":\"07:00\"},{\"day\":\"Friday\",\"start_time\":\"16:00\",\"end_time\":\"07:00\"},{\"day\":\"Saturday\",\"start_time\":\"07:00\",\"end_time\":\"07:00\"},{\"day\":\"Sunday\",\"start_time\":\"07:00\",\"end_time\":\"07:00\"}]', 0, NULL, '2024-04-05 19:47:58', '2024-04-05 19:47:58'),
(17, 9, 'Shea Homes', '1150 Quail Garden Dr. Encinitas CA', 425, 'UTC', '12:00:00', '12:00:00', '7', '', NULL, '[{\"day\":\"Monday\",\"start_time\":\"17:00\",\"end_time\":\"07:00\"},{\"day\":\"Tuesday\",\"start_time\":\"17:00\",\"end_time\":\"07:00\"},{\"day\":\"Wednesday\",\"start_time\":\"17:00\",\"end_time\":\"07:00\"},{\"day\":\"Thursday\",\"start_time\":\"17:00\",\"end_time\":\"07:00\"},{\"day\":\"Friday\",\"start_time\":\"17:00\",\"end_time\":\"07:00\"},{\"day\":\"Saturday\",\"start_time\":\"07:00\",\"end_time\":\"07:00\"},{\"day\":\"Sunday\",\"start_time\":\"07:00\",\"end_time\":\"07:00\"}]', 1, NULL, '2024-04-05 20:07:28', '2024-04-05 20:07:28'),
(18, 9, 'Timberline Construction “ McDonalds “', '1550 main Street, Ramona, CA 92683', 425, 'UTC', '12:00:00', '12:00:00', '3', '', NULL, '[{\"day\":\"Monday\",\"start_time\":\"16:30\",\"end_time\":\"07:00\"},{\"day\":\"Tuesday\",\"start_time\":\"16:30\",\"end_time\":\"07:00\"},{\"day\":\"Wednesday\",\"start_time\":\"16:30\",\"end_time\":\"07:00\"},{\"day\":\"Thursday\",\"start_time\":\"16:30\",\"end_time\":\"07:00\"},{\"day\":\"Friday\",\"start_time\":\"16:30\",\"end_time\":\"07:00\"},{\"day\":\"Saturday\",\"start_time\":\"07:00\",\"end_time\":\"07:00\"},{\"day\":\"Sunday\",\"start_time\":\"07:00\",\"end_time\":\"07:00\"}]', 0, NULL, '2024-05-08 00:18:13', '2024-05-08 23:46:11'),
(19, 9, 'Barnhart-Benson Builders, Inc. “LA Joya Commons “', '1501 Clyde Fannon Dr. Firebaugh CA 93622', 425, 'UTC', '12:00:00', '12:00:00', '3', '', NULL, '[{\"day\":\"Monday\",\"start_time\":\"15:30\",\"end_time\":\"18:30\"},{\"day\":\"Tuesday\",\"start_time\":\"15:30\",\"end_time\":\"18:30\"},{\"day\":\"Wednesday\",\"start_time\":\"15:30\",\"end_time\":\"18:30\"},{\"day\":\"Thursday\",\"start_time\":\"15:30\",\"end_time\":\"18:30\"},{\"day\":\"Friday\",\"start_time\":\"15:30\",\"end_time\":\"18:30\"},{\"day\":\"Saturday\",\"start_time\":\"06:30\",\"end_time\":\"06:30\"},{\"day\":\"Sunday\",\"start_time\":\"06:30\",\"end_time\":\"07:00\"}]', 0, NULL, '2024-05-08 23:52:26', '2024-05-08 23:53:54'),
(20, 9, 'CA Ventures', '2065 Kittridge Avenue Berkeley, CA 94704', 425, 'UTC', '12:00:00', '12:00:00', '5', '', NULL, '[{\"day\":\"Monday\",\"start_time\":\"06:00\",\"end_time\":\"06:00\"},{\"day\":\"Tuesday\",\"start_time\":\"18:00\",\"end_time\":\"06:00\"},{\"day\":\"Wednesday\",\"start_time\":\"18:00\",\"end_time\":\"06:00\"},{\"day\":\"Thursday\",\"start_time\":\"18:00\",\"end_time\":\"06:00\"},{\"day\":\"Friday\",\"start_time\":\"18:00\",\"end_time\":\"06:00\"},{\"day\":\"Saturday\",\"start_time\":\"06:00\",\"end_time\":\"06:00\"},{\"day\":\"Sunday\",\"start_time\":\"06:00\",\"end_time\":\"06:00\"}]', 0, NULL, '2024-05-09 00:00:53', '2024-05-09 00:00:53'),
(21, 10, 'Angeles Contractors, Inc.“ 5300 Crenshaw Apartments “', '3326 W. 52nd Street Los Angeles CA : 90043', 425, 'UTC', '12:00:00', '12:00:00', '4', '', NULL, '[{\"day\":\"Monday\",\"start_time\":\"15:00\",\"end_time\":\"06:00\"},{\"day\":\"Tuesday\",\"start_time\":\"15:00\",\"end_time\":\"06:00\"},{\"day\":\"Wednesday\",\"start_time\":\"15:00\",\"end_time\":\"06:00\"},{\"day\":\"Thursday\",\"start_time\":\"15:00\",\"end_time\":\"06:00\"},{\"day\":\"Friday\",\"start_time\":\"15:00\",\"end_time\":\"06:00\"},{\"day\":\"Saturday\",\"start_time\":\"06:00\",\"end_time\":\"06:00\"},{\"day\":\"Sunday\",\"start_time\":\"06:00\",\"end_time\":\"06:00\"}]', 0, NULL, '2024-05-24 16:56:55', '2024-05-24 16:56:55');

-- --------------------------------------------------------

--
-- Table structure for table `location_types`
--

CREATE TABLE `location_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `location_types`
--

INSERT INTO `location_types` (`id`, `type`, `parent_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Commercial', '0', 1, NULL, NULL),
(2, 'Construction', '0', 1, NULL, NULL),
(3, 'Los Angeles A', '2', 1, NULL, NULL),
(4, 'Los Angeles B', '2', 1, NULL, NULL),
(5, 'North', '2', 1, NULL, NULL),
(6, 'Mendota', '2', 1, NULL, NULL),
(7, 'San Diego', '2', 1, NULL, NULL),
(8, 'North', '2', 1, '2024-05-07 23:54:25', '2024-05-07 23:54:25'),
(9, 'Angeles Contractors, Inc.“ 5300 Crenshaw Apartments “', '2', 1, '2024-05-24 16:57:24', '2024-05-24 16:57:24');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2023_10_02_160808_create_countries_table', 1),
(5, '2023_10_02_160820_create_states_table', 1),
(6, '2023_10_02_160918_create_cities_table', 1),
(7, '2023_10_02_160933_create_roles_table', 1),
(8, '2023_10_03_000000_create_users_table', 1),
(9, '2023_10_04_181753_create_user_two_factors_table', 1),
(10, '2023_10_17_063524_create_time_zones_table', 1),
(12, '2023_10_17_073040_create_location_types_table', 1),
(17, '2023_11_01_061712_create_employee_categories_table', 2),
(19, '2023_10_17_073224_create_locations_table', 3),
(20, '2023_10_30_172736_create_client_locations_table', 3),
(21, '2023_10_30_173059_create_monitor_locations_table', 3),
(22, '2023_10_17_072545_create_employees_table', 4),
(24, '2023_11_14_055816_create_schedule_days_table', 5),
(29, '2023_10_18_100635_create_jobs_table', 7),
(36, '2024_01_11_063203_create_privileges_table', 13),
(38, '2024_01_11_063544_create_user_privileges_table', 14),
(40, '2023_11_14_055601_create_schedules_table', 16),
(43, '2023_11_15_063754_create_monitorings_table', 18),
(44, '2023_12_22_103520_create_time_sheets_table', 19),
(46, '2023_12_23_135546_create_confirmation_calls_table', 20);

-- --------------------------------------------------------

--
-- Table structure for table `monitorings`
--

CREATE TABLE `monitorings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `monitor_location_id` int(11) NOT NULL DEFAULT 0,
  `images` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `monitor_locations`
--

CREATE TABLE `monitor_locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `number_of_camera` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `camera_tower_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nvr` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `monitor_locations`
--

INSERT INTO `monitor_locations` (`id`, `location_id`, `number_of_camera`, `camera_tower_number`, `nvr`, `created_at`, `updated_at`) VALUES
(1, 17, '6', '545', 'yes', '2024-04-05 20:07:28', '2024-04-05 20:07:28');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `privileges`
--

CREATE TABLE `privileges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `privilige_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `privilige_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `privileges`
--

INSERT INTO `privileges` (`id`, `privilige_title`, `privilige_url`, `status`, `created_at`, `updated_at`) VALUES
(5, 'employee list', '/employee/', 1, '2024-01-11 10:05:42', NULL),
(6, 'employee edit', '/employee/{employee}/edit', 1, '2024-01-11 10:05:42', NULL),
(7, 'employee show', '/employee/{employee}', 0, '2024-01-11 10:05:42', NULL),
(8, 'employee create', '/employee/create', 1, '2024-01-11 10:05:42', NULL),
(13, 'locationType list', '/locationType/', 1, '2024-01-11 10:05:42', NULL),
(14, 'locationType edit', '/locationType/{locationType}/edit', 1, '2024-01-11 10:05:42', NULL),
(15, 'locationType show', '/locationType/{locationType}', 1, '2024-01-11 10:05:42', NULL),
(16, 'locationType create', '/locationType/create', 1, '2024-01-11 10:05:42', NULL),
(17, 'confirmation-call list', '/confirmation-call/', 1, '2024-01-11 10:05:42', NULL),
(18, 'confirmation-call edit', '/confirmation-call/{confirmation-call}/edit', 1, '2024-01-11 10:05:42', NULL),
(19, 'confirmation-call show', '/confirmation-call/{confirmation-call}', 1, '2024-01-11 10:05:42', NULL),
(20, 'confirmation-call create', '/confirmation-call/create', 1, '2024-01-11 10:05:42', NULL),
(21, 'time-sheet list', '/time-sheet/', 1, '2024-01-11 10:05:42', NULL),
(22, 'time-sheet edit', '/time-sheet/{time-sheet}/edit', 1, '2024-01-11 10:05:42', NULL),
(23, 'time-sheet show', '/time-sheet/{time-sheet}', 1, '2024-01-11 10:05:42', NULL),
(24, 'time-sheet create', '/time-sheet/create', 1, '2024-01-11 10:05:42', NULL),
(25, 'monitoring list', '/monitoring/', 1, '2024-01-11 10:05:42', NULL),
(26, 'monitoring edit', '/monitoring/{monitoring}/edit', 1, '2024-01-11 10:05:42', NULL),
(27, 'monitoring show', '/monitoring/{monitoring}', 1, '2024-01-11 10:05:42', NULL),
(28, 'monitoring create', '/monitoring/create', 1, '2024-01-11 10:05:42', NULL),
(29, 'schedule', '/schedule/', 1, '2024-01-19 12:56:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'SuperAdmin', 1, '2024-01-12 05:36:27', NULL),
(2, 'Admin', 1, '2024-01-12 05:36:31', NULL),
(3, 'User', 1, '2024-01-12 05:36:34', NULL),
(4, 'Dispatch', 1, '2024-01-12 05:32:47', NULL),
(5, 'Monitoring', 1, '2024-01-12 05:35:52', NULL),
(6, 'Time Sheet', 1, '2024-01-12 05:35:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `employee_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `start_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comments` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `user_id`, `employee_id`, `location_id`, `start_date`, `end_date`, `start_time`, `end_time`, `comments`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 6, '16', 1, '2024-04-13', '2024-04-14', '20:00', '03:00', '', '1', '2024-04-13 22:27:16', '2024-04-13 23:54:50', NULL),
(2, 6, '16', 2, '2024-04-13', '2024-04-14', '20:00', '03:00', '', '1', '2024-04-13 22:28:16', '2024-04-13 23:54:50', NULL),
(3, 6, '', 1, '2024-04-13', '2024-04-14', '20:00', '03:00', '', '1', '2024-04-13 22:28:16', '2024-04-13 22:28:16', NULL),
(4, 6, '16', 2, '2024-04-13', '2024-04-14', '15:00', '06:00', '', '1', '2024-04-13 22:28:46', '2024-04-13 23:54:50', NULL),
(5, 6, '', 1, '2024-04-13', '2024-04-14', '15:00', '06:00', '', '1', '2024-04-13 22:28:46', '2024-04-13 22:28:46', NULL),
(6, 6, '', 2, '2024-04-03', '2024-04-04', '18:00', '06:00', '', '1', '2024-04-13 22:33:51', '2024-04-13 22:33:51', NULL),
(7, 6, '', 1, '2024-04-13', '2024-04-14', '18:00', '06:00', '', '1', '2024-04-13 22:33:51', '2024-04-13 22:33:51', NULL),
(8, 6, '16', 3, '2024-04-13', '2024-04-14', '18:00', '06:00', '', '1', '2024-04-13 22:33:51', '2024-04-13 23:54:51', NULL),
(9, 6, '16', 4, '2024-04-13', '2024-04-14', '21:00', '05:00', '', '1', '2024-04-13 22:34:54', '2024-04-13 23:54:51', NULL),
(10, 6, '', 3, '2024-04-13', '2024-04-14', '21:00', '05:00', '', '1', '2024-04-13 22:34:54', '2024-04-13 22:34:54', NULL),
(11, 6, '', 2, '2024-04-03', '2024-04-04', '21:00', '05:00', '', '1', '2024-04-13 22:34:54', '2024-04-13 22:34:54', NULL),
(12, 6, '', 1, '2024-04-13', '2024-04-14', '21:00', '05:00', '', '1', '2024-04-13 22:34:54', '2024-04-13 22:34:54', NULL),
(13, 6, '', 4, '2024-04-13', '2024-04-14', '20:00', '04:00', '', '1', '2024-04-13 22:35:30', '2024-04-13 22:35:30', NULL),
(14, 6, '16', 5, '2024-04-13', '2024-04-14', '20:00', '04:00', '', '1', '2024-04-13 22:35:30', '2024-04-13 23:54:51', NULL),
(15, 6, '', 2, '2024-04-03', '2024-04-04', '20:00', '04:00', '', '1', '2024-04-13 22:35:30', '2024-04-13 22:35:30', NULL),
(16, 6, '', 3, '2024-04-13', '2024-04-14', '20:00', '04:00', '', '1', '2024-04-13 22:35:30', '2024-04-13 22:35:30', NULL),
(17, 6, '', 1, '2024-04-13', '2024-04-14', '20:00', '04:00', '', '1', '2024-04-13 22:35:30', '2024-04-13 22:35:30', NULL),
(18, 6, '', 2, '2024-04-03', '2024-04-04', '20:00', '04:00', '', '1', '2024-04-13 22:39:02', '2024-04-13 22:39:02', NULL),
(19, 6, '16', 1, '2024-04-13', '2024-04-14', '20:00', '04:00', '', '1', '2024-04-13 22:39:02', '2024-04-13 23:54:51', NULL),
(20, 6, '', 3, '2024-04-13', '2024-04-14', '20:00', '04:00', '', '1', '2024-04-13 22:39:02', '2024-04-13 22:39:02', NULL),
(21, 6, '', 4, '2024-04-13', '2024-04-14', '20:00', '04:00', '', '1', '2024-04-13 22:39:02', '2024-04-13 22:39:02', NULL),
(22, 6, '', 5, '2024-04-13', '2024-04-14', '20:00', '04:00', '', '1', '2024-04-13 22:39:02', '2024-04-13 22:39:02', NULL),
(23, 6, '16', 7, '2024-04-13', '2024-04-14', '20:00', '04:00', '', '1', '2024-04-13 22:39:02', '2024-04-13 23:54:51', NULL),
(24, 6, '', 2, '2024-04-03', '2024-04-04', '05:00', '20:00', '', '1', '2024-04-13 22:39:54', '2024-04-13 22:39:54', NULL),
(25, 6, '', 4, '2024-04-13', '2024-04-14', '05:00', '20:00', '', '1', '2024-04-13 22:39:54', '2024-04-13 22:39:54', NULL),
(26, 6, '', 1, '2024-04-13', '2024-04-14', '05:00', '20:00', '', '1', '2024-04-13 22:39:54', '2024-04-13 22:39:54', NULL),
(27, 6, '', 7, '2024-04-11', '2024-04-12', '05:00', '20:00', '', '1', '2024-04-13 22:39:54', '2024-04-13 22:39:54', NULL),
(28, 6, '', 3, '2024-04-13', '2024-04-14', '05:00', '20:00', '', '1', '2024-04-13 22:39:54', '2024-04-13 22:39:54', NULL),
(29, 6, '', 5, '2024-04-13', '2024-04-14', '05:00', '20:00', '', '1', '2024-04-13 22:39:54', '2024-04-13 22:39:54', NULL),
(30, 6, '16', 8, '2024-04-13', '2024-04-14', '05:00', '20:00', '', '1', '2024-04-13 22:39:54', '2024-04-13 23:54:51', NULL),
(31, 6, '', 2, '2024-04-03', '2024-04-04', '16:00', '06:00', '', '1', '2024-04-13 23:33:43', '2024-04-13 23:33:43', NULL),
(32, 6, '', 1, '2024-04-13', '2024-04-14', '16:00', '06:00', '', '1', '2024-04-13 23:33:43', '2024-04-13 23:33:43', NULL),
(33, 6, '', 3, '2024-04-13', '2024-04-14', '16:00', '06:00', '', '1', '2024-04-13 23:33:43', '2024-04-13 23:33:43', NULL),
(34, 6, '', 4, '2024-04-13', '2024-04-14', '16:00', '06:00', '', '1', '2024-04-13 23:33:43', '2024-04-13 23:33:43', NULL),
(35, 6, '', 5, '2024-04-13', '2024-04-14', '16:00', '06:00', '', '1', '2024-04-13 23:33:43', '2024-04-13 23:33:43', NULL),
(36, 6, '', 7, '2024-04-11', '2024-04-12', '16:00', '06:00', '', '1', '2024-04-13 23:33:43', '2024-04-13 23:33:43', NULL),
(37, 6, '', 8, '2024-04-13', '2024-04-14', '16:00', '06:00', '', '1', '2024-04-13 23:33:43', '2024-04-13 23:33:43', NULL),
(38, 6, '', 7, '2024-04-08', '2024-04-09', '16:00', '06:00', '', '1', '2024-04-13 23:33:43', '2024-04-13 23:33:43', NULL),
(39, 6, '16', 9, '2024-04-13', '2024-04-14', '16:00', '06:00', '', '1', '2024-04-13 23:33:44', '2024-04-13 23:54:51', NULL),
(40, 6, '', 4, '2024-04-13', '2024-04-14', '17:00', '05:00', '', '1', '2024-04-13 23:34:19', '2024-04-13 23:34:19', NULL),
(41, 6, '', 1, '2024-04-13', '2024-04-14', '17:00', '05:00', '', '1', '2024-04-13 23:34:19', '2024-04-13 23:34:19', NULL),
(42, 6, '', 3, '2024-04-13', '2024-04-14', '17:00', '05:00', '', '1', '2024-04-13 23:34:19', '2024-04-13 23:34:19', NULL),
(43, 6, '', 2, '2024-04-03', '2024-04-04', '17:00', '05:00', '', '1', '2024-04-13 23:34:19', '2024-04-13 23:34:19', NULL),
(44, 6, '', 5, '2024-04-13', '2024-04-14', '17:00', '05:00', '', '1', '2024-04-13 23:34:19', '2024-04-13 23:34:19', NULL),
(45, 6, '', 7, '2024-04-11', '2024-04-12', '17:00', '05:00', '', '1', '2024-04-13 23:34:19', '2024-04-13 23:34:19', NULL),
(46, 6, '', 8, '2024-04-13', '2024-04-14', '17:00', '05:00', '', '1', '2024-04-13 23:34:19', '2024-04-13 23:34:19', NULL),
(47, 6, '', 7, '2024-04-08', '2024-04-09', '17:00', '05:00', '', '1', '2024-04-13 23:34:19', '2024-04-13 23:34:19', NULL),
(48, 6, '', 9, '2024-04-13', '2024-04-14', '17:00', '05:00', '', '1', '2024-04-13 23:34:20', '2024-04-13 23:34:20', NULL),
(49, 6, '16', 10, '2024-04-13', '2024-04-14', '17:00', '05:00', '', '1', '2024-04-13 23:34:20', '2024-04-13 23:54:51', NULL),
(50, 6, '', 1, '2024-04-13', '2024-04-14', '15:30', '07:00', '', '1', '2024-04-13 23:53:15', '2024-04-13 23:53:15', NULL),
(51, 6, '', 3, '2024-04-13', '2024-04-14', '15:30', '07:00', '', '1', '2024-04-13 23:53:15', '2024-04-13 23:53:15', NULL),
(52, 6, '', 2, '2024-04-03', '2024-04-04', '15:30', '07:00', '', '1', '2024-04-13 23:53:15', '2024-04-13 23:53:15', NULL),
(53, 6, '', 7, '2024-04-11', '2024-04-12', '15:30', '07:00', '', '1', '2024-04-13 23:53:15', '2024-04-13 23:53:15', NULL),
(54, 6, '', 4, '2024-04-13', '2024-04-14', '15:30', '07:00', '', '1', '2024-04-13 23:53:15', '2024-04-13 23:53:15', NULL),
(55, 6, '', 5, '2024-04-13', '2024-04-14', '15:30', '07:00', '', '1', '2024-04-13 23:53:15', '2024-04-13 23:53:15', NULL),
(56, 6, '', 7, '2024-04-08', '2024-04-09', '15:30', '07:00', '', '1', '2024-04-13 23:53:15', '2024-04-13 23:53:15', NULL),
(57, 6, '', 8, '2024-04-13', '2024-04-14', '15:30', '07:00', '', '1', '2024-04-13 23:53:15', '2024-04-13 23:53:15', NULL),
(58, 6, '', 9, '2024-04-13', '2024-04-14', '15:30', '07:00', '', '1', '2024-04-13 23:53:16', '2024-04-13 23:53:16', NULL),
(59, 6, '', 10, '2024-04-13', '2024-04-14', '15:30', '07:00', '', '1', '2024-04-13 23:53:16', '2024-04-13 23:53:16', NULL),
(60, 9, '16', 11, '2024-04-13', '2024-04-14', '15:30', '07:00', '', '1', '2024-04-13 23:53:16', '2024-04-13 23:54:51', NULL),
(61, 6, '', 2, '2024-04-03', '2024-04-04', '15:30', '07:00', '', '1', '2024-04-13 23:53:39', '2024-04-13 23:53:39', NULL),
(62, 6, '', 1, '2024-04-13', '2024-04-14', '15:30', '07:00', '', '1', '2024-04-13 23:53:39', '2024-04-13 23:53:39', NULL),
(63, 6, '', 3, '2024-04-13', '2024-04-14', '15:30', '07:00', '', '1', '2024-04-13 23:53:39', '2024-04-13 23:53:39', NULL),
(64, 6, '', 5, '2024-04-13', '2024-04-14', '15:30', '07:00', '', '1', '2024-04-13 23:53:39', '2024-04-13 23:53:39', NULL),
(65, 6, '', 4, '2024-04-13', '2024-04-14', '15:30', '07:00', '', '1', '2024-04-13 23:53:39', '2024-04-13 23:53:39', NULL),
(66, 6, '', 7, '2024-04-11', '2024-04-12', '15:30', '07:00', '', '1', '2024-04-13 23:53:39', '2024-04-13 23:53:39', NULL),
(67, 6, '', 8, '2024-04-13', '2024-04-14', '15:30', '07:00', '', '1', '2024-04-13 23:53:40', '2024-04-13 23:53:40', NULL),
(68, 6, '', 7, '2024-04-08', '2024-04-09', '15:30', '07:00', '', '1', '2024-04-13 23:53:40', '2024-04-13 23:53:40', NULL),
(69, 6, '', 9, '2024-04-13', '2024-04-14', '15:30', '07:00', '', '1', '2024-04-13 23:53:40', '2024-04-13 23:53:40', NULL),
(70, 6, '', 10, '2024-04-13', '2024-04-14', '15:30', '07:00', '', '1', '2024-04-13 23:53:40', '2024-04-13 23:53:40', NULL),
(71, 9, '', 11, '2024-04-13', '2024-04-14', '15:30', '07:00', '', '1', '2024-04-13 23:53:40', '2024-04-13 23:53:40', NULL),
(72, 9, '16', 12, '2024-04-13', '2024-04-14', '15:30', '07:00', '', '1', '2024-04-13 23:53:40', '2024-04-13 23:54:51', NULL),
(73, 6, '', 3, '2024-04-13', '2024-04-14', '18:00', '06:00', '', '1', '2024-04-13 23:54:10', '2024-04-13 23:54:10', NULL),
(74, 6, '', 1, '2024-04-13', '2024-04-14', '18:00', '06:00', '', '1', '2024-04-13 23:54:10', '2024-04-13 23:54:10', NULL),
(75, 6, '', 4, '2024-04-13', '2024-04-14', '18:00', '06:00', '', '1', '2024-04-13 23:54:10', '2024-04-13 23:54:10', NULL),
(76, 6, '', 5, '2024-04-13', '2024-04-14', '18:00', '06:00', '', '1', '2024-04-13 23:54:11', '2024-04-13 23:54:11', NULL),
(77, 6, '', 7, '2024-04-11', '2024-04-12', '18:00', '06:00', '', '1', '2024-04-13 23:54:11', '2024-04-13 23:54:11', NULL),
(78, 6, '', 2, '2024-04-03', '2024-04-04', '18:00', '06:00', '', '1', '2024-04-13 23:54:11', '2024-04-13 23:54:11', NULL),
(79, 6, '', 8, '2024-04-13', '2024-04-14', '18:00', '06:00', '', '1', '2024-04-13 23:54:11', '2024-04-13 23:54:11', NULL),
(80, 6, '', 7, '2024-04-08', '2024-04-09', '18:00', '06:00', '', '1', '2024-04-13 23:54:11', '2024-04-13 23:54:11', NULL),
(81, 6, '', 9, '2024-04-13', '2024-04-14', '18:00', '06:00', '', '1', '2024-04-13 23:54:11', '2024-04-13 23:54:11', NULL),
(82, 6, '', 10, '2024-04-13', '2024-04-14', '18:00', '06:00', '', '1', '2024-04-13 23:54:11', '2024-04-13 23:54:11', NULL),
(83, 9, '', 11, '2024-04-13', '2024-04-14', '18:00', '06:00', '', '1', '2024-04-13 23:54:11', '2024-04-13 23:54:11', NULL),
(84, 9, '', 12, '2024-04-13', '2024-04-14', '18:00', '06:00', '', '1', '2024-04-13 23:54:11', '2024-04-13 23:54:11', NULL),
(85, 9, '16', 13, '2024-04-13', '2024-04-14', '18:00', '06:00', '', '1', '2024-04-13 23:54:12', '2024-04-13 23:54:52', NULL),
(86, 6, '7', 1, '2024-04-16', '2024-04-17', '12:22', '00:22', '', '1', '2024-04-16 07:20:57', '2024-04-16 07:21:31', NULL),
(87, 6, '7', 1, '2024-04-16', '2024-04-17', '12:22', '00:23', '', '1', '2024-04-16 07:21:25', '2024-04-16 07:21:31', NULL),
(88, 6, '2', 1, '2024-04-17', '2024-04-18', '11:49', '23:49', '', '1', '2024-04-22 06:47:53', '2024-04-22 06:48:04', NULL),
(89, 6, '3', 1, '2024-04-17', '2024-04-18', '23:49', '11:49', '', '1', '2024-04-22 06:47:59', '2024-04-22 06:48:08', NULL),
(90, 6, '2', 1, '2024-04-27', '2024-04-28', '20:53', '08:53', '', '1', '2024-04-27 15:53:13', '2024-04-27 15:53:35', NULL),
(91, 6, '7', 1, '2024-04-27', '2024-04-28', '20:57', '08:57', '', '1', '2024-04-27 15:57:19', '2024-04-27 16:01:14', NULL),
(92, 9, '4', 17, '2024-04-28', '2024-04-29', '15:00', '06:00', '', '1', '2024-04-27 20:41:31', '2024-04-27 20:59:34', NULL),
(93, 9, '4', 17, '2024-04-28', '2024-04-29', '15:00', '06:00', '', '1', '2024-04-27 20:41:48', '2024-04-27 20:41:53', NULL),
(94, 6, '25', 3, '2024-04-27', '2024-04-28', '18:00', '06:00', '', '1', '2024-04-27 20:47:31', '2024-04-27 20:47:45', NULL),
(95, 6, '', 3, '2024-04-27', '2024-04-28', '18:00', '06:00', '', '1', '2024-04-27 20:48:15', '2024-04-27 20:48:15', NULL),
(96, 6, '', 4, '2024-04-27', '2024-04-28', '18:00', '06:00', '', '1', '2024-04-27 20:48:15', '2024-04-27 20:48:15', NULL),
(97, 6, '', 4, '2024-04-27', '2024-04-28', '18:00', '06:00', '', '1', '2024-04-27 20:48:44', '2024-04-27 20:48:44', NULL),
(98, 6, '', 3, '2024-04-27', '2024-04-28', '18:00', '06:00', '', '1', '2024-04-27 20:48:44', '2024-04-27 20:48:44', NULL),
(99, 9, '4', 11, '2024-04-28', '2024-04-29', '15:00', '06:00', '', '1', '2024-04-27 20:52:37', '2024-04-27 20:53:04', NULL),
(100, 9, '4', 11, '2024-04-28', '2024-04-29', '15:00', '06:00', '', '1', '2024-04-27 20:52:51', '2024-04-27 20:53:10', NULL),
(101, 6, '4', 1, '2024-04-28', '2024-04-29', '14:02', '02:02', '', '1', '2024-04-27 21:02:04', '2024-04-27 21:52:05', NULL),
(102, 6, '3', 1, '2024-04-26', '2024-04-27', '14:02', '02:02', '', '1', '2024-04-27 21:02:16', '2024-04-27 21:02:25', NULL),
(103, 6, '4', 1, '2024-04-26', '2024-04-27', '14:02', '02:02', '', '1', '2024-04-27 21:02:21', '2024-04-27 21:02:34', NULL),
(104, 6, '6', 1, '2024-04-26', '2024-04-27', '14:02', '02:02', '', '1', '2024-04-27 21:02:44', '2024-04-27 21:02:48', NULL),
(105, 9, '26', 15, '2024-04-28', '2024-04-29', '18:00', '06:00', '', '1', '2024-04-27 21:39:37', '2024-04-27 21:39:43', NULL),
(106, 9, '24', 15, '2024-04-28', '2024-04-29', '18:00', '06:00', '', '1', '2024-04-27 21:39:54', '2024-04-27 21:40:04', NULL),
(107, 6, '', 1, '2024-04-28', '2024-04-29', '02:30', '18:30', '', '1', '2024-04-27 21:52:32', '2024-04-27 21:52:32', NULL),
(108, 9, '3', 16, '2024-04-21', '2024-04-22', '17:00', '07:00', '', '1', '2024-04-27 22:37:47', '2024-04-27 22:37:52', NULL),
(109, 6, '3', 1, '2024-05-03', '2024-05-04', '16:30', '04:30', '', '1', '2024-05-03 11:29:07', '2024-05-03 11:29:25', NULL),
(110, 6, '4', 1, '2024-05-03', '2024-05-04', '04:30', '16:30', '', '1', '2024-05-03 11:29:19', '2024-05-03 11:29:33', NULL),
(111, 9, '8', 12, '2024-04-29', '2024-04-30', '15:30', '19:00', '', '1', '2024-05-07 23:23:18', '2024-05-07 23:23:51', NULL),
(112, 9, '4', 12, '2024-05-01', '2024-05-02', '15:30', '07:00', '', '1', '2024-05-07 23:25:38', '2024-05-07 23:25:43', NULL),
(113, 9, '19', 18, '2024-04-29', '2024-04-30', '16:30', '07:00', '', '1', '2024-05-08 00:21:38', '2024-05-08 00:21:54', NULL),
(114, 6, '22', 1, '2024-05-06', '2024-05-07', '22:59', '03:00', '', '1', '2024-05-08 05:37:15', '2024-05-08 05:37:36', NULL),
(115, 9, '3', 12, '2024-05-13', '2024-05-14', '12:39', '04:42', '', '1', '2024-05-08 05:38:31', '2024-05-08 05:38:38', NULL),
(116, 9, '', 12, '2024-05-13', '2024-05-14', '23:39', '04:44', '', '1', '2024-05-08 05:39:19', '2024-05-08 05:39:19', NULL),
(117, 9, '3', 11, '2024-05-13', '2024-05-14', '23:39', '04:44', '', '1', '2024-05-08 05:39:19', '2024-05-08 05:39:25', NULL),
(118, 6, '28', 1, '2024-05-07', '2024-05-08', '23:41', '02:41', '', '1', '2024-05-08 05:41:55', '2024-05-08 05:42:06', NULL),
(119, 6, '2', 1, '2024-05-08', '2024-05-09', '20:00', '03:00', '', '1', '2024-05-08 23:59:22', '2024-05-09 00:08:34', NULL),
(120, 6, '6', 2, '2024-05-08', '2024-05-09', '18:00', '00:00', '', '1', '2024-05-09 00:08:50', '2024-05-09 00:08:53', NULL),
(121, 6, '6', 2, '2024-05-08', '2024-05-09', '18:00', '00:00', '', '1', '2024-05-09 00:09:05', '2024-05-09 00:09:14', NULL),
(122, 6, '', 2, '2024-05-08', '2024-05-09', '18:00', '00:00', '', '1', '2024-05-09 00:11:26', '2024-05-09 00:11:26', NULL),
(123, 6, '6', 3, '2024-05-08', '2024-05-09', '18:00', '00:00', '', '1', '2024-05-09 00:11:26', '2024-05-09 00:11:46', NULL),
(124, 6, '', 4, '2024-05-08', '2024-05-09', '18:00', '00:00', '', '1', '2024-05-09 00:12:15', '2024-05-09 00:12:15', NULL),
(125, 9, '4', 18, '2024-05-03', '2024-05-04', '15:00', '07:00', '', '1', '2024-05-09 08:10:24', '2024-05-09 08:10:30', NULL),
(126, 9, '7', 13, '2024-05-10', '2024-05-11', '14:00', '22:00', '', '1', '2024-05-10 18:11:31', '2024-05-10 18:11:36', NULL),
(127, 6, '19', 10, '2024-05-10', '2024-05-11', '17:00', '05:00', '', '1', '2024-05-10 18:18:27', '2024-05-10 18:18:30', NULL),
(128, 6, '11', 8, '2024-05-10', '2024-05-11', '19:00', '05:00', '', '1', '2024-05-10 18:38:59', '2024-05-10 18:39:04', NULL),
(129, 6, '', 8, '2024-05-10', '2024-05-11', '19:00', '05:00', '', '1', '2024-05-10 18:39:37', '2024-05-10 18:39:37', NULL),
(130, 6, '6', 3, '2024-05-10', '2024-05-11', '15:00', '06:00', '', '1', '2024-05-10 18:40:19', '2024-05-10 18:40:24', NULL),
(131, 6, '', 5, '2024-05-10', '2024-05-11', '15:00', '06:00', '', '1', '2024-05-10 18:40:19', '2024-05-10 18:40:19', NULL),
(132, 6, '', 5, '2024-05-10', '2024-05-11', '15:00', '06:00', '', '1', '2024-05-10 18:40:33', '2024-05-10 18:40:33', NULL),
(133, 6, '', 3, '2024-05-10', '2024-05-11', '15:00', '06:00', '', '1', '2024-05-10 18:40:33', '2024-05-10 18:40:33', NULL),
(134, 6, '4', 1, '2024-05-13', '2024-05-14', '15:57', '03:57', '', '1', '2024-05-13 10:56:16', '2024-05-13 10:56:21', NULL),
(135, 6, '9', 1, '2024-04-29', '2024-04-30', '22:00', '03:00', '', '1', '2024-05-15 07:46:09', '2024-05-15 07:46:19', NULL),
(136, 9, '18', 20, '2024-05-15', '2024-05-16', '18:00', '06:00', '', '1', '2024-05-15 16:01:13', '2024-05-15 16:01:21', NULL),
(137, 9, '', 20, '2024-05-15', '2024-05-16', '15:30', '06:00', '', '1', '2024-05-15 16:02:30', '2024-05-15 16:02:30', NULL),
(138, 9, '22', 19, '2024-05-15', '2024-05-16', '15:30', '06:00', '', '1', '2024-05-15 16:02:30', '2024-05-15 16:02:37', NULL),
(139, 9, '', 19, '2024-05-14', '2024-05-15', '16:00', '06:00', '', '1', '2024-05-15 16:02:50', '2024-05-15 16:02:50', NULL),
(140, 9, '', 20, '2024-05-15', '2024-05-16', '16:00', '06:00', '', '1', '2024-05-15 16:02:50', '2024-05-15 16:02:50', NULL),
(141, 9, '14', 17, '2024-05-15', '2024-05-16', '16:00', '06:00', '', '1', '2024-05-15 16:02:50', '2024-05-15 16:02:57', NULL),
(142, 6, '9', 1, '2024-05-15', '2024-05-16', '15:30', '06:00', '', '1', '2024-05-15 16:07:23', '2024-05-15 16:07:29', NULL),
(143, 6, '10', 2, '2024-05-15', '2024-05-16', '18:00', '06:00', '', '1', '2024-05-15 16:07:47', '2024-05-15 16:07:51', NULL),
(144, 6, '', 1, '2024-05-15', '2024-05-16', '18:00', '06:00', '', '1', '2024-05-15 16:07:47', '2024-05-15 16:07:47', NULL),
(145, 6, '', 1, '2024-05-15', '2024-05-16', '15:00', '06:00', '', '1', '2024-05-15 16:08:05', '2024-05-15 16:08:05', NULL),
(146, 6, '', 2, '2024-05-15', '2024-05-16', '15:00', '06:00', '', '1', '2024-05-15 16:08:05', '2024-05-15 16:08:05', NULL),
(147, 6, '12', 3, '2024-05-15', '2024-05-16', '15:00', '06:00', '', '1', '2024-05-15 16:08:05', '2024-05-15 16:08:10', NULL),
(148, 6, '', 2, '2024-05-15', '2024-05-16', '21:00', '05:00', '', '1', '2024-05-15 16:08:26', '2024-05-15 16:08:26', NULL),
(149, 6, '', 3, '2024-05-15', '2024-05-16', '21:00', '05:00', '', '1', '2024-05-15 16:08:26', '2024-05-15 16:08:26', NULL),
(150, 6, '', 1, '2024-05-15', '2024-05-16', '21:00', '05:00', '', '1', '2024-05-15 16:08:26', '2024-05-15 16:08:26', NULL),
(151, 6, '', 4, '2024-05-15', '2024-05-16', '21:00', '05:00', '', '1', '2024-05-15 16:08:26', '2024-05-15 16:08:26', NULL),
(152, 6, '3', 1, '2024-05-16', '2024-05-17', '03:34', '15:34', '', '1', '2024-05-16 10:33:24', '2024-05-16 10:33:28', NULL),
(153, 6, '20', 1, '2024-05-24', '2024-05-25', '22:00', '03:00', '', '1', '2024-05-24 17:02:08', '2024-05-24 17:02:53', NULL),
(154, 6, '', 1, '2024-05-24', '2024-05-25', '18:00', '00:00', '', '1', '2024-05-24 17:03:09', '2024-05-24 17:03:09', NULL),
(155, 6, '15', 2, '2024-05-24', '2024-05-25', '18:00', '00:00', '', '1', '2024-05-24 17:03:09', '2024-05-24 17:03:17', NULL),
(156, 6, '', 2, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:03:28', '2024-05-24 17:03:28', NULL),
(157, 6, '', 1, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:03:28', '2024-05-24 17:03:28', NULL),
(158, 6, '26', 3, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:03:29', '2024-05-24 17:04:01', NULL),
(159, 6, '25', 3, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:03:41', '2024-05-24 17:04:06', NULL),
(160, 6, '', 2, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:03:41', '2024-05-24 17:03:41', NULL),
(161, 6, '', 1, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:03:41', '2024-05-24 17:03:41', NULL),
(162, 6, '', 1, '2024-05-24', '2024-05-25', '21:00', '05:00', '', '1', '2024-05-24 17:04:19', '2024-05-24 17:04:19', NULL),
(163, 6, '', 2, '2024-05-24', '2024-05-25', '21:00', '05:00', '', '1', '2024-05-24 17:04:19', '2024-05-24 17:04:19', NULL),
(164, 6, '', 3, '2024-05-24', '2024-05-25', '21:00', '05:00', '', '1', '2024-05-24 17:04:19', '2024-05-24 17:04:19', NULL),
(165, 6, '6', 4, '2024-05-24', '2024-05-25', '21:00', '05:00', '', '1', '2024-05-24 17:04:19', '2024-05-24 17:04:30', NULL),
(166, 6, '', 1, '2024-05-24', '2024-05-25', '08:00', '16:00', '', '1', '2024-05-24 17:04:44', '2024-05-24 17:04:44', NULL),
(167, 6, '', 2, '2024-05-24', '2024-05-25', '08:00', '16:00', '', '1', '2024-05-24 17:04:44', '2024-05-24 17:04:44', NULL),
(168, 6, '', 4, '2024-05-24', '2024-05-25', '08:00', '16:00', '', '1', '2024-05-24 17:04:44', '2024-05-24 17:04:44', NULL),
(169, 6, '', 3, '2024-05-24', '2024-05-25', '08:00', '16:00', '', '1', '2024-05-24 17:04:44', '2024-05-24 17:04:44', NULL),
(170, 6, '8', 5, '2024-05-24', '2024-05-25', '08:00', '16:00', '', '1', '2024-05-24 17:04:44', '2024-05-24 17:04:49', NULL),
(171, 6, '', 1, '2024-05-24', '2024-05-25', '16:00', '07:00', '', '1', '2024-05-24 17:05:10', '2024-05-24 17:05:10', NULL),
(172, 6, '', 5, '2024-05-24', '2024-05-25', '16:00', '07:00', '', '1', '2024-05-24 17:05:10', '2024-05-24 17:05:10', NULL),
(173, 6, '', 4, '2024-05-24', '2024-05-25', '16:00', '07:00', '', '1', '2024-05-24 17:05:10', '2024-05-24 17:05:10', NULL),
(174, 6, '', 2, '2024-05-24', '2024-05-25', '16:00', '07:00', '', '1', '2024-05-24 17:05:10', '2024-05-24 17:05:10', NULL),
(175, 6, '', 3, '2024-05-24', '2024-05-25', '16:00', '07:00', '', '1', '2024-05-24 17:05:10', '2024-05-24 17:05:10', NULL),
(176, 6, '11', 6, '2024-05-24', '2024-05-25', '16:00', '07:00', '', '1', '2024-05-24 17:05:10', '2024-05-24 17:05:26', NULL),
(177, 6, '', 1, '2024-05-24', '2024-05-25', '19:00', '05:00', '', '1', '2024-05-24 17:05:35', '2024-05-24 17:05:35', NULL),
(178, 6, '', 4, '2024-05-24', '2024-05-25', '19:00', '05:00', '', '1', '2024-05-24 17:05:35', '2024-05-24 17:05:35', NULL),
(179, 6, '', 5, '2024-05-24', '2024-05-25', '19:00', '05:00', '', '1', '2024-05-24 17:05:35', '2024-05-24 17:05:35', NULL),
(180, 6, '', 3, '2024-05-24', '2024-05-25', '19:00', '05:00', '', '1', '2024-05-24 17:05:36', '2024-05-24 17:05:36', NULL),
(181, 6, '', 2, '2024-05-24', '2024-05-25', '19:00', '05:00', '', '1', '2024-05-24 17:05:36', '2024-05-24 17:05:36', NULL),
(182, 6, '', 6, '2024-05-24', '2024-05-25', '19:00', '05:00', '', '1', '2024-05-24 17:05:36', '2024-05-24 17:05:36', NULL),
(183, 6, '4', 7, '2024-05-24', '2024-05-25', '19:00', '05:00', '', '1', '2024-05-24 17:05:36', '2024-05-24 17:05:41', NULL),
(184, 6, '', 2, '2024-05-24', '2024-05-25', '18:30', '04:30', '', '1', '2024-05-24 17:05:59', '2024-05-24 17:05:59', NULL),
(185, 6, '', 1, '2024-05-24', '2024-05-25', '18:30', '04:30', '', '1', '2024-05-24 17:05:59', '2024-05-24 17:05:59', NULL),
(186, 6, '', 6, '2024-05-24', '2024-05-25', '18:30', '04:30', '', '1', '2024-05-24 17:05:59', '2024-05-24 17:05:59', NULL),
(187, 6, '', 5, '2024-05-24', '2024-05-25', '18:30', '04:30', '', '1', '2024-05-24 17:05:59', '2024-05-24 17:05:59', NULL),
(188, 6, '', 4, '2024-05-24', '2024-05-25', '18:30', '04:30', '', '1', '2024-05-24 17:05:59', '2024-05-24 17:05:59', NULL),
(189, 6, '', 3, '2024-05-24', '2024-05-25', '18:30', '04:30', '', '1', '2024-05-24 17:05:59', '2024-05-24 17:05:59', NULL),
(190, 6, '', 7, '2024-05-24', '2024-05-25', '18:30', '04:30', '', '1', '2024-05-24 17:05:59', '2024-05-24 17:05:59', NULL),
(191, 6, '14', 8, '2024-05-24', '2024-05-25', '18:30', '04:30', '', '1', '2024-05-24 17:05:59', '2024-05-24 17:06:03', NULL),
(192, 6, '', 1, '2024-05-24', '2024-05-25', '16:00', '06:00', '', '1', '2024-05-24 17:06:19', '2024-05-24 17:06:19', NULL),
(193, 6, '', 2, '2024-05-24', '2024-05-25', '16:00', '06:00', '', '1', '2024-05-24 17:06:19', '2024-05-24 17:06:19', NULL),
(194, 6, '', 3, '2024-05-24', '2024-05-25', '16:00', '06:00', '', '1', '2024-05-24 17:06:19', '2024-05-24 17:06:19', NULL),
(195, 6, '', 4, '2024-05-24', '2024-05-25', '16:00', '06:00', '', '1', '2024-05-24 17:06:19', '2024-05-24 17:06:19', NULL),
(196, 6, '', 5, '2024-05-24', '2024-05-25', '16:00', '06:00', '', '1', '2024-05-24 17:06:19', '2024-05-24 17:06:19', NULL),
(197, 6, '', 6, '2024-05-24', '2024-05-25', '16:00', '06:00', '', '1', '2024-05-24 17:06:19', '2024-05-24 17:06:19', NULL),
(198, 6, '23', 9, '2024-05-24', '2024-05-25', '16:00', '06:00', '', '1', '2024-05-24 17:06:20', '2024-05-24 17:06:38', NULL),
(199, 6, '', 8, '2024-05-24', '2024-05-25', '16:00', '06:00', '', '1', '2024-05-24 17:06:20', '2024-05-24 17:06:20', NULL),
(200, 6, '', 7, '2024-05-24', '2024-05-25', '16:00', '06:00', '', '1', '2024-05-24 17:06:20', '2024-05-24 17:06:20', NULL),
(201, 6, '', 5, '2024-05-24', '2024-05-25', '17:00', '05:00', '', '1', '2024-05-24 17:06:51', '2024-05-24 17:06:51', NULL),
(202, 6, '', 2, '2024-05-24', '2024-05-25', '17:00', '05:00', '', '1', '2024-05-24 17:06:51', '2024-05-24 17:06:51', NULL),
(203, 6, '', 3, '2024-05-24', '2024-05-25', '17:00', '05:00', '', '1', '2024-05-24 17:06:51', '2024-05-24 17:06:51', NULL),
(204, 6, '', 4, '2024-05-24', '2024-05-25', '17:00', '05:00', '', '1', '2024-05-24 17:06:51', '2024-05-24 17:06:51', NULL),
(205, 6, '', 6, '2024-05-24', '2024-05-25', '17:00', '05:00', '', '1', '2024-05-24 17:06:51', '2024-05-24 17:06:51', NULL),
(206, 6, '', 1, '2024-05-24', '2024-05-25', '17:00', '05:00', '', '1', '2024-05-24 17:06:51', '2024-05-24 17:06:51', NULL),
(207, 6, '', 7, '2024-05-24', '2024-05-25', '17:00', '05:00', '', '1', '2024-05-24 17:06:51', '2024-05-24 17:06:51', NULL),
(208, 6, '', 8, '2024-05-24', '2024-05-25', '17:00', '05:00', '', '1', '2024-05-24 17:06:51', '2024-05-24 17:06:51', NULL),
(209, 6, '', 9, '2024-05-24', '2024-05-25', '17:00', '05:00', '', '1', '2024-05-24 17:06:51', '2024-05-24 17:06:51', NULL),
(210, 6, '17', 10, '2024-05-24', '2024-05-25', '17:00', '05:00', '', '1', '2024-05-24 17:06:51', '2024-05-24 17:06:59', NULL),
(211, 6, '', 1, '2024-05-24', '2024-05-25', '15:30', '07:00', '', '1', '2024-05-24 17:07:12', '2024-05-24 17:07:12', NULL),
(212, 6, '', 2, '2024-05-24', '2024-05-25', '15:30', '07:00', '', '1', '2024-05-24 17:07:12', '2024-05-24 17:07:12', NULL),
(213, 6, '', 5, '2024-05-24', '2024-05-25', '15:30', '07:00', '', '1', '2024-05-24 17:07:12', '2024-05-24 17:07:12', NULL),
(214, 6, '', 4, '2024-05-24', '2024-05-25', '15:30', '07:00', '', '1', '2024-05-24 17:07:12', '2024-05-24 17:07:12', NULL),
(215, 6, '', 6, '2024-05-24', '2024-05-25', '15:30', '07:00', '', '1', '2024-05-24 17:07:12', '2024-05-24 17:07:12', NULL),
(216, 6, '', 3, '2024-05-24', '2024-05-25', '15:30', '07:00', '', '1', '2024-05-24 17:07:12', '2024-05-24 17:07:12', NULL),
(217, 6, '', 8, '2024-05-24', '2024-05-25', '15:30', '07:00', '', '1', '2024-05-24 17:07:13', '2024-05-24 17:07:13', NULL),
(218, 6, '', 9, '2024-05-24', '2024-05-25', '15:30', '07:00', '', '1', '2024-05-24 17:07:13', '2024-05-24 17:07:13', NULL),
(219, 6, '', 7, '2024-05-24', '2024-05-25', '15:30', '07:00', '', '1', '2024-05-24 17:07:13', '2024-05-24 17:07:13', NULL),
(220, 6, '', 10, '2024-05-24', '2024-05-25', '15:30', '07:00', '', '1', '2024-05-24 17:07:13', '2024-05-24 17:07:13', NULL),
(221, 9, '19', 11, '2024-05-24', '2024-05-25', '15:30', '07:00', '', '1', '2024-05-24 17:07:13', '2024-05-24 17:07:21', NULL),
(222, 6, '', 2, '2024-05-24', '2024-05-25', '15:30', '07:00', '', '1', '2024-05-24 17:07:31', '2024-05-24 17:07:31', NULL),
(223, 6, '', 4, '2024-05-24', '2024-05-25', '15:30', '07:00', '', '1', '2024-05-24 17:07:31', '2024-05-24 17:07:31', NULL),
(224, 6, '', 3, '2024-05-24', '2024-05-25', '15:30', '07:00', '', '1', '2024-05-24 17:07:31', '2024-05-24 17:07:31', NULL),
(225, 6, '', 1, '2024-05-24', '2024-05-25', '15:30', '07:00', '', '1', '2024-05-24 17:07:31', '2024-05-24 17:07:31', NULL),
(226, 6, '', 6, '2024-05-24', '2024-05-25', '15:30', '07:00', '', '1', '2024-05-24 17:07:31', '2024-05-24 17:07:31', NULL),
(227, 6, '', 5, '2024-05-24', '2024-05-25', '15:30', '07:00', '', '1', '2024-05-24 17:07:31', '2024-05-24 17:07:31', NULL),
(228, 6, '', 7, '2024-05-24', '2024-05-25', '15:30', '07:00', '', '1', '2024-05-24 17:07:31', '2024-05-24 17:07:31', NULL),
(229, 6, '', 8, '2024-05-24', '2024-05-25', '15:30', '07:00', '', '1', '2024-05-24 17:07:31', '2024-05-24 17:07:31', NULL),
(230, 6, '', 9, '2024-05-24', '2024-05-25', '15:30', '07:00', '', '1', '2024-05-24 17:07:31', '2024-05-24 17:07:31', NULL),
(231, 9, '', 11, '2024-05-24', '2024-05-25', '15:30', '07:00', '', '1', '2024-05-24 17:07:32', '2024-05-24 17:07:32', NULL),
(232, 6, '', 10, '2024-05-24', '2024-05-25', '15:30', '07:00', '', '1', '2024-05-24 17:07:32', '2024-05-24 17:07:32', NULL),
(233, 9, '2', 12, '2024-05-24', '2024-05-25', '15:30', '07:00', '', '1', '2024-05-24 17:07:32', '2024-05-24 17:07:35', NULL),
(234, 6, '', 5, '2024-05-24', '2024-05-25', '18:00', '06:00', '', '1', '2024-05-24 17:07:47', '2024-05-24 17:07:47', NULL),
(235, 6, '', 3, '2024-05-24', '2024-05-25', '18:00', '06:00', '', '1', '2024-05-24 17:07:47', '2024-05-24 17:07:47', NULL),
(236, 6, '', 4, '2024-05-24', '2024-05-25', '18:00', '06:00', '', '1', '2024-05-24 17:07:47', '2024-05-24 17:07:47', NULL),
(237, 6, '', 2, '2024-05-24', '2024-05-25', '18:00', '06:00', '', '1', '2024-05-24 17:07:48', '2024-05-24 17:07:48', NULL),
(238, 6, '', 6, '2024-05-24', '2024-05-25', '18:00', '06:00', '', '1', '2024-05-24 17:07:48', '2024-05-24 17:07:48', NULL),
(239, 6, '', 1, '2024-05-24', '2024-05-25', '18:00', '06:00', '', '1', '2024-05-24 17:07:48', '2024-05-24 17:07:48', NULL),
(240, 6, '', 7, '2024-05-24', '2024-05-25', '18:00', '06:00', '', '1', '2024-05-24 17:07:48', '2024-05-24 17:07:48', NULL),
(241, 6, '', 8, '2024-05-24', '2024-05-25', '18:00', '06:00', '', '1', '2024-05-24 17:07:48', '2024-05-24 17:07:48', NULL),
(242, 6, '7', 9, '2024-05-24', '2024-05-25', '18:00', '06:00', '', '1', '2024-05-24 17:07:48', '2024-05-24 17:12:37', NULL),
(243, 6, '', 10, '2024-05-24', '2024-05-25', '18:00', '06:00', '', '1', '2024-05-24 17:07:48', '2024-05-24 17:07:48', NULL),
(244, 9, '', 12, '2024-05-24', '2024-05-25', '18:00', '06:00', '', '1', '2024-05-24 17:07:48', '2024-05-24 17:07:48', NULL),
(245, 9, '', 11, '2024-05-24', '2024-05-25', '18:00', '06:00', '', '1', '2024-05-24 17:07:48', '2024-05-24 17:07:48', NULL),
(246, 9, '21', 13, '2024-05-24', '2024-05-25', '18:00', '06:00', '', '1', '2024-05-24 17:07:48', '2024-05-24 17:07:55', NULL),
(247, 6, '', 2, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:08:17', '2024-05-24 17:08:17', NULL),
(248, 6, '', 1, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:08:17', '2024-05-24 17:08:17', NULL),
(249, 6, '', 5, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:08:17', '2024-05-24 17:08:17', NULL),
(250, 6, '', 4, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:08:17', '2024-05-24 17:08:17', NULL),
(251, 6, '', 6, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:08:17', '2024-05-24 17:08:17', NULL),
(252, 6, '', 3, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:08:17', '2024-05-24 17:08:17', NULL),
(253, 6, '', 7, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:08:17', '2024-05-24 17:08:17', NULL),
(254, 6, '', 9, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:08:17', '2024-05-24 17:08:17', NULL),
(255, 6, '', 8, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:08:17', '2024-05-24 17:08:17', NULL),
(256, 9, '', 11, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:08:17', '2024-05-24 17:08:17', NULL),
(257, 9, '', 12, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:08:17', '2024-05-24 17:08:17', NULL),
(258, 6, '', 10, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:08:17', '2024-05-24 17:08:17', NULL),
(259, 9, '', 13, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:08:18', '2024-05-24 17:08:18', NULL),
(260, 9, '5', 15, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:08:18', '2024-05-24 17:08:31', NULL),
(261, 6, '', 3, '2024-05-24', '2024-05-25', '16:00', '06:00', '', '1', '2024-05-24 17:08:44', '2024-05-24 17:08:44', NULL),
(262, 6, '', 6, '2024-05-24', '2024-05-25', '16:00', '06:00', '', '1', '2024-05-24 17:08:44', '2024-05-24 17:08:44', NULL),
(263, 6, '', 5, '2024-05-24', '2024-05-25', '16:00', '06:00', '', '1', '2024-05-24 17:08:44', '2024-05-24 17:08:44', NULL),
(264, 6, '', 2, '2024-05-24', '2024-05-25', '16:00', '06:00', '', '1', '2024-05-24 17:08:44', '2024-05-24 17:08:44', NULL),
(265, 6, '', 4, '2024-05-24', '2024-05-25', '16:00', '06:00', '', '1', '2024-05-24 17:08:44', '2024-05-24 17:08:44', NULL),
(266, 6, '', 1, '2024-05-24', '2024-05-25', '16:00', '06:00', '', '1', '2024-05-24 17:08:44', '2024-05-24 17:08:44', NULL),
(267, 6, '', 9, '2024-05-24', '2024-05-25', '16:00', '06:00', '', '1', '2024-05-24 17:08:44', '2024-05-24 17:08:44', NULL),
(268, 6, '18', 7, '2024-05-24', '2024-05-25', '16:00', '06:00', '', '1', '2024-05-24 17:08:44', '2024-05-24 17:12:29', NULL),
(269, 6, '13', 8, '2024-05-24', '2024-05-25', '16:00', '06:00', '', '1', '2024-05-24 17:08:44', '2024-05-24 17:12:22', NULL),
(270, 9, '', 12, '2024-05-24', '2024-05-25', '16:00', '06:00', '', '1', '2024-05-24 17:08:44', '2024-05-24 17:08:44', NULL),
(271, 6, '', 10, '2024-05-24', '2024-05-25', '16:00', '06:00', '', '1', '2024-05-24 17:08:44', '2024-05-24 17:08:44', NULL),
(272, 9, '', 11, '2024-05-24', '2024-05-25', '16:00', '06:00', '', '1', '2024-05-24 17:08:44', '2024-05-24 17:08:44', NULL),
(273, 9, '', 15, '2024-05-24', '2024-05-25', '16:00', '06:00', '', '1', '2024-05-24 17:08:44', '2024-05-24 17:08:44', NULL),
(274, 9, '', 13, '2024-05-24', '2024-05-25', '16:00', '06:00', '', '1', '2024-05-24 17:08:44', '2024-05-24 17:08:44', NULL),
(275, 9, '10', 16, '2024-05-24', '2024-05-25', '16:00', '06:00', '', '1', '2024-05-24 17:08:44', '2024-05-24 17:08:51', NULL),
(276, 6, '', 2, '2024-05-24', '2024-05-25', '16:00', '07:00', '', '1', '2024-05-24 17:09:12', '2024-05-24 17:09:12', NULL),
(277, 6, '', 1, '2024-05-24', '2024-05-25', '16:00', '07:00', '', '1', '2024-05-24 17:09:12', '2024-05-24 17:09:12', NULL),
(278, 6, '', 6, '2024-05-24', '2024-05-25', '16:00', '07:00', '', '1', '2024-05-24 17:09:12', '2024-05-24 17:09:12', NULL),
(279, 6, '', 3, '2024-05-24', '2024-05-25', '16:00', '07:00', '', '1', '2024-05-24 17:09:12', '2024-05-24 17:09:12', NULL),
(280, 6, '', 4, '2024-05-24', '2024-05-25', '16:00', '07:00', '', '1', '2024-05-24 17:09:12', '2024-05-24 17:09:12', NULL),
(281, 6, '', 5, '2024-05-24', '2024-05-25', '16:00', '07:00', '', '1', '2024-05-24 17:09:12', '2024-05-24 17:09:12', NULL),
(282, 6, '', 7, '2024-05-24', '2024-05-25', '16:00', '07:00', '', '1', '2024-05-24 17:09:13', '2024-05-24 17:09:13', NULL),
(283, 6, '', 8, '2024-05-24', '2024-05-25', '16:00', '07:00', '', '1', '2024-05-24 17:09:13', '2024-05-24 17:09:13', NULL),
(284, 6, '', 9, '2024-05-24', '2024-05-25', '16:00', '07:00', '', '1', '2024-05-24 17:09:13', '2024-05-24 17:09:13', NULL),
(285, 9, '', 12, '2024-05-24', '2024-05-25', '16:00', '07:00', '', '1', '2024-05-24 17:09:13', '2024-05-24 17:09:13', NULL),
(286, 9, '', 11, '2024-05-24', '2024-05-25', '16:00', '07:00', '', '1', '2024-05-24 17:09:13', '2024-05-24 17:09:13', NULL),
(287, 6, '', 10, '2024-05-24', '2024-05-25', '16:00', '07:00', '', '1', '2024-05-24 17:09:13', '2024-05-24 17:09:13', NULL),
(288, 9, '', 15, '2024-05-24', '2024-05-25', '16:00', '07:00', '', '1', '2024-05-24 17:09:13', '2024-05-24 17:09:13', NULL),
(289, 9, '', 13, '2024-05-24', '2024-05-25', '16:00', '07:00', '', '1', '2024-05-24 17:09:13', '2024-05-24 17:09:13', NULL),
(290, 9, '', 16, '2024-05-24', '2024-05-25', '16:00', '07:00', '', '1', '2024-05-24 17:09:13', '2024-05-24 17:09:13', NULL),
(291, 9, '3', 17, '2024-05-24', '2024-05-25', '16:00', '07:00', '', '1', '2024-05-24 17:09:13', '2024-05-24 17:09:25', NULL),
(292, 6, '', 3, '2024-05-24', '2024-05-25', '17:00', '06:00', '', '1', '2024-05-24 17:09:38', '2024-05-24 17:09:38', NULL),
(293, 6, '', 2, '2024-05-24', '2024-05-25', '17:00', '06:00', '', '1', '2024-05-24 17:09:38', '2024-05-24 17:09:38', NULL),
(294, 6, '', 4, '2024-05-24', '2024-05-25', '17:00', '06:00', '', '1', '2024-05-24 17:09:38', '2024-05-24 17:09:38', NULL),
(295, 6, '', 6, '2024-05-24', '2024-05-25', '17:00', '06:00', '', '1', '2024-05-24 17:09:38', '2024-05-24 17:09:38', NULL),
(296, 6, '', 5, '2024-05-24', '2024-05-25', '17:00', '06:00', '', '1', '2024-05-24 17:09:38', '2024-05-24 17:09:38', NULL),
(297, 6, '', 1, '2024-05-24', '2024-05-25', '17:00', '06:00', '', '1', '2024-05-24 17:09:38', '2024-05-24 17:09:38', NULL),
(298, 6, '', 9, '2024-05-24', '2024-05-25', '17:00', '06:00', '', '1', '2024-05-24 17:09:38', '2024-05-24 17:09:38', NULL),
(299, 6, '', 8, '2024-05-24', '2024-05-25', '17:00', '06:00', '', '1', '2024-05-24 17:09:38', '2024-05-24 17:09:38', NULL),
(300, 6, '', 7, '2024-05-24', '2024-05-25', '17:00', '06:00', '', '1', '2024-05-24 17:09:38', '2024-05-24 17:09:38', NULL),
(301, 6, '', 10, '2024-05-24', '2024-05-25', '17:00', '06:00', '', '1', '2024-05-24 17:09:38', '2024-05-24 17:09:38', NULL),
(302, 9, '', 11, '2024-05-24', '2024-05-25', '17:00', '06:00', '', '1', '2024-05-24 17:09:38', '2024-05-24 17:09:38', NULL),
(303, 9, '', 12, '2024-05-24', '2024-05-25', '17:00', '06:00', '', '1', '2024-05-24 17:09:38', '2024-05-24 17:09:38', NULL),
(304, 9, '', 13, '2024-05-24', '2024-05-25', '17:00', '06:00', '', '1', '2024-05-24 17:09:39', '2024-05-24 17:09:39', NULL),
(305, 9, '', 15, '2024-05-24', '2024-05-25', '17:00', '06:00', '', '1', '2024-05-24 17:09:39', '2024-05-24 17:09:39', NULL),
(306, 9, '', 17, '2024-05-24', '2024-05-25', '17:00', '06:00', '', '1', '2024-05-24 17:09:39', '2024-05-24 17:09:39', NULL),
(307, 9, '22', 18, '2024-05-24', '2024-05-25', '17:00', '06:00', '', '1', '2024-05-24 17:09:39', '2024-05-24 17:09:47', NULL),
(308, 9, '', 16, '2024-05-24', '2024-05-25', '17:00', '06:00', '', '1', '2024-05-24 17:09:39', '2024-05-24 17:09:39', NULL),
(309, 6, '', 5, '2024-05-24', '2024-05-25', '15:30', '06:30', '', '1', '2024-05-24 17:09:59', '2024-05-24 17:09:59', NULL),
(310, 6, '', 3, '2024-05-24', '2024-05-25', '15:30', '06:30', '', '1', '2024-05-24 17:09:59', '2024-05-24 17:09:59', NULL),
(311, 6, '', 6, '2024-05-24', '2024-05-25', '15:30', '06:30', '', '1', '2024-05-24 17:09:59', '2024-05-24 17:09:59', NULL),
(312, 6, '', 4, '2024-05-24', '2024-05-25', '15:30', '06:30', '', '1', '2024-05-24 17:09:59', '2024-05-24 17:09:59', NULL),
(313, 6, '', 1, '2024-05-24', '2024-05-25', '15:30', '06:30', '', '1', '2024-05-24 17:09:59', '2024-05-24 17:09:59', NULL),
(314, 6, '', 2, '2024-05-24', '2024-05-25', '15:30', '06:30', '', '1', '2024-05-24 17:09:59', '2024-05-24 17:09:59', NULL),
(315, 6, '', 7, '2024-05-24', '2024-05-25', '15:30', '06:30', '', '1', '2024-05-24 17:09:59', '2024-05-24 17:09:59', NULL),
(316, 6, '', 8, '2024-05-24', '2024-05-25', '15:30', '06:30', '', '1', '2024-05-24 17:09:59', '2024-05-24 17:09:59', NULL),
(317, 6, '', 9, '2024-05-24', '2024-05-25', '15:30', '06:30', '', '1', '2024-05-24 17:09:59', '2024-05-24 17:09:59', NULL),
(318, 9, '24', 12, '2024-05-24', '2024-05-25', '15:30', '06:30', '', '1', '2024-05-24 17:09:59', '2024-05-24 17:12:44', NULL),
(319, 9, '', 11, '2024-05-24', '2024-05-25', '15:30', '06:30', '', '1', '2024-05-24 17:09:59', '2024-05-24 17:09:59', NULL),
(320, 6, '', 10, '2024-05-24', '2024-05-25', '15:30', '06:30', '', '1', '2024-05-24 17:09:59', '2024-05-24 17:09:59', NULL),
(321, 9, '', 15, '2024-05-24', '2024-05-25', '15:30', '06:30', '', '1', '2024-05-24 17:09:59', '2024-05-24 17:09:59', NULL),
(322, 9, '', 13, '2024-05-24', '2024-05-25', '15:30', '06:30', '', '1', '2024-05-24 17:09:59', '2024-05-24 17:09:59', NULL),
(323, 9, '', 16, '2024-05-24', '2024-05-25', '15:30', '06:30', '', '1', '2024-05-24 17:10:00', '2024-05-24 17:10:00', NULL),
(324, 9, '', 17, '2024-05-24', '2024-05-25', '15:30', '06:30', '', '1', '2024-05-24 17:10:00', '2024-05-24 17:10:00', NULL),
(325, 9, '', 18, '2024-05-24', '2024-05-25', '15:30', '06:30', '', '1', '2024-05-24 17:10:00', '2024-05-24 17:10:00', NULL),
(326, 9, '16', 19, '2024-05-24', '2024-05-25', '15:30', '06:30', '', '1', '2024-05-24 17:10:00', '2024-05-24 17:10:12', NULL),
(327, 6, '', 2, '2024-05-24', '2024-05-25', '18:00', '06:00', '', '1', '2024-05-24 17:10:27', '2024-05-24 17:10:27', NULL),
(328, 6, '', 1, '2024-05-24', '2024-05-25', '18:00', '06:00', '', '1', '2024-05-24 17:10:27', '2024-05-24 17:10:27', NULL),
(329, 6, '', 6, '2024-05-24', '2024-05-25', '18:00', '06:00', '', '1', '2024-05-24 17:10:27', '2024-05-24 17:10:27', NULL),
(330, 6, '', 3, '2024-05-24', '2024-05-25', '18:00', '06:00', '', '1', '2024-05-24 17:10:27', '2024-05-24 17:10:27', NULL),
(331, 6, '', 5, '2024-05-24', '2024-05-25', '18:00', '06:00', '', '1', '2024-05-24 17:10:27', '2024-05-24 17:10:27', NULL),
(332, 6, '', 4, '2024-05-24', '2024-05-25', '18:00', '06:00', '', '1', '2024-05-24 17:10:27', '2024-05-24 17:10:27', NULL),
(333, 6, '', 8, '2024-05-24', '2024-05-25', '18:00', '06:00', '', '1', '2024-05-24 17:10:28', '2024-05-24 17:10:28', NULL),
(334, 6, '', 7, '2024-05-24', '2024-05-25', '18:00', '06:00', '', '1', '2024-05-24 17:10:28', '2024-05-24 17:10:28', NULL),
(335, 6, '', 9, '2024-05-24', '2024-05-25', '18:00', '06:00', '', '1', '2024-05-24 17:10:28', '2024-05-24 17:10:28', NULL),
(336, 9, '', 12, '2024-05-24', '2024-05-25', '18:00', '06:00', '', '1', '2024-05-24 17:10:28', '2024-05-24 17:10:28', NULL),
(337, 6, '', 10, '2024-05-24', '2024-05-25', '18:00', '06:00', '', '1', '2024-05-24 17:10:28', '2024-05-24 17:10:28', NULL),
(338, 9, '', 11, '2024-05-24', '2024-05-25', '18:00', '06:00', '', '1', '2024-05-24 17:10:28', '2024-05-24 17:10:28', NULL),
(339, 9, '', 13, '2024-05-24', '2024-05-25', '18:00', '06:00', '', '1', '2024-05-24 17:10:28', '2024-05-24 17:10:28', NULL),
(340, 9, '', 15, '2024-05-24', '2024-05-25', '18:00', '06:00', '', '1', '2024-05-24 17:10:28', '2024-05-24 17:10:28', NULL),
(341, 9, '', 17, '2024-05-24', '2024-05-25', '18:00', '06:00', '', '1', '2024-05-24 17:10:28', '2024-05-24 17:10:28', NULL),
(342, 9, '', 18, '2024-05-24', '2024-05-25', '18:00', '06:00', '', '1', '2024-05-24 17:10:28', '2024-05-24 17:10:28', NULL),
(343, 9, '', 16, '2024-05-24', '2024-05-25', '18:00', '06:00', '', '1', '2024-05-24 17:10:28', '2024-05-24 17:10:28', NULL),
(344, 9, '27', 20, '2024-05-24', '2024-05-25', '18:00', '06:00', '', '1', '2024-05-24 17:10:28', '2024-05-24 17:10:36', NULL),
(345, 9, '', 19, '2024-05-24', '2024-05-25', '18:00', '06:00', '', '1', '2024-05-24 17:10:28', '2024-05-24 17:10:28', NULL),
(346, 6, '', 3, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:10:53', '2024-05-24 17:10:53', NULL),
(347, 6, '', 2, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:10:53', '2024-05-24 17:10:53', NULL),
(348, 6, '', 4, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:10:53', '2024-05-24 17:10:53', NULL),
(349, 6, '', 1, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:10:53', '2024-05-24 17:10:53', NULL),
(350, 6, '', 6, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:10:53', '2024-05-24 17:10:53', NULL),
(351, 6, '', 5, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:10:53', '2024-05-24 17:10:53', NULL),
(352, 6, '', 7, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:10:53', '2024-05-24 17:10:53', NULL),
(353, 6, '', 8, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:10:53', '2024-05-24 17:10:53', NULL),
(354, 6, '', 9, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:10:53', '2024-05-24 17:10:53', NULL),
(355, 6, '', 10, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:10:53', '2024-05-24 17:10:53', NULL),
(356, 9, '9', 12, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:10:53', '2024-05-24 17:11:50', NULL),
(357, 9, '', 11, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:10:53', '2024-05-24 17:10:53', NULL),
(358, 9, '', 13, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:10:53', '2024-05-24 17:10:53', NULL),
(359, 9, '', 15, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:10:53', '2024-05-24 17:10:53', NULL),
(360, 9, '', 16, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:10:53', '2024-05-24 17:10:53', NULL),
(361, 9, '', 18, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:10:53', '2024-05-24 17:10:53', NULL),
(362, 9, '', 17, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:10:53', '2024-05-24 17:10:53', NULL),
(363, 9, '', 20, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:10:54', '2024-05-24 17:10:54', NULL),
(364, 9, '', 19, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:10:54', '2024-05-24 17:10:54', NULL),
(365, 10, '29', 21, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:10:54', '2024-05-24 17:11:13', NULL),
(366, 6, '', 1, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:11:22', '2024-05-24 17:11:22', NULL),
(367, 6, '', 5, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:11:22', '2024-05-24 17:11:22', NULL),
(368, 6, '', 6, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:11:22', '2024-05-24 17:11:22', NULL),
(369, 6, '', 2, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:11:22', '2024-05-24 17:11:22', NULL),
(370, 6, '', 4, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:11:22', '2024-05-24 17:11:22', NULL),
(371, 6, '', 3, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:11:22', '2024-05-24 17:11:22', NULL),
(372, 6, '', 8, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:11:23', '2024-05-24 17:11:23', NULL),
(373, 6, '', 7, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:11:23', '2024-05-24 17:11:23', NULL),
(374, 6, '', 9, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:11:23', '2024-05-24 17:11:23', NULL),
(375, 9, '', 12, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:11:23', '2024-05-24 17:11:23', NULL),
(376, 9, '', 11, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:11:23', '2024-05-24 17:11:23', NULL),
(377, 6, '', 10, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:11:23', '2024-05-24 17:11:23', NULL),
(378, 9, '', 13, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:11:23', '2024-05-24 17:11:23', NULL),
(379, 9, '', 15, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:11:23', '2024-05-24 17:11:23', NULL),
(380, 9, '', 18, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:11:23', '2024-05-24 17:11:23', NULL),
(381, 9, '', 16, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:11:23', '2024-05-24 17:11:23', NULL),
(382, 9, '', 17, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:11:23', '2024-05-24 17:11:23', NULL),
(383, 9, '', 20, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:11:23', '2024-05-24 17:11:23', NULL),
(384, 9, '', 19, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:11:23', '2024-05-24 17:11:23', NULL),
(385, 10, '28', 21, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:11:23', '2024-05-24 17:11:30', NULL),
(386, 6, '', 5, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:12:08', '2024-05-24 17:12:08', NULL),
(387, 6, '', 1, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:12:08', '2024-05-24 17:12:08', NULL),
(388, 6, '', 6, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:12:08', '2024-05-24 17:12:08', NULL),
(389, 6, '', 2, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:12:08', '2024-05-24 17:12:08', NULL),
(390, 6, '', 3, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:12:08', '2024-05-24 17:12:08', NULL),
(391, 6, '', 4, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:12:08', '2024-05-24 17:12:08', NULL),
(392, 6, '', 7, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:12:08', '2024-05-24 17:12:08', NULL),
(393, 6, '', 9, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:12:08', '2024-05-24 17:12:08', NULL),
(394, 6, '', 8, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:12:08', '2024-05-24 17:12:08', NULL),
(395, 9, '', 12, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:12:08', '2024-05-24 17:12:08', NULL),
(396, 9, '', 11, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:12:08', '2024-05-24 17:12:08', NULL),
(397, 6, '', 10, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:12:08', '2024-05-24 17:12:08', NULL),
(398, 9, '', 15, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:12:09', '2024-05-24 17:12:09', NULL),
(399, 9, '', 13, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:12:09', '2024-05-24 17:12:09', NULL),
(400, 9, '', 17, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:12:09', '2024-05-24 17:12:09', NULL),
(401, 9, '', 16, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:12:09', '2024-05-24 17:12:09', NULL),
(402, 9, '', 18, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:12:09', '2024-05-24 17:12:09', NULL),
(403, 9, '', 20, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:12:09', '2024-05-24 17:12:09', NULL),
(404, 9, '', 19, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:12:09', '2024-05-24 17:12:09', NULL),
(405, 10, '', 21, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:12:09', '2024-05-24 17:12:09', NULL),
(406, 9, '12', 14, '2024-05-24', '2024-05-25', '15:00', '06:00', '', '1', '2024-05-24 17:12:09', '2024-05-24 17:12:15', NULL);
INSERT INTO `schedules` (`id`, `user_id`, `employee_id`, `location_id`, `start_date`, `end_date`, `start_time`, `end_time`, `comments`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(407, 6, '31', 1, '2024-06-01', '2024-06-02', '16:00', '06:00', '', '1', '2024-06-01 17:32:51', '2024-06-01 17:32:56', NULL),
(408, 6, '32', 1, '2024-06-01', '2024-06-02', '16:00', '06:00', '', '1', '2024-06-01 17:33:12', '2024-06-01 17:33:24', NULL),
(409, 6, '', 1, '2024-06-01', '2024-06-02', '16:00', '06:00', '', '1', '2024-06-01 17:33:38', '2024-06-01 17:33:38', NULL),
(410, 6, '30', 5, '2024-06-01', '2024-06-02', '16:00', '06:00', '', '1', '2024-06-01 17:33:39', '2024-06-01 17:33:45', NULL),
(411, 6, '', 1, '2024-06-01', '2024-06-02', '15:00', '06:00', '', '1', '2024-06-01 17:34:02', '2024-06-01 17:34:02', NULL),
(412, 6, '', 5, '2024-06-01', '2024-06-02', '15:00', '06:00', '', '1', '2024-06-01 17:34:02', '2024-06-01 17:34:02', NULL),
(413, 6, '3', 3, '2024-06-01', '2024-06-02', '15:00', '06:00', '', '1', '2024-06-01 17:34:03', '2024-06-01 17:34:36', NULL),
(414, 6, '2', 3, '2024-06-01', '2024-06-02', '18:00', '08:00', '', '1', '2024-06-01 17:34:28', '2024-06-01 17:34:33', NULL),
(415, 6, '', 5, '2024-06-01', '2024-06-02', '18:00', '08:00', '', '1', '2024-06-01 17:34:28', '2024-06-01 17:34:28', NULL),
(416, 6, '', 1, '2024-06-01', '2024-06-02', '18:00', '08:00', '', '1', '2024-06-01 17:34:28', '2024-06-01 17:34:28', NULL),
(417, 6, '6', 2, '2024-06-01', '2024-06-02', '18:00', '00:00', '', '1', '2024-06-01 17:36:11', '2024-06-01 17:36:14', NULL),
(418, 6, '3', 1, '2024-06-07', '2024-06-08', '04:55', '16:55', '', '1', '2024-06-07 11:54:36', '2024-06-07 11:54:41', NULL),
(419, 6, '3', 6, '2024-06-26', '2024-06-27', '21:12', '09:12', '', '1', '2024-06-26 16:12:35', '2024-06-26 16:12:41', NULL),
(420, 6, '2', 3, '2024-06-26', '2024-06-27', '09:14', '21:14', '', '1', '2024-06-26 16:14:31', '2024-06-26 16:14:39', NULL),
(421, 6, '5', 1, '2024-06-26', '2024-06-27', '20:00', '04:00', '', '1', '2024-06-26 16:20:45', '2024-06-26 16:20:49', NULL),
(422, 6, '', 1, '2024-06-26', '2024-06-27', '20:00', '05:00', '', '1', '2024-06-26 16:21:06', '2024-06-26 16:21:06', NULL),
(423, 6, '6', 4, '2024-06-26', '2024-06-27', '20:00', '05:00', '', '1', '2024-06-26 16:21:07', '2024-06-26 16:21:18', NULL),
(424, 6, '', 4, '2024-06-26', '2024-06-27', '18:00', '00:00', '', '1', '2024-06-26 16:21:33', '2024-06-26 16:21:33', NULL),
(425, 6, '', 1, '2024-06-26', '2024-06-27', '18:00', '00:00', '', '1', '2024-06-26 16:21:33', '2024-06-26 16:21:33', NULL),
(426, 6, '15', 2, '2024-06-26', '2024-06-27', '18:00', '00:00', '', '1', '2024-06-26 16:21:33', '2024-06-26 16:21:41', NULL),
(427, 6, '8', 7, '2024-06-26', '2024-06-27', '18:00', '00:00', '', '1', '2024-06-26 20:06:30', '2024-06-26 20:06:35', NULL),
(428, 6, '', 7, '2024-06-26', '2024-06-27', '16:00', '06:00', '', '1', '2024-06-26 20:07:59', '2024-06-26 20:07:59', NULL),
(429, 6, '18', 9, '2024-06-26', '2024-06-27', '16:00', '06:00', '', '1', '2024-06-26 20:07:59', '2024-06-26 20:08:02', NULL),
(430, 10, '4', 21, '2024-07-02', '2024-07-03', '06:33', '18:33', '', '1', '2024-07-02 13:32:03', '2024-07-02 13:32:52', NULL),
(431, 6, '7', 1, '2024-07-02', '2024-07-03', '06:34', '18:34', '', '1', '2024-07-02 13:33:21', '2024-07-02 13:33:28', NULL),
(432, 6, '5', 1, '2024-07-03', '2024-07-04', '07:35', '19:35', '', '1', '2024-07-03 14:35:18', '2024-07-03 14:35:23', NULL),
(433, 6, '', 1, '2024-07-03', '2024-07-04', '19:35', '07:35', '', '1', '2024-07-03 14:35:35', '2024-07-03 14:35:35', NULL),
(434, 6, '4', 2, '2024-07-03', '2024-07-04', '19:35', '07:35', '', '1', '2024-07-03 14:35:35', '2024-07-03 14:35:39', NULL),
(435, 6, '20', 1, '2024-07-04', '2024-07-05', '18:00', '06:00', '', '1', '2024-07-03 16:23:41', '2024-07-03 16:24:16', NULL),
(436, 6, '26', 1, '2024-07-04', '2024-07-05', '06:00', '18:00', '', '1', '2024-07-03 16:23:55', '2024-07-03 16:24:29', NULL),
(437, 6, '6', 6, '2024-07-03', '2024-07-04', '12:00', '23:00', '', '1', '2024-07-03 16:36:07', '2024-07-03 16:36:12', NULL),
(438, 6, '3', 2, '2024-07-04', '2024-07-05', '03:17', '15:17', '', '1', '2024-07-04 10:16:30', '2024-07-04 10:16:36', NULL),
(439, 6, '3', 1, '2024-07-05', '2024-07-06', '17:00', '06:00', '', '1', '2024-07-06 18:07:36', '2024-07-06 18:07:40', NULL),
(440, 6, '2', 1, '2024-07-06', '2024-07-07', '06:00', '17:00', '', '1', '2024-07-06 18:07:50', '2024-07-06 18:07:53', NULL),
(441, 6, '4', 2, '2024-07-05', '2024-07-06', '18:00', '02:00', '', '1', '2024-07-06 18:09:26', '2024-07-06 18:09:50', NULL),
(442, 6, '', 1, '2024-07-06', '2024-07-07', '18:00', '02:00', '', '1', '2024-07-06 18:09:26', '2024-07-06 18:09:26', NULL),
(443, 6, '5', 2, '2024-07-06', '2024-07-07', '03:00', '18:00', '', '1', '2024-07-06 18:09:39', '2024-07-06 18:09:56', NULL),
(444, 6, '', 1, '2024-07-06', '2024-07-07', '03:00', '18:00', '', '1', '2024-07-06 18:09:39', '2024-07-06 18:09:39', NULL),
(445, 6, '', 1, '2024-07-06', '2024-07-07', '15:00', '06:00', '', '1', '2024-07-06 18:10:16', '2024-07-06 18:10:16', NULL),
(446, 6, '', 2, '2024-07-06', '2024-07-07', '15:00', '06:00', '', '1', '2024-07-06 18:10:16', '2024-07-06 18:10:16', NULL),
(447, 6, '6', 3, '2024-07-05', '2024-07-06', '15:00', '06:00', '', '1', '2024-07-06 18:10:17', '2024-07-06 18:10:39', NULL),
(448, 6, '', 1, '2024-07-06', '2024-07-07', '19:00', '06:00', '', '1', '2024-07-06 18:10:35', '2024-07-06 18:10:35', NULL),
(449, 6, '7', 3, '2024-07-06', '2024-07-07', '19:00', '06:00', '', '1', '2024-07-06 18:10:35', '2024-07-06 18:10:46', NULL),
(450, 6, '', 2, '2024-07-06', '2024-07-07', '19:00', '06:00', '', '1', '2024-07-06 18:10:35', '2024-07-06 18:10:35', NULL),
(451, 6, '', 3, '2024-07-06', '2024-07-07', '15:00', '06:00', '', '1', '2024-07-06 18:11:05', '2024-07-06 18:11:05', NULL),
(452, 6, '', 1, '2024-07-06', '2024-07-07', '15:00', '06:00', '', '1', '2024-07-06 18:11:05', '2024-07-06 18:11:05', NULL),
(453, 6, '', 2, '2024-07-06', '2024-07-07', '15:00', '06:00', '', '1', '2024-07-06 18:11:05', '2024-07-06 18:11:05', NULL),
(454, 6, '8', 5, '2024-07-05', '2024-07-06', '15:00', '06:00', '', '1', '2024-07-06 18:11:06', '2024-07-06 18:15:02', NULL),
(455, 6, '', 3, '2024-07-06', '2024-07-07', '06:00', '18:00', '', '1', '2024-07-06 18:14:49', '2024-07-06 18:14:49', NULL),
(456, 6, '', 2, '2024-07-06', '2024-07-07', '06:00', '18:00', '', '1', '2024-07-06 18:14:49', '2024-07-06 18:14:49', NULL),
(457, 6, '', 1, '2024-07-06', '2024-07-07', '06:00', '18:00', '', '1', '2024-07-06 18:14:49', '2024-07-06 18:14:49', NULL),
(458, 6, '3', 5, '2024-07-06', '2024-07-07', '06:00', '18:00', '', '1', '2024-07-06 18:14:49', '2024-07-06 18:15:09', NULL),
(459, 6, '', 5, '2024-07-06', '2024-07-07', '20:00', '04:00', '', '1', '2024-07-06 18:15:30', '2024-07-06 18:15:30', NULL),
(460, 6, '', 1, '2024-07-06', '2024-07-07', '20:00', '04:00', '', '1', '2024-07-06 18:15:30', '2024-07-06 18:15:30', NULL),
(461, 6, '', 3, '2024-07-06', '2024-07-07', '20:00', '04:00', '', '1', '2024-07-06 18:15:30', '2024-07-06 18:15:30', NULL),
(462, 6, '', 2, '2024-07-06', '2024-07-07', '20:00', '04:00', '', '1', '2024-07-06 18:15:30', '2024-07-06 18:15:30', NULL),
(463, 6, '15', 6, '2024-07-05', '2024-07-06', '20:00', '04:00', '', '1', '2024-07-06 18:15:30', '2024-07-06 18:15:34', NULL),
(464, 6, '', 5, '2024-07-06', '2024-07-07', '18:00', '02:00', '', '1', '2024-07-06 18:15:47', '2024-07-06 18:15:47', NULL),
(465, 6, '14', 6, '2024-07-06', '2024-07-07', '18:00', '02:00', '', '1', '2024-07-06 18:15:47', '2024-07-06 18:17:21', NULL),
(466, 6, '', 1, '2024-07-06', '2024-07-07', '18:00', '02:00', '', '1', '2024-07-06 18:15:47', '2024-07-06 18:15:47', NULL),
(467, 6, '', 3, '2024-07-06', '2024-07-07', '18:00', '02:00', '', '1', '2024-07-06 18:15:47', '2024-07-06 18:15:47', NULL),
(468, 6, '', 2, '2024-07-06', '2024-07-07', '18:00', '02:00', '', '1', '2024-07-06 18:15:47', '2024-07-06 18:15:47', NULL),
(469, 6, '', 3, '2024-07-06', '2024-07-07', '19:00', '03:00', '', '1', '2024-07-06 18:17:48', '2024-07-06 18:17:48', NULL),
(470, 6, '', 2, '2024-07-06', '2024-07-07', '19:00', '03:00', '', '1', '2024-07-06 18:17:48', '2024-07-06 18:17:48', NULL),
(471, 6, '', 6, '2024-07-06', '2024-07-07', '19:00', '03:00', '', '1', '2024-07-06 18:17:48', '2024-07-06 18:17:48', NULL),
(472, 6, '', 5, '2024-07-06', '2024-07-07', '19:00', '03:00', '', '1', '2024-07-06 18:17:48', '2024-07-06 18:17:48', NULL),
(473, 6, '', 1, '2024-07-06', '2024-07-07', '19:00', '03:00', '', '1', '2024-07-06 18:17:48', '2024-07-06 18:17:48', NULL),
(474, 6, '12', 7, '2024-07-05', '2024-07-06', '19:00', '03:00', '', '1', '2024-07-06 18:17:48', '2024-07-06 18:17:55', NULL),
(475, 6, '', 5, '2024-07-06', '2024-07-07', '16:00', '22:00', '', '1', '2024-07-06 18:18:13', '2024-07-06 18:18:13', NULL),
(476, 6, '', 2, '2024-07-06', '2024-07-07', '16:00', '22:00', '', '1', '2024-07-06 18:18:13', '2024-07-06 18:18:13', NULL),
(477, 6, '', 1, '2024-07-06', '2024-07-07', '16:00', '22:00', '', '1', '2024-07-06 18:18:13', '2024-07-06 18:18:13', NULL),
(478, 6, '', 6, '2024-07-06', '2024-07-07', '16:00', '22:00', '', '1', '2024-07-06 18:18:13', '2024-07-06 18:18:13', NULL),
(479, 6, '', 3, '2024-07-06', '2024-07-07', '16:00', '22:00', '', '1', '2024-07-06 18:18:13', '2024-07-06 18:18:13', NULL),
(480, 6, '13', 7, '2024-07-06', '2024-07-07', '16:00', '22:00', '', '1', '2024-07-06 18:18:13', '2024-07-06 18:18:21', NULL),
(481, 6, '', 1, '2024-07-06', '2024-07-07', '20:00', '05:00', '', '1', '2024-07-06 18:18:35', '2024-07-06 18:18:35', NULL),
(482, 6, '', 2, '2024-07-06', '2024-07-07', '20:00', '05:00', '', '1', '2024-07-06 18:18:35', '2024-07-06 18:18:35', NULL),
(483, 6, '', 5, '2024-07-06', '2024-07-07', '20:00', '05:00', '', '1', '2024-07-06 18:18:35', '2024-07-06 18:18:35', NULL),
(484, 6, '', 6, '2024-07-06', '2024-07-07', '20:00', '05:00', '', '1', '2024-07-06 18:18:35', '2024-07-06 18:18:35', NULL),
(485, 6, '', 3, '2024-07-06', '2024-07-07', '20:00', '05:00', '', '1', '2024-07-06 18:18:35', '2024-07-06 18:18:35', NULL),
(486, 6, '17', 8, '2024-07-05', '2024-07-06', '20:00', '05:00', '', '1', '2024-07-06 18:18:36', '2024-07-06 18:18:40', NULL),
(487, 6, '', 7, '2024-07-06', '2024-07-07', '20:00', '05:00', '', '1', '2024-07-06 18:18:36', '2024-07-06 18:18:36', NULL),
(488, 6, '', 2, '2024-07-06', '2024-07-07', '05:00', '22:00', '', '1', '2024-07-06 18:19:10', '2024-07-06 18:19:10', NULL),
(489, 6, '', 1, '2024-07-06', '2024-07-07', '05:00', '22:00', '', '1', '2024-07-06 18:19:10', '2024-07-06 18:19:10', NULL),
(490, 6, '', 6, '2024-07-06', '2024-07-07', '05:00', '22:00', '', '1', '2024-07-06 18:19:10', '2024-07-06 18:19:10', NULL),
(491, 6, '', 5, '2024-07-06', '2024-07-07', '05:00', '22:00', '', '1', '2024-07-06 18:19:10', '2024-07-06 18:19:10', NULL),
(492, 6, '', 3, '2024-07-06', '2024-07-07', '05:00', '22:00', '', '1', '2024-07-06 18:19:10', '2024-07-06 18:19:10', NULL),
(493, 6, '21', 8, '2024-07-06', '2024-07-07', '05:00', '22:00', '', '1', '2024-07-06 18:19:11', '2024-07-06 18:19:20', NULL),
(494, 6, '', 7, '2024-07-06', '2024-07-07', '05:00', '22:00', '', '1', '2024-07-06 18:19:11', '2024-07-06 18:19:11', NULL),
(495, 6, '2', 1, '2024-07-10', '2024-07-11', '19:00', '03:00', '', '1', '2024-07-10 18:58:54', '2024-07-10 18:59:05', NULL),
(496, 6, '4', 6, '2024-07-11', '2024-07-12', '20:00', '04:00', '', '1', '2024-07-10 19:00:27', '2024-07-10 19:00:39', NULL),
(497, 9, '14', 17, '2024-07-11', '2024-07-12', '01:00', '17:00', '', '1', '2024-07-10 20:15:14', '2024-07-10 20:15:20', NULL),
(498, 9, '8', 12, '2024-07-25', '2024-07-26', '16:00', '07:30', '', '1', '2024-07-24 17:14:54', '2024-07-24 17:15:20', NULL),
(499, 9, '6', 12, '2024-07-25', '2024-07-26', '07:30', '16:00', '', '1', '2024-07-24 17:15:13', '2024-07-24 17:15:28', NULL),
(500, 6, '2', 1, '2024-08-08', '2024-08-09', '04:10', '16:10', '', '1', '2024-08-08 11:10:06', '2024-08-08 11:10:10', NULL),
(501, 6, '3', 1, '2024-08-08', '2024-08-09', '04:10', '16:10', '', '1', '2024-08-08 11:10:17', '2024-08-08 11:10:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `schedule_days`
--

CREATE TABLE `schedule_days` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `schedule_id` bigint(20) UNSIGNED NOT NULL,
  `day` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `country_id`, `name`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'SINDH', NULL, '2023-10-31 09:41:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `time_sheets`
--

CREATE TABLE `time_sheets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `schedule_id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `check_in_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `check_out_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_approved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `time_sheets`
--

INSERT INTO `time_sheets` (`id`, `user_id`, `schedule_id`, `employee_id`, `location_id`, `check_in_time`, `check_out_time`, `notes`, `is_approved`, `created_at`, `updated_at`) VALUES
(1, 1, 439, 3, 1, '12:00', NULL, NULL, 0, '2024-07-06 18:25:36', '2024-07-06 18:25:36'),
(2, 1, 440, 2, 1, NULL, '12:02', 'Check Out', 0, '2024-07-06 18:25:55', '2024-07-06 18:25:55'),
(3, 1, 447, 6, 3, '20:00', NULL, 'Check In', 0, '2024-07-06 18:27:01', '2024-07-06 18:27:01'),
(4, 1, 441, 19, 2, '17:00', NULL, NULL, 0, '2024-07-06 18:28:31', '2024-07-06 18:28:31'),
(5, 1, 454, 8, 5, '20:05', NULL, 'Check In', 0, '2024-07-06 18:30:06', '2024-07-06 18:30:06'),
(6, 1, 463, 15, 6, '21:08', NULL, 'Check In', 0, '2024-07-06 18:31:01', '2024-07-06 18:31:01'),
(7, 1, 474, 12, 7, '22:12', NULL, 'Check In', 0, '2024-07-06 18:31:47', '2024-07-06 18:31:47'),
(8, 1, 480, 13, 7, '20:30', NULL, 'Check In', 0, '2024-07-06 18:32:03', '2024-07-06 18:32:03'),
(9, 1, 486, 17, 8, '20:45', NULL, 'Check In', 0, '2024-07-06 18:32:41', '2024-07-06 18:32:41'),
(10, 1, 495, 2, 1, '21:00', NULL, 'at location', 0, '2024-07-10 19:05:31', '2024-07-10 19:05:31'),
(11, 1, 500, 2, 1, '04:10', NULL, '{\"check_in_note\":\"sasas\",\"check_out_note\":\"\"}', 0, '2024-08-08 11:10:59', '2024-08-08 11:10:59');

-- --------------------------------------------------------

--
-- Table structure for table `time_zones`
--

CREATE TABLE `time_zones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `timezone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `time_zones`
--

INSERT INTO `time_zones` (`id`, `timezone`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Africa/Abidjan', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(2, 'Africa/Accra', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(3, 'Africa/Addis_Ababa', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(4, 'Africa/Algiers', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(5, 'Africa/Asmara', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(6, 'Africa/Bamako', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(7, 'Africa/Bangui', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(8, 'Africa/Banjul', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(9, 'Africa/Bissau', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(10, 'Africa/Blantyre', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(11, 'Africa/Brazzaville', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(12, 'Africa/Bujumbura', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(13, 'Africa/Cairo', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(14, 'Africa/Casablanca', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(15, 'Africa/Ceuta', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(16, 'Africa/Conakry', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(17, 'Africa/Dakar', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(18, 'Africa/Dar_es_Salaam', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(19, 'Africa/Djibouti', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(20, 'Africa/Douala', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(21, 'Africa/El_Aaiun', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(22, 'Africa/Freetown', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(23, 'Africa/Gaborone', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(24, 'Africa/Harare', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(25, 'Africa/Johannesburg', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(26, 'Africa/Juba', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(27, 'Africa/Kampala', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(28, 'Africa/Khartoum', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(29, 'Africa/Kigali', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(30, 'Africa/Kinshasa', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(31, 'Africa/Lagos', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(32, 'Africa/Libreville', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(33, 'Africa/Lome', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(34, 'Africa/Luanda', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(35, 'Africa/Lubumbashi', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(36, 'Africa/Lusaka', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(37, 'Africa/Malabo', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(38, 'Africa/Maputo', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(39, 'Africa/Maseru', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(40, 'Africa/Mbabane', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(41, 'Africa/Mogadishu', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(42, 'Africa/Monrovia', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(43, 'Africa/Nairobi', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(44, 'Africa/Ndjamena', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(45, 'Africa/Niamey', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(46, 'Africa/Nouakchott', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(47, 'Africa/Ouagadougou', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(48, 'Africa/Porto-Novo', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(49, 'Africa/Sao_Tome', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(50, 'Africa/Tripoli', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(51, 'Africa/Tunis', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(52, 'Africa/Windhoek', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(53, 'America/Adak', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(54, 'America/Anchorage', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(55, 'America/Anguilla', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(56, 'America/Antigua', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(57, 'America/Araguaina', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(58, 'America/Argentina/Buenos_Aires', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(59, 'America/Argentina/Catamarca', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(60, 'America/Argentina/Cordoba', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(61, 'America/Argentina/Jujuy', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(62, 'America/Argentina/La_Rioja', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(63, 'America/Argentina/Mendoza', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(64, 'America/Argentina/Rio_Gallegos', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(65, 'America/Argentina/Salta', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(66, 'America/Argentina/San_Juan', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(67, 'America/Argentina/San_Luis', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(68, 'America/Argentina/Tucuman', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(69, 'America/Argentina/Ushuaia', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(70, 'America/Aruba', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(71, 'America/Asuncion', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(72, 'America/Atikokan', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(73, 'America/Bahia', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(74, 'America/Bahia_Banderas', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(75, 'America/Barbados', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(76, 'America/Belem', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(77, 'America/Belize', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(78, 'America/Blanc-Sablon', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(79, 'America/Boa_Vista', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(80, 'America/Bogota', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(81, 'America/Boise', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(82, 'America/Cambridge_Bay', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(83, 'America/Campo_Grande', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(84, 'America/Cancun', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(85, 'America/Caracas', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(86, 'America/Cayenne', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(87, 'America/Cayman', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(88, 'America/Chicago', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(89, 'America/Chihuahua', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(90, 'America/Costa_Rica', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(91, 'America/Creston', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(92, 'America/Cuiaba', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(93, 'America/Curacao', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(94, 'America/Danmarkshavn', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(95, 'America/Dawson', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(96, 'America/Dawson_Creek', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(97, 'America/Denver', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(98, 'America/Detroit', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(99, 'America/Dominica', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(100, 'America/Edmonton', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(101, 'America/Eirunepe', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(102, 'America/El_Salvador', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(103, 'America/Fort_Nelson', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(104, 'America/Fortaleza', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(105, 'America/Glace_Bay', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(106, 'America/Goose_Bay', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(107, 'America/Grand_Turk', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(108, 'America/Grenada', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(109, 'America/Guadeloupe', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(110, 'America/Guatemala', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(111, 'America/Guayaquil', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(112, 'America/Guyana', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(113, 'America/Halifax', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(114, 'America/Havana', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(115, 'America/Hermosillo', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(116, 'America/Indiana/Indianapolis', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(117, 'America/Indiana/Knox', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(118, 'America/Indiana/Marengo', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(119, 'America/Indiana/Petersburg', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(120, 'America/Indiana/Tell_City', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(121, 'America/Indiana/Vevay', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(122, 'America/Indiana/Vincennes', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(123, 'America/Indiana/Winamac', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(124, 'America/Inuvik', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(125, 'America/Iqaluit', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(126, 'America/Jamaica', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(127, 'America/Juneau', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(128, 'America/Kentucky/Louisville', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(129, 'America/Kentucky/Monticello', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(130, 'America/Kralendijk', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(131, 'America/La_Paz', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(132, 'America/Lima', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(133, 'America/Los_Angeles', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(134, 'America/Lower_Princes', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(135, 'America/Maceio', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(136, 'America/Managua', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(137, 'America/Manaus', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(138, 'America/Marigot', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(139, 'America/Martinique', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(140, 'America/Matamoros', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(141, 'America/Mazatlan', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(142, 'America/Menominee', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(143, 'America/Merida', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(144, 'America/Metlakatla', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(145, 'America/Mexico_City', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(146, 'America/Miquelon', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(147, 'America/Moncton', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(148, 'America/Monterrey', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(149, 'America/Montevideo', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(150, 'America/Montserrat', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(151, 'America/Nassau', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(152, 'America/New_York', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(153, 'America/Nipigon', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(154, 'America/Nome', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(155, 'America/Noronha', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(156, 'America/North_Dakota/Beulah', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(157, 'America/North_Dakota/Center', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(158, 'America/North_Dakota/New_Salem', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(159, 'America/Nuuk', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(160, 'America/Ojinaga', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(161, 'America/Panama', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(162, 'America/Pangnirtung', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(163, 'America/Paramaribo', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(164, 'America/Phoenix', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(165, 'America/Port-au-Prince', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(166, 'America/Port_of_Spain', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(167, 'America/Porto_Velho', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(168, 'America/Puerto_Rico', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(169, 'America/Punta_Arenas', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(170, 'America/Rainy_River', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(171, 'America/Rankin_Inlet', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(172, 'America/Recife', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(173, 'America/Regina', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(174, 'America/Resolute', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(175, 'America/Rio_Branco', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(176, 'America/Santarem', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(177, 'America/Santiago', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(178, 'America/Santo_Domingo', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(179, 'America/Sao_Paulo', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(180, 'America/Scoresbysund', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(181, 'America/Sitka', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(182, 'America/St_Barthelemy', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(183, 'America/St_Johns', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(184, 'America/St_Kitts', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(185, 'America/St_Lucia', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(186, 'America/St_Thomas', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(187, 'America/St_Vincent', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(188, 'America/Swift_Current', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(189, 'America/Tegucigalpa', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(190, 'America/Thule', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(191, 'America/Thunder_Bay', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(192, 'America/Tijuana', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(193, 'America/Toronto', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(194, 'America/Tortola', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(195, 'America/Vancouver', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(196, 'America/Whitehorse', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(197, 'America/Winnipeg', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(198, 'America/Yakutat', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(199, 'America/Yellowknife', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(200, 'Antarctica/Casey', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(201, 'Antarctica/Davis', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(202, 'Antarctica/DumontDUrville', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(203, 'Antarctica/Macquarie', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(204, 'Antarctica/Mawson', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(205, 'Antarctica/McMurdo', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(206, 'Antarctica/Palmer', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(207, 'Antarctica/Rothera', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(208, 'Antarctica/Syowa', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(209, 'Antarctica/Troll', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(210, 'Antarctica/Vostok', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(211, 'Arctic/Longyearbyen', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(212, 'Asia/Aden', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(213, 'Asia/Almaty', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(214, 'Asia/Amman', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(215, 'Asia/Anadyr', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(216, 'Asia/Aqtau', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(217, 'Asia/Aqtobe', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(218, 'Asia/Ashgabat', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(219, 'Asia/Atyrau', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(220, 'Asia/Baghdad', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(221, 'Asia/Bahrain', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(222, 'Asia/Baku', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(223, 'Asia/Bangkok', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(224, 'Asia/Barnaul', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(225, 'Asia/Beirut', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(226, 'Asia/Bishkek', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(227, 'Asia/Brunei', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(228, 'Asia/Chita', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(229, 'Asia/Choibalsan', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(230, 'Asia/Colombo', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(231, 'Asia/Damascus', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(232, 'Asia/Dhaka', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(233, 'Asia/Dili', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(234, 'Asia/Dubai', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(235, 'Asia/Dushanbe', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(236, 'Asia/Famagusta', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(237, 'Asia/Gaza', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(238, 'Asia/Hebron', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(239, 'Asia/Ho_Chi_Minh', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(240, 'Asia/Hong_Kong', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(241, 'Asia/Hovd', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(242, 'Asia/Irkutsk', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(243, 'Asia/Jakarta', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(244, 'Asia/Jayapura', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(245, 'Asia/Jerusalem', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(246, 'Asia/Kabul', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(247, 'Asia/Kamchatka', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(248, 'Asia/Karachi', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(249, 'Asia/Kathmandu', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(250, 'Asia/Khandyga', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(251, 'Asia/Kolkata', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(252, 'Asia/Krasnoyarsk', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(253, 'Asia/Kuala_Lumpur', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(254, 'Asia/Kuching', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(255, 'Asia/Kuwait', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(256, 'Asia/Macau', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(257, 'Asia/Magadan', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(258, 'Asia/Makassar', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(259, 'Asia/Manila', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(260, 'Asia/Muscat', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(261, 'Asia/Nicosia', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(262, 'Asia/Novokuznetsk', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(263, 'Asia/Novosibirsk', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(264, 'Asia/Omsk', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(265, 'Asia/Oral', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(266, 'Asia/Phnom_Penh', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(267, 'Asia/Pontianak', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(268, 'Asia/Pyongyang', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(269, 'Asia/Qatar', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(270, 'Asia/Qostanay', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(271, 'Asia/Qyzylorda', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(272, 'Asia/Riyadh', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(273, 'Asia/Sakhalin', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(274, 'Asia/Samarkand', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(275, 'Asia/Seoul', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(276, 'Asia/Shanghai', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(277, 'Asia/Singapore', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(278, 'Asia/Srednekolymsk', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(279, 'Asia/Taipei', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(280, 'Asia/Tashkent', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(281, 'Asia/Tbilisi', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(282, 'Asia/Tehran', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(283, 'Asia/Thimphu', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(284, 'Asia/Tokyo', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(285, 'Asia/Tomsk', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(286, 'Asia/Ulaanbaatar', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(287, 'Asia/Urumqi', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(288, 'Asia/Ust-Nera', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(289, 'Asia/Vientiane', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(290, 'Asia/Vladivostok', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(291, 'Asia/Yakutsk', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(292, 'Asia/Yangon', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(293, 'Asia/Yekaterinburg', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(294, 'Asia/Yerevan', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(295, 'Atlantic/Azores', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(296, 'Atlantic/Bermuda', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(297, 'Atlantic/Canary', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(298, 'Atlantic/Cape_Verde', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(299, 'Atlantic/Faroe', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(300, 'Atlantic/Madeira', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(301, 'Atlantic/Reykjavik', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(302, 'Atlantic/South_Georgia', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(303, 'Atlantic/St_Helena', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(304, 'Atlantic/Stanley', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(305, 'Australia/Adelaide', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(306, 'Australia/Brisbane', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(307, 'Australia/Broken_Hill', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(308, 'Australia/Darwin', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(309, 'Australia/Eucla', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(310, 'Australia/Hobart', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(311, 'Australia/Lindeman', 1, '2023-10-31 04:40:08', '2023-10-31 04:40:08'),
(312, 'Australia/Lord_Howe', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(313, 'Australia/Melbourne', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(314, 'Australia/Perth', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(315, 'Australia/Sydney', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(316, 'Europe/Amsterdam', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(317, 'Europe/Andorra', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(318, 'Europe/Astrakhan', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(319, 'Europe/Athens', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(320, 'Europe/Belgrade', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(321, 'Europe/Berlin', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(322, 'Europe/Bratislava', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(323, 'Europe/Brussels', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(324, 'Europe/Bucharest', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(325, 'Europe/Budapest', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(326, 'Europe/Busingen', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(327, 'Europe/Chisinau', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(328, 'Europe/Copenhagen', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(329, 'Europe/Dublin', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(330, 'Europe/Gibraltar', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(331, 'Europe/Guernsey', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(332, 'Europe/Helsinki', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(333, 'Europe/Isle_of_Man', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(334, 'Europe/Istanbul', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(335, 'Europe/Jersey', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(336, 'Europe/Kaliningrad', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(337, 'Europe/Kiev', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(338, 'Europe/Kirov', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(339, 'Europe/Lisbon', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(340, 'Europe/Ljubljana', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(341, 'Europe/London', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(342, 'Europe/Luxembourg', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(343, 'Europe/Madrid', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(344, 'Europe/Malta', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(345, 'Europe/Mariehamn', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(346, 'Europe/Minsk', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(347, 'Europe/Monaco', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(348, 'Europe/Moscow', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(349, 'Europe/Oslo', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(350, 'Europe/Paris', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(351, 'Europe/Podgorica', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(352, 'Europe/Prague', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(353, 'Europe/Riga', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(354, 'Europe/Rome', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(355, 'Europe/Samara', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(356, 'Europe/San_Marino', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(357, 'Europe/Sarajevo', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(358, 'Europe/Saratov', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(359, 'Europe/Simferopol', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(360, 'Europe/Skopje', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(361, 'Europe/Sofia', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(362, 'Europe/Stockholm', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(363, 'Europe/Tallinn', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(364, 'Europe/Tirane', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(365, 'Europe/Ulyanovsk', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(366, 'Europe/Uzhgorod', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(367, 'Europe/Vaduz', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(368, 'Europe/Vatican', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(369, 'Europe/Vienna', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(370, 'Europe/Vilnius', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(371, 'Europe/Volgograd', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(372, 'Europe/Warsaw', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(373, 'Europe/Zagreb', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(374, 'Europe/Zaporozhye', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(375, 'Europe/Zurich', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(376, 'Indian/Antananarivo', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(377, 'Indian/Chagos', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(378, 'Indian/Christmas', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(379, 'Indian/Cocos', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(380, 'Indian/Comoro', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(381, 'Indian/Kerguelen', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(382, 'Indian/Mahe', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(383, 'Indian/Maldives', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(384, 'Indian/Mauritius', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(385, 'Indian/Mayotte', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(386, 'Indian/Reunion', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(387, 'Pacific/Apia', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(388, 'Pacific/Auckland', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(389, 'Pacific/Bougainville', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(390, 'Pacific/Chatham', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(391, 'Pacific/Chuuk', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(392, 'Pacific/Easter', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(393, 'Pacific/Efate', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(394, 'Pacific/Fakaofo', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(395, 'Pacific/Fiji', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(396, 'Pacific/Funafuti', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(397, 'Pacific/Galapagos', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(398, 'Pacific/Gambier', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(399, 'Pacific/Guadalcanal', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(400, 'Pacific/Guam', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(401, 'Pacific/Honolulu', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(402, 'Pacific/Kanton', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(403, 'Pacific/Kiritimati', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(404, 'Pacific/Kosrae', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(405, 'Pacific/Kwajalein', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(406, 'Pacific/Majuro', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(407, 'Pacific/Marquesas', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(408, 'Pacific/Midway', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(409, 'Pacific/Nauru', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(410, 'Pacific/Niue', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(411, 'Pacific/Norfolk', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(412, 'Pacific/Noumea', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(413, 'Pacific/Pago_Pago', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(414, 'Pacific/Palau', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(415, 'Pacific/Pitcairn', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(416, 'Pacific/Pohnpei', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(417, 'Pacific/Port_Moresby', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(418, 'Pacific/Rarotonga', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(419, 'Pacific/Saipan', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(420, 'Pacific/Tahiti', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(421, 'Pacific/Tarawa', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(422, 'Pacific/Tongatapu', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(423, 'Pacific/Wake', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(424, 'Pacific/Wallis', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09'),
(425, 'UTC', 1, '2023-10-31 04:40:09', '2023-10-31 04:40:09');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secondary_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `opt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opt_expiry` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_approved` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `country_id`, `state_id`, `city_id`, `first_name`, `last_name`, `image`, `middle_name`, `email`, `secondary_email`, `phone1`, `phone2`, `address`, `dob`, `gender`, `age`, `email_verified_at`, `password`, `opt`, `opt_expiry`, `admin_approved`, `deleted_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 'admin', 'admin', '', NULL, 'admin@gmail.com', NULL, '23739493', NULL, '', 'admin', 'male', NULL, NULL, '$2y$10$xNYVTYzI/HRkpmr7k7st3ORmOblEqvJIyPRnbhR7K405mau5rNGbq', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(5, 6, 1, 1, 1, 'Zainab', 'Timesheet', '', 'Prestige', 'Timesheet@prestigeinternationalsecurity.com', NULL, '9232508235', NULL, 'Plot no 49C, Tauheed Commercial DHA Phase V, Karachi South.', '2003-01-22', 'female', NULL, NULL, '$2y$10$IoC.9f5K/E7A0Jul3YOCDeJ3Ifj.seJh9UEq3We.qtGHUNX57Ot6i', NULL, NULL, 1, NULL, NULL, '2024-03-21 09:59:46', '2024-03-21 10:03:03'),
(6, 3, 1, 1, 1, 'Asad', 'Bhatti', '', 'Ali', 'Construction@prestigeinternationalsecurity.com', NULL, '923093678338', NULL, 'Plot no 49C, Tauheed Commercial DHA Phase V, Karachi South.', '20003-01-22', 'male', NULL, NULL, '$2y$10$4oBynN4wHRlXeiBbSCGtPuuU4Bm6Js358SwYxadWD3927wzIh/0Ii', NULL, NULL, 1, NULL, NULL, '2024-03-21 10:04:59', '2024-03-21 10:04:59'),
(7, 4, 1, 1, 1, 'Talha', 'Saeed', '', NULL, 'talha@2421gmailcom', NULL, '56468316584631', NULL, '3rd st', '2000-09-13', 'male', NULL, NULL, '$2y$10$3e4VxbUe79GGkkVp1n4HDugkjqARy/aggQB.6DvmLIhQp3K71AjgC', NULL, NULL, 1, NULL, NULL, '2024-03-23 19:02:13', '2024-03-23 19:02:13'),
(8, 4, 1, 1, 1, 'Ali', 'Muhammad', '', NULL, 'alimuhammad@gmal.com', NULL, '00000022214', NULL, 'Karachi Sindh', '2000-11-12', 'male', NULL, NULL, '$2y$10$Y9qUx1PvbrfSG0dgrewceu6jLeQpN8snFI3VevolW1UM1RBrcAG0q', NULL, NULL, 1, NULL, NULL, '2024-04-05 07:13:57', '2024-04-05 07:13:57'),
(9, 3, 1, 1, 1, 'Talha', 'Saeed', '', NULL, 'talha@gmail.com', NULL, '03211211212', NULL, 'Karachi, Sindh', '2002-11-29', 'male', NULL, NULL, '$2y$10$LBE6GqQ3uhXJ41MdreRxp.ktUxstGlbaJG4d.4goqzzHiDBD6k4Za', NULL, NULL, 1, NULL, NULL, '2024-04-05 09:07:28', '2024-04-05 09:07:28'),
(10, 3, 1, 1, 1, 'Ali', 'Muhammad', '', NULL, 'Alimuhammad@gmail.com', NULL, '02321122113', NULL, 'Karachi, Sindh', '2000-09-22', 'male', NULL, NULL, '$2y$10$c4oTAaKzs7a8k/LUgZTQ9OOmPBxR3n8iYt.z8raEA12D6ASf4Ny46', NULL, NULL, 1, NULL, NULL, '2024-05-24 16:54:21', '2024-05-24 16:54:21');

-- --------------------------------------------------------

--
-- Table structure for table `user_privileges`
--

CREATE TABLE `user_privileges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `privilege_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `assign_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_privileges`
--

INSERT INTO `user_privileges` (`id`, `privilege_id`, `user_id`, `role_id`, `assign_by`, `created_at`, `updated_at`) VALUES
(6, 15, 5, 6, 'admin', NULL, NULL),
(7, 21, 5, 6, 'admin', NULL, NULL),
(8, 22, 5, 6, 'admin', NULL, NULL),
(9, 23, 5, 6, 'admin', NULL, NULL),
(10, 24, 5, 6, 'admin', NULL, NULL),
(11, 29, 5, 6, 'admin', NULL, NULL),
(12, 17, 6, 3, 'admin', NULL, NULL),
(13, 18, 6, 3, 'admin', NULL, NULL),
(14, 19, 6, 3, 'admin', NULL, NULL),
(15, 20, 6, 3, 'admin', NULL, NULL),
(16, 5, 5, 6, 'admin', NULL, NULL),
(17, 6, 5, 6, 'admin', NULL, NULL),
(18, 8, 5, 6, 'admin', NULL, NULL),
(19, 13, 5, 6, 'admin', NULL, NULL),
(20, 14, 5, 6, 'admin', NULL, NULL),
(21, 15, 5, 6, 'admin', NULL, NULL),
(22, 16, 5, 6, 'admin', NULL, NULL),
(23, 21, 5, 6, 'admin', NULL, NULL),
(24, 22, 5, 6, 'admin', NULL, NULL),
(25, 23, 5, 6, 'admin', NULL, NULL),
(26, 24, 5, 6, 'admin', NULL, NULL),
(27, 29, 5, 6, 'admin', NULL, NULL),
(28, 13, 5, 6, 'admin', NULL, NULL),
(29, 14, 5, 6, 'admin', NULL, NULL),
(30, 15, 5, 6, 'admin', NULL, NULL),
(31, 16, 5, 6, 'admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_two_factors`
--

CREATE TABLE `user_two_factors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `opt_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `browser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `platform` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_mobile` tinyint(1) NOT NULL,
  `is_desktop` tinyint(1) NOT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_two_factors`
--

INSERT INTO `user_two_factors` (`id`, `user_id`, `opt_number`, `ip_address`, `browser`, `version`, `platform`, `is_mobile`, `is_desktop`, `is_verified`, `created_at`, `updated_at`) VALUES
(1, 1, '1234', '111.88.221.142', 'Chrome', '115.0.0.0', 'Linux', 0, 1, 0, '2024-03-17 22:24:10', '2024-03-17 22:24:10'),
(2, 1, '1234', '137.59.222.4', 'Chrome', '122.0.0.0', 'Windows', 0, 1, 0, '2024-03-18 07:20:01', '2024-03-18 07:20:01'),
(3, 1, '1234', '39.57.192.39', 'Chrome', '122.0.0.0', 'AndroidOS', 1, 0, 0, '2024-03-19 20:14:17', '2024-03-19 20:14:17'),
(4, 1, '1234', '180.178.135.82', 'Chrome', '122.0.0.0', 'Windows', 0, 1, 0, '2024-03-20 04:39:50', '2024-03-20 04:39:50'),
(5, 1, '1234', '202.47.36.173', 'Chrome', '122.0.0.0', 'Windows', 0, 1, 0, '2024-03-20 04:40:44', '2024-03-20 04:40:44'),
(6, 5, '1234', '202.47.36.173', 'Chrome', '122.0.0.0', 'Windows', 0, 1, 0, '2024-03-21 10:01:28', '2024-03-21 10:01:28'),
(7, 6, '1234', '180.178.135.82', 'Chrome', '122.0.0.0', 'Windows', 0, 1, 0, '2024-03-21 10:08:18', '2024-03-21 10:08:18'),
(8, 1, '1234', '111.88.208.187', 'Chrome', '122.0.0.0', 'AndroidOS', 1, 0, 0, '2024-03-21 11:12:11', '2024-03-21 11:12:11'),
(9, 1, '1234', '111.88.218.199', 'Chrome', '122.0.0.0', 'AndroidOS', 1, 0, 0, '2024-03-21 17:36:24', '2024-03-21 17:36:24'),
(10, 1, '1234', '111.88.214.53', 'Chrome', '115.0.0.0', 'Linux', 0, 1, 0, '2024-03-23 00:54:02', '2024-03-23 00:54:02'),
(11, 1, '1234', '111.88.26.125', 'Chrome', '123.0.0.0', 'Windows', 0, 1, 0, '2024-03-23 02:19:02', '2024-03-23 02:19:02'),
(12, 1, '1234', '137.59.222.4', 'Chrome', '123.0.0.0', 'Windows', 0, 1, 0, '2024-03-29 06:44:36', '2024-03-29 06:44:36'),
(13, 1, '1234', '180.178.135.82', 'Chrome', '123.0.0.0', 'Windows', 0, 1, 0, '2024-03-30 04:28:18', '2024-03-30 04:28:18'),
(14, 1, '1234', '110.93.236.23', 'Chrome', '123.0.0.0', 'Windows', 0, 1, 0, '2024-04-04 03:43:28', '2024-04-04 03:43:28'),
(15, 1, '1234', '111.88.215.58', 'Chrome', '115.0.0.0', 'Linux', 0, 1, 0, '2024-04-04 21:00:42', '2024-04-04 21:00:42'),
(16, 1, '1234', '111.88.222.245', 'Chrome', '123.0.0.0', 'AndroidOS', 1, 0, 0, '2024-04-05 15:25:31', '2024-04-05 15:25:31'),
(17, 1, '1234', '101.53.226.19', 'Chrome', '123.0.0.0', 'Windows', 0, 1, 0, '2024-04-17 06:12:24', '2024-04-17 06:12:24'),
(18, 1, '1234', '137.59.222.4', 'Chrome', '124.0.0.0', 'Windows', 0, 1, 0, '2024-04-22 06:47:24', '2024-04-22 06:47:24'),
(19, 1, '1234', '111.88.212.113', 'Chrome', '124.0.0.0', 'AndroidOS', 1, 0, 0, '2024-04-23 08:31:57', '2024-04-23 08:31:57'),
(20, 1, '1234', '202.165.236.206', 'Chrome', '124.0.0.0', 'Windows', 0, 1, 0, '2024-04-27 15:52:38', '2024-04-27 15:52:38'),
(21, 1, '1234', '36.50.12.206', 'Chrome', '123.0.0.0', 'Windows', 0, 1, 0, '2024-04-27 20:38:21', '2024-04-27 20:38:21'),
(22, 1, '1234', '119.155.162.230', 'Chrome', '124.0.0.0', 'Windows', 0, 1, 0, '2024-04-27 20:43:34', '2024-04-27 20:43:34'),
(23, 1, '1234', '119.155.181.206', 'Chrome', '124.0.0.0', 'Windows', 0, 1, 0, '2024-04-27 20:43:37', '2024-04-27 20:43:37'),
(24, 1, '1234', '39.57.193.214', 'Chrome', '124.0.0.0', 'Windows', 0, 1, 0, '2024-04-27 21:01:46', '2024-04-27 21:01:46'),
(25, 1, '1234', '119.155.206.236', 'Chrome', '124.0.0.0', 'AndroidOS', 1, 0, 0, '2024-05-04 08:18:19', '2024-05-04 08:18:19'),
(26, 1, '1234', '180.178.135.82', 'Chrome', '124.0.0.0', 'Windows', 0, 1, 0, '2024-05-07 22:43:56', '2024-05-07 22:43:56'),
(27, 1, '1234', '36.50.12.206', 'Chrome', '124.0.0.0', 'Windows', 0, 1, 0, '2024-05-07 22:57:45', '2024-05-07 22:57:45'),
(28, 1, '1234', '207.244.71.80', 'Chrome', '124.0.0.0', 'Windows', 0, 1, 0, '2024-05-09 08:07:40', '2024-05-09 08:07:40'),
(29, 1, '1234', '36.50.12.206', 'Edge', '124.0.0.0', 'Windows', 0, 1, 0, '2024-05-15 15:57:25', '2024-05-15 15:57:25'),
(30, 1, '1234', '36.50.12.206', 'Edge', '125.0.0.0', 'Windows', 0, 1, 0, '2024-05-24 16:52:38', '2024-05-24 16:52:38'),
(31, 1, '1234', '180.178.135.82', 'Chrome', '125.0.0.0', 'Windows', 0, 1, 0, '2024-06-01 17:26:05', '2024-06-01 17:26:05'),
(32, 1, '1234', '137.59.222.4', 'Chrome', '125.0.0.0', 'Windows', 0, 1, 0, '2024-06-07 11:54:10', '2024-06-07 11:54:10'),
(33, 1, '1234', '38.7.182.207', 'Chrome', '125.0.0.0', 'AndroidOS', 1, 0, 0, '2024-06-08 10:17:54', '2024-06-08 10:17:54'),
(34, 1, '1234', '111.88.215.71', 'Chrome', '115.0.0.0', 'Linux', 0, 1, 0, '2024-06-26 16:11:56', '2024-06-26 16:11:56'),
(35, 1, '1234', '202.165.236.206', 'Chrome', '126.0.0.0', 'Windows', 0, 1, 0, '2024-06-26 16:17:54', '2024-06-26 16:17:54'),
(36, 1, '1234', '180.178.135.82', 'Chrome', '126.0.0.0', 'Windows', 0, 1, 0, '2024-06-26 20:05:52', '2024-06-26 20:05:52'),
(37, 1, '1234', '110.93.236.23', 'Chrome', '126.0.0.0', 'Windows', 0, 1, 0, '2024-07-02 13:31:40', '2024-07-02 13:31:40'),
(38, 1, '1234', '38.7.179.20', 'Chrome', '126.0.0.0', 'Windows', 0, 1, 0, '2024-07-03 14:34:52', '2024-07-03 14:34:52'),
(39, 1, '1234', '36.50.12.206', 'Chrome', '126.0.0.0', 'Windows', 0, 1, 0, '2024-07-06 18:03:44', '2024-07-06 18:03:44'),
(40, 1, '1234', '111.88.221.197', 'Chrome', '126.0.0.0', 'Linux', 0, 1, 0, '2024-07-09 19:22:10', '2024-07-09 19:22:10'),
(41, 1, '1234', '205.164.151.24', 'Chrome', '126.0.0.0', 'Linux', 0, 1, 0, '2024-07-10 11:37:59', '2024-07-10 11:37:59'),
(42, 1, '1234', '103.244.176.74', 'Chrome', '126.0.0.0', 'Windows', 0, 1, 0, '2024-07-10 18:54:11', '2024-07-10 18:54:11'),
(43, 1, '1234', '111.88.208.241', 'Chrome', '126.0.0.0', 'Linux', 0, 1, 0, '2024-07-24 17:23:54', '2024-07-24 17:23:54'),
(44, 1, '1234', '137.59.222.4', 'Chrome', '126.0.0.0', 'Windows', 0, 1, 0, '2024-07-25 09:54:47', '2024-07-25 09:54:47'),
(45, 1, '1234', '103.244.176.74', 'Chrome', '127.0.0.0', 'Windows', 0, 1, 0, '2024-07-27 16:05:36', '2024-07-27 16:05:36'),
(46, 1, '1234', '137.59.222.4', 'Chrome', '127.0.0.0', 'Windows', 0, 1, 0, '2024-08-08 11:04:52', '2024-08-08 11:04:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_country_id_foreign` (`country_id`),
  ADD KEY `cities_state_id_foreign` (`state_id`);

--
-- Indexes for table `client_locations`
--
ALTER TABLE `client_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_locations_location_id_foreign` (`location_id`);

--
-- Indexes for table `confirmation_calls`
--
ALTER TABLE `confirmation_calls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `confirmation_calls_time_sheet_id_foreign` (`time_sheet_id`),
  ADD KEY `confirmation_calls_schedule_id_foreign` (`schedule_id`),
  ADD KEY `confirmation_calls_location_id_foreign` (`location_id`),
  ADD KEY `confirmation_calls_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employees_user_id_foreign` (`user_id`),
  ADD KEY `employees_category_id_foreign` (`category_id`);

--
-- Indexes for table `employee_categories`
--
ALTER TABLE `employee_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_employee_id_foreign` (`employee_id`),
  ADD KEY `jobs_location_id_foreign` (`location_id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `locations_user_id_foreign` (`user_id`),
  ADD KEY `locations_timezone_id_foreign` (`timezone_id`);

--
-- Indexes for table `location_types`
--
ALTER TABLE `location_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `monitorings`
--
ALTER TABLE `monitorings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `monitorings_location_id_foreign` (`location_id`),
  ADD KEY `monitorings_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `monitor_locations`
--
ALTER TABLE `monitor_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `monitor_locations_location_id_foreign` (`location_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `privileges`
--
ALTER TABLE `privileges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schedules_location_id_foreign` (`location_id`);

--
-- Indexes for table `schedule_days`
--
ALTER TABLE `schedule_days`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schedule_days_schedule_id_foreign` (`schedule_id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`),
  ADD KEY `states_country_id_foreign` (`country_id`);

--
-- Indexes for table `time_sheets`
--
ALTER TABLE `time_sheets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `time_sheets_schedule_id_foreign` (`schedule_id`),
  ADD KEY `time_sheets_employee_id_foreign` (`employee_id`),
  ADD KEY `time_sheets_location_id_foreign` (`location_id`);

--
-- Indexes for table `time_zones`
--
ALTER TABLE `time_zones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone1_unique` (`phone1`),
  ADD KEY `users_role_id_foreign` (`role_id`),
  ADD KEY `users_country_id_foreign` (`country_id`),
  ADD KEY `users_state_id_foreign` (`state_id`),
  ADD KEY `users_city_id_foreign` (`city_id`);

--
-- Indexes for table `user_privileges`
--
ALTER TABLE `user_privileges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_privileges_privilege_id_foreign` (`privilege_id`),
  ADD KEY `user_privileges_user_id_foreign` (`user_id`),
  ADD KEY `user_privileges_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_two_factors`
--
ALTER TABLE `user_two_factors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_two_factors_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `client_locations`
--
ALTER TABLE `client_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `confirmation_calls`
--
ALTER TABLE `confirmation_calls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `employee_categories`
--
ALTER TABLE `employee_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `location_types`
--
ALTER TABLE `location_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `monitorings`
--
ALTER TABLE `monitorings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `monitor_locations`
--
ALTER TABLE `monitor_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `privileges`
--
ALTER TABLE `privileges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=502;

--
-- AUTO_INCREMENT for table `schedule_days`
--
ALTER TABLE `schedule_days`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `time_sheets`
--
ALTER TABLE `time_sheets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `time_zones`
--
ALTER TABLE `time_zones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=426;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_privileges`
--
ALTER TABLE `user_privileges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `user_two_factors`
--
ALTER TABLE `user_two_factors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  ADD CONSTRAINT `cities_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`);

--
-- Constraints for table `client_locations`
--
ALTER TABLE `client_locations`
  ADD CONSTRAINT `client_locations_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`);

--
-- Constraints for table `confirmation_calls`
--
ALTER TABLE `confirmation_calls`
  ADD CONSTRAINT `confirmation_calls_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `confirmation_calls_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`),
  ADD CONSTRAINT `confirmation_calls_schedule_id_foreign` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`id`),
  ADD CONSTRAINT `confirmation_calls_time_sheet_id_foreign` FOREIGN KEY (`time_sheet_id`) REFERENCES `time_sheets` (`id`);

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `employee_categories` (`id`),
  ADD CONSTRAINT `employees_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `jobs_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `jobs_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`);

--
-- Constraints for table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_timezone_id_foreign` FOREIGN KEY (`timezone_id`) REFERENCES `time_zones` (`id`),
  ADD CONSTRAINT `locations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `monitorings`
--
ALTER TABLE `monitorings`
  ADD CONSTRAINT `monitorings_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `monitorings_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`);

--
-- Constraints for table `monitor_locations`
--
ALTER TABLE `monitor_locations`
  ADD CONSTRAINT `monitor_locations_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`);

--
-- Constraints for table `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `schedules_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`);

--
-- Constraints for table `schedule_days`
--
ALTER TABLE `schedule_days`
  ADD CONSTRAINT `schedule_days_schedule_id_foreign` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`id`);

--
-- Constraints for table `states`
--
ALTER TABLE `states`
  ADD CONSTRAINT `states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`);

--
-- Constraints for table `time_sheets`
--
ALTER TABLE `time_sheets`
  ADD CONSTRAINT `time_sheets_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `time_sheets_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`),
  ADD CONSTRAINT `time_sheets_schedule_id_foreign` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `users_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `users_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`);

--
-- Constraints for table `user_privileges`
--
ALTER TABLE `user_privileges`
  ADD CONSTRAINT `user_privileges_privilege_id_foreign` FOREIGN KEY (`privilege_id`) REFERENCES `privileges` (`id`),
  ADD CONSTRAINT `user_privileges_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `user_privileges_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_two_factors`
--
ALTER TABLE `user_two_factors`
  ADD CONSTRAINT `user_two_factors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
