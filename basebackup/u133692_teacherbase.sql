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


--
-- Create schema teacherbase
--

CREATE DATABASE IF NOT EXISTS u133692_teacherbase;
USE u133692_teacherbase;

--
-- Definition of table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts` (
  `login` varchar(45) CHARACTER SET utf8  NOT NULL COMMENT 'Логин',
  `password` varchar(45) CHARACTER SET utf8  NOT NULL COMMENT 'Пароль',
  `role` varchar(45) CHARACTER SET utf8  NOT NULL COMMENT 'Роль',
  `surname` varchar(45) CHARACTER SET utf8  NOT NULL COMMENT 'Фамилия',
  `name` varchar(45) CHARACTER SET utf8  NOT NULL COMMENT 'Имя',
  `secname` varchar(45) CHARACTER SET utf8  NOT NULL COMMENT 'Отчество',
  `class` int unsigned DEFAULT NULL COMMENT 'ID класса',
  `confirm` int unsigned NOT NULL DEFAULT '0' COMMENT 'Аккаунт подтвержден',
  PRIMARY KEY (`login`),
  KEY `FK_accounts_1` (`class`),
  KEY `FK_accounts_2` (`role`),
  CONSTRAINT `FK_accounts_1` FOREIGN KEY (`class`) REFERENCES `classes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_accounts_2` FOREIGN KEY (`role`) REFERENCES `roles` (`role`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Пользователи';

--
-- Dumping data for table `accounts`
--

/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` (`login`,`password`,`role`,`surname`,`name`,`secname`,`class`,`confirm`) VALUES 
 ('admin','TeTriandox','admin','1','1','1',NULL,1),
 ('catherina','11062015','teacher','Анощенкова','Екатерина','Васильевна',NULL,1);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;


--
-- Definition of table `classes`
--

DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID класса',
  `num` int unsigned NOT NULL COMMENT 'Номер класса',
  `lit` varchar(1) CHARACTER SET utf8  NOT NULL COMMENT 'Литера класса',
  PRIMARY KEY (`id`),
  KEY `FK_classes_1` (`num`),
  CONSTRAINT `FK_classes_1` FOREIGN KEY (`num`) REFERENCES `classnums` (`classnum`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='Классификатор классов учеников';

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
-- Definition of table `classnums`
--

DROP TABLE IF EXISTS `classnums`;
CREATE TABLE `classnums` (
  `classnum` int unsigned NOT NULL COMMENT 'Номер класса',
  PRIMARY KEY (`classnum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Классификатор номеров классов';

--
-- Dumping data for table `classnums`
--

/*!40000 ALTER TABLE `classnums` DISABLE KEYS */;
INSERT INTO `classnums` (`classnum`) VALUES 
 (1),
 (2),
 (3),
 (4),
 (5),
 (6),
 (7),
 (8),
 (9),
 (10),
 (11);
/*!40000 ALTER TABLE `classnums` ENABLE KEYS */;


--
-- Definition of table `links`
--

DROP TABLE IF EXISTS `links`;
CREATE TABLE `links` (
  `login` varchar(45) CHARACTER SET utf8  NOT NULL COMMENT 'Логин аккаунта',
  `class` int unsigned NOT NULL COMMENT 'Номер класса',
  `num` int unsigned NOT NULL COMMENT 'Номер урока',
  `type` varchar(45) CHARACTER SET utf8  NOT NULL COMMENT 'Тип урока',
  `deadline` datetime NOT NULL COMMENT 'Время, после которого доступ к теме закрывается',
  KEY `FK_links_1` (`login`),
  KEY `FK_links_2` (`class`,`num`,`type`),
  CONSTRAINT `FK_links_1` FOREIGN KEY (`login`) REFERENCES `accounts` (`login`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_links_2` FOREIGN KEY (`class`, `num`, `type`) REFERENCES `topics` (`class`, `num`, `type`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ученики и доступные им темы';

--
-- Dumping data for table `links`
--

--
-- Definition of table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `role` varchar(45) CHARACTER SET utf8  NOT NULL COMMENT 'Роль аккаунта',
  `descript` varchar(45) CHARACTER SET utf8  NOT NULL COMMENT 'Описание',
  PRIMARY KEY (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Классификатор ролей';

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
  `class` int unsigned NOT NULL COMMENT 'Номер класса',
  `num` int unsigned NOT NULL COMMENT 'Номер темы',
  `type` varchar(45) CHARACTER SET utf8  NOT NULL COMMENT 'Тип темы',
  `title` varchar(45) CHARACTER SET utf8  NOT NULL COMMENT 'Заголовок',
  `subtitle` varchar(45) CHARACTER SET utf8  NOT NULL COMMENT 'Подзаголовок',
  `content` varchar(600) CHARACTER SET utf8  NOT NULL COMMENT 'Содержание',
  `hidden` varchar(600) CHARACTER SET utf8  NOT NULL COMMENT 'Скрытое содержание',
  PRIMARY KEY (`class`,`num`,`type`) USING BTREE,
  KEY `FK_topics_1` (`type`),
  CONSTRAINT `FK_topics_1` FOREIGN KEY (`type`) REFERENCES `types` (`type`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_topics_2` FOREIGN KEY (`class`) REFERENCES `classnums` (`classnum`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Темы уроков';

--
-- Dumping data for table `topics`
--

--
-- Definition of table `types`
--

DROP TABLE IF EXISTS `types`;
CREATE TABLE `types` (
  `type` varchar(45) CHARACTER SET utf8  NOT NULL COMMENT 'Тип темы',
  `descript` varchar(45) CHARACTER SET utf8  NOT NULL COMMENT 'Описание',
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Классификатор типов задач';

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




/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-04 20:28:55
