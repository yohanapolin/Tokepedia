-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.21 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for p01_db
CREATE DATABASE IF NOT EXISTS `p01_db` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `p01_db`;

-- Dumping structure for table p01_db.authtoken_token
CREATE TABLE IF NOT EXISTS `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table p01_db.authtoken_token: ~8 rows (approximately)
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` (`key`, `created`, `user_id`) VALUES
	('0d6244a2648df343cef2ec21649d1d187ce6b3e2', '2020-12-10 14:45:19.124449', 4),
	('1be73bd8df9d13c313895212170d9ff8d8a62f8b', '2020-12-10 14:45:19.191048', 5),
	('5399673c6851482e84dca9c70434dc75fe634547', '2020-12-10 14:45:18.992176', 2),
	('609b9769ef7c15966d48f54f4cf2b2ce90b5dacf', '2020-12-10 14:45:19.313490', 7),
	('649a875baa728ccd4a663aafa5fa5ec70da870bf', '2020-12-10 14:45:19.257647', 6),
	('6ed970baff9ed8f68eb173a55ebfafa06dda9f5d', '2020-12-10 14:45:19.380130', 8),
	('81b0b813d08c665d3443260bdbe78f919ef5ba11', '2020-12-10 14:45:18.888581', 1),
	('e1cdbebeb990a89850217d29bb689c322b2e53e0', '2020-12-10 14:45:19.057733', 3);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;

-- Dumping structure for table p01_db.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table p01_db.auth_group: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;

-- Dumping structure for table p01_db.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table p01_db.auth_group_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;

-- Dumping structure for table p01_db.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=latin1;

-- Dumping data for table p01_db.auth_permission: ~80 rows (approximately)
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add user', 4, 'add_user'),
	(14, 'Can change user', 4, 'change_user'),
	(15, 'Can delete user', 4, 'delete_user'),
	(16, 'Can view user', 4, 'view_user'),
	(17, 'Can add content type', 5, 'add_contenttype'),
	(18, 'Can change content type', 5, 'change_contenttype'),
	(19, 'Can delete content type', 5, 'delete_contenttype'),
	(20, 'Can view content type', 5, 'view_contenttype'),
	(21, 'Can add session', 6, 'add_session'),
	(22, 'Can change session', 6, 'change_session'),
	(23, 'Can delete session', 6, 'delete_session'),
	(24, 'Can view session', 6, 'view_session'),
	(25, 'Can add user', 7, 'add_user'),
	(26, 'Can change user', 7, 'change_user'),
	(27, 'Can delete user', 7, 'delete_user'),
	(28, 'Can view user', 7, 'view_user'),
	(29, 'Can add cart_item', 8, 'add_cart_item'),
	(30, 'Can change cart_item', 8, 'change_cart_item'),
	(31, 'Can delete cart_item', 8, 'delete_cart_item'),
	(32, 'Can view cart_item', 8, 'view_cart_item'),
	(33, 'Can add order', 9, 'add_order'),
	(34, 'Can change order', 9, 'change_order'),
	(35, 'Can delete order', 9, 'delete_order'),
	(36, 'Can view order', 9, 'view_order'),
	(37, 'Can add brand', 10, 'add_brand'),
	(38, 'Can change brand', 10, 'change_brand'),
	(39, 'Can delete brand', 10, 'delete_brand'),
	(40, 'Can view brand', 10, 'view_brand'),
	(41, 'Can add category', 11, 'add_category'),
	(42, 'Can change category', 11, 'change_category'),
	(43, 'Can delete category', 11, 'delete_category'),
	(44, 'Can view category', 11, 'view_category'),
	(45, 'Can add products', 12, 'add_products'),
	(46, 'Can change products', 12, 'change_products'),
	(47, 'Can delete products', 12, 'delete_products'),
	(48, 'Can view products', 12, 'view_products'),
	(49, 'Can add customer', 13, 'add_customer'),
	(50, 'Can change customer', 13, 'change_customer'),
	(51, 'Can delete customer', 13, 'delete_customer'),
	(52, 'Can view customer', 13, 'view_customer'),
	(53, 'Can add Token', 14, 'add_token'),
	(54, 'Can change Token', 14, 'change_token'),
	(55, 'Can delete Token', 14, 'delete_token'),
	(56, 'Can view Token', 14, 'view_token'),
	(57, 'Can add token', 15, 'add_tokenproxy'),
	(58, 'Can change token', 15, 'change_tokenproxy'),
	(59, 'Can delete token', 15, 'delete_tokenproxy'),
	(60, 'Can view token', 15, 'view_tokenproxy'),
	(61, 'Can add payment', 16, 'add_payment'),
	(62, 'Can change payment', 16, 'change_payment'),
	(63, 'Can delete payment', 16, 'delete_payment'),
	(64, 'Can view payment', 16, 'view_payment'),
	(65, 'Can add payment type', 17, 'add_paymenttype'),
	(66, 'Can change payment type', 17, 'change_paymenttype'),
	(67, 'Can delete payment type', 17, 'delete_paymenttype'),
	(68, 'Can view payment type', 17, 'view_paymenttype'),
	(69, 'Can add comment', 18, 'add_comment'),
	(70, 'Can change comment', 18, 'change_comment'),
	(71, 'Can delete comment', 18, 'delete_comment'),
	(72, 'Can view comment', 18, 'view_comment'),
	(73, 'Can add reply_comment', 19, 'add_reply_comment'),
	(74, 'Can change reply_comment', 19, 'change_reply_comment'),
	(75, 'Can delete reply_comment', 19, 'delete_reply_comment'),
	(76, 'Can view reply_comment', 19, 'view_reply_comment'),
	(77, 'Can add history', 20, 'add_history'),
	(78, 'Can change history', 20, 'change_history'),
	(79, 'Can delete history', 20, 'delete_history'),
	(80, 'Can view history', 20, 'view_history');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

