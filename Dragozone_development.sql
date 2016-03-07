-- phpMyAdmin SQL Dump
-- version 4.4.13.1deb1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Lun 15 Février 2016 à 14:36
-- Version du serveur :  5.6.28-0ubuntu0.15.10.1
-- Version de PHP :  5.6.11-1ubuntu3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `Dragozone_development`
--
CREATE DATABASE IF NOT EXISTS `Dragozone_development` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `Dragozone_development`;

-- --------------------------------------------------------

--
-- Structure de la table `average_caches`
--

CREATE TABLE IF NOT EXISTS `average_caches` (
  `id` int(11) NOT NULL,
  `rater_id` int(11) DEFAULT NULL,
  `rateable_id` int(11) DEFAULT NULL,
  `rateable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avg` float NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vider la table avant d'insérer `average_caches`
--

TRUNCATE TABLE `average_caches`;
-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `ancestry` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vider la table avant d'insérer `categories`
--

TRUNCATE TABLE `categories`;
--
-- Contenu de la table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`, `ancestry`) VALUES
(1, 'chaise', '2016-02-09 17:05:46', '2016-02-09 17:05:46', NULL),
(2, 'rouge', '2016-02-09 17:23:39', '2016-02-09 17:23:39', NULL),
(3, 'rouge bordeau', '2016-02-09 17:39:40', '2016-02-09 17:39:40', NULL),
(4, 'rouge chanel', '2016-02-09 17:42:15', '2016-02-09 17:42:15', NULL),
(5, 'rouge noir', '2016-02-09 17:44:04', '2016-02-09 17:44:04', NULL),
(6, 'rouge bleu', '2016-02-09 17:46:42', '2016-02-09 17:46:42', NULL),
(7, 'rouge caca', '2016-02-09 17:47:47', '2016-02-09 17:47:47', '2'),
(8, 'chaise pour bebe', '2016-02-09 19:16:47', '2016-02-09 19:16:47', '1'),
(9, 'vetements', '2016-02-09 19:39:06', '2016-02-09 19:39:06', NULL),
(10, 'slip', '2016-02-10 12:53:21', '2016-02-10 12:53:21', '9'),
(11, 'Meuble', '2016-02-10 13:37:35', '2016-02-10 13:37:35', NULL),
(12, 'Mode', '2016-02-10 13:37:57', '2016-02-10 13:37:57', NULL),
(13, 'string', '2016-02-10 14:58:50', '2016-02-10 14:58:50', '9/10'),
(14, 'Contenant', '2016-02-10 18:13:17', '2016-02-10 18:13:17', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL,
  `commentable_id` int(11) DEFAULT NULL,
  `commentable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vider la table avant d'insérer `comments`
--

TRUNCATE TABLE `comments`;
--
-- Contenu de la table `comments`
--

INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `title`, `body`, `subject`, `user_id`, `parent_id`, `lft`, `rgt`, `created_at`, `updated_at`) VALUES
(1, 3, 'Product', NULL, 'hello', NULL, 4, NULL, 1, 4, '2016-02-08 11:18:26', '2016-02-08 11:19:27'),
(2, 3, 'Product', NULL, 'Well this is a shitty product.', NULL, 4, 1, 2, 3, '2016-02-08 11:19:26', '2016-02-08 11:19:27'),
(3, 3, 'Product', NULL, 'hello', NULL, 4, NULL, 5, 6, '2016-02-08 11:38:45', '2016-02-08 11:38:45'),
(4, 4, 'Product', NULL, 'hello', NULL, 4, NULL, 1, 2, '2016-02-08 11:38:59', '2016-02-08 11:38:59');

-- --------------------------------------------------------

--
-- Structure de la table `impressions`
--

