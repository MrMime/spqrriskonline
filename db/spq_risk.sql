-- phpMyAdmin SQL Dump
-- version 3.5.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generato il: Ott 08, 2014 alle 17:38
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
  `id_user_current_turn` int(11) DEFAULT NULL,
  `game_max_point` int(11) NOT NULL,
  `game_turn_number` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `id_user_winner` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_game`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=335 ;

--
-- Dump dei dati per la tabella `spq_risk_game`
--

INSERT INTO `spq_risk_game` (`id_game`, `game_name`, `game_creation_date`, `id_user_current_turn`, `game_max_point`, `game_turn_number`, `id_lang`, `id_user_winner`) VALUES
(334, 'Test 1', '2014-09-26', 1, 25, 1, 1, NULL);

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
-- Struttura della tabella `spq_risk_game_phase`
--

DROP TABLE IF EXISTS `spq_risk_game_phase`;
CREATE TABLE IF NOT EXISTS `spq_risk_game_phase` (
  `id_game` int(11) NOT NULL,
  `id_game_phase` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `spq_risk_game_phase_name`
--

DROP TABLE IF EXISTS `spq_risk_game_phase_name`;
CREATE TABLE IF NOT EXISTS `spq_risk_game_phase_name` (
  `id_game_phase` tinyint(4) NOT NULL,
  `id_lang` tinyint(4) NOT NULL,
  `game_phase_description` varchar(250) COLLATE utf8_bin NOT NULL,
  `game_phase_summary` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_game_phase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `spq_risk_game_phase_name`
--

INSERT INTO `spq_risk_game_phase_name` (`id_game_phase`, `id_lang`, `game_phase_description`, `game_phase_summary`) VALUES
(1, 1, 'Creazione Partita', 'Creazione dei dati della partita'),
(2, 1, 'Disposizione iniziale delle unita''', 'Disposizione ciclica delle unità'),
(3, 1, 'Fase di gioco giocatori', 'Fase principale di gioco'),
(4, 1, 'Terminazione partita', 'Partita completata');

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
-- Struttura della tabella `spq_risk_game_turn_phase`
--

DROP TABLE IF EXISTS `spq_risk_game_turn_phase`;
CREATE TABLE IF NOT EXISTS `spq_risk_game_turn_phase` (
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
  `id_color` int(11) NOT NULL,
  PRIMARY KEY (`id_game`,`id_user`),
  UNIQUE KEY `id_game` (`id_game`,`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `spq_risk_game_user`
--

INSERT INTO `spq_risk_game_user` (`id_game`, `id_user`, `id_color`) VALUES
(334, 1001, 1),
(334, 1200, 2),
(334, 3900, 3);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4504 ;

--
-- Dump dei dati per la tabella `spq_risk_location`
--

