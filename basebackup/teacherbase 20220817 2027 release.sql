-- MySQL dump 10.13  Distrib 5.7.36, for Linux (x86_64)
--
-- Host: localhost    Database: u133692_teacherbase
-- ------------------------------------------------------
-- Server version	5.7.36-log-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;


--
-- Create schema teacherbase
--

USE u133692_teacherbase;

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
) ENGINE=InnoDB COMMENT='Пользователи';

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
  `lit` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 COMMENT='Классы учеников';

--
-- Dumping data for table `classes`
--

/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` (`id`,`num`,`lit`) VALUES 
 (1,5,'А'),
 (2,5,'Б'),
 (3,5,'В'),
 (4,5,'Р'),
 (5,6,'А'),
 (6,6,'Б'),
 (7,6,'В'),
 (8,6,'Р'),
 (9,7,'А'),
 (10,7,'Б'),
 (11,7,'В'),
 (12,7,'Р'),
 (13,8,'А'),
 (14,8,'Б'),
 (15,8,'В'),
 (16,8,'Р'),
 (17,9,'А'),
 (18,9,'Б'),
 (19,9,'В'),
 (20,9,'Р');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;


--
-- Definition of table `links`
--

DROP TABLE IF EXISTS `links`;
CREATE TABLE `links` (
  `login` varchar(45) NOT NULL,
  `class` int unsigned NOT NULL,
  `num` int unsigned NOT NULL,
  `type` varchar(45) NOT NULL,
  `deadline` datetime NOT NULL COMMENT 'Время, после которого доступ к теме закрывается',
  KEY `FK_links_1` (`login`),
  KEY `FK_links_2` (`class`,`num`,`type`),
  CONSTRAINT `FK_links_1` FOREIGN KEY (`login`) REFERENCES `accounts` (`login`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_links_2` FOREIGN KEY (`class`, `num`, `type`) REFERENCES `topics` (`class`, `num`, `type`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB COMMENT='Ученики и доступные им задачи';

--
-- Definition of table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `role` varchar(45) NOT NULL,
  `descript` varchar(45) NOT NULL,
  PRIMARY KEY (`role`)
) ENGINE=InnoDB;

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
  `class` int unsigned NOT NULL,
  `num` int unsigned NOT NULL,
  `type` varchar(45) NOT NULL,
  `title` varchar(45) NOT NULL,
  `subtitle` varchar(45) NOT NULL,
  `content` varchar(600) NOT NULL,
  `hidden` varchar(600) NOT NULL,
  PRIMARY KEY (`class`,`num`,`type`) USING BTREE,
  KEY `FK_topics_1` (`type`),
  CONSTRAINT `FK_topics_1` FOREIGN KEY (`type`) REFERENCES `types` (`type`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB COMMENT='Уроки';

--
-- Definition of table `types`
--

DROP TABLE IF EXISTS `types`;
CREATE TABLE `types` (
  `type` varchar(45) NOT NULL,
  `descript` varchar(45) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB COMMENT='Классификатор типов задач';

--
-- Dumping data for table `types`
--

/*!40000 ALTER TABLE `types` DISABLE KEYS */;
INSERT INTO `types` (`type`,`descript`) VALUES 
 ('alg','Алгебра'),
 ('geo','Геометрия'),
 ('math','Математика'),
 ('olymp','Олимпиада');
/*!40000 ALTER TABLE `types` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-17 20:32:13
