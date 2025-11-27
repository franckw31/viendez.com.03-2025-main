-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 26 nov. 2025 à 09:01
-- Version du serveur : 9.1.0
-- Version de PHP : 8.1.31

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

DROP TABLE IF EXISTS `activite`;
CREATE TABLE IF NOT EXISTS `activite` (
  `id-activite` int NOT NULL AUTO_INCREMENT,
  `id_challenge` int NOT NULL DEFAULT '4',
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
  `places` int DEFAULT '16',
  `reserves` int DEFAULT NULL,
  `options` int DEFAULT '0',
  `libre` int DEFAULT NULL,
  `commentaire` varchar(128) DEFAULT NULL,
  `buyin` int DEFAULT '10',
  `rake` int DEFAULT '5',
  `bounty` int DEFAULT '0',
  `jetons` int DEFAULT '35000',
  `recave` int DEFAULT '1',
  `recave_montant` int NOT NULL DEFAULT '10',
  `recave_jetons` int NOT NULL DEFAULT '40000',
  `addon` int DEFAULT '0',
  `ante` varchar(16) DEFAULT '0',
  `bonus` int DEFAULT '0',
  `nb-tables` int NOT NULL DEFAULT '2',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id-activite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
CREATE TABLE IF NOT EXISTS `adresse` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `date_ajout` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `identifier` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `blindes`
--

DROP TABLE IF EXISTS `blindes`;
CREATE TABLE IF NOT EXISTS `blindes` (
  `id-blinde` int NOT NULL,
  `ordre` int NOT NULL,
  `nom` varchar(16) DEFAULT NULL,
  `val-sb` int NOT NULL,
  `val-bb` int NOT NULL,
  `pause` int NOT NULL,
  `ante` varchar(16) DEFAULT '0',
  `duree` int NOT NULL,
  PRIMARY KEY (`id-blinde`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `blindes-live`
--

DROP TABLE IF EXISTS `blindes-live`;
CREATE TABLE IF NOT EXISTS `blindes-live` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id-activite` int DEFAULT NULL,
  `ordre` int DEFAULT NULL,
  `nom` varchar(64) DEFAULT NULL,
  `sb` int NOT NULL DEFAULT '0',
  `bb` int NOT NULL DEFAULT '0',
  `minutes` int NOT NULL DEFAULT '0',
  `fin` datetime DEFAULT NULL,
  `ante` varchar(16) DEFAULT '0',
  `en_pause` int DEFAULT '0',
  `heure_pause` datetime DEFAULT NULL,
  `heure_depause` datetime DEFAULT NULL,
  `delta` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `blindes_snapshots`
--

DROP TABLE IF EXISTS `blindes_snapshots`;
CREATE TABLE IF NOT EXISTS `blindes_snapshots` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_activite` int NOT NULL,
  `id_membre` int NOT NULL,
  `snapshot_name` varchar(255) NOT NULL,
  `snapshot_data` longtext NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_activite` (`id_activite`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `blind_levels`
--

DROP TABLE IF EXISTS `blind_levels`;
CREATE TABLE IF NOT EXISTS `blind_levels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structure_id` int DEFAULT NULL,
  `level` int NOT NULL,
  `small_blind` int NOT NULL,
  `big_blind` int NOT NULL,
  `ante` int DEFAULT '0',
  `duration` int DEFAULT '900',
  PRIMARY KEY (`id`),
  KEY `structure_id` (`structure_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `blind_structures`
--

DROP TABLE IF EXISTS `blind_structures`;
CREATE TABLE IF NOT EXISTS `blind_structures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `challenge`
--

DROP TABLE IF EXISTS `challenge`;
CREATE TABLE IF NOT EXISTS `challenge` (
  `id_challenge` int NOT NULL,
  `titre_challenge` varchar(64) NOT NULL,
  `chal_com` varchar(128) NOT NULL,
  `chal_deb` date NOT NULL,
  `chal_fin` date NOT NULL,
  `chal_org` int NOT NULL,
  PRIMARY KEY (`id_challenge`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `challenge-partie`
--

DROP TABLE IF EXISTS `challenge-partie`;
CREATE TABLE IF NOT EXISTS `challenge-partie` (
  `chapar_id` int NOT NULL,
  `chapar_id_chal` int NOT NULL,
  `chapar_id_part` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `collections`
--

DROP TABLE IF EXISTS `collections`;
CREATE TABLE IF NOT EXISTS `collections` (
  `id_collection` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `commentaire` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_collection`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `collections-individu`
--

DROP TABLE IF EXISTS `collections-individu`;
CREATE TABLE IF NOT EXISTS `collections-individu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_col` int NOT NULL,
  `id-indiv` int DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `co` varchar(255) NOT NULL DEFAULT 'Inconnu',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `competences`
--

DROP TABLE IF EXISTS `competences`;
CREATE TABLE IF NOT EXISTS `competences` (
  `id` int NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `commentaire` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `competences-individu`
--

DROP TABLE IF EXISTS `competences-individu`;
CREATE TABLE IF NOT EXISTS `competences-individu` (
  `id` int NOT NULL,
  `id-comp` int NOT NULL,
  `id-indiv` int DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `co` varchar(255) NOT NULL DEFAULT 'Inconnu'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `doctorslog`
--

DROP TABLE IF EXISTS `doctorslog`;
CREATE TABLE IF NOT EXISTS `doctorslog` (
  `id` int NOT NULL,
  `uid` int DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `logout` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `eliminations`
--

DROP TABLE IF EXISTS `eliminations`;
CREATE TABLE IF NOT EXISTS `eliminations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_participation` int NOT NULL,
  `id_membre` int NOT NULL,
  `nom_membre` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_definitive` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE IF NOT EXISTS `events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `eventsgps`
--

DROP TABLE IF EXISTS `eventsgps`;
CREATE TABLE IF NOT EXISTS `eventsgps` (
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

-- --------------------------------------------------------

--
-- Structure de la table `loisirs`
--

DROP TABLE IF EXISTS `loisirs`;
CREATE TABLE IF NOT EXISTS `loisirs` (
  `id` int NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `commentaire` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `loisirs-individu`
--

DROP TABLE IF EXISTS `loisirs-individu`;
CREATE TABLE IF NOT EXISTS `loisirs-individu` (
  `id` int NOT NULL,
  `id-lois` int NOT NULL,
  `id-indiv` int DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `co` varchar(255) NOT NULL DEFAULT 'Inconnu'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `membres`
--

DROP TABLE IF EXISTS `membres`;
CREATE TABLE IF NOT EXISTS `membres` (
  `id-membre` int NOT NULL AUTO_INCREMENT,
  `id_membre` int DEFAULT NULL,
  `pseudo` varchar(30) DEFAULT NULL,
  `droits` varchar(11) NOT NULL DEFAULT '1',
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `type` varchar(6) DEFAULT 'M',
  `lastip` varchar(20) DEFAULT NULL,
  `nbpoints` int DEFAULT '-1',
  `password` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT '1234',
  `CodeV` varchar(64) DEFAULT NULL,
  `verification` tinyint NOT NULL DEFAULT '0',
  `telephone` varchar(255) NOT NULL DEFAULT '0600000000',
  `email` varchar(30) DEFAULT 'test@test.fr',
  `photo` varchar(200) NOT NULL DEFAULT 't1.jpg',
  `photo_org` varchar(200) NOT NULL DEFAULT 't1.jpg',
  `photo-map` varchar(255) NOT NULL DEFAULT 'url(panel/images/',
  `commentaire` int DEFAULT NULL,
  `rue` char(255) DEFAULT NULL,
  `ville` char(255) DEFAULT NULL,
  `country` varchar(64) DEFAULT 'France',
  `longitude` double DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `icon` varchar(255) NOT NULL DEFAULT 'user-m',
  `ico-siz` float DEFAULT NULL,
  `ico_size` int NOT NULL DEFAULT '100',
  `lien` varchar(255) NOT NULL DEFAULT '<a href="/panel/voir-membre.php?uid=',
  `lien-id` varchar(64) DEFAULT NULL,
  `lien-texte` varchar(255) NOT NULL DEFAULT '">',
  `lien-texte-fin` varchar(255) NOT NULL DEFAULT 'Cliquer Pour Infos',
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
  `def_sta` varchar(64) DEFAULT NULL,
  `def_com` varchar(128) DEFAULT NULL,
  `association_date` date DEFAULT '1970-01-01',
  `posting_date` date DEFAULT '1970-01-01',
  `naissance_date` date DEFAULT NULL,
  `notif_zero` tinyint(1) DEFAULT '1',
  `notif_allannonces` tinyint(1) DEFAULT '0',
  `notif_grpannonces` tinyint(1) DEFAULT '0',
  `notif_inscription` tinyint(1) DEFAULT '0',
  `solde` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id-membre`),
  UNIQUE KEY `ordre` (`id-membre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Structure de la table `participation`
--

DROP TABLE IF EXISTS `participation`;
CREATE TABLE IF NOT EXISTS `participation` (
  `id-participation` int NOT NULL AUTO_INCREMENT,
  `id-membre` int NOT NULL DEFAULT '1',
  `nom-membre` varchar(64) DEFAULT NULL,
  `id-membre-vainqueur` int NOT NULL DEFAULT '0',
  `nom-membre-vainqueur` varchar(64) DEFAULT NULL,
  `id-activite` int NOT NULL,
  `id-siege` int DEFAULT '1',
  `id-table` int DEFAULT '1',
  `id-challenge` int NOT NULL DEFAULT '3',
  `option` varchar(20) NOT NULL DEFAULT 'Réservation',
  `ordre` int NOT NULL DEFAULT '0',
  `position` int NOT NULL DEFAULT '0',
  `valide` varchar(11) NOT NULL DEFAULT 'Actif',
  `commentaire` varchar(255) DEFAULT 'Aucun',
  `classement` int NOT NULL DEFAULT '50',
  `recave` int NOT NULL DEFAULT '0',
  `addon` int NOT NULL DEFAULT '0',
  `tf` int NOT NULL DEFAULT '0',
  `win` tinyint(1) NOT NULL DEFAULT '0',
  `points` int NOT NULL DEFAULT '0',
  `bonbon` int NOT NULL DEFAULT '0',
  `rake` int DEFAULT '0',
  `gain` int NOT NULL DEFAULT '0',
  `challenger` tinyint(1) NOT NULL DEFAULT '0',
  `caisse_chal` int NOT NULL DEFAULT '0',
  `cout_in` int DEFAULT NULL,
  `ds` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `cagnotte` int DEFAULT NULL,
  `remise` tinyint(1) NOT NULL DEFAULT '0',
  `jetons` int DEFAULT NULL,
  `jetons_cumul` int NOT NULL DEFAULT '35000',
  `gain_cumul` int NOT NULL DEFAULT '0',
  `gain_total` decimal(10,2) DEFAULT '0.00',
  `pertes` int DEFAULT NULL,
  `test` int NOT NULL,
  PRIMARY KEY (`id-participation`),
  KEY `fk_membre` (`id-membre`),
  KEY `fk_activite` (`id-activite`),
  KEY `test` (`id-membre`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `poker_players`
--

DROP TABLE IF EXISTS `poker_players`;
CREATE TABLE IF NOT EXISTS `poker_players` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `buyin` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `portefeuille`
--

DROP TABLE IF EXISTS `portefeuille`;
CREATE TABLE IF NOT EXISTS `portefeuille` (
  `id_mvt` int NOT NULL AUTO_INCREMENT,
  `id_mvt_membre` int NOT NULL,
  `id_membre_tier` int NOT NULL DEFAULT '1',
  `montant` int NOT NULL,
  `id_type_mvt` int NOT NULL DEFAULT '0',
  `date_mvt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_participation` int DEFAULT NULL,
  PRIMARY KEY (`id_mvt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `structure`
--

DROP TABLE IF EXISTS `structure`;
CREATE TABLE IF NOT EXISTS `structure` (
  `id` int NOT NULL,
  `id-structure` int NOT NULL,
  `ordre` int NOT NULL,
  `id-blinde` int NOT NULL,
  `duree` int NOT NULL,
  `ante` varchar(16) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `structure-buyin`
--

DROP TABLE IF EXISTS `structure-buyin`;
CREATE TABLE IF NOT EXISTS `structure-buyin` (
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

-- --------------------------------------------------------

--
-- Structure de la table `structure_modele`
--

DROP TABLE IF EXISTS `structure_modele`;
CREATE TABLE IF NOT EXISTS `structure_modele` (
  `id_modele_structure` int NOT NULL AUTO_INCREMENT,
  `id_orga` int NOT NULL,
  `nom` varchar(64) COLLATE utf8mb4_general_ci NOT NULL,
  `sb` int DEFAULT NULL,
  `bb` int DEFAULT NULL,
  `heure_fin_recave` datetime DEFAULT NULL,
  `fin_pour_21H` datetime DEFAULT NULL,
  `duree` time NOT NULL,
  `nb_jetons` int DEFAULT NULL,
  PRIMARY KEY (`id_modele_structure`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tblcontactus`
--

DROP TABLE IF EXISTS `tblcontactus`;
CREATE TABLE IF NOT EXISTS `tblcontactus` (
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

-- --------------------------------------------------------

--
-- Structure de la table `tblcontactusinfo`
--

DROP TABLE IF EXISTS `tblcontactusinfo`;
CREATE TABLE IF NOT EXISTS `tblcontactusinfo` (
  `id` int NOT NULL,
  `Address` tinytext,
  `EmailId` varchar(255) DEFAULT NULL,
  `ContactNo` char(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `tblcontactusquery`
--

DROP TABLE IF EXISTS `tblcontactusquery`;
CREATE TABLE IF NOT EXISTS `tblcontactusquery` (
  `id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `EmailId` varchar(120) DEFAULT NULL,
  `ContactNumber` char(11) DEFAULT NULL,
  `Message` longtext,
  `PostingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `tblpage`
--

DROP TABLE IF EXISTS `tblpage`;
CREATE TABLE IF NOT EXISTS `tblpage` (
  `ID` int NOT NULL,
  `PageType` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PageTitle` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PageDescription` mediumtext COLLATE utf8mb4_general_ci,
  `Email` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MobileNumber` bigint DEFAULT NULL,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tblpages`
--

DROP TABLE IF EXISTS `tblpages`;
CREATE TABLE IF NOT EXISTS `tblpages` (
  `id` int NOT NULL,
  `PageName` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT '',
  `detail` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Structure de la table `tbltestimonial`
--

DROP TABLE IF EXISTS `tbltestimonial`;
CREATE TABLE IF NOT EXISTS `tbltestimonial` (
  `id` int NOT NULL,
  `UserEmail` varchar(100) NOT NULL,
  `Testimonial` mediumtext NOT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `userlog`
--

DROP TABLE IF EXISTS `userlog`;
CREATE TABLE IF NOT EXISTS `userlog` (
  `id` int NOT NULL,
  `uid` int DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `logout` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `blind_levels`
--
ALTER TABLE `blind_levels`
  ADD CONSTRAINT `blind_levels_ibfk_1` FOREIGN KEY (`structure_id`) REFERENCES `blind_structures` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