INSERT INTO `spq_risk_location` (`id_location`, `id_location_group`, `location_type`, `location_name`, `location_label`) VALUES
(100, NULL, 1, 'Britannia', 'britanniaLegionary'),
(101, NULL, 3, 'Britannia Interna', 'britanniaColiseum'),
(102, 1, 2, 'Britannia Mare', 'britanniaSeaMareSeptemtrio'),
(200, NULL, 1, 'Germania Inferiore', 'germanLegionary'),
(201, NULL, 3, 'Germania Inferiore Interna', 'germanColiseum'),
(202, 1, 2, 'Germania Inferiore Mare', 'germanSeaMareSeptemtrio'),
(300, NULL, 1, 'Belgica', 'belgicaLegionary'),
(301, NULL, 3, 'Belgica Interna', 'belgicaColiseum'),
(302, 1, 2, 'Belgica Mare', 'belgicaSeaMareSeptemtrio'),
(400, NULL, 1, 'Ludgunense', 'ludgunenseLegionary'),
(401, NULL, 3, 'Ludgunense Interna', 'ludgunenseColiseum'),
(402, 1, 2, 'Ludgunense Mare', 'ludgunenseSeaMareSeptemtrio'),
(403, 2, 2, 'Ludgunense Mare', 'ludgunenseSeaMareAtlantic'),
(500, NULL, 1, 'Acquitania', 'aquitaniaLegionary'),
(501, NULL, 3, 'Acquitania Interna', 'aquitaniaColiseum'),
(502, 2, 2, 'Acquitania Mare', 'aquitaniaSeaMareAtlantic'),
(600, NULL, 1, 'Terraconense', 'terraconenseLegionary'),
(601, NULL, 3, 'Terraconense Interna', 'terraconenseColiseum'),
(602, 5, 2, 'Terraconense Mare', 'terraconenseSeaMareInsulis'),
(603, 4, 2, 'Terraconense Mare', 'terraconenseSeaMareTranseunt'),
(604, 2, 2, 'Terraconense Mare', 'terraconenseSeaMareAtlantic'),
(700, NULL, 1, 'Galicia', 'galiciaLegionary'),
(701, NULL, 3, 'Galicia Interna', 'galiciaColiseum'),
(702, 2, 2, 'Galicia Mare', 'galiciaSeaMareAtlantic'),
(800, NULL, 1, 'Luisiania', 'luisitaniaLegionary'),
(801, NULL, 3, 'Luisiania Interna', 'luisitaniaColiseum'),
(802, 2, 2, 'Luisiania Mare', 'luisitaniaSeaMareAtlantic'),
(803, 3, 2, 'Luisiania Mare', 'luisitaniaSeaMareHerculis'),
(900, NULL, 1, 'Betica', 'beticaLegionary'),
(901, NULL, 3, 'Betica Interna', 'beticaColiseum'),
(902, 3, 2, 'Betica Mare', 'beticaSeaMareHerculis'),
(904, 4, 2, 'Betica Mare', 'beticaSeaMareTranseunt'),
(1000, NULL, 1, 'Mauretania', 'mauretaniaLegionary'),
(1001, NULL, 3, 'Mauretania Interna', 'mauretaniaColiseum'),
(1002, 3, 2, 'Mauretania Mare', 'mauretaniaSeaMareHerculis'),
(1003, 4, 2, 'Mauretania Mare', 'mauretaniaSeaMareTranseunt'),
(1100, NULL, 1, 'Numidia', 'numidiaLegionary'),
(1101, NULL, 3, 'Numidia Interna', 'numidiaColiseum'),
(1102, 4, 2, 'Numidia Mare', 'numidiaSeaMareTranseunt'),
(1103, 7, 2, 'Mauretania Mare', 'numidiaSeaMareTepida'),
(1200, NULL, 1, 'Aprica', 'apricaLegionary'),
(1201, NULL, 3, 'Aprica Interna', 'apricaColiseum'),
(1202, 4, 2, 'Aprica Mare', 'apricaSeaMareTranseunt'),
(1203, 6, 2, 'Aprica Mare', 'apricaSeaMareItalici'),
(1204, 7, 2, 'Aprica Mare', 'apricaSeaMareTepida'),
(1300, NULL, 1, 'Cirenaica', 'cirenaicaLegionary'),
(1301, NULL, 3, 'Cirenaica Interna', 'cirenaicaColiseum'),
(1302, 7, 2, 'Cirenaica Mare', 'cirenaicaSeaMareTepida'),
(1303, 8, 2, 'Cirenaica Mare', 'cirenaicaSeaMareNec'),
(1304, 10, 2, 'Cirenaica Mare', 'cirenaicaSeaMareTranquillum'),
(1400, NULL, 1, 'Egitto', 'egittoLegionary'),
(1401, NULL, 3, 'Egitto Interna', 'egittoColiseum'),
(1402, 10, 2, 'Egitto Mare', 'egittoSeaMareTranquillum'),
(1500, NULL, 1, 'Giudea', 'giudeaLegionary'),
(1501, NULL, 3, 'Giudea Interna', 'giudeaColiseum'),
(1502, 10, 2, 'Giudea Mare', 'giudeaSeaMareTranquillum'),
(1600, NULL, 1, 'Arabia', 'arabiaLegionary'),
(1601, NULL, 3, 'Arabia Interna', 'arabiaColiseum'),
(1700, NULL, 1, 'Siria', 'siriaLegionary'),
(1701, NULL, 3, 'Siria Interna', 'siriaColiseum'),
(1702, 10, 2, 'Siria Mare', 'siriaSeaMareTranquillum'),
(1800, NULL, 1, 'Mesopotamia', 'mesopotamiaLegionary'),
(1801, NULL, 3, 'Mesopotamia Interna', 'mesopotamiaColiseum'),
(1900, NULL, 1, 'Armenia', 'armeniaLegionary'),
(1901, NULL, 3, 'Armenia Interna', 'armeniaColiseum'),
(2000, NULL, 1, 'Cappadocia', 'cappadociaLegionary'),
(2001, NULL, 3, 'Cappadocia Interna', 'cappadociaColiseum'),
(2002, 10, 2, 'Cappadocia Mare', 'cappadociaSeaMareTranquillum'),
(2100, NULL, 1, 'Ponto', 'pontoLegionary'),
(2101, NULL, 3, 'Ponto Interna', 'pontoColiseum'),
(2102, 12, 2, 'Ponto Mare', 'pontoSeaMarePontum'),
(2200, NULL, 1, 'Bitinia', 'bitiniaLegionary'),
(2201, NULL, 3, 'Bitinia Interna', 'bitiniaColiseum'),
(2202, 12, 2, 'Bitinia Mare', 'bitiniaSeaMarePontum'),
(2300, NULL, 1, 'Galazia', 'galaziaLegionary'),
(2301, NULL, 3, 'Galazia Interna', 'galaziaColiseum'),
(2400, NULL, 1, 'Cilicia', 'ciliciaLegionary'),
(2401, NULL, 3, 'Cilicia Interna', 'ciliciaColiseum'),
(2402, 10, 2, 'Cilicia Mare', 'ciliciaSeaMareTranquillum'),
(2403, 11, 2, 'Cilicia Mare', 'ciliciaSeaMareNativitate'),
(2500, NULL, 1, 'Asia', 'asiaLegionary'),
(2501, NULL, 3, 'Asia Interna', 'asiaColiseum'),
(2502, 11, 2, 'Asia Mare', 'asiaSeaMareNativitate'),
(2503, 12, 2, 'Asia Mare', 'asiaSeaMarePontum'),
(2600, NULL, 1, 'Cipro', 'ciproLegionary'),
(2601, NULL, 3, 'Cipro Interna', 'ciproColiseum'),
(2602, 10, 2, 'Cipro Mare', 'ciproSeaMareTranquillum'),
(2603, 11, 2, 'Cipro Mare', 'ciproSeaMareNativitate'),
(2700, NULL, 1, 'Creta', 'cretaLegionary'),
(2701, NULL, 3, 'Creta Interna', 'cretaColiseum'),
(2702, 8, 2, 'Creta Mare', 'cretaSeaMareNec'),
(2703, 10, 2, 'Creta Mare', 'cretaSeaMareTranquillum'),
(2704, 11, 2, 'Creta Mare', 'cretaSeaMareNativitate'),
(2800, NULL, 1, 'Acaia', 'acaiaLegionary'),
(2801, NULL, 3, 'Acaia Interna', 'acaiaColiseum'),
(2802, 11, 2, 'Acaia Mare', 'acaiaSeaMareNativitate'),
(2803, 8, 2, 'Acaia Mare', 'acaiaSeaMareNec'),
(2900, NULL, 1, 'Epiro', 'epiroLegionary'),
(2901, NULL, 3, 'Epiro Interna', 'epiroColiseum'),
(2902, 8, 2, 'Epiro Mare', 'epiroSeaMareNec'),
(2903, 9, 2, 'Epiro Mare', 'epiroSeaMareAdriaticum'),
(3000, NULL, 1, 'Macedonia', 'macedoniaLegionary'),
(3001, NULL, 3, 'Macedonia Interna', 'macedoniaColiseum'),
(3002, 11, 2, 'Macedonia Mare', 'macedoniaSeaMareNativitate'),
(3100, NULL, 1, 'Tracia', 'traciaLegionary'),
(3101, NULL, 3, 'Tracia Interna', 'traciaColiseum'),
(3102, 12, 2, 'Tracia Mare', 'traciaSeaMarePontum'),
(3103, 11, 2, 'Tracia Mare', 'traciaSeaMareNativitate'),
(3200, NULL, 1, 'Mesia', 'mesiaLegionary'),
(3201, NULL, 3, 'Mesia Interna', 'mesiaColiseum'),
(3202, 12, 2, 'Mesia Mare', 'mesiaSeaMarePontum'),
(3300, NULL, 1, 'Dacia', 'daciaLegionary'),
(3301, NULL, 3, 'Dacia Interna', 'daciaColiseum'),
(3302, 12, 2, 'Dacia Mare', 'daciaSeaMarePontum'),
(3400, NULL, 1, 'Pannonia', 'pannoniaLegionary'),
(3401, NULL, 3, 'Pannonia Interna', 'pannoniaColiseum'),
(3500, NULL, 1, 'Dalmazia', 'dalmaziaLegionary'),
(3501, NULL, 3, 'Dalmazia Interna', 'dalmaziaColiseum'),
(3600, NULL, 1, 'Illiria', 'illiriaLegionary'),
(3601, NULL, 3, 'Illiria Interna', 'illiriaColiseum'),
(3602, 9, 2, 'Illiria Mare', 'illiriaSeaMareAdriaticum'),
(3700, NULL, 1, 'Norico', 'noricoLegionary'),
(3701, NULL, 3, 'Norico Interna', 'noricoColiseum'),
(3800, NULL, 1, 'Rezia', 'reziaLegionary'),
(3801, NULL, 3, 'Rezia Interna', 'reziaColiseum'),
(3900, NULL, 1, 'Cisaplina', 'cisalpinaLegionary'),
(3901, NULL, 3, 'Cisaplina Interna', 'cisalpinaColiseum'),
(3902, 5, 2, 'Cisaplina Mare', 'cisalpinaSeaMareInsulis'),
(3903, 9, 2, 'Cisaplina Mare', 'cisalpinaSeaMareAdriaticum'),
(3904, 6, 2, 'Cisaplina Mare', 'cisalpinaSeaMareItalici'),
(4000, NULL, 1, 'Italia', 'italiaLegionary'),
(4001, NULL, 3, 'Italia Interna', 'italiaColiseum'),
(4002, 9, 2, 'Italia Mare', 'italiaSeaMareAdriaticum'),
(4003, 8, 2, 'Italia Mare', 'italiaSeaMareNec'),
(4004, 6, 2, 'Italia Mare', 'italiaSeaMareItalici'),
(4100, NULL, 1, 'Sicilia', 'siciliaLegionary'),
(4101, NULL, 3, 'Sicilia Interna', 'siciliaColiseum'),
(4102, 6, 2, 'Sicilia Mare', 'siciliaSeaMareItalici'),
(4103, 7, 2, 'Sicilia Mare', 'siciliaSeaMareTepida'),
(4104, 8, 2, 'Sicilia Mare', 'siciliaSeaMareNec'),
(4200, NULL, 1, 'Sardegna', 'sardegnaLegionary'),
(4201, NULL, 3, 'Sardegna Interna', 'sardegnaColiseum'),
(4202, 6, 2, 'Sardegna Mare', 'sardegnaSeaMareItalici'),
(4203, 5, 2, 'Sardegna Mare', 'sardegnaSeaMareInsulis'),
(4204, 4, 2, 'Sardegna Mare', 'sardegnaSeaMareTranseunt'),
(4300, NULL, 1, 'Corsica', 'corsicaLegionary'),
(4301, NULL, 3, 'Corsica Interna', 'corsicaColiseum'),
(4302, 5, 2, 'Corsica Mare', 'corsicaSeaMareInsulis'),
(4303, 6, 2, 'Corsica Mare', 'corsicaSeaMareItalici'),
(4400, NULL, 1, 'Narbonense', 'narbonenseLegionary'),
(4401, NULL, 3, 'Narbonense Interna', 'narbonenseColiseum'),
(4402, 5, 2, 'Narbonense Mare', 'narbonenseSeaMareInsulis'),
(4500, NULL, 1, 'Baleari', 'baleariLegionary'),
(4501, NULL, 3, 'Baleari Interna', 'baleariColiseum'),
(4502, 5, 2, 'Baleari Mare', 'baleariSeaMareInsulis'),
(4503, 4, 2, 'Baleari Mare', 'baleariSeaMareTranseunt');