CREATE TABLE IF NOT EXISTS `impressions` (
  `id` int(11) NOT NULL,
  `impressionable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `impressionable_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `controller_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `view_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `request_hash` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `session_hash` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `referrer` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vider la table avant d'insérer `impressions`
--

TRUNCATE TABLE `impressions`;
--
-- Contenu de la table `impressions`
--

INSERT INTO `impressions` (`id`, `impressionable_type`, `impressionable_id`, `user_id`, `controller_name`, `action_name`, `view_name`, `request_hash`, `ip_address`, `session_hash`, `message`, `referrer`, `created_at`, `updated_at`) VALUES
(1, 'User', 4, 4, 'users', 'show', NULL, '9d091120a8c2aa8ad339974a0ea40fa59a4b54b7a23b65c52c98a5a88a62fcb8', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/login', '2016-02-12 09:03:16', '2016-02-12 09:03:16'),
(2, 'User', 4, 4, 'users', 'show', NULL, '2c9afcce22c8a7ac33d778efccb6ea926f06a49364e9acf4c316a586f9ea57f1', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/login', '2016-02-12 09:06:34', '2016-02-12 09:06:34'),
(3, 'User', 4, 4, 'users', 'show', NULL, 'f3221e005dd99ed1b5a4ee7464b8648ae7b97213da6f9cdcf6d38583b08f4e8f', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/login', '2016-02-12 09:06:45', '2016-02-12 09:06:45'),
(4, 'User', 4, 4, 'users', 'show', NULL, '17a988d2a713d05ba1a8c6b9520777bf1bf129141c10d1418a63650c220f5eab', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/login', '2016-02-12 09:06:48', '2016-02-12 09:06:48'),
(5, 'User', 4, 4, 'users', 'show', NULL, '0adf266ee4c025a8d978531d5c1175ddbc4012dcf5b25e2c93c869f238db2783', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 09:06:58', '2016-02-12 09:06:58'),
(6, 'User', 4, 4, 'users', 'show', NULL, '23348b69792ccf2e79d5a8e8e9f61337d44beb719b1a9d73070c96eb3d4bc13d', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, NULL, '2016-02-12 09:07:35', '2016-02-12 09:07:35'),
(7, 'User', 4, 4, 'users', 'show', NULL, '1d97ec4a53490197fd09439e1e53692abcbefafd1943edbd85e4bae9f947176a', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, NULL, '2016-02-12 09:38:41', '2016-02-12 09:38:41'),
(8, 'User', 4, 4, 'users', 'show', NULL, '191f841b22efe180637a877d91d3b3dfc0a86c2c2c132bb3b180cca5efdfd87f', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, NULL, '2016-02-12 09:38:43', '2016-02-12 09:38:43'),
(9, 'User', 4, 4, 'users', 'show', NULL, 'b77fd3473a35cb669191cc9f507db09f61338ccf1ab945aaa03e0892db3b749d', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, NULL, '2016-02-12 09:47:33', '2016-02-12 09:47:33'),
(10, 'User', 4, 4, 'users', 'show', NULL, '3a07bf2b046fe653fafa9a31bd0fa25e7270ae6ce56905e723175ea20e1d1083', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, NULL, '2016-02-12 09:47:52', '2016-02-12 09:47:52'),
(11, 'User', 4, 4, 'users', 'show', NULL, 'e68a01e2ecd8c3af5bcaad221e73c7a53960f70a69d3b90664aaafa62c21adea', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, NULL, '2016-02-12 09:47:55', '2016-02-12 09:47:55'),
(12, 'User', 4, 4, 'users', 'show', NULL, '755b92e7112753608bfdc2d7fa9a069ed654962589c874ca189706207bffeae8', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, NULL, '2016-02-12 09:54:54', '2016-02-12 09:54:54'),
(13, 'User', 4, 4, 'users', 'show', NULL, '901c4d2a5bf417169233aec647f31f7ffb3e965a92842e21ed19fc4290339c64', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, NULL, '2016-02-12 09:54:55', '2016-02-12 09:54:55'),
(14, 'User', 4, 4, 'users', 'show', NULL, 'bb3d93af4dee82f140593019b52fd6f3d1392c54216d997ccdcc40d9c205d464', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, NULL, '2016-02-12 09:54:57', '2016-02-12 09:54:57'),
(15, 'User', 4, 4, 'users', 'show', NULL, 'd7e455eb0b9141a80dc0bcbc2613729b9756df2cbf133fedfb7e97e041e9da8a', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, NULL, '2016-02-12 09:55:05', '2016-02-12 09:55:05'),
(16, 'User', 4, 4, 'users', 'show', NULL, '17f138afe33f149d14a1523f7b4ef639ba6f33be73d88a1bb6f878df9544256f', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, NULL, '2016-02-12 09:55:57', '2016-02-12 09:55:57'),
(17, 'User', 4, 4, 'users', 'show', NULL, 'f65bfadb5b48c71af81f2f1de01573d72c5bd957e64386b0f5c83dff21d75b07', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, NULL, '2016-02-12 09:55:59', '2016-02-12 09:55:59'),
(18, 'User', 4, 4, 'users', 'show', NULL, '6a9899d177fbe74412b5afab2c12bafd1e2100d69e26e2529501c9b6d0c27294', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, NULL, '2016-02-12 10:00:31', '2016-02-12 10:00:31'),
(19, 'User', 4, 4, 'users', 'show', NULL, '908d5a1cc3810401a4cfc60edb9e4a9365b1f33e1da2107b661b1573c3e78588', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, NULL, '2016-02-12 10:00:41', '2016-02-12 10:00:41'),
(20, 'User', 4, 4, 'users', 'show', NULL, '7492ef5ef9a84f368266e742039fa04491cc80b0d340a4a7237adee000ff8ddd', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, NULL, '2016-02-12 10:10:12', '2016-02-12 10:10:12'),
(21, 'User', 4, 4, 'users', 'show', NULL, '630b4d53a03350c9099b3928bce59e3b0e882ce195fe327666c786becd76ef01', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, NULL, '2016-02-12 10:22:37', '2016-02-12 10:22:37'),
(22, 'User', 4, 4, 'users', 'show', NULL, 'ee8c34d7e16e999e03f2e10a7b862c83655c5a24a8bd3e91c5f83ee03c9e9fa7', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, NULL, '2016-02-12 10:22:39', '2016-02-12 10:22:39'),
(23, 'User', 4, 4, 'users', 'show', NULL, '947453359dfbf443706448643899f76e4330a884a891dc69d6edf9a9bfb2eb2b', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, NULL, '2016-02-12 10:22:41', '2016-02-12 10:22:41'),
(24, 'User', 4, 4, 'users', 'show', NULL, '0a9b04ace1c9e1f913c36239fbc0c1002d41ad834c2a0caf8ddb93b1dbe36073', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, NULL, '2016-02-12 10:28:52', '2016-02-12 10:28:52'),
(25, 'User', 4, 4, 'users', 'show', NULL, 'cef2b0a7eb0080be5bc93e6353dfa437c128cfa7778c2f4ac58b9820171d0de4', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, NULL, '2016-02-12 10:28:53', '2016-02-12 10:28:53'),
(26, 'User', 4, 4, 'users', 'show', NULL, 'd1b09401691da55b4f09e2bf2ec81320a3d74027c934a00c15cc1185e406a138', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, NULL, '2016-02-12 10:28:55', '2016-02-12 10:28:55'),
(27, 'User', 4, 4, 'users', 'show', NULL, '7aabb38ea1281489a0f9f75ee1cb8c538b0c8cde51c8a4c74fa86e0219fa29d3', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, NULL, '2016-02-12 10:29:03', '2016-02-12 10:29:03'),
(28, 'User', 4, 4, 'users', 'show', NULL, '66283881d7d8f7bbb87b69c9c1d124b2ac3af75c844be6f5d6ce705b4ed8d01a', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, NULL, '2016-02-12 10:29:23', '2016-02-12 10:29:23'),
(29, 'User', 4, 4, 'users', 'show', NULL, '051c61626be4a044fa5210efe7253f006ef7288cd92298295bbae24760374be3', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, NULL, '2016-02-12 10:29:26', '2016-02-12 10:29:26'),
(30, 'User', 4, 4, 'users', 'show', NULL, '2fdc4fe748d3c71c6b97fa8ab79e6c53c446c1d859477aa9658cacbabea2b077', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, NULL, '2016-02-12 10:29:51', '2016-02-12 10:29:51'),
(31, 'User', 4, 4, 'users', 'show', NULL, '116db6da9c6c1b32877676e6c1ce63269dffd049bd9bd0998ae931cc6e5c2779', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, NULL, '2016-02-12 10:29:54', '2016-02-12 10:29:54'),
(32, 'User', 4, 4, 'users', 'show', NULL, '55113d592f5b7cd57bddb72b9b97aa7ffcdc0e9adaca9270780128260594868b', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, NULL, '2016-02-12 10:45:29', '2016-02-12 10:45:29'),
(33, 'User', 4, 4, 'users', 'show', NULL, '8069b4d4e98dff658a0694ef03c39447888a251346b89251bfdf8cdbbcabfb79', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, NULL, '2016-02-12 10:45:31', '2016-02-12 10:45:31'),
(34, 'Product', 17, 4, 'products', 'show', NULL, 'f971a358b7f2832fda8702d812b7f30846c1c0449c8cfceed3868a089385804f', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/products', '2016-02-12 10:45:36', '2016-02-12 10:45:36'),
(35, 'Product', 12, 4, 'products', 'show', NULL, '75ab897f3cdfda4c560f35f389d90f57e89744a6c7d29a5e897773156d94ea17', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/products', '2016-02-12 10:46:44', '2016-02-12 10:46:44'),
(36, 'User', 4, 4, 'users', 'show', NULL, '0e7495313f1cdfb988665cbc762986c43733ef7d979a9a12a87a5b31af33cae0', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 10:49:07', '2016-02-12 10:49:07'),
(37, 'User', 4, 4, 'users', 'show', NULL, 'b5cb0e727edf84f87827b804482157b01a6505639fcdddcb427340bf95134986', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 10:49:07', '2016-02-12 10:49:07'),
(38, 'User', 4, 4, 'users', 'show', NULL, 'de8153f8ec7b6993ba09bc53d0ef1c34920b4f4cbefbcfff944abeab0c91eda7', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 10:49:38', '2016-02-12 10:49:38'),
(39, 'User', 4, 4, 'users', 'show', NULL, 'f871c6e0348cf805c2be7c0aeb85e7b4fccff31141497300aeaf109a89424e04', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 10:49:39', '2016-02-12 10:49:39'),
(40, 'User', 4, 4, 'users', 'show', NULL, '4a1fc42c9770897bfc97459a6eb1372c9701b8470be6fd32171026b2e8e99baf', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 10:49:59', '2016-02-12 10:49:59'),
(41, 'User', 4, 4, 'users', 'show', NULL, '477032d1b3a0e7a259bf757a7b1ab925b52c347557de39277542502ae1602385', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 10:50:00', '2016-02-12 10:50:00'),
(42, 'User', 4, 4, 'users', 'show', NULL, 'c41e569943560429f0321ef0e8a48ffe516dd5f4b28fad6ae1d1e3d036438e08', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 10:50:21', '2016-02-12 10:50:21'),
(43, 'User', 4, 4, 'users', 'show', NULL, '6407a507eaa359a056955ca7b32a9ce586f620b9f6a5bca9f141a1d7a00aff50', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 10:50:23', '2016-02-12 10:50:23'),
(44, 'User', 4, 4, 'users', 'show', NULL, '13a50ec0ba1168eceaba0884fc622069e8a51972674220cb5f9fa0dc838e20b6', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 10:50:25', '2016-02-12 10:50:25'),
(45, 'User', 4, 4, 'users', 'show', NULL, '4d4384bb4a3fcc73dd5ba99e02da6d5005322aa49b1333e34a25355942564ce1', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 10:50:26', '2016-02-12 10:50:26'),
(46, 'User', 4, 4, 'users', 'show', NULL, 'd8b8861238cea3d8087896f70297dd7c7ffceb79194a55253a130c13aea9c59d', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 10:50:32', '2016-02-12 10:50:32'),
(47, 'User', 4, 4, 'users', 'show', NULL, 'c7c32d0393cc7c904709f3dad3ad95e6d8813ee4bd585ac51abd35fde86094ba', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 10:50:34', '2016-02-12 10:50:34'),
(48, 'User', 4, 4, 'users', 'show', NULL, '53cd85d63e9c53c907ec0343e5e26f33c2954dd4890892ca8a192819036f46cc', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 10:50:53', '2016-02-12 10:50:53'),
(49, 'User', 4, 4, 'users', 'show', NULL, '75325139acf348c5e63bdd8747ed7514b6e962415141b8b6cc2934e6b6bf4143', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 10:51:42', '2016-02-12 10:51:42'),
(50, 'User', 4, 4, 'users', 'show', NULL, '0593a3b97c841b8bafa01cf940edab5c01244c5be143bd51b12672006edf03a4', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 10:52:54', '2016-02-12 10:52:54'),
(51, 'User', 4, 4, 'users', 'show', NULL, '944edcb9272e5c4813abcdcf56ae5ac397ab658e82c3c086ad17508f5b5b5b84', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 10:52:57', '2016-02-12 10:52:57'),
(52, 'User', 4, 4, 'users', 'show', NULL, '1e89017ad793eeca7960a255fb0349615f6b1812e78ebbd0c891f6f2ecb34b7b', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 10:53:09', '2016-02-12 10:53:09'),
(53, 'User', 4, 4, 'users', 'show', NULL, '9cddfd28c19f9904f6fcdccf02f8c85d009553884f4960ea4c53312f61d8d5da', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 10:53:11', '2016-02-12 10:53:11'),
(54, 'User', 4, 4, 'users', 'show', NULL, 'f506059205e75d283eef8a7de4682b144fc65cc340da13971dc40ac40a8b1081', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 11:07:44', '2016-02-12 11:07:44'),
(55, 'User', 4, 4, 'users', 'show', NULL, 'd8c95e8105327e771b4450669f543f186cc824a33782f27711f0aa4a202a26a5', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 11:07:45', '2016-02-12 11:07:45'),
(56, 'User', 4, 4, 'users', 'show', NULL, 'c4a80b2fe831cb8b0ae0178d36155c736e416ed64024ae45136e23fe2ed6c112', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 11:07:59', '2016-02-12 11:07:59'),
(57, 'User', 4, 4, 'users', 'show', NULL, 'e42c4cba8d5f4558004b02541416a30255155cd8b65045abc1b4950de61b1a21', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 11:08:01', '2016-02-12 11:08:01'),
(58, 'User', 4, 4, 'users', 'show', NULL, '9db6808dd7445e69b301e39a686882789adcf07bf3bd54cb95c7dd74eca52c5f', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 11:08:02', '2016-02-12 11:08:02'),
(59, 'User', 4, 4, 'users', 'show', NULL, 'b4af58a7e94b9431cb70c75c8c172257c1d140cb70c9c632119555a381827de9', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 11:08:09', '2016-02-12 11:08:09'),
(60, 'User', 4, 4, 'users', 'show', NULL, '877de168a95786ba1cb3efab7a4a5a4fc7f2ee382624ebd40d0117e98f87c96a', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 11:08:29', '2016-02-12 11:08:29'),
(61, 'User', 5, 5, 'users', 'show', NULL, '9af6b45956e95966beed759393fca29b85434ecb2671a66bb8be3a6f88946041', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/login', '2016-02-12 11:09:37', '2016-02-12 11:09:37'),
(62, 'Product', 16, 5, 'products', 'show', NULL, '87ede806fc1a0a352a0a67b832787dd7ef0393a00806a71938784204ce423720', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/products', '2016-02-12 11:09:45', '2016-02-12 11:09:45'),
(63, 'Product', 10, 5, 'products', 'show', NULL, '8b2841a9444913b74f22ed16400dbb978ba1afb132f7d12a46a3054caddb2e61', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/products', '2016-02-12 11:09:49', '2016-02-12 11:09:49'),
(64, 'User', 4, 5, 'users', 'show', NULL, '18fa5d1bd326f7b7f8fbfc79347ff231f89a9acfd51cfb6d5907c342394ac4a8', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 11:10:39', '2016-02-12 11:10:39'),
(65, 'User', 5, 5, 'users', 'show', NULL, '36f15da6ec7130ad1ba5fd954b943c3087947dbf8734d3e1b94c98dadb0e966a', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 11:10:42', '2016-02-12 11:10:42'),
(66, 'User', 7, 5, 'users', 'show', NULL, 'a4daea586f5c3e5a1ecca32d8c390f535723654af27ee1b1846a4fa8f2c8a7da', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 11:10:44', '2016-02-12 11:10:44'),
(67, 'User', 4, 5, 'users', 'show', NULL, 'eba77c55d5082769934e3e9f7cfe679a09b5363c52746a6bf1c7dd42a7ced693', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 11:13:18', '2016-02-12 11:13:18'),
(68, 'User', 4, 5, 'users', 'show', NULL, 'd1c5e79d0dcaf52fbcac2407898ee31f6c412318deebc3d1f3a9409865b7df70', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, NULL, '2016-02-12 11:14:05', '2016-02-12 11:14:05'),
(69, 'User', 4, 5, 'users', 'show', NULL, '483fe0f8bb9f69043dd671047c850edc633520d7e9594e10b4fb83fe9ef8d66e', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, NULL, '2016-02-12 11:14:07', '2016-02-12 11:14:07'),
(70, 'Product', 17, 5, 'products', 'show', NULL, 'f839796c16e4f8ea1e104f96019688c5918db45bc41d52583ce440edb909b8d4', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/products', '2016-02-12 11:14:23', '2016-02-12 11:14:23'),
(71, 'User', 4, 5, 'users', 'show', NULL, '7736032c46ec6f7ff0897e339ad6f8647d6a3df2706f45e2b774d812a5e9ef49', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 11:14:26', '2016-02-12 11:14:26'),
(72, 'User', 4, 4, 'users', 'show', NULL, 'a56aa1a9bb7ac3052ac767bb5abec3ab4edba7a3a8ffe49e0e52fda7ee6fb6ae', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/login', '2016-02-12 11:14:45', '2016-02-12 11:14:45'),
(73, 'Product', 16, 4, 'products', 'show', NULL, 'b81f25463b3bbf1c5e027a0f800b1068e9c6301544fb452d18490cb16e843766', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/products', '2016-02-12 11:14:53', '2016-02-12 11:14:53'),
(74, 'Product', 12, 4, 'products', 'show', NULL, 'a5268eee3ca76946096042d3b90b310a79782fdb3f32646c963955f89395116a', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/products', '2016-02-12 11:14:58', '2016-02-12 11:14:58'),
(75, 'User', 4, 4, 'users', 'show', NULL, 'd858111d90dfce6da31069a8dbd2742a7512e2d5c72c706a216fdc1beb5ce70a', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 11:15:05', '2016-02-12 11:15:05'),
(76, 'Product', 12, 4, 'products', 'show', NULL, 'ba8206ff191ad37848affd60f63801b42671e13ddcf25d2dcdd0fb8b0d32e228', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/products', '2016-02-12 11:15:17', '2016-02-12 11:15:17'),
(77, 'User', 4, 4, 'users', 'show', NULL, '06509bcb1b1dc6aadadced48c92d68702e1b84c83ec93494c131ec3dfc787d79', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 11:15:20', '2016-02-12 11:15:20'),
(78, 'User', 4, 4, 'users', 'show', NULL, 'a5091d6a5722d99f3419c5b9046bb6dc32637f089d8290c2f8d53ebe67d1c546', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 11:48:15', '2016-02-12 11:48:15'),
(79, 'User', 4, 4, 'users', 'show', NULL, '475029356e7e73f47ddc3176e9c7f1461bbca59b77ff7623422f22173688bf90', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 11:48:15', '2016-02-12 11:48:15'),
(80, 'User', 4, 4, 'users', 'show', NULL, 'f710e49341a4b7cda0998fdade734dbc4a18ceb004791aea63abd31982f51582', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 11:48:31', '2016-02-12 11:48:31'),
(81, 'User', 4, 4, 'users', 'show', NULL, '1f3aeb2c99966892bb81030c36fb385ec382198963113e49281e17f5b38d762d', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 11:48:32', '2016-02-12 11:48:32'),
(82, 'User', 4, 4, 'users', 'show', NULL, '96889b242dab0a3424279375a4908fbf2bd1409cde13130e0ac0ad1546b6e460', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 11:58:50', '2016-02-12 11:58:50'),
(83, 'User', 4, 4, 'users', 'show', NULL, '6ea1ec369aa073300a5ff590266bd66c57c45a855adf08d5ef67ff8795888e1d', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 11:58:51', '2016-02-12 11:58:51'),
(84, 'User', 4, 4, 'users', 'show', NULL, '2f71cb2cf1f6450ea058c5172226f63b062ac65e0e5c977df8bc7e95848bda4f', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:27:44', '2016-02-12 12:27:44'),
(85, 'User', 4, 4, 'users', 'show', NULL, '747f590635a0676b66958c283a5f6e5c6e50f4fc382023639a18d8c8e6d6f113', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:28:58', '2016-02-12 12:28:58'),
(86, 'User', 4, 4, 'users', 'show', NULL, '561b384db4f7eea42de1cae12ed8ae835e8f36f138ea58373abe1b0f5f3294d1', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:29:01', '2016-02-12 12:29:01'),
(87, 'User', 4, 4, 'users', 'show', NULL, '065ec65ae7b1e4cd5fb662069cc0e9331243286146cde54457cc62515708d766', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:29:04', '2016-02-12 12:29:04'),
(88, 'User', 4, 4, 'users', 'show', NULL, '77b9ed80db97a484d2e8c62e9bcfc3a20adcd44b450818235e0692243de601d1', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:30:45', '2016-02-12 12:30:45'),
(89, 'User', 4, 4, 'users', 'show', NULL, 'aac5af21b5d79894b5e3b3cd350e46f71691b177bfdc7123f3650401257e8ae6', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:30:47', '2016-02-12 12:30:47'),
(90, 'User', 4, 4, 'users', 'show', NULL, '04df20158e9c294e77f5ac06f67ddcd2a32ebf424f229976e49cd2cb6d7fcec2', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:31:25', '2016-02-12 12:31:25'),
(91, 'User', 4, 4, 'users', 'show', NULL, '97014a03ccf990d89d1f5712795587637d0ebb288639526c3e59d5bf59ce1992', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:31:27', '2016-02-12 12:31:27'),
(92, 'User', 4, 4, 'users', 'show', NULL, '23c4076a5b67a0186c907dc5d6e5f07f49451f51084b5cdffb3c7a95a31bfb78', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:32:22', '2016-02-12 12:32:22'),
(93, 'User', 4, 4, 'users', 'show', NULL, '25e8d46be6bb5ec5016047c1525511fbc6861cdcc7022def2d48b9705f9973f4', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:32:24', '2016-02-12 12:32:24'),
(94, 'User', 4, 4, 'users', 'show', NULL, '4043f89a68c7cc7f85f384075acdf3e7bd6c8cb5288621c26a433fd122cf8271', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:36:26', '2016-02-12 12:36:26'),
(95, 'User', 4, 4, 'users', 'show', NULL, 'ba25e5bc2804545a82ac540a4e2aca38d9660c4c5f6acc28483afb915042e10d', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:36:36', '2016-02-12 12:36:36'),
(96, 'User', 4, 4, 'users', 'show', NULL, 'f7bf54fd5d4deba6f2fdb9527791e0070d88745841131a12f7d0fa1b00745dfe', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:36:38', '2016-02-12 12:36:38'),
(97, 'User', 4, 4, 'users', 'show', NULL, 'e5916b00f9789b761ce423323d1742406f1d433857e703cd6f178fa19bbccbe9', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:36:39', '2016-02-12 12:36:39'),
(98, 'User', 4, 4, 'users', 'show', NULL, '5ca7a14cd8ae061e3dcc7f386343f8cf455dd3a190f174b263bb7fb288b94706', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:37:16', '2016-02-12 12:37:16'),
(99, 'User', 4, 4, 'users', 'show', NULL, 'd4d129fee77a9d7a2ebbea82080446f0cb1350fb93251c17ab5e05ec4996a12d', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:37:18', '2016-02-12 12:37:18'),
(100, 'User', 4, 4, 'users', 'show', NULL, 'dfdc6a7377272c7cc3ef50c5e1d582a15e57bca0d254fd9071f11dfd7f12a3c3', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:37:19', '2016-02-12 12:37:19'),
(101, 'User', 4, 4, 'users', 'show', NULL, 'afdfa795452921130ef2c0c896ccaa127ec44643ca9799f79c5269bfddd34c33', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:37:20', '2016-02-12 12:37:20'),
(102, 'User', 4, 4, 'users', 'show', NULL, '73b37c8c5a9aa34c02484ae0b4fdd6da19bafdc16c1ccd4c91658ab504e0b2eb', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:39:14', '2016-02-12 12:39:14'),
(103, 'User', 4, 4, 'users', 'show', NULL, '1f79556e69b2737c29516e8716c50547eda725632f40f72cecfcd96445a0e142', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:39:16', '2016-02-12 12:39:16'),
(104, 'User', 4, 4, 'users', 'show', NULL, '0e7041b7bf35a7c8257777ec27b92259a9789c535fe7a1efbdbd4d229efdb58a', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:39:32', '2016-02-12 12:39:32'),
(105, 'User', 4, 4, 'users', 'show', NULL, '7106bc83ebba816124ff1d8ede892884ee6aad719c4bab96773c743c0855777c', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:39:32', '2016-02-12 12:39:32'),
(106, 'User', 4, 4, 'users', 'show', NULL, '09ff2b656e85b9a2119e6ffbbbb21c61ad912cf6a3a23d2bbd2d2a6077fadc7a', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:39:34', '2016-02-12 12:39:34'),
(107, 'User', 4, 4, 'users', 'show', NULL, '7381097f53fa99d01c40839a3e4d0dd2f1ee9ba93d42cf4b039ae0d47f83ad94', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:39:48', '2016-02-12 12:39:48'),
(108, 'User', 4, 4, 'users', 'show', NULL, 'accac50ec6feffc1b0060689404fac06ad9722dd6499723965381c0acdcd2bc3', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:39:50', '2016-02-12 12:39:50'),
(109, 'User', 4, 4, 'users', 'show', NULL, '70114f88317cfe5f20069cd7a09ebcf0fa50fbd6ed3e79d7e3c5139f487e743b', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:39:51', '2016-02-12 12:39:51'),
(110, 'User', 4, 4, 'users', 'show', NULL, '0b1beb6ea370872fb73ea37f0d35ccf88a55a5000bd87358e0917bf603987391', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:40:46', '2016-02-12 12:40:46'),
(111, 'User', 4, 4, 'users', 'show', NULL, 'c70b27bb9b9e30d8cd49029c52eca54d0c7665914fc750d7504c89ce8274f3b3', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:42:26', '2016-02-12 12:42:26'),
(112, 'User', 4, 4, 'users', 'show', NULL, '1e1fcb5553090c79e071f50787967db7c1fcaae0964b617697b001d2ac2e9b01', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:42:52', '2016-02-12 12:42:52'),
(113, 'User', 4, 4, 'users', 'show', NULL, '2f39678cff5e75cac222a3ca07729f52e6d146386abf70e7c4afd1e96c4c90ca', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:44:57', '2016-02-12 12:44:57'),
(114, 'User', 4, 4, 'users', 'show', NULL, '2682050ba7e31aeb88178baff6ab81cce4483b7a0ddde5b1173464050d5a6612', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:45:00', '2016-02-12 12:45:00'),
(115, 'User', 4, 4, 'users', 'show', NULL, '2a09fc4b10a88bf5110fcf6a8f044bd4e41a0c23839fdf43f1a818e164b56d70', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:45:12', '2016-02-12 12:45:12'),
(116, 'User', 4, 4, 'users', 'show', NULL, 'f5d6b97fef7cd5e21dd06b1fd84101d11116e74b3552223d8873a7c00fb6c51c', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:45:13', '2016-02-12 12:45:13'),
(117, 'User', 4, 4, 'users', 'show', NULL, '745efbbf6fb193afa2786917f415bb15638290bb19eb79e3fe3e7fa8a1f03ada', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:45:16', '2016-02-12 12:45:16'),
(118, 'User', 4, 4, 'users', 'show', NULL, 'b321de5d87194037ef93514a356790a3a6d29c3afd66b72ab2aeb99240ad2877', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:46:52', '2016-02-12 12:46:52'),
(119, 'User', 4, 4, 'users', 'show', NULL, 'ec41b8dc4a131b41f2068bdd52ddb5382a3d03be6eed67c7be88fd9094ae7a3c', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:46:53', '2016-02-12 12:46:53'),
(120, 'User', 4, 4, 'users', 'show', NULL, '5cf347ab96326986eb71b0ff25238dfcc4dbcec5030984e48a0e22e45e12a490', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:47:35', '2016-02-12 12:47:35'),
(121, 'User', 4, 4, 'users', 'show', NULL, '9189cca7444287429b558ba36bb2daa633f0419f028cc63a83dd21d2488bacb3', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:47:38', '2016-02-12 12:47:38'),
(122, 'User', 4, 4, 'users', 'show', NULL, '183c8a6a78f65989fa6e6c74eeb7408fcc0512e3a873768c4dc6590b3330d10d', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:47:53', '2016-02-12 12:47:53'),
(123, 'User', 4, 4, 'users', 'show', NULL, 'b0224c71c0912bb2c8ca4fbbccade0d1148c9fa888e1e0c28c34a2d2bc369a20', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:47:54', '2016-02-12 12:47:54'),
(124, 'User', 4, 4, 'users', 'show', NULL, '8d53af7f500a57191691e38b0b3305fd69c89a8291eb0df38961884a2d9eebb4', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:49:07', '2016-02-12 12:49:07'),
(125, 'User', 4, 4, 'users', 'show', NULL, '100d24015b4341cf28ca9b2d3741a5d02b23e93553a25f1da53b7a96477aa91a', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:49:09', '2016-02-12 12:49:09'),
(126, 'User', 4, 4, 'users', 'show', NULL, '97bfadb770bdc6be1ea861d8d0c323f7edb4f1811709e17705000a7885994af6', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:49:53', '2016-02-12 12:49:53'),
(127, 'User', 4, 4, 'users', 'show', NULL, '7da61f62e86b5311c7391179e14f27a2db30aa23d9e9dd1b37f8bfb9bc7a64ed', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:51:24', '2016-02-12 12:51:24'),
(128, 'User', 4, 4, 'users', 'show', NULL, '34a0930d0ea44b340d84b031792eea6a137b619de1913897b8ec378ba97b402f', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:51:25', '2016-02-12 12:51:25'),
(129, 'User', 4, 4, 'users', 'show', NULL, 'c22ba71e76b77d84ca55c6035594f4850e73fe6332ed527c958b409ea95d34c9', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:51:32', '2016-02-12 12:51:32'),
(130, 'User', 4, 4, 'users', 'show', NULL, '4f09a5955012dc521745a00855ab06edcf3cfbd964c88ce41e2ea01f9c4ad4d7', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:51:34', '2016-02-12 12:51:34'),
(131, 'User', 4, 4, 'users', 'show', NULL, 'cd3632c2a48288e72f6d4c1ccf8ecb84c51d84031a64c26c5f7e2cc9cd20eea4', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:51:43', '2016-02-12 12:51:43'),
(132, 'User', 4, 4, 'users', 'show', NULL, 'aa75576e166f89c23750a687a6377456295fc7b2e97ba9bf66aedb087fb4463e', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:51:46', '2016-02-12 12:51:46'),
(133, 'User', 4, 4, 'users', 'show', NULL, '2970cf548fa83b6ef2293ad07c8913be47020def08ed004fbda3ade24924dd22', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:51:48', '2016-02-12 12:51:48'),
(134, 'User', 4, 4, 'users', 'show', NULL, '3258d2a0fce30a3ff636f53dbeb7d3c35c84237c539319f1e90fc75a5455daa6', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:52:00', '2016-02-12 12:52:00'),
(135, 'User', 4, 4, 'users', 'show', NULL, '11c6e652ea2ff09d8b2e13488343aa562d9145e5079a81fc8153fe24463560dc', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:52:02', '2016-02-12 12:52:02'),
(136, 'User', 4, 4, 'users', 'show', NULL, '7f9b0913652db7b28709ffc323162eb641aabc82a83864a3346e8cd797db1a9a', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:52:16', '2016-02-12 12:52:16'),
(137, 'User', 4, 4, 'users', 'show', NULL, 'e8f580401b3512b7e76d18fd78cf83336ed4902736084e60004a10543d47d6a5', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:52:18', '2016-02-12 12:52:18'),
(138, 'User', 4, 4, 'users', 'show', NULL, 'ced6efa3b56bddd4a5b27e5348a082969a6dec9e5059fb7a63220447facfb4a3', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:52:42', '2016-02-12 12:52:42'),
(139, 'User', 4, 4, 'users', 'show', NULL, '6ca9a86824c75685019d4f62969295097635ee9acb3058781c375eab784e7827', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:52:44', '2016-02-12 12:52:44'),
(140, 'User', 4, 4, 'users', 'show', NULL, 'a7d3f8f1ec02c8855c029bd665e7193535853a4b982f723f6452036b185e3247', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:52:51', '2016-02-12 12:52:51'),
(141, 'User', 4, 4, 'users', 'show', NULL, '3311bb5db5bdd7d34877c778ede0a6ec7d8bd181fd97c4637a71b34ccdf18156', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:52:52', '2016-02-12 12:52:52'),
(142, 'User', 4, 4, 'users', 'show', NULL, '9433abb1bc01e90de6d4c7edac73137b014ea0b9cc892037efc7bb7bde90a977', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:53:00', '2016-02-12 12:53:00'),
(143, 'User', 4, 4, 'users', 'show', NULL, '623028fca7df86e699b5962937311b505dd88aaddb8181b6142c87729cc704b2', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:53:01', '2016-02-12 12:53:01'),
(144, 'User', 4, 4, 'users', 'show', NULL, 'a2a39530a1c50b5bd706d891e2868a3facac2430e91659cf7f814ca53005bf3d', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:54:01', '2016-02-12 12:54:01'),
(145, 'User', 4, 4, 'users', 'show', NULL, '08ca0529aa7a24831f20d78e32b7c5ebba348663fa80def7c2a9b3883db3489c', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:54:03', '2016-02-12 12:54:03'),
(146, 'User', 4, 4, 'users', 'show', NULL, '1809e88eef40b4c8dfbd48540be0cfc52011a182e619b947c221ec78b022866f', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:54:10', '2016-02-12 12:54:10'),
(147, 'User', 4, 4, 'users', 'show', NULL, 'abdd4ab31bf2b18d51c6f1834efe26422247c277d378581a24e21d69cd96cdc8', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 12:54:11', '2016-02-12 12:54:11'),
(148, 'User', 4, 4, 'users', 'show', NULL, '4e5804b7d3a2f19c9491f168e80ad736f019e64ec7ed2bf90950229f544917b5', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 13:02:33', '2016-02-12 13:02:33'),
(149, 'User', 4, 4, 'users', 'show', NULL, '29d0c26a2128bba3cfd673ca83950f228213e0aaf1f34853070ae3929c58cb87', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 13:02:36', '2016-02-12 13:02:36'),
(150, 'User', 4, 4, 'users', 'show', NULL, '574fadf489030661fa69b175c49cb319904713ce65f932efea9529480cde3c6b', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 13:04:44', '2016-02-12 13:04:44'),
(151, 'User', 4, 4, 'users', 'show', NULL, '0bc3876b1281a98c556abbf5176263ce5e8b9cb670033358b30902235ac558db', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 13:04:45', '2016-02-12 13:04:45'),
(152, 'User', 4, 4, 'users', 'show', NULL, '19ab81ffb9da64af3e897f8c82f25bbaa1f9a3373686cad34ba0a480d1eae2a8', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 13:05:30', '2016-02-12 13:05:30'),
(153, 'User', 4, 4, 'users', 'show', NULL, 'ab6989cb478184b0ba5a0a04ac129fb8c5070e9a552d4265df6466fca834795a', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 13:05:32', '2016-02-12 13:05:32'),
(154, 'User', 4, 4, 'users', 'show', NULL, '6cd9ef3b51d9abe95bae4ed5d4132cb77d895928848d8d020fb22b8e5e5ff59e', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 13:06:15', '2016-02-12 13:06:15'),
(155, 'User', 4, 4, 'users', 'show', NULL, '19b781b1e29823e35a2f29a6c68e73b3bfdd94038c05e7af3ccbb080012f3540', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 13:06:16', '2016-02-12 13:06:16'),
(156, 'User', 4, 4, 'users', 'show', NULL, 'ad944b71ff08c8c2a6d7cbffb44846fb3898f1dd50f08081cc79a16b7e05c191', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 13:09:15', '2016-02-12 13:09:15'),
(157, 'User', 4, 4, 'users', 'show', NULL, '42a052ac015a5b1433115f9124612a72ab05ecd23a06072487e0590843141c9b', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 13:09:17', '2016-02-12 13:09:17'),
(158, 'User', 4, 4, 'users', 'show', NULL, '732ae64e8743acdbef43630e2bdaafe4176387a96096ad3c3272d0e4ee08a195', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 13:10:52', '2016-02-12 13:10:52'),
(159, 'User', 4, 4, 'users', 'show', NULL, '751f0d2ccf5b8fbdb4fb63bfa173a120bc9c24d4a7853cd7094470cd114334ef', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 13:10:55', '2016-02-12 13:10:55'),
(160, 'User', 4, 4, 'users', 'show', NULL, '527794fccb3e044fede71d695c940cb31de8194cfe20b9a81d6a02de8129833c', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 13:17:51', '2016-02-12 13:17:51'),
(161, 'User', 4, 4, 'users', 'show', NULL, 'c349d40674a6d837ea8162012c18fb11f67212425733067ce4ab5e1a52ddcfbe', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 13:17:52', '2016-02-12 13:17:52'),
(162, 'User', 4, 4, 'users', 'show', NULL, '92fc7952ffdaf991a2ee934d66bcd34b508b3a17cae95b52c5f11d560ec0a0d3', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 13:17:53', '2016-02-12 13:17:53'),
(163, 'User', 4, 4, 'users', 'show', NULL, '0aae0642e4031d39f40ea541e0a86c0a66fa1d0435c8b8b97eeb95c00a3340c7', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 13:17:55', '2016-02-12 13:17:55'),
(164, 'User', 4, 4, 'users', 'show', NULL, '88c877300d16b4bee17f5fc9a60cc6aff8840af4a9edc5c0101e3d34feb49fe7', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 13:18:02', '2016-02-12 13:18:02'),
(165, 'User', 4, 4, 'users', 'show', NULL, 'dd84a1526a0a446065c74deb7429a5cb525e6d13c46a5f461f4cd2454dd5945f', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 13:18:03', '2016-02-12 13:18:03'),
(166, 'User', 4, 4, 'users', 'show', NULL, '21002fb4fc0c09fb0e27f1c0eadb75a585751e969bf8f6ca5ab864c247ac398f', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 13:52:51', '2016-02-12 13:52:51'),
(167, 'User', 4, 4, 'users', 'show', NULL, '6a59ee6ccddbf78996c020bfe4bb23dd239e71db88a9693a2f12bad6a3f72821', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 13:52:53', '2016-02-12 13:52:53'),
(168, 'User', 4, 4, 'users', 'show', NULL, '75bdfe29f0125cfb1a0e2ad6bab283bb49eaf1a56cc5513770d1c3c785262ba9', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 13:53:06', '2016-02-12 13:53:06'),
(169, 'User', 4, 4, 'users', 'show', NULL, '16d3f338084bfb31f0ebb37ac1ca68004df4b982f05d4ac3b446752d6f0f5b4b', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 14:14:43', '2016-02-12 14:14:43'),
(170, 'User', 4, 4, 'users', 'show', NULL, '96f5a857cb00f5fc71a4c96a0485f798aacddf74dc30e4223ab69ec4a83114fd', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 14:27:45', '2016-02-12 14:27:45'),
(171, 'User', 4, 4, 'users', 'show', NULL, '1d187b77630d8fef6f3f0336897034b3a8489ecdc643cc6163682da187e8e4d6', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 14:27:46', '2016-02-12 14:27:46'),
(172, 'User', 4, 4, 'users', 'show', NULL, 'a2a003363b0aa4942636cf25434ba91d17e1a1f82671cbc09b231d45a5f0c783', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 14:43:12', '2016-02-12 14:43:12'),
(173, 'User', 4, 4, 'users', 'show', NULL, 'ca5055ea8037bb0a50c80f914dfd0b81b532b709ea24ecb414d95358b72badd4', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 14:43:13', '2016-02-12 14:43:13'),
(174, 'User', 4, 4, 'users', 'show', NULL, 'f5f0e32f33df7b819f0503b6d2f5e472bc79f38bff7fa6947d9dcb97ba428ed9', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 14:44:35', '2016-02-12 14:44:35'),
(175, 'User', 4, 4, 'users', 'show', NULL, '7c470799b0622fcbbd9bc74cd564b5fc6aedfb82ec3a1f30d855b1053a411ff9', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 14:44:37', '2016-02-12 14:44:37'),
(176, 'User', 4, 4, 'users', 'show', NULL, '25eefee0a5ee6304f00a979844ff8afaf9c01ab736690bc681aebf9838bacf5d', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 14:45:53', '2016-02-12 14:45:53'),
(177, 'User', 4, 4, 'users', 'show', NULL, 'f7894a51574be69cd9d7dd5352b564379ca0e4c14c6a019e76b48be13c368437', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 14:45:53', '2016-02-12 14:45:53'),
(178, 'User', 4, 4, 'users', 'show', NULL, '61db32f26d927dc076d290cfeeed9a9736a62c9af81fe1632b8c8a11cde8213f', '127.0.0.1', '65edb1b0d631a0aaf2725f32c414d421', NULL, 'http://localhost:3000/users', '2016-02-12 14:46:01', '2016-02-12 14:46:01');

-- --------------------------------------------------------

--
-- Structure de la table `overall_averages`
--

CREATE TABLE IF NOT EXISTS `overall_averages` (
  `id` int(11) NOT NULL,
  `rateable_id` int(11) DEFAULT NULL,
  `rateable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `overall_avg` float NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vider la table avant d'insérer `overall_averages`
--

TRUNCATE TABLE `overall_averages`;
-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `price` float DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` float DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `price_minimum` int(11) DEFAULT NULL,
  `mini_bid` int(11) DEFAULT NULL,
  `immediate_price` int(11) DEFAULT NULL,
  `bidder_id` int(11) DEFAULT NULL,
  `bidding_date_end` datetime DEFAULT NULL,
  `bidmax` int(11) DEFAULT NULL,
  `buyer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vider la table avant d'insérer `products`
--

TRUNCATE TABLE `products`;
--
-- Contenu de la table `products`
--

INSERT INTO `products` (`id`, `title`, `description`, `price`, `created_at`, `updated_at`, `user_id`, `category_id`, `price_minimum`, `mini_bid`, `immediate_price`, `bidder_id`, `bidding_date_end`, `bidmax`, `buyer_id`) VALUES
(2, 'table', 'table', 45, '2016-02-03 14:18:10', '2016-02-11 13:54:51', NULL, 11, 50, 80, 120, NULL, '2016-02-17 00:00:00', NULL, 4),
(3, 'table', 'une table pour manger', 300, '2016-02-03 19:19:12', '2016-02-11 13:24:55', NULL, 11, 50, 60, 70, NULL, '2016-02-17 00:00:00', NULL, 4),
(4, 'chaussure', 'pour marcher ', 501, '2016-02-03 19:32:38', '2016-02-11 17:39:23', 4, 9, 80, 150, 300, 7, '2016-02-20 00:00:00', 502, 4),
(5, 'Table de jardin', 'Pour sniffer de la coke au soleil', 78, '2016-02-08 13:21:27', '2016-02-11 09:32:58', 4, 9, 200, 300, 500, NULL, '2016-02-18 00:00:00', NULL, NULL),
(6, 'Echarpe', 'Truc pour tenir chaud', 78, '2016-02-08 14:21:40', '2016-02-11 09:32:37', 4, 9, 50, 90, 120, NULL, '2016-02-18 00:00:00', NULL, NULL),
(7, 'canne', 'veritable canne ecossaise', 501, '2016-02-08 15:21:35', '2016-02-11 14:09:53', 4, 2, 50, 70, 100, 7, '2016-02-21 00:00:00', 500, NULL),
(8, 'Un sac', 'pour mettre des choses ', 100, '2016-02-09 10:29:29', '2016-02-11 09:31:29', 4, 12, 80, 120, 300, NULL, '2016-02-20 00:00:00', NULL, NULL),
(10, 'Une echarpe', 'un truc pour mettre autour du cou et tenir chaud', 45, '2016-02-09 18:37:32', '2016-02-11 09:31:05', 4, 9, 40, 50, 80, NULL, '2016-02-15 00:00:00', NULL, NULL),
(11, 'Un slip', 'Pour mettre son cul et sa bite', 10, '2016-02-09 18:42:56', '2016-02-11 13:55:32', 4, 10, 20, 40, 80, NULL, '2016-02-26 00:00:00', NULL, 7),
(12, 'slip en laine', 'pour tenir chaud au boules', 78, '2016-02-10 14:50:29', '2016-02-11 08:50:47', 4, 10, 5, 25, 80, NULL, '2016-02-17 00:00:00', NULL, NULL),
(13, 'string paillettes', 'pour faire la fete', 202, '2016-02-10 15:08:28', '2016-02-11 16:41:29', 4, 13, 20, 80, 200, 7, '2016-02-20 00:00:00', 300, 4),
(14, 'Un pot de glaise', 'Un magnifique pot de glaise pour mettre ses vieilles peaux.', 45, '2016-02-10 18:14:28', '2016-02-11 12:10:56', 5, 14, 45, 100, 500, NULL, '2016-02-20 00:00:00', NULL, 4),
(15, 'écouteurs sony', 'écouteurs pour la musique', 101, '2016-02-11 14:27:41', '2016-02-11 14:39:53', 7, 2, 20, 50, 100, 5, '2016-02-14 00:00:00', 100, 5),
(16, 'Chaine hi-fi', 'pour écouter du bon son', 200, '2016-02-11 14:54:50', '2016-02-11 14:54:50', 5, 1, 200, 300, 400, NULL, '2016-02-12 00:00:00', NULL, NULL),
(17, 'Une souris', 'magnifique souris', 46, '2016-02-11 17:43:42', '2016-02-11 18:31:02', 4, 2, 45, 80, 500, 5, '2016-02-14 00:00:00', 47, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `rates`
--

CREATE TABLE IF NOT EXISTS `rates` (
  `id` int(11) NOT NULL,
  `rater_id` int(11) DEFAULT NULL,
  `rateable_id` int(11) DEFAULT NULL,
  `rateable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stars` float NOT NULL,
  `dimension` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vider la table avant d'insérer `rates`
--

TRUNCATE TABLE `rates`;
--
-- Contenu de la table `rates`
--

INSERT INTO `rates` (`id`, `rater_id`, `rateable_id`, `rateable_type`, `stars`, `dimension`, `created_at`, `updated_at`) VALUES
(1, 7, 4, 'Product', 4, 'visual_effects', '2016-02-05 09:27:04', '2016-02-05 09:27:04'),
(2, 7, 4, 'Product', 4, 'original_score', '2016-02-05 09:27:06', '2016-02-05 09:27:08'),
(3, 7, 4, 'Product', 5, 'custome_design', '2016-02-05 09:27:08', '2016-02-05 09:27:08'),
(5, 7, 5, 'User', 4, 'trustability', '2016-02-05 10:10:50', '2016-02-05 10:10:50'),
(6, 4, 4, 'Product', 4, 'quality', '2016-02-05 13:14:32', '2016-02-05 13:14:32'),
(7, 4, 3, 'Product', 4, 'quality', '2016-02-08 11:29:37', '2016-02-08 11:29:37'),
(8, 4, 4, 'User', 5, 'trustability', '2016-02-09 18:55:24', '2016-02-09 18:55:24'),
(9, 4, 7, 'User', 1, 'trustability', '2016-02-11 08:48:26', '2016-02-11 08:48:26'),
(10, 7, 13, 'Product', 4, 'quality', '2016-02-11 13:56:44', '2016-02-11 13:56:44');

-- --------------------------------------------------------

--
-- Structure de la table `rating_caches`
--

CREATE TABLE IF NOT EXISTS `rating_caches` (
  `id` int(11) NOT NULL,
  `cacheable_id` int(11) DEFAULT NULL,
  `cacheable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avg` float NOT NULL,
  `qty` int(11) NOT NULL,
  `dimension` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vider la table avant d'insérer `rating_caches`
--

TRUNCATE TABLE `rating_caches`;
--
-- Contenu de la table `rating_caches`
--

INSERT INTO `rating_caches` (`id`, `cacheable_id`, `cacheable_type`, `avg`, `qty`, `dimension`, `created_at`, `updated_at`) VALUES
(1, 4, 'Product', 4, 1, 'visual_effects', '2016-02-05 09:27:04', '2016-02-05 09:27:04'),
(2, 4, 'Product', 4, 1, 'original_score', '2016-02-05 09:27:07', '2016-02-05 09:27:08'),
(3, 4, 'Product', 5, 1, 'custome_design', '2016-02-05 09:27:09', '2016-02-05 09:27:09'),
(5, 5, 'User', 4, 1, 'trustability', '2016-02-05 10:10:50', '2016-02-05 10:10:50'),
(6, 4, 'Product', 4, 1, 'quality', '2016-02-05 13:14:32', '2016-02-05 13:14:32'),
(7, 3, 'Product', 4, 1, 'quality', '2016-02-08 11:29:37', '2016-02-08 11:29:37'),
(8, 4, 'User', 5, 1, 'trustability', '2016-02-09 18:55:24', '2016-02-09 18:55:24'),
(9, 7, 'User', 1, 1, 'trustability', '2016-02-11 08:48:26', '2016-02-11 08:48:26'),
(10, 13, 'Product', 4, 1, 'quality', '2016-02-11 13:56:44', '2016-02-11 13:56:44');

-- --------------------------------------------------------

--
-- Structure de la table `schema_migrations`
--

CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vider la table avant d'insérer `schema_migrations`
--

TRUNCATE TABLE `schema_migrations`;
--
-- Contenu de la table `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20160201105423'),
('20160201114635'),
('20160201133726'),
('20160201154120'),
('20160201162105'),
('20160202171534'),
('20160202193624'),
('20160203191143'),
('20160204163445'),
('20160204163446'),
('20160204163447'),
('20160204163448'),
('20160205085424'),
('20160205085425'),
('20160205085426'),
('20160205085427'),
('20160205103806'),
('20160205134739'),
('20160205143942'),
('20160208085554'),
('20160208094559'),
('20160208131454'),
('20160209165509'),
('20160209170022'),
('20160209180239'),
('20160210162602'),
('20160210163748'),
('20160211112921'),
('20160211184557');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_digest` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_adress` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `remember_digest` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vider la table avant d'insérer `users`
--

TRUNCATE TABLE `users`;
--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_digest`, `postal_adress`, `created_at`, `updated_at`, `remember_digest`, `admin`) VALUES
(4, 'alexis', 'drago', 'alexis@gmail.com', '$2a$10$JgmzdLQLuaocGHWIOpssIeDIehdmWXEHJXnVththeUItIoDWbwjH2', '34 rue de la rien', '2016-02-02 11:17:43', '2016-02-04 15:27:07', NULL, 0),
(5, 'Marie', 'Drago', 'marie@gmail.com', '$2a$10$ga5vpfv3zY6AIOW19K4LkeMvp999DlRf/PiroheyBMP3vWAW4yh1C', 'lolilo', '2016-02-02 16:16:21', '2016-02-04 15:37:40', NULL, 1),
(7, 'Hari', 'Seldon', 'hariseldon@gmail.com', '$2a$10$1A1R5CtL4lsIABsrEvFmIOOl7MwAK/HiShCBxJR2Perk38C4szwNi', 'planete foundation', '2016-02-03 16:50:42', '2016-02-03 16:50:42', NULL, 1);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `average_caches`
--
ALTER TABLE `average_caches`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_categories_on_ancestry` (`ancestry`);

--
-- Index pour la table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_comments_on_user_id` (`user_id`),
  ADD KEY `index_comments_on_commentable_id_and_commentable_type` (`commentable_id`,`commentable_type`);

--
-- Index pour la table `impressions`
--
ALTER TABLE `impressions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `impressionable_type_message_index` (`impressionable_type`,`message`(255),`impressionable_id`),
  ADD KEY `poly_request_index` (`impressionable_type`,`impressionable_id`,`request_hash`),
  ADD KEY `poly_ip_index` (`impressionable_type`,`impressionable_id`,`ip_address`),
  ADD KEY `poly_session_index` (`impressionable_type`,`impressionable_id`,`session_hash`),
  ADD KEY `controlleraction_request_index` (`controller_name`,`action_name`,`request_hash`),
  ADD KEY `controlleraction_ip_index` (`controller_name`,`action_name`,`ip_address`),
  ADD KEY `controlleraction_session_index` (`controller_name`,`action_name`,`session_hash`),
  ADD KEY `index_impressions_on_user_id` (`user_id`);

--
-- Index pour la table `overall_averages`
--
ALTER TABLE `overall_averages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `rates`
--
ALTER TABLE `rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_rates_on_rater_id` (`rater_id`),
  ADD KEY `index_rates_on_rateable_id_and_rateable_type` (`rateable_id`,`rateable_type`);

--
-- Index pour la table `rating_caches`
--
ALTER TABLE `rating_caches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_rating_caches_on_cacheable_id_and_cacheable_type` (`cacheable_id`,`cacheable_type`);

--
-- Index pour la table `schema_migrations`
--
ALTER TABLE `schema_migrations`
  ADD UNIQUE KEY `unique_schema_migrations` (`version`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `average_caches`
--
ALTER TABLE `average_caches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT pour la table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `impressions`
--
ALTER TABLE `impressions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=179;
--
-- AUTO_INCREMENT pour la table `overall_averages`
--
ALTER TABLE `overall_averages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT pour la table `rates`
--
ALTER TABLE `rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `rating_caches`
--
ALTER TABLE `rating_caches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
