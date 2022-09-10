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
-- Definition of table `account`
--

DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `login` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Логин',
  `password` varchar(20) NOT NULL COMMENT 'Пароль',
  `role` varchar(20) NOT NULL COMMENT 'Роль',
  `surname` varchar(20) NOT NULL COMMENT 'Фамилия',
  `name` varchar(20) NOT NULL COMMENT 'Имя',
  `secname` varchar(20) NOT NULL COMMENT 'Отчество',
  `classnum` int unsigned DEFAULT NULL COMMENT 'Номер класса',
  `classlit` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Литера класса',
  `confirm` int unsigned NOT NULL DEFAULT '0' COMMENT 'Подтвержден',
  PRIMARY KEY (`login`),
  KEY `FK_account_1` (`classnum`,`classlit`),
  KEY `FK_account_2` (`role`),
  CONSTRAINT `FK_account_1` FOREIGN KEY (`classnum`, `classlit`) REFERENCES `class` (`classnum`, `classlit`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_account_2` FOREIGN KEY (`role`) REFERENCES `role` (`role`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Пользователь';

--
-- Dumping data for table `account`
--

/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` (`login`,`password`,`role`,`surname`,`name`,`secname`,`classnum`,`classlit`,`confirm`) VALUES 
 ('catherina','11062015','teacher','Анощенкова','Екатерина','Васильевна',NULL,NULL,1);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;


--
-- Definition of table `class`
--

DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `classnum` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Номер класса',
  `classlit` varchar(1) NOT NULL COMMENT 'Литера класса',
  PRIMARY KEY (`classnum`,`classlit`) USING BTREE,
  CONSTRAINT `FK_class_1` FOREIGN KEY (`classnum`) REFERENCES `classnum` (`classnum`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Класс';

--
-- Dumping data for table `class`
--

/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` (`classnum`,`classlit`) VALUES 
 (5,'А'),
 (5,'Б'),
 (5,'В'),
 (5,'Р');
/*!40000 ALTER TABLE `class` ENABLE KEYS */;


--
-- Definition of table `classnum`
--

DROP TABLE IF EXISTS `classnum`;
CREATE TABLE `classnum` (
  `classnum` int unsigned NOT NULL COMMENT 'Номер класса',
  PRIMARY KEY (`classnum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Номер класса';

--
-- Dumping data for table `classnum`
--

/*!40000 ALTER TABLE `classnum` DISABLE KEYS */;
INSERT INTO `classnum` (`classnum`) VALUES 
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
/*!40000 ALTER TABLE `classnum` ENABLE KEYS */;


--
-- Definition of table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role` varchar(20) NOT NULL COMMENT 'Роль',
  `descript` varchar(20) NOT NULL COMMENT 'Описание',
  PRIMARY KEY (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Роль';

--
-- Dumping data for table `role`
--

/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`role`,`descript`) VALUES 
 ('admin','Администратор'),
 ('student','Ученик'),
 ('teacher','Учитель');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;


--
-- Definition of table `type`
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `type` varchar(20) NOT NULL COMMENT 'Тип',
  `description` varchar(40) NOT NULL COMMENT 'Описание',
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Тип';

--
-- Dumping data for table `type`
--

/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` (`type`,`description`) VALUES 
 ('alg','Алгебра'),
 ('geo','Геометрия'),
 ('math','Математика'),
 ('olymp','Олимпиада');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
