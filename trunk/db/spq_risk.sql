-- phpMyAdmin SQL Dump
-- version 3.5.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generato il: Set 16, 2014 alle 16:29
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
CREATE TABLE `spq_risk_cards` (
  `id_card` int(11) NOT NULL,
  `card_name` varchar(250) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `spq_risk_game`
--

DROP TABLE IF EXISTS `spq_risk_game`;
CREATE TABLE `spq_risk_game` (
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
CREATE TABLE `spq_risk_game_grimory` (
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
CREATE TABLE `spq_risk_game_log` (
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
CREATE TABLE `spq_risk_game_point` (
  `id_game` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `game_point_points` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `spq_risk_game_turn_fase`
--

DROP TABLE IF EXISTS `spq_risk_game_turn_fase`;
CREATE TABLE `spq_risk_game_turn_fase` (
  `id_game` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_turn_phase` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `spq_risk_game_user`
--

DROP TABLE IF EXISTS `spq_risk_game_user`;
CREATE TABLE `spq_risk_game_user` (
  `id_game` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_color` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `spq_risk_language`
--

DROP TABLE IF EXISTS `spq_risk_language`;
CREATE TABLE `spq_risk_language` (
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
CREATE TABLE `spq_risk_location` (
  `id_location` int(11) NOT NULL,
  `id_location_group` int(11) NOT NULL,
  `location_type` tinyint(4) NOT NULL,
  `location_name` varchar(250) COLLATE utf8_bin NOT NULL,
  `location_coord_x` int(11) NOT NULL,
  `location_coord_y` int(11) NOT NULL,
  PRIMARY KEY (`id_location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `spq_risk_location_connection`
--

DROP TABLE IF EXISTS `spq_risk_location_connection`;
CREATE TABLE `spq_risk_location_connection` (
  `id_location` int(11) NOT NULL,
  `id_location_connected` int(11) NOT NULL,
  `connectio_type` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `spq_risk_turn_phase_name`
--

DROP TABLE IF EXISTS `spq_risk_turn_phase_name`;
CREATE TABLE `spq_risk_turn_phase_name` (
  `id_turn_phase` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `turn_phase_description` varchar(250) COLLATE utf8_bin NOT NULL,
  `turn_phase_summary` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_turn_phase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `spq_risk_turn_phase_name`
--

INSERT INTO `spq_risk_turn_phase_name` (`id_turn_phase`, `id_lang`, `turn_phase_description`,`turn_phase_summary`) VALUES (1, '1', 'Conteggio Punti','Fase di calcolo eventuali punti guadagnati');
INSERT INTO `spq_risk_turn_phase_name` (`id_turn_phase`, `id_lang`, `turn_phase_description`,`turn_phase_summary`) VALUES (2, '1', 'Scambio Carte','E possibile barattare le proprie carte per ottenere rinforzi');
INSERT INTO `spq_risk_turn_phase_name` (`id_turn_phase`, `id_lang`, `turn_phase_description`,`turn_phase_summary`) VALUES (3, '1', 'Disposizione Rinfrorzi','E possibile disporre i riforzi base o quelli ottenuti dallo scambio delle carte');
INSERT INTO `spq_risk_turn_phase_name` (`id_turn_phase`, `id_lang`, `turn_phase_description`,`turn_phase_summary`) VALUES (4, '1', 'Smantellamento Navale','E possibile smantellare una nave per guadagnare due unit�');
INSERT INTO `spq_risk_turn_phase_name` (`id_turn_phase`, `id_lang`, `turn_phase_description`,`turn_phase_summary`) VALUES (5, '1', 'Creazione Triremi','E possibile creare una triremi');
INSERT INTO `spq_risk_turn_phase_name` (`id_turn_phase`, `id_lang`, `turn_phase_description`,`turn_phase_summary`) VALUES (6, '1', 'Attacco Navale','E possibile effettuare uno o pi� attacchi navali ma solo uno per zona');
INSERT INTO `spq_risk_turn_phase_name` (`id_turn_phase`, `id_lang`, `turn_phase_description`,`turn_phase_summary`) VALUES (7, '1', 'Attacco via nave','E possibile attaccare tramite le navi una provincia toccata da una zona marittima');
INSERT INTO `spq_risk_turn_phase_name` (`id_turn_phase`, `id_lang`, `turn_phase_description`,`turn_phase_summary`) VALUES (8, '1', 'Attacco terrestre','E possibile attaccare normalmente via terra');
INSERT INTO `spq_risk_turn_phase_name` (`id_turn_phase`, `id_lang`, `turn_phase_description`,`turn_phase_summary`) VALUES (9, '1', 'Spostamento Strategico','E possibile effettuare un solo spostamento strategico');
INSERT INTO `spq_risk_turn_phase_name` (`id_turn_phase`, `id_lang`, `turn_phase_description`,`turn_phase_summary`) VALUES (10, '1', 'Acquisto carta','E possibile acquisire la carta se si � conquistato almeno un territorio');

-- --------------------------------------------------------

--
-- Struttura della tabella `spq_risk_unit_disposition`
--

DROP TABLE IF EXISTS `spq_risk_unit_disposition`;
CREATE TABLE `spq_risk_unit_disposition` (
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
CREATE TABLE `spq_risk_user` (
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
CREATE TABLE `spq_risk_user_cards` (
  `id_game` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_card` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `spq_risk_user_stats`
--

DROP TABLE IF EXISTS `spq_risk_user_stats`;
CREATE TABLE `spq_risk_user_stats` (
  `id_user` int(11) NOT NULL,
  `user_stats_played_games` int(11) NOT NULL,
  `user_stats_won_games` int(11) NOT NULL,
  `user_stats_lost_games` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