-- Dumping structure for table p01_db.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- Dumping data for table p01_db.auth_user: ~11 rows (approximately)
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
	(1, 'pbkdf2_sha256$150000$rqqqYBMIZwU3$G5hXzBbNB/jf+Pa7CgFgY9FqwuVJMAjM/fF583NexvE=', '2020-12-11 02:15:04.480510', 0, 'jenniecantik', 'Yohana Polin Simatupang', 'gultom', 'jenniebaik@gmail.com', 0, 1, '2020-11-24 08:59:46.563116'),
	(2, 'pbkdf2_sha256$150000$v3tSYl7zFwQy$82mAbZ15zPxnFa7GPHSwrMzJ/jeQ5ow08kHYWzhmdHw=', '2020-12-23 00:08:40.311414', 0, 'jenn', 'Jennnie', 'Sim', 'jennie199999@gmail.com', 0, 1, '2020-11-25 02:35:42.407469'),
	(3, 'pbkdf2_sha256$150000$fMVBoaXYApSf$S1K98W4ubstHWblEF8CwTkNGX5HyG6KZ4fAykdZwkgw=', '2020-12-13 05:21:06.763012', 0, 'jenni', 'jennie', 'simatupang', 'febbyirenee@gmail.com', 0, 1, '2020-11-28 01:03:02.266233'),
	(4, 'pbkdf2_sha256$150000$CI8lrStd3JUE$l8vFl98bo8IbwkhEc7h3pl639/0JkekmsDm3+W6MHu4=', '2020-12-09 16:09:14.195057', 0, 'jennieeeee', 'yohana', 'jennie', 'yohanaps@gmail.com', 0, 1, '2020-11-28 01:29:27.676978'),
	(5, 'pbkdf2_sha256$150000$5HFoDPDUFxBP$I6VZCrwXp61u58YpIsbbDxzCY/7Ms+dDD8R6VUwcw7E=', '2020-11-28 01:31:24.760334', 0, 'jenniew', 'jennie', 'siburian', 'jennieee@gmail.com', 0, 1, '2020-11-28 01:31:17.079924'),
	(6, 'pbkdf2_sha256$150000$7r0ev01LP6Sp$7udingGXE+eoxWiUuPz6SiLrsT/atbEIH/gPNS+f6Ro=', NULL, 0, 'aldaaaa', 'alda', 'lmbgaol', 'febbyirene@gmail.com', 0, 1, '2020-12-07 02:02:09.893744'),
	(7, 'pbkdf2_sha256$150000$3ZRoEr9ELdxl$PFJO6sigsHedyPo8l98L9eXpfq7m52cV6qdnqV1rTbg=', NULL, 0, 'aldaaaaaaaa', 'alda', 'al', 'df@gmail.com', 0, 1, '2020-12-07 02:03:41.216875'),
	(8, 'pbkdf2_sha256$150000$FJt2NyC0CekD$OVq4w6iN+1NRt2XLFhu5EjFcc03UizOxdA+zepFzGi8=', NULL, 0, 'jennieee', 'alda', 'aldaaaa', 'yohana@gmail.com', 0, 1, '2020-12-07 02:05:03.724470'),
	(11, 'pbkdf2_sha256$150000$PGAEMSWsEFiG$2dAQ3cxHgSuu2WwQqwedbvdYrwaAqpoiYat8p4PtgYk=', '2020-12-21 08:24:36.022419', 1, 'admins', '', '', 'admins@gmail.com', 1, 1, '2020-12-11 01:17:41.817000'),
	(14, 'polinss', NULL, 0, 'maria', 'mayak', 'gultom', 'mariass@gmail.com', 0, 1, '2020-12-17 09:02:54.947402'),
	(19, 'pbkdf2_sha256$150000$o3BA7sl2Uznt$hVaQZQGnUB/rT78/4F3mypWPtBvdUUSMilej32W3lyw=', '2020-12-29 12:05:27.715970', 0, 'penggunaCutie', 'Cutie', 'Girl', 'cutie@gmail.com', 0, 1, '2020-12-29 11:58:28.050251');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;

-- Dumping structure for table p01_db.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table p01_db.auth_user_groups: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;

-- Dumping structure for table p01_db.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table p01_db.auth_user_user_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;

-- Dumping structure for table p01_db.carts_cart_item
CREATE TABLE IF NOT EXISTS `carts_cart_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ordered` tinyint(1) NOT NULL,
  `quantity` int NOT NULL,
  `subtotal` int NOT NULL,
  `total` int NOT NULL,
  `updated` datetime(6) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=latin1;

