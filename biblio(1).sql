-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 20 mai 2024 à 20:09
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `biblio`
--

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `auth_permission`
--

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
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_etudiant'),
(22, 'Can change user', 6, 'change_etudiant'),
(23, 'Can delete user', 6, 'delete_etudiant'),
(24, 'Can view user', 6, 'view_etudiant'),
(25, 'Can add exemplaire', 7, 'add_exemplaire'),
(26, 'Can change exemplaire', 7, 'change_exemplaire'),
(27, 'Can delete exemplaire', 7, 'delete_exemplaire'),
(28, 'Can view exemplaire', 7, 'view_exemplaire'),
(29, 'Can add livre', 8, 'add_livre'),
(30, 'Can change livre', 8, 'change_livre'),
(31, 'Can delete livre', 8, 'delete_livre'),
(32, 'Can view livre', 8, 'view_livre'),
(33, 'Can add emprunt', 9, 'add_emprunt'),
(34, 'Can change emprunt', 9, 'change_emprunt'),
(35, 'Can delete emprunt', 9, 'delete_emprunt'),
(36, 'Can view emprunt', 9, 'view_emprunt'),
(37, 'Can add reservation', 10, 'add_reservation'),
(38, 'Can change reservation', 10, 'change_reservation'),
(39, 'Can delete reservation', 10, 'delete_reservation'),
(40, 'Can view reservation', 10, 'view_reservation'),
(41, 'Can add livre_ reservation', 11, 'add_livre_reservation'),
(42, 'Can change livre_ reservation', 11, 'change_livre_reservation'),
(43, 'Can delete livre_ reservation', 11, 'delete_livre_reservation'),
(44, 'Can view livre_ reservation', 11, 'view_livre_reservation'),
(45, 'Can add contact', 12, 'add_contact'),
(46, 'Can change contact', 12, 'change_contact'),
(47, 'Can delete contact', 12, 'delete_contact'),
(48, 'Can view contact', 12, 'view_contact');

-- --------------------------------------------------------

--
-- Structure de la table `biblioapp_contact`
--

