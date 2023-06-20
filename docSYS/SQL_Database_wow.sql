-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 19, 2022 at 01:39 PM
-- Server version: 5.7.26
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wow`
--

-- --------------------------------------------------------

--
-- Table structure for table "admin"
--

DROP TABLE IF EXISTS "admin";
CREATE TABLE IF NOT EXISTS "admin"
  `aemail' varchar'('255') NOT NULL,
  "apassword" varchar'(255) DEFAULT NULL,
  PRIMARY KEY '("aemail")'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table "admin"
--

INSERT INTO "admin" ('aemail', 'apassword') VALUES
('admin@wow.com', 123);

-- --------------------------------------------------------

--
-- Table structure for table "appointment"
--

DROP TABLE IF EXISTS "appointment";
CREATE TABLE IF NOT EXISTS "appointment" (
  'appoid' int'(11) NOT NULL AUTO_INCREMENT,
  'Cid' int'(10) DEFAULT NULL,
  'apponum' int'(3) DEFAULT NULL,
  'scheduleid' int '(10) DEFAULT NULL,
  'appodate' date DEFAULT NULL,
  PRIMARY KEY '('appoid')',
  KEY 'Cid' '('Cid')',
  KEY 'scheduleid' '('scheduleid')'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table "appointment"
--

INSERT INTO "appointment" ('appoid', 'Cid`, apponum', 'scheduleid', 'appodate') VALUES
(1, 1, 1, 1, '2022-06-03');

-- --------------------------------------------------------

--
-- Table structure for table `Member`
--

DROP TABLE IF EXISTS "Member";
CREATE TABLE IF NOT EXISTS `Member` (
  "Memid" int'('11') NOT NULL AUTO_INCREMENT,
  "Mememail" varchar'('255') DEFAULT NULL,
  "Memname" varchar'(255) DEFAULT NULL,
  "Mempassword" varchar'('255') DEFAULT NULL,
  "Memtel" varchar'(15) DEFAULT NULL,
  "specialties" int'('2') DEFAULT NULL,
  PRIMARY KEY ("Memid"),
  KEY "specialties" ("specialties")
 ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Member`
--

INSERT INTO "Member" ("Memid", "Mememail","Memname","Mempassword", "Memtel", "specialties") VALUES
(1, "Member@wow.com", "Psychologist", "123", "000000000", "0117658244", 1);

-- --------------------------------------------------------

--
-- Table structure for table "customer"
--

DROP TABLE IF EXISTS "customer";
CREATE TABLE IF NOT EXISTS "customer" (
  `Cid' int'(11) NOT NULL AUTO_INCREMENT,
  `Cemail' varchar'(255) DEFAULT NULL,
  `Cname' varchar'(255) DEFAULT NULL,
  `Cpassword' varchar'(255) DEFAULT NULL,
  `Caddress' varchar'(255) DEFAULT NULL,
  `Cdob' date DEFAULT NULL,
  `Ctel' varchar'(15) DEFAULT NULL,
  PRIMARY KEY '(`Cid')
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table "customer"
--

INSERT INTO "customer" ('Cid', 'Cemail', 'Cname', 'Cpassword', 'Caddress','Cdob', 'Ctel') VALUES
(1, 'customer@wowcom', 'customer', '123456', 'South Africa', '0000000000', '2000-01-01', '0684784693'),

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
CREATE TABLE IF NOT EXISTS `schedule' (
  `scheduleid` int(11) NOT NULL AUTO_INCREMENT,
  `Memid` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `scheduledate` date DEFAULT NULL,
  `scheduletime` time DEFAULT NULL,
  `nop` int(4) DEFAULT NULL,
  PRIMARY KEY (`scheduleid`),
  KEY `Memid` (`Memid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule' (`scheduleid', `Memid',`title', `scheduledate', `scheduletime', `nop'') VALUES
(1, '1', 'Test Session', '2050-01-01', '18:00:00', 50),
(2, '1', '1', '2022-06-10', '20:36:00', 1),
(3, '1', '12', '2022-06-10', '20:33:00', 1),
(4, '1', '1', '2022-06-10', '12:32:00', 1),
(5, '1', '1', '2022-06-10', '20:35:00', 1),
(6, '1', '12', '2022-06-10', '20:35:00', 1),
(7, '1', '1', '2022-06-24', '20:36:00', 1),
(8, '1', '12', '2022-06-10', '13:33:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `specialties`
--

DROP TABLE IF EXISTS "specialties";
CREATE TABLE IF NOT EXISTS "specialties" (
  `Cid' int(2) NOT NULL,
  `sname' varchar'(50) DEFAULT NULL,
  PRIMARY KEY `(`Cid)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table 'specialties'
--

INSERT INTO "specialties" ('Cid', 'sname') VALUES
(1, 'Massage/Facial'),
(2, 'Nails'),
(3, 'Hairdresser'),
(4, 'Eyelash extension'),
(5, 'Microblading'),
(6, 'Aesthetics & Laser Therapies'),
(7, 'Weight loss'),
(8, 'Personal Trainers'),
(9, 'Accupuncture'),
(10, 'Nutritionist'),
(11, 'Life Coach'),
(12, 'Caregiver'),
(13, 'Counselling'),
(14, 'Hypno-therapist'),
(15, 'Psychologist'),
(16, 'Yoga'),
(17, 'Meditation'),
(18, 'Healers'),
(19, 'Psychic Medium'),
(20, 'Clairvoyance'),
(21, 'Astrologer'),
(22, 'Somatology'),
(23, 'Retreats '),
(24, 'Workshops'),


-- --------------------------------------------------------

--
-- Table structure for table `webuser`
--

DROP TABLE IF EXISTS `webuser';
CREATE TABLE IF NOT EXISTS `webuser' (
  `email' varchar'(255) NOT NULL,
  'usertype' char'(1) DEFAULT NULL,
  PRIMARY KEY '(`email')
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `webuser`
--

INSERT INTO `webuser' (`email`, `usertype`) VALUES
`('admin@wow.com', 'a'),
`('Member@wow.com', 'm'),
`('customer@wow.com', 'c''),

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