-- Dumping data for table p01_db.carts_cart_item: ~26 rows (approximately)
/*!40000 ALTER TABLE `carts_cart_item` DISABLE KEYS */;
INSERT INTO `carts_cart_item` (`id`, `ordered`, `quantity`, `subtotal`, `total`, `updated`, `timestamp`, `user_id`) VALUES
	(64, 0, 1, 37125000, 37145000, '2020-12-05 13:27:23.458667', '2020-12-05 13:21:44.824655', 4),
	(68, 0, 1, 0, 0, '2020-12-06 02:40:49.606058', '2020-12-06 02:40:49.606058', 4),
	(69, 0, 1, 0, 0, '2020-12-06 02:42:23.890435', '2020-12-06 02:42:23.890435', 4),
	(70, 0, 1, 12368000, 12388000, '2020-12-07 01:18:32.629118', '2020-12-07 01:17:57.819808', 4),
	(71, 0, 1, 24708000, 24728000, '2020-12-07 01:52:22.353468', '2020-12-07 01:21:10.209586', 4),
	(72, 0, 1, 37125000, 37145000, '2020-12-07 01:28:14.595325', '2020-12-07 01:28:14.595325', 4),
	(73, 0, 1, 37125000, 37145000, '2020-12-07 01:29:08.976405', '2020-12-07 01:29:08.976405', 4),
	(74, 0, 1, 37125000, 37145000, '2020-12-07 01:30:11.462906', '2020-12-07 01:30:11.462906', 4),
	(75, 0, 1, 37125000, 37145000, '2020-12-07 01:30:39.272511', '2020-12-07 01:30:39.176156', 4),
	(76, 0, 1, 0, 0, '2020-12-07 02:25:25.371532', '2020-12-07 02:25:25.371532', 4),
	(77, 0, 1, 9899000, 9919000, '2020-12-07 02:25:34.515451', '2020-12-07 02:25:34.048701', 4),
	(78, 0, 1, 9899000, 9919000, '2020-12-07 02:25:36.225343', '2020-12-07 02:25:35.534193', 4),
	(80, 0, 1, 38224000, 38244000, '2020-12-09 15:54:00.850256', '2020-12-09 15:27:32.320332', 2),
	(86, 0, 1, 49052000, 49072000, '2020-12-11 01:02:04.762229', '2020-12-10 13:50:08.729600', 3),
	(87, 0, 1, 0, 0, '2020-12-10 15:18:07.880949', '2020-12-10 15:14:54.538020', NULL),
	(92, 0, 1, 40175000, 40195000, '2020-12-11 11:56:34.644380', '2020-12-11 11:55:24.005084', 3),
	(93, 0, 1, 0, 0, '2020-12-11 12:17:41.041235', '2020-12-11 12:17:41.041235', NULL),
	(94, 0, 1, 2185500, 2205500, '2020-12-11 12:19:46.908987', '2020-12-11 12:19:46.826846', 1),
	(97, 0, 1, 0, 0, '2020-12-17 06:55:44.885649', '2020-12-13 05:59:46.484960', 11),
	(102, 0, 1, 0, 0, '2020-12-22 15:15:55.243138', '2020-12-22 15:15:55.243138', 11),
	(103, 0, 1, 38224000, 38244000, '2020-12-23 00:18:06.129039', '2020-12-23 00:18:06.023550', 3),
	(104, 0, 1, 38224000, 38244000, '2020-12-23 00:44:27.115387', '2020-12-23 00:44:27.015608', 2),
	(105, 0, 1, 38224000, 38244000, '2020-12-23 00:44:34.567171', '2020-12-23 00:44:34.420637', 2),
	(106, 0, 1, 38224000, 38244000, '2020-12-23 00:44:49.216134', '2020-12-23 00:44:49.135266', 2),
	(107, 0, 1, 38224000, 38244000, '2020-12-23 00:45:46.972837', '2020-12-23 00:45:46.852150', 2),
	(108, 0, 1, 29243000, 29263000, '2020-12-29 12:50:23.713679', '2020-12-29 12:50:11.222750', 19);
/*!40000 ALTER TABLE `carts_cart_item` ENABLE KEYS */;

-- Dumping structure for table p01_db.carts_cart_item_products
CREATE TABLE IF NOT EXISTS `carts_cart_item_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cart_item_id` int NOT NULL,
  `products_id` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `carts_cart_item_products_cart_item_id_products_id_7bfac094_uniq` (`cart_item_id`,`products_id`),
  KEY `carts_cart_item_prod_products_id_9840d644_fk_product_p` (`products_id`),
  CONSTRAINT `carts_cart_item_prod_cart_item_id_836832a0_fk_carts_car` FOREIGN KEY (`cart_item_id`) REFERENCES `carts_cart_item` (`id`),
  CONSTRAINT `carts_cart_item_prod_products_id_9840d644_fk_product_p` FOREIGN KEY (`products_id`) REFERENCES `product_products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=latin1;

-- Dumping data for table p01_db.carts_cart_item_products: ~32 rows (approximately)
/*!40000 ALTER TABLE `carts_cart_item_products` DISABLE KEYS */;
INSERT INTO `carts_cart_item_products` (`id`, `cart_item_id`, `products_id`) VALUES
	(35, 64, '009'),
	(37, 70, '001'),
	(44, 71, '039'),
	(43, 71, '043'),
	(39, 72, '009'),
	(40, 73, '009'),
	(41, 74, '009'),
	(42, 75, '009'),
	(46, 77, '002'),
	(47, 78, '002'),
	(50, 80, '008'),
	(51, 80, '009'),
	(56, 86, '020'),
	(57, 86, '021'),
	(58, 86, '031'),
	(59, 86, '041'),
	(63, 92, '004'),
	(62, 92, '009'),
	(64, 94, '035'),
	(83, 103, '008'),
	(82, 103, '009'),
	(85, 104, '008'),
	(84, 104, '009'),
	(87, 105, '008'),
	(86, 105, '009'),
	(89, 106, '008'),
	(88, 106, '009'),
	(91, 107, '008'),
	(90, 107, '009'),
	(92, 108, '026'),
	(93, 108, '037'),
	(94, 108, '044');
/*!40000 ALTER TABLE `carts_cart_item_products` ENABLE KEYS */;

-- Dumping structure for table p01_db.carts_order
CREATE TABLE IF NOT EXISTS `carts_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ref_code` varchar(20) DEFAULT NULL,
  `start_date` datetime(6) NOT NULL,
  `ordered_date` datetime(6) NOT NULL,
  `ordered` tinyint(1) NOT NULL,
  `received` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_order_user_id_016ce4a7_fk_auth_user_id` (`user_id`),
  CONSTRAINT `carts_order_user_id_016ce4a7_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table p01_db.carts_order: ~0 rows (approximately)
/*!40000 ALTER TABLE `carts_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `carts_order` ENABLE KEYS */;