CREATE TABLE `biblioapp_contact` (
  `id` bigint(20) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email_address` varchar(254) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `message` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `biblioapp_contact`
--

INSERT INTO `biblioapp_contact` (`id`, `full_name`, `email_address`, `subject`, `message`) VALUES
(7, 'ouma', 'benouma85@gmai.com', 'heloo', 'alam');

-- --------------------------------------------------------

--
-- Structure de la table `biblioapp_emprunt`
--

CREATE TABLE `biblioapp_emprunt` (
  `id_emprunt` int(11) NOT NULL,
  `date_emprunt` date NOT NULL,
  `date_retour_prevue` date NOT NULL,
  `date_retour_effectif` date DEFAULT NULL,
  `id_etudiant_id` int(11) NOT NULL,
  `id_exemplaire_id` int(11) NOT NULL,
  `retourner` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `biblioapp_emprunt`
--

INSERT INTO `biblioapp_emprunt` (`id_emprunt`, `date_emprunt`, `date_retour_prevue`, `date_retour_effectif`, `id_etudiant_id`, `id_exemplaire_id`, `retourner`) VALUES
(1, '2024-05-15', '2024-05-30', '2024-05-15', 2, 48557, 1),
(2, '2024-05-15', '2024-05-30', '2024-05-16', 2, 48554, 1),
(3, '2024-05-15', '2024-05-30', '2024-05-16', 3, 48568, 1),
(4, '2024-05-15', '2024-05-30', '2024-05-16', 2, 48555, 1),
(5, '2024-05-15', '2024-05-30', '2024-05-16', 4, 48563, 1),
(6, '2024-05-15', '2024-05-30', '2024-05-16', 4, 48525, 1),
(7, '2024-05-15', '2024-05-30', '2024-05-16', 3, 48520, 1),
(8, '2024-05-15', '2024-05-30', '2024-05-16', 3, 48560, 1),
(9, '2024-05-16', '2024-05-31', NULL, 29, 48525, 0),
(10, '2024-05-17', '2024-06-01', NULL, 4, 48568, 0),
(11, '2024-05-19', '2024-06-03', NULL, 5, 48526, 0);

-- --------------------------------------------------------

--
-- Structure de la table `biblioapp_etudiant`
--

CREATE TABLE `biblioapp_etudiant` (
  `id_etudiant` int(11) NOT NULL,
  `cni` varchar(255) NOT NULL,
  `massar` varchar(255) NOT NULL,
  `date_naissance` date NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(128) NOT NULL,
  `filiere` varchar(255) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `username` varchar(150) NOT NULL,
  `penalite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `biblioapp_etudiant`
--

INSERT INTO `biblioapp_etudiant` (`id_etudiant`, `cni`, `massar`, `date_naissance`, `email`, `password`, `filiere`, `date_joined`, `first_name`, `is_active`, `is_staff`, `is_superuser`, `last_login`, `last_name`, `username`, `penalite`) VALUES
(1, '123456', '123456789', '2001-11-11', '0x0red.me@gmail.com', 'admin', 'SMI', '2024-05-07 15:26:50.810043', 'othmane', 1, 1, 1, '2024-05-16 17:24:59.963802', 'ferrah', 'othmane ferrah', 0),
(2, '234567', '234567890', '2000-04-03', 'alice.smith@gmail.com', 'password1', 'SMI', '2024-05-07 16:30:00.000000', 'Alice', 1, 0, 0, '2024-05-15 00:47:02.141210', 'Smith', 'alice.smith', 0),
(3, '345678', '345678901', '2001-02-15', 'bob.jones@yahoo.com', 'password2', 'SMI', '2024-05-07 17:00:00.000000', 'Bob', 1, 0, 0, '2024-05-15 01:28:59.608575', 'Jones', 'bob.jones', 0),
(4, '456789', '456789012', '1999-12-28', 'carla.brown@hotmail.com', 'password3', 'SMI', '2024-05-08 09:15:20.000000', 'Carla', 1, 0, 0, '2024-05-15 09:06:20.156692', 'Brown', 'carla.brown', 0),
(5, '567890', '567890123', '2002-06-17', 'david.white@gmail.com', 'password4', 'SMI', '2024-05-08 10:45:30.000000', 'David', 1, 0, 0, '2024-05-15 09:08:44.785701', 'White', 'david.white', 0),
(6, '678901', '678901234', '1998-08-20', 'emily.wilson@gmail.com', 'password5', 'SMI', '2024-05-08 11:05:45.000000', 'Emily', 1, 0, 0, '2024-05-12 09:10:05.000000', 'Wilson', 'emily.wilson', 0),
(7, '789012', '789012345', '1997-04-12', 'frank.miller@yahoo.com', 'password6', 'SMI', '2024-05-08 13:20:35.000000', 'Frank', 1, 0, 0, '2024-05-12 10:20:30.000000', 'Miller', 'frank.miller', 0),
(8, '890123', '890123456', '2001-09-30', 'george.moore@hotmail.com', 'password7', 'SMI', '2024-05-08 14:00:50.000000', 'George', 1, 0, 0, '2024-05-13 08:40:25.000000', 'Moore', 'george.moore', 0),
(9, '901234', '901234567', '2002-01-22', 'hannah.taylor@gmail.com', 'password8', 'SMI', '2024-05-09 09:20:45.000000', 'Hannah', 1, 0, 0, '2024-05-13 09:50:10.000000', 'Taylor', 'hannah.taylor', 0),
(10, '012345', '012345678', '1999-03-10', 'ian.anderson@yahoo.com', 'password9', 'SMI', '2024-05-09 10:15:55.000000', 'Ian', 1, 0, 0, '2024-05-13 10:30:40.000000', 'Anderson', 'ian.anderson', 0),
(11, '123457', '123457890', '1998-05-18', 'julia.jackson@gmail.com', 'password10', 'SMI', '2024-05-09 11:35:10.000000', 'Julia', 1, 0, 0, '2024-05-14 08:25:10.000000', 'Jackson', 'julia.jackson', 0),
(12, '234568', '234568901', '2000-10-25', 'kevin.martin@hotmail.com', 'password11', 'SMI', '2024-05-09 15:05:25.000000', 'Kevin', 1, 0, 0, '2024-05-14 09:15:45.000000', 'Martin', 'kevin.martin', 0),
(13, '345679', '345679012', '1997-12-05', 'laura.harris@gmail.com', 'password12', 'SMI', '2024-05-10 09:20:40.000000', 'Laura', 1, 0, 0, '2024-05-14 10:05:30.000000', 'Harris', 'laura.harris', 0),
(14, '456780', '456780123', '2001-07-13', 'matthew.clark@yahoo.com', 'password13', 'SMI', '2024-05-10 10:00:55.000000', 'Matthew', 1, 0, 0, '2024-05-14 10:55:45.000000', 'Clark', 'matthew.clark', 0),
(15, '567891', '567891234', '1999-01-29', 'nina.rodriguez@gmail.com', 'password14', 'SMI', '2024-05-10 10:45:20.000000', 'Nina', 1, 0, 0, '2024-05-15 09:45:30.000000', 'Rodriguez', 'nina.rodriguez', 0),
(16, '678902', '678902345', '2002-04-06', 'oscar.lee@hotmail.com', 'password15', 'SMI', '2024-05-10 11:20:35.000000', 'Oscar', 1, 0, 0, '2024-05-15 10:20:15.000000', 'Lee', 'oscar.lee', 0),
(17, '789013', '789013456', '2001-06-27', 'paula.evans@gmail.com', 'password16', 'SMI', '2024-05-10 12:30:00.000000', 'Paula', 1, 0, 0, '2024-05-15 11:15:40.000000', 'Evans', 'paula.evans', 0),
(18, '890124', '890124567', '1998-09-18', 'quentin.king@yahoo.com', 'password17', 'SMI', '2024-05-10 13:05:15.000000', 'Quentin', 1, 0, 0, '2024-05-15 11:55:50.000000', 'King', 'quentin.king', 0),
(19, '901235', '901235678', '1999-02-20', 'rachel.hall@gmail.com', 'password18', 'SMI', '2024-05-10 13:55:25.000000', 'Rachel', 1, 0, 0, '2024-05-15 12:35:05.000000', 'Hall', 'rachel.hall', 0),
(20, '012346', '012346789', '2000-08-08', 'steve.wright@hotmail.com', 'password19', 'SMI', '2024-05-11 09:15:40.000000', 'Steve', 1, 0, 0, '2024-05-15 13:20:30.000000', 'Wright', 'steve.wright', 0),
(21, '123458', '123458901', '2002-12-10', 'terry.scott@gmail.com', 'password20', 'SMI', '2024-05-11 09:45:55.000000', 'Terry', 1, 0, 0, '2024-05-15 13:55:45.000000', 'Scott', 'terry.scott', 0),
(22, '234569', '234569012', '1998-06-14', 'ursula.young@yahoo.com', 'password21', 'SMI', '2024-05-11 10:30:10.000000', 'Ursula', 1, 0, 0, '2024-05-15 14:30:15.000000', 'Young', 'ursula.young', 0),
(23, '345680', '345680123', '2001-03-22', 'victor.rivera@gmail.com', 'password22', 'SMI', '2024-05-11 11:05:25.000000', 'Victor', 1, 0, 0, '2024-05-15 15:05:30.000000', 'Rivera', 'victor.rivera', 0),
(24, '456791', '456791234', '1997-11-30', 'wendy.mitchell@hotmail.com', 'password23', 'SMI', '2024-05-11 12:15:40.000000', 'Wendy', 1, 0, 0, '2024-05-15 15:45:45.000000', 'Mitchell', 'wendy.mitchell', 0),
(25, '567892', '567892345', '1999-07-19', 'xander.carter@gmail.com', 'password24', 'SMI', '2024-05-11 13:20:55.000000', 'Xander', 1, 0, 0, '2024-05-16 09:35:10.000000', 'Carter', 'xander.carter', 0),
(26, '678903', '678903456', '2002-09-28', 'yolanda.ward@yahoo.com', 'password25', 'SMI', '2024-05-11 14:05:10.000000', 'Yolanda', 1, 0, 0, '2024-05-16 10:10:30.000000', 'Ward', 'yolanda.ward', 0),
(29, 'D867247', 'M135365058', '2001-11-15', 'ferrahothman@gmail.com', 'admin', 'SMI', '2024-05-16 17:24:29.254342', 'othman', 1, 0, 0, '2024-05-16 17:24:29.266345', 'ferrah', 'othman ferrah', 0),
(30, '123', '123', '2001-12-11', 'fsm@gmail.com', 'admin', 'SMI', '2024-05-16 22:35:47.687632', 'fsm', 1, 1, 1, '2024-05-19 12:59:59.258039', 'fsm', 'fsm fsm', 0);

-- --------------------------------------------------------

--
-- Structure de la table `biblioapp_etudiant_groups`
--

CREATE TABLE `biblioapp_etudiant_groups` (
  `id` bigint(20) NOT NULL,
  `etudiant_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `biblioapp_etudiant_user_permissions`
--

CREATE TABLE `biblioapp_etudiant_user_permissions` (
  `id` bigint(20) NOT NULL,
  `etudiant_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `biblioapp_exemplaire`
--

CREATE TABLE `biblioapp_exemplaire` (
  `id_exemplaire` int(11) NOT NULL,
  `etat` varchar(20) NOT NULL,
  `date_achat` date NOT NULL,
  `id_livre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `biblioapp_exemplaire`
--

INSERT INTO `biblioapp_exemplaire` (`id_exemplaire`, `etat`, `date_achat`, `id_livre_id`) VALUES
(48515, 'Disponible', '2024-05-05', 1),
(48516, 'Disponible', '2024-05-05', 1),
(48517, 'Disponible', '2024-05-05', 2),
(48518, 'Disponible', '2024-05-05', 2),
(48519, 'Disponible', '2024-05-05', 2),
(48520, 'Disponible', '2024-05-05', 3),
(48521, 'Disponible', '2024-05-05', 3),
(48522, 'Disponible', '2024-05-05', 3),
(48523, 'perdu', '2024-05-05', 4),
(48524, 'Disponible', '2024-05-05', 4),
(48525, '', '2024-05-05', 5),
(48526, 'Hors-pret', '2024-05-05', 5),
(48527, 'Disponible', '2024-05-05', 5),
(48528, 'Disponible', '2024-05-06', 6),
(48529, 'Disponible', '2024-05-06', 6),
(48530, 'Disponible', '2024-05-06', 6),
(48531, 'Disponible', '2024-05-06', 7),
(48532, 'Disponible', '2024-05-06', 8),
(48533, 'Disponible', '2024-05-06', 8),
(48534, 'Disponible', '2024-05-06', 9),
(48535, 'Disponible', '2024-05-06', 9),
(48536, 'Disponible', '2024-05-06', 9),
(48537, 'Disponible', '2024-05-06', 10),
(48538, 'Disponible', '2024-05-06', 11),
(48539, 'Disponible', '2024-05-06', 11),
(48540, 'Disponible', '2024-05-06', 11),
(48541, 'Disponible', '2024-05-06', 12),
(48542, 'Disponible', '2024-05-06', 12),
(48543, 'Disponible', '2024-05-06', 12),
(48544, 'Disponible', '2024-05-06', 13),
(48545, 'Disponible', '2024-05-06', 14),
(48546, 'Disponible', '2024-05-06', 14),
(48547, 'Disponible', '2024-05-06', 14),
(48548, 'Disponible', '2024-05-06', 15),
(48549, 'Disponible', '2024-05-06', 15),
(48550, 'Disponible', '2024-05-06', 16),
(48551, 'Disponible', '2024-05-06', 17),
(48552, 'Disponible', '2024-05-06', 17),
(48553, 'Disponible', '2024-05-06', 17),
(48554, 'Disponible', '2024-05-06', 18),
(48555, 'Disponible', '2024-05-06', 18),
(48556, 'Disponible', '2024-05-06', 18),
(48557, 'Disponible', '2024-05-06', 19),
(48558, 'Disponible', '2024-05-06', 19),
(48559, 'Disponible', '2024-05-06', 20),
(48560, 'Disponible', '2024-05-06', 21),
(48561, 'Disponible', '2024-05-06', 21),
(48562, 'Disponible', '2024-05-06', 21),
(48563, 'Disponible', '2024-05-06', 22),
(48564, 'Disponible', '2024-05-06', 22),
(48565, 'Disponible', '2024-05-06', 23),
(48566, 'Disponible', '2024-05-06', 24),
(48567, 'Disponible', '2024-05-06', 24),
(48568, 'Hors-pret', '2024-05-06', 25),
(48569, 'Disponible', '2024-05-06', 25),
(48570, 'Disponible', '2024-05-06', 25);

-- --------------------------------------------------------

--
-- Structure de la table `biblioapp_livre`
--

CREATE TABLE `biblioapp_livre` (
  `id_livre` int(11) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `auteur` varchar(255) NOT NULL,
  `langue` varchar(50) NOT NULL,
  `quantite` int(11) NOT NULL,
  `genre` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `horspret` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `biblioapp_livre`
--

INSERT INTO `biblioapp_livre` (`id_livre`, `titre`, `description`, `auteur`, `langue`, `quantite`, `genre`, `image`, `horspret`) VALUES
(1, 'Les miserables', 'Un récit épique sur la rédemption et l\'amour dans la France du XIXe siècle.', 'Victor Hugo', 'FR', 2, 'Roman historique, Drame', 'book/miserables.jpg', 0),
(2, 'Le Rouge et le Noir', 'Une exploration des désirs et des ambitions dans la société française du XIXe siècle.', 'Stendhal (Henri Beyle)', 'FR', 3, 'Roman psychologique, Roman d\'apprentissage', 'book/redblack.jpg', 0),
(3, 'The Great Gatsby', 'Une histoire captivante sur l\'amour, la richesse et l\'illusion de l\'American Dream dans les années 1920.', 'F. Scott Fitzgerald', 'FR', 3, 'Roman social, Roman de l\'époque du jazz', 'book/the-great-gatsby.jpg', 0),
(4, 'Harry Potter #1', 'L\'entrée magique dans le monde de la sorcellerie et de l\'aventure de Harry Potter à Poudlard.', 'J.K. Rowling', 'FR', 2, 'Fantasy, Jeunesse', 'book/harry-potter-1.jpg', 0),
(5, '1984', 'Une vision sombre et prophétique d\'une société totalitaire où la liberté individuelle est supprimée.', 'George Orwell', 'FR', 3, 'Science-fiction, Dystopie', 'book/1984.png', 0),
(6, 'Sapiens: Une brève histoire de l\'humanité', 'Une exploration fascinante de l\'évolution de l\'homme, de nos origines à l\'ère moderne.', 'Yuval Noah Harari', 'FR', 3, 'Histoire, non-fiction', 'book/71akBHTin0S.webp', 0),
(7, 'Fusils, Germes, and Steel: The Fates of Human Societies', 'Une analyse de pourquoi certaines civilisations ont prospéré tandis que d\'autres ont échoué.', 'Jared Diamond', 'FR', 1, 'Histoire, non-fiction', 'book/71BByzm98gL._SY342_.jpg', 1),
(8, 'A Short History of Nearly Everything', 'Un aperçu accessible et divertissant de l\'histoire de la science, de la cosmologie à la biologie.', 'Bill Bryson', 'EN', 2, 'Science, non-fiction', 'book/3.jpg', 0),
(9, 'How Little Things Can Make a Big Difference', 'Une exploration des facteurs qui font basculer les idées et les comportements de masse.', 'Malcolm Gladwell', 'EN', 3, 'Science sociale, non-fiction', 'book/4.jpg', 0),
(10, 'L\'Étranger', 'Ce roman explore les thèmes de l\'absurdité, de l\'aliénation et de la révolte à travers l\'histoire de Meursault.', 'Albert Camus', 'FR', 1, 'Roman, Philosophie', 'book/5.jpg', 1),
(11, 'Madame Bovary', 'Ce roman raconte l\'histoire d\'Emma Bovary, une femme insatisfaite de son mariage et de sa vie.', 'Gustave Flaubert', 'FR', 3, 'Roman, Réalisme', 'book/6.jpg', 0),
(12, 'Candide ou l\'Optimisme', 'Ce conte satirique raconte les voyages de Candide, un jeune homme naïf et optimiste, à travers un monde cruel et injuste.', 'Voltaire', 'FR', 3, 'Philosophique, Conte', 'book/7.jpg', 0),
(13, 'Voyage au bout de la nuit', 'Ce roman suit les aventures antihéроиques de Ferdinand Bardamu, un médecin cynique et désabusé.', 'Louis-Ferdinand Céline', 'FR', 1, 'Roman, Antiroman', 'book/8.jpg', 1),
(14, 'La Condition humaine', 'Ce roman explore les thèmes de la révolution, de la révolte et de la condition humaine.', 'André Malraux', 'FR', 3, 'Roman, Philosophie', 'book/9.jpg', 0),
(15, 'L\'Ève future', 'Ce roman imagine la création d\'une femme artificielle parfaite, Hadaly, qui bouleverse la vie d\'un scientifique.', 'Villiers de l\'Isle-Adam', 'FR', 2, 'Roman Scientifique, Fantastique', 'book/10.jpg', 0),
(16, 'Aura', 'Ce roman explore les thèmes du temps, de la mémoire et de l\'identité à travers l\'histoire d\'un jeune homme qui tombe amoureux d\'une femme mystérieuse.', 'Carlos Fuentes', 'FR', 1, 'Roman, Fantastique', 'book/11.jpg', 1),
(17, 'La Chartreuse', 'Ce roman retrace l\'histoire de Fabrice del Dongo, un jeune Italien idéaliste pris dans les tourments de l\'Italie napoléonienne.', 'Parme de Stendhal', 'FR', 3, 'Roman historique, psychologique', 'book/12.jpg', 0),
(18, 'Man\'s Search for Meaning', 'This memoir recounts the author\'s experiences in Nazi concentration camps.', 'Viktor E. Frankl', 'EN', 3, 'Nonfiction, Memoir', 'book/13.jpg', 0),
(19, 'A Brief History of Time', 'This renowned book delves into the complexities of the universe, explaining concepts like black holes and the Big Bang.', 'Stephen Hawking', 'EN', 2, 'Nonfiction, Physics', 'book/14.jpg', 0),
(20, 'The Mismeasure of Man', 'This influential work critiques the misuse of scientific methods to justify racist and discriminatory practices throughout history.', 'Stephen Jay Gould', 'EN', 1, 'Nonfiction, History of Science', 'book/15.jpg', 1),
(21, 'Ten Reasons We\'re Wrong About the World', 'This optimistic book challenges common misconceptions about global trends, using data to demonstrate positive developments.', 'Hans Rosling', 'EN', 3, 'Nonfiction, Data Analysis', 'book/16.jpg', 0),
(22, 'The Selfish Gene', 'This influential book popularized the concept of the \\selfish gene,\\ explaining how evolution works through the lens of gene replication and survival.', 'Richard Dawkins', 'EN', 2, 'Nonfiction, Evolutionary Biology', 'book/17.jpg', 0),
(23, 'Surely You\'re Joking, Mr. Feynman!', 'This collection of humorous anecdotes by Nobel Prize-winning physicist Richard Feynman offers a glimpse into his eccentric personality and unique approach to scientific discovery.', 'Richard Feynman', 'EN', 1, 'Nonfiction, Physics, Memoir', 'book/18.jpg', 1),
(24, 'Silent Spring', 'This groundbreaking book exposed the devastating effects of pesticides on the environment and human health, sparking a global environmental movement.', 'Rachel Carson', 'EN', 2, 'Nonfiction, Environmental Science', 'book/19.jpg', 0),
(25, 'Le Père Goriot', 'Ce roman emblématique de la Comédie Humaine dépeint la société parisienne du XIXe siècle.', 'Honoré de Balzac', 'FR', 3, 'Roman, Réalisme', 'book/20.jpeg', 0);

-- --------------------------------------------------------

--
-- Structure de la table `biblioapp_livre_reservation`
--

CREATE TABLE `biblioapp_livre_reservation` (
  `id` bigint(20) NOT NULL,
  `id_livre_id` int(11) NOT NULL,
  `id_reservation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `biblioapp_reservation`
--

CREATE TABLE `biblioapp_reservation` (
  `id_reservation` int(11) NOT NULL,
  `date_reservation` date NOT NULL,
  `id_etudiant_id` int(11) NOT NULL,
  `id_livre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `biblioapp_reservation`
--

INSERT INTO `biblioapp_reservation` (`id_reservation`, `date_reservation`, `id_etudiant_id`, `id_livre_id`) VALUES
(12, '2024-05-15', 5, 17),
(13, '2024-05-15', 2, 19);

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(12, 'BiblioAPP', 'contact'),
(9, 'BiblioAPP', 'emprunt'),
(6, 'BiblioAPP', 'etudiant'),
(7, 'BiblioAPP', 'exemplaire'),
(8, 'BiblioAPP', 'livre'),
(11, 'BiblioAPP', 'livre_reservation'),
(10, 'BiblioAPP', 'reservation'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-05-07 13:04:52.726290'),
(2, 'contenttypes', '0002_remove_content_type_name', '2024-05-07 13:04:52.771685'),
(3, 'auth', '0001_initial', '2024-05-07 13:04:53.012286'),
(4, 'auth', '0002_alter_permission_name_max_length', '2024-05-07 13:04:53.121397'),
(5, 'auth', '0003_alter_user_email_max_length', '2024-05-07 13:04:53.139579'),
(6, 'auth', '0004_alter_user_username_opts', '2024-05-07 13:04:53.157257'),
(7, 'auth', '0005_alter_user_last_login_null', '2024-05-07 13:04:53.175601'),
(8, 'auth', '0006_require_contenttypes_0002', '2024-05-07 13:04:53.180550'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2024-05-07 13:04:53.199543'),
(10, 'auth', '0008_alter_user_username_max_length', '2024-05-07 13:04:53.218628'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2024-05-07 13:04:53.237627'),
(12, 'auth', '0010_alter_group_name_max_length', '2024-05-07 13:04:53.272277'),
(13, 'auth', '0011_update_proxy_permissions', '2024-05-07 13:04:53.297277'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2024-05-07 13:04:53.317301'),
(15, 'BiblioAPP', '0001_initial', '2024-05-07 13:04:54.449980'),
(16, 'BiblioAPP', '0002_alter_etudiant_options_alter_etudiant_managers_and_more', '2024-05-07 13:04:57.304695'),
(17, 'BiblioAPP', '0003_emprunt_retourner_alter_emprunt_date_retour_effectif_and_more', '2024-05-07 13:04:57.383016'),
(18, 'BiblioAPP', '0004_etudiant_penalite_delete_sanction', '2024-05-07 13:04:57.410997'),
(19, 'BiblioAPP', '0005_livre_horspret_alter_livre_image', '2024-05-07 13:04:57.430996'),
(20, 'admin', '0001_initial', '2024-05-07 13:04:57.558379'),
(21, 'admin', '0002_logentry_remove_auto_add', '2024-05-07 13:04:57.568401'),
(22, 'admin', '0003_logentry_add_action_flag_choices', '2024-05-07 13:04:57.579460'),
(23, 'sessions', '0001_initial', '2024-05-07 13:04:57.621433'),
(24, 'BiblioAPP', '0006_contact', '2024-05-07 15:42:54.277105'),
(25, 'BiblioAPP', '0007_alter_livre_titre', '2024-05-17 09:07:20.117527');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('54ov1ez6jrizkk2zwx4ejl6hhnm67rj3', '.eJxVjDsOwjAQBe_iGlmJ_6GkzxmsXe8aB5AjxUmFuDuJlALaNzPvLSJsa4lb4yVOJK7CisvvhpCeXA9AD6j3Waa5rsuE8lDkSZscZ-LX7XT_Dgq0stcpk0PyHlxAzWCs6VERDQkxadVB6CEEg8pZ4zuvB7CUWWfOGnfLBfH5AgwAOM0:1s7Acu:D_jVAyxYbX0QksZU0WzS79clx5qdifBLz6MXagu0HDw', '2024-05-29 09:08:44.790177'),
('fn0ngj5mlaw1c73njcv4oekwc2qmfaax', '.eJxVjEEOwiAQRe_C2pCBFgdcuvcMZAZGqRpISrsy3l2bdKHb_977LxVpXUpcu8xxyuqkBlCH35EpPaRuJN-p3ppOrS7zxHpT9E67vrQsz_Pu_h0U6uVbuyMYIPTBcGCEwcKIVxTjGSUnEZfIUx6QbUC0lpDYSQpjYEIA9Or9AfP8N9k:1s8g8t:etlaDnm7P_jERsste5BbhVicr7n_VLqW3NOe5ZfA__4', '2024-06-02 12:59:59.266710'),
('g9apxg0banrfn3kepmyf1stfrhx49uqc', '.eJxVjMsOwiAQRf-FtSHACAwu3fcbyAwPqZo2Ke3K-O_apAvd3nPOfYlI29ri1ssSxywuAsTpd2NKjzLtIN9pus0yzdO6jCx3RR60y2HO5Xk93L-DRr1960Q1VVLok9KhaAIkzwXRGA8K3Lmy48DFajDEJphkrAMNHkPAkC2K9wfvWTdQ:1s73Rz:X1FTaxH2wWuIoiW1FI408wRrkWxCz6sjDI3YI8mb0J4', '2024-05-29 01:28:59.614594');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Index pour la table `biblioapp_contact`
--
ALTER TABLE `biblioapp_contact`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `biblioapp_emprunt`
--
ALTER TABLE `biblioapp_emprunt`
  ADD PRIMARY KEY (`id_emprunt`),
  ADD KEY `BiblioAPP_emprunt_id_etudiant_id_caabe8f1_fk` (`id_etudiant_id`),
  ADD KEY `BiblioAPP_emprunt_id_exemplaire_id_11f631f5_fk` (`id_exemplaire_id`);

--
-- Index pour la table `biblioapp_etudiant`
--
ALTER TABLE `biblioapp_etudiant`
  ADD PRIMARY KEY (`id_etudiant`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `BiblioAPP_etudiant_cni_2d5b0f61_uniq` (`cni`),
  ADD UNIQUE KEY `BiblioAPP_etudiant_massar_0ab40aa7_uniq` (`massar`);

--
-- Index pour la table `biblioapp_etudiant_groups`
--
ALTER TABLE `biblioapp_etudiant_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `BiblioAPP_etudiant_groups_etudiant_id_group_id_735ff15a_uniq` (`etudiant_id`,`group_id`),
  ADD KEY `BiblioAPP_etudiant_groups_group_id_2088c528_fk_auth_group_id` (`group_id`);

--
-- Index pour la table `biblioapp_etudiant_user_permissions`
--
ALTER TABLE `biblioapp_etudiant_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `BiblioAPP_etudiant_user__etudiant_id_permission_i_c50f0c85_uniq` (`etudiant_id`,`permission_id`),
  ADD KEY `BiblioAPP_etudiant_u_permission_id_b775894c_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `biblioapp_exemplaire`
--
ALTER TABLE `biblioapp_exemplaire`
  ADD PRIMARY KEY (`id_exemplaire`),
  ADD KEY `BiblioAPP_exemplaire_id_livre_id_46bec7d6_fk` (`id_livre_id`);

--
-- Index pour la table `biblioapp_livre`
--
ALTER TABLE `biblioapp_livre`
  ADD PRIMARY KEY (`id_livre`);

--
-- Index pour la table `biblioapp_livre_reservation`
--
ALTER TABLE `biblioapp_livre_reservation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `BiblioAPP_livre_reservat_id_livre_id_id_reservati_ee67b28b_uniq` (`id_livre_id`,`id_reservation_id`),
  ADD KEY `BiblioAPP_livre_rese_id_reservation_id_2e238b2c_fk_BiblioAPP` (`id_reservation_id`);

--
-- Index pour la table `biblioapp_reservation`
--
ALTER TABLE `biblioapp_reservation`
  ADD PRIMARY KEY (`id_reservation`),
  ADD KEY `BiblioAPP_reservation_id_etudiant_id_be6b4fc8_fk` (`id_etudiant_id`),
  ADD KEY `BiblioAPP_reservation_id_livre_id_0c79ebbc_fk` (`id_livre_id`);

--
-- Index pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_BiblioAPP` (`user_id`);

--
-- Index pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Index pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT pour la table `biblioapp_contact`
--
ALTER TABLE `biblioapp_contact`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `biblioapp_emprunt`
--
ALTER TABLE `biblioapp_emprunt`
  MODIFY `id_emprunt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `biblioapp_etudiant`
--
ALTER TABLE `biblioapp_etudiant`
  MODIFY `id_etudiant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pour la table `biblioapp_etudiant_groups`
--
ALTER TABLE `biblioapp_etudiant_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `biblioapp_etudiant_user_permissions`
--
ALTER TABLE `biblioapp_etudiant_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `biblioapp_exemplaire`
--
ALTER TABLE `biblioapp_exemplaire`
  MODIFY `id_exemplaire` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48571;

--
-- AUTO_INCREMENT pour la table `biblioapp_livre`
--
ALTER TABLE `biblioapp_livre`
  MODIFY `id_livre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `biblioapp_livre_reservation`
--
ALTER TABLE `biblioapp_livre_reservation`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `biblioapp_reservation`
--
ALTER TABLE `biblioapp_reservation`
  MODIFY `id_reservation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Contraintes pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `biblioapp_emprunt`
--
ALTER TABLE `biblioapp_emprunt`
  ADD CONSTRAINT `BiblioAPP_emprunt_id_etudiant_id_caabe8f1_fk` FOREIGN KEY (`id_etudiant_id`) REFERENCES `biblioapp_etudiant` (`id_etudiant`),
  ADD CONSTRAINT `BiblioAPP_emprunt_id_exemplaire_id_11f631f5_fk` FOREIGN KEY (`id_exemplaire_id`) REFERENCES `biblioapp_exemplaire` (`id_exemplaire`);

--
-- Contraintes pour la table `biblioapp_etudiant_groups`
--
ALTER TABLE `biblioapp_etudiant_groups`
  ADD CONSTRAINT `BiblioAPP_etudiant_g_etudiant_id_c9860e28_fk_BiblioAPP` FOREIGN KEY (`etudiant_id`) REFERENCES `biblioapp_etudiant` (`id_etudiant`),
  ADD CONSTRAINT `BiblioAPP_etudiant_groups_etudiant_id_c9860e28_fk` FOREIGN KEY (`etudiant_id`) REFERENCES `biblioapp_etudiant` (`id_etudiant`),
  ADD CONSTRAINT `BiblioAPP_etudiant_groups_group_id_2088c528_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Contraintes pour la table `biblioapp_etudiant_user_permissions`
--
ALTER TABLE `biblioapp_etudiant_user_permissions`
  ADD CONSTRAINT `BiblioAPP_etudiant_u_etudiant_id_e6b52752_fk_BiblioAPP` FOREIGN KEY (`etudiant_id`) REFERENCES `biblioapp_etudiant` (`id_etudiant`),
  ADD CONSTRAINT `BiblioAPP_etudiant_u_permission_id_b775894c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `BiblioAPP_etudiant_user_permissions_etudiant_id_e6b52752_fk` FOREIGN KEY (`etudiant_id`) REFERENCES `biblioapp_etudiant` (`id_etudiant`);

--
-- Contraintes pour la table `biblioapp_exemplaire`
--
ALTER TABLE `biblioapp_exemplaire`
  ADD CONSTRAINT `BiblioAPP_exemplaire_id_livre_id_46bec7d6_fk` FOREIGN KEY (`id_livre_id`) REFERENCES `biblioapp_livre` (`id_livre`);

--
-- Contraintes pour la table `biblioapp_livre_reservation`
--
ALTER TABLE `biblioapp_livre_reservation`
  ADD CONSTRAINT `BiblioAPP_livre_rese_id_reservation_id_2e238b2c_fk_BiblioAPP` FOREIGN KEY (`id_reservation_id`) REFERENCES `biblioapp_reservation` (`id_reservation`),
  ADD CONSTRAINT `BiblioAPP_livre_reservation_id_livre_id_b0da7f18_fk` FOREIGN KEY (`id_livre_id`) REFERENCES `biblioapp_livre` (`id_livre`);

--
-- Contraintes pour la table `biblioapp_reservation`
--
ALTER TABLE `biblioapp_reservation`
  ADD CONSTRAINT `BiblioAPP_reservation_id_etudiant_id_be6b4fc8_fk` FOREIGN KEY (`id_etudiant_id`) REFERENCES `biblioapp_etudiant` (`id_etudiant`),
  ADD CONSTRAINT `BiblioAPP_reservation_id_livre_id_0c79ebbc_fk` FOREIGN KEY (`id_livre_id`) REFERENCES `biblioapp_livre` (`id_livre`);

--
-- Contraintes pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_BiblioAPP` FOREIGN KEY (`user_id`) REFERENCES `biblioapp_etudiant` (`id_etudiant`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
