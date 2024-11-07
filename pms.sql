-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.1.72-community - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for pms
CREATE DATABASE IF NOT EXISTS `pms` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `pms`;

-- Dumping structure for table pms.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table pms.cache: 0 rows
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;

-- Dumping structure for table pms.cache_locks
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table pms.cache_locks: 0 rows
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;

-- Dumping structure for table pms.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table pms.failed_jobs: 0 rows
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table pms.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table pms.jobs: 0 rows
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;

-- Dumping structure for table pms.job_batches
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext COLLATE utf8_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8_unicode_ci,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table pms.job_batches: 0 rows
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;

-- Dumping structure for table pms.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table pms.migrations: 4 rows
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(4, '0001_01_01_000000_create_users_table', 1),
	(5, '0001_01_01_000001_create_cache_table', 1),
	(6, '0001_01_01_000002_create_jobs_table', 1),
	(7, '2024_11_06_145732_create_products_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table pms.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table pms.password_reset_tokens: 0 rows
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;

-- Dumping structure for table pms.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `price` decimal(8,2) NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_product_id_unique` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table pms.products: 30 rows
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `product_id`, `name`, `description`, `price`, `stock`, `image`, `created_at`, `updated_at`) VALUES
	(1, 'P3RtOGP', 'Funk-Auer Mobile', 'Cumque laboriosam nulla qui dolorem perferendis similique blanditiis sequi ipsum aperiam officiis.', 836.47, 562, 'images/MhXUQSLhQsfejC0ngkLU6LdzI2OyiIpIkCvPdMzI.jpg', '2024-11-07 14:49:35', '2024-11-07 14:51:13'),
	(2, 'PoNuI8i', 'Macejkovic PLC Mobile', 'Debitis rerum aut nihil itaque impedit vitae voluptas omnis libero error sunt cupiditate.', 766.66, 540, '', '2024-11-07 14:49:35', '2024-11-07 14:49:35'),
	(3, 'PX8MMCt', 'Kertzmann PLC Mobile', 'Totam inventore minima asperiores ratione molestiae nostrum veritatis quia officia a reiciendis sapiente voluptates.', 585.96, 446, '', '2024-11-07 14:49:35', '2024-11-07 14:49:35'),
	(4, 'POqIRjE', 'Murray Group Mobile', 'Iure corrupti placeat reiciendis quod natus reiciendis sit.', 953.82, 255, '', '2024-11-07 14:49:35', '2024-11-07 14:49:35'),
	(5, 'PoWlcsF', 'Funk-Parisian Mobile', 'Amet et voluptatem culpa nulla rem iste ea quia nihil repudiandae.', 590.82, 577, '', '2024-11-07 14:49:35', '2024-11-07 14:49:35'),
	(6, 'PfmGkZU', 'Kreiger LLC Mobile', 'Et aut id rerum ut possimus enim nihil debitis in.', 775.00, 68, '', '2024-11-07 14:49:35', '2024-11-07 14:49:35'),
	(7, 'PQUfm5l', 'Kris LLC Mobile', 'Modi culpa dolor earum natus sit repellat adipisci ut ratione dolor dolorem fugiat.', 416.76, 439, '', '2024-11-07 14:49:35', '2024-11-07 14:49:35'),
	(8, 'Pq92W4m', 'Hyatt-Heathcote Mobile', 'Exercitationem reprehenderit dolores nihil perferendis eaque voluptatem qui ut dolor.', 642.20, 561, '', '2024-11-07 14:49:35', '2024-11-07 14:49:35'),
	(9, 'PqBl9gF', 'Wiza, Daugherty and Ziemann Mobile', 'Officiis soluta saepe ut ad odio aperiam hic et alias.', 298.13, 737, '', '2024-11-07 14:49:35', '2024-11-07 14:49:35'),
	(10, 'P2vyBf8', 'Schroeder, Huel and Tremblay Mobile', 'Dignissimos et repudiandae tenetur qui iure nihil ipsam.', 690.25, 258, '', '2024-11-07 14:49:35', '2024-11-07 14:49:35'),
	(11, 'PAbrt8P', 'Stracke and Sons Mobile', 'Explicabo hic officiis qui sit repudiandae doloremque autem dolor quis quisquam quis.', 115.30, 178, '', '2024-11-07 14:49:35', '2024-11-07 14:49:35'),
	(12, 'PmbU9c1', 'Friesen, Satterfield and Schulist Mobile', 'Adipisci eum fuga quisquam sed quasi itaque quam molestias aut magnam minus modi.', 389.25, 114, '', '2024-11-07 14:49:35', '2024-11-07 14:49:35'),
	(13, 'PyeSVF2', 'Douglas Ltd Mobile', 'Quis aliquam animi laborum in cumque eius dolorum dolorem sequi quos repellendus deleniti.', 633.85, 645, '', '2024-11-07 14:49:35', '2024-11-07 14:49:35'),
	(14, 'PZd8fQK', 'Schamberger LLC Mobile', 'Repudiandae ut cupiditate voluptatem doloribus architecto doloremque libero quaerat et.', 661.21, 561, '', '2024-11-07 14:49:35', '2024-11-07 14:49:35'),
	(15, 'Pro0AVO', 'Ebert, Deckow and Dibbert Mobile', 'Consectetur quidem dicta autem eos eligendi quia laboriosam libero incidunt explicabo qui eos qui.', 772.37, 76, '', '2024-11-07 14:49:35', '2024-11-07 14:49:35'),
	(16, 'PsDGbYc', 'Bergnaum-Hessel Mobile', 'Odit perspiciatis voluptates est voluptate sint id.', 769.02, 443, '', '2024-11-07 14:49:35', '2024-11-07 14:49:35'),
	(17, 'PLiPGjz', 'Will, Veum and Dibbert Mobile', 'Rem sed sed maiores quas ea illo rem voluptas.', 149.28, 20, '', '2024-11-07 14:49:35', '2024-11-07 14:49:35'),
	(18, 'PyNjiwY', 'Herzog-Herman Mobile', 'Asperiores possimus qui molestiae ut optio magnam vero aut ipsum ut qui id qui.', 988.47, 214, '', '2024-11-07 14:49:35', '2024-11-07 14:49:35'),
	(19, 'PLKZ0Hv', 'Moen PLC Mobile', 'Voluptatem alias voluptatibus quam earum architecto inventore et dolore et quo voluptas iste.', 496.23, 677, '', '2024-11-07 14:49:35', '2024-11-07 14:49:35'),
	(20, 'PTtLZyO', 'Waelchi, Corwin and Raynor Mobile', 'Ea cumque eum aspernatur eos eveniet quis.', 212.14, 646, '', '2024-11-07 14:49:35', '2024-11-07 14:49:35'),
	(21, 'P6zeCzP', 'Little and Sons Mobile', 'Et neque sunt quisquam recusandae odit temporibus nostrum vel molestias fugiat amet.', 878.79, 739, '', '2024-11-07 14:49:35', '2024-11-07 14:49:35'),
	(22, 'PUl5k6M', 'Osinski-Bergstrom Mobile', 'Laborum aut laudantium et enim modi fugit.', 214.47, 40, '', '2024-11-07 14:49:35', '2024-11-07 14:49:35'),
	(23, 'PzAIkcW', 'Russel-Ebert Mobile', 'Placeat velit et autem ipsum accusamus molestias necessitatibus.', 469.21, 428, '', '2024-11-07 14:49:35', '2024-11-07 14:49:35'),
	(24, 'PIBLVwa', 'Tillman, Reichel and Jenkins Mobile', 'Iusto non sunt quas et ut dolorem.', 178.32, 979, '', '2024-11-07 14:49:35', '2024-11-07 14:49:35'),
	(25, 'PG6EgTy', 'Altenwerth Group Mobile', 'Magnam perferendis a sunt voluptates reiciendis et nisi impedit ut quis.', 520.87, 295, '', '2024-11-07 14:49:35', '2024-11-07 14:49:35'),
	(26, 'PlalscL', 'Marks, Hyatt and Dach Mobile', 'Suscipit non ratione dolorum voluptate voluptatum sapiente et sunt quasi non eum quae.', 689.75, 794, '', '2024-11-07 14:49:35', '2024-11-07 14:49:35'),
	(27, 'PmWiJFW', 'Kerluke-Jenkins Mobile', 'Iste provident quia explicabo perferendis molestias sit culpa rem accusamus eaque quibusdam dolore itaque.', 810.17, 435, '', '2024-11-07 14:49:35', '2024-11-07 14:49:35'),
	(28, 'PfBOH0z', 'Gottlieb-Ruecker Mobile', 'Mollitia ullam accusamus qui perspiciatis recusandae in fuga facilis assumenda.', 264.96, 939, '', '2024-11-07 14:49:35', '2024-11-07 14:49:35'),
	(29, 'P1MxrTU', 'Runte-O\'Connell Mobile', 'Dolorem impedit similique odit amet itaque aliquam ab enim quas sunt earum placeat.', 826.53, 899, '', '2024-11-07 14:49:35', '2024-11-07 14:49:35'),
	(30, 'P1GHDFo', 'Rolfson Ltd Mobile', 'Eum eum omnis earum impedit a et qui harum velit.', 902.17, 772, '', '2024-11-07 14:49:35', '2024-11-07 14:49:35');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Dumping structure for table pms.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8_unicode_ci,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table pms.sessions: 1 rows
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('osGEXP7d10je7FcJ1TrmDkVU2TRkxRVZwyYll7eZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVXN3bzBEcGpCRDNaTVJHUWUzZ3YzSTl1UjFPSFE1VmM4MFBGVEJRZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9wcm9kdWN0cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730991073);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;

-- Dumping structure for table pms.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table pms.users: 0 rows
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