-- Dumping structure for table p01_db.carts_order_items
CREATE TABLE IF NOT EXISTS `carts_order_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `cart_item_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `carts_order_items_order_id_cart_item_id_0aed3aa6_uniq` (`order_id`,`cart_item_id`),
  KEY `carts_order_items_cart_item_id_ff3a2a15_fk_carts_cart_item_id` (`cart_item_id`),
  CONSTRAINT `carts_order_items_cart_item_id_ff3a2a15_fk_carts_cart_item_id` FOREIGN KEY (`cart_item_id`) REFERENCES `carts_cart_item` (`id`),
  CONSTRAINT `carts_order_items_order_id_b34152ca_fk_carts_order_id` FOREIGN KEY (`order_id`) REFERENCES `carts_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table p01_db.carts_order_items: ~0 rows (approximately)
/*!40000 ALTER TABLE `carts_order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `carts_order_items` ENABLE KEYS */;

-- Dumping structure for table p01_db.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table p01_db.django_admin_log: ~0 rows (approximately)
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;

-- Dumping structure for table p01_db.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- Dumping data for table p01_db.django_content_type: ~20 rows (approximately)
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(14, 'authtoken', 'token'),
	(15, 'authtoken', 'tokenproxy'),
	(8, 'carts', 'cart_item'),
	(9, 'carts', 'order'),
	(5, 'contenttypes', 'contenttype'),
	(10, 'product', 'brand'),
	(11, 'product', 'category'),
	(18, 'product', 'comment'),
	(12, 'product', 'products'),
	(19, 'product', 'reply_comment'),
	(6, 'sessions', 'session'),
	(20, 'toped', 'history'),
	(16, 'transaction', 'payment'),
	(17, 'transaction', 'paymenttype'),
	(13, 'users', 'customer'),
	(7, 'users', 'user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

-- Dumping structure for table p01_db.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

-- Dumping data for table p01_db.django_migrations: ~37 rows (approximately)
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2020-11-24 07:42:20.818396'),
	(2, 'auth', '0001_initial', '2020-11-24 07:42:23.761890'),
	(3, 'admin', '0001_initial', '2020-11-24 07:42:33.089786'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2020-11-24 07:42:35.754000'),
	(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-11-24 07:42:35.837226'),
	(6, 'contenttypes', '0002_remove_content_type_name', '2020-11-24 07:42:37.767016'),
	(7, 'auth', '0002_alter_permission_name_max_length', '2020-11-24 07:42:37.980477'),
	(8, 'auth', '0003_alter_user_email_max_length', '2020-11-24 07:42:38.214838'),
	(9, 'auth', '0004_alter_user_username_opts', '2020-11-24 07:42:38.289890'),
	(10, 'auth', '0005_alter_user_last_login_null', '2020-11-24 07:42:39.313241'),
	(11, 'auth', '0006_require_contenttypes_0002', '2020-11-24 07:42:39.392820'),
	(12, 'auth', '0007_alter_validators_add_error_messages', '2020-11-24 07:42:39.481896'),
	(13, 'auth', '0008_alter_user_username_max_length', '2020-11-24 07:42:39.712820'),
	(14, 'auth', '0009_alter_user_last_name_max_length', '2020-11-24 07:42:39.969802'),
	(15, 'auth', '0010_alter_group_name_max_length', '2020-11-24 07:42:40.311975'),
	(16, 'auth', '0011_update_proxy_permissions', '2020-11-24 07:42:40.393637'),
	(17, 'product', '0001_initial', '2020-11-24 07:42:41.773534'),
	(18, 'carts', '0001_initial', '2020-11-24 07:42:45.690656'),
	(19, 'sessions', '0001_initial', '2020-11-24 07:42:54.278924'),
	(20, 'toped', '0001_initial', '2020-11-24 07:42:58.074310'),
	(21, 'toped', '0002_auto_20201124_1541', '2020-11-24 07:43:19.845750'),
	(22, 'users', '0001_initial', '2020-11-24 07:43:20.420838'),
	(23, 'carts', '0002_auto_20201125_1910', '2020-11-25 11:11:48.245542'),
	(24, 'carts', '0003_auto_20201125_2149', '2020-11-25 13:50:00.017220'),
	(25, 'carts', '0004_auto_20201125_2209', '2020-11-25 14:10:05.032237'),
	(26, 'carts', '0005_auto_20201202_0838', '2020-12-02 00:38:20.015455'),
	(27, 'product', '0002_auto_20201203_1142', '2020-12-08 11:10:02.778197'),
	(28, 'users', '0002_customer', '2020-12-08 11:10:03.701772'),
	(29, 'users', '0003_auto_20201209_1347', '2020-12-09 05:47:22.742744'),
	(30, 'authtoken', '0001_initial', '2020-12-10 14:44:11.956220'),
	(31, 'authtoken', '0002_auto_20160226_1747', '2020-12-10 14:44:14.791289'),
	(32, 'authtoken', '0003_tokenproxy', '2020-12-10 14:44:14.869346'),
	(33, 'transaction', '0001_initial', '2020-12-11 00:42:01.469823'),
	(34, 'product', '0003_comment', '2020-12-22 15:08:38.225227'),
	(35, 'product', '0003_comment_reply_comment', '2020-12-22 16:35:49.163371'),
	(36, 'product', '0004_auto_20201223_1226', '2020-12-29 11:56:00.710438'),
	(37, 'toped', '0003_history', '2020-12-29 12:08:27.384580');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

-- Dumping structure for table p01_db.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table p01_db.django_session: ~16 rows (approximately)
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('149y7mw1g763kuu6hqxglzoeb30tih6u', 'MmMzYmMwZWY2NTIwYmE4MDhhNWVhMTRlZTE1M2U3NWVhM2JiZTQzODp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzBlYzkxODFkMWJjMjBlNzU0MzM3MjgzNGYwMzhlOTk2NzIzZjUxIiwiX3Nlc3Npb25fZXhwaXJ5IjoxODAwMH0=', '2020-12-02 06:49:53.423745'),
	('2auq6fupl4u6d5t0ntx4zb40u5j4tf9m', 'YzBjMWM0ZjEzYTE1Y2FmNzdjNWExNjc3OTk1MTAwMWNiMmQ5NDUyNzp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2ZlZGM0NmUzYWY1Y2IyMTk3YzNjNzczZGVlNjkxZDBhZDc2NThkOCJ9', '2020-12-31 06:40:56.865971'),
	('4lrslogxh5j07tyzu1jeg17v1gigrx3q', 'OWM0MjVhNDk4NTllYWEyMmZhNTRlYjQ5YmFjN2U0M2QzZTQzNzQ1Mzp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzBlYzkxODFkMWJjMjBlNzU0MzM3MjgzNGYwMzhlOTk2NzIzZjUxIiwiX3Nlc3Npb25fZXhwaXJ5IjoxODAwMCwiY2FydF9pZCI6NjJ9', '2020-12-02 08:23:42.587338'),
	('amo2sbeush043ihyx84yx9jq2txupi3v', 'MWU0YWUyYjU5Y2M5NmI4MjJmMGQwNGViZDI0ZWYyY2VlZjA1MjQ5MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5YTA1ZTY5NmExNTM0ZDNjYTMyYjE3NGMwNGI5ZWMzZGIwODBjZmY5IiwiX3Nlc3Npb25fZXhwaXJ5Ijo1fQ==', '2020-11-25 02:37:39.368579'),
	('b1kl4scs7j05k9ctnp5z23x7eu59l22k', 'Y2Y0NDE4NmM4MDVhZWYxZDI2ZDQwYzUyOTEwNGVhZjM5NWU0MGY5Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5YTA1ZTY5NmExNTM0ZDNjYTMyYjE3NGMwNGI5ZWMzZGIwODBjZmY5IiwiX3Nlc3Npb25fZXhwaXJ5IjoxODAwMCwiY2FydF9pZCI6MzN9', '2020-11-25 19:12:13.390267'),
	('c0h3b4td0v12ltqr7dczk4rgz6mc3dx6', 'MmMzYmMwZWY2NTIwYmE4MDhhNWVhMTRlZTE1M2U3NWVhM2JiZTQzODp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzBlYzkxODFkMWJjMjBlNzU0MzM3MjgzNGYwMzhlOTk2NzIzZjUxIiwiX3Nlc3Npb25fZXhwaXJ5IjoxODAwMH0=', '2020-12-02 06:49:52.828956'),
	('fdnwq855kwqdwmpa3xxrowrdpqal6x2a', 'ODVjZmM4Y2Q2MGRmNGFkNmE4ZjMxOWVmZTk3NDQ5ZWQ1ZjIzNmNkNjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0ZmU2ZjJhNDAxMzg3ZDQ3ODVlNGNkNzY3NzBlM2JmZDg1NTkzOGNkIiwiX3Nlc3Npb25fZXhwaXJ5IjoxODAwMCwiY2FydF9pZCI6MzV9', '2020-11-25 19:44:03.913326'),
	('genjjea8gme2fw52xd2ndct0oznf1ki2', 'ZjBkOGY0ZWMzMzBkMjEwNjJjZTFlNzk3ZGQ2OTUwNDUzMzRjNzFkYTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0ZmU2ZjJhNDAxMzg3ZDQ3ODVlNGNkNzY3NzBlM2JmZDg1NTkzOGNkIiwiX3Nlc3Npb25fZXhwaXJ5IjoxODAwMH0=', '2020-11-25 08:23:29.433800'),
	('ju8uy6dc2n20xkzu75iyr7uoqk65uq7q', 'MmFiZjYzNWMxZTIwNGU2ZWJjNWUxZjM5NmNmYmMwMjYwNTY3ZGFkODp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0ZmU2ZjJhNDAxMzg3ZDQ3ODVlNGNkNzY3NzBlM2JmZDg1NTkzOGNkIiwiX3Nlc3Npb25fZXhwaXJ5Ijo1fQ==', '2020-11-25 02:35:57.132292'),
	('ndl7ryycol48jbjhrz2am9cec7xlgech', 'MTIwYTAwZDc5OTgyYWU2NjdkZWI0YWUwOWY3MGYxYzdhYTNkYzdiNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5YTA1ZTY5NmExNTM0ZDNjYTMyYjE3NGMwNGI5ZWMzZGIwODBjZmY5IiwiX3Nlc3Npb25fZXhwaXJ5IjoxODAwMH0=', '2020-11-25 08:24:02.882479'),
	('oqrxr7qrgaywqosrhgqetq1c84op3qus', 'NzE4M2E5ZjE2YmU4YzY0ODExYTNmYmRhYmNjNjViOTlhZDA3MTBkNTp7Il9hdXRoX3VzZXJfaWQiOiIxOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjcwNTZhYzBhYmM1YmEzOWI2YzU0MDg0YmQxNDU5NDNkMjcxZDBmOCIsImNhcnRfaWQiOjEwOH0=', '2021-01-12 12:50:11.425391'),
	('qetjd0r66c3pcfc32g90fah9436uy4qc', 'MmMzYmMwZWY2NTIwYmE4MDhhNWVhMTRlZTE1M2U3NWVhM2JiZTQzODp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzBlYzkxODFkMWJjMjBlNzU0MzM3MjgzNGYwMzhlOTk2NzIzZjUxIiwiX3Nlc3Npb25fZXhwaXJ5IjoxODAwMH0=', '2020-12-01 17:44:52.954219'),
	('s7iq5ftma1w8d7e7zym0v9f5pwuxh1ca', 'MTIwYTAwZDc5OTgyYWU2NjdkZWI0YWUwOWY3MGYxYzdhYTNkYzdiNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5YTA1ZTY5NmExNTM0ZDNjYTMyYjE3NGMwNGI5ZWMzZGIwODBjZmY5IiwiX3Nlc3Npb25fZXhwaXJ5IjoxODAwMH0=', '2020-11-26 18:48:35.495612'),
	('t34nmmjpp6f188lgp9s9z6zzxove3x9d', 'OWU5ODJlMTkwYzkzODIwYjFjYWRiYzRhNzkzZjk3ZjJmMDQ2YjM2MTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0ZmU2ZjJhNDAxMzg3ZDQ3ODVlNGNkNzY3NzBlM2JmZDg1NTkzOGNkIn0=', '2021-01-06 00:08:40.438137'),
	('wk1ndfbnkvfzylq6sbtl8c91n903p8gf', 'YzBjMWM0ZjEzYTE1Y2FmNzdjNWExNjc3OTk1MTAwMWNiMmQ5NDUyNzp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2ZlZGM0NmUzYWY1Y2IyMTk3YzNjNzczZGVlNjkxZDBhZDc2NThkOCJ9', '2021-01-04 08:24:34.822628'),
	('x3j34lxampvic56q5zlo6fg5gjfrhv3h', 'MjRmZDBmNzg4MDJmNWFiNTExYjNlNTFiY2RjODgxYTJlYjM4NTBhNTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2ZlZGM0NmUzYWY1Y2IyMTk3YzNjNzczZGVlNjkxZDBhZDc2NThkOCIsImNhcnRfaWQiOjEwMn0=', '2021-01-05 15:15:55.428081');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

-- Dumping structure for table p01_db.product_brand
CREATE TABLE IF NOT EXISTS `product_brand` (
  `id` varchar(20) NOT NULL,
  `brand_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table p01_db.product_brand: ~6 rows (approximately)
/*!40000 ALTER TABLE `product_brand` DISABLE KEYS */;
INSERT INTO `product_brand` (`id`, `brand_name`) VALUES
	('1', 'Asus'),
	('2', 'Apple'),
	('3', 'Samsung'),
	('4', 'Huawei'),
	('5', 'Logitech'),
	('6', 'Kingston');
/*!40000 ALTER TABLE `product_brand` ENABLE KEYS */;

-- Dumping structure for table p01_db.product_category
CREATE TABLE IF NOT EXISTS `product_category` (
  `id` varchar(20) NOT NULL,
  `category_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table p01_db.product_category: ~3 rows (approximately)
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` (`id`, `category_name`) VALUES
	('1', 'Laptop & Computer'),
	('2', 'Smartphone'),
	('3', 'Accesories');
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;

-- Dumping structure for table p01_db.product_comment
CREATE TABLE IF NOT EXISTS `product_comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment` longtext NOT NULL,
  `product_id` varchar(20) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_comment_product_id_b32e96a2_fk_product_products_id` (`product_id`),
  KEY `product_comment_user_id_ac70fe86_fk_auth_user_id` (`user_id`),
  CONSTRAINT `product_comment_product_id_b32e96a2_fk_product_products_id` FOREIGN KEY (`product_id`) REFERENCES `product_products` (`id`),
  CONSTRAINT `product_comment_user_id_ac70fe86_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Dumping data for table p01_db.product_comment: ~7 rows (approximately)
/*!40000 ALTER TABLE `product_comment` DISABLE KEYS */;
INSERT INTO `product_comment` (`id`, `comment`, `product_id`, `user_id`) VALUES
	(2, 'waw', '003', 11),
	(3, 'waw', '006', 11),
	(4, 'wathh', '006', 2),
	(6, 'tapaaoafsdhfdshfjhdjf', '003', 11),
	(7, 'test', '002', 11),
	(8, 'test', '002', 11),
	(9, 'waw', '003', 11);
/*!40000 ALTER TABLE `product_comment` ENABLE KEYS */;

-- Dumping structure for table p01_db.product_products
CREATE TABLE IF NOT EXISTS `product_products` (
  `id` varchar(20) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `price_per_unit` int DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `slug` varchar(50) NOT NULL,
  `brand_name_id` varchar(20) DEFAULT NULL,
  `category_id_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_products_brand_name_id_d6efa59a_fk_product_brand_id` (`brand_name_id`),
  KEY `product_products_category_id_id_eb79c667_fk_product_category_id` (`category_id_id`),
  KEY `product_products_slug_1eabb412` (`slug`),
  CONSTRAINT `product_products_brand_name_id_d6efa59a_fk` FOREIGN KEY (`brand_name_id`) REFERENCES `product_brand` (`id`),
  CONSTRAINT `product_products_category_id_id_eb79c667_fk` FOREIGN KEY (`category_id_id`) REFERENCES `product_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table p01_db.product_products: ~43 rows (approximately)
/*!40000 ALTER TABLE `product_products` DISABLE KEYS */;
INSERT INTO `product_products` (`id`, `name`, `price_per_unit`, `stock`, `description`, `image`, `slug`, `brand_name_id`, `category_id_id`) VALUES
	('001', 'ASUS VIVOBOOK 14 K413FQ i7-10510U', 12368000, 122, 'New', 'img/Asus2.jpg', 'nskh', '1', '1'),
	('002', 'LAPTOP ASUS i5 RAM 8GB HDD', 9899000, 122, 'New', 'img/Asus1.jpg', 'ndkh', '1', '1'),
	('003', 'ASUS A409JP CORE i5-1035G1', 8445000, 123, 'New', 'img/Asus3.jpg', 'nskfh', '1', '1'),
	('004', 'LAPTOP ASUS X441 /DUAL CORE', 3050000, 122, 'New', 'img/Asus4.jpg', 'nsk', '1', '1'),
	('005', 'Asus ROG Phone3 8/128GB - Black', 10120000, 123, 'New', 'img/Asus6.jpg', 'nsdh', '1', '2'),
	('006', 'Asus Rog Phone 2 Ram 8/128', 8185000, 234, 'New', 'img/Asus7.jpg', 'ndfkh', '1', '2'),
	('007', 'Asus Zenfone Live L1 2GB/16GB - Hitam', 5227250, 120, 'New', 'img/Asus8.jpg', 'nsdshkh', '1', '2'),
	('008', 'Asus Zenfone 2 ZE551ML RAM 4GB', 1099000, 130, 'New', 'img/Asus9.jpg', 'dkhad', '1', '2'),
	('0089', 'I Phone 12', 17000000, 100, 'new', 'img/Apple3.jpg', 'ddjhad', '2', '1'),
	('009', 'Apple iMac 2020 5K inch', 37125000, 123, 'New', 'img/Apple1_Dys2Flk.jpg', 'asdh', '2', '1'),
	('011', 'Apple MacBook Pro 2019 MUHN2 13', 17699000, 54, 'New', 'img/Apple2.jpg', 'adsg', '2', '1'),
	('014', 'Apple Iphone 11 128GB GRS', 13599000, 122, 'New', 'img/Apple6.jpg', 'ada', '2', '2'),
	('015', 'Apple iPhone X 64gb Second', 6643000, 234, 'New', 'img/Apple7_3afR12S.jpg', 'SFs', '2', '2'),
	('016', 'APPLE IPHONE X 64GB NEW', 7450000, 121, 'New', 'img/Apple8.jpg', 'fghg', '2', '2'),
	('017', 'Huawei ELS-NX9 P40 Pro Silver Frost', 12499000, 122, 'New', 'img/Huawei4.png', 'hj', '4', '2'),
	('018', 'Huawei P40 Pro 5G Ram 8GB', 11499000, 122, 'New', 'img/Huawei1.png', 'fdgh', '4', '2'),
	('019', 'Huawei p30 pro 8/256', 8250000, 233, 'New', 'img/Huawei2.png', 'fdgh', '4', '2'),
	('020', 'Huawei Nova 7 RAM 8/256GB Silver', 6368000, 122, 'New', 'img/Huawei3.png', 'fgdh', '4', '2'),
	('021', 'Huawei MatePad Pro (6GB/128GB)-Grey', 10999000, 43, 'New', 'img/Huawei5.png', 'tgdh', '4', '2'),
	('022', 'Huawei BAH3-W09 MatePad 10.4 inch', 4299000, 223, 'New', 'img/Huawei6.png', 'fsdh', '4', '2'),
	('023', 'Huawei MediaPad T5 -Champagne Gold', 2599000, 122, 'New', 'img/Huawei7.png', 'fsg', '4', '2'),
	('025', 'Samsung Galaxy Note 20 Ultra', 17999000, 122, 'New', 'img/Samsung1.jpg', 'ewr', '3', '2'),
	('026', 'Samsung Galaxy Note 10 Lite N770F', 7999000, 123, 'New', 'img/Samsung2.jpg', 'reue', '3', '2'),
	('028', 'Samsung Galaxy A31 A315G Blue', 4099000, 43, 'New', 'img/Samsung4.jpg', 'dygu', '3', '2'),
	('029', 'Samsung Galaxy Tab S7 Mystic Silver', 12999000, 122, 'New', 'img/Samsung5.jpg', 'duyfu', '3', '2'),
	('030', 'Samsung Galaxy Tab S6 Lite P615N', 6999000, 122, 'New', 'img/Samsung16jpg.png', 'dufu', '3', '2'),
	('031', 'Samsung Galaxy Tab A8 with S Pen 2019', 4499000, 123, 'New', 'img/Samsung7.jpg', 'dfuu', '3', '2'),
	('032', 'Samsung Galaxy Tab A8 2019 - Black', 1999000, 132, 'New', 'img/Samsung8.jpg', 'wetr7q', '3', '2'),
	('033', 'Kingston HyperX Cloud Revolver Headset Gaming', 5660100, 122, 'New', 'img/Kingston_1.jpg', 'e7wttrtr', '6', '3'),
	('034', 'Kingston HyperX Cloud II Gaming Headset RED', 2900000, 122, 'New', 'img/Kingston_2.jpg', 'adag', '6', '3'),
	('035', 'Headphone Gaming Kingston HyperX Cloud Revolver S', 2185500, 123, 'New', 'img/Kingston_3.jpg', 'dgfd', '6', '3'),
	('037', 'Kingston HyperX Savage EXO SSD External USB 3.1', 1394000, 112, 'New', 'img/Kingston_5.jpg', 'sgs', '6', '3'),
	('038', 'Fl Kingston USB Stick U Disk External ash Memory', 1307800, 112, 'New', 'img/Kingston_6.jpg', 'sfs', '6', '3'),
	('039', 'Kingston SSD Now V300 SATA 6Gb/s 240GB', 1200000, 45, 'New', 'img/Kingston_7.png', 'setw', '6', '3'),
	('040', 'Kingston DataTraveler 100 G3 64 GB', 1197500, 233, 'New', 'img/Kingston_8.png', 'sggds', '6', '3'),
	('041', 'Logitech group video conference webcam Camera', 27186000, 43, 'New', 'img/Logitech_1.jpg', 'sgs', '5', '3'),
	('042', 'Logitech Rally Camera', 25500000, 34, 'New', 'img/Logitech_2.jpg', 'afa', '5', '3'),
	('043', 'logitech conference cam connect', 21600000, 43, 'New', 'img/Logitech_3.jpg', 'wryu', '5', '3'),
	('044', 'Logitech Group Limited Edition', 19850000, 111, 'New', 'img/Logitech_4.jpeg', 'wwet', '5', '3'),
	('045', 'LOGITECH MK545 ADVANCED WIRELESS COMBO', 1376650, 123, 'New', 'img/Logitech_5.jpg', 'szc', '5', '3'),
	('047', 'Mouse Gaming Logitech G603 Wireless Original', 1304000, 45, 'New', 'img/Logitech_7.jpg', 'qre', '5', '3'),
	('048', 'Logitech MX Master 2S Wireless Bluetooth Mouse', 1233000, 221, 'New', 'img/Logitech_8.jpg', 'etewt', '5', '3'),
	('1001', 'ASUS VIVABOOK 14 K413FQ i7-10510U', 1238000, 122, 'New', '', '', NULL, NULL);
/*!40000 ALTER TABLE `product_products` ENABLE KEYS */;

-- Dumping structure for table p01_db.product_reply_comment
CREATE TABLE IF NOT EXISTS `product_reply_comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reply_comment` longtext NOT NULL,
  `comment_id_id` int NOT NULL,
  `user_reply_id_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_reply_comment_comment_id_6e31afca_fk_product_comment_id` (`comment_id_id`),
  KEY `product_reply_comment_user_reply_id_8aa23d9b_fk_auth_user_id` (`user_reply_id_id`),
  CONSTRAINT `product_reply_commen_comment_id_id_70088e6b_fk_product_c` FOREIGN KEY (`comment_id_id`) REFERENCES `product_comment` (`id`),
  CONSTRAINT `product_reply_comment_user_reply_id_id_43a9918a_fk_auth_user_id` FOREIGN KEY (`user_reply_id_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table p01_db.product_reply_comment: ~0 rows (approximately)
/*!40000 ALTER TABLE `product_reply_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_reply_comment` ENABLE KEYS */;

-- Dumping structure for table p01_db.toped_history
CREATE TABLE IF NOT EXISTS `toped_history` (
  `id` varchar(50) NOT NULL,
  `customer_id` varchar(50) NOT NULL,
  `payment_id` varchar(50) NOT NULL,
  `time` time(6) NOT NULL,
  `date` date NOT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `total_cost` bigint DEFAULT NULL,
  `delivery` bigint DEFAULT NULL,
  `price` bigint DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `adress` varchar(100) DEFAULT NULL,
  `product_name` varchar(50) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table p01_db.toped_history: ~3 rows (approximately)
/*!40000 ALTER TABLE `toped_history` DISABLE KEYS */;
INSERT INTO `toped_history` (`id`, `customer_id`, `payment_id`, `time`, `date`, `payment_method`, `total_cost`, `delivery`, `price`, `name`, `adress`, `product_name`, `image`) VALUES
	('01', '19', '00001', '19:16:07.000000', '2020-12-29', 'E-Banking\r\n', 9939000, 40000, 9899000, 'Cutie Girl', 'Institut Teknologi Del', 'LAPTOP ASUS i5 RAM 8GB HDD', 'ASUS2\r\n'),
	('02', '19', '00001', '19:25:57.000000', '2019-10-27', 'E-Banking\r\n', 17719000, 20000, 17699000, 'Cutie Girl', 'Institut Teknologi Del', 'Apple MacBook Pro 2019 MUHN2 13', 'Apple3'),
	('03', '19', '00001', '21:28:36.000000', '2020-09-26', 'E-Banking', 2193500, 8000, 2185500, 'Cutie Girl', 'Institut Teknologi Del', 'Headphone Gaming Kingston HyperX Cloud Revolver S', 'Kingston3');
/*!40000 ALTER TABLE `toped_history` ENABLE KEYS */;

-- Dumping structure for table p01_db.transaction_payment
CREATE TABLE IF NOT EXISTS `transaction_payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount` int DEFAULT NULL,
  `payment_type_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_payment_payment_type_id_c401b14b_fk_transacti` (`payment_type_id`),
  CONSTRAINT `transaction_payment_payment_type_id_c401b14b_fk_transacti` FOREIGN KEY (`payment_type_id`) REFERENCES `transaction_paymenttype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table p01_db.transaction_payment: ~0 rows (approximately)
/*!40000 ALTER TABLE `transaction_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_payment` ENABLE KEYS */;

-- Dumping structure for table p01_db.transaction_paymenttype
CREATE TABLE IF NOT EXISTS `transaction_paymenttype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `payment_name` varchar(20) NOT NULL,
  `payment_method` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table p01_db.transaction_paymenttype: ~0 rows (approximately)
/*!40000 ALTER TABLE `transaction_paymenttype` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_paymenttype` ENABLE KEYS */;

-- Dumping structure for table p01_db.users_customer
CREATE TABLE IF NOT EXISTS `users_customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `birth` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `Id_user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `users_customer_Id_user_id_bf89b041_fk_auth_user_id` (`Id_user_id`),
  CONSTRAINT `users_customer_Id_user_id_bf89b041_fk_auth_user_id` FOREIGN KEY (`Id_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table p01_db.users_customer: ~3 rows (approximately)
/*!40000 ALTER TABLE `users_customer` DISABLE KEYS */;
INSERT INTO `users_customer` (`id`, `name`, `birth`, `email`, `address`, `phone_number`, `Id_user_id`) VALUES
	(1, 'Jennie Simatupang', '2000-09-24', 'jenniebaik@gmail.com', 'Tebing Tinggi, Sumatera Utara', '081233127865', 1),
	(2, 'Letare Aiglien', '2000-06-30', 'letareStward@gmail.com', 'Tigaras, Simalungun', '082275649908', 2),
	(3, 'Wahuna Lumban Gaol', '2000-09-12', 'wahunapie@gmail.com', 'Tarutung, Tapanuli Utara', '081222653987', 3);
/*!40000 ALTER TABLE `users_customer` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
