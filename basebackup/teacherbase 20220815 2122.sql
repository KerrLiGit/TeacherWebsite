-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	8.0.27


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema teacherbase
--

CREATE DATABASE IF NOT EXISTS teacherbase;
USE teacherbase;

--
-- Definition of table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts` (
  `login` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `role` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `secname` varchar(45) NOT NULL,
  `class` int unsigned DEFAULT NULL,
  `confirm` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`login`),
  KEY `FK_accounts_1` (`class`),
  KEY `FK_accounts_2` (`role`),
  CONSTRAINT `FK_accounts_1` FOREIGN KEY (`class`) REFERENCES `classes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_accounts_2` FOREIGN KEY (`role`) REFERENCES `roles` (`role`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Пользователи';

--
-- Dumping data for table `accounts`
--

/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` (`login`,`password`,`role`,`surname`,`name`,`secname`,`class`,`confirm`) VALUES 
 ('catherina','11062015','teacher','Анощенкова','Екатерина','Васильевна',NULL,1);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;


--
-- Definition of table `classes`
--

DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `num` int unsigned NOT NULL,
  `lit` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Классы учеников';

--
-- Dumping data for table `classes`
--

/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` (`id`,`num`,`lit`) VALUES 
 (1,5,'А'),
 (2,5,'Б'),
 (3,5,'В');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;


--
-- Definition of table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `role` varchar(45) NOT NULL,
  `descript` varchar(45) NOT NULL,
  PRIMARY KEY (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `roles`
--

/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`role`,`descript`) VALUES 
 ('admin','Администратор'),
 ('student','Ученик'),
 ('teacher','Учитель');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;


--
-- Definition of table `topics`
--

DROP TABLE IF EXISTS `topics`;
CREATE TABLE `topics` (
  `class` int unsigned NOT NULL AUTO_INCREMENT,
  `num` int unsigned NOT NULL,
  `type` varchar(45) NOT NULL,
  `title` varchar(45) NOT NULL,
  `subtitle` varchar(45) NOT NULL,
  `content` varchar(200) NOT NULL,
  PRIMARY KEY (`class`,`num`,`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Уроки';

--
-- Dumping data for table `topics`
--

/*!40000 ALTER TABLE `topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `topics` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
