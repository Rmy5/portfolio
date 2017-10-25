-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 25 Octobre 2017 à 12:02
-- Version du serveur :  10.1.19-MariaDB
-- Version de PHP :  7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `portfolio`
--

-- --------------------------------------------------------

--
-- Structure de la table `authorization`
--

CREATE TABLE `authorization` (
  `c_id` int(11) NOT NULL,
  `c_description` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `authorization`
--

INSERT INTO `authorization` (`c_id`, `c_description`) VALUES
(1, 'lecture');

-- --------------------------------------------------------

--
-- Structure de la table `content`
--

CREATE TABLE `content` (
  `c_id` int(11) NOT NULL,
  `c_type` varchar(32) NOT NULL,
  `c_title` varchar(255) NOT NULL,
  `c_content` text NOT NULL,
  `c_link` varchar(128) NOT NULL,
  `c_user_fk` int(11) DEFAULT NULL,
  `c_images_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `images`
--

CREATE TABLE `images` (
  `i_id` int(11) NOT NULL,
  `i_link` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `rank`
--

CREATE TABLE `rank` (
  `r_id` int(11) NOT NULL,
  `r_autorisation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `rank`
--

INSERT INTO `rank` (`r_id`, `r_autorisation`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `rank_authorization`
--

CREATE TABLE `rank_authorization` (
  `r_rang_id` int(11) NOT NULL,
  `r_autorisation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `rank_authorization`
--

INSERT INTO `rank_authorization` (`r_rang_id`, `r_autorisation_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `u_id` int(11) NOT NULL,
  `u_login` varchar(64) NOT NULL,
  `u_lastname` varchar(64) NOT NULL,
  `u_firstname` varchar(64) NOT NULL,
  `u_pwd` varchar(255) NOT NULL,
  `u_mail` varchar(128) NOT NULL,
  `u_newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `u_rank_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`u_id`, `u_login`, `u_lastname`, `u_firstname`, `u_pwd`, `u_mail`, `u_newsletter`, `u_rank_fk`) VALUES
(1, 'max', 'NN', 'Maxime', '123', 'azer@tyu.com', 0, 1),
(2, 'ert', 'cfg', 'rty', '123', 'fghf@jhkj.com', 0, 4),
(3, 'max', 'Loooo', 'Maxime', '123', 'azer@ghj.com', 0, 4);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `authorization`
--
ALTER TABLE `authorization`
  ADD PRIMARY KEY (`c_id`);

--
-- Index pour la table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`c_id`),
  ADD KEY `c_user_fk` (`c_user_fk`),
  ADD KEY `contenus_c_images_fk_index` (`c_images_fk`);

--
-- Index pour la table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`i_id`);

--
-- Index pour la table `rank`
--
ALTER TABLE `rank`
  ADD PRIMARY KEY (`r_id`);

--
-- Index pour la table `rank_authorization`
--
ALTER TABLE `rank_authorization`
  ADD PRIMARY KEY (`r_rang_id`,`r_autorisation_id`),
  ADD KEY `r_autorisation_id` (`r_autorisation_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`u_id`),
  ADD KEY `u_rang_fk` (`u_rank_fk`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `authorization`
--
ALTER TABLE `authorization`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `content`
--
ALTER TABLE `content`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `images`
--
ALTER TABLE `images`
  MODIFY `i_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `rank`
--
ALTER TABLE `rank`
  MODIFY `r_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `c_images_fk` FOREIGN KEY (`c_images_fk`) REFERENCES `images` (`i_id`),
  ADD CONSTRAINT `content_ibfk_1` FOREIGN KEY (`c_user_fk`) REFERENCES `user` (`u_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `rank`
--
ALTER TABLE `rank`
  ADD CONSTRAINT `rank_ibfk_1` FOREIGN KEY (`r_id`) REFERENCES `user` (`u_rank_fk`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Contraintes pour la table `rank_authorization`
--
ALTER TABLE `rank_authorization`
  ADD CONSTRAINT `rank_authorization_ibfk_2` FOREIGN KEY (`r_autorisation_id`) REFERENCES `authorization` (`c_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rank_authorization_ibfk_3` FOREIGN KEY (`r_rang_id`) REFERENCES `rank` (`r_id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
