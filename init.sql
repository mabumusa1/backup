-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Sep 18, 2022 at 02:33 PM
-- Server version: 10.3.35-MariaDB-1:10.3.35+maria~focal-log
-- PHP Version: 8.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `data_center_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_last_four` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quota` int(11) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `data_center_id`, `name`, `stripe_id`, `pm_type`, `pm_last_four`, `trial_ends_at`, `email`, `quota`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin Account', NULL, NULL, NULL, NULL, 'waters.franz@example.net', 1, NULL, '2022-09-10 06:19:42', '2022-09-10 06:19:42'),
(2, 1, 'Al Account', 'cus_LIGOOQC7OuqyAn', 'visa', '4242', NULL, 'harmon.mills@example.com', 1, NULL, '2022-09-10 06:19:42', '2022-09-10 06:19:42'),
(3, 1, 'Cathrine Account', NULL, NULL, NULL, NULL, 'jonathon79@example.org', 1, NULL, '2022-09-10 06:19:42', '2022-09-10 06:19:42');

-- --------------------------------------------------------

--
-- Table structure for table `account_user`
--

CREATE TABLE `account_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role` enum('admin','staff','owner','fb','fnb','pb','pnb') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_user`
--

INSERT INTO `account_user` (`id`, `account_id`, `user_id`, `role`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'admin', NULL, NULL),
(2, 2, 2, 'owner', NULL, NULL),
(3, 2, 3, 'fb', NULL, NULL),
(4, 2, 4, 'fnb', NULL, NULL),
(5, 2, 5, 'pb', NULL, NULL),
(6, 2, 6, 'pnb', NULL, NULL),
(7, 3, 7, 'owner', NULL, NULL),
(8, 3, 8, 'fb', NULL, NULL),
(9, 3, 9, 'fnb', NULL, NULL),
(10, 3, 10, 'pb', NULL, NULL),
(11, 3, 11, 'pnb', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `log_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `causer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `batch_uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `account_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(1, 'system', 'Plan Created', 'App\\Models\\Plan', 'created', 1, NULL, NULL, NULL, '[]', NULL, '2022-09-10 06:19:38', '2022-09-10 06:19:38'),
(2, 'system', 'Plan Created', 'App\\Models\\Plan', 'created', 2, NULL, NULL, NULL, '[]', NULL, '2022-09-10 06:19:38', '2022-09-10 06:19:38'),
(3, 'system', 'Plan Created', 'App\\Models\\Plan', 'created', 3, NULL, NULL, NULL, '[]', NULL, '2022-09-10 06:19:38', '2022-09-10 06:19:38'),
(4, 'system', 'Plan Created', 'App\\Models\\Plan', 'created', 4, NULL, NULL, NULL, '[]', NULL, '2022-09-10 06:19:38', '2022-09-10 06:19:38'),
(5, 'system', 'Plan Created', 'App\\Models\\Plan', 'created', 5, NULL, NULL, NULL, '[]', NULL, '2022-09-10 06:19:38', '2022-09-10 06:19:38'),
(6, 'system', 'Plan Created', 'App\\Models\\Plan', 'created', 6, NULL, NULL, NULL, '[]', NULL, '2022-09-10 06:19:38', '2022-09-10 06:19:38'),
(7, 'system', 'Plan Created', 'App\\Models\\Plan', 'created', 7, NULL, NULL, NULL, '[]', NULL, '2022-09-10 06:19:38', '2022-09-10 06:19:38'),
(8, 'system', 'Plan Created', 'App\\Models\\Plan', 'created', 8, NULL, NULL, NULL, '[]', NULL, '2022-09-10 06:19:38', '2022-09-10 06:19:38'),
(9, 'system', 'Plan Created', 'App\\Models\\Plan', 'created', 9, NULL, NULL, NULL, '[]', NULL, '2022-09-10 06:19:38', '2022-09-10 06:19:38'),
(10, 'account', 'Brigitte Schoen associated with Admin Account', 'App\\Models\\AccountUser', 'created', 1, 'App\\Models\\User', 1, 1, '[]', NULL, '2022-09-10 06:19:42', '2022-09-10 06:19:42'),
(11, 'account', 'Elinore Hansen associated with Al Account', 'App\\Models\\AccountUser', 'created', 2, 'App\\Models\\User', 2, 2, '[]', NULL, '2022-09-10 06:19:42', '2022-09-10 06:19:42'),
(12, 'account', 'Malcolm Ryan associated with Al Account', 'App\\Models\\AccountUser', 'created', 3, 'App\\Models\\User', 2, 2, '[]', NULL, '2022-09-10 06:19:42', '2022-09-10 06:19:42'),
(13, 'account', 'Sydnie Mayert associated with Al Account', 'App\\Models\\AccountUser', 'created', 4, 'App\\Models\\User', 2, 2, '[]', NULL, '2022-09-10 06:19:42', '2022-09-10 06:19:42'),
(14, 'account', 'Annabell Ortiz associated with Al Account', 'App\\Models\\AccountUser', 'created', 5, 'App\\Models\\User', 2, 2, '[]', NULL, '2022-09-10 06:19:42', '2022-09-10 06:19:42'),
(15, 'account', 'Treva Gibson associated with Al Account', 'App\\Models\\AccountUser', 'created', 6, 'App\\Models\\User', 2, 2, '[]', NULL, '2022-09-10 06:19:42', '2022-09-10 06:19:42'),
(16, 'account', 'Cathrine Account Created', 'App\\Models\\Account', 'created', 3, 'App\\Models\\User', 7, 2, '[]', NULL, '2022-09-10 06:19:42', '2022-09-10 06:19:42'),
(17, 'account', 'Jayce Corwin associated with Cathrine Account', 'App\\Models\\AccountUser', 'created', 7, 'App\\Models\\User', 7, 3, '[]', NULL, '2022-09-10 06:19:42', '2022-09-10 06:19:42'),
(18, 'account', 'Anderson Tromp associated with Cathrine Account', 'App\\Models\\AccountUser', 'created', 8, 'App\\Models\\User', 7, 3, '[]', NULL, '2022-09-10 06:19:42', '2022-09-10 06:19:42'),
(19, 'account', 'Onie Rowe associated with Cathrine Account', 'App\\Models\\AccountUser', 'created', 9, 'App\\Models\\User', 7, 3, '[]', NULL, '2022-09-10 06:19:42', '2022-09-10 06:19:42'),
(20, 'account', 'Chelsea Dickinson associated with Cathrine Account', 'App\\Models\\AccountUser', 'created', 10, 'App\\Models\\User', 7, 3, '[]', NULL, '2022-09-10 06:19:42', '2022-09-10 06:19:42'),
(21, 'account', 'Yvonne Carter associated with Cathrine Account', 'App\\Models\\AccountUser', 'created', 11, 'App\\Models\\User', 7, 3, '[]', NULL, '2022-09-10 06:19:42', '2022-09-10 06:19:42'),
(22, 'account', 'Site Deleted', 'App\\Models\\Site', 'deleted', 1, 'App\\Models\\User', 2, 2, '[]', NULL, '2022-09-10 06:35:18', '2022-09-10 06:35:18'),
(23, 'account', 'Rosendo Install Deleted', 'App\\Models\\Install', 'deleted', 1, 'App\\Models\\User', 2, 2, '[]', NULL, '2022-09-10 06:35:18', '2022-09-10 06:35:18'),
(24, 'account', 'Abdul Install Deleted', 'App\\Models\\Install', 'deleted', 2, 'App\\Models\\User', 2, 2, '[]', NULL, '2022-09-10 06:35:18', '2022-09-10 06:35:18'),
(25, 'account', 'test.usersproof.com created to Matteo', 'App\\Models\\Domain', 'created', 13, 'App\\Models\\User', 2, 2, '[]', NULL, '2022-09-10 21:03:08', '2022-09-10 21:03:08'),
(26, 'account', 'Matteo Install Updated', 'App\\Models\\Install', 'updated', 5, 'App\\Models\\User', 2, 2, '[]', NULL, '2022-09-10 21:10:05', '2022-09-10 21:10:05'),
(27, 'account', 'Site Deleted', 'App\\Models\\Site', 'deleted', 3, 'App\\Models\\User', 2, 2, '[]', NULL, '2022-09-11 05:08:13', '2022-09-11 05:08:13'),
(28, 'account', 'Matteo Install Deleted', 'App\\Models\\Install', 'deleted', 5, 'App\\Models\\User', 2, 2, '[]', NULL, '2022-09-11 05:08:13', '2022-09-11 05:08:13'),
(29, 'account', 'Derrick Install Deleted', 'App\\Models\\Install', 'deleted', 6, 'App\\Models\\User', 2, 2, '[]', NULL, '2022-09-11 05:08:13', '2022-09-11 05:08:13'),
(30, 'account', 'Site Deleted', 'App\\Models\\Site', 'deleted', 2, 'App\\Models\\User', 2, 2, '[]', NULL, '2022-09-11 05:08:15', '2022-09-11 05:08:15'),
(31, 'account', 'Roosevelt Install Deleted', 'App\\Models\\Install', 'deleted', 3, 'App\\Models\\User', 2, 2, '[]', NULL, '2022-09-11 05:08:15', '2022-09-11 05:08:15'),
(32, 'account', 'Genoveva Install Deleted', 'App\\Models\\Install', 'deleted', 4, 'App\\Models\\User', 2, 2, '[]', NULL, '2022-09-11 05:08:15', '2022-09-11 05:08:15');

-- --------------------------------------------------------

--
-- Table structure for table `backups`
--

CREATE TABLE `backups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `install_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('sys','usr') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('creating','restoring','ready','failed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'creating',
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `s3_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `backups`
--

INSERT INTO `backups` (`id`, `install_id`, `type`, `status`, `description`, `s3_url`, `created_at`, `updated_at`) VALUES
(1, 1, 'usr', 'creating', 'veritatis necessitatibus quos', 'http://www.romaguera.com/', '2022-09-10 06:19:42', '2022-09-10 06:19:42'),
(2, 1, 'sys', 'restoring', 'cumque in facilis', 'https://www.bradtke.com/deserunt-facere-aspernatur-quas-cumque-laborum-qui', '2022-09-10 06:19:42', '2022-09-10 06:19:42'),
(3, 2, 'sys', 'creating', 'perferendis quis ea', 'http://kemmer.org/enim-qui-minima-delectus-eos-qui-est-atque-dolor', '2022-09-10 06:19:42', '2022-09-10 06:19:42'),
(4, 2, 'sys', 'restoring', 'accusamus voluptas voluptatem', 'http://hills.net/eius-non-quis-et-beatae-sint-eum-similique.html', '2022-09-10 06:19:42', '2022-09-10 06:19:42'),
(5, 3, 'sys', 'creating', 'omnis voluptatem minima', 'http://www.kovacek.com/dignissimos-excepturi-quas-et.html', '2022-09-10 06:19:42', '2022-09-10 06:19:42'),
(6, 3, 'sys', 'restoring', 'dolorem et sit', 'http://bradtke.org/voluptas-illum-perspiciatis-qui-laboriosam-esse-quidem-rerum-necessitatibus', '2022-09-10 06:19:42', '2022-09-10 06:19:42'),
(7, 4, 'sys', 'creating', 'sit porro est', 'https://terry.com/saepe-possimus-nesciunt-ut-animi.html', '2022-09-10 06:19:42', '2022-09-10 06:19:42'),
(8, 4, 'usr', 'restoring', 'minus repellat ut', 'https://www.simonis.com/vel-numquam-rerum-voluptatem-saepe-necessitatibus-rerum', '2022-09-10 06:19:42', '2022-09-10 06:19:42'),
(9, 5, 'sys', 'creating', 'harum eos consequatur', 'http://ondricka.com/sit-officia-suscipit-sint-magnam-et-est', '2022-09-10 06:19:42', '2022-09-10 06:19:42'),
(10, 5, 'usr', 'restoring', 'est quam at', 'https://mitchell.com/maxime-voluptatem-qui-et-amet.html', '2022-09-10 06:19:42', '2022-09-10 06:19:42'),
(11, 6, 'sys', 'creating', 'accusantium maxime optio', 'http://www.bogan.com/recusandae-aliquam-ut-ipsam-quia-aut-magnam', '2022-09-10 06:19:42', '2022-09-10 06:19:42'),
(12, 6, 'sys', 'restoring', 'voluptates illo vitae', 'http://sanford.info/fugit-nam-architecto-aut.html', '2022-09-10 06:19:42', '2022-09-10 06:19:42');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `install_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `install_id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES
(1, 1, 'Nikita', 'Marks', 'vullrich@example.org', '803-583-6170', '2022-09-10 06:19:42', '2022-09-10 06:19:42'),
(2, 2, 'Jacklyn', 'Roob', 'monahan.bryana@example.org', '360.755.0826', '2022-09-10 06:19:42', '2022-09-10 06:19:42'),
(3, 3, 'Arvid', 'Hermiston', 'eluettgen@example.com', '(760) 469-5999', '2022-09-10 06:19:42', '2022-09-10 06:19:42'),
(4, 4, 'Ronny', 'Gulgowski', 'wilkinson.corine@example.org', '405.446.8897', '2022-09-10 06:19:42', '2022-09-10 06:19:42'),
(5, 5, 'Santino', 'Reichel', 'wuckert.shanel@example.com', '+1 (386) 976-1883', '2022-09-10 06:19:42', '2022-09-10 06:19:42'),
(6, 6, 'Matilda', 'Windler', 'erwin.larkin@example.com', '+1-804-455-3871', '2022-09-10 06:19:42', '2022-09-10 06:19:42');

-- --------------------------------------------------------

--
-- Table structure for table `data_centers`
--

CREATE TABLE `data_centers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `region` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_centers`
--

INSERT INTO `data_centers` (`id`, `label`, `region`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'us-east-1', 'us-east-1', NULL, '2022-09-10 06:19:37', '2022-09-10 06:19:37');

-- --------------------------------------------------------

--
-- Table structure for table `domains`
--

CREATE TABLE `domains` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `install_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primary` tinyint(1) NOT NULL DEFAULT 0,
  `verified_at` timestamp NULL DEFAULT NULL,
  `verification_failed` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `domains`
--

INSERT INTO `domains` (`id`, `install_id`, `name`, `redirect_to`, `primary`, `verified_at`, `verification_failed`, `created_at`, `updated_at`) VALUES
(1, 1, 'Rosendo.steercampaign.net', NULL, 1, '2022-09-10 06:19:42', 0, '2022-09-10 06:19:42', '2022-09-10 06:19:42'),
(2, 1, 'Bobby.steercampaign.net', NULL, 0, NULL, 0, '2022-09-10 06:19:42', '2022-09-10 06:19:42'),
(3, 2, 'Abdul.steercampaign.net', NULL, 1, '2022-09-10 06:19:42', 0, '2022-09-10 06:19:42', '2022-09-10 06:19:42'),
(4, 2, 'Adam.steercampaign.net', NULL, 0, NULL, 0, '2022-09-10 06:19:42', '2022-09-10 06:19:42'),
(5, 3, 'Roosevelt.steercampaign.net', NULL, 1, '2022-09-10 06:19:42', 0, '2022-09-10 06:19:42', '2022-09-10 06:19:42'),
(6, 3, 'Shane.steercampaign.net', NULL, 0, NULL, 0, '2022-09-10 06:19:42', '2022-09-10 06:19:42'),
(7, 4, 'Genoveva.steercampaign.net', NULL, 1, '2022-09-10 06:19:42', 0, '2022-09-10 06:19:42', '2022-09-10 06:19:42'),
(8, 4, 'Patience.steercampaign.net', NULL, 0, NULL, 0, '2022-09-10 06:19:42', '2022-09-10 06:19:42'),
(9, 5, 'Matteo.steercampaign.net', NULL, 1, '2022-09-10 06:19:42', 0, '2022-09-10 06:19:42', '2022-09-10 06:19:42'),
(10, 5, 'Ima.steercampaign.net', NULL, 0, NULL, 0, '2022-09-10 06:19:42', '2022-09-10 06:19:42'),
(11, 6, 'Derrick.steercampaign.net', NULL, 1, '2022-09-10 06:19:42', 0, '2022-09-10 06:19:42', '2022-09-10 06:19:42'),
(12, 6, 'Yasmine.steercampaign.net', NULL, 0, NULL, 0, '2022-09-10 06:19:42', '2022-09-10 06:19:42'),
(13, 5, 'test.usersproof.com', NULL, 0, NULL, 0, '2022-09-10 21:03:08', '2022-09-10 21:03:08');

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
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `notes`, `account_id`, `created_at`, `updated_at`) VALUES
(1, 'Giles Group', NULL, 2, '2022-09-10 06:19:42', '2022-09-10 06:19:42'),
(2, 'Lane Group', NULL, 2, '2022-09-10 06:19:42', '2022-09-10 06:19:42');

-- --------------------------------------------------------

--
-- Table structure for table `group_site`
--

CREATE TABLE `group_site` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group_id` bigint(20) UNSIGNED NOT NULL,
  `site_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `installs`
--

CREATE TABLE `installs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `site_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('prd','stg','dev') COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` enum('mine','transferable') COLLATE utf8mb4_unicode_ci NOT NULL,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `status` enum('creating','up','down') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'creating',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `installs`
--

INSERT INTO `installs` (`id`, `site_id`, `name`, `type`, `owner`, `locked`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'i1', 'dev', 'mine', 0, 'up', '2022-09-10 06:19:42', '2022-09-10 06:35:18', '2022-09-10 06:35:18'),
(2, 1, 'i2', 'prd', 'mine', 0, 'creating', '2022-09-10 06:19:42', '2022-09-10 06:35:18', '2022-09-10 06:35:18'),
(3, 2, 'i3', 'dev', 'mine', 0, 'up', '2022-09-10 06:19:42', '2022-09-11 05:08:15', '2022-09-11 05:08:15'),
(4, 2, 'i4', 'prd', 'mine', 0, 'creating', '2022-09-10 06:19:42', '2022-09-11 05:08:15', '2022-09-11 05:08:15'),
(5, 3, 'i5', 'dev', 'transferable', 1, 'creating', '2022-09-10 06:19:42', '2022-09-11 05:08:13', '2022-09-11 05:08:13'),
(6, 3, 'i6', 'prd', 'mine', 0, 'up', '2022-09-10 06:19:42', '2022-09-11 05:08:13', '2022-09-11 05:08:13');

-- --------------------------------------------------------

--
-- Table structure for table `invites`
--

CREATE TABLE `invites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_05_03_000001_create_customer_columns', 1),
(4, '2019_05_03_000002_create_subscriptions_table', 1),
(5, '2019_05_03_000003_create_subscription_items_table', 1),
(6, '2019_08_19_000000_create_failed_jobs_table', 1),
(7, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(8, '2021_06_07_101123_create_sessions_table', 1),
(9, '2022_02_16_073118_create_data_centers_table', 1),
(10, '2022_02_16_073135_create_accounts_table', 1),
(11, '2022_02_17_134737_create_sites_table', 1),
(12, '2022_02_18_075938_create_account_user_table', 1),
(13, '2022_02_20_221338_create_installs_table', 1),
(14, '2022_02_20_230332_create_contact_table', 1),
(15, '2022_02_20_231634_create_groups_table', 1),
(16, '2022_02_20_231731_create_group_site_table', 1),
(17, '2022_02_25_112347_create_activity_log_table', 1),
(18, '2022_02_25_112348_add_event_column_to_activity_log_table', 1),
(19, '2022_02_25_112349_add_batch_uuid_column_to_activity_log_table', 1),
(20, '2022_03_02_054644_create_plan_table', 1),
(21, '2022_03_16_151122_create_invites_table', 1),
(22, '2022_03_28_194636_create_transfers_table', 1),
(23, '2022_03_31_081206_create_domains_table', 1),
(24, '2022_04_07_080438_create_jobs_table', 1),
(25, '2022_04_10_141946_create_backups_table', 1),
(26, '2022_04_13_065653_create_webhook_calls_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_product_id` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `stripe_monthly_price_id` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `stripe_yearly_price_id` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `monthly_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `yearly_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contacts` int(11) DEFAULT NULL,
  `features` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `available` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `name`, `display_name`, `short_description`, `stripe_product_id`, `stripe_monthly_price_id`, `stripe_yearly_price_id`, `monthly_price`, `yearly_price`, `contacts`, `features`, `options`, `archived`, `available`, `created_at`, `updated_at`) VALUES
(1, 's1', 'Small - 2,500 Leads', 'Small Mautic installation supports up to 2,500 leads', 'prod_LF6rlbuqYaz6k1', 'price_1KYcdZJJANQIX4AvM2ySzZzb', 'price_1KYcdZJJANQIX4AvZvUiYVZz', '50', '500', 2500, '[\"2,500 Contacts\",\"Backups\",\"Hosting\",\"Security\",\"Scalablity\"]', '[\"backups\",\"hosting\"]', 0, 1, '2022-09-10 06:19:38', '2022-09-10 06:19:38'),
(2, 's2', 'Small - 5,000 Leads', 'Small Mautic installation supports up to 5,000 leads', 'prod_LF6s7lYCom7rlX', 'price_1KYcesJJANQIX4Avxz5hB5bE', 'price_1KYcesJJANQIX4AvzHkRsIJH', '90', '900', 5000, '[\"5,000 Contacts\",\"Backups\",\"Hosting\",\"Security\",\"Scalablity\"]', '[\"backups\",\"hosting\"]', 0, 1, '2022-09-10 06:19:38', '2022-09-10 06:19:38'),
(3, 's3', 'Small  - 10,000 Leads', 'Small Mautic installation supports up to 10,000 leads', 'prod_LF6tUBa5qTUGXi', 'price_1KYcfzJJANQIX4AvptH5iG6h', 'price_1KYcfzJJANQIX4AvQgoUXy6q', '160', '1600', 10000, '[\"10,000 Contacts\",\"Backups\",\"Hosting\",\"Security\",\"Scalablity\"]', '[\"backups\",\"hosting\"]', 0, 1, '2022-09-10 06:19:38', '2022-09-10 06:19:38'),
(4, 's4', 'Medium  - 25,000 Leads', 'Medium Mautic installation supports up to 25,000 leads', 'prod_LF6uwus92kbRIz', 'price_1KYcgYJJANQIX4AvPPlAS0z3', 'price_1KYcgYJJANQIX4AvYfnTSVwv', '420', '4200', 25000, '[\"25,000 Contacts\",\"Backups\",\"Hosting\",\"Security\",\"Scalablity\"]', '[\"backups\",\"hosting\"]', 0, 1, '2022-09-10 06:19:38', '2022-09-10 06:19:38'),
(5, 's5', 'Medium  - 50,000 Leads', 'Medium Mautic installation supports up to 50,000 leads', 'prod_LF6vLk0UO67X1C', 'price_1KYchzJJANQIX4AvRPRPJ1rc', 'price_1KYchzJJANQIX4AvCfLCKqjQ', '800', '8000', 50000, '[\"50,000 Contacts\",\"Backups\",\"Hosting\",\"Security\",\"Scalablity\"]', '[\"backups\",\"hosting\"]', 0, 1, '2022-09-10 06:19:38', '2022-09-10 06:19:38'),
(6, 'e1', 'Medium  - 100,000 Leads', 'Medium Mautic installation supports up to 100,000 leads', 'prod_LF6wAwAk4ArHOS', 'price_1KYcimJJANQIX4Avv75iUzp1', 'price_1KYcimJJANQIX4Av3MAHwrgy', '1250', '15000', 100000, '[\"100,000 Contacts\",\"Backups\",\"Hosting\",\"Security\",\"Scalablity\"]', '[\"backups\",\"hosting\"]', 0, 0, '2022-09-10 06:19:38', '2022-09-10 06:19:38'),
(7, 'e2', 'Large  - 500,000 Leads', 'Large Mautic installation supports up to 500,000 leads', 'prod_LF6x69Hid575eB', 'price_1KYcjqJJANQIX4AvvUdeqRg5', 'price_1KYcjqJJANQIX4Av6PJzUZDc', '5417', '65000', 500000, '[\"500,000 Contacts\",\"Backups\",\"Hosting\",\"Security\",\"Scalablity\"]', '[\"backups\",\"hosting\"]', 0, 0, '2022-09-10 06:19:38', '2022-09-10 06:19:38'),
(8, 'e3', 'Large  - 1 Million Leads', 'Large Mautic installation supports up to 1 Million leads', 'prod_LF6ysK1apCBoV4', 'price_1KYckmJJANQIX4Av1pIg6bmI', 'price_1KYckmJJANQIX4Avc3dSSjXH', '10833', '130000', 1000000, '[\"1 Million Contacts\",\"Backups\",\"Hosting\",\"Security\",\"Scalablity\"]', '[\"backups\",\"hosting\"]', 0, 0, '2022-09-10 06:19:38', '2022-09-10 06:19:38'),
(9, 'e4', 'Large  - 1.5 Million Leads', 'Large Mautic installation supports up to 1.5 Million leads', 'prod_LF6zckLODLIHi3', 'price_1KYcleJJANQIX4AvAQ9YDNng', 'price_1KYcleJJANQIX4AvQmpUq5L5', '15833', '190000', 1500000, '[\"1.5 Million Contacts\",\"Backups\",\"Hosting\",\"Security\",\"Scalablity\"]', '[\"backups\",\"hosting\"]', 0, 0, '2022-09-10 06:19:38', '2022-09-10 06:19:38');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('KVkP3yFSChamMBIkLoPPPTZPbLwvXRBo8inEYIi4', 2, '172.18.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiV2htVXI2RXJKVzFJam12NjZ6eE1uM3lhQ0E4eHZUWmN2N3NMb0Z1eiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHBzOi8vc2MuZGRldi5zaXRlL2FjY291bnQvMi9zaXRlcy9jcmVhdGUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfM2RjN2E5MTNlZjVmZDRiODkwZWNhYmUzNDg3MDg1NTczZTE2Y2Y4MiI7aToyO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJDkySVhVTnBrak8wck9RNWJ5TWkuWWU0b0tvRWEzUm85bGxDLy5vZy9hdDIudWhlV0cvaWdpIjt9', 1662959903);

-- --------------------------------------------------------

--
-- Table structure for table `sites`
--

CREATE TABLE `sites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `subscription_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transferable` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sites`
--

INSERT INTO `sites` (`id`, `account_id`, `subscription_id`, `name`, `transferable`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 1, 'Erna Site', 0, '2022-09-10 06:19:42', '2022-09-10 06:35:18', '2022-09-10 06:35:18'),
(2, 2, 2, 'Elenora Site', 0, '2022-09-10 06:19:42', '2022-09-11 05:08:15', '2022-09-11 05:08:15'),
(3, 2, 3, 'Erna Site', 0, '2022-09-10 06:19:42', '2022-09-11 05:08:13', '2022-09-11 05:08:13');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `account_id`, `name`, `stripe_id`, `stripe_status`, `stripe_price`, `quantity`, `trial_ends_at`, `ends_at`, `created_at`, `updated_at`) VALUES
(1, 2, 's1', 'sub_1Kbft4JJANQIX4AvXASaiV7R', 'active', 'price_1KYcdZJJANQIX4AvM2ySzZzb', 1, NULL, NULL, '2022-09-10 06:19:42', '2022-09-10 06:19:42'),
(2, 2, 's5', 'sub_1KbfurJJANQIX4AvVTWFgUVW', 'active', 'price_1KYchzJJANQIX4AvCfLCKqjQ', 1, NULL, NULL, '2022-09-10 06:19:42', '2022-09-10 06:19:42'),
(3, 2, 's1', 'sub_1KbfwQJJANQIX4AvatnKerTc', 'active', 'price_1KYcdZJJANQIX4AvM2ySzZzb', 1, NULL, NULL, '2022-09-10 06:19:42', '2022-09-10 06:19:42');

-- --------------------------------------------------------

--
-- Table structure for table `subscription_items`
--

CREATE TABLE `subscription_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subscription_id` bigint(20) UNSIGNED NOT NULL,
  `stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_product` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscription_items`
--

INSERT INTO `subscription_items` (`id`, `subscription_id`, `stripe_id`, `stripe_product`, `stripe_price`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 1, 'si_LIGPEjRwAEbdS8', 'prod_LF6rlbuqYaz6k1', 'price_1KYcdZJJANQIX4AvM2ySzZzb', 1, NULL, NULL),
(2, 2, 'si_LIGRB2xa5SrEdq', 'prod_LF6vLk0UO67X1C', 'price_1KYchzJJANQIX4AvCfLCKqjQ', 1, NULL, NULL),
(3, 3, 'si_LIGTYjTvt0jSF8', 'prod_LF6rlbuqYaz6k1', 'price_1KYcdZJJANQIX4AvM2ySzZzb', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `install_id` bigint(20) UNSIGNED NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `experince` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_last_four` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `phone`, `job_title`, `employer`, `experince`, `company_name`, `created_at`, `updated_at`, `stripe_id`, `pm_type`, `pm_last_four`, `trial_ends_at`) VALUES
(1, 'Brigitte', 'Schoen', 'm.abumusa@gmail.com', '2022-09-10 06:19:42', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, 'fzag8BcYuu', '+1-765-213-2322', 'Executive', 'Myself, full-time', 'I am a beginner', 'Luettgen-Koss', '2022-09-10 06:19:42', '2022-09-10 06:19:42', NULL, NULL, NULL, NULL),
(2, 'Elinore', 'Hansen', 'email0@domain.com', '2022-09-10 06:19:42', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, 'IYA6olSell', '1-979-859-8761', 'Executive', 'Business/In-house', 'I feel comfortable with most Mautic-related tasks', 'Blick-Kovacek', '2022-09-10 06:19:42', '2022-09-10 06:19:42', NULL, NULL, NULL, NULL),
(3, 'Malcolm', 'Ryan', 'email1@domain.com', '2022-09-10 06:19:42', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, 'sEyspBuN4x', '952.283.9017', 'Developer', 'Myself, full-time', 'I am an expert', 'Nitzsche Group', '2022-09-10 06:19:42', '2022-09-10 06:19:42', NULL, NULL, NULL, NULL),
(4, 'Sydnie', 'Mayert', 'email2@domain.com', '2022-09-10 06:19:42', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, 'ljb7Yo2P3s', '1-269-894-1628', 'Project Manager', 'Agency', 'I am an expert', 'Daugherty LLC', '2022-09-10 06:19:42', '2022-09-10 06:19:42', NULL, NULL, NULL, NULL),
(5, 'Annabell', 'Ortiz', 'email3@domain.com', '2022-09-10 06:19:42', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, 'ikN1qUsFTk', '+1-419-790-1238', 'IT Professional', 'Myself, full-time', 'I feel comfortable with most Mautic-related tasks', 'Kessler, Kuphal and Gulgowski', '2022-09-10 06:19:42', '2022-09-10 06:19:42', NULL, NULL, NULL, NULL),
(6, 'Treva', 'Gibson', 'email4@domain.com', '2022-09-10 06:19:42', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2KAkTnpP8q', '281-259-8193', 'Designer', 'Myself, full-time', 'I feel comfortable with most Mautic-related tasks', 'Lehner-Green', '2022-09-10 06:19:42', '2022-09-10 06:19:42', NULL, NULL, NULL, NULL),
(7, 'Jayce', 'Corwin', 'email5@domain.com', '2022-09-10 06:19:42', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, 'le3EEzukxR', '1-503-968-9812', 'Designer', 'Myself, full-time', 'I have some experience', 'Luettgen-Kub', '2022-09-10 06:19:42', '2022-09-10 06:19:42', NULL, NULL, NULL, NULL),
(8, 'Anderson', 'Tromp', 'email6@domain.com', '2022-09-10 06:19:42', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, 'TbDVpa9afB', '(848) 939-5393', 'Project Manager', 'Business/In-house', 'I am a beginner', 'Ritchie-Kemmer', '2022-09-10 06:19:42', '2022-09-10 06:19:42', NULL, NULL, NULL, NULL),
(9, 'Onie', 'Rowe', 'email7@domain.com', '2022-09-10 06:19:42', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, 'uQujGOB2hJ', '+14422408241', 'Designer', 'Myself, freelance', 'I am an expert', 'Barrows-Luettgen', '2022-09-10 06:19:42', '2022-09-10 06:19:42', NULL, NULL, NULL, NULL),
(10, 'Chelsea', 'Dickinson', 'email8@domain.com', '2022-09-10 06:19:42', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, 'hDpn6kPawn', '+13024438965', 'Billing Manager', 'Business/In-house', 'I feel comfortable with most Mautic-related tasks', 'Rempel, Monahan and Labadie', '2022-09-10 06:19:42', '2022-09-10 06:19:42', NULL, NULL, NULL, NULL),
(11, 'Yvonne', 'Carter', 'email9@domain.com', '2022-09-10 06:19:42', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, 'ZuXjuQDJ9L', '+1.770.208.7475', 'Executive', 'Business/In-house', 'I am an expert', 'Hartmann, Pollich and Rosenbaum', '2022-09-10 06:19:42', '2022-09-10 06:19:42', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `webhook_calls`
--

CREATE TABLE `webhook_calls` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `exception` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_data_center_id_foreign` (`data_center_id`),
  ADD KEY `accounts_name_index` (`name`),
  ADD KEY `accounts_stripe_id_index` (`stripe_id`);

--
-- Indexes for table `account_user`
--
ALTER TABLE `account_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_user_account_id_foreign` (`account_id`),
  ADD KEY `account_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject` (`subject_type`,`subject_id`),
  ADD KEY `causer` (`causer_type`,`causer_id`),
  ADD KEY `activity_log_account_id_foreign` (`account_id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `backups`
--
ALTER TABLE `backups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `backups_install_id_foreign` (`install_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_install_id_foreign` (`install_id`);

--
-- Indexes for table `data_centers`
--
ALTER TABLE `data_centers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `domains`
--
ALTER TABLE `domains`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `domains_name_unique` (`name`),
  ADD KEY `domains_install_id_foreign` (`install_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groups_account_id_foreign` (`account_id`);

--
-- Indexes for table `group_site`
--
ALTER TABLE `group_site`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_site_group_id_foreign` (`group_id`),
  ADD KEY `group_site_site_id_foreign` (`site_id`);

--
-- Indexes for table `installs`
--
ALTER TABLE `installs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `installs_name_unique` (`name`),
  ADD KEY `installs_site_id_foreign` (`site_id`);

--
-- Indexes for table `invites`
--
ALTER TABLE `invites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invites_email_unique` (`email`),
  ADD UNIQUE KEY `invites_token_unique` (`token`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plans_name_unique` (`name`),
  ADD UNIQUE KEY `plans_stripe_product_id_unique` (`stripe_product_id`),
  ADD UNIQUE KEY `plans_stripe_monthly_price_id_unique` (`stripe_monthly_price_id`),
  ADD UNIQUE KEY `plans_stripe_yearly_price_id_unique` (`stripe_yearly_price_id`),
  ADD UNIQUE KEY `plans_monthly_price_unique` (`monthly_price`),
  ADD UNIQUE KEY `plans_yearly_price_unique` (`yearly_price`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sites_subscription_id_foreign` (`subscription_id`),
  ADD KEY `sites_account_id_foreign` (`account_id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscriptions_stripe_id_unique` (`stripe_id`),
  ADD KEY `subscriptions_account_id_stripe_status_index` (`account_id`,`stripe_status`);

--
-- Indexes for table `subscription_items`
--
ALTER TABLE `subscription_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscription_items_subscription_id_stripe_price_unique` (`subscription_id`,`stripe_price`),
  ADD UNIQUE KEY `subscription_items_stripe_id_unique` (`stripe_id`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfers_install_id_foreign` (`install_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_stripe_id_index` (`stripe_id`);

--
-- Indexes for table `webhook_calls`
--
ALTER TABLE `webhook_calls`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `account_user`
--
ALTER TABLE `account_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `backups`
--
ALTER TABLE `backups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `data_centers`
--
ALTER TABLE `data_centers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `domains`
--
ALTER TABLE `domains`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `group_site`
--
ALTER TABLE `group_site`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `installs`
--
ALTER TABLE `installs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `invites`
--
ALTER TABLE `invites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sites`
--
ALTER TABLE `sites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `subscription_items`
--
ALTER TABLE `subscription_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `webhook_calls`
--
ALTER TABLE `webhook_calls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_data_center_id_foreign` FOREIGN KEY (`data_center_id`) REFERENCES `data_centers` (`id`);

--
-- Constraints for table `account_user`
--
ALTER TABLE `account_user`
  ADD CONSTRAINT `account_user_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `account_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD CONSTRAINT `activity_log_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`);

--
-- Constraints for table `backups`
--
ALTER TABLE `backups`
  ADD CONSTRAINT `backups_install_id_foreign` FOREIGN KEY (`install_id`) REFERENCES `installs` (`id`);

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_install_id_foreign` FOREIGN KEY (`install_id`) REFERENCES `installs` (`id`);

--
-- Constraints for table `domains`
--
ALTER TABLE `domains`
  ADD CONSTRAINT `domains_install_id_foreign` FOREIGN KEY (`install_id`) REFERENCES `installs` (`id`);

--
-- Constraints for table `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `groups_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`);

--
-- Constraints for table `group_site`
--
ALTER TABLE `group_site`
  ADD CONSTRAINT `group_site_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  ADD CONSTRAINT `group_site_site_id_foreign` FOREIGN KEY (`site_id`) REFERENCES `sites` (`id`);

--
-- Constraints for table `installs`
--
ALTER TABLE `installs`
  ADD CONSTRAINT `installs_site_id_foreign` FOREIGN KEY (`site_id`) REFERENCES `sites` (`id`);

--
-- Constraints for table `sites`
--
ALTER TABLE `sites`
  ADD CONSTRAINT `sites_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `sites_subscription_id_foreign` FOREIGN KEY (`subscription_id`) REFERENCES `subscriptions` (`id`);

--
-- Constraints for table `transfers`
--
ALTER TABLE `transfers`
  ADD CONSTRAINT `transfers_install_id_foreign` FOREIGN KEY (`install_id`) REFERENCES `installs` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

create database i1;
use i1;
CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `name` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `name`) VALUES
(1, 1),
(2, 2);
COMMIT;


create database i2;
use i2;
CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `name` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `name`) VALUES
(1, 1),
(2, 2);
COMMIT;


create database i3;
use i3;
CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `name` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `name`) VALUES
(1, 1),
(2, 2);
COMMIT;


create database i4;
use i4;
CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `name` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `name`) VALUES
(1, 1),
(2, 2);
COMMIT;


create database i5;
use i5;
CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `name` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `name`) VALUES
(1, 1),
(2, 2);
COMMIT;


create database i6;
use i6;
CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `name` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `name`) VALUES
(1, 1),
(2, 2);
COMMIT;