-- --------------------------------------------------------

--
-- Struttura della tabella `spq_risk_location_connection`
--

DROP TABLE IF EXISTS `spq_risk_location_connection`;
CREATE TABLE IF NOT EXISTS `spq_risk_location_connection` (
  `id_location` int(11) NOT NULL,
  `id_location_connected` int(11) NOT NULL,
  `connection_type` tinyint(4) NOT NULL,
  `id_sea_location` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `spq_risk_location_connection`
--

INSERT INTO `spq_risk_location_connection` (`id_location`, `id_location_connected`, `connection_type`, `id_sea_location`) VALUES
(100, 200, 2, 1),
(100, 300, 2, 1),
(100, 400, 2, 1),
(200, 100, 2, 1),
(200, 300, 2, 1),
(200, 400, 2, 1),
(300, 100, 2, 1),
(300, 200, 2, 1),
(300, 400, 2, 1),
(400, 100, 2, 1),
(400, 200, 2, 1),
(400, 300, 2, 1),
(400, 500, 2, 2),
(400, 600, 2, 2),
(400, 700, 2, 2),
(400, 800, 2, 2),
(500, 400, 2, 2),
(500, 600, 2, 2),
(500, 700, 2, 2),
(500, 800, 2, 2),
(600, 400, 2, 2),
(600, 500, 2, 2),
(600, 700, 2, 2),
(600, 800, 2, 2),
(700, 400, 2, 2),
(700, 500, 2, 2),
(700, 600, 2, 2),
(700, 800, 2, 2),
(800, 400, 2, 2),
(800, 500, 2, 2),
(800, 600, 2, 2),
(800, 700, 2, 2),
(800, 900, 2, 3),
(800, 1000, 2, 3),
(900, 800, 2, 3),
(900, 1000, 2, 3),
(1000, 800, 2, 3),
(1000, 900, 2, 3),
(900, 1000, 2, 4),
(900, 1100, 2, 4),
(900, 1200, 2, 4),
(900, 4200, 2, 4),
(900, 4500, 2, 4),
(900, 600, 2, 4),
(1000, 900, 2, 4),
(1000, 1100, 2, 4),
(1000, 1200, 2, 4),
(1000, 4200, 2, 4),
(1000, 4500, 2, 4),
(1000, 600, 2, 4),
(1100, 900, 2, 4),
(1100, 1000, 2, 4),
(1100, 1200, 2, 4),
(1100, 4200, 2, 4),
(1100, 4500, 2, 4),
(1100, 600, 2, 4),
(1200, 900, 2, 4),
(1200, 1000, 2, 4),
(1200, 1100, 2, 4),
(1200, 4200, 2, 4),
(1200, 4500, 2, 4),
(1200, 600, 2, 4),
(4200, 900, 2, 4),
(4200, 1000, 2, 4),
(4200, 1100, 2, 4),
(4200, 1200, 2, 4),
(4200, 4500, 2, 4),
(4200, 600, 2, 4),
(4500, 900, 2, 4),
(4500, 1000, 2, 4),
(4500, 1100, 2, 4),
(4500, 1200, 2, 4),
(4500, 4200, 2, 4),
(4500, 600, 2, 4),
(600, 900, 2, 4),
(600, 1000, 2, 4),
(600, 1100, 2, 4),
(600, 1200, 2, 4),
(600, 4200, 2, 4),
(600, 4500, 2, 4),
(600, 4500, 2, 5),
(600, 4300, 2, 5),
(600, 4400, 2, 5),
(600, 3900, 2, 5),
(600, 4200, 2, 5),
(4500, 600, 2, 5),
(4500, 4300, 2, 5),
(4500, 4400, 2, 5),
(4500, 3900, 2, 5),
(4500, 4200, 2, 5),
(4300, 600, 2, 5),
(4300, 4500, 2, 5),
(4300, 4400, 2, 5),
(4300, 3900, 2, 5),
(4300, 4200, 2, 5),
(4400, 600, 2, 5),
(4400, 4500, 2, 5),
(4400, 4300, 2, 5),
(4400, 3900, 2, 5),
(4400, 4200, 2, 5),
(3900, 600, 2, 5),
(3900, 4500, 2, 5),
(3900, 4300, 2, 5),
(3900, 4400, 2, 5),
(3900, 4200, 2, 5),
(4200, 600, 2, 5),
(4200, 4500, 2, 5),
(4200, 4300, 2, 5),
(4200, 4400, 2, 5),
(4200, 3900, 2, 5),
(4000, 4300, 2, 6),
(4000, 4200, 2, 6),
(4000, 4100, 2, 6),
(4000, 1200, 2, 6),
(4300, 4000, 2, 6),
(4300, 4200, 2, 6),
(4300, 4100, 2, 6),
(4300, 1200, 2, 6),
(4200, 4000, 2, 6),
(4200, 4300, 2, 6),
(4200, 4100, 2, 6),
(4200, 1200, 2, 6),
(4100, 4000, 2, 6),
(4100, 4300, 2, 6),
(4100, 4200, 2, 6),
(4100, 1200, 2, 6),
(1200, 4000, 2, 6),
(1200, 4300, 2, 6),
(1200, 4200, 2, 6),
(1200, 4100, 2, 6),
(1200, 1100, 2, 7),
(1200, 1300, 2, 7),
(1200, 4100, 2, 7),
(1100, 1200, 2, 7),
(1100, 1300, 2, 7),
(1100, 4100, 2, 7),
(1300, 1200, 2, 7),
(1300, 1100, 2, 7),
(1300, 4100, 2, 7),
(4100, 1200, 2, 7),
(4100, 1100, 2, 7),
(4100, 1300, 2, 7),
(1300, 2700, 2, 8),
(1300, 2800, 2, 8),
(1300, 2900, 2, 8),
(1300, 4000, 2, 8),
(1300, 4100, 2, 8),
(2700, 1300, 2, 8),
(2700, 2800, 2, 8),
(2700, 2900, 2, 8),
(2700, 4000, 2, 8),
(2700, 4100, 2, 8),
(2800, 1300, 2, 8),
(2800, 2700, 2, 8),
(2800, 2900, 2, 8),
(2800, 4000, 2, 8),
(2800, 4100, 2, 8),
(2900, 1300, 2, 8),
(2900, 2700, 2, 8),
(2900, 2800, 2, 8),
(2900, 4000, 2, 8),
(2900, 4100, 2, 8),
(4000, 1300, 2, 8),
(4000, 2700, 2, 8),
(4000, 2800, 2, 8),
(4000, 2900, 2, 8),
(4000, 4100, 2, 8),
(4100, 1300, 2, 8),
(4100, 2700, 2, 8),
(4100, 2800, 2, 8),
(4100, 2900, 2, 8),
(4100, 4000, 2, 8),
(3900, 4000, 2, 9),
(3900, 3600, 2, 9),
(3900, 2900, 2, 9),
(4000, 3900, 2, 9),
(4000, 3600, 2, 9),
(4000, 2900, 2, 9),
(3600, 3900, 2, 9),
(3600, 4000, 2, 9),
(3600, 2900, 2, 9),
(2900, 3900, 2, 9),
(2900, 4000, 2, 9),
(2900, 3600, 2, 9),
(1300, 1400, 2, 10),
(1300, 1500, 2, 10),
(1300, 1700, 2, 10),
(1300, 2000, 2, 10),
(1300, 2400, 2, 10),
(1300, 2600, 2, 10),
(1300, 2700, 2, 10),
(1400, 1300, 2, 10),
(1400, 1500, 2, 10),
(1400, 1700, 2, 10),
(1400, 2000, 2, 10),
(1400, 2400, 2, 10),
(1400, 2600, 2, 10),
(1400, 2700, 2, 10),
(1500, 1300, 2, 10),
(1500, 1400, 2, 10),
(1500, 1700, 2, 10),
(1500, 2000, 2, 10),
(1500, 2400, 2, 10),
(1500, 2600, 2, 10),
(1500, 2700, 2, 10),
(1700, 1300, 2, 10),
(1700, 1400, 2, 10),
(1700, 1500, 2, 10),
(1700, 2000, 2, 10),
(1700, 2400, 2, 10),
(1700, 2600, 2, 10),
(1700, 2700, 2, 10),
(2000, 1300, 2, 10),
(2000, 1400, 2, 10),
(2000, 1500, 2, 10),
(2000, 1700, 2, 10),
(2000, 2400, 2, 10),
(2000, 2600, 2, 10),
(2000, 2700, 2, 10),
(2400, 1300, 2, 10),
(2400, 1400, 2, 10),
(2400, 1500, 2, 10),
(2400, 1700, 2, 10),
(2400, 2000, 2, 10),
(2400, 2600, 2, 10),
(2400, 2700, 2, 10),
(2600, 1300, 2, 10),
(2600, 1400, 2, 10),
(2600, 1500, 2, 10),
(2600, 1700, 2, 10),
(2600, 2000, 2, 10),
(2600, 2400, 2, 10),
(2600, 2700, 2, 10),
(2700, 1300, 2, 10),
(2700, 1400, 2, 10),
(2700, 1500, 2, 10),
(2700, 1700, 2, 10),
(2700, 2000, 2, 10),
(2700, 2400, 2, 10),
(2700, 2600, 2, 10),
(2600, 2400, 2, 11),
(2600, 2500, 2, 11),
(2600, 2700, 2, 11),
(2600, 2800, 2, 11),
(2600, 3000, 2, 11),
(2600, 3100, 2, 11),
(2400, 2600, 2, 11),
(2400, 2500, 2, 11),
(2400, 2700, 2, 11),
(2400, 2800, 2, 11),
(2400, 3000, 2, 11),
(2400, 3100, 2, 11),
(2500, 2600, 2, 11),
(2500, 2400, 2, 11),
(2500, 2700, 2, 11),
(2500, 2800, 2, 11),
(2500, 3000, 2, 11),
(2500, 3100, 2, 11),
(2700, 2600, 2, 11),
(2700, 2400, 2, 11),
(2700, 2500, 2, 11),
(2700, 2800, 2, 11),
(2700, 3000, 2, 11),
(2700, 3100, 2, 11),
(2800, 2600, 2, 11),
(2800, 2400, 2, 11),
(2800, 2500, 2, 11),
(2800, 2700, 2, 11),
(2800, 3000, 2, 11),
(2800, 3100, 2, 11),
(3000, 2600, 2, 11),
(3000, 2400, 2, 11),
(3000, 2500, 2, 11),
(3000, 2700, 2, 11),
(3000, 2800, 2, 11),
(3000, 3100, 2, 11),
(3100, 2600, 2, 11),
(3100, 2400, 2, 11),
(3100, 2500, 2, 11),
(3100, 2700, 2, 11),
(3100, 2800, 2, 11),
(3100, 3000, 2, 11),
(3300, 3200, 2, 12),
(3300, 3100, 2, 12),
(3300, 2500, 2, 12),
(3300, 2200, 2, 12),
(3300, 2100, 2, 12),
(3200, 3300, 2, 12),
(3200, 3100, 2, 12),
(3200, 2500, 2, 12),
(3200, 2200, 2, 12),
(3200, 2100, 2, 12),
(3100, 3300, 2, 12),
(3100, 3200, 2, 12),
(3100, 2500, 2, 12),
(3100, 2200, 2, 12),
(3100, 2100, 2, 12),
(2500, 3300, 2, 12),
(2500, 3200, 2, 12),
(2500, 3100, 2, 12),
(2500, 2200, 2, 12),
(2500, 2100, 2, 12),
(2200, 3300, 2, 12),
(2200, 3200, 2, 12),
(2200, 3100, 2, 12),
(2200, 2500, 2, 12),
(2200, 2100, 2, 12),
(2100, 3300, 2, 12),
(2100, 3200, 2, 12),
(2100, 3100, 2, 12),
(2100, 2500, 2, 12),
(2100, 2200, 2, 12),
(200, 300, 1, NULL),
(200, 3800, 1, NULL),
(300, 200, 1, NULL),
(300, 3800, 1, NULL),
(300, 400, 1, NULL),
(400, 300, 1, NULL),
(400, 500, 1, NULL),
(400, 4400, 1, NULL),
(400, 3900, 1, NULL),
(400, 3800, 1, NULL),
(500, 400, 1, NULL),
(500, 4400, 1, NULL),
(500, 600, 1, NULL),
(600, 500, 1, NULL),
(600, 4400, 1, NULL),
(600, 700, 1, NULL),
(600, 800, 1, NULL),
(600, 900, 1, NULL),
(700, 600, 1, NULL),
(700, 800, 1, NULL),
(700, 900, 1, NULL),
(800, 700, 1, NULL),
(800, 600, 1, NULL),
(800, 900, 1, NULL),
(900, 800, 1, NULL),
(900, 600, 1, NULL),
(1000, 1100, 1, NULL),
(1100, 1000, 1, NULL),
(1100, 1200, 1, NULL),
(1100, 1300, 1, NULL),
(1200, 1100, 1, NULL),
(1300, 1100, 1, NULL),
(1300, 1400, 1, NULL),
(1400, 1300, 1, NULL),
(1400, 1500, 1, NULL),
(1500, 1600, 1, NULL),
(1500, 1700, 1, NULL),
(1500, 1800, 1, NULL),
(1600, 1500, 1, NULL),
(1600, 1800, 1, NULL),
(1700, 1500, 1, NULL),
(1700, 1800, 1, NULL),
(1700, 2000, 1, NULL),
(1800, 1500, 1, NULL),
(1800, 1600, 1, NULL),
(1800, 1700, 1, NULL),
(1800, 1900, 1, NULL),
(1800, 2000, 1, NULL),
(1900, 1800, 1, NULL),
(1900, 2000, 1, NULL),
(1900, 2100, 1, NULL),
(2000, 1700, 1, NULL),
(2000, 1900, 1, NULL),
(2000, 2100, 1, NULL),
(2000, 2200, 1, NULL),
(2000, 2300, 1, NULL),
(2000, 2400, 1, NULL),
(2100, 2000, 1, NULL),
(2100, 2200, 1, NULL),
(2100, 1900, 1, NULL),
(2200, 2000, 1, NULL),
(2200, 2100, 1, NULL),
(2200, 2300, 1, NULL),
(2200, 2500, 1, NULL),
(2300, 2200, 1, NULL),
(2300, 2000, 1, NULL),
(2300, 2400, 1, NULL),
(2300, 2500, 1, NULL),
(2400, 2500, 1, NULL),
(2400, 2300, 1, NULL),
(2400, 2000, 1, NULL),
(2500, 2200, 1, NULL),
(2500, 2300, 1, NULL),
(2500, 2400, 1, NULL),
(2800, 2900, 1, NULL),
(2800, 3000, 1, NULL),
(2900, 3000, 1, NULL),
(2900, 2800, 1, NULL),
(2900, 3600, 1, NULL),
(3000, 2800, 1, NULL),
(3000, 2900, 1, NULL),
(3000, 3100, 1, NULL),
(3000, 3500, 1, NULL),
(3000, 3600, 1, NULL),
(3100, 3200, 1, NULL),
(3100, 3000, 1, NULL),
(3100, 3500, 1, NULL),
(3100, 3400, 1, NULL),
(3200, 3100, 1, NULL),
(3200, 3400, 1, NULL),
(3200, 3300, 1, NULL),
(3300, 3200, 1, NULL),
(3300, 3400, 1, NULL),
(3400, 3300, 1, NULL),
(3400, 3200, 1, NULL),
(3400, 3100, 1, NULL),
(3400, 3500, 1, NULL),
(3400, 3700, 1, NULL),
(3500, 3400, 1, NULL),
(3500, 3100, 1, NULL),
(3500, 3000, 1, NULL),
(3500, 3600, 1, NULL),
(3500, 3700, 1, NULL),
(3600, 2900, 1, NULL),
(3600, 3500, 1, NULL),
(3600, 3000, 1, NULL),
(3600, 3700, 1, NULL),
(3600, 3900, 1, NULL),
(3700, 3400, 1, NULL),
(3700, 3500, 1, NULL),
(3700, 3600, 1, NULL),
(3700, 3800, 1, NULL),
(3700, 3900, 1, NULL),
(3800, 3700, 1, NULL),
(3800, 3900, 1, NULL),
(3800, 200, 1, NULL),
(3800, 300, 1, NULL),
(3800, 400, 1, NULL),
(3900, 4400, 1, NULL),
(3900, 400, 1, NULL),
(3900, 3800, 1, NULL),
(3900, 3700, 1, NULL),
(3900, 3600, 1, NULL),
(4000, 3900, 1, NULL),
(4400, 400, 1, NULL),
(4400, 500, 1, NULL),
(4400, 600, 1, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `spq_risk_sea_location`
--

DROP TABLE IF EXISTS `spq_risk_sea_location`;
CREATE TABLE IF NOT EXISTS `spq_risk_sea_location` (
  `id_sea_location` int(11) NOT NULL,
  `id_sea_location_description` varchar(150) COLLATE utf8_bin NOT NULL,
  `id_sea_location_label` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_sea_location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `spq_risk_sea_location`
--

INSERT INTO `spq_risk_sea_location` (`id_sea_location`, `id_sea_location_description`, `id_sea_location_label`) VALUES
(1, 'Mare Septemtrio', 'mareSeptemtrio'),
(2, 'Mare Atlantic', 'mareAtlantic'),
(3, 'Mare Herculis', 'mareHerculis'),
(4, 'Mare Transeunt', 'mareTranseunt'),
(5, 'Insulis maris', 'mareInsulis'),
(6, 'Italici maris', 'mareItalici'),
(7, 'Tepida Maris', 'mareTepida'),
(8, 'Nec Mare', 'mareNec'),
(9, 'Mare Adriaticum', 'mareAdriaticum'),
(10, 'Mare Tranquillum', 'mareTranquillum'),
(11, 'Mare nativitate', 'mareNativitate'),
(12, 'Mare Pontum', 'marePontum');

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
  `units` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id_game`,`id_user`,`id_location`),
  KEY `id_user` (`id_user`),
  KEY `id_location` (`id_location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `spq_risk_unit_disposition`
--

INSERT INTO `spq_risk_unit_disposition` (`id_game`, `id_user`, `id_location`, `units`) VALUES
(334, 1001, 100, 3),
(334, 1001, 200, 2),
(334, 1001, 300, 3),
(334, 1001, 1000, 3),
(334, 1001, 1100, 1),
(334, 1001, 1200, 2),
(334, 1001, 1700, 3),
(334, 1001, 2000, 5),
(334, 1001, 2400, 6),
(334, 1001, 3700, 6),
(334, 1001, 3800, 5),
(334, 1001, 4000, 6),
(334, 1001, 4100, 2),
(334, 1200, 700, 3),
(334, 1200, 800, 2),
(334, 1200, 2100, 4),
(334, 1200, 2200, 3),
(334, 1200, 2300, 3),
(334, 1200, 2500, 3),
(334, 1200, 2600, 3),
(334, 1200, 2700, 4),
(334, 1200, 2800, 10),
(334, 1200, 2900, 9),
(334, 1200, 3000, 8),
(334, 1200, 3100, 7),
(334, 1200, 3200, 6),
(334, 1200, 3300, 5),
(334, 1200, 3400, 4),
(334, 1200, 3500, 4),
(334, 1200, 3600, 3),
(334, 1200, 3900, 3),
(334, 3900, 400, 3),
(334, 3900, 500, 2),
(334, 3900, 600, 1),
(334, 3900, 900, 3),
(334, 3900, 1300, 5),
(334, 3900, 1400, 5),
(334, 3900, 1500, 5),
(334, 3900, 1600, 5),
(334, 3900, 1800, 5),
(334, 3900, 1900, 5),
(334, 3900, 4200, 5),
(334, 3900, 4300, 4),
(334, 3900, 4400, 1),
(334, 3900, 4500, 4);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3901 ;

--
-- Dump dei dati per la tabella `spq_risk_user`
--

INSERT INTO `spq_risk_user` (`id_user`, `user_name`, `user_password`, `user_rank`) VALUES
(1001, 'MrMime', 'ciao', 1),
(1200, 'andry', 'eqewq', 1),
(3900, 'Maunz', 'eqw', 1);

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

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `spq_risk_unit_disposition`
--
ALTER TABLE `spq_risk_unit_disposition`
  ADD CONSTRAINT `spq_risk_unit_disposition_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `spq_risk_user` (`id_user`),
  ADD CONSTRAINT `spq_risk_unit_disposition_ibfk_2` FOREIGN KEY (`id_location`) REFERENCES `spq_risk_location` (`id_location`),
  ADD CONSTRAINT `spq_risk_unit_disposition_ibfk_3` FOREIGN KEY (`id_game`) REFERENCES `spq_risk_game` (`id_game`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
