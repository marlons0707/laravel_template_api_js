-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.24 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para example_db_js
CREATE DATABASE IF NOT EXISTS `example_db_js` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci */;
USE `example_db_js`;

-- Volcando estructura para tabla example_db_js.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Category name, must be unique',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT 'Optional description of the category',
  `status` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y' COMMENT 'Status: Y for active, N for inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla example_db_js.categories: ~20 rows (aproximadamente)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `name`, `description`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'Quaerat', 'Ad corrupti dolorem cumque.', 'N', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(2, 'Quas', 'Esse eos veritatis eaque possimus maiores.', 'N', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(3, 'Quia', 'Aut perferendis ex error enim enim rerum.', 'Y', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(4, 'Ratione', 'Aperiam eaque qui atque animi accusamus reiciendis repellat.', 'N', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(5, 'Officiis', 'Ab earum quas et vero corrupti.', 'N', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(6, 'Unde', 'Reiciendis odio quas est id.', 'N', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(7, 'Qui', 'Exercitationem sunt earum saepe.', 'N', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(8, 'Porro', 'Quos et dolorum vel explicabo sint similique omnis.', 'Y', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(9, 'Nesciunt', 'Quia voluptatem placeat eaque laborum laudantium voluptatem unde.', 'Y', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(10, 'Eveniet', 'Ut non repellendus molestiae magni.', 'N', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(11, 'Beatae', 'In et cupiditate et hic quos beatae repellat aliquid.', 'N', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(12, 'Non', 'Velit quia aut architecto dignissimos incidunt exercitationem.', 'Y', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(13, 'Ea', 'Atque atque aspernatur adipisci et.', 'Y', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(14, 'Nostrum', 'Omnis voluptas minima atque aut rem qui qui.', 'Y', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(15, 'Deleniti', 'Magni cupiditate excepturi minima provident.', 'N', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(16, 'Repudiandae', 'Et est quae eius qui animi accusantium cupiditate.', 'Y', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(17, 'Sunt', 'Animi eos omnis est et dolorem culpa.', 'N', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(18, 'Itaque', 'Qui accusamus sit quae sed excepturi veritatis et.', 'Y', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(19, 'Neque', 'Explicabo inventore et et error reiciendis fugiat voluptas accusantium.', 'N', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(20, 'Accusamus', 'Quia non rerum labore quasi dolorum in.', 'N', '2025-04-14 12:35:20', '2025-04-14 12:35:20');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Volcando estructura para tabla example_db_js.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla example_db_js.failed_jobs: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Volcando estructura para tabla example_db_js.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla example_db_js.migrations: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(32, '2014_10_12_000000_create_users_table', 1),
	(33, '2014_10_12_100000_create_password_resets_table', 1),
	(34, '2019_08_19_000000_create_failed_jobs_table', 1),
	(35, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(36, '2025_04_08_195959_create_categories_table', 1),
	(37, '2025_04_08_200035_create_units_table', 1),
	(38, '2025_04_08_200705_create_products_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Volcando estructura para tabla example_db_js.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla example_db_js.password_resets: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Volcando estructura para tabla example_db_js.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla example_db_js.personal_access_tokens: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`, `expires_at`) VALUES
	(1, 'App\\Models\\User', 11, 'KultiverWebToken', 'd93fe4a7d155061cbf02e4b709ec220f726e1d47dc8164b7959cf022cd05af11', '["*"]', '2025-04-14 12:36:58', '2025-04-14 12:35:40', '2025-04-14 12:36:58', NULL);
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- Volcando estructura para tabla example_db_js.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Product name',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT 'Detailed product description',
  `category_id` bigint(20) unsigned NOT NULL,
  `unit_id` bigint(20) unsigned NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Selling price',
  `cost` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Cost price',
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Path to the product image',
  `stock` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Available stock quantity',
  `status` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y' COMMENT 'Product status: Y for active, N for inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_name_unique` (`name`),
  KEY `products_category_id_foreign` (`category_id`),
  KEY `products_unit_id_foreign` (`unit_id`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla example_db_js.products: ~20 rows (aproximadamente)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `name`, `description`, `category_id`, `unit_id`, `price`, `cost`, `image_path`, `stock`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'Dolore', 'Fugit earum velit sapiente eum.', 1, 1, 944.20, 230.49, 'https://via.placeholder.com/640x480.png/0066cc?text=products+Faker+ullam', 56, 'Y', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(2, 'Magni', 'Quisquam eligendi eveniet sit aut.', 2, 2, 32.98, 531.61, 'https://via.placeholder.com/640x480.png/00ff22?text=products+Faker+aut', 60, 'N', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(3, 'Cupiditate', 'Dolore esse deleniti maiores quia vel non qui tempora.', 3, 3, 623.48, 979.76, 'https://via.placeholder.com/640x480.png/0000ff?text=products+Faker+in', 33, 'N', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(4, 'Dolorem', 'Qui assumenda aut nobis.', 4, 4, 905.94, 647.58, 'https://via.placeholder.com/640x480.png/005566?text=products+Faker+quis', 32, 'Y', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(5, 'Consequatur', 'Hic inventore harum dolorem sint sint.', 5, 5, 464.68, 220.36, 'https://via.placeholder.com/640x480.png/00ee77?text=products+Faker+sit', 7, 'N', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(6, 'Possimus', 'Quis debitis temporibus sunt beatae quia aut ipsam.', 6, 6, 934.82, 809.19, 'https://via.placeholder.com/640x480.png/00ee88?text=products+Faker+soluta', 73, 'Y', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(7, 'Ullam', 'Quae assumenda dicta et ab beatae esse.', 7, 7, 740.42, 695.51, 'https://via.placeholder.com/640x480.png/000077?text=products+Faker+iste', 52, 'Y', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(8, 'Minus', 'Deleniti saepe voluptatum ea aut.', 8, 8, 618.20, 966.49, 'https://via.placeholder.com/640x480.png/0011dd?text=products+Faker+esse', 84, 'N', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(9, 'Reprehenderit', 'Quae consectetur atque unde quam.', 9, 9, 644.37, 845.38, 'https://via.placeholder.com/640x480.png/00ff88?text=products+Faker+provident', 33, 'N', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(10, 'Magnam', 'Ut sed magni velit enim temporibus facere numquam.', 10, 10, 189.28, 14.41, 'https://via.placeholder.com/640x480.png/0000aa?text=products+Faker+aliquid', 56, 'N', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(11, 'Veniam', 'Sunt vel temporibus placeat ut est eius corrupti.', 11, 11, 229.00, 366.56, 'https://via.placeholder.com/640x480.png/00ccaa?text=products+Faker+voluptatem', 50, 'N', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(12, 'Harum', 'Repellat natus laboriosam ipsa tenetur omnis inventore.', 12, 12, 862.33, 884.50, 'https://via.placeholder.com/640x480.png/002244?text=products+Faker+quia', 73, 'Y', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(13, 'Autem', 'Asperiores similique accusantium voluptatibus dignissimos corrupti.', 13, 13, 258.02, 888.55, 'https://via.placeholder.com/640x480.png/0077ff?text=products+Faker+magnam', 78, 'N', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(14, 'Dicta', 'Vitae animi consequatur voluptatum consequatur reprehenderit et.', 14, 14, 737.04, 231.98, 'https://via.placeholder.com/640x480.png/005533?text=products+Faker+incidunt', 25, 'N', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(15, 'Aspernatur', 'Maiores qui et aperiam perspiciatis eligendi.', 15, 15, 826.63, 140.86, 'https://via.placeholder.com/640x480.png/001100?text=products+Faker+quia', 30, 'N', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(16, 'Repellat', 'Nisi ratione sint optio deserunt voluptatem qui.', 16, 16, 467.92, 234.38, 'https://via.placeholder.com/640x480.png/007755?text=products+Faker+incidunt', 98, 'N', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(17, 'Fuga', 'Quibusdam et et consequatur voluptatem enim nostrum et est.', 17, 17, 654.60, 288.74, 'https://via.placeholder.com/640x480.png/00ff11?text=products+Faker+dolor', 25, 'Y', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(18, 'Enim', 'Ut et rerum vero aliquam eaque.', 18, 18, 108.77, 982.57, 'https://via.placeholder.com/640x480.png/00bb22?text=products+Faker+provident', 100, 'N', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(19, 'Dignissimos', 'Ab velit molestiae voluptas.', 19, 19, 593.51, 537.47, 'https://via.placeholder.com/640x480.png/00bb11?text=products+Faker+et', 80, 'Y', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(20, 'Minima', 'Perspiciatis eum temporibus molestiae a.', 20, 20, 484.41, 510.45, 'https://via.placeholder.com/640x480.png/0077dd?text=products+Faker+ut', 87, 'N', '2025-04-14 12:35:20', '2025-04-14 12:35:20');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Volcando estructura para tabla example_db_js.units
CREATE TABLE IF NOT EXISTS `units` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Unique name of the unit',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Optional description of the unit',
  `status` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y' COMMENT 'Status of the unit: Y for active, N for inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `units_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla example_db_js.units: ~20 rows (aproximadamente)
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` (`id`, `name`, `description`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'Molestias', 'Assumenda nihil praesentium modi perferendis occaecati.', 'Y', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(2, 'Doloremque', 'Dolorum at nobis minus saepe deleniti sunt nulla.', 'N', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(3, 'Occaecati', 'Quibusdam quod sit porro voluptatem vitae aut.', 'N', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(4, 'Est', 'Dignissimos accusantium quasi quasi sit.', 'Y', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(5, 'Et', 'Eum possimus qui reiciendis sed labore.', 'N', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(6, 'Modi', 'Est ullam tempora molestiae autem.', 'N', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(7, 'Sit', 'Aspernatur reprehenderit ipsam ut dolores.', 'N', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(8, 'Ut', 'Tempore repellendus nostrum tempora enim aut qui et.', 'N', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(9, 'Esse', 'Doloremque eos quidem saepe tempore.', 'N', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(10, 'Facere', 'Accusantium sint dolore ut.', 'Y', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(11, 'Id', 'Et tenetur et eos quia itaque corrupti sit aliquam.', 'Y', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(12, 'Quis', 'Minima nihil quod necessitatibus.', 'N', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(13, 'Aliquid', 'Iste est aut voluptatibus ut voluptatibus.', 'N', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(14, 'Sed', 'Est laborum temporibus aperiam nostrum vero inventore dignissimos.', 'N', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(15, 'Corporis', 'Non voluptatem consequatur fugit in unde a optio.', 'N', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(16, 'Velit', 'Adipisci nobis quis architecto nisi voluptatem dolorem qui.', 'Y', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(17, 'Omnis', 'Eos et assumenda et voluptas neque est fugit non.', 'Y', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(18, 'Quasi', 'Odit qui sit incidunt nisi nam.', 'Y', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(19, 'At', 'Quod consequatur consequatur blanditiis omnis rem odio.', 'N', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(20, 'Aliquam', 'Fugiat qui eos consequatur dolores provident ullam perspiciatis voluptas.', 'Y', '2025-04-14 12:35:20', '2025-04-14 12:35:20');
/*!40000 ALTER TABLE `units` ENABLE KEYS */;

-- Volcando estructura para tabla example_db_js.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `role` enum('admin','vendor') COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `notifications` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_unique` (`user`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla example_db_js.users: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `user`, `email`, `email_verified_at`, `role`, `password`, `active`, `notifications`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Mr. Ray Kemmer', 'tcasper', 'kris.alyce@example.net', '2025-04-14 12:35:19', 'admin', '$2y$10$c9GAjgejZdOpWezyxVz/Z.it3N6h6i.Dvaf5rG2h6Vx6ncHGZsrvq', 'Y', 'Y', 'T6wpnPTYns', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(2, 'Geovanni Grimes', 'otis08', 'wzemlak@example.com', '2025-04-14 12:35:19', 'admin', '$2y$10$ejAiPAZ7KHoGpHXFgiHlz.diFh2CDPIrshewfJTiWqeqzXP3OiUUG', 'Y', 'Y', 'HwXBEcsUTA', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(3, 'Ms. Nella Considine DVM', 'jamarcus.haag', 'npfeffer@example.org', '2025-04-14 12:35:19', 'admin', '$2y$10$w.9Q39Z5hI5ZP0C5hD7QJOS8poce31Hu271HvASnN1LfawrTPtxyK', 'Y', 'Y', 'eChmtkzCrK', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(4, 'Ena Batz', 'sbruen', 'mallie86@example.com', '2025-04-14 12:35:19', 'vendor', '$2y$10$WFJT2cKMfxVlZ2XjmaO.HOOt2nRoUJBUdDCS.cswnFnwvMethsH4S', 'Y', 'Y', 'BODI8XtvvW', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(5, 'Parker Pouros', 'hudson.michaela', 'aidan10@example.org', '2025-04-14 12:35:19', 'admin', '$2y$10$t.CiXn8VB0PR7GqwhBuiye7sc9pUIOHdDu93mAYFBRpBn.7keNyF.', 'Y', 'Y', 'fhis2cHRo1', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(6, 'Alfredo Koelpin', 'xfisher', 'briana.powlowski@example.org', '2025-04-14 12:35:19', 'admin', '$2y$10$DnqxF/hAoJ8nopb/gWIrzuQ1TXNjq2BEol/NI26MqmGpYjBXHN/em', 'Y', 'Y', 'AbwQmktNiH', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(7, 'Ms. Wilma Eichmann MD', 'marjorie83', 'hgrady@example.net', '2025-04-14 12:35:19', 'admin', '$2y$10$SbdZSPDkDqs5ejzhPDQ7xOS8SJGIz4ZHf.yBjvf6p1lv8lQaYK1o2', 'Y', 'Y', '0FescpA7Et', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(8, 'Raul Romaguera', 'ilowe', 'berge.savanna@example.com', '2025-04-14 12:35:19', 'admin', '$2y$10$TntZ1iUtNxZzaw/N63U5eeEK/2ED/gI77qQaHNhq0xpStV8db8cPu', 'Y', 'Y', 'oc6gmAygfN', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(9, 'Austen Daugherty', 'ubreitenberg', 'madisyn.wolff@example.com', '2025-04-14 12:35:20', 'vendor', '$2y$10$7nkaRviPXsjvsovg9tAXHuT5Df.qZVpKNHw0jymaEJ7o6QgJCXFo.', 'Y', 'Y', 'Aj0Otx793E', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(10, 'Juan Pérez', 'cordia.okeefe', 'jperez@gmail.com', '2025-04-14 12:35:20', 'vendor', '$2y$10$ANiUEOSNv5WxYJUzaAh9k.eS2AwNXaz87Dvp7mgWhQd.ShmKJwwRy', 'N', 'Y', 'hzMqw4Knfn', '2025-04-14 12:35:20', '2025-04-14 12:36:20'),
	(11, 'Marlon Saravia', 'marlons', 'marlons0707@gmail.com', '2025-04-14 12:35:20', 'admin', '$2y$10$dDmVt8eCBAh5sK9rQfbLOeAjaplFgW2OYAobh2.R6ngZYqOOMff0W', 'Y', 'Y', 'A6v3tbNlBa', '2025-04-14 12:35:20', '2025-04-14 12:35:20'),
	(12, 'John Doe', '', 'jdoe@gmail.com', NULL, 'admin', '$2y$10$aYEtMVtRf9O6fOWOl0EK7OSb89KKNa9g/0MiCvdLEOKsWw07TW3Bu', 'Y', 'Y', NULL, '2025-04-14 12:35:52', '2025-04-14 12:35:52');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
