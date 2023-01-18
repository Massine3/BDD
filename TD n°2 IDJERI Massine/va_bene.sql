-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 18 jan. 2023 à 13:18
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `va_bene`
--

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `Code_Client` int(20) NOT NULL,
  `Code_Produit` int(20) DEFAULT NULL,
  `Code_Commande` int(11) DEFAULT NULL,
  `Nom_Client` varchar(20) DEFAULT NULL,
  `Age_Client` int(10) DEFAULT NULL,
  `Sexe_Client` varchar(10) DEFAULT NULL,
  `Ville_Client` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`Code_Client`, `Code_Produit`, `Code_Commande`, `Nom_Client`, `Age_Client`, `Sexe_Client`, `Ville_Client`) VALUES
(123, 4, 23, 'Azel', 17, 'Femme', 'Paris'),
(124, 5, 24, 'Aksill', 23, 'Homme', 'Paris'),
(125, 5, 25, 'Kara', 17, 'Femme', 'Clichy'),
(126, 7, 26, 'Hanou', 23, 'Homme', 'Montreuil'),
(127, 2, 27, 'Ammi', 20, 'Homme', 'Montrueil'),
(128, 1, 28, 'Laz', 19, 'Femme', 'Paris'),
(129, 3, 29, 'Raab', 19, 'Femme', 'Clichy'),
(130, 1, 30, 'Saad', 28, 'Homme', 'Aubervilliers'),
(131, 6, 31, 'Amiar', 20, 'Femme', 'Clichy'),
(132, 3, 32, 'Amini', 28, 'Femme', 'Aubervilliers');

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

CREATE TABLE `commandes` (
  `Code_Commande` int(20) NOT NULL,
  `Code_Client` int(20) DEFAULT NULL,
  `Type_Commande` varchar(20) DEFAULT NULL,
  `Nombre_Commande` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `commandes`
--

INSERT INTO `commandes` (`Code_Commande`, `Code_Client`, `Type_Commande`, `Nombre_Commande`) VALUES
(23, 123, 'Pizza', 2),
(24, 124, 'Pizza Royale', 2),
(25, 125, 'Panini Fromage', 2),
(26, 126, 'Pizza Ryale', 2),
(27, 127, 'Pizza Royale', 1),
(28, 128, 'Tacos M', 3),
(29, 129, 'Coca Cola', 2),
(30, 130, 'Pizza Végétarienne', 1),
(31, 131, 'Tacos XL', 1),
(32, 132, 'Panini Poulet', 2);

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

CREATE TABLE `produits` (
  `Code_Produit` int(20) NOT NULL,
  `Code_Commande` int(11) DEFAULT NULL,
  `Nom_Produit` varchar(20) DEFAULT NULL,
  `Type_Produit` varchar(20) DEFAULT NULL,
  `Prix_Produit` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`Code_Produit`, `Code_Commande`, `Nom_Produit`, `Type_Produit`, `Prix_Produit`) VALUES
(1, NULL, 'Pizza Végétarienne', 'Pizza', '15'),
(2, NULL, 'Coca Cola', 'Boisson', '1'),
(3, NULL, 'Tacos M', 'Tacos', '9'),
(4, NULL, 'Tacos XL', 'Tacos', '11'),
(5, NULL, 'Pizza Royale', 'Pizza', '12'),
(6, NULL, 'Panini Fromage', 'Panini', '5'),
(7, NULL, 'Panini Poulet', 'Panini', '6');

-- --------------------------------------------------------

--
-- Structure de la table `restaurant`
--

CREATE TABLE `restaurant` (
  `Code_Restaurant` int(11) NOT NULL,
  `Code_Client` int(11) DEFAULT NULL,
  `Code_Commande` int(11) DEFAULT NULL,
  `Code_Produit` int(20) DEFAULT NULL,
  `Nom_Restaurant` varchar(20) DEFAULT NULL,
  `Adresse_Reastaurant` varchar(30) DEFAULT NULL,
  `Contact_Restaurant` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`Code_Client`),
  ADD KEY `Code_Commande` (`Code_Commande`),
  ADD KEY `Nom_Produit` (`Code_Produit`);

--
-- Index pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD PRIMARY KEY (`Code_Commande`),
  ADD KEY `Code_Client` (`Code_Client`);

--
-- Index pour la table `produits`
--
ALTER TABLE `produits`
  ADD PRIMARY KEY (`Code_Produit`),
  ADD KEY `Code_Commande` (`Code_Commande`);

--
-- Index pour la table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`Code_Restaurant`),
  ADD KEY `Nombre_Commande` (`Code_Commande`),
  ADD KEY `Nom_Produit` (`Code_Produit`) USING BTREE,
  ADD KEY `Code_Client` (`Code_Client`),
  ADD KEY `Code_Commande` (`Code_Commande`,`Code_Produit`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_ibfk_2` FOREIGN KEY (`Code_Client`) REFERENCES `produits` (`Code_Produit`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `clients_ibfk_3` FOREIGN KEY (`Code_Client`) REFERENCES `restaurant` (`Code_Restaurant`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `clients_ibfk_4` FOREIGN KEY (`Code_Client`) REFERENCES `commandes` (`Code_Commande`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD CONSTRAINT `commandes_ibfk_3` FOREIGN KEY (`Code_Commande`) REFERENCES `restaurant` (`Code_Restaurant`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `produits`
--
ALTER TABLE `produits`
  ADD CONSTRAINT `produits_ibfk_2` FOREIGN KEY (`Code_Produit`) REFERENCES `clients` (`Code_Client`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `produits_ibfk_3` FOREIGN KEY (`Code_Produit`) REFERENCES `commandes` (`Code_Commande`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `restaurant`
--
ALTER TABLE `restaurant`
  ADD CONSTRAINT `restaurant_ibfk_2` FOREIGN KEY (`Code_Restaurant`) REFERENCES `commandes` (`Code_Commande`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
