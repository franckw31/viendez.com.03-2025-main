-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mar. 01 avr. 2025 à 10:34
-- Version du serveur : 8.0.41-0ubuntu0.24.04.1
-- Version de PHP : 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `dbs9616600`
--

-- --------------------------------------------------------

--
-- Structure de la table `activite`
--

CREATE TABLE `activite` (
  `id-activite` int NOT NULL,
  `id_challenge` int NOT NULL DEFAULT '1',
  `id-structure` int DEFAULT '1',
  `id-membre` int NOT NULL DEFAULT '265',
  `titre-activite` varchar(64) DEFAULT NULL,
  `date_depart` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `heure_depart` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ville` varchar(64) DEFAULT NULL,
  `rue` varchar(64) DEFAULT NULL,
  `lng` double DEFAULT '0',
  `lat` float DEFAULT '0',
  `icon` varchar(255) DEFAULT 'wpt',
  `ico-siz` float DEFAULT NULL,
  `photo` varchar(255) DEFAULT 'bg.png',
  `lien` varchar(255) NOT NULL DEFAULT '<a href="/panel/voir-activite.php?uid=	',
  `lien-id` varchar(64) DEFAULT NULL,
  `lien-texte` varchar(255) NOT NULL DEFAULT '"><img src="panel/images/',
  `lien-texte-fin` varchar(1024) NOT NULL DEFAULT '" width="150" height="150" align="center">Cliquer Pour Infos',
  `places` int DEFAULT NULL,
  `reserves` int DEFAULT NULL,
  `options` int DEFAULT '0',
  `libre` int DEFAULT NULL,
  `commentaire` varchar(128) DEFAULT NULL,
  `buyin` int DEFAULT NULL,
  `rake` int DEFAULT NULL,
  `bounty` int DEFAULT NULL,
  `jetons` int DEFAULT NULL,
  `recave` int DEFAULT NULL,
  `addon` int DEFAULT NULL,
  `ante` varchar(16) DEFAULT NULL,
  `bonus` int DEFAULT '0',
  `nb-tables` int NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `activite`
--

INSERT INTO `activite` (`id-activite`, `id_challenge`, `id-structure`, `id-membre`, `titre-activite`, `date_depart`, `end_date`, `heure_depart`, `ville`, `rue`, `lng`, `lat`, `icon`, `ico-siz`, `photo`, `lien`, `lien-id`, `lien-texte`, `lien-texte-fin`, `places`, `reserves`, `options`, `libre`, `commentaire`, `buyin`, `rake`, `bounty`, `jetons`, `recave`, `addon`, `ante`, `bonus`, `nb-tables`, `created_at`) VALUES
(380, 1, 1, 2, 'Toulouse', '2025-04-02 20:30:00', NULL, '2025-04-02 20:30:00', 'Toulouse -  Balma', NULL, 43.61, 1.48, 'wpt', NULL, 'bg.png', '<a href=\"/panel/voir-activite.php?uid=	', NULL, '\"><img src=\"panel/images/', '\" width=\"150\" height=\"150\" align=\"center\">Cliquer Pour Infos', 20, NULL, 0, NULL, '', 10, 0, 5, 40000, 1, 0, '0', 5000, 1, '2025-03-22 18:39:55'),
(381, 1, 1, 1078, 'Plaisance', '2025-04-03 20:30:00', NULL, '2025-04-03 20:30:00', 'Plaisance du touch', NULL, 43.5899114, 1.28736, 'wpt', NULL, 'bg.png', '<a href=\"/panel/voir-activite.php?uid=	', NULL, '\"><img src=\"panel/images/', '\" width=\"150\" height=\"150\" align=\"center\">Cliquer Pour Infos', 24, NULL, 0, NULL, 'Poulet coco , pommes de terre maison, gâteaux apéritif, biere, sodas, sucreries et café', 10, 12, 0, 40000, 1, 0, '0', 5000, 3, '2025-03-22 19:05:40'),
(382, 1, 1, 1078, 'Plaisance', '2025-04-04 20:30:00', NULL, '2025-03-22 19:05:51', 'Plaisance du touch', NULL, 43.5899114, 1.28736, 'wpt', NULL, 'bg.png', '<a href=\"/panel/voir-activite.php?uid=	', NULL, '\"><img src=\"panel/images/', '\" width=\"150\" height=\"150\" align=\"center\">Cliquer Pour Infos', 24, NULL, 0, NULL, 'Poulet coco , pommes de terre maison, gâteaux apéritif, biere, sodas, sucreries et café', 10, 12, 0, 35000, 1, 0, '0', 5000, 1, '2025-03-22 19:05:51'),
(383, 1, 1, 1078, 'Plaisance', '2025-04-10 20:30:00', NULL, '2025-03-22 19:05:59', 'Plaisance du touch', NULL, 43.5899114, 1.28736, 'wpt', NULL, 'bg.png', '<a href=\"/panel/voir-activite.php?uid=	', NULL, '\"><img src=\"panel/images/', '\" width=\"150\" height=\"150\" align=\"center\">Cliquer Pour Infos', 24, NULL, 0, NULL, 'Poulet coco , pommes de terre maison, gâteaux apéritif, biere, sodas, sucreries et café', 10, 12, 0, 35000, 1, 0, '0', 5000, 1, '2025-03-22 19:05:59'),
(384, 1, 1, 1078, 'Plaisance', '2025-04-11 20:30:00', NULL, '2025-03-22 19:06:11', 'Plaisance du touch', NULL, 43.5899114, 1.28736, 'wpt', NULL, 'bg.png', '<a href=\"/panel/voir-activite.php?uid=	', NULL, '\"><img src=\"panel/images/', '\" width=\"150\" height=\"150\" align=\"center\">Cliquer Pour Infos', 24, NULL, 0, NULL, 'Poulet coco , pommes de terre maison, gâteaux apéritif, biere, sodas, sucreries et café', 10, 12, 0, 35000, 1, 0, '0', 5000, 1, '2025-03-22 19:06:11'),
(385, 1, 1, 1078, 'Plaisance', '2025-04-17 20:30:00', NULL, '2025-03-22 19:06:15', 'Plaisance du touch', NULL, 43.5899114, 1.28736, 'wpt', NULL, 'bg.png', '<a href=\"/panel/voir-activite.php?uid=	', NULL, '\"><img src=\"panel/images/', '\" width=\"150\" height=\"150\" align=\"center\">Cliquer Pour Infos', 24, NULL, 0, NULL, 'Poulet coco , pommes de terre maison, gâteaux apéritif, biere, sodas, sucreries et café', 10, 12, 0, 35000, 1, 0, '0', 5000, 1, '2025-03-22 19:06:15'),
(386, 1, 1, 1078, 'Plaisance', '2025-04-18 20:30:00', NULL, '2025-03-22 19:06:17', 'Plaisance du touch', NULL, 43.5899114, 1.28736, 'wpt', NULL, 'bg.png', '<a href=\"/panel/voir-activite.php?uid=	', NULL, '\"><img src=\"panel/images/', '\" width=\"150\" height=\"150\" align=\"center\">Cliquer Pour Infos', 24, NULL, 0, NULL, 'Poulet coco , pommes de terre maison, gâteaux apéritif, biere, sodas, sucreries et café', 10, 12, 0, 35000, 1, 0, '0', 5000, 1, '2025-03-22 19:06:17'),
(387, 1, 1, 1078, 'Plaisance', '2025-04-24 20:30:00', NULL, '2025-03-22 19:06:18', 'Plaisance du touch', NULL, 43.5899114, 1.28736, 'wpt', NULL, 'bg.png', '<a href=\"/panel/voir-activite.php?uid=	', NULL, '\"><img src=\"panel/images/', '\" width=\"150\" height=\"150\" align=\"center\">Cliquer Pour Infos', 24, NULL, 0, NULL, 'Poulet coco , pommes de terre maison, gâteaux apéritif, biere, sodas, sucreries et café', 10, 12, 0, 35000, 1, 0, '0', 5000, 1, '2025-03-22 19:06:18'),
(388, 1, 1, 4, 'Rangeuil', '2025-04-20 16:00:00', NULL, '2025-03-22 19:06:53', 'Toulouse - Rangeuil', NULL, 43.581136, 1.45146, 'wpt', NULL, 'bg.png', '<a href=\"/panel/voir-activite.php?uid=	', NULL, '\"><img src=\"panel/images/', '\" width=\"150\" height=\"150\" align=\"center\">Cliquer Pour Infos', 0, NULL, 0, NULL, '', 0, 0, 0, 0, 0, 0, '0', 0, 1, '2025-03-22 19:06:53'),
(389, 1, 1, 1092, 'Drémil', '2025-04-12 16:00:00', NULL, '2025-03-22 19:07:10', 'Dremil Lafage', NULL, 43.5919768, 1.57896, 'wpt', NULL, 'bg.png', '<a href=\"/panel/voir-activite.php?uid=	', NULL, '\"><img src=\"panel/images/', '\" width=\"150\" height=\"150\" align=\"center\">Cliquer Pour Infos', 0, NULL, 0, NULL, NULL, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, 1, '2025-03-22 19:07:10'),
(390, 1, 1, 1092, 'Drémil', '2025-04-16 20:30:00', NULL, '2025-03-22 19:07:12', 'Dremil Lafage', NULL, 43.5919768, 1.57896, 'wpt', NULL, 'bg.png', '<a href=\"/panel/voir-activite.php?uid=	', NULL, '\"><img src=\"panel/images/', '\" width=\"150\" height=\"150\" align=\"center\">Cliquer Pour Infos', 0, NULL, 0, NULL, NULL, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, 1, '2025-03-22 19:07:12'),
(391, 1, 1, 1092, 'Drémil', '2025-04-26 16:00:00', NULL, '2025-03-22 19:07:14', 'Dremil Lafage', NULL, 43.5919768, 1.57896, 'wpt', NULL, 'bg.png', '<a href=\"/panel/voir-activite.php?uid=	', NULL, '\"><img src=\"panel/images/', '\" width=\"150\" height=\"150\" align=\"center\">Cliquer Pour Infos', 0, NULL, 0, NULL, NULL, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, 1, '2025-03-22 19:07:14'),
(392, 1, 1, 2, 'Toulouse', '2025-04-05 16:00:00', NULL, '2025-04-05 16:00:00', 'Toulouse -  Balma', NULL, 43.61, 1.48, 'wpt', NULL, 'bg.png', '<a href=\"/panel/voir-activite.php?uid=	', NULL, '\"><img src=\"panel/images/', '\" width=\"150\" height=\"150\" align=\"center\">Cliquer Pour Infos', 20, NULL, 0, NULL, '', 10, 5, 10, 40000, 1, 0, '0', 5000, 1, '2025-03-22 19:07:33'),
(393, 1, 1, 2, 'Toulouse', '2025-04-09 20:30:00', NULL, '2025-03-22 19:07:35', 'Toulouse -  Balma', NULL, 43.61, 1.48, 'wpt', NULL, 'bg.png', '<a href=\"/panel/voir-activite.php?uid=	', NULL, '\"><img src=\"panel/images/', '\" width=\"150\" height=\"150\" align=\"center\">Cliquer Pour Infos', 18, NULL, 0, NULL, '', 10, 5, 10, 35000, 1, 0, '0', 5000, 1, '2025-03-22 19:07:35'),
(394, 1, 1, 2, 'Toulouse', '2025-04-13 16:00:00', NULL, '2025-03-22 19:07:37', 'Toulouse', NULL, 43.61, 1.48, 'wpt', NULL, 'bg.png', '<a href=\"/panel/voir-activite.php?uid=	', NULL, '\"><img src=\"panel/images/', '\" width=\"150\" height=\"150\" align=\"center\">Cliquer Pour Infos', 18, NULL, 0, NULL, '', 10, 5, 10, 35000, 1, 0, '0', 5000, 1, '2025-03-22 19:07:37'),
(395, 1, 1, 2, 'Toulouse', '2025-04-19 16:00:00', NULL, '2025-03-22 19:07:38', 'Toulouse -  Balma', NULL, 43.61, 1.48, 'wpt', NULL, 'bg.png', '<a href=\"/panel/voir-activite.php?uid=	', NULL, '\"><img src=\"panel/images/', '\" width=\"150\" height=\"150\" align=\"center\">Cliquer Pour Infos', 18, NULL, 0, NULL, '', 10, 5, 10, 35000, 1, 0, '0', 5000, 1, '2025-03-22 19:07:38'),
(396, 1, 1, 2, 'Toulouse', '2025-04-23 20:30:00', NULL, '2025-03-22 19:07:50', 'Toulouse -  Balma', NULL, 43.61, 1.48, 'wpt', NULL, 'bg.png', '<a href=\"/panel/voir-activite.php?uid=	', NULL, '\"><img src=\"panel/images/', '\" width=\"150\" height=\"150\" align=\"center\">Cliquer Pour Infos', 18, NULL, 0, NULL, '', 10, 5, 10, 35000, 1, 0, '0', 5000, 1, '2025-03-22 19:07:50'),
(397, 1, 1, 2, 'Toulouse', '2025-04-27 16:00:00', NULL, '2025-03-22 19:07:51', 'Toulouse -  Balma', NULL, 43.61, 1.48, 'wpt', NULL, 'bg.png', '<a href=\"/panel/voir-activite.php?uid=	', NULL, '\"><img src=\"panel/images/', '\" width=\"150\" height=\"150\" align=\"center\">Cliquer Pour Infos', 18, NULL, 0, NULL, '', 10, 5, 10, 35000, 1, 0, '0', 5000, 1, '2025-03-22 19:07:51'),
(401, 1, 1, 1092, 'Plaisance', '2025-04-30 20:00:00', NULL, '2025-03-22 19:35:27', 'Plaisance', NULL, 43.5919768, 1.57896, 'wpt', NULL, 'bg.png', '<a href=\"/panel/voir-activite.php?uid=	', NULL, '\"><img src=\"panel/images/', '\" width=\"150\" height=\"150\" align=\"center\">Cliquer Pour Infos', 0, NULL, 0, NULL, NULL, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, 1, '2025-03-22 19:35:27'),
(402, 2, 1, 1078, 'Plaisance', '2025-04-25 20:30:00', NULL, '2025-03-22 19:35:49', 'Plaisance du touch', NULL, 43.5899114, 1.28736, 'wpt', NULL, 'bg.png', '<a href=\"/panel/voir-activite.php?uid=	', NULL, '\"><img src=\"panel/images/', '\" width=\"150\" height=\"150\" align=\"center\">Cliquer Pour Infos', 24, NULL, 0, NULL, 'Poulet coco , pommes de terre maison, gâteaux apéritif, biere, sodas, sucreries et café', 10, 12, 0, 35000, 1, 0, '0', 5000, 1, '2025-03-22 19:35:49'),
(403, 2, 1, 1078, 'Plaisance', '2025-04-07 20:30:00', NULL, '2025-03-25 08:41:26', 'Plaisance du Touch', NULL, 43.5899114, 1.28736, 'wpt', NULL, 'bg.png', '<a href=\"/panel/voir-activite.php?uid=	', NULL, '\"><img src=\"panel/images/', '\" width=\"150\" height=\"150\" align=\"center\">Cliquer Pour Infos', 24, NULL, 0, NULL, 'Poulet coco , pommes de terre maison, gâteaux apéritif, biere, sodas, sucreries et café', 10, 12, 0, 35000, 1, 0, '0', 5000, 1, '2025-03-25 08:41:26'),
(404, 1, 1, 1078, 'Plaisance', '2025-04-14 20:30:00', NULL, '2025-03-25 08:41:28', 'Plaisance du touch', NULL, 43.5899114, 1.28736, 'wpt', NULL, 'bg.png', '<a href=\"/panel/voir-activite.php?uid=	', NULL, '\"><img src=\"panel/images/', '\" width=\"150\" height=\"150\" align=\"center\">Cliquer Pour Infos', 24, NULL, 0, NULL, 'Poulet coco , pommes de terre maison, gâteaux apéritif, biere, sodas, sucreries et café', 10, 12, 0, 35000, 1, 0, '0', 5000, 1, '2025-03-25 08:41:28'),
(405, 1, 1, 1078, 'Plaisance', '2025-04-21 20:30:00', NULL, '2025-03-25 08:41:30', 'Plaisance du touch', NULL, 43.5899114, 1.28736, 'wpt', NULL, 'bg.png', '<a href=\"/panel/voir-activite.php?uid=	', NULL, '\"><img src=\"panel/images/', '\" width=\"150\" height=\"150\" align=\"center\">Cliquer Pour Infos', 24, NULL, 0, NULL, 'Poulet coco , pommes de terre maison, gâteaux apéritif, biere, sodas, sucreries et café', 10, 12, 0, 35000, 1, 0, '0', 5000, 1, '2025-03-25 08:41:30'),
(406, 1, 1, 1078, 'Plaisance', '2025-04-28 20:30:00', NULL, '2025-03-25 08:41:32', 'Plaisance du touch', NULL, 43.5899114, 1.28736, 'wpt', NULL, 'bg.png', '<a href=\"/panel/voir-activite.php?uid=	', NULL, '\"><img src=\"panel/images/', '\" width=\"150\" height=\"150\" align=\"center\">Cliquer Pour Infos', 24, NULL, 0, NULL, 'Poulet coco , pommes de terre maison, gâteaux apéritif, biere, sodas, sucreries et café', 10, 12, 0, 35000, 1, 0, '0', 5000, 1, '2025-03-25 08:41:32'),
(407, 1, 1, 1078, 'Plaisance', '2025-03-26 20:30:00', '2025-03-26 10:36:36', '2025-03-26 20:30:00', 'Plaisance du touch', NULL, 43.5899114, 1.28736, 'wpt', NULL, 'bg.png', '<a href=\"/panel/voir-activite.php?uid=	', NULL, '\"><img src=\"panel/images/', '\" width=\"150\" height=\"150\" align=\"center\">Cliquer Pour Infos', 24, NULL, 0, NULL, 'Poulet coco , pommes de terre maison, gâteaux apéritif, biere, sodas, sucreries et café', 10, 12, 0, 40000, 1, 0, '0', 5000, 3, '2025-03-26 10:36:36'),
(408, 1, 1, 1078, 'Plaisance', '2025-03-28 20:00:00', NULL, '2025-03-28 20:30:00', 'Plaisance du touch', NULL, 43.5899114, 1.28736, 'wpt', NULL, 'bg.png', '<a href=\"/panel/voir-activite.php?uid=	', NULL, '\"><img src=\"panel/images/', '\" width=\"150\" height=\"150\" align=\"center\">Cliquer Pour Infos', 32, NULL, 0, NULL, '', 20, 12, 0, 40000, 1, 0, '0', 5000, 3, '2025-03-27 09:34:09'),
(411, 1, 1, 1093, 'Cugnaux', '2025-04-01 20:00:00', NULL, '2025-03-30 08:30:42', 'Cugnaux', NULL, 43.557893, 1.36073, 'wpt', NULL, 'bg.png', '<a href=\"/panel/voir-activite.php?uid=	', NULL, '\"><img src=\"panel/images/', '\" width=\"150\" height=\"150\" align=\"center\">Cliquer Pour Infos', 25, NULL, 0, NULL, '', 10, 12, 0, 35000, 2, 0, '0', 5000, 1, '2025-03-30 08:30:42'),
(412, 1, 1, 1093, 'Cugnaux', '2025-04-08 20:00:00', NULL, '2025-03-30 08:31:54', 'Cugnaux', NULL, 43.557893, 1.36073, 'wpt', NULL, 'bg.png', '<a href=\"/panel/voir-activite.php?uid=	', NULL, '\"><img src=\"panel/images/', '\" width=\"150\" height=\"150\" align=\"center\">Cliquer Pour Infos', 25, NULL, 0, NULL, '', 10, 12, 0, 35000, 2, 0, '0', 5000, 1, '2025-03-30 08:31:54'),
(413, 1, 1, 1093, 'Cugnaux', '2025-04-15 20:00:00', NULL, '2025-03-30 08:31:56', 'Cugnaux', NULL, 43.557893, 1.36073, 'wpt', NULL, 'bg.png', '<a href=\"/panel/voir-activite.php?uid=	', NULL, '\"><img src=\"panel/images/', '\" width=\"150\" height=\"150\" align=\"center\">Cliquer Pour Infos', 25, NULL, 0, NULL, '', 10, 12, 0, 35000, 2, 0, '0', 5000, 1, '2025-03-30 08:31:56'),
(414, 1, 1, 1093, 'Cugnaux', '2025-04-22 20:00:00', NULL, '2025-03-30 08:31:58', 'Cugnaux', NULL, 43.557893, 1.36073, 'wpt', NULL, 'bg.png', '<a href=\"/panel/voir-activite.php?uid=	', NULL, '\"><img src=\"panel/images/', '\" width=\"150\" height=\"150\" align=\"center\">Cliquer Pour Infos', 25, NULL, 0, NULL, '', 10, 12, 0, 35000, 2, 0, '0', 5000, 1, '2025-03-30 08:31:58'),
(415, 1, 1, 1093, 'Cugnaux', '2025-04-29 20:00:00', NULL, '2025-03-30 08:32:00', 'Cugnaux', NULL, 43.557893, 1.36073, 'wpt', NULL, 'bg.png', '<a href=\"/panel/voir-activite.php?uid=	', NULL, '\"><img src=\"panel/images/', '\" width=\"150\" height=\"150\" align=\"center\">Cliquer Pour Infos', 25, NULL, 0, NULL, '', 10, 12, 0, 35000, 2, 0, '0', 5000, 1, '2025-03-30 08:32:00'),
(417, 1, 1, 1078, 'Plaisance', '2025-04-06 20:00:00', NULL, '2025-03-30 08:35:26', 'Plaisance du touch', NULL, 43.5899114, 1.28736, 'wpt', NULL, 'bg.png', '<a href=\"/panel/voir-activite.php?uid=	', NULL, '\"><img src=\"panel/images/', '\" width=\"150\" height=\"150\" align=\"center\">Cliquer Pour Infos', 24, NULL, 0, NULL, 'Poulet coco , pommes de terre maison, gâteaux apéritif, biere, sodas, sucreries et café', 10, 12, 0, 35000, 1, 0, '0', 5000, 1, '2025-03-30 08:35:26'),
(418, 1, 1, 1078, 'Plaisance', '2025-03-31 20:00:00', NULL, '2025-03-30 13:17:30', 'Plaisance du touch', NULL, 43.5899114, 1.28736, 'wpt', NULL, 'bg.png', '<a href=\"/panel/voir-activite.php?uid=	', NULL, '\"><img src=\"panel/images/', '\" width=\"150\" height=\"150\" align=\"center\">Cliquer Pour Infos', 24, NULL, 0, NULL, 'Poulet coco , pommes de terre maison, gâteaux apéritif, biere, sodas, sucreries et café', 10, 5, 0, 40000, 2, 0, '0', 5000, 2, '2025-03-30 13:17:30');

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

CREATE TABLE `adresse` (
  `id` int NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `date_ajout` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `identifier` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `adresse`
--

INSERT INTO `adresse` (`id`, `address`, `latitude`, `longitude`, `date_ajout`, `identifier`) VALUES
(40, '8 Rue De La Solidarité, 31500 Toulouse, France', 43.60832500, 1.47957400, '2025-03-01 18:17:33', 265),
(170, '21 Rue Des Chênes, 31830 Plaisance-du-Touch, France', 43.58967300, 1.28983900, '2025-03-02 11:00:24', 1),
(171, '275 Route De Seysses, 31100 Toulouse, France', 43.57029700, 1.41487400, '2025-03-02 11:02:19', 2),
(172, '3 Rue Fernand Grenier, 31270 Cugnaux, France', 43.53547036, 1.34642739, '2025-03-02 14:21:15', 3),
(173, 'Boulevard De Genève, 31200 Toulouse, France', 43.61300810, 1.41834724, '2025-03-03 19:14:04', 243),
(174, '8 Avenue Hubert Curien, 31100 Toulouse, France', 43.56201431, 1.43097106, '2025-03-03 19:14:19', 244),
(175, '27 Impasse De La Glassière, 31270 Cugnaux, France', 43.55789300, 1.36073200, '2025-03-04 07:05:15', 27),
(176, '21 Rue Des Chênes, 31830 Plaisance-du-Touch, France', 43.58967300, 1.28983900, '2025-03-04 07:05:47', 21);

-- --------------------------------------------------------

--
-- Structure de la table `blindes`
--

CREATE TABLE `blindes` (
  `id-blinde` int NOT NULL,
  `ordre` int NOT NULL,
  `nom` varchar(16) DEFAULT NULL,
  `val-sb` int NOT NULL,
  `val-bb` int NOT NULL,
  `pause` int NOT NULL,
  `ante` varchar(16) DEFAULT '0',
  `duree` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `blindes`
--

INSERT INTO `blindes` (`id-blinde`, `ordre`, `nom`, `val-sb`, `val-bb`, `pause`, `ante`, `duree`) VALUES
(1, 1, '100/100', 100, 100, 0, '0', 20),
(2, 2, '100/200', 100, 200, 0, '0', 20),
(3, 3, '200/400', 200, 400, 0, '0', 20),
(4, 4, '300/600', 300, 600, 0, '0', 20),
(5, 5, '400/800', 400, 800, 0, '0', 20),
(6, 6, '500/1000', 500, 1000, 0, '0', 20),
(7, 7, '600/1200', 600, 1200, 0, '0', 20),
(8, 8, '700/1400', 700, 1400, 0, '0', 20),
(9, 9, '800/1600', 800, 1600, 0, '0', 20),
(10, 10, '900/1800', 900, 1800, 0, '0', 20),
(11, 11, '1000/2000', 1000, 2000, 0, '0', 20),
(12, 12, '1100-2200', 1100, 2200, 0, '0', 20),
(13, 13, '1200-2400', 1200, 2400, 0, '0', 20),
(14, 14, '1300-2600', 1300, 2600, 0, '0', 20),
(15, 15, '1400-2800', 1400, 2800, 0, '0', 20),
(16, 16, '1500-3000', 1500, 3000, 0, '0', 20),
(17, 17, '1600-3200', 1600, 3200, 0, '0', 20),
(18, 18, '1700-3400', 1700, 3400, 0, '0', 20),
(19, 19, '1800-3600', 1800, 3600, 0, '0', 20),
(20, 20, '1900-3800', 1900, 3800, 0, '0', 20),
(21, 21, '2000-4000', 2000, 4000, 0, '0', 20),
(22, 22, '2100-4200', 2100, 4200, 0, '0', 20),
(23, 23, '2200-4400', 2200, 4400, 0, '0', 20),
(24, 24, '2300-4600', 2300, 4600, 0, '0', 20),
(25, 25, '2400-4800', 2400, 4800, 0, '0', 20),
(26, 26, '2500/5000', 2500, 5000, 0, '0', 20),
(27, 27, '3000/6000', 3000, 6000, 0, '0', 20),
(28, 28, '3500/7000', 3500, 7000, 0, '0', 20),
(29, 29, '4000/8000', 4000, 8000, 0, '0', 20),
(30, 30, '5000/10000', 5000, 10000, 0, '0', 20),
(31, 31, '6000/12000', 6000, 12000, 0, '0', 20),
(32, 32, '7000/14000', 7000, 14000, 0, '0', 20),
(33, 33, '8000/16000', 8000, 16000, 0, '0', 20),
(34, 34, '9000/18000', 9000, 18000, 0, '0', 20),
(35, 35, '10000/20000', 10000, 20000, 0, '0', 20),
(36, 36, '12000/24000', 12000, 24000, 0, '0', 20),
(37, 37, '15000/30000', 15000, 30000, 0, '0', 20),
(38, 38, '20000/40000', 20000, 40000, 0, '0', 20),
(39, 39, '22500/45000', 22500, 45000, 0, '0', 20),
(40, 40, '25000/50000', 25000, 50000, 0, '0', 20),
(41, 41, '30000/60000', 30000, 60000, 0, '0', 900),
(42, 42, '35000/70000', 35000, 70000, 0, '0', 900),
(43, 43, '50000/100000', 50000, 100000, 0, '0', 900),
(99, 99, 'Pause', 0, 0, 1, '0', 10);

-- --------------------------------------------------------

--
-- Structure de la table `blindes-live`
--

CREATE TABLE `blindes-live` (
  `id` int NOT NULL,
  `id-activite` int DEFAULT NULL,
  `ordre` int DEFAULT NULL,
  `nom` varchar(64) DEFAULT NULL,
  `sb` int NOT NULL DEFAULT '0',
  `bb` int NOT NULL DEFAULT '0',
  `duree` time DEFAULT NULL,
  `fin` datetime DEFAULT NULL,
  `ante` varchar(16) DEFAULT '0',
  `en_pause` int DEFAULT '0',
  `heure_pause` datetime DEFAULT NULL,
  `heure_depause` datetime DEFAULT NULL,
  `delta` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `blindes-live`
--

INSERT INTO `blindes-live` (`id`, `id-activite`, `ordre`, `nom`, `sb`, `bb`, `duree`, `fin`, `ante`, `en_pause`, `heure_pause`, `heure_depause`, `delta`) VALUES
(122, 370, 1, 'Pause', 0, 0, '00:00:05', '2026-03-19 10:51:34', '0', 0, NULL, NULL, NULL),
(123, 371, 1, 'Pause', 0, 0, '00:00:05', '2026-03-19 10:52:29', '0', 0, NULL, NULL, NULL),
(124, 372, 1, 'Pause', 0, 0, '00:00:05', '2026-03-19 10:52:33', '0', 0, NULL, NULL, NULL),
(125, 373, 1, 'Pause', 0, 0, '00:00:05', '2026-03-19 10:54:49', '0', 0, NULL, NULL, NULL),
(126, 374, 1, 'Pause', 0, 0, '00:00:05', '2026-03-19 11:50:48', '0', 0, NULL, NULL, NULL),
(127, 375, 1, 'Pause', 0, 0, '00:00:05', '2026-03-19 11:52:17', '0', 0, NULL, NULL, NULL),
(128, 376, 1, 'Pause', 0, 0, '00:00:05', '2026-03-19 11:52:21', '0', 0, NULL, NULL, NULL),
(131, 378, 1, '100/100', 100, 100, '00:00:20', '2025-03-19 13:57:47', '0', 0, NULL, NULL, NULL),
(132, 378, 2, '100/200', 100, 200, '00:00:20', '2025-03-19 14:17:47', '0', 0, NULL, NULL, NULL),
(133, 378, 3, '200/400', 200, 400, '00:00:20', '2025-03-19 14:37:47', '0', 0, NULL, NULL, NULL),
(134, 378, 4, '300/600', 300, 600, '00:00:20', '2025-03-19 14:57:47', '0', 0, NULL, NULL, NULL),
(135, 378, 5, '400/800', 400, 800, '00:00:20', '2025-03-19 15:17:47', '0', 0, NULL, NULL, NULL),
(136, 378, 6, 'Pause', 0, 0, '00:00:10', '2025-03-19 15:27:47', '0', 0, NULL, NULL, NULL),
(137, 378, 7, '500/1000', 500, 1000, '00:00:18', '2025-03-19 15:45:47', '0', 0, NULL, NULL, NULL),
(138, 378, 8, '600/1200', 600, 1200, '00:00:18', '2025-03-19 16:03:47', '0', 0, NULL, NULL, NULL),
(139, 378, 9, '700/1400', 700, 1400, '00:00:18', '2025-03-19 16:21:47', '0', 0, NULL, NULL, NULL),
(140, 378, 10, '800/1600', 800, 1600, '00:00:18', '2025-03-19 16:39:47', '0', 0, NULL, NULL, NULL),
(141, 378, 11, 'Pause', 0, 0, '00:00:05', '2025-03-19 16:44:47', '0', 0, NULL, NULL, NULL),
(142, 378, 12, '1000/2000', 1000, 2000, '00:00:16', '2025-03-19 17:00:47', '0', 0, NULL, NULL, NULL),
(143, 378, 13, '1500-3000', 1500, 3000, '00:00:16', '2025-03-19 17:16:47', '0', 0, NULL, NULL, NULL),
(144, 378, 14, '2000-4000', 2000, 4000, '00:00:16', '2025-03-19 17:32:47', '0', 0, NULL, NULL, NULL),
(145, 378, 15, '3000/6000', 3000, 6000, '00:00:16', '2025-03-19 17:48:47', '0', 0, NULL, NULL, NULL),
(146, 378, 16, 'Pause', 0, 0, '00:00:05', '2025-03-19 17:53:47', '0', 0, NULL, NULL, NULL),
(147, 378, 17, '4000/8000', 4000, 8000, '00:00:14', '2025-03-19 18:07:47', '0', 0, NULL, NULL, NULL),
(148, 378, 18, '7000/14000', 7000, 14000, '00:00:14', '2025-03-19 18:21:47', '0', 0, NULL, NULL, NULL),
(149, 378, 19, '10000/20000', 10000, 20000, '00:00:14', '2025-03-19 18:35:47', '0', 0, NULL, NULL, NULL),
(150, 378, 20, '15000/30000', 15000, 30000, '00:00:14', '2025-03-19 18:49:47', '0', 0, NULL, NULL, NULL),
(151, 378, 21, 'Pause', 0, 0, '00:00:05', '2025-03-19 18:54:47', '0', 0, NULL, NULL, NULL),
(152, 378, 22, '22500/45000', 22500, 45000, '00:00:12', '2025-03-19 19:06:47', '0', 0, NULL, NULL, NULL),
(153, 378, 23, '35000/70000', 35000, 70000, '00:00:12', '2025-03-19 19:18:47', '0', 0, NULL, NULL, NULL),
(154, 378, 24, '50000/100000', 50000, 100000, '00:00:12', '2025-03-19 19:30:47', '0', 0, NULL, NULL, NULL),
(299, 377, 1, '100/100', 100, 100, '00:00:20', '2025-03-20 09:36:35', '0', 0, NULL, NULL, NULL),
(300, 377, 2, '100/200', 100, 200, '00:00:20', '2025-03-20 09:56:35', '0', 0, NULL, NULL, NULL),
(301, 377, 3, '200/400', 200, 400, '00:00:20', '2025-03-20 10:16:35', '0', 0, NULL, NULL, NULL),
(302, 377, 4, '300/600', 300, 600, '00:00:20', '2025-03-20 10:36:35', '0', 0, NULL, NULL, NULL),
(303, 377, 5, '400/800', 400, 800, '00:00:20', '2025-03-20 10:56:35', '0', 0, NULL, NULL, NULL),
(304, 377, 6, 'Pause', 0, 0, '00:00:10', '2025-03-20 11:06:35', '0', 0, NULL, NULL, NULL),
(305, 377, 7, '500/1000', 500, 1000, '00:00:18', '2025-03-20 11:24:35', '0', 0, NULL, NULL, NULL),
(306, 377, 8, '600/1200', 600, 1200, '00:00:18', '2025-03-20 11:42:35', '0', 0, NULL, NULL, NULL),
(307, 377, 9, '700/1400', 700, 1400, '00:00:18', '2025-03-20 12:00:35', '0', 0, NULL, NULL, NULL),
(308, 377, 10, '800/1600', 800, 1600, '00:00:18', '2025-03-20 12:18:35', '0', 0, NULL, NULL, NULL),
(309, 377, 11, 'Pause', 0, 0, '00:00:05', '2025-03-20 12:23:35', '0', 0, NULL, NULL, NULL),
(310, 377, 12, '1000/2000', 1000, 2000, '00:00:16', '2025-03-20 12:39:35', '0', 0, NULL, NULL, NULL),
(311, 377, 13, '1500-3000', 1500, 3000, '00:00:16', '2025-03-20 12:55:35', '0', 0, NULL, NULL, NULL),
(312, 377, 14, '2000-4000', 2000, 4000, '00:00:16', '2025-03-20 13:11:35', '0', 0, NULL, NULL, NULL),
(313, 377, 15, '3000/6000', 3000, 6000, '00:00:16', '2025-03-20 13:27:35', '0', 0, NULL, NULL, NULL),
(314, 377, 16, 'Pause', 0, 0, '00:00:05', '2025-03-20 13:32:35', '0', 0, NULL, NULL, NULL),
(315, 377, 17, '4000/8000', 4000, 8000, '00:00:14', '2025-03-20 13:46:35', '0', 0, NULL, NULL, NULL),
(316, 377, 18, '7000/14000', 7000, 14000, '00:00:14', '2025-03-20 14:00:35', '0', 0, NULL, NULL, NULL),
(317, 377, 19, '10000/20000', 10000, 20000, '00:00:14', '2025-03-20 14:14:35', '0', 0, NULL, NULL, NULL),
(318, 377, 20, '15000/30000', 15000, 30000, '00:00:14', '2025-03-20 14:28:35', '0', 0, NULL, NULL, NULL),
(319, 377, 21, 'Pause', 0, 0, '00:00:05', '2025-03-20 14:33:35', '0', 0, NULL, NULL, NULL),
(320, 377, 22, '22500/45000', 22500, 45000, '00:00:12', '2025-03-20 14:45:35', '0', 0, NULL, NULL, NULL),
(321, 377, 23, '35000/70000', 35000, 70000, '00:00:12', '2025-03-20 14:57:35', '0', 0, NULL, NULL, NULL),
(322, 377, 24, '50000/100000', 50000, 100000, '00:00:12', '2025-03-20 15:09:35', '0', 0, NULL, NULL, NULL),
(395, 369, 1, '100/100', 100, 100, '00:00:20', '2025-03-19 20:20:00', '0', 0, NULL, NULL, NULL),
(396, 369, 2, '100/200', 100, 200, '00:00:20', '2025-03-19 20:40:00', '0', 0, NULL, NULL, NULL),
(397, 369, 3, '200/400', 200, 400, '00:00:20', '2025-03-19 21:00:00', '0', 0, NULL, NULL, NULL),
(398, 369, 4, '300/600', 300, 600, '00:00:20', '2025-03-19 21:20:00', '0', 0, NULL, NULL, NULL),
(399, 369, 5, '400/800', 400, 800, '00:00:20', '2025-03-19 21:40:00', '0', 0, NULL, NULL, NULL),
(400, 369, 6, 'Pause', 0, 0, '00:00:10', '2025-03-19 21:50:00', '0', 0, NULL, NULL, NULL),
(401, 369, 7, '500/1000', 500, 1000, '00:00:18', '2025-03-19 22:08:00', '0', 0, NULL, NULL, NULL),
(402, 369, 8, '600/1200', 600, 1200, '00:00:18', '2025-03-19 22:26:00', '0', 0, NULL, NULL, NULL),
(403, 369, 9, '700/1400', 700, 1400, '00:00:18', '2025-03-19 22:44:00', '0', 0, NULL, NULL, NULL),
(404, 369, 10, '800/1600', 800, 1600, '00:00:18', '2025-03-19 23:02:00', '0', 0, NULL, NULL, NULL),
(405, 369, 11, 'Pause', 0, 0, '00:00:05', '2025-03-19 23:07:00', '0', 0, NULL, NULL, NULL),
(406, 369, 12, '1000/2000', 1000, 2000, '00:00:16', '2025-03-19 23:23:00', '0', 0, NULL, NULL, NULL),
(407, 369, 13, '1500-3000', 1500, 3000, '00:00:16', '2025-03-19 23:39:00', '0', 0, NULL, NULL, NULL),
(408, 369, 14, '2000-4000', 2000, 4000, '00:00:16', '2025-03-19 23:55:00', '0', 0, NULL, NULL, NULL),
(409, 369, 15, '3000/6000', 3000, 6000, '00:00:16', '2025-03-20 00:11:00', '0', 0, NULL, NULL, NULL),
(410, 369, 16, 'Pause', 0, 0, '00:00:05', '2025-03-20 00:16:00', '0', 0, NULL, NULL, NULL),
(411, 369, 17, '4000/8000', 4000, 8000, '00:00:14', '2025-03-20 00:30:00', '0', 0, NULL, NULL, NULL),
(412, 369, 18, '7000/14000', 7000, 14000, '00:00:14', '2025-03-20 00:44:00', '0', 0, NULL, NULL, NULL),
(413, 369, 19, '10000/20000', 10000, 20000, '00:00:14', '2025-03-20 00:58:00', '0', 0, NULL, NULL, NULL),
(414, 369, 20, '15000/30000', 15000, 30000, '00:00:14', '2025-03-20 01:12:00', '0', 0, NULL, NULL, NULL),
(415, 369, 21, 'Pause', 0, 0, '00:00:05', '2025-03-20 01:17:00', '0', 0, NULL, NULL, NULL),
(416, 369, 22, '22500/45000', 22500, 45000, '00:00:12', '2025-03-20 01:29:00', '0', 0, NULL, NULL, NULL),
(417, 369, 23, '35000/70000', 35000, 70000, '00:00:12', '2025-03-20 01:41:00', '0', 0, NULL, NULL, NULL),
(418, 369, 24, '50000/100000', 50000, 100000, '00:00:12', '2025-03-20 01:53:00', '0', 0, NULL, NULL, NULL),
(420, 379, 1, '100/100', 100, 100, '00:00:20', '2025-03-21 08:30:17', '0', 0, NULL, NULL, NULL),
(421, 379, 2, '100/200', 100, 200, '00:00:20', '2025-03-21 08:50:17', '0', 0, NULL, NULL, NULL),
(422, 379, 3, '200/400', 200, 400, '00:00:20', '2025-03-21 09:10:17', '0', 0, NULL, NULL, NULL),
(423, 379, 4, '300/600', 300, 600, '00:00:20', '2025-03-21 09:30:17', '0', 0, NULL, NULL, NULL),
(424, 379, 5, '400/800', 400, 800, '00:00:20', '2025-03-21 09:50:17', '0', 0, NULL, NULL, NULL),
(425, 379, 6, 'Pause', 0, 0, '00:00:10', '2025-03-21 10:00:17', '0', 0, NULL, NULL, NULL),
(426, 379, 7, '500/1000', 500, 1000, '00:00:18', '2025-03-21 10:18:17', '0', 0, NULL, NULL, NULL),
(427, 379, 8, '600/1200', 600, 1200, '00:00:18', '2025-03-21 10:36:17', '0', 0, NULL, NULL, NULL),
(428, 379, 9, '700/1400', 700, 1400, '00:00:18', '2025-03-21 10:54:17', '0', 0, NULL, NULL, NULL),
(429, 379, 10, '800/1600', 800, 1600, '00:00:18', '2025-03-21 11:12:17', '0', 0, NULL, NULL, NULL),
(430, 379, 11, 'Pause', 0, 0, '00:00:05', '2025-03-21 11:17:17', '0', 0, NULL, NULL, NULL),
(431, 379, 12, '1000/2000', 1000, 2000, '00:00:16', '2025-03-21 11:33:17', '0', 0, NULL, NULL, NULL),
(432, 379, 13, '1500-3000', 1500, 3000, '00:00:16', '2025-03-21 11:49:17', '0', 0, NULL, NULL, NULL),
(433, 379, 14, '2000-4000', 2000, 4000, '00:00:16', '2025-03-21 12:05:17', '0', 0, NULL, NULL, NULL),
(434, 379, 15, '3000/6000', 3000, 6000, '00:00:16', '2025-03-21 12:21:17', '0', 0, NULL, NULL, NULL),
(435, 379, 16, 'Pause', 0, 0, '00:00:05', '2025-03-21 12:26:17', '0', 0, NULL, NULL, NULL),
(436, 379, 17, '4000/8000', 4000, 8000, '00:00:14', '2025-03-21 12:40:17', '0', 0, NULL, NULL, NULL),
(437, 379, 18, '7000/14000', 7000, 14000, '00:00:14', '2025-03-21 12:54:17', '0', 0, NULL, NULL, NULL),
(438, 379, 19, '10000/20000', 10000, 20000, '00:00:14', '2025-03-21 13:08:17', '0', 0, NULL, NULL, NULL),
(439, 379, 20, '15000/30000', 15000, 30000, '00:00:14', '2025-03-21 13:22:17', '0', 0, NULL, NULL, NULL),
(440, 379, 21, 'Pause', 0, 0, '00:00:05', '2025-03-21 13:27:17', '0', 0, NULL, NULL, NULL),
(441, 379, 22, '22500/45000', 22500, 45000, '00:00:12', '2025-03-21 13:39:17', '0', 0, NULL, NULL, NULL),
(442, 379, 23, '35000/70000', 35000, 70000, '00:00:12', '2025-03-21 13:51:17', '0', 0, NULL, NULL, NULL),
(443, 379, 24, '50000/100000', 50000, 100000, '00:00:12', '2025-03-21 14:03:17', '0', 0, NULL, NULL, NULL),
(444, 380, 1, 'Pause', 0, 0, '00:00:05', '2026-03-22 18:39:55', '0', 0, NULL, NULL, NULL),
(445, 381, 1, 'Pause', 0, 0, '00:00:05', '2026-03-22 19:05:40', '0', 0, NULL, NULL, NULL),
(446, 382, 1, 'Pause', 0, 0, '00:00:05', '2026-03-22 19:05:51', '0', 0, NULL, NULL, NULL),
(447, 383, 1, 'Pause', 0, 0, '00:00:05', '2026-03-22 19:05:59', '0', 0, NULL, NULL, NULL),
(448, 384, 1, 'Pause', 0, 0, '00:00:05', '2026-03-22 19:06:11', '0', 0, NULL, NULL, NULL),
(449, 385, 1, 'Pause', 0, 0, '00:00:05', '2026-03-22 19:06:15', '0', 0, NULL, NULL, NULL),
(450, 386, 1, 'Pause', 0, 0, '00:00:05', '2026-03-22 19:06:17', '0', 0, NULL, NULL, NULL),
(451, 387, 1, 'Pause', 0, 0, '00:00:05', '2026-03-22 19:06:18', '0', 0, NULL, NULL, NULL),
(452, 388, 1, 'Pause', 0, 0, '00:00:05', '2026-03-22 19:06:53', '0', 0, NULL, NULL, NULL),
(453, 389, 1, 'Pause', 0, 0, '00:00:05', '2026-03-22 19:07:10', '0', 0, NULL, NULL, NULL),
(454, 390, 1, 'Pause', 0, 0, '00:00:05', '2026-03-22 19:07:12', '0', 0, NULL, NULL, NULL),
(455, 391, 1, 'Pause', 0, 0, '00:00:05', '2026-03-22 19:07:14', '0', 0, NULL, NULL, NULL),
(456, 392, 1, 'Pause', 0, 0, '00:00:05', '2026-03-22 19:07:33', '0', 0, NULL, NULL, NULL),
(457, 393, 1, 'Pause', 0, 0, '00:00:05', '2026-03-22 19:07:35', '0', 0, NULL, NULL, NULL),
(458, 394, 1, 'Pause', 0, 0, '00:00:05', '2026-03-22 19:07:37', '0', 0, NULL, NULL, NULL),
(459, 395, 1, 'Pause', 0, 0, '00:00:05', '2026-03-22 19:07:38', '0', 0, NULL, NULL, NULL),
(460, 396, 1, 'Pause', 0, 0, '00:00:05', '2026-03-22 19:07:50', '0', 0, NULL, NULL, NULL),
(461, 397, 1, 'Pause', 0, 0, '00:00:05', '2026-03-22 19:07:51', '0', 0, NULL, NULL, NULL),
(462, 398, 1, 'Pause', 0, 0, '00:00:05', '2026-03-22 19:08:29', '0', 0, NULL, NULL, NULL),
(463, 399, 1, 'Pause', 0, 0, '00:00:05', '2026-03-22 19:08:31', '0', 0, NULL, NULL, NULL),
(464, 400, 1, 'Pause', 0, 0, '00:00:05', '2026-03-22 19:08:33', '0', 0, NULL, NULL, NULL),
(465, 401, 1, 'Pause', 0, 0, '00:00:05', '2026-03-22 19:35:27', '0', 0, NULL, NULL, NULL),
(466, 402, 1, 'Pause', 0, 0, '00:00:05', '2026-03-22 19:35:49', '0', 0, NULL, NULL, NULL),
(467, 403, 1, 'Pause', 0, 0, '00:00:05', '2026-03-25 08:41:26', '0', 0, NULL, NULL, NULL),
(468, 404, 1, 'Pause', 0, 0, '00:00:05', '2026-03-25 08:41:28', '0', 0, NULL, NULL, NULL),
(469, 405, 1, 'Pause', 0, 0, '00:00:05', '2026-03-25 08:41:30', '0', 0, NULL, NULL, NULL),
(470, 406, 1, 'Pause', 0, 0, '00:00:05', '2026-03-25 08:41:32', '0', 0, NULL, NULL, NULL),
(472, 407, 1, '100/100', 100, 100, '00:00:20', '2025-03-26 20:50:00', '0', 0, NULL, NULL, NULL),
(473, 407, 2, '100/200', 100, 200, '00:00:20', '2025-03-26 21:10:00', '0', 0, NULL, NULL, NULL),
(474, 407, 3, '200/400', 200, 400, '00:00:20', '2025-03-26 21:30:00', '0', 0, NULL, NULL, NULL),
(475, 407, 4, '300/600', 300, 600, '00:00:20', '2025-03-26 21:50:00', '0', 0, NULL, NULL, NULL),
(476, 407, 5, '400/800', 400, 800, '00:00:20', '2025-03-26 22:10:00', '0', 0, NULL, NULL, NULL),
(477, 407, 6, 'Pause', 0, 0, '00:00:10', '2025-03-26 22:20:00', '0', 0, NULL, NULL, NULL),
(478, 407, 7, '500/1000', 500, 1000, '00:00:18', '2025-03-26 22:38:00', '0', 0, NULL, NULL, NULL),
(479, 407, 8, '600/1200', 600, 1200, '00:00:18', '2025-03-26 22:56:00', '0', 0, NULL, NULL, NULL),
(480, 407, 9, '700/1400', 700, 1400, '00:00:18', '2025-03-26 23:14:00', '0', 0, NULL, NULL, NULL),
(481, 407, 10, '800/1600', 800, 1600, '00:00:18', '2025-03-26 23:32:00', '0', 0, NULL, NULL, NULL),
(482, 407, 11, 'Pause', 0, 0, '00:00:05', '2025-03-26 23:37:00', '0', 0, NULL, NULL, NULL),
(483, 407, 12, '1000/2000', 1000, 2000, '00:00:16', '2025-03-26 23:53:00', '0', 0, NULL, NULL, NULL),
(484, 407, 13, '1500-3000', 1500, 3000, '00:00:16', '2025-03-27 00:09:00', '0', 0, NULL, NULL, NULL),
(485, 407, 14, '2000-4000', 2000, 4000, '00:00:16', '2025-03-27 00:25:00', '0', 0, NULL, NULL, NULL),
(486, 407, 15, '3000/6000', 3000, 6000, '00:00:16', '2025-03-27 00:41:00', '0', 0, NULL, NULL, NULL),
(487, 407, 16, 'Pause', 0, 0, '00:00:05', '2025-03-27 00:46:00', '0', 0, NULL, NULL, NULL),
(488, 407, 17, '4000/8000', 4000, 8000, '00:00:14', '2025-03-27 01:00:00', '0', 0, NULL, NULL, NULL),
(489, 407, 18, '7000/14000', 7000, 14000, '00:00:14', '2025-03-27 01:14:00', '0', 0, NULL, NULL, NULL),
(490, 407, 19, '10000/20000', 10000, 20000, '00:00:14', '2025-03-27 01:28:00', '0', 0, NULL, NULL, NULL),
(491, 407, 20, '15000/30000', 15000, 30000, '00:00:14', '2025-03-27 01:42:00', '0', 0, NULL, NULL, NULL),
(492, 407, 21, 'Pause', 0, 0, '00:00:05', '2025-03-27 01:47:00', '0', 0, NULL, NULL, NULL),
(493, 407, 22, '22500/45000', 22500, 45000, '00:00:12', '2025-03-27 01:59:00', '0', 0, NULL, NULL, NULL),
(494, 407, 23, '35000/70000', 35000, 70000, '00:00:12', '2025-03-27 02:11:00', '0', 0, NULL, NULL, NULL),
(495, 407, 24, '50000/100000', 50000, 100000, '00:00:12', '2025-03-27 02:23:00', '0', 0, NULL, NULL, NULL),
(496, 408, 1, 'Pause', 0, 0, '00:00:05', '2026-03-27 09:34:09', '0', 0, NULL, NULL, NULL),
(497, 411, 1, 'Pause', 0, 0, '00:00:05', '2026-03-30 08:30:42', '0', 0, NULL, NULL, NULL),
(498, 412, 1, 'Pause', 0, 0, '00:00:05', '2026-03-30 08:31:54', '0', 0, NULL, NULL, NULL),
(499, 413, 1, 'Pause', 0, 0, '00:00:05', '2026-03-30 08:31:56', '0', 0, NULL, NULL, NULL),
(500, 414, 1, 'Pause', 0, 0, '00:00:05', '2026-03-30 08:31:58', '0', 0, NULL, NULL, NULL),
(501, 415, 1, 'Pause', 0, 0, '00:00:05', '2026-03-30 08:32:00', '0', 0, NULL, NULL, NULL),
(502, 416, 1, 'Pause', 0, 0, '00:00:05', '2026-03-30 08:34:13', '0', 0, NULL, NULL, NULL),
(503, 417, 1, 'Pause', 0, 0, '00:00:05', '2026-03-30 08:35:26', '0', 0, NULL, NULL, NULL),
(504, 418, 1, 'Pause', 0, 0, '00:00:05', '2026-03-30 13:17:30', '0', 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `challenge`
--

CREATE TABLE `challenge` (
  `id_challenge` int NOT NULL,
  `titre_challenge` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `chal_com` varchar(128) NOT NULL,
  `chal_deb` date NOT NULL,
  `chal_fin` date NOT NULL,
  `chal_org` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `challenge`
--

INSERT INTO `challenge` (`id_challenge`, `titre_challenge`, `chal_com`, `chal_deb`, `chal_fin`, `chal_org`) VALUES
(1, '2000 - Avril', 'Le Premier', '2025-03-25', '2025-04-30', 265),
(2, '2000 - Mai', 'Ca continue', '2025-05-01', '2025-05-31', 265);

-- --------------------------------------------------------

--
-- Structure de la table `challenge-partie`
--

CREATE TABLE `challenge-partie` (
  `chapar_id` int NOT NULL,
  `chapar_id_chal` int NOT NULL,
  `chapar_id_part` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `challenge-partie`
--

INSERT INTO `challenge-partie` (`chapar_id`, `chapar_id_chal`, `chapar_id_part`) VALUES
(1, 1, 30),
(6, 6, 36);

-- --------------------------------------------------------

--
-- Structure de la table `collections`
--

CREATE TABLE `collections` (
  `id_collection` int NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `commentaire` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `collections`
--

INSERT INTO `collections` (`id_collection`, `nom`, `commentaire`) VALUES
(27, 'Pokemon', 'Collectionneur'),
(31, 'seconde collectection', 'info 2nd col');

-- --------------------------------------------------------

--
-- Structure de la table `collections-individu`
--

CREATE TABLE `collections-individu` (
  `id` int NOT NULL,
  `id_col` int NOT NULL,
  `id-indiv` int DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `co` varchar(255) NOT NULL DEFAULT 'Inconnu'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `collections-individu`
--

INSERT INTO `collections-individu` (`id`, `id_col`, `id-indiv`, `date`, `co`) VALUES
(147, 27, 265, '2023-12-14 09:44:04', 'Inconnu');

-- --------------------------------------------------------

--
-- Structure de la table `competences`
--

CREATE TABLE `competences` (
  `id` int NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `commentaire` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `competences`
--

INSERT INTO `competences` (`id`, `nom`, `commentaire`) VALUES
(1, 'Informatichien', 'Devellopeur (euse) WEB'),
(2, 'Peintre', 'Artiste'),
(3, 'Traducteur', 'Francais - Mandarin'),
(4, 'Multiservices', 'Particuliers'),
(11, 'Equitation', 'Cavalier Pro'),
(12, 'Peintre BTP', NULL),
(13, 'Électricien', NULL),
(14, 'Maçon', NULL),
(15, 'Paysagiste', NULL),
(24, 'Plombier', 'Artisan'),
(25, 'Commercial', NULL),
(26, 'Arts', NULL),
(27, 'test', 'sous test'),
(28, 'Agent artistique', 'Arts plastiques');

-- --------------------------------------------------------

--
-- Structure de la table `competences-individu`
--

CREATE TABLE `competences-individu` (
  `id` int NOT NULL,
  `id-comp` int NOT NULL,
  `id-indiv` int DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `co` varchar(255) NOT NULL DEFAULT 'Inconnu'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `competences-individu`
--

INSERT INTO `competences-individu` (`id`, `id-comp`, `id-indiv`, `date`, `co`) VALUES
(59, 1, 1, '2023-09-24 07:39:21', 'Inconnu'),
(72, 1, 265, '2023-10-04 07:01:56', 'Inconnu'),
(73, 4, 265, '2023-10-11 07:32:49', 'Inconnu'),
(89, 3, 1, '2023-10-18 07:09:26', 'Inconnu'),
(91, 4, 1, '2023-10-18 07:13:17', 'Inconnu'),
(92, 1, 2, '2023-10-19 14:09:59', 'Inconnu'),
(93, 2, 1, '2023-10-23 08:08:20', 'Inconnu'),
(94, 2, 1, '2023-10-23 08:15:38', 'Inconnu'),
(95, 2, 1, '2023-10-23 08:27:07', 'Inconnu'),
(96, 2, 1, '2023-10-23 08:27:13', 'Inconnu'),
(97, 2, 1, '2023-10-23 08:27:22', 'Inconnu'),
(98, 2, 1, '2023-10-23 08:27:39', 'Inconnu'),
(99, 2, 1, '2023-10-23 08:27:50', 'Inconnu'),
(100, 2, 1, '2023-10-23 08:37:48', 'Inconnu'),
(101, 2, 1, '2023-10-23 08:39:38', 'Inconnu'),
(102, 2, 1, '2023-10-23 08:40:33', 'Inconnu'),
(103, 2, 1, '2023-10-23 08:40:55', 'Inconnu'),
(104, 2, 1, '2023-10-23 08:41:44', 'Inconnu'),
(105, 2, 1, '2023-10-23 08:42:45', 'Inconnu'),
(106, 2, 1, '2023-10-23 08:46:38', 'Inconnu'),
(107, 2, 1, '2023-10-23 08:58:56', 'Inconnu'),
(108, 2, 1, '2023-10-23 09:04:11', 'Inconnu'),
(109, 2, 1, '2023-10-23 09:10:03', 'Inconnu'),
(110, 2, 1, '2023-10-23 09:15:52', 'Inconnu'),
(111, 2, 1, '2023-10-23 09:16:43', 'Inconnu'),
(112, 2, 1, '2023-10-23 09:17:08', 'Inconnu'),
(113, 2, 1, '2023-10-23 09:18:24', 'Inconnu'),
(114, 2, 1, '2023-10-23 09:18:29', 'Inconnu'),
(115, 2, 1, '2023-10-23 09:19:16', 'Inconnu'),
(116, 2, 1, '2023-10-23 09:20:35', 'Inconnu'),
(117, 2, 1, '2023-10-23 09:25:32', 'Inconnu'),
(118, 2, 1, '2023-10-23 09:26:00', 'Inconnu'),
(119, 2, 1, '2023-10-23 09:26:31', 'Inconnu'),
(120, 2, 1, '2023-10-23 09:27:30', 'Inconnu'),
(121, 2, 1, '2023-10-23 09:29:07', 'Inconnu'),
(122, 2, 1, '2023-10-23 09:34:07', 'Inconnu'),
(123, 14, 0, '2023-10-23 12:00:14', 'Inconnu'),
(124, 1, 265, '2023-10-23 12:33:21', 'Inconnu'),
(125, 24, 241, '2023-10-23 15:30:55', 'Inconnu'),
(126, 1, 0, '2023-10-24 12:51:31', 'Inconnu'),
(127, 1, 1021, '2023-10-24 14:14:13', 'Inconnu'),
(128, 2, 1021, '2023-10-24 14:16:13', 'Inconnu'),
(129, 3, 1021, '2023-10-24 14:19:36', 'Inconnu'),
(130, 2, 67, '2023-10-26 13:39:36', 'Inconnu'),
(131, 3, 67, '2023-10-26 13:40:16', 'Inconnu'),
(133, 1, 215, '2023-10-27 14:48:36', 'Inconnu'),
(134, 2, 436, '2023-11-22 10:55:21', 'Inconnu'),
(135, 12, 2, '2023-12-02 15:55:20', 'Inconnu'),
(136, 26, 2, '2023-12-02 15:57:16', 'Inconnu'),
(137, 26, 242, '2023-12-02 16:13:21', 'Inconnu'),
(139, 28, 242, '2023-12-02 16:17:50', 'Inconnu');

-- --------------------------------------------------------

--
-- Structure de la table `doctorslog`
--

CREATE TABLE `doctorslog` (
  `id` int NOT NULL,
  `uid` int DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `logout` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `doctorslog`
--

INSERT INTO `doctorslog` (`id`, `uid`, `username`, `userip`, `loginTime`, `logout`, `status`) VALUES
(20, NULL, 'gfdgdf', 0x3a3a3100000000000000000000000000, '2022-11-04 01:02:16', NULL, 0),
(21, 2, 'charudua12@test.com', 0x3a3a3100000000000000000000000000, '2022-11-06 11:59:40', '06-11-2022 05:35:18 PM', 1),
(22, 2, 'charudua12@test.com', 0x3a3a3100000000000000000000000000, '2022-11-06 12:06:37', '06-11-2022 05:36:40 PM', 1),
(23, 2, 'charudua12@test.com', 0x3a3a3100000000000000000000000000, '2022-11-06 12:08:56', '06-11-2022 05:42:53 PM', 1),
(24, 1, 'anujk123@test.com', 0x3a3a3100000000000000000000000000, '2022-11-06 12:23:18', '06-11-2022 05:53:40 PM', 1),
(25, 2, 'charudua12@test.com', 0x3a3a3100000000000000000000000000, '2022-11-06 13:16:53', '06-11-2022 06:47:07 PM', 1),
(26, 1, 'anujk123@test.com', 0x3a3a3100000000000000000000000000, '2022-11-06 13:17:33', '06-11-2022 06:50:28 PM', 1),
(27, NULL, 'wenger.franck@gmail.com', 0x326130343a636563303a313930313a34, '2023-09-20 10:04:32', NULL, 0),
(28, NULL, 'wenger.franck@gmail.com', 0x326130343a636563303a313930313a34, '2023-09-20 10:04:58', NULL, 0),
(29, 4, 'wenger.franck@gmail.com', 0x326130343a636563303a313930313a34, '2023-09-20 10:06:04', '20-09-2023 03:36:43 PM', 1),
(30, NULL, 'anujk123@test.com', 0x326130343a636563303a313930313a34, '2023-09-20 10:07:13', NULL, 0),
(31, 1, 'anujk123@test.com', 0x326130343a636563303a313930313a34, '2023-09-20 10:07:41', '20-09-2023 03:38:14 PM', 1),
(32, 1, 'anujk123@test.com', 0x326130343a636563303a313930313a34, '2023-09-20 10:16:06', NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `events`
--

CREATE TABLE `events` (
  `id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `events`
--

INSERT INTO `events` (`id`, `title`, `description`, `start_date`, `end_date`, `created_at`) VALUES
(1, 'Celine', 'Plaisance,\r\nBuyin 10,\r\n1 recave,\r\nRack 12', '2025-03-14 20:00:00', '2025-03-14 23:59:00', '2025-03-14 12:30:14'),
(9, 'Laetitia', 'Cugnaux,\r\nBuyin 10€,\r\n1 Recave,\r\nRack 12€', '2025-03-15 20:00:00', '2025-03-16 01:00:00', '2025-03-15 10:52:14'),
(11, 'Franck', 'Plaisance,\r\nCg 0.5/1,\r\nMini 50', '2025-03-14 22:30:00', '2025-03-14 23:59:00', '2025-03-15 12:28:56');

-- --------------------------------------------------------

--
-- Structure de la table `eventsgps`
--

CREATE TABLE `eventsgps` (
  `id` int NOT NULL,
  `name` char(60) NOT NULL DEFAULT 'Poker',
  `description` char(255) NOT NULL,
  `icon` varchar(255) NOT NULL DEFAULT 'poker',
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `t1` varchar(64) NOT NULL,
  `t2` varchar(255) NOT NULL,
  `lien` varchar(255) NOT NULL DEFAULT '<a href="/panel/voir-partie.php?uid=',
  `lien-id` varchar(64) NOT NULL,
  `lien-texte` varchar(255) NOT NULL DEFAULT '">',
  `lien-texte-fin` varchar(255) NOT NULL DEFAULT 'Partie N°',
  `icon-size` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `eventsgps`
--

INSERT INTO `eventsgps` (`id`, `name`, `description`, `icon`, `lat`, `lng`, `t1`, `t2`, `lien`, `lien-id`, `lien-texte`, `lien-texte-fin`, `icon-size`) VALUES
(5, '-> Infos Tournoi <-', 'Franck', 'poker', 1.4795739650726318, 43.60832595825195, 'poker', 'url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgG6ynV-vS_mfAfqV9dzAtw1S9FKGS9PuZvQ&usqp=CAU)', '<a href=\"https://poker31.org/panel/voir-activite.php?uid=', '30', '\">', 'Franck N°', 0.33),
(6, '<- Infos Highlander ->', 'Olivier', 'poker', 1.350311040878296, 43.58866882324219, 'poker', 'url(https://gist.plex.tv/wp-content/uploads/2021/06/HIGHLANDER_QUAD_FINAL-1200x675-1-1024x576.jpg)', '<a href=\"/panel/voir-partie.php?uid=', '32', '\">', 'Olivier N°', 1),
(10, '-> Infos Cashgame ->', 'Mehdi', 'poker', 1.3291590213775635, 43.61700439453125, 'poker', 'url(https://scmedia.itsfogo.com/$-$/f02834dbb45142bfa725c72839fd0aff.jpg)', '<a href=\"/panel/voir-partie.php?uid=', '36', '\">', 'Mehdi N°', 1),
(12, 'frw', '', 'poker', 1.4795739650726318, 43.60832595825195, '', '', '<a href=\"/panel/voir-partie.php?uid=', '', '\">', 'Partie N°', 0),
(13, 'koom', '', 'poker', 1.3080600500106812, 43.568233489990234, '', '', '<a href=\"/panel/voir-partie.php?uid=', '', '\">', 'Partie N°', 0),
(15, 'manu f', '', 'poker', 1.4545539617538452, 43.63530349731445, '', '', '<a href=\"/panel/voir-partie.php?uid=', '', '\">', 'Partie N°', 0),
(16, 'didier', '', 'poker', 1.4087239503860474, 43.60169219970703, '', '', '<a href=\"/panel/voir-partie.php?uid=', '', '\">', 'Partie N°', 0),
(17, 'jay', '', 'poker', 1.5095880031585693, 43.50111389160156, '', '', '<a href=\"/panel/voir-partie.php?uid=', '', '\">', 'Partie N°', 0),
(18, 'patrice', '', 'poker', 1.215628981590271, 43.46412658691406, '', '', '<a href=\"/panel/voir-partie.php?uid=', '', '\">', 'Partie N°', 0),
(19, 'charles', '', 'poker', 1.3115110397338867, 43.49829864501953, '', '', '<a href=\"/panel/voir-partie.php?uid=', '', '\">', 'Partie N°', 0),
(20, 'sylvain', '', 'poker', 1.4976530075073242, 43.6634407043457, '', '', '<a href=\"/panel/voir-partie.php?uid=', '', '\">', 'Partie N°', 0),
(21, 'anais', '', 'poker', 1.2399770021438599, 43.35557556152344, '', '', '<a href=\"/panel/voir-partie.php?uid=', '', '\">', 'Partie N°', 0),
(22, 'antoine', '', 'poker', 1.320412039756775, 43.32830047607422, '', '', '<a href=\"/panel/voir-partie.php?uid=', '', '\">', 'Partie N°', 0),
(23, 'luc', '', 'poker', 1.3628469705581665, 43.454463958740234, '', '', '<a href=\"/panel/voir-partie.php?uid=', '', '\">', 'Partie N°', 0),
(24, 'lim', '', 'poker', 1.4251869916915894, 43.670074462890625, '', '', '<a href=\"/panel/voir-partie.php?uid=', '', '\">', 'Partie N°', 0),
(25, 'celine', '', 'poker', 1.463623046875, 43.70283126831055, '', '', '<a href=\"/panel/voir-partie.php?uid=', '', '\">', 'Partie N°', 0),
(26, 'dede', '', 'poker', 1.2680779695510864, 43.576576232910156, '', '', '<a href=\"/panel/voir-partie.php?uid=', '', '\">', 'Partie N°', 0),
(27, 'franck', 'test', 'poker', 1.4795739650726318, 43.60832595825195, '', '', '<a href=\"/panel/voir-partie.php?uid=', '', '\">', 'Partie N°', 0),
(28, 'david', '', 'poker', 1.3285479545593262, 43.61262130737305, '', '', '<a href=\"/panel/voir-partie.php?uid=', '', '\">', 'Partie N°', 0),
(29, 'david', '6 place leo lagrange colomiers', 'poker', 1.3285479545593262, 43.61262130737305, '', '', '<a href=\"/panel/voir-partie.php?uid=', '', '\">', 'Partie N°', 0),
(30, 'David Precis', '6 place leo lagrange colomiers', 'poker', 1.328548, 43.61262, '', '', '<a href=\"/panel/voir-partie.php?uid=', '', '\">', 'Partie N°', 0);

-- --------------------------------------------------------

--
-- Structure de la table `loisirs`
--

CREATE TABLE `loisirs` (
  `id` int NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `commentaire` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `loisirs`
--

INSERT INTO `loisirs` (`id`, `nom`, `commentaire`) VALUES
(1, 'Informatichien', 'Devellopeur WEB'),
(27, 'Pokemon', 'Collectionneur'),
(28, 'Galeriste', NULL),
(29, 'Poker', 'Cullinaire'),
(30, 'Repas entre amis', '3 Etoiles');

-- --------------------------------------------------------

--
-- Structure de la table `loisirs-individu`
--

CREATE TABLE `loisirs-individu` (
  `id` int NOT NULL,
  `id-lois` int NOT NULL,
  `id-indiv` int DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `co` varchar(255) NOT NULL DEFAULT 'Inconnu'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `loisirs-individu`
--

INSERT INTO `loisirs-individu` (`id`, `id-lois`, `id-indiv`, `date`, `co`) VALUES
(74, 28, 265, '2023-10-16 13:26:29', 'Inconnu'),
(77, 28, 1, '2023-10-17 17:46:13', 'Inconnu'),
(82, 1, 1, '2023-10-18 10:41:49', 'Inconnu'),
(87, 27, 1, '2023-10-18 10:58:12', 'Inconnu'),
(91, 27, 2, '2023-10-21 06:31:10', 'Inconnu'),
(92, 28, 241, '2023-10-23 15:31:04', 'Inconnu'),
(93, 27, 0, '2023-10-24 12:51:41', 'Inconnu'),
(94, 6, 56, '2023-10-31 16:53:51', 'Inconnu'),
(95, 6, 56, '2023-10-31 16:54:06', 'Inconnu'),
(96, 6, 56, '2023-10-31 16:54:12', 'Inconnu'),
(97, 6, 56, '2023-10-31 16:55:12', 'Inconnu'),
(98, 6, 56, '2023-10-31 17:01:47', 'Inconnu'),
(99, 3, 56, '2023-10-31 17:02:15', 'Inconnu'),
(100, 3, 56, '2023-10-31 17:05:31', 'Inconnu'),
(101, 3, 56, '2023-10-31 17:08:08', 'Inconnu'),
(102, 3, 56, '2023-10-31 17:09:54', 'Inconnu'),
(103, 3, 56, '2023-10-31 17:11:40', 'Inconnu'),
(104, 3, 56, '2023-10-31 17:14:21', 'Inconnu'),
(105, 3, 56, '2023-10-31 17:16:54', 'Inconnu'),
(106, 0, 56, '2023-10-31 17:17:23', 'Inconnu'),
(107, 3, 56, '2023-10-31 17:17:29', 'Inconnu'),
(108, 3, 56, '2023-10-31 17:20:08', 'Inconnu'),
(109, 3, 56, '2023-10-31 17:20:23', 'Inconnu'),
(110, 3, 56, '2023-10-31 17:20:29', 'Inconnu'),
(111, 3, 56, '2023-10-31 17:20:45', 'Inconnu'),
(112, 3, 56, '2023-10-31 17:21:06', 'Inconnu'),
(113, 3, 56, '2023-10-31 17:21:10', 'Inconnu'),
(114, 3, 56, '2023-10-31 17:21:31', 'Inconnu'),
(115, 3, 56, '2023-10-31 17:21:48', 'Inconnu'),
(116, 3, 56, '2023-10-31 17:22:58', 'Inconnu'),
(117, 3, 56, '2023-10-31 17:23:24', 'Inconnu'),
(118, 3, 56, '2023-10-31 17:24:27', 'Inconnu'),
(119, 3, 56, '2023-10-31 17:25:41', 'Inconnu'),
(120, 3, 56, '2023-10-31 17:27:33', 'Inconnu'),
(121, 3, 56, '2023-10-31 17:30:05', 'Inconnu'),
(122, 3, 56, '2023-10-31 17:30:58', 'Inconnu'),
(123, 3, 56, '2023-10-31 17:31:43', 'Inconnu'),
(124, 3, 56, '2023-10-31 17:32:01', 'Inconnu'),
(125, 3, 56, '2023-10-31 17:32:26', 'Inconnu'),
(126, 3, 56, '2023-10-31 17:33:55', 'Inconnu'),
(127, 3, 56, '2023-10-31 17:34:02', 'Inconnu'),
(128, 3, 56, '2023-10-31 17:34:30', 'Inconnu'),
(129, 3, 56, '2023-10-31 17:36:14', 'Inconnu'),
(130, 3, 56, '2023-10-31 17:38:05', 'Inconnu'),
(131, 3, 56, '2023-10-31 17:48:44', 'Inconnu'),
(132, 3, 56, '2023-10-31 17:49:44', 'Inconnu'),
(133, 3, 56, '2023-10-31 17:50:01', 'Inconnu'),
(134, 3, 56, '2023-10-31 17:50:38', 'Inconnu'),
(135, 3, 56, '2023-10-31 17:50:40', 'Inconnu'),
(136, 3, 56, '2023-10-31 17:56:51', 'Inconnu'),
(137, 3, 56, '2023-10-31 17:57:23', 'Inconnu'),
(138, 1026, 32, '2023-10-31 18:18:06', 'Inconnu'),
(139, 1026, 56, '2023-10-31 18:20:11', 'Inconnu'),
(140, 0, 131, '2023-10-31 21:42:51', 'Inconnu'),
(141, 1026, 131, '2023-10-31 21:43:00', 'Inconnu'),
(142, 70, 58, '2023-11-01 05:16:18', 'Inconnu'),
(143, 70, 58, '2023-11-01 05:17:01', 'Inconnu'),
(144, 1, 436, '2023-11-22 10:55:33', 'Inconnu'),
(145, 29, 242, '2023-12-02 16:23:06', 'Inconnu'),
(146, 30, 242, '2023-12-02 16:24:12', 'Inconnu'),
(147, 27, 265, '2023-12-14 09:40:18', 'Inconnu'),
(148, 27, 265, '2023-12-14 09:43:54', 'Inconnu');

-- --------------------------------------------------------

--
-- Structure de la table `membres`
--

CREATE TABLE `membres` (
  `id-membre` int NOT NULL,
  `id_membre` int DEFAULT NULL,
  `pseudo` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `droits` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '1',
  `fname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `lname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `type` varchar(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'M',
  `lastip` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `nbpoints` int DEFAULT '-1',
  `password` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT '1234',
  `CodeV` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `verification` tinyint NOT NULL DEFAULT '0',
  `telephone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0600000000',
  `email` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'test@test.fr',
  `photo` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 't1.jpg',
  `photo-map` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'url(panel/images/',
  `commentaire` int DEFAULT NULL,
  `rue` char(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ville` char(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `country` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'France',
  `longitude` double DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'user-m',
  `ico-siz` float DEFAULT NULL,
  `ico_size` int NOT NULL DEFAULT '100',
  `lien` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '<a href="/panel/voir-membre.php?uid=',
  `lien-id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `lien-texte` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '">',
  `lien-texte-fin` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'Cliquer Pour Infos',
  `def_nomact` varchar(64) NOT NULL DEFAULT 'Chez ',
  `def_str` int DEFAULT '1',
  `def_nbj` int DEFAULT '8',
  `def_buy` int DEFAULT '10',
  `def_rak` int DEFAULT '0',
  `def_bou` int DEFAULT '0',
  `def_rec` int DEFAULT '1',
  `def_jet` int DEFAULT '30000',
  `def_bon` int DEFAULT '0',
  `def_add` int DEFAULT '0',
  `def_ant` int DEFAULT '0',
  `def_rdv` varchar(64) DEFAULT NULL,
  `def_sta` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `def_com` varchar(128) DEFAULT NULL,
  `association_date` date DEFAULT '1970-01-01',
  `posting_date` date DEFAULT '1970-01-01',
  `naissance_date` date DEFAULT NULL,
  `notif_zero` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `membres`
--

INSERT INTO `membres` (`id-membre`, `id_membre`, `pseudo`, `droits`, `fname`, `lname`, `type`, `lastip`, `nbpoints`, `password`, `CodeV`, `verification`, `telephone`, `email`, `photo`, `photo-map`, `commentaire`, `rue`, `ville`, `country`, `longitude`, `latitude`, `icon`, `ico-siz`, `ico_size`, `lien`, `lien-id`, `lien-texte`, `lien-texte-fin`, `def_nomact`, `def_str`, `def_nbj`, `def_buy`, `def_rak`, `def_bou`, `def_rec`, `def_jet`, `def_bon`, `def_add`, `def_ant`, `def_rdv`, `def_sta`, `def_com`, `association_date`, `posting_date`, `naissance_date`, `notif_zero`) VALUES
(1, 0, 'Pseudo Anonyme', '1', 'Nom Anonyme', 'Prénom Anonyme', 'M', NULL, 0, '0000', '', 0, '0612345678', 'anonymous@poker31.org', 't2.jpg', 'url(https://poker31.org/panel/images/t2.jpg)', 0, '8 rue de paris', 'Toulouse', NULL, 43.314, 1.33, '', 0, 100, '<a href=\"/panel/voir-membre.php?id=', '', '\"><img src=\"/panel/images/t2.jpg\" width=\"150\" height=\"150\">	', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-09', '2025-03-08', NULL, NULL),
(2, 2, 'Pikachu', '1', 'Franck', 'Wenger', 'M', NULL, 0, '0000', '', 1, '0786527853', 'wenger.franck@gmail.com', 'images.jpg', 'url(/panel/images/4hzaMlqZPJNvTInjX3Q5og9mOB2Gef.gif)', 0, '8 Rue de la solidarité', 'Toulouse -  Balma', NULL, 43.61, 1.48, 'user-m', 100, 100, '<a href=\"/panel/voir-membre.php?id=', '265', '\"><img src=\"https://poker31.org/panel/images/4hzaMlqZPJNvTInjX3Q5og9mOB2Gef.gif\" width=\"175\" height=\"175\">', 'Cliquer Pour Infos', 'Chez Franck', 1, 18, 10, 5, 10, 1, 35000, 5000, 0, 0, '15:45', '16:00', '', '2025-12-31', '2025-01-01', '1973-06-07', NULL),
(3, 0, 'Ahmed', '1', NULL, NULL, '', NULL, 0, '0000', '12345678', 0, '0600000000', 'axa.wenger@gmail.com', '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?id=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 0, 'Anais.S', '1', 'Anais', 'S', 'F', NULL, 0, '0000', '', 0, '0600000001', 'test@test.com', 'IMG_8208.jpeg', 'url(https://poker31.org/panel/images/4hzaMlqZPJNvTInjX3Q5og9mOB2Gef.gif)', 0, '83 Avenue de Lauragais', 'TOULOUSE', NULL, 43.581136, 1.45146, 'user-f', 0, 100, '<a href=\"/panel/voir-membre.php?id=', '', '\">', 'Cliquer Pour Infos', 'Chez ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', NULL, NULL, NULL, NULL),
(5, 0, 'Annie.S', '1', '', '', '', NULL, 130, '0000', '', 1, '0600000000', 'Annie@poker31.org', '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-07', '2025-03-07', NULL, NULL),
(6, 0, 'Eric.L', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 0, 'Gerard', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 0, 'rnfloy', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 0, 'Jean-Michel', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 0, 'Michael', '1', '', '', '', NULL, 0, '0000', '', 0, '', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 0, 'Nicolas.B', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 0, 'Niko', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 0, 'Isabelle.A', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 0, 'Alain', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 0, 'Paul', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 0, 'Badr.E', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 0, 'Catly', '1', 'Cathy ', 'G', '', NULL, 0, '0000', '', 0, '0600000000', '', 'incoming-36165E0F-2651-4844-8809-DD4B07F81857.jpeg', '', 0, '', 'Seysses', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 0, 'Karl-Eddy', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 0, 'Cedric.M', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 0, 'Cris', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 0, 'Damien.N', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 0, 'Daniel', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 0, 'David.G', '1', NULL, NULL, '', NULL, 94, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 0, 'Didier.P', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 0, 'Djamel', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 0, 'Etienne', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 0, 'Fabrice.M', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 0, 'Guillaume.L', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 0, 'Haythem', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, 'highlander.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 0, 'Jeanmicoco', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 0, 'Jerome', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 0, 'Nima', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, 0, 'Olivier.M', '1', 'Olivier', '', '', NULL, 0, '0000', '', 1, '0612345678', 'olivier.m@poker31.org', 'IMG_8214.jpeg', '', 0, '', 'Tournefeuille', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 0, 'Patrick.R', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, 0, 'Pauline', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 0, 'Stephane', '1', NULL, NULL, '', '79.89.151.13', 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(39, 0, 'Stephen', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 0, 'Sylvain', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, 0, 'Sylvia', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, 0, 'Thaya', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, 0, 'TityPunch', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 0, 'Tom', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(45, 0, 'Turvy', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(46, 0, 'Vanessa', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(47, 0, 'Zach', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, 0, 'Nicolas.T', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(49, 0, 'Pierrik', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(50, 0, 'Benjamin', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(51, 0, 'Antoine', '1', 'Antoine ', '', '', NULL, 93, '0000', '', 0, '0617082051', '', 'IMG_8203.jpeg', '', 0, '', 'Lézat sur lèze', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(52, 0, 'Bertrand', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(53, 0, 'Christophe', '1', NULL, NULL, '', NULL, 124, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(54, 0, 'Cedric.Ru', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(55, 0, 'Cristiano', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(56, 0, 'Damien.C', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(57, 0, 'Didier', '1', 'Didier', '', '', NULL, 0, '0000', '', 0, '0600000000', '', 'IMG_8185.jpeg', '', 0, '', 'Toulouse', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(58, 0, 'Emilie', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(59, 0, 'Ismael', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(60, 0, 'Kristi', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(61, 0, 'Nicko', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(62, 0, 'Nicolas.S', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(63, 0, 'Youssef', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(64, 0, 'Vincent', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(65, 0, 'Taki', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(66, 0, 'Eric.T', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(67, 0, 'Adrien', '1', 'Adrien', 'X', '', NULL, 0, '0000', '12345678', 1, '0611111111', 'adrien@poker31.org', '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', 1, 8, 10, 0, 0, 1, 30000, 0, 0, 0, '19h30', '20h00', '', '2025-03-31', '2025-03-01', '2025-03-01', NULL),
(68, 0, 'Eric.E', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(70, 0, 'Yves', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(71, 0, 'Bertrand.G', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(72, 0, 'Yvesno', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(73, 0, 'Jay', '1', 'Jay', '', '', NULL, 0, '0000', '', 0, '0600000000', 'Jay.c@poker31.org', 'IMG_8218.jpeg', '', 0, '', 'Pechabou', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(74, 0, 'Tony', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(75, 0, 'Nathan', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(76, 0, 'Thomas', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(77, 0, 'Florence.G', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(78, 0, 'Lucas', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(79, 0, 'Clement', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(80, 0, 'Jp', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(81, 0, 'Tonton-JC', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(82, 0, 'Arnaud', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(83, 0, 'Antho', '1', 'Antho', '', '', NULL, 0, '0000', '', 0, '0600000000', '', '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(84, 0, 'Mendez', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(85, 0, 'Hassen', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(86, 0, 'Arthur', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(87, 0, 'Alexis', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', 'wenger.franck@gmail.com', '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(88, 0, 'Cyril', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(89, 0, 'William', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(90, 0, 'Cedric', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(91, 0, 'Lassana', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(92, 0, 'Charif', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(93, 0, 'Eddy', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(94, 0, 'Thierry', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(95, 0, 'Nolan', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(96, 0, 'Jibee', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(97, 0, 'Yohan', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(98, 0, 'Fredo', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(99, 0, 'Oulnes', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100, 0, 'drAAgon', '1', NULL, NULL, '', '37.165.186.152', 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(101, 0, 'Liam.B', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(102, 0, 'Medhi', '1', 'Medhi', 'Azelout', '', NULL, 0, '0000', '', 1, '0600000001', 'medhi@poker31.org', 'IMG_8169.jpeg', '', 0, '', 'Colomiers', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(103, 0, 'Bastien.F', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(104, 0, 'Manu.S', '1', 'Manu', '', '', NULL, 0, '0000', '', 0, '0600000000', '', 'IMG_8209.jpeg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(105, 0, 'Test', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(106, 0, 'Koum', '1', '', '', '', NULL, 0, '0000', '', 0, '0600000000', '', 'crepes.jpeg', '', 0, '', 'Plaisance', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(107, 0, 'Sandrine', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(108, 0, 'Marlene', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(109, 0, 'Sandra', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(110, 0, 'Frizou', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(111, 0, 'Philou', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(112, 0, 'Pascal', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(113, 0, 'Faly', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(114, 0, 'Alexandre.P', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(115, 0, 'Alan.O', '1', 'Alan', 'O', '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(116, 0, 'Ken', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(117, 0, 'Said', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(118, 0, 'Nabil', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(119, 0, 'Guy', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(120, 0, 'Lim', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(121, 0, 'Rudy', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(122, 0, 'Joss', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(123, 0, 'Harry', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(124, 0, 'Steffy', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(125, 0, 'Jesus', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(126, 0, 'Ced', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(127, 0, 'Sergio', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(128, 0, 'Sherif', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(129, 0, 'Armand', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(130, 0, 'Guillaume.B', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(132, 0, 'Grizzly', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(133, 0, 'Jonathan', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(134, 0, 'Isendrin', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(135, 0, 'Philippe', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(136, 0, 'Rino', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(137, 0, 'Walid', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(138, 0, 'Veron', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(139, 0, 'Tiken', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(140, 0, 'Fakker', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(141, 0, 'Riri', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(142, 0, 'Josiane', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(143, 0, 'Kayser', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(144, 0, 'David.B', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(145, 0, 'Esther', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(146, 0, 'Lololebeaugosse', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(147, 0, 'Selim', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(148, 0, 'Chanh', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(149, 0, 'Flo-I', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `membres` (`id-membre`, `id_membre`, `pseudo`, `droits`, `fname`, `lname`, `type`, `lastip`, `nbpoints`, `password`, `CodeV`, `verification`, `telephone`, `email`, `photo`, `photo-map`, `commentaire`, `rue`, `ville`, `country`, `longitude`, `latitude`, `icon`, `ico-siz`, `ico_size`, `lien`, `lien-id`, `lien-texte`, `lien-texte-fin`, `def_nomact`, `def_str`, `def_nbj`, `def_buy`, `def_rak`, `def_bou`, `def_rec`, `def_jet`, `def_bon`, `def_add`, `def_ant`, `def_rdv`, `def_sta`, `def_com`, `association_date`, `posting_date`, `naissance_date`, `notif_zero`) VALUES
(150, 0, 'Jean-baptiste', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(151, 0, 'Jimmy', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(152, 0, 'Mooaamiiiiiie', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(153, 0, 'Sandy', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(154, 0, 'Jean-Noel', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(155, 0, 'ShimabuKuro', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(156, 0, 'Robin', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(157, 0, 'Victoria', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(158, 0, 'Vasco', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(159, 0, 'Thierry.D', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(160, 0, 'Pierre', '1', 'Pierre', 'C', '', NULL, 0, '0000', '', 0, '0600000000', '', '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(161, 0, 'Georges.M', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(162, 0, 'Maxime.AS', '1', NULL, NULL, '', NULL, 76, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(163, 0, 'Romin.B', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(164, 0, 'Khalif', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(165, 0, 'Amine', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(166, 0, 'Francis.G', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(167, 0, 'Stephane.S', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(168, 0, 'Oliv', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(169, 0, 'Pierre-Angel', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(170, 0, 'Geoffrey', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(171, 0, 'Jean-claude.V', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(172, 0, 'Marco', '1', '', '', '', NULL, 0, '0000', '', 1, '0600000000', 'marco', 'images.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(173, 0, 'Sofian', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(174, 0, 'Jean-francois.M', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(175, 0, 'Charles.P', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, 'IMG_8196.jpeg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(176, 0, 'Sami', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(177, 0, 'Laura.B', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(178, 0, 'Gabriel', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(179, 0, 'Colombo', '1', NULL, NULL, '', NULL, 118, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(184, 0, 'Tito', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(185, 0, 'Samantha', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(186, 0, 'Anthony', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(187, 0, 'Lulu', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(188, 0, 'Herve.L', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(189, 0, 'Herve.M', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(190, 0, 'Yann.C', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(191, 0, 'Julien.G', '1', 'Julien', '', '', NULL, 0, '0000', '', 0, '0600000000', '', '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(192, 0, 'Oualid.M', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(193, 0, 'Roselyne', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(194, 0, 'Stef.M', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(195, 0, 'Nico', '1', 'Nico', 'Rhum', '', NULL, 0, '0000', '', 0, '0600000000', '', '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(196, 0, 'Jorge.B', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(197, 0, 'Lahamami', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(198, 0, 'Nicklaos', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(199, 0, 'Ingrid.S', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(200, 0, 'Manu.M', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(202, 0, 'Dimitri', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(203, 0, 'Cedric.007', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(204, 0, 'Lucas.G', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(206, 0, 'Bastien.D', '1', NULL, NULL, '', NULL, 74, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(208, 0, 'Joss', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(209, 0, 'Kevin', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(210, 0, 'Jacques ', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(211, 0, 'Mike', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(212, 0, 'Sebastien', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(213, 0, 'Vong', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(214, 0, 'Annie.FM', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(215, 0, 'Carole', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(216, 0, 'Cecile', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(217, 0, 'Eric.B', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(218, 0, 'Fernando', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(219, 0, 'Guylaine', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(220, 0, 'Laure', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(221, 0, 'Ludivine', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(222, 0, 'Marina', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(223, 0, 'Michel', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(224, 0, 'Tiki', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(225, 0, 'Raza', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(226, 0, 'Wiwi', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(227, 0, 'Denis', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(228, 0, 'FabK2', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(229, 0, 'Marc', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(230, 0, 'Moustafa', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(231, 231, 'Victor', '1', 'Victor', '', 'M', NULL, 0, '0000', '', 0, '0600000000', 'test@test.com', '/photos/photo.jpg', '', 0, '275 Route de Seysses', 'Toulouse', NULL, 43.5711857, 1.41434, 'user-m', 1000, 100, '<a href=\"/panel/voir-membre.php?id=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-31', '2025-03-01', NULL, NULL),
(232, 0, 'Eric.A', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(233, 0, 'Florian.A', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(234, 0, 'Mickael.G', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(235, 0, 'Billy', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(236, 0, 'GuiGui', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(237, 0, 'Fabien', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(238, 0, 'Arnaud.fm', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(239, 0, 'Annie.ger', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(240, 0, 'Cecile.fm', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(241, 0, '4LClover', '1', '4L', 'Clover', '', NULL, 0, '0000', '', 0, '0600000005', '4LClover@poker31.org', 'IMG_7632.jpeg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(242, 0, 'David-Offf', '2', 'David', 'Haik', '', NULL, 0, '0000', '', 1, '0684747251', 'davidhaik777@gmail.com', 'IMG_8098.jpeg', '', 0, 'leo lagrange', 'Colomiers', NULL, 43.6121217, 1.32654, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', 1, 24, 20, 5, 5, 3, 20000, 5000, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(243, 0, 'Isa.fm', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(244, 0, 'Bruno', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(245, 0, 'Coralie', '1', NULL, NULL, '', NULL, 103, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(246, 0, 'Pepitto', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(247, 0, 'Alex.Bel', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(248, 248, 'Alex des Bois', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(249, 0, 'GbPok', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(250, 0, 'Annie31', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(251, 0, 'Nono', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(252, 0, 'Richard', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(253, 0, 'Celinette', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(254, 0, 'Bruno.S', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(255, 0, 'Eric.fm', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(256, 0, 'Jean-Michel.fm', '1', NULL, NULL, '', NULL, 0, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(257, 0, 'Romain', '1', '', '', '', NULL, 0, '0000', '', 0, '0600000000', '', '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(258, 0, 'Patrice', '1', NULL, NULL, '', NULL, 137, '0000', '', 0, '0600000000', NULL, 'IMG_8206.jpeg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(259, 0, 'Nino', '1', NULL, NULL, '', NULL, 117, '0000', '', 0, '0600000000', NULL, '/photos/photo.jpg', '', 0, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-activite.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(265, 265, 'Admin', '2', 'admin', 'admin', '', NULL, -1, '7777', '0101001010', 1, '0712345678', 'franck.wenger@wanadoo.fr', 'images.jpg', 'url(https://poker31.org/panel/images/t1.jpg)', 0, '8 Rue de la solidarité', 'Toulouse / Balma', NULL, 43.612, 1.484, 'user', 1.5, 100, '<a href=\"/panel/voir-membre.php?id=', '', '\"><img src=\"/panel/images/t1.jpg\" width=\"175\" height=\"175\" text-align=\"center\">', 'Cliquer Pour Infos', 'Chez ', 1, 16, 10, 5, 5, 1, 30000, 5000, 0, 0, NULL, NULL, NULL, '2025-03-31', '2025-03-01', '2025-03-01', NULL),
(555, NULL, 'bob', '1', NULL, NULL, NULL, NULL, -1, '0000', NULL, 0, '0600000000', 'bob', 't1.jpg', 'url(panel/images/', NULL, NULL, NULL, 'UK', NULL, NULL, 'user', NULL, 100, '<a href=\"/panel/voir-membre.php?uid=', NULL, '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(999, 0, '-', '1', '', '', '', NULL, 0, '0000', '', 0, '', '', 'perso.png', 'url(https://poker31.org/panel/images/perso.png)', 0, '', '', NULL, 0, 0, 'user', 0, 100, '<a href=\"/panel/voir-membre.php?id=', '', '\"><img src=\"/panel/images/t2.jpg\" width=\"150\" height=\"150\">	', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1013, 0, 'Emmy', '0', 'prenom', 'nom', '', NULL, 0, '0000', '', 0, '0786123456', 'test@test.com', 'perso.png', 'url(https://poker31.org/panel/images/', 254, '', 'TOULOUSE', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-membre.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1014, 0, 'Lilou.W', '0', 'li', 'lou', '', NULL, 0, '0000', '', 0, '', '', 'perso.png', 'url(https://poker31.org/panel/images/', 254, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-membre.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1025, 0, 'FranckWana', '1', 'Franck', 'Wanadoo', '', NULL, -1, '0000', '', 1, '0600000000', 'franck.wenger@wanadoo.fr', 'IMG_7906.jpeg', 'url(https://viendez.com/panel/images/', 0, '', 'Toulouse', NULL, 0, 0, 'user', 0, 100, '<a href=\"/panel/voir-membre.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1028, 0, 'Luc', '0', 'Luc', '', '', NULL, 0, '0000', '', 0, '', '', 'IMG_8199.jpeg', 'url(https://poker31.org/panel/images/', 1017, '', 'Muret', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-membre.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1029, 0, 'Croupier Hugo', '0', 'Hugo', '', '', NULL, 0, '0000', '', 0, '', '', 'perso.png', 'url(https://poker31.org/panel/images/', 1018, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-membre.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1030, 0, 'Cauet', '0', 'Cauet', '', '', NULL, 0, '0000', '', 0, '', '', 'IMG_8372.jpeg', 'url(https://poker31.org/panel/images/', 1019, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-membre.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1031, 0, 'Nadjib', '0', 'Nadjib', '', '', NULL, 0, '0000', '', 0, '', '', 'perso.png', 'url(https://poker31.org/panel/images/', 1020, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-membre.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1034, 0, 'Doushan', '0', 'Doushan', '', '', NULL, 0, '0000', '', 0, '', '', 'perso.png', 'url(https://poker31.org/panel/images/', 1023, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-membre.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1035, 0, 'L\'ambulancier', '1', NULL, NULL, '', NULL, -1, '0000', 'cdbdb507e1c91def323d26064fa71f79', 1, '0600000000', 'afallou36924@gmail.com', 't1.jpg', 'url(https://poker31.org/panel/images/', 0, '', '', NULL, 0, 0, 'user', 0, 100, '<a href=\"/panel/voir-membre.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1036, 0, 'Hyppolyte', '0', 'Hyppolyte', '', '', NULL, 0, '0000', '', 0, '', '', 'perso.png', 'url(https://poker31.org/panel/images/', 1025, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-membre.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1037, 0, 'Nassim', '0', 'Nassim', '', '', NULL, 0, '0000', '', 0, '', '', 'perso.png', 'url(https://poker31.org/panel/images/', 1026, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-membre.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1038, 0, 'Kpusch', '0', 'Kpusch', '', '', NULL, 0, '0000', '', 0, '', '', 'perso.png', 'url(https://poker31.org/panel/images/', 1027, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-membre.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1039, 0, 'Bokitige', '0', 'Bokitige', '', '', NULL, 0, '0000', '', 0, '', '', 'perso.png', 'url(https://poker31.org/panel/images/', 1028, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-membre.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1040, 0, 'Alae', '0', 'Alae', '', '', NULL, 0, '0000', '', 0, '', '', 'perso.png', 'url(https://poker31.org/panel/images/', 1029, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-membre.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1041, 0, 'Ethan', '0', 'Ethan', '', '', NULL, 0, '0000', '', 0, '', '', 'perso.png', 'url(https://poker31.org/panel/images/', 1030, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-membre.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1042, 0, 'Fx', '0', 'Fx', '', '', NULL, 0, '0000', '', 0, '', '', 'perso.png', 'url(https://poker31.org/panel/images/', 1031, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-membre.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1043, 0, 'Fouad', '0', 'Fouad', '', '', NULL, 0, '0000', '', 0, '', '', 'perso.png', 'url(https://poker31.org/panel/images/', 1032, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-membre.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1044, 0, 'Enzo', '0', 'Enzo', '', '', NULL, 0, '0000', '', 0, '', '', 'perso.png', 'url(https://poker31.org/panel/images/', 1033, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-membre.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1045, 0, 'Jean-Louis', '0', 'Jl', '', '', NULL, 0, '0000', '', 0, '', '', 'IMG_8372.jpeg', 'url(https://poker31.org/panel/images/', 1034, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-membre.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1046, 0, 'Remi.F', '0', 'Remi', '', '', NULL, 0, '0000', '', 0, '', '', 'hl.jpg', 'url(https://poker31.org/panel/images/', 1035, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-membre.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1047, 0, 'Aris', '0', 'Aris', '', '', NULL, 0, '0000', '', 0, '', '', 'perso.png', 'url(https://poker31.org/panel/images/', 1036, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-membre.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1048, 0, 'Remi', '0', 'Remi', 'de fawzi', '', NULL, 0, '0000', '', 0, '', '', 'perso.png', 'url(https://poker31.org/panel/images/', 1037, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-membre.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1056, 0, 'Wally', '1', 'Wally', NULL, '', NULL, -1, '0000', '', 0, '0600000000', NULL, 't1.jpg', 'url(https://poker31.org/panel/images/', 0, '', '', NULL, 0, 0, 'user', 0, 100, '<a href=\"/panel/voir-membre.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1057, 0, 'Frédéric ', '1', 'Frédéric ', NULL, '', NULL, -1, '0000', '', 0, '0600000000', NULL, 't1.jpg', 'url(https://poker31.org/panel/images/', 0, '', '', NULL, 0, 0, 'user', 0, 100, '<a href=\"/panel/voir-membre.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1058, 0, 'Sosso', '1', 'Said', NULL, '', NULL, -1, '0000', '', 0, '0600000000', NULL, 't1.jpg', 'url(https://poker31.org/panel/images/', 0, '', '', NULL, 0, 0, 'user', 0, 100, '<a href=\"/panel/voir-membre.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1059, 0, 'Richy', '1', 'Richy', NULL, '', NULL, -1, '0000', '', 0, '0600000000', NULL, 't1.jpg', 'url(https://poker31.org/panel/images/', 0, '', '', NULL, 0, 0, 'user', 0, 100, '<a href=\"/panel/voir-membre.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1060, 0, 'Mozes', '1', 'Mozes', NULL, '', NULL, -1, '0000', '', 0, '0600000000', NULL, 't1.jpg', 'url(https://poker31.org/panel/images/', 0, '', '', NULL, 0, 0, 'user', 0, 100, '<a href=\"/panel/voir-membre.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1061, 0, 'Adrien ', '1', 'Adrien ', '', '', NULL, -1, '0000', '', 1, '0600000000', 'Adrien', 't1.jpg', 'url(https://poker31.org/panel/images/', 0, '', '', NULL, 0, 0, 'user', 0, 100, '<a href=\"/panel/voir-membre.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-31', '2025-03-01', '2025-03-01', NULL),
(1062, 0, 'Lolo', '0', 'Laurent', '', '', NULL, 0, '0000', '', 1, '', 'lolo@poker31.org', 'IMG_9084.jpeg', 'url(https://poker31.org/panel/images/', 1046, 'Rue Antoine Ricord', 'Toulouse', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-membre.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1063, 0, 'Flaw', '0', 'Flaw', '', '', NULL, 0, '0000', '', 0, '', '', 'perso.png', 'url(https://poker31.org/panel/images/', 1047, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-membre.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1064, 0, 'Greg', '0', 'Greg', '', '', NULL, 0, '0000', '', 0, '', '', 'perso.png', 'url(https://poker31.org/panel/images/', 1048, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-membre.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1065, 0, 'Majdi', '0', 'Majdi', '', '', NULL, 0, '0000', '', 0, '', '', 'perso.png', 'url(https://poker31.org/panel/images/', 1049, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-membre.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1066, 0, 'Planes', '0', 'Planes', '', '', NULL, 0, '0000', '', 0, '', '', 'perso.png', 'url(https://poker31.org/panel/images/', 1050, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-membre.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1067, 0, 'Matthieu', '0', 'Matthieu', '', '', NULL, 0, '0000', '', 0, '', '', 'perso.png', 'url(https://poker31.org/panel/images/', 1051, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-membre.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1068, 0, 'Tortilla', '0', 'Tortilla', '', '', NULL, 0, '0000', '', 0, '', '', 'perso.png', 'url(https://poker31.org/panel/images/', 1052, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-membre.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1069, 0, 'Adams', '1', 'Adams', NULL, '', NULL, -1, '0000', '', 0, '0600000000', NULL, 't1.jpg', 'url(https://poker31.org/panel/images/', 0, '', '', NULL, 0, 0, 'user', 0, 100, '<a href=\"/panel/voir-membre.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `membres` (`id-membre`, `id_membre`, `pseudo`, `droits`, `fname`, `lname`, `type`, `lastip`, `nbpoints`, `password`, `CodeV`, `verification`, `telephone`, `email`, `photo`, `photo-map`, `commentaire`, `rue`, `ville`, `country`, `longitude`, `latitude`, `icon`, `ico-siz`, `ico_size`, `lien`, `lien-id`, `lien-texte`, `lien-texte-fin`, `def_nomact`, `def_str`, `def_nbj`, `def_buy`, `def_rak`, `def_bou`, `def_rec`, `def_jet`, `def_bon`, `def_add`, `def_ant`, `def_rdv`, `def_sta`, `def_com`, `association_date`, `posting_date`, `naissance_date`, `notif_zero`) VALUES
(1071, 0, 'Wassim', '0', 'Wassim', '', '', NULL, 0, '0000', '', 0, '', '', 'perso.png', 'url(https://poker31.org/panel/images/', 1055, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-membre.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1072, 0, 'Lord', '0', 'Lord', '', '', NULL, 0, '0000', '', 0, '', '', 'perso.png', 'url(https://poker31.org/panel/images/', 1056, '', '', NULL, 0, 0, 'poker', 0, 100, '<a href=\"/panel/voir-membre.php?uid=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1078, 1078, 'Celine', '1', 'Celine', 'X', 'F', NULL, -1, '0000', '0101001010', 0, '0612345678', 'celine1@viendez.com', 'perso.png', 'url(panel/images/', NULL, '21 rue des chênes', 'Plaisance du touch', '', 43.5899114, 1.28736, 'user-f', NULL, 100, '<a href=\"/panel/voir-membre.php?id=', NULL, '\">', 'Cliquer Pour Infos', 'Chez Celine le', 1, 24, 10, 12, 0, 1, 35000, 5000, 0, 0, '19h30', '20h00', 'Poulet coco , pommes de terre maison, gâteaux apéritif, biere, sodas, sucreries et café', '2025-12-31', '2025-03-01', '2025-03-03', NULL),
(1092, 1092, 'Totti', '1', 'Francois', '', 'M', NULL, 0, '0000', '', 0, '0612345678', 'test@test.com', 'perso.png', 'url(https://viendez.com/panel/images/', 1051, '', 'Dremil Lafage', NULL, 43.5919768, 1.57896, 'user-m', 0, 100, '<a href=\"/panel/voir-membre.php?id=', '', '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1093, NULL, 'Laetitia', '1', 'Laetitia', '', 'F', NULL, 0, '0000', '', 1, '0612345678', 'laetitia@viendez.com', 'perso.png', 'url(https://viendez.com/panel/images/', 1052, '27 impasse des glassieres', 'Cugnaux', NULL, 43.557893, 1.36073, 'user-f', 0, 100, '<a href=\"/panel/voir-membre.php?id=', '', '\">', 'Cliquer Pour Infos', 'Chez Laet', 1, 25, 10, 12, 0, 2, 35000, 5000, 0, 0, '19h30', '20h00', '', '2025-03-31', '2025-03-01', NULL, NULL),
(1094, NULL, 'Jordan', '0', 'Jordan', 'j', 'M', NULL, 0, '0000', '', 0, '0612345', 'test@test.com', 'perso.png', 'url(https://viendez.com/panel/images/', 1053, '', 'Gagnac', NULL, 43.7077085, 1.34298, 'user-m', 0, 100, '<a href=\"/panel/voir-membre.php?id=', '', '\">', 'Cliquer Pour Infos', 'Tournoi de Jordan', 2, 20, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '2025-04-06', '2025-03-03', NULL, NULL),
(1097, NULL, 'brice', '1', 'b', NULL, 'M', NULL, -1, '0000', NULL, 0, '0600000000', 'test@test.fr', 't1.jpg', 'url(panel/images/', NULL, NULL, NULL, NULL, NULL, NULL, 'user-m', NULL, 100, '<a href=\"/panel/voir-membre.php?uid=', NULL, '\">', 'Cliquer Pour Infos', 'Chez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1970-01-01', '1970-01-01', NULL, NULL),
(1098, NULL, 'Afa', '1', 'Afa', NULL, 'M', NULL, -1, '0000', NULL, 0, '0600000000', 'test@test.fr', 't1.jpg', 'url(panel/images/', NULL, NULL, NULL, 'France', NULL, NULL, 'user-m', NULL, 100, '<a href=\"/panel/voir-membre.php?uid=', NULL, '\">', 'Cliquer Pour Infos', 'Chez ', 1, 8, 10, 0, 0, 1, 30000, 0, 0, 0, NULL, NULL, NULL, '1970-01-01', '1970-01-01', NULL, NULL),
(1099, NULL, 'Yanis', '1', 'Yanis', NULL, 'M', NULL, -1, '0000', NULL, 0, '0600000000', 'test@test.fr', 't1.jpg', 'url(panel/images/', NULL, NULL, NULL, 'France', NULL, NULL, 'user-m', NULL, 100, '<a href=\"/panel/voir-membre.php?uid=', NULL, '\">', 'Cliquer Pour Infos', 'Chez ', 1, 8, 10, 0, 0, 1, 30000, 0, 0, 0, NULL, NULL, NULL, '1970-01-01', '1970-01-01', NULL, NULL),
(1100, NULL, 'Elias', '1', 'Elias', NULL, 'M', NULL, -1, '0000', NULL, 0, '0600000000', 'test@test.fr', 't1.jpg', 'url(panel/images/', NULL, NULL, NULL, 'France', NULL, NULL, 'user-m', NULL, 100, '<a href=\"/panel/voir-membre.php?uid=', NULL, '\">', 'Cliquer Pour Infos', 'Chez ', 1, 8, 10, 0, 0, 1, 30000, 0, 0, 0, NULL, NULL, NULL, '1970-01-01', '1970-01-01', NULL, NULL),
(1101, NULL, 'Jeremy', '1', 'Jeremy', NULL, 'M', NULL, -1, '0000', NULL, 0, '0600000000', 'test@test.fr', 't1.jpg', 'url(panel/images/', NULL, NULL, NULL, 'France', NULL, NULL, 'user-m', NULL, 100, '<a href=\"/panel/voir-membre.php?uid=', NULL, '\">', 'Cliquer Pour Infos', 'Chez ', 1, 8, 10, 0, 0, 1, 30000, 0, 0, 0, NULL, NULL, NULL, '1970-01-01', '1970-01-01', NULL, NULL),
(1102, NULL, 'Manni', '1', 'Manni', NULL, 'M', NULL, -1, '0000', NULL, 0, '0600000000', 'test@test.fr', 't1.jpg', 'url(panel/images/', NULL, NULL, NULL, 'France', NULL, NULL, 'user-m', NULL, 100, '<a href=\"/panel/voir-membre.php?uid=', NULL, '\">', 'Cliquer Pour Infos', 'Chez ', 1, 8, 10, 0, 0, 1, 30000, 0, 0, 0, NULL, NULL, NULL, '1970-01-01', '1970-01-01', NULL, NULL),
(1103, NULL, 'Richard.A', '1', 'Richard.A', NULL, 'M', NULL, -1, '0000', NULL, 0, '0600000000', 'test@test.fr', 't1.jpg', 'url(panel/images/', NULL, NULL, NULL, 'France', NULL, NULL, 'user-m', NULL, 100, '<a href=\"/panel/voir-membre.php?uid=', NULL, '\">', 'Cliquer Pour Infos', 'Chez ', 1, 8, 10, 0, 0, 1, 30000, 0, 0, 0, NULL, NULL, NULL, '1970-01-01', '1970-01-01', NULL, NULL),
(1104, NULL, 'Delphine', '1', 'Delphine', NULL, 'M', NULL, -1, '0000', NULL, 0, '0600000000', 'test@test.fr', 't1.jpg', 'url(panel/images/', NULL, NULL, NULL, 'France', NULL, NULL, 'user-m', NULL, 100, '<a href=\"/panel/voir-membre.php?uid=', NULL, '\">', 'Cliquer Pour Infos', 'Chez ', 1, 8, 10, 0, 0, 1, 30000, 0, 0, 0, NULL, NULL, NULL, '1970-01-01', '1970-01-01', NULL, NULL),
(1106, NULL, 'Ben', '1', 'Ben', NULL, 'M', NULL, -1, '0000', NULL, 0, '0600000000', 'test@test.fr', 't1.jpg', 'url(panel/images/', NULL, NULL, NULL, 'France', NULL, NULL, 'user-m', NULL, 100, '<a href=\"/panel/voir-membre.php?uid=', NULL, '\">', 'Cliquer Pour Infos', 'Chez ', 1, 8, 10, 0, 0, 1, 30000, 0, 0, 0, NULL, NULL, NULL, '1970-01-01', '1970-01-01', NULL, NULL),
(1107, NULL, 'Aurore', '1', 'Aurore', NULL, 'M', NULL, -1, '0000', NULL, 0, '0600000000', 'test@test.fr', 't1.jpg', 'url(panel/images/', NULL, NULL, NULL, 'France', NULL, NULL, 'user-m', NULL, 100, '<a href=\"/panel/voir-membre.php?uid=', NULL, '\">', 'Cliquer Pour Infos', 'Chez ', 1, 8, 10, 0, 0, 1, 30000, 0, 0, 0, NULL, NULL, NULL, '1970-01-01', '1970-01-01', NULL, NULL),
(1108, NULL, 'Franck.Aurore', '1', 'Franck.Aurore', NULL, 'M', NULL, -1, '1234', NULL, 0, '0600000000', 'test@test.fr', 't1.jpg', 'url(panel/images/', NULL, NULL, NULL, 'France', NULL, NULL, 'user-m', NULL, 100, '<a href=\"/panel/voir-membre.php?uid=', NULL, '\">', 'Cliquer Pour Infos', 'Chez ', 1, 8, 10, 0, 0, 1, 30000, 0, 0, 0, NULL, NULL, NULL, '1970-01-01', '1970-01-01', NULL, NULL),
(1109, NULL, 'Tom.Tom', '1', 'Tom.Tom', NULL, 'M', NULL, -1, '1234', NULL, 0, '0600000000', 'test@test.fr', 't1.jpg', 'url(panel/images/', NULL, NULL, NULL, 'France', NULL, NULL, 'user-m', NULL, 100, '<a href=\"/panel/voir-membre.php?uid=', NULL, '\">', 'Cliquer Pour Infos', 'Chez ', 1, 8, 10, 0, 0, 1, 30000, 0, 0, 0, NULL, NULL, NULL, '1970-01-01', '1970-01-01', NULL, NULL),
(1110, NULL, 'Soso', '1', 'Soso', NULL, 'M', NULL, -1, '1234', NULL, 0, '0600000000', 'test@test.fr', 't1.jpg', 'url(panel/images/', NULL, NULL, NULL, 'France', NULL, NULL, 'user-m', NULL, 100, '<a href=\"/panel/voir-membre.php?uid=', NULL, '\">', 'Cliquer Pour Infos', 'Chez ', 1, 8, 10, 0, 0, 1, 30000, 0, 0, 0, NULL, NULL, NULL, '1970-01-01', '1970-01-01', NULL, NULL),
(1111, NULL, 'Yaya', '1', 'Yaya', NULL, 'M', NULL, -1, '1234', NULL, 0, '0600000000', 'test@test.fr', 't1.jpg', 'url(panel/images/', NULL, NULL, NULL, 'France', NULL, NULL, 'user-m', NULL, 100, '<a href=\"/panel/voir-membre.php?uid=', NULL, '\">', 'Cliquer Pour Infos', 'Chez ', 1, 8, 10, 0, 0, 1, 30000, 0, 0, 0, NULL, NULL, NULL, '1970-01-01', '1970-01-01', NULL, NULL),
(1112, NULL, 'Yaya', '1', 'Yaya', NULL, 'M', NULL, -1, '1234', NULL, 0, '0600000000', 'test@test.fr', 't1.jpg', 'url(panel/images/', NULL, NULL, NULL, 'France', NULL, NULL, 'user-m', NULL, 100, '<a href=\"/panel/voir-membre.php?uid=', NULL, '\">', 'Cliquer Pour Infos', 'Chez ', 1, 8, 10, 0, 0, 1, 30000, 0, 0, 0, NULL, NULL, NULL, '1970-01-01', '1970-01-01', NULL, NULL),
(1113, NULL, 'Maxime.2000', '1', 'Maxime', NULL, 'M', NULL, -1, '1234', NULL, 0, '0600000000', 'test@test.fr', 't1.jpg', 'url(panel/images/', NULL, NULL, NULL, 'France', NULL, NULL, 'user-m', NULL, 100, '<a href=\"/panel/voir-membre.php?uid=', NULL, '\">', 'Cliquer Pour Infos', 'Chez ', 1, 8, 10, 0, 0, 1, 30000, 0, 0, 0, NULL, NULL, NULL, '1970-01-01', '1970-01-01', NULL, NULL),
(1114, NULL, 'Maxime', '1', 'Maxime', NULL, 'M', NULL, -1, '1234', NULL, 0, '0600000000', 'test@test.fr', 't1.jpg', 'url(panel/images/', NULL, NULL, NULL, 'France', NULL, NULL, 'user-m', NULL, 100, '<a href=\"/panel/voir-membre.php?uid=', NULL, '\">', 'Cliquer Pour Infos', 'Chez ', 1, 8, 10, 0, 0, 1, 30000, 0, 0, 0, NULL, NULL, NULL, '1970-01-01', '1970-01-01', NULL, NULL),
(1115, NULL, 'El Drakol', '1', 'El Drakol', NULL, 'M', NULL, -1, '1234', NULL, 0, '0600000000', 'test@test.fr', 't1.jpg', 'url(panel/images/', NULL, NULL, NULL, 'France', NULL, NULL, 'user-m', NULL, 100, '<a href=\"/panel/voir-membre.php?uid=', NULL, '\">', 'Cliquer Pour Infos', 'Chez ', 1, 8, 10, 0, 0, 1, 30000, 0, 0, 0, NULL, NULL, NULL, '1970-01-01', '1970-01-01', NULL, NULL),
(1116, NULL, 'El Drakol', '1', 'El Drakol', NULL, 'M', NULL, -1, '1234', NULL, 0, '0600000000', 'test@test.fr', 't1.jpg', 'url(panel/images/', NULL, NULL, NULL, 'France', NULL, NULL, 'user-m', NULL, 100, '<a href=\"/panel/voir-membre.php?uid=', NULL, '\">', 'Cliquer Pour Infos', 'Chez ', 1, 8, 10, 0, 0, 1, 30000, 0, 0, 0, NULL, NULL, NULL, '1970-01-01', '1970-01-01', NULL, NULL),
(1117, NULL, 'Mathis', '1', 'Mathis', NULL, 'M', NULL, -1, '1234', NULL, 0, '0600000000', 'test@test.fr', 't1.jpg', 'url(panel/images/', NULL, NULL, NULL, 'France', NULL, NULL, 'user-m', NULL, 100, '<a href=\"/panel/voir-membre.php?uid=', NULL, '\">', 'Cliquer Pour Infos', 'Chez ', 1, 8, 10, 0, 0, 1, 30000, 0, 0, 0, NULL, NULL, NULL, '1970-01-01', '1970-01-01', NULL, NULL),
(1118, NULL, 'Ari 1', '1', 'Ari 1', NULL, 'M', NULL, -1, '1234', NULL, 0, '0600000000', 'test@test.fr', 't1.jpg', 'url(panel/images/', NULL, NULL, NULL, 'France', NULL, NULL, 'user-m', NULL, 100, '<a href=\"/panel/voir-membre.php?uid=', NULL, '\">', 'Cliquer Pour Infos', 'Chez ', 1, 8, 10, 0, 0, 1, 30000, 0, 0, 0, NULL, NULL, NULL, '1970-01-01', '1970-01-01', NULL, NULL),
(1119, NULL, 'Ari 2', '1', 'Ari 2', NULL, 'M', NULL, -1, '1234', NULL, 0, '0600000000', 'test@test.fr', 't1.jpg', 'url(panel/images/', NULL, NULL, NULL, 'France', NULL, NULL, 'user-m', NULL, 100, '<a href=\"/panel/voir-membre.php?uid=', NULL, '\">', 'Cliquer Pour Infos', 'Chez ', 1, 8, 10, 0, 0, 1, 30000, 0, 0, 0, NULL, NULL, NULL, '1970-01-01', '1970-01-01', NULL, NULL),
(1120, NULL, 'Novica', '1', 'Novica', NULL, 'M', NULL, -1, '1234', NULL, 0, '0600000000', 'test@test.fr', 't1.jpg', 'url(panel/images/', NULL, NULL, NULL, 'France', NULL, NULL, 'user-m', NULL, 100, '<a href=\"/panel/voir-membre.php?uid=', NULL, '\">', 'Cliquer Pour Infos', 'Chez ', 1, 8, 10, 0, 0, 1, 30000, 0, 0, 0, NULL, NULL, NULL, '1970-01-01', '1970-01-01', NULL, NULL),
(1121, NULL, 'hello', '1', NULL, NULL, 'M', NULL, -1, '1234', NULL, 0, '0600000000', 'hello@viendez.com', 't1.jpg', 'url(panel/images/', NULL, NULL, NULL, 'T', NULL, NULL, 'user-m', NULL, 100, '<a href=\"/panel/voir-membre.php?uid=', NULL, '\">', 'Cliquer Pour Infos', 'Chez ', 1, 8, 10, 0, 0, 1, 30000, 0, 0, 0, NULL, NULL, NULL, '1970-01-01', '1970-01-01', NULL, NULL),
(1122, NULL, 'hello', '1', NULL, NULL, 'M', NULL, -1, '123456', NULL, 0, '0600000000', 'h@h.com', 't1.jpg', 'url(panel/images/', NULL, NULL, NULL, 'T', NULL, NULL, 'user-m', NULL, 100, '<a href=\"/panel/voir-membre.php?uid=', NULL, '\">', 'Cliquer Pour Infos', 'Chez ', 1, 8, 10, 0, 0, 1, 30000, 0, 0, 0, NULL, NULL, NULL, '1970-01-01', '1970-01-01', NULL, NULL),
(1123, NULL, 'The Kurde', '1', 'Tk', NULL, 'M', NULL, -1, '1234', NULL, 0, '0600000000', 'test@test.fr', 't1.jpg', 'url(panel/images/', NULL, NULL, NULL, 'France', NULL, NULL, 'user-m', NULL, 100, '<a href=\"/panel/voir-membre.php?uid=', NULL, '\">', 'Cliquer Pour Infos', 'Chez ', 1, 8, 10, 0, 0, 1, 30000, 0, 0, 0, NULL, NULL, NULL, '1970-01-01', '1970-01-01', NULL, NULL),
(1124, NULL, 'Peaky Blinder', '1', 'Alex.richard', NULL, 'M', NULL, -1, '1234', NULL, 0, '0600000000', 'test@test.fr', 't1.jpg', 'url(panel/images/', NULL, NULL, NULL, 'France', NULL, NULL, 'user-m', NULL, 100, '<a href=\"/panel/voir-membre.php?uid=', NULL, '\">', 'Cliquer Pour Infos', 'Chez ', 1, 8, 10, 0, 0, 1, 30000, 0, 0, 0, NULL, NULL, NULL, '1970-01-01', '1970-01-01', NULL, NULL),
(1125, NULL, 'Seif', '1', 'Seif', NULL, 'M', NULL, -1, '1234', NULL, 0, '0600000000', 'test@test.fr', 't1.jpg', 'url(panel/images/', NULL, NULL, NULL, 'France', NULL, NULL, 'user-m', NULL, 100, '<a href=\"/panel/voir-membre.php?uid=', NULL, '\">', 'Cliquer Pour Infos', 'Chez ', 1, 8, 10, 0, 0, 1, 30000, 0, 0, 0, NULL, NULL, NULL, '1970-01-01', '1970-01-01', NULL, NULL),
(1126, NULL, 'Salim', '1', 'Salim', NULL, 'M', NULL, -1, '1234', NULL, 0, '0600000000', 'test@test.fr', 't1.jpg', 'url(panel/images/', NULL, NULL, NULL, 'France', NULL, NULL, 'user-m', NULL, 100, '<a href=\"/panel/voir-membre.php?uid=', NULL, '\">', 'Cliquer Pour Infos', 'Chez ', 1, 8, 10, 0, 0, 1, 30000, 0, 0, 0, NULL, NULL, NULL, '1970-01-01', '1970-01-01', NULL, NULL),
(1127, NULL, 'Orenn', '1', 'Orenn', NULL, 'M', NULL, -1, '1234', NULL, 0, '0600000000', 'test@test.fr', 't1.jpg', 'url(panel/images/', NULL, NULL, NULL, 'France', NULL, NULL, 'user-m', NULL, 100, '<a href=\"/panel/voir-membre.php?uid=', NULL, '\">', 'Cliquer Pour Infos', 'Chez ', 1, 8, 10, 0, 0, 1, 30000, 0, 0, 0, NULL, NULL, NULL, '1970-01-01', '1970-01-01', NULL, NULL),
(1128, NULL, 'Alex Fkt', '1', 'Alex Fkt', NULL, 'M', NULL, -1, '1234', NULL, 0, '0600000000', 'test@test.fr', 't1.jpg', 'url(panel/images/', NULL, NULL, NULL, 'France', NULL, NULL, 'user-m', NULL, 100, '<a href=\"/panel/voir-membre.php?uid=', NULL, '\">', 'Cliquer Pour Infos', 'Chez ', 1, 8, 10, 0, 0, 1, 30000, 0, 0, 0, NULL, NULL, NULL, '1970-01-01', '1970-01-01', NULL, NULL),
(1129, NULL, 'Eliott', '1', 'Eliott', NULL, 'M', NULL, -1, '1234', NULL, 0, '0600000000', 'test@test.fr', 't1.jpg', 'url(panel/images/', NULL, NULL, NULL, 'France', NULL, NULL, 'user-m', NULL, 100, '<a href=\"/panel/voir-membre.php?uid=', NULL, '\">', 'Cliquer Pour Infos', 'Chez ', 1, 8, 10, 0, 0, 1, 30000, 0, 0, 0, NULL, NULL, NULL, '1970-01-01', '1970-01-01', NULL, NULL),
(1130, NULL, 'Fabrice S', '1', 'Fabrice S', NULL, 'M', NULL, -1, '1234', NULL, 0, '0600000000', 'test@test.fr', 't1.jpg', 'url(panel/images/', NULL, NULL, NULL, 'France', NULL, NULL, 'user-m', NULL, 100, '<a href=\"/panel/voir-membre.php?uid=', NULL, '\">', 'Cliquer Pour Infos', 'Chez ', 1, 8, 10, 0, 0, 1, 30000, 0, 0, 0, NULL, NULL, NULL, '1970-01-01', '1970-01-01', NULL, NULL),
(1131, NULL, 'Maeda', '1', 'Maeda', NULL, 'M', NULL, -1, '1234', NULL, 0, '0600000000', 'test@test.fr', 't1.jpg', 'url(panel/images/', NULL, NULL, NULL, 'France', NULL, NULL, 'user-m', NULL, 100, '<a href=\"/panel/voir-membre.php?uid=', NULL, '\">', 'Cliquer Pour Infos', 'Chez ', 1, 8, 10, 0, 0, 1, 30000, 0, 0, 0, NULL, NULL, NULL, '1970-01-01', '1970-01-01', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `participation`
--

CREATE TABLE `participation` (
  `id-participation` int NOT NULL,
  `id-membre` int NOT NULL,
  `nom-membre` varchar(64) DEFAULT NULL,
  `id-membre-vainqueur` int NOT NULL DEFAULT '0',
  `nom-membre-vainqueur` varchar(64) DEFAULT NULL,
  `id-activite` int NOT NULL,
  `id-siege` int DEFAULT '1',
  `id-table` int DEFAULT '1',
  `id-challenge` int NOT NULL DEFAULT '0',
  `option` varchar(20) NOT NULL DEFAULT 'Réservation',
  `ordre` int NOT NULL DEFAULT '0',
  `position` int NOT NULL DEFAULT '0',
  `valide` varchar(11) NOT NULL DEFAULT 'Actif',
  `commentaire` varchar(255) DEFAULT 'Aucun',
  `classement` int NOT NULL DEFAULT '1',
  `recave` int NOT NULL DEFAULT '0',
  `addon` int NOT NULL DEFAULT '0',
  `tf` int NOT NULL DEFAULT '0',
  `points` int NOT NULL DEFAULT '0',
  `bounty` int NOT NULL DEFAULT '0',
  `rake` int DEFAULT '0',
  `gain` int NOT NULL DEFAULT '0',
  `challenger` tinyint(1) NOT NULL DEFAULT '0',
  `caisse_chal` int NOT NULL DEFAULT '0',
  `cout_in` int DEFAULT NULL,
  `rake_0` tinyint(1) NOT NULL DEFAULT '0',
  `rake_5` tinyint(1) NOT NULL DEFAULT '0',
  `rake_10` tinyint(1) NOT NULL DEFAULT '0',
  `rake_12` tinyint(1) NOT NULL DEFAULT '0',
  `rake_15` tinyint(1) NOT NULL DEFAULT '0',
  `rake_20` tinyint(1) NOT NULL DEFAULT '0',
  `ds` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `cagnotte` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `participation`
--

INSERT INTO `participation` (`id-participation`, `id-membre`, `nom-membre`, `id-membre-vainqueur`, `nom-membre-vainqueur`, `id-activite`, `id-siege`, `id-table`, `id-challenge`, `option`, `ordre`, `position`, `valide`, `commentaire`, `classement`, `recave`, `addon`, `tf`, `points`, `bounty`, `rake`, `gain`, `challenger`, `caisse_chal`, `cout_in`, `rake_0`, `rake_5`, `rake_10`, `rake_12`, `rake_15`, `rake_20`, `ds`, `cagnotte`) VALUES
(1096, 2, 'Pikachu', 0, NULL, 380, 3, 1, 0, 'Réservation', 0, 3, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, '2025-03-26 10:32:45', 0),
(1097, 1078, 'Celine', 0, NULL, 407, 5, 3, 1, 'Inscrit', 1, 22, 'Actif', 'Aucun', 4, 0, 0, 1, 2, 0, 12, 30, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-03-27 08:45:35', NULL),
(1098, 64, 'Vincent', 0, NULL, 407, 2, 3, 1, 'Réservation', 2, 19, 'Actif', 'Aucun', 5, 0, 0, 1, 2, 0, 12, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-03-27 08:41:46', NULL),
(1100, 252, 'Richard', 0, NULL, 407, 1, 1, 1, 'Réservation', 4, 1, 'Actif', 'Aucun', 1, 0, 0, 0, 1, 0, 12, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-03-27 08:34:05', NULL),
(1101, 1057, 'Frédéric ', 0, NULL, 407, 3, 3, 1, 'Réservation', 5, 20, 'Actif', 'Aucun', 1, 1, 0, 0, 1, 0, 12, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-03-26 21:17:40', NULL),
(1102, 160, 'Pierre', 0, NULL, 407, 4, 1, 1, 'Réservation', 6, 4, 'Actif', 'Aucun', 1, 0, 0, 0, 1, 0, 12, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-03-27 08:34:29', NULL),
(1103, 90, 'Cedric', 0, NULL, 407, 6, 3, 1, 'Réservation', 7, 23, 'Actif', 'Aucun', 1, 1, 0, 0, 1, 0, 12, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-03-26 23:10:56', NULL),
(1104, 2, 'Pikachu', 0, NULL, 407, 6, 1, 1, 'Réservation', 8, 6, 'Actif', 'Aucun', 7, 0, 0, 1, 2, 0, 12, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-03-27 08:37:49', NULL),
(1105, 162, 'Maxime.AS', 0, NULL, 407, 8, 3, 0, 'Réservation', 9, 25, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 12, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-03-26 14:27:14', NULL),
(1106, 231, 'Victor', 0, NULL, 407, 1, 3, 1, 'Réservation', 10, 18, 'Actif', 'Aucun', 1, 0, 0, 0, 1, 0, 12, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-03-26 21:07:53', NULL),
(1107, 248, 'Alex', 0, NULL, 407, 7, 2, 1, 'Réservation', 11, 16, 'Actif', 'Aucun', 9, 0, 0, 1, 2, 0, 12, 160, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-03-27 08:46:31', NULL),
(1108, 39, 'Stephen', 0, NULL, 407, 5, 1, 1, 'Réservation', 12, 5, 'Actif', 'Aucun', 1, 1, 0, 0, 1, 0, 12, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-03-27 08:34:53', NULL),
(1109, 127, 'Sergio', 0, NULL, 407, 7, 3, 0, 'Réservation', 13, 24, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 12, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-03-26 14:29:26', NULL),
(1110, 24, 'David.G', 0, NULL, 407, 3, 1, 1, 'Réservation', 14, 3, 'Actif', 'Aucun', 1, 0, 0, 1, 2, 0, 12, 60, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-03-27 08:45:51', NULL),
(1111, 1098, 'Afa', 0, NULL, 407, 4, 2, 1, 'Réservation', 15, 13, 'Actif', 'Aucun', 1, 0, 0, 0, 1, 0, 12, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-03-26 21:08:24', NULL),
(1112, 1101, 'Jeremy', 0, NULL, 407, 6, 2, 1, 'Réservation', 16, 15, 'Actif', 'Aucun', 1, 0, 0, 0, 1, 0, 12, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-03-26 21:09:40', NULL),
(1113, 1102, 'Manni', 0, NULL, 407, 1, 2, 1, 'Réservation', 17, 10, 'Actif', 'Aucun', 1, 0, 0, 0, 1, 0, 12, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-03-26 21:04:41', NULL),
(1114, 1103, 'Richard.A', 0, NULL, 407, 5, 2, 1, 'Réservation', 18, 14, 'Actif', 'Aucun', 1, 1, 0, 0, 1, 0, 12, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-03-26 21:18:33', NULL),
(1115, 1099, 'Yanis', 0, NULL, 407, 8, 2, 0, 'Réservation', 19, 17, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 12, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-03-26 14:35:52', NULL),
(1116, 1104, 'Delphine', 0, NULL, 407, 8, 1, 1, 'Réservation', 20, 8, 'Actif', 'Aucun', 1, 0, 0, 0, 1, 0, 12, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-03-27 08:35:23', NULL),
(1117, 1100, 'Elias', 0, NULL, 407, 2, 1, 1, 'Réservation', 21, 2, 'Actif', 'Aucun', 6, 0, 0, 1, 2, 0, 12, 0, 1, 5, NULL, 0, 0, 0, 0, 0, 0, '2025-03-27 08:40:37', 3),
(1119, 106, 'Koum', 0, NULL, 407, 4, 3, 1, 'Réservation', 23, 21, 'Actif', 'Aucun', 8, 0, 0, 0, 0, 0, 12, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-03-27 08:38:40', NULL),
(1121, 109, 'Sandra', 0, NULL, 407, 9, 1, 1, 'Réservation', 25, 9, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 12, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-03-27 08:36:37', NULL),
(1122, 1106, 'Ben', 0, NULL, 407, 7, 1, 1, 'Réservation', 26, 7, 'Actif', 'Aucun', 1, 2, 0, 0, 1, 0, 12, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-03-27 08:35:11', NULL),
(1123, 1066, 'Planes', 0, NULL, 407, 2, 2, 1, 'Réservation', 27, 11, 'Actif', 'Aucun', 2, 0, 0, 1, 2, 0, 12, 90, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-03-27 08:46:04', NULL),
(1124, 34, 'Olivier.M', 0, NULL, 407, 3, 2, 1, 'Réservation', 28, 12, 'Actif', 'Aucun', 1, 0, 0, 0, 1, 0, 12, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-03-26 21:11:04', NULL),
(1125, 2, 'Pikachu', 0, NULL, 381, 0, 1, 1, 'Réservation', 0, 0, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 12, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-03-26 17:11:57', NULL),
(1126, 2, 'Pikachu', 0, NULL, 382, 0, 1, 1, 'Réservation', 0, 0, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 12, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-03-26 17:11:57', NULL),
(1127, 2, 'Pikachu', 0, NULL, 383, 0, 1, 1, 'Réservation', 0, 0, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 12, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-03-26 17:13:57', NULL),
(1129, 2, 'Pikachu', 0, NULL, 384, 0, 1, 1, 'Réservation', 0, 0, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 12, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-03-26 17:13:57', NULL),
(1130, 2, 'Pikachu', 0, NULL, 385, 0, 1, 1, 'Réservation', 0, 0, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 12, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-03-26 17:13:57', NULL),
(1131, 2, 'Pikachu', 0, NULL, 386, 0, 1, 1, 'Réservation', 0, 0, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 12, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-03-26 17:13:57', NULL),
(1133, 2, 'Pikachu', 0, NULL, 388, 0, 1, 1, 'Réservation', 0, 0, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-03-26 17:15:04', NULL),
(1134, 2, 'Pikachu', 0, NULL, 389, 0, 1, 1, 'Réservation', 0, 0, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-03-26 17:15:59', NULL),
(1135, 2, 'Pikachu', 0, NULL, 390, 0, 1, 1, 'Réservation', 0, 0, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-03-26 17:15:59', NULL),
(1136, 2, 'Pikachu', 0, NULL, 391, 0, 1, 1, 'Réservation', 0, 0, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-03-26 17:16:20', NULL),
(1137, 2, 'Pikachu', 0, NULL, 392, 1, 1, 1, 'Réservation', 0, 1, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 5, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-03-26 17:16:20', NULL),
(1138, 2, 'Pikachu', 0, NULL, 393, 0, 1, 1, 'Réservation', 0, 0, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 5, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-03-26 17:16:49', NULL),
(1139, 2, 'Pikachu', 0, NULL, 394, 0, 1, 1, 'Réservation', 0, 0, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 5, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-03-26 17:16:49', NULL),
(1140, 1078, 'Celine', 0, NULL, 408, 2, 2, 1, 'Valide', 1, 13, 'Actif', 'Aucun', 9, 0, 0, 0, 1, 0, 0, 0, 1, 3, 25, 0, 0, 0, 0, 0, 0, '2025-03-27 09:34:09', 3),
(1141, 2, 'Pikachu', 0, NULL, 408, 4, 2, 1, 'Valide', 2, 15, 'Actif', 'Aucun', 9, 0, 0, 0, 1, 0, 5, 0, 1, 5, 30, 0, 1, 0, 0, 0, 0, '2025-03-27 10:07:13', 3),
(1142, 1107, 'Aurore', 0, NULL, 408, 3, 1, 1, 'Valide', 3, 3, 'Actif', 'Aucun', 4, 0, 0, 0, 0, 0, 12, 0, 0, 0, 32, 0, 0, 0, 0, 0, 0, '2025-03-27 10:09:08', 0),
(1143, 1092, 'Totti', 0, NULL, 408, 3, 2, 1, 'Valide', 4, 14, 'Actif', 'Aucun', 9, 1, 0, 0, 1, 0, 5, 0, 1, 5, 30, 0, 0, 0, 0, 0, 0, '2025-03-27 10:09:25', 6),
(1144, 1092, 'Totti', 0, NULL, 380, 1, 1, 1, 'Réservation', 2, 1, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, '2025-03-27 10:30:55', 0),
(1145, 1103, 'Richard.A', 0, NULL, 392, 2, 1, 1, 'Réservation', 2, 2, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 5, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-03-27 10:34:27', NULL),
(1155, 24, 'David.G', 0, NULL, 408, 8, 1, 1, 'Valide', 6, 8, 'Actif', 'Aucun', 9, 0, 0, 0, 1, 0, 12, 0, 1, 5, 37, 0, 0, 0, 1, 0, 0, '2025-03-27 16:20:02', 3),
(1156, 203, 'Cedric.007', 0, NULL, 408, 10, 1, 1, 'Valide', 7, 10, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 12, 0, 0, 0, 32, 0, 0, 0, 0, 0, 0, '2025-03-27 16:31:26', 0),
(1157, 129, 'Armand', 0, NULL, 408, 9, 1, 1, 'Valide', 8, 9, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 12, 0, 0, 0, 32, 0, 0, 0, 0, 0, 0, '2025-03-28 04:33:08', 0),
(1159, 252, 'Richard', 0, NULL, 408, 2, 1, 1, 'Valide', 10, 2, 'Actif', 'Aucun', 9, 1, 0, 0, 1, 0, 5, 0, 1, 10, 30, 0, 1, 0, 0, 0, 0, '2025-03-28 04:33:43', 6),
(1160, 1108, 'Franck.Aurore', 0, NULL, 408, 6, 1, 1, 'Valide', 11, 6, 'Actif', 'Aucun', 3, 1, 0, 0, 0, 0, 12, 0, 0, 0, 32, 0, 0, 0, 0, 0, 0, '2025-03-28 04:34:55', 0),
(1161, 44, 'Tom', 0, NULL, 408, 6, 2, 1, 'Valide', 12, 17, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 12, 0, 0, 0, 32, 0, 0, 0, 0, 0, 0, '2025-03-28 04:35:53', 0),
(1162, 1109, 'Tom.Tom', 0, NULL, 408, 5, 1, 1, 'Valide', 13, 5, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 12, 0, 0, 0, 32, 0, 0, 0, 0, 0, 0, '2025-03-28 04:36:34', 0),
(1166, 27, 'Etienne', 0, NULL, 408, 11, 1, 1, 'Valide', 14, 11, 'Actif', 'Aucun', 2, 0, 0, 0, 0, 0, 12, 0, 0, 0, 32, 0, 0, 0, 0, 0, 0, '2025-03-28 07:42:48', 0),
(1170, 1100, 'Elias', 0, NULL, 408, 1, 2, 1, 'Valide', 0, 12, 'Actif', 'Aucun', 2, 0, 0, 1, 2, 0, 5, 0, 1, 5, 30, 0, 1, 0, 0, 0, 0, '2025-03-28 09:54:49', 3),
(1171, 1110, 'Soso', 0, NULL, 408, 7, 1, 1, 'Valide', 0, 7, 'Actif', 'Aucun', 9, 2, 0, 0, 0, 0, 12, 0, 0, 0, 32, 0, 0, 0, 0, 0, 0, '2025-03-28 09:55:23', 0),
(1176, 1112, 'Yaya', 0, NULL, 408, 8, 1, 0, 'Réservation', 0, 8, 'Actif', 'Aucun', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, '2025-03-28 17:30:34', 0),
(1177, 160, 'Pierre', 0, NULL, 408, 6, 1, 1, 'Réservation', 0, 6, 'Actif', 'Aucun', 9, 1, 0, 0, 1, 0, 0, 0, 1, 10, 25, 0, 1, 0, 0, 0, 0, '2025-03-28 17:31:12', 6),
(1178, 1113, 'Maxime', 0, NULL, 408, 5, 2, 0, 'Réservation', 0, 16, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, '2025-03-28 17:31:54', 0),
(1179, 1099, 'Yanis', 0, NULL, 408, 10, 1, 0, 'Réservation', 0, 10, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, '2025-03-28 17:32:04', 0),
(1180, 211, 'Mike', 0, NULL, 408, 2, 2, 0, 'Réservation', 0, 13, 'Actif', 'Aucun', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, '2025-03-28 17:32:21', 0),
(1181, 202, 'Dimitri', 0, NULL, 408, 9, 1, 0, 'Réservation', 0, 9, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, '2025-03-28 17:32:37', 0),
(1182, 221, 'Ludivine', 0, NULL, 408, 3, 2, 1, 'Réservation', 0, 14, 'Actif', 'Aucun', 9, 0, 0, 0, 1, 0, 5, 0, 1, 5, 30, 0, 1, 0, 0, 0, 0, '2025-03-28 17:32:50', 3),
(1183, 242, 'David-Offf', 0, NULL, 408, 2, 1, 1, 'Réservation', 0, 2, 'Actif', 'Aucun', 9, 1, 0, 0, 1, 0, 5, 0, 1, 10, 30, 0, 1, 0, 0, 0, 0, '2025-03-28 17:33:01', 6),
(1185, 1118, 'Ari 1', 0, NULL, 408, 3, 1, 0, 'Réservation', 0, 3, 'Actif', 'Aucun', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, '2025-03-28 17:34:58', 0),
(1186, 1119, 'Ari 2', 0, NULL, 408, 5, 1, 0, 'Réservation', 0, 5, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, '2025-03-28 17:35:07', 0),
(1187, 1117, 'Mathis', 0, NULL, 408, 11, 1, 0, 'Réservation', 0, 11, 'Actif', 'Aucun', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, '2025-03-28 17:35:26', 0),
(1188, 1120, 'Novica', 0, NULL, 408, 7, 1, 0, 'Réservation', 0, 7, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, '2025-03-28 17:36:01', 0),
(1189, 1102, 'Manni', 0, NULL, 408, 1, 2, 0, 'Réservation', 0, 12, 'Actif', 'Aucun', 9, 1, 0, 0, 1, 0, 0, 0, 1, 10, 25, 0, 1, 0, 0, 0, 0, '2025-03-28 17:43:13', 6),
(1190, 136, 'Rino', 0, NULL, 408, 4, 1, 0, 'Réservation', 0, 4, 'Actif', 'Aucun', 1, 0, 0, 1, 3, 0, 0, 0, 1, 5, 25, 0, 1, 0, 0, 0, 0, '2025-03-28 20:49:42', 3),
(1191, 1101, 'Jeremy', 0, NULL, 408, 4, 2, 0, 'Réservation', 0, 15, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, '2025-03-28 20:54:47', 0),
(1192, 1093, 'Laetitia', 0, NULL, 411, 0, 1, 0, 'Inscrit', 1, 0, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-03-30 08:30:42', NULL),
(1193, 1093, 'Laetitia', 0, NULL, 412, 0, 1, 0, 'Inscrit', 1, 0, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-03-30 08:31:54', NULL),
(1194, 1093, 'Laetitia', 0, NULL, 413, 0, 1, 0, 'Inscrit', 1, 0, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-03-30 08:31:56', NULL),
(1195, 1093, 'Laetitia', 0, NULL, 414, 0, 1, 0, 'Inscrit', 1, 0, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-03-30 08:31:58', NULL),
(1196, 1093, 'Laetitia', 0, NULL, 415, 0, 1, 0, 'Inscrit', 1, 0, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-03-30 08:32:00', NULL),
(1197, 1093, 'Laetitia', 0, NULL, 416, 1, 1, 0, 'Inscrit', 1, 0, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-03-30 08:34:13', NULL),
(1198, 1078, 'Celine', 0, NULL, 417, 0, 1, 1, 'Inscrit', 1, 0, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 12, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-03-30 08:35:26', NULL),
(1199, 2, 'Pikachu', 0, NULL, 411, 0, 1, 0, 'Réservation', 0, 0, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-03-30 13:16:11', NULL),
(1208, 1078, 'Celine', 0, NULL, 403, 0, 1, 0, 'Réservation', 0, 0, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 12, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, '2025-03-30 19:26:41', NULL),
(1209, 1078, 'Celine', 0, NULL, 404, 0, 1, 0, 'Réservation', 0, 0, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 12, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, '2025-03-30 19:27:21', NULL),
(1210, 2, 'Pikachu', 0, NULL, 395, 0, 1, 0, 'Réservation', 0, 0, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 5, 0, 0, 0, 15, 0, 0, 0, 0, 0, 0, '2025-03-30 19:28:04', NULL),
(1211, 1078, 'Celine', 0, NULL, 405, 0, 1, 0, 'Réservation', 0, 0, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 12, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, '2025-03-30 19:28:37', NULL),
(1212, 2, 'Pikachu', 0, NULL, 396, 0, 1, 0, 'Réservation', 0, 0, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 5, 0, 0, 0, 15, 0, 0, 0, 0, 0, 0, '2025-03-30 19:29:36', NULL),
(1213, 1078, 'Celine', 0, NULL, 387, 0, 1, 0, 'Réservation', 0, 0, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 12, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, '2025-03-30 19:30:09', NULL),
(1214, 1078, 'Celine', 0, NULL, 402, 0, 1, 0, 'Réservation', 0, 0, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 12, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, '2025-03-30 19:30:36', NULL),
(1215, 2, 'Pikachu', 0, NULL, 397, 0, 1, 0, 'Réservation', 0, 0, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 5, 0, 0, 0, 15, 0, 0, 0, 0, 0, 0, '2025-03-30 19:31:49', NULL),
(1216, 1078, 'Celine', 0, NULL, 406, 0, 1, 0, 'Réservation', 0, 0, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 12, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, '2025-03-30 19:32:19', NULL),
(1217, 1092, 'Totti', 0, NULL, 401, 0, 1, 0, 'Réservation', 0, 0, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2025-03-30 19:32:52', NULL),
(1219, 64, 'Vincent', 0, NULL, 380, 6, 1, 0, 'Réservation', 0, 6, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, '2025-03-31 04:41:07', 0),
(1224, 24, 'David.G', 0, NULL, 418, 8, 1, 0, 'Réservation', 0, 8, 'Actif', 'Aucun', 2, 0, 0, 1, 2, 0, 5, 0, 1, 0, 20, 0, 0, 0, 0, 0, 0, '2025-03-31 12:32:49', 3),
(1225, 2, 'Pikachu', 0, NULL, 418, 10, 1, 0, 'Réservation', 0, 10, 'Actif', 'Aucun', 9, 1, 0, 0, 1, 0, 5, 0, 1, 0, 20, 0, 0, 0, 0, 0, 0, '2025-03-31 12:33:16', 6),
(1227, 51, 'Antoine', 0, NULL, 418, 1, 2, 0, 'Réservation', 0, 11, 'Actif', 'Aucun', 5, 0, 0, 0, 0, 0, 5, 0, 0, 0, 15, 0, 0, 0, 0, 0, 0, '2025-03-31 12:34:12', 0),
(1228, 245, 'Coralie', 0, NULL, 418, 7, 1, 0, 'Réservation', 0, 7, 'Actif', 'Aucun', 3, 0, 0, 0, 0, 0, 5, 0, 0, 0, 15, 0, 0, 0, 0, 0, 0, '2025-03-31 12:34:31', 0),
(1229, 1028, 'Luc', 0, NULL, 418, 9, 1, 0, 'Réservation', 0, 9, 'Actif', 'Aucun', 9, 1, 0, 0, 1, 0, 5, 0, 1, 0, 20, 0, 0, 0, 0, 0, 0, '2025-03-31 12:34:49', 6),
(1231, 1124, 'Peaky Blinder', 0, NULL, 418, 5, 1, 0, 'Réservation', 0, 5, 'Actif', 'Aucun', 9, 1, 0, 0, 1, 0, 5, 0, 1, 0, 20, 0, 0, 0, 0, 0, 0, '2025-03-31 13:01:35', 6),
(1235, 1113, 'Maxime', 0, NULL, 418, 2, 2, 0, 'Réservation', 0, 12, 'Actif', 'Aucun', 1, 2, 0, 0, 0, 0, 5, 0, 0, 0, 15, 0, 0, 0, 0, 0, 0, '2025-03-31 13:22:08', 0),
(1236, 1099, 'Yanis', 0, NULL, 418, 6, 1, 0, 'Réservation', 0, 6, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 5, 0, 0, 0, 15, 0, 0, 0, 0, 0, 0, '2025-03-31 13:22:36', 0),
(1237, 127, NULL, 0, NULL, 418, 0, 1, 0, 'Réservation', 0, 0, 'Actif', 'Aucun', 6, 0, 0, 1, 2, 0, 5, 0, 1, 0, 20, 0, 0, 0, 0, 0, 0, '2025-03-31 13:39:42', 3),
(1238, 1125, 'Seif', 0, NULL, 408, 0, 1, 0, 'Réservation', 17, 0, 'Actif', 'Aucun', 6, 2, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, '2025-03-31 15:06:49', 0),
(1240, 117, 'Said', 0, NULL, 408, 0, 1, 0, 'Réservation', 17, 0, 'Actif', 'Aucun', 9, 1, 0, 0, 1, 0, 0, 0, 1, 0, 25, 0, 0, 0, 0, 0, 0, '2025-03-31 15:52:30', 6),
(1241, 1126, NULL, 0, NULL, 408, 0, 1, 0, 'Réservation', 0, 0, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 12, 0, 0, 0, 32, 0, 0, 0, 0, 0, 0, '2025-03-31 16:21:42', 0),
(1242, 1127, NULL, 0, NULL, 418, 0, 1, 0, 'Réservation', 0, 0, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 5, 0, 0, 0, 15, 0, 0, 0, 0, 0, 0, '2025-03-31 16:34:44', 0),
(1243, 1128, NULL, 0, NULL, 418, 0, 1, 0, 'Réservation', 0, 0, 'Actif', 'Aucun', 6, 1, 0, 1, 2, 0, 5, 0, 1, 0, 20, 0, 0, 0, 0, 0, 0, '2025-03-31 16:34:58', 6),
(1244, 159, NULL, 0, NULL, 418, 0, 1, 0, 'Réservation', 0, 0, 'Actif', 'Aucun', 1, 1, 0, 0, 0, 0, 5, 0, 0, 0, 15, 0, 0, 0, 0, 0, 0, '2025-03-31 17:49:34', 0),
(1245, 1129, NULL, 0, NULL, 418, 0, 1, 0, 'Réservation', 0, 0, 'Actif', 'Aucun', 9, 0, 0, 0, 1, 0, 5, 0, 1, 0, 20, 0, 0, 0, 0, 0, 0, '2025-03-31 17:53:26', 3),
(1246, 202, NULL, 0, NULL, 418, 0, 1, 0, 'Réservation', 0, 0, 'Actif', 'Aucun', 9, 1, 0, 0, 1, 0, 5, 0, 1, 0, 20, 0, 0, 0, 0, 0, 0, '2025-03-31 17:56:06', 6),
(1248, 27, NULL, 0, NULL, 418, 0, 1, 0, 'Réservation', 0, 0, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 5, 0, 0, 0, 15, 0, 0, 0, 0, 0, 0, '2025-03-31 18:29:42', 0),
(1249, 136, NULL, 0, NULL, 418, 0, 1, 0, 'Réservation', 0, 0, 'Actif', 'Aucun', 1, 0, 0, 1, 3, 0, 5, 0, 1, 0, 20, 0, 0, 0, 0, 0, 0, '2025-03-31 19:12:43', 3),
(1251, 248, NULL, 0, NULL, 418, 0, 1, 0, 'Réservation', 0, 0, 'Actif', 'Aucun', 8, 1, 0, 1, 2, 0, 5, 0, 1, 0, 20, 0, 0, 0, 0, 0, 0, '2025-03-31 20:11:40', 6),
(1252, 64, NULL, 0, NULL, 418, 0, 1, 0, 'Réservation', 0, 0, 'Actif', 'Aucun', 9, 0, 0, 0, 1, 0, 5, 0, 1, 0, 20, 0, 0, 0, 0, 0, 0, '2025-03-31 20:13:29', 3),
(1253, 1100, NULL, 0, NULL, 418, 0, 1, 0, 'Réservation', 0, 0, 'Actif', 'Aucun', 4, 0, 0, 1, 2, 0, 5, 0, 1, 0, 20, 0, 0, 0, 0, 0, 0, '2025-03-31 20:18:09', 3),
(1254, 1078, NULL, 0, NULL, 418, 0, 1, 0, 'Réservation', 0, 0, 'Actif', 'Aucun', 9, 0, 0, 0, 1, 0, 5, 0, 1, 0, 20, 0, 0, 0, 0, 0, 0, '2025-03-31 20:19:04', 3),
(1255, 1130, NULL, 0, NULL, 380, 5, 1, 0, 'Réservation', 0, 5, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, '2025-04-01 08:55:56', 0),
(1256, 1131, NULL, 0, NULL, 380, 4, 1, 0, 'Réservation', 0, 4, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, '2025-04-01 08:56:43', 0),
(1257, 1102, 'Manni', 0, NULL, 380, 2, 1, 0, 'Réservation', 6, 2, 'Actif', 'Aucun', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, '2025-04-01 09:46:42', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `structure`
--

CREATE TABLE `structure` (
  `id` int NOT NULL,
  `id-structure` int NOT NULL,
  `ordre` int NOT NULL,
  `id-blinde` int NOT NULL,
  `duree` int NOT NULL,
  `ante` varchar(16) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `structure`
--

INSERT INTO `structure` (`id`, `id-structure`, `ordre`, `id-blinde`, `duree`, `ante`) VALUES
(1, 1, 1, 1, 1200, '0'),
(2, 1, 2, 2, 1200, '0'),
(3, 1, 3, 3, 1200, '0'),
(4, 1, 4, 4, 1200, '0'),
(5, 1, 5, 5, 1200, '0'),
(6, 1, 6, 99, 600, '0'),
(7, 1, 7, 6, 1080, '0'),
(8, 1, 8, 7, 1080, '0'),
(9, 1, 9, 8, 1080, '0'),
(10, 1, 10, 9, 1080, '0'),
(11, 1, 11, 99, 300, '0'),
(12, 1, 12, 11, 960, '0'),
(13, 1, 13, 16, 960, '0'),
(14, 1, 14, 21, 960, '0'),
(15, 1, 15, 27, 960, '0'),
(16, 1, 16, 99, 300, '0'),
(17, 1, 17, 29, 840, '0'),
(18, 1, 18, 32, 840, '0'),
(19, 1, 19, 35, 840, '0'),
(20, 1, 20, 37, 840, '0'),
(21, 1, 21, 99, 300, '0'),
(22, 1, 22, 39, 720, '0'),
(23, 1, 23, 42, 720, '0'),
(24, 1, 24, 43, 720, '0');

-- --------------------------------------------------------

--
-- Structure de la table `structure-buyin`
--

CREATE TABLE `structure-buyin` (
  `id-structure-buyin` int NOT NULL,
  `buyin` int NOT NULL DEFAULT '10',
  `rake` int NOT NULL DEFAULT '0',
  `id-stricture-rake` int NOT NULL DEFAULT '1',
  `bounty` int NOT NULL DEFAULT '0',
  `nb-recave` int NOT NULL DEFAULT '0',
  `nb-Jetons` int NOT NULL DEFAULT '25000',
  `bonus-nb-jetons` int NOT NULL DEFAULT '0',
  `Addon` int NOT NULL DEFAULT '0',
  `Addon-nb-jetons` int NOT NULL DEFAULT '25000',
  `ante` int NOT NULL DEFAULT '0',
  `id-structure-ante` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `structure-buyin`
--

INSERT INTO `structure-buyin` (`id-structure-buyin`, `buyin`, `rake`, `id-stricture-rake`, `bounty`, `nb-recave`, `nb-Jetons`, `bonus-nb-jetons`, `Addon`, `Addon-nb-jetons`, `ante`, `id-structure-ante`) VALUES
(1, 10, 5, 1, 0, 2, 30000, 5000, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `structure_modele`
--

CREATE TABLE `structure_modele` (
  `id_modele_structure` int NOT NULL,
  `id_orga` int NOT NULL,
  `nom` varchar(64) COLLATE utf8mb4_general_ci NOT NULL,
  `sb` int DEFAULT NULL,
  `bb` int DEFAULT NULL,
  `heure_fin_recave` datetime DEFAULT NULL,
  `fin_pour_21H` datetime DEFAULT NULL,
  `duree` time NOT NULL,
  `nb_jetons` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `structure_modele`
--

INSERT INTO `structure_modele` (`id_modele_structure`, `id_orga`, `nom`, `sb`, `bb`, `heure_fin_recave`, `fin_pour_21H`, `duree`, `nb_jetons`) VALUES
(1, 198, 'Test', 100, 200, '2024-07-29 17:11:02', '2024-07-29 22:11:02', '05:20:00', 30000),
(3, 106, 'Koom-Semaine', 1, 2, NULL, NULL, '04:00:00', 25000);

-- --------------------------------------------------------

--
-- Structure de la table `tblcontactus`
--

CREATE TABLE `tblcontactus` (
  `id` int NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint DEFAULT NULL,
  `message` mediumtext,
  `PostingDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `AdminRemark` mediumtext,
  `LastupdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `IsRead` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `tblcontactus`
--

INSERT INTO `tblcontactus` (`id`, `fullname`, `email`, `contactno`, `message`, `PostingDate`, `AdminRemark`, `LastupdationDate`, `IsRead`) VALUES
(1, 'Anuj kumar', 'anujk30@test.com', 1425362514, 'This is for testing purposes.   This is for testing purposes.This is for testing purposes.This is for testing purposes.This is for testing purposes.This is for testing purposes.This is for testing purposes.This is for testing purposes.This is for testing purposes.', '2022-10-30 16:52:03', NULL, NULL, NULL),
(2, 'Anuj kumar', 'ak@gmail.com', 1111122233, 'This is for testing', '2022-11-06 13:13:41', 'Contact the patient', '2022-11-06 13:13:57', 1);

-- --------------------------------------------------------

--
-- Structure de la table `tblcontactusinfo`
--

CREATE TABLE `tblcontactusinfo` (
  `id` int NOT NULL,
  `Address` tinytext,
  `EmailId` varchar(255) DEFAULT NULL,
  `ContactNo` char(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `tblcontactusinfo`
--

INSERT INTO `tblcontactusinfo` (`id`, `Address`, `EmailId`, `ContactNo`) VALUES
(1, 'J&K Block, Laxmi Nagar', 'info@gmail.com', '8974561236');

-- --------------------------------------------------------

--
-- Structure de la table `tblcontactusquery`
--

CREATE TABLE `tblcontactusquery` (
  `id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `EmailId` varchar(120) DEFAULT NULL,
  `ContactNumber` char(11) DEFAULT NULL,
  `Message` longtext,
  `PostingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `tblcontactusquery`
--

INSERT INTO `tblcontactusquery` (`id`, `name`, `EmailId`, `ContactNumber`, `Message`, `PostingDate`, `status`) VALUES
(1, 'Kunal ', 'kunal@gmail.com', '7977779798', 'I want to know you brach in Chandigarh?', '2020-07-07 07:34:51', 1);

-- --------------------------------------------------------

--
-- Structure de la table `tblpage`
--

CREATE TABLE `tblpage` (
  `ID` int NOT NULL,
  `PageType` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PageTitle` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PageDescription` mediumtext COLLATE utf8mb4_general_ci,
  `Email` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MobileNumber` bigint DEFAULT NULL,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `tblpage`
--

INSERT INTO `tblpage` (`ID`, `PageType`, `PageTitle`, `PageDescription`, `Email`, `MobileNumber`, `UpdationDate`) VALUES
(1, 'aboutus', 'About us', 'We understand that running your business is hard work. This is a game-changer when it comes to family activity center software. Clubspeed develops and adapts our solution specifically for the needs of your business; simply sit back, relax, and let us do all the heavy lifting. Then the fun will truly begin!....<div><br></div>', NULL, NULL, '2023-09-25 09:42:43'),
(2, 'contactus', 'Contact Us', '#890 CFG Apartment, Mayur Vihar, Delhi-India.', 'info@gmail.com', 1111111111, '2020-08-12 00:59:43');

-- --------------------------------------------------------

--
-- Structure de la table `tblpages`
--

CREATE TABLE `tblpages` (
  `id` int NOT NULL,
  `PageName` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT '',
  `detail` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `tblpages`
--

INSERT INTO `tblpages` (`id`, `PageName`, `type`, `detail`) VALUES
(1, 'Terms and Conditions', 'terms', '<P align=justify><FONT size=2><STRONG><FONT color=#990000>(1) ACCEPTANCE OF TERMS</FONT><BR><BR></STRONG>Welcome to Yahoo! India. 1Yahoo Web Services India Private Limited Yahoo\", \"we\" or \"us\" as the case may be) provides the Service (defined below) to you, subject to the following Terms of Service (\"TOS\"), which may be updated by us from time to time without notice to you. You can review the most current version of the TOS at any time at: <A href=\"http://in.docs.yahoo.com/info/terms/\">http://in.docs.yahoo.com/info/terms/</A>. In addition, when using particular Yahoo services or third party services, you and Yahoo shall be subject to any posted guidelines or rules applicable to such services which may be posted from time to time. All such guidelines or rules, which maybe subject to change, are hereby incorporated by reference into the TOS. In most cases the guides and rules are specific to a particular part of the Service and will assist you in applying the TOS to that part, but to the extent of any inconsistency between the TOS and any guide or rule, the TOS will prevail. We may also offer other services from time to time that are governed by different Terms of Services, in which case the TOS do not apply to such other services if and to the extent expressly excluded by such different Terms of Services. Yahoo also may offer other services from time to time that are governed by different Terms of Services. These TOS do not apply to such other services that are governed by different Terms of Service. </FONT></P>\r\n<P align=justify><FONT size=2>Welcome to Yahoo! India. Yahoo Web Services India Private Limited Yahoo\", \"we\" or \"us\" as the case may be) provides the Service (defined below) to you, subject to the following Terms of Service (\"TOS\"), which may be updated by us from time to time without notice to you. You can review the most current version of the TOS at any time at: </FONT><A href=\"http://in.docs.yahoo.com/info/terms/\"><FONT size=2>http://in.docs.yahoo.com/info/terms/</FONT></A><FONT size=2>. In addition, when using particular Yahoo services or third party services, you and Yahoo shall be subject to any posted guidelines or rules applicable to such services which may be posted from time to time. All such guidelines or rules, which maybe subject to change, are hereby incorporated by reference into the TOS. In most cases the guides and rules are specific to a particular part of the Service and will assist you in applying the TOS to that part, but to the extent of any inconsistency between the TOS and any guide or rule, the TOS will prevail. We may also offer other services from time to time that are governed by different Terms of Services, in which case the TOS do not apply to such other services if and to the extent expressly excluded by such different Terms of Services. Yahoo also may offer other services from time to time that are governed by different Terms of Services. These TOS do not apply to such other services that are governed by different Terms of Service. </FONT></P>\r\n<P align=justify><FONT size=2>Welcome to Yahoo! India. Yahoo Web Services India Private Limited Yahoo\", \"we\" or \"us\" as the case may be) provides the Service (defined below) to you, subject to the following Terms of Service (\"TOS\"), which may be updated by us from time to time without notice to you. You can review the most current version of the TOS at any time at: </FONT><A href=\"http://in.docs.yahoo.com/info/terms/\"><FONT size=2>http://in.docs.yahoo.com/info/terms/</FONT></A><FONT size=2>. In addition, when using particular Yahoo services or third party services, you and Yahoo shall be subject to any posted guidelines or rules applicable to such services which may be posted from time to time. All such guidelines or rules, which maybe subject to change, are hereby incorporated by reference into the TOS. In most cases the guides and rules are specific to a particular part of the Service and will assist you in applying the TOS to that part, but to the extent of any inconsistency between the TOS and any guide or rule, the TOS will prevail. We may also offer other services from time to time that are governed by different Terms of Services, in which case the TOS do not apply to such other services if and to the extent expressly excluded by such different Terms of Services. Yahoo also may offer other services from time to time that are governed by different Terms of Services. These TOS do not apply to such other services that are governed by different Terms of Service. </FONT></P>'),
(2, 'Privacy Policy', 'privacy', '<span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat</span>'),
(3, 'About Us ', 'aboutus', '<span style=\"color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13.3333px;\">We offer a varied fleet of cars, ranging from the compact. All our vehicles have air conditioning, &nbsp;power steering, electric windows. All our vehicles are bought and maintained at official dealerships only. Automatic transmission cars are available in every booking class.&nbsp;</span><span style=\"color: rgb(52, 52, 52); font-family: Arial, Helvetica, sans-serif;\">As we are not affiliated with any specific automaker, we are able to provide a variety of vehicle makes and models for customers to rent.</span><div><span style=\"color: rgb(62, 62, 62); font-family: &quot;Lucida Sans Unicode&quot;, &quot;Lucida Grande&quot;, sans-serif; font-size: 11px;\">ur mission is to be recognised as the global leader in Car Rental for companies and the public and private sector by partnering with our clients to provide the best and most efficient Cab Rental solutions and to achieve service excellence.</span><span style=\"color: rgb(52, 52, 52); font-family: Arial, Helvetica, sans-serif;\"><br></span></div>'),
(11, 'FAQs', 'faqs', '																														<span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Address------Test &nbsp; &nbsp;dsfdsfds</span>');

-- --------------------------------------------------------

--
-- Structure de la table `tbltestimonial`
--

CREATE TABLE `tbltestimonial` (
  `id` int NOT NULL,
  `UserEmail` varchar(100) NOT NULL,
  `Testimonial` mediumtext NOT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `tbltestimonial`
--

INSERT INTO `tbltestimonial` (`id`, `UserEmail`, `Testimonial`, `PostingDate`, `status`) VALUES
(1, 'test@gmail.com', 'I am satisfied with their service great job', '2020-07-07 12:30:12', 1);

-- --------------------------------------------------------

--
-- Structure de la table `userlog`
--

CREATE TABLE `userlog` (
  `id` int NOT NULL,
  `uid` int DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `logout` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `userlog`
--

INSERT INTO `userlog` (`id`, `uid`, `username`, `userip`, `loginTime`, `logout`, `status`) VALUES
(1, 1, 'johndoe12@test.com', 0x3a3a3100000000000000000000000000, '2022-11-06 12:14:11', NULL, 1),
(2, 1, 'johndoe12@test.com', 0x3a3a3100000000000000000000000000, '2022-11-06 12:21:20', '06-11-2022 05:53:00 PM', 1),
(3, NULL, 'amitk@gmail.com', 0x3a3a3100000000000000000000000000, '2022-11-06 13:15:43', NULL, 0),
(4, 2, 'amitk@gmail.com', 0x3a3a3100000000000000000000000000, '2022-11-06 13:15:58', '06-11-2022 06:50:46 PM', 1),
(5, 1, 'johndoe12@test.com', 0x326130343a636563303a313930313a34, '2023-09-20 10:09:00', '20-09-2023 03:41:45 PM', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `activite`
--
ALTER TABLE `activite`
  ADD PRIMARY KEY (`id-activite`);

--
-- Index pour la table `adresse`
--
ALTER TABLE `adresse`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `blindes-live`
--
ALTER TABLE `blindes-live`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `challenge`
--
ALTER TABLE `challenge`
  ADD PRIMARY KEY (`id_challenge`);

--
-- Index pour la table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `membres`
--
ALTER TABLE `membres`
  ADD PRIMARY KEY (`id-membre`),
  ADD UNIQUE KEY `ordre` (`id-membre`);

--
-- Index pour la table `participation`
--
ALTER TABLE `participation`
  ADD PRIMARY KEY (`id-participation`),
  ADD KEY `fk_membre` (`id-membre`),
  ADD KEY `fk_activite` (`id-activite`);

--
-- Index pour la table `structure_modele`
--
ALTER TABLE `structure_modele`
  ADD PRIMARY KEY (`id_modele_structure`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `activite`
--
ALTER TABLE `activite`
  MODIFY `id-activite` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=419;

--
-- AUTO_INCREMENT pour la table `adresse`
--
ALTER TABLE `adresse`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=177;

--
-- AUTO_INCREMENT pour la table `blindes-live`
--
ALTER TABLE `blindes-live`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=505;

--
-- AUTO_INCREMENT pour la table `events`
--
ALTER TABLE `events`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `membres`
--
ALTER TABLE `membres`
  MODIFY `id-membre` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1132;

--
-- AUTO_INCREMENT pour la table `participation`
--
ALTER TABLE `participation`
  MODIFY `id-participation` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1258;

--
-- AUTO_INCREMENT pour la table `structure_modele`
--
ALTER TABLE `structure_modele`
  MODIFY `id_modele_structure` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
