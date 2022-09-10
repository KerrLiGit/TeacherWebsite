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
  `login` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Логин',
  `password` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Пароль',
  `role` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Роль',
  `surname` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Фамилия',
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Имя',
  `secname` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Отчество',
  `class` int unsigned DEFAULT NULL COMMENT 'ID класса',
  `confirm` int unsigned NOT NULL DEFAULT '0' COMMENT 'Аккаунт подтвержден',
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
 ('1','1','student','Богатырева','Анна','Алексеевна',3,1),
 ('2','2','student','Пупкин','Михаил','Михайлович',3,1),
 ('5','5','student','Иванов','Иван','Иванович',3,1),
 ('7','7','student','Петров','Петр','Петрович',3,1),
 ('admin','admin','admin','1','1','1',NULL,1),
 ('catherina','11062015','teacher','Анощенкова','Екатерина','Васильевна',NULL,1);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;


--
-- Definition of table `classes`
--

DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID класса',
  `num` int unsigned NOT NULL COMMENT 'Номер класса',
  `lit` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Литера класса',
  PRIMARY KEY (`id`),
  KEY `FK_classes_1` (`num`),
  CONSTRAINT `FK_classes_1` FOREIGN KEY (`num`) REFERENCES `classnums` (`classnum`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Классификатор классов учеников';

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Классификатор номеров классов';

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
  `login` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Логие аккаунта',
  `class` int unsigned NOT NULL COMMENT 'Номер класса',
  `num` int unsigned NOT NULL COMMENT 'Номер урока',
  `type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Тип урока',
  `deadline` datetime NOT NULL COMMENT 'Время, после которого доступ к теме закрывается',
  KEY `FK_links_1` (`login`),
  KEY `FK_links_2` (`class`,`num`,`type`),
  CONSTRAINT `FK_links_1` FOREIGN KEY (`login`) REFERENCES `accounts` (`login`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_links_2` FOREIGN KEY (`class`, `num`, `type`) REFERENCES `topics` (`class`, `num`, `type`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_links_3` FOREIGN KEY (`class`) REFERENCES `classnums` (`classnum`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Ученики и доступные им темы';

--
-- Dumping data for table `links`
--

/*!40000 ALTER TABLE `links` DISABLE KEYS */;
INSERT INTO `links` (`login`,`class`,`num`,`type`,`deadline`) VALUES 
 ('1',5,1,'math','2022-09-03 00:00:00'),
 ('2',5,1,'math','2022-08-16 00:00:00'),
 ('7',5,1,'math','2022-08-25 00:00:00'),
 ('1',2,1,'olymp','2022-09-09 00:00:00');
/*!40000 ALTER TABLE `links` ENABLE KEYS */;


--
-- Definition of table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `role` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Роль аккаунта',
  `descript` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Описание',
  PRIMARY KEY (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Классификатор ролей';

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
  `type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Тип темы',
  `title` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Заголовок',
  `subtitle` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Подзаголовок',
  `content` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Содержание',
  `hidden` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Скрытое содержание',
  PRIMARY KEY (`class`,`num`,`type`) USING BTREE,
  KEY `FK_topics_1` (`type`),
  CONSTRAINT `FK_topics_1` FOREIGN KEY (`type`) REFERENCES `types` (`type`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_topics_2` FOREIGN KEY (`class`) REFERENCES `classnums` (`classnum`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Темы уроков';

--
-- Dumping data for table `topics`
--

/*!40000 ALTER TABLE `topics` DISABLE KEYS */;
INSERT INTO `topics` (`class`,`num`,`type`,`title`,`subtitle`,`content`,`hidden`) VALUES 
 (2,1,'olymp','Заголупок','Подзаголупок','Текст\r\n<div style=\"padding-bottom: 10px;\">Текст в тексте</div>','скрытый текст\r\n<div style=\"padding-bottom: 10px;\">скрытый текст в тексте<div>'),
 (5,1,'math','Урок 1. Рациональные числа','Урок 1','<div style=\"padding-bottom: 10px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</div>','<div style=\"padding-bottom: 10px;\">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo.</div>'),
 (5,2,'math','Урок 2. Иррациональные числа','Урок 2','<div style=\"padding-bottom: 10px;\">Это сложно.</div>','<div style=\"padding-bottom: 10px;\">Очень.</div>'),
 (6,2,'math','Урок 2. Шестой класс','Урок 2','Текст','Скрытый текст');
/*!40000 ALTER TABLE `topics` ENABLE KEYS */;


--
-- Definition of table `types`
--

DROP TABLE IF EXISTS `types`;
CREATE TABLE `types` (
  `type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Тип темы',
  `descript` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Описание',
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Классификатор типов задач';

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
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
