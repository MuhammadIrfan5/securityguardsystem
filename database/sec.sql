-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 01, 2023 at 08:29 AM
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
(1, 'PAK', 'PAK', 'PAKISTAN', '+92', '.', '.', '.', '1', NULL, '2023-10-31 09:40:36', NULL);

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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `user_id`, `category_id`, `name`, `id_number`, `phone_one`, `phone_two`, `guard_number`, `issue_date`, `expiry_date`, `pay_rate`, `manager_name`, `notes`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Sohail Ali', 'b123', '21212121212', '', 'ssa1234', '2023-11-01', '2023-12-01', '123', 'Allah Rahi', '', 0, '2023-11-01 01:50:11', '2023-11-01 01:58:44');

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
  `check_in` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `calling_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `is_monitoring` tinyint(1) NOT NULL DEFAULT 0,
  `notes` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `user_id`, `name`, `address`, `timezone_id`, `timezone`, `coverage_start_time`, `coverage_end_time`, `location_type`, `location_sub_type`, `license_number`, `is_monitoring`, `notes`, `created_at`, `updated_at`) VALUES
(1, 1, 'Sohail Ali', 'xwww', 212, 'Asia/Aden', '12:28:00', '12:33:00', '3', '', NULL, 0, NULL, '2023-11-01 02:29:09', '2023-11-01 02:29:09');

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
(7, 'San Diego', '2', 1, NULL, NULL);

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
(14, '2023_10_18_100635_create_jobs_table', 1),
(17, '2023_11_01_061712_create_employee_categories_table', 2),
(19, '2023_10_17_073224_create_locations_table', 3),
(20, '2023_10_30_172736_create_client_locations_table', 3),
(21, '2023_10_30_173059_create_monitor_locations_table', 3),
(22, '2023_10_17_072545_create_employees_table', 4);

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
(1, 'SuperAdmin', 1, NULL, NULL),
(2, 'Admin', 1, NULL, NULL),
(3, 'User', 1, NULL, NULL);

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
(2, 2, 1, 1, 1, 'sas', 'assaa', '', 'Muhammad', 'sa@live.com', 'sa@live.com', '03453096441', '03453096441', 'sasasas', '2023-10-31', 'male', NULL, NULL, '$2y$10$g/7A2RHp1uxyfkZ9Dg/ABOWOW52uDFzXrswaudh2uIU/vFZav1EHy', NULL, NULL, 1, NULL, NULL, '2023-10-31 08:40:42', '2023-10-31 08:40:42');

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
(1, 1, '1234', '::1', 'Chrome', '118.0.0.0', 'Windows', 0, 1, 0, '2023-10-31 04:44:36', '2023-10-31 04:44:36');

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
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`),
  ADD KEY `states_country_id_foreign` (`country_id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `location_types`
--
ALTER TABLE `location_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `monitor_locations`
--
ALTER TABLE `monitor_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `time_zones`
--
ALTER TABLE `time_zones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=426;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_two_factors`
--
ALTER TABLE `user_two_factors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
-- Constraints for table `monitor_locations`
--
ALTER TABLE `monitor_locations`
  ADD CONSTRAINT `monitor_locations_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`);

--
-- Constraints for table `states`
--
ALTER TABLE `states`
  ADD CONSTRAINT `states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `users_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `users_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`);

--
-- Constraints for table `user_two_factors`
--
ALTER TABLE `user_two_factors`
  ADD CONSTRAINT `user_two_factors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
