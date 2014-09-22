-- phpMyAdmin SQL Dump
-- version 3.5.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generato il: Set 22, 2014 alle 17:09
-- Versione del server: 5.5.27-log
-- Versione PHP: 5.4.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `spq_risk`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `spq_risk_cards`
--

DROP TABLE IF EXISTS `spq_risk_cards`;
CREATE TABLE IF NOT EXISTS `spq_risk_cards` (
  `id_card` int(11) NOT NULL,
  `card_name` varchar(250) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `spq_risk_game`
--

DROP TABLE IF EXISTS `spq_risk_game`;
CREATE TABLE IF NOT EXISTS `spq_risk_game` (
  `id_game` int(11) NOT NULL AUTO_INCREMENT,
  `game_name` varchar(250) COLLATE utf8_bin NOT NULL,
  `game_creation_date` date NOT NULL,
  `id_user_current_turn` int(11) NOT NULL,
  `game_max_point` int(11) NOT NULL,
  `game_turn_number` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `id_user_winner` int(11) NOT NULL,
  PRIMARY KEY (`id_game`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `spq_risk_game_grimory`
--

DROP TABLE IF EXISTS `spq_risk_game_grimory`;
CREATE TABLE IF NOT EXISTS `spq_risk_game_grimory` (
  `id_game` int(11) NOT NULL,
  `grimory_cards` varchar(55) COLLATE utf8_bin NOT NULL,
  `grimory_current_position` int(11) NOT NULL,
  PRIMARY KEY (`id_game`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `spq_risk_game_log`
--

DROP TABLE IF EXISTS `spq_risk_game_log`;
CREATE TABLE IF NOT EXISTS `spq_risk_game_log` (
  `id_log` int(11) NOT NULL AUTO_INCREMENT,
  `id_game` int(11) NOT NULL,
  `id_user_primary` int(11) NOT NULL,
  `id_user_secondary` int(11) NOT NULL,
  `id_location_primary` int(11) NOT NULL,
  `id_location_secondary` int(11) NOT NULL,
  `log_date` date NOT NULL,
  `log_text` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `spq_risk_game_point`
--

DROP TABLE IF EXISTS `spq_risk_game_point`;
CREATE TABLE IF NOT EXISTS `spq_risk_game_point` (
  `id_game` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `game_point_points` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `spq_risk_game_turn_fase`
--

DROP TABLE IF EXISTS `spq_risk_game_turn_fase`;
CREATE TABLE IF NOT EXISTS `spq_risk_game_turn_fase` (
  `id_game` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_turn_phase` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `spq_risk_game_user`
--

DROP TABLE IF EXISTS `spq_risk_game_user`;
CREATE TABLE IF NOT EXISTS `spq_risk_game_user` (
  `id_game` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_color` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `spq_risk_language`
--

DROP TABLE IF EXISTS `spq_risk_language`;
CREATE TABLE IF NOT EXISTS `spq_risk_language` (
  `id_lang` int(11) NOT NULL AUTO_INCREMENT,
  `language_description` varchar(250) COLLATE utf8_bin NOT NULL,
  `language_prefix` varchar(10) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Dump dei dati per la tabella `spq_risk_language`
--

INSERT INTO `spq_risk_language` (`id_lang`, `language_description`, `language_prefix`) VALUES
(1, 'Italiano', 'it_IT');

-- --------------------------------------------------------

--
-- Struttura della tabella `spq_risk_location`
--

DROP TABLE IF EXISTS `spq_risk_location`;
CREATE TABLE IF NOT EXISTS `spq_risk_location` (
  `id_location` int(11) NOT NULL AUTO_INCREMENT,
  `id_location_group` int(11) DEFAULT NULL,
  `location_type` tinyint(4) NOT NULL,
  `location_name` varchar(250) COLLATE utf8_bin NOT NULL,
  `location_label` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_location`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=150 ;

--
-- Dump dei dati per la tabella `spq_risk_location`
--

INSERT INTO `spq_risk_location` (`id_location`, `id_location_group`, `location_type`, `location_name`, `location_label`) VALUES
(1, NULL, 1, 'Britannia', 'britanniaLegionary'),
(2, 2, 2, 'Mare Atlantic', 'britanniaSea'),
(3, NULL, 3, 'Britannia Interna', 'britanniaColiseum'),
(4, NULL, 1, 'Germania Inferiore', 'germanLegionary'),
(5, 1, 2, 'Mare Septemtrio', 'germanSea'),
(6, NULL, 3, 'Germania Interna', 'germanColiseum'),
(7, NULL, 1, 'Belgica', 'belgicaLegionary'),
(8, 1, 2, 'Mare Septemtrio', 'belgicaSea'),
(9, NULL, 3, 'Belgica Interna', 'belgicaColiseum'),
(10, NULL, 1, 'Ludgunense', 'ludgunenseLegionary'),
(11, 1, 2, 'Mare Septemtrio', 'ludgunenseSea'),
(12, 2, 2, 'Mare Atlantic', 'ludgunenseSeaSouth'),
(13, NULL, 3, 'Ludgunense Interna', 'ludgunenseColiseum'),
(14, NULL, 1, 'Acquitania', 'aquitaniaLegionary'),
(15, 2, 2, 'Mare Atlantic', 'aquitaniaSea'),
(16, NULL, 3, 'Acquitania Interna', 'aquitaniaColiseum'),
(17, NULL, 1, 'Galicia', 'galiciaLegionary'),
(18, 2, 2, 'Mare Atlantic', 'galiciaSea'),
(19, NULL, 3, 'Galicia Interna', 'galiciaColiseum'),
(20, NULL, 1, 'Luisiania', 'luisitaniaLegionary'),
(21, 2, 2, 'Mare Atlantic', 'luisitaniaSea'),
(22, 3, 2, 'Mare Herculis', 'luisitaniaSeaSouth'),
(23, NULL, 3, 'Luisiania Interna', 'luisitaniaColiseum'),
(24, NULL, 1, 'Terraconense', 'terraconenseLegionary'),
(25, 2, 2, 'Mare Atlantic', 'terraconenseSeaNorth'),
(26, 5, 2, 'Insulis maris', 'terraconenseSeaSouth'),
(27, 4, 2, 'Mare Transeunt', 'terraconenseSeaSouth'),
(28, NULL, 3, 'Terraconense Interna', 'terraconenseColiseum'),
(29, NULL, 1, 'Betica', 'beticaLegionary'),
(30, 3, 2, 'Mare Herculis', 'beticaSea'),
(31, 4, 2, 'Mare Transeunt', 'beticaSeaEast'),
(32, NULL, 3, 'Betica Interna', 'beticaColiseum'),
(33, NULL, 1, 'Mauretania', 'mauretaniaLegionary'),
(34, 3, 2, 'Mare Herculis', 'mauretaniaSea'),
(35, 4, 2, 'Mare Transeunt', 'mauretaniaSeaEast'),
(36, NULL, 3, 'Mauretania Interna', 'mauretaniaColiseum'),
(37, NULL, 1, 'Numidia', 'numidiaLegionary'),
(38, 4, 2, 'Mare Transeunt', 'numidiaSea'),
(39, 9, 2, 'Tepida Maris', 'numidiaSeaEast'),
(40, NULL, 3, 'Numidia Interna', 'numidiaColiseum'),
(41, NULL, 1, 'Aprica', 'apricaLegionary'),
(42, 6, 2, 'Italici maris', 'apricaSeaNorth'),
(43, 4, 2, 'Mare Transeunt', 'apricaSeaSouth'),
(44, 9, 2, 'Tepida Maris', 'apricaSeaEast'),
(45, NULL, 3, 'Aprica Interna', 'apricaColiseum'),
(46, NULL, 1, 'Cirenaica', 'cirenaicaLegionary'),
(47, 8, 2, 'Nec Mare', 'cirenaicaSeaNorth'),
(48, 9, 2, 'Tepida Maris', 'cirenaicaSeaSouth'),
(49, 10, 2, 'Mare Tranquillum', 'cirenaicaSeaEast'),
(50, NULL, 3, 'Cirenaica Interna', 'cirenaicaColiseum'),
(51, NULL, 1, 'Egitto', 'egittoLegionary'),
(52, 10, 2, 'Mare Tranquillum', 'egittoSea'),
(53, NULL, 3, 'Egitto Interna', 'egittoColiseum'),
(54, NULL, 1, 'Giudea', 'giudeaLegionary'),
(55, 10, 2, 'Mare Tranquillum', 'giudeaSea'),
(56, NULL, 3, 'Giudea Interna', 'giudeaColiseum'),
(57, NULL, 1, 'Arabia', 'arabiaLegionary'),
(58, NULL, 3, 'Arabia Interna', 'arabiaColiseum'),
(59, NULL, 1, 'Mesopotamia', 'mesopotamiaLegionary'),
(60, NULL, 3, 'Mesopotamia Interna', 'mesopotamiaColiseum'),
(61, NULL, 1, 'Siria', 'siriaLegionary'),
(62, 10, 2, 'Mare Tranquillum', 'siriaSea'),
(63, NULL, 3, 'Siria Interna', 'siriaColiseum'),
(64, NULL, 1, 'Armenia', 'armeniaLegionary'),
(65, NULL, 3, 'Armenia  Interna', 'armeniaColiseum'),
(66, NULL, 1, 'Cappadocia', 'cappadociaLegionary'),
(67, 10, 2, 'Mare Tranquillum', 'cappadociaSea'),
(68, NULL, 3, 'Cappadocia Interna', 'cappadociaColiseum'),
(69, NULL, 1, 'Cipro', 'ciproLegionary'),
(70, 10, 2, 'Mare Tranquillum', 'ciproSeaWest'),
(71, 11, 2, 'Mare nativitate', 'ciproSeaEast'),
(72, NULL, 3, 'Cipro Interna', 'ciproColiseum'),
(73, NULL, 1, 'Cilicia', 'ciliciaLegionary'),
(74, 10, 2, 'Mare Tranquillum', 'ciliciaSeaWest'),
(75, 11, 2, 'Mare nativitate', 'ciliciaSeaEast'),
(76, NULL, 3, 'Cilicia Interna', 'ciliciaColiseum'),
(77, NULL, 1, 'Asia', 'asiaLegionary'),
(78, 11, 2, 'Mare nativitate', 'asiaSeaSouth'),
(79, 12, 2, 'Pontum', 'asiaSeaNorth'),
(80, NULL, 3, 'Asia Interna', 'asiaColiseum'),
(81, NULL, 1, 'Bitinia', 'bitiniaLegionary'),
(82, 12, 2, 'Pontum', 'bitiniaSeaSouth'),
(83, NULL, 3, 'Bitinia Interna', 'bitiniaColiseum'),
(84, NULL, 1, 'Ponto', 'pontoLegionary'),
(85, 12, 2, 'Pontum', 'pontoSea'),
(86, NULL, 3, 'Ponto Interna', 'pontoColiseum'),
(87, NULL, 1, 'Dacia', 'daciaLegionary'),
(88, 12, 2, 'Pontum', 'daciaSea'),
(89, NULL, 3, 'Dacia Interna', 'daciaColiseum'),
(90, NULL, 1, 'Mesia', 'mesiaLegionary'),
(91, 12, 2, 'Pontum', 'mesiaSea'),
(92, NULL, 3, 'Mesia Interna', 'mesiaColiseum'),
(93, NULL, 1, 'Tracia', 'traciaLegionary'),
(94, 12, 2, 'Pontum', 'traciaSeaNorth'),
(95, 11, 2, 'Mare nativitate', 'traciaSeaSouth'),
(96, NULL, 3, 'Tracia Interna', 'traciaColiseum'),
(97, NULL, 1, 'Macedonia', 'macedoniaLegionary'),
(98, 11, 2, 'Mare nativitate', 'macedoniaSea'),
(99, NULL, 3, 'Macedonia Interna', 'macedoniaColiseum'),
(100, NULL, 1, 'Acaia', 'acaiaLegionary'),
(101, 8, 2, 'Nec Mare', 'acaiaSeaNorth'),
(102, 11, 2, 'Mare nativitate', 'acaiaSeaSouth'),
(103, NULL, 3, 'Acaia Interna', 'acaiaColiseum'),
(104, NULL, 1, 'Epiro', 'epiroLegionary'),
(105, 8, 2, 'Nec Mare', 'epiroSeaNorth'),
(106, 11, 2, 'Mare nativitate', 'epiroSeaSouth'),
(107, NULL, 3, 'Epiro Interna', 'epiroColiseum'),
(108, NULL, 1, 'Illiria', 'illiriaLegionary'),
(109, 7, 2, 'Mare Adriaticum', 'illiriaSea'),
(110, NULL, 3, 'Illiria Interna', 'illiriaColiseum'),
(111, NULL, 1, 'Dalmazia', 'dalmaziaLegionary'),
(112, NULL, 3, 'Dalmazia Interna', 'dalmaziaColiseum'),
(113, NULL, 1, 'Pannonia', 'pannoniaLegionary'),
(114, NULL, 3, 'Pannonia Interna', 'pannoniaColiseum'),
(115, NULL, 1, 'Norico', 'noricoLegionary'),
(116, NULL, 3, 'Norico Interna', 'noricoColiseum'),
(117, NULL, 1, 'Rezia', 'reziaLegionary'),
(118, NULL, 3, 'Rezia Interna', 'reziaColiseum'),
(119, NULL, 1, 'Cisaplina', 'cisalpinaLegionary'),
(120, 5, 2, 'Insulis maris', 'cisalpinaSeaWest'),
(121, 6, 2, 'Italici maris', 'cisalpinaSeaSouth'),
(122, 7, 2, 'Mare Adriaticum', 'cisalpinaSeaEast'),
(123, NULL, 3, 'Cisaplina Interna', 'cisalpinaColiseum'),
(124, NULL, 1, 'Italia', 'italiaLegionary'),
(125, 6, 2, 'Italici maris', 'italiaSeaWest'),
(126, 8, 2, 'Nec Mare', 'italiaSeaSouth'),
(127, 7, 2, 'Mare Adriaticum', 'italiaSeaEast'),
(128, NULL, 3, 'Italia Interna', 'italiaColiseum'),
(129, NULL, 1, 'Sicilia', 'siciliaLegionary'),
(130, 6, 2, 'Italici maris', 'siciliaSeaNorth'),
(131, 9, 2, 'Tepida Maris', 'siciliaSeaSouth'),
(132, 8, 2, 'Nec Mare', 'siciliaSeaEast'),
(133, NULL, 3, 'Sicilia Interna', 'siciliaColiseum'),
(134, NULL, 1, 'Sardegna', 'sardegnaLegionary'),
(135, 5, 2, 'Insulis maris', 'sardegnaSeaNorth'),
(136, 4, 2, 'Mare Transeunt', 'sardegnaSeaWest'),
(137, 6, 2, 'Italici maris', 'sardegnaSeaEast'),
(138, NULL, 3, 'Sardegna Interna', 'sardegnaColiseum'),
(139, NULL, 1, 'Baleari', 'baleariLegionary'),
(140, 5, 2, 'Insulis maris', 'baleariSeaNorth'),
(141, 4, 2, 'Mare Transeunt', 'baleariSeaSouth'),
(142, NULL, 3, 'Baleari Interna', 'baleariColiseum'),
(143, NULL, 1, 'Corsica', 'corsicaLegionary'),
(144, 5, 2, 'Insulis maris', 'corsicaSeaWest'),
(145, 6, 2, 'Italici maris', 'corsicaSeaEast'),
(146, NULL, 3, 'Corsica Interna', 'corsicaColiseum'),
(147, NULL, 1, 'Narbonense', 'narbonenseLegionary'),
(148, 5, 2, 'Insulis maris', 'narbonenseSea'),
(149, NULL, 3, 'Narbonense Interna', 'narbonenseColiseum');

-- --------------------------------------------------------

--
-- Struttura della tabella `spq_risk_location_connection`
--

DROP TABLE IF EXISTS `spq_risk_location_connection`;
CREATE TABLE IF NOT EXISTS `spq_risk_location_connection` (
  `id_location` int(11) NOT NULL,
  `id_location_connected` int(11) NOT NULL,
  `connectio_type` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `spq_risk_turn_phase_name`
--

DROP TABLE IF EXISTS `spq_risk_turn_phase_name`;
CREATE TABLE IF NOT EXISTS `spq_risk_turn_phase_name` (
  `id_turn_phase` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `turn_phase_description` varchar(250) COLLATE utf8_bin NOT NULL,
  `turn_phase_summary` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_turn_phase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `spq_risk_turn_phase_name`
--

INSERT INTO `spq_risk_turn_phase_name` (`id_turn_phase`, `id_lang`, `turn_phase_description`, `turn_phase_summary`) VALUES
(1, 1, 'Conteggio Punti', 'Fase di calcolo eventuali punti guadagnati'),
(2, 1, 'Scambio Carte', 'E possibile barattare le proprie carte per ottenere rinforzi'),
(3, 1, 'Disposizione Rinfrorzi', 'E possibile disporre i riforzi base o quelli ottenuti dallo scambio delle carte'),
(4, 1, 'Smantellamento Navale', 'E possibile smantellare una nave per guadagnare due unit'),
(5, 1, 'Creazione Triremi', 'E possibile creare una triremi'),
(6, 1, 'Attacco Navale', 'E possibile effettuare uno o pi'),
(7, 1, 'Attacco via nave', 'E possibile attaccare tramite le navi una provincia toccata da una zona marittima'),
(8, 1, 'Attacco terrestre', 'E possibile attaccare normalmente via terra'),
(9, 1, 'Spostamento Strategico', 'E possibile effettuare un solo spostamento strategico'),
(10, 1, 'Acquisto carta', 'E possibile acquisire la carta se si ');

-- --------------------------------------------------------

--
-- Struttura della tabella `spq_risk_unit_disposition`
--

DROP TABLE IF EXISTS `spq_risk_unit_disposition`;
CREATE TABLE IF NOT EXISTS `spq_risk_unit_disposition` (
  `id_game` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_location` int(11) NOT NULL,
  `unit_disposition_legionary` tinyint(4) NOT NULL,
  `unit_disposition_ship` tinyint(4) NOT NULL,
  `unit_disposition_coliseum` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `spq_risk_user`
--

DROP TABLE IF EXISTS `spq_risk_user`;
CREATE TABLE IF NOT EXISTS `spq_risk_user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(250) COLLATE utf8_bin NOT NULL,
  `user_password` varchar(250) COLLATE utf8_bin NOT NULL,
  `user_rank` int(11) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `spq_risk_user_cards`
--

DROP TABLE IF EXISTS `spq_risk_user_cards`;
CREATE TABLE IF NOT EXISTS `spq_risk_user_cards` (
  `id_game` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_card` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `spq_risk_user_stats`
--

DROP TABLE IF EXISTS `spq_risk_user_stats`;
CREATE TABLE IF NOT EXISTS `spq_risk_user_stats` (
  `id_user` int(11) NOT NULL,
  `user_stats_played_games` int(11) NOT NULL,
  `user_stats_won_games` int(11) NOT NULL,
  `user_stats_lost_games` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
