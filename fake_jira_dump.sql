-- MySQL dump 10.13  Distrib 8.0.23, for macos10.15 (x86_64)
--
-- Host: localhost    Database: fake_jira
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор отдела',
  `name` varchar(100) NOT NULL COMMENT 'Наименование отдела',
  `description` varchar(255) DEFAULT NULL COMMENT 'Описание отдела',
  `head_id` int unsigned DEFAULT NULL COMMENT 'Ссылка на руководителя отдела',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Отделы компании';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Отдел маркетинга','Отдел маркетинга',6,'2021-03-28 16:45:53','2021-03-28 16:45:53'),(2,'Отдел продаж','Отдел продаж',7,'2021-03-28 16:45:53','2021-03-28 16:45:53'),(3,'Отдел управления проектами','Отдел управления проектами',4,'2021-03-28 16:45:53','2021-03-28 16:45:53'),(4,'Отдел аналитики','Отдел аналитики',10,'2021-03-28 16:45:53','2021-03-28 16:45:53'),(5,'Отдел разработки','Отдел разработки',1,'2021-03-28 16:45:53','2021-03-28 16:45:53');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `positions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор должности',
  `name` varchar(100) NOT NULL COMMENT 'Наименование должности',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Должности';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
INSERT INTO `positions` VALUES (1,'Head of department','2021-03-28 15:07:38','2021-03-28 15:07:38'),(2,'Product manager','2021-03-28 15:07:38','2021-03-28 15:07:38'),(3,'Project manager','2021-03-28 15:07:38','2021-03-28 15:07:38'),(4,'Tech lead','2021-03-28 15:07:38','2021-03-28 15:07:38'),(5,'Backend-разработчик','2021-03-28 15:07:38','2021-03-28 15:07:38'),(6,'Frontend-разработчик','2021-03-28 15:07:38','2021-03-28 15:07:38'),(7,'QA','2021-03-28 15:07:38','2021-03-28 15:07:38');
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор проекта',
  `name` varchar(100) NOT NULL COMMENT 'Имя проекта',
  `description` varchar(255) DEFAULT NULL COMMENT 'Краткое описание проекта',
  `owner_id` int NOT NULL COMMENT 'Ссылка на руководителя проекта',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  KEY `projects_name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Проекты';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'Система учета рабочего времени','Продукт для компании \"Контакт+\"',4,'2021-03-28 17:09:54','2021-03-28 17:09:54');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор роли',
  `name` varchar(100) NOT NULL COMMENT 'Уникальное имя роли',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Роли в проектах';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrator','2021-03-28 15:19:19','2021-03-28 15:19:19'),(2,'Member','2021-03-28 15:19:19','2021-03-28 15:19:19'),(3,'Viewer','2021-03-28 15:19:19','2021-03-28 15:19:19');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_priorities`
--

DROP TABLE IF EXISTS `task_priorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_priorities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор приоритета',
  `name` varchar(25) NOT NULL COMMENT 'Уникальное имя приоритета',
  `sort_position` int unsigned NOT NULL COMMENT 'Позиция в сортировке',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Приоритеты задач';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_priorities`
--

LOCK TABLES `task_priorities` WRITE;
/*!40000 ALTER TABLE `task_priorities` DISABLE KEYS */;
INSERT INTO `task_priorities` VALUES (1,'Highest',0,'2021-03-28 15:24:50','2021-03-28 15:24:50'),(2,'High',1,'2021-03-28 15:24:50','2021-03-28 15:24:50'),(3,'Middle',2,'2021-03-28 15:24:50','2021-03-28 15:24:50'),(4,'Low',3,'2021-03-28 15:24:50','2021-03-28 15:24:50');
/*!40000 ALTER TABLE `task_priorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_statuses`
--

DROP TABLE IF EXISTS `task_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_statuses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор статуса',
  `name` varchar(25) NOT NULL COMMENT 'Уникальное имя статуса',
  `sort_position` int unsigned NOT NULL COMMENT 'Порядковый номер статуса',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Статусы задач';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_statuses`
--

LOCK TABLES `task_statuses` WRITE;
/*!40000 ALTER TABLE `task_statuses` DISABLE KEYS */;
INSERT INTO `task_statuses` VALUES (1,'TO DO',0,'2021-03-28 15:40:18','2021-03-28 15:40:18'),(2,'IN PROGRESS',1,'2021-03-28 15:40:18','2021-03-28 15:40:18'),(3,'HOLD',2,'2021-03-28 15:40:18','2021-03-28 15:40:18'),(4,'TEST',3,'2021-03-28 15:40:18','2021-03-28 15:40:18'),(5,'REWIEV',4,'2021-03-28 15:40:18','2021-03-28 15:40:18'),(6,'READY FOR RELEASE',5,'2021-03-28 15:40:18','2021-03-28 15:40:18'),(7,'DONE',6,'2021-03-28 15:40:18','2021-03-28 15:40:18');
/*!40000 ALTER TABLE `task_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_types`
--

DROP TABLE IF EXISTS `task_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор типа задачи',
  `name` varchar(25) NOT NULL COMMENT 'Уникальное имя типа задачи',
  `sublevel` int unsigned NOT NULL COMMENT 'Уровень вложенности типа задачи',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Типы задач';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_types`
--

LOCK TABLES `task_types` WRITE;
/*!40000 ALTER TABLE `task_types` DISABLE KEYS */;
INSERT INTO `task_types` VALUES (1,'Epic',0,'2021-03-28 15:45:49','2021-03-28 15:45:49'),(2,'History',1,'2021-03-28 15:45:49','2021-03-28 15:45:49'),(3,'Task',1,'2021-03-28 15:45:49','2021-03-28 15:45:49'),(4,'Bug',1,'2021-03-28 15:45:49','2021-03-28 15:45:49'),(5,'Research',1,'2021-03-28 15:45:49','2021-03-28 15:45:49'),(6,'Subtask',2,'2021-03-28 15:45:49','2021-03-28 15:45:49');
/*!40000 ALTER TABLE `task_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор задачи',
  `title` varchar(100) NOT NULL COMMENT 'Заголовок задачи',
  `description` text COMMENT 'Описание задачи',
  `project_id` int unsigned NOT NULL COMMENT 'Ссылка на проект',
  `task_type_id` int unsigned NOT NULL COMMENT 'Ссылка на тип задачи',
  `status_id` int unsigned NOT NULL DEFAULT '1' COMMENT 'Ссылка на статус задачи',
  `priority_type_id` int unsigned NOT NULL DEFAULT '1' COMMENT 'Ссылка на приоритет задачи',
  `performer_id` int unsigned NOT NULL COMMENT 'Ссылка на исполнителя',
  `customer_id` int unsigned NOT NULL COMMENT 'Ссылка на заказчика',
  `author_id` int unsigned NOT NULL COMMENT 'Ссылка на автора',
  `deadline` datetime DEFAULT NULL COMMENT 'Срок выполнения',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  KEY `tasks_project_id_performer_id_idx` (`project_id`,`performer_id`),
  KEY `tasks_project_id_customer_id_idx` (`project_id`,`customer_id`),
  KEY `tasks_project_id_author_id_idx` (`project_id`,`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Задачи';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,'nisl ut volutpat sapien arcu sed augue aliquam erat volutpat','sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae',1,1,7,3,8,1,5,'2021-04-16 14:14:19','2021-03-28 18:30:27','2021-03-28 18:30:27'),(2,'sagittis nam congue risus','nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum',1,6,5,3,7,9,8,'2021-04-15 07:16:23','2021-03-28 18:30:27','2021-03-28 18:30:27'),(3,'etiam faucibus cursus urna','lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam',1,6,5,4,3,4,3,'2021-05-26 23:44:21','2021-03-28 18:30:27','2021-03-28 18:30:27'),(4,'nisl nunc nisl duis bibendum felis sed','pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis',1,6,1,1,6,9,3,'2021-04-28 04:44:33','2021-03-28 18:30:27','2021-03-28 18:30:27'),(5,'sociis natoque penatibus et magnis dis parturient montes','ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti',1,3,7,1,10,2,9,'2021-05-15 05:12:13','2021-03-28 18:30:27','2021-03-28 18:30:27'),(6,'gravida sem praesent id massa id nisl venenatis lacinia aenean','in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam',1,6,4,3,7,8,6,'2021-05-30 08:32:57','2021-03-28 18:30:27','2021-03-28 18:30:27'),(7,'elementum in hac habitasse platea dictumst morbi vestibulum velit id','a feugiat et eros vestibulum ac est lacinia nisi venenatis',1,6,2,3,9,3,2,'2021-05-27 21:34:44','2021-03-28 18:30:27','2021-03-28 18:30:27'),(8,'sapien cursus vestibulum proin eu mi nulla ac enim','nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper',1,6,3,1,2,5,10,'2021-05-03 21:18:05','2021-03-28 18:30:27','2021-03-28 18:30:27'),(9,'feugiat non pretium quis lectus suspendisse potenti in eleifend quam','viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien',1,2,1,1,3,3,6,'2021-05-15 08:27:38','2021-03-28 18:30:27','2021-03-28 18:30:27'),(10,'odio cras mi pede malesuada in imperdiet et commodo','est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut',1,6,2,3,1,10,2,'2021-05-18 10:30:02','2021-03-28 18:30:27','2021-03-28 18:30:27'),(11,'ante nulla justo aliquam quis turpis eget elit','adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio',1,4,2,2,5,3,2,'2021-05-25 12:08:23','2021-03-28 18:30:27','2021-03-28 18:30:27'),(12,'enim blandit mi in','vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc',1,2,4,2,9,3,9,'2021-05-06 11:43:02','2021-03-28 18:30:27','2021-03-28 18:30:27'),(13,'vulputate ut ultrices vel augue vestibulum ante ipsum primis','eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus',1,5,7,2,5,2,9,'2021-05-12 05:37:46','2021-03-28 18:30:27','2021-03-28 18:30:27'),(14,'aliquam erat volutpat in congue etiam justo etiam pretium','ligula vehicula consequat morbi a ipsum integer a nibh in',1,6,3,3,8,4,9,'2021-05-28 05:46:31','2021-03-28 18:30:27','2021-03-28 18:30:27'),(15,'erat volutpat in congue etiam','id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque',1,5,1,1,4,7,1,'2021-04-25 06:30:06','2021-03-28 18:30:27','2021-03-28 18:30:27'),(16,'donec posuere metus vitae ipsum aliquam non mauris morbi non','primis in faucibus orci luctus et ultrices posuere cubilia curae',1,3,4,1,2,5,10,'2021-04-04 16:51:11','2021-03-28 18:30:27','2021-03-28 18:30:27'),(17,'nonummy maecenas tincidunt lacus at velit vivamus vel nulla','euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula',1,5,5,1,5,5,9,'2021-05-20 13:59:56','2021-03-28 18:30:27','2021-03-28 18:30:27'),(18,'dapibus nulla suscipit ligula in','quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit',1,3,2,1,5,3,1,'2021-05-19 10:34:58','2021-03-28 18:30:27','2021-03-28 18:30:27'),(19,'vitae mattis nibh ligula','est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo',1,5,2,4,6,7,3,'2021-04-08 05:01:06','2021-03-28 18:30:27','2021-03-28 18:30:27'),(20,'nulla integer pede justo lacinia eget tincidunt','sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus',1,1,5,1,7,4,1,'2021-04-06 15:14:08','2021-03-28 18:30:27','2021-03-28 18:30:27'),(21,'arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus','odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar',1,3,5,3,10,8,9,'2021-05-31 16:52:40','2021-03-28 18:30:27','2021-03-28 18:30:27'),(22,'morbi porttitor lorem id ligula suspendisse ornare consequat lectus in','dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper',1,5,2,1,7,4,6,'2021-04-02 17:12:01','2021-03-28 18:30:27','2021-03-28 18:30:27'),(23,'nulla sed vel enim sit amet','erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis',1,3,4,2,10,5,7,'2021-04-30 17:49:47','2021-03-28 18:30:27','2021-03-28 18:30:27'),(24,'suspendisse potenti cras in purus eu magna vulputate luctus','augue vel accumsan tellus nisi eu orci mauris lacinia sapien',1,2,6,4,5,8,8,'2021-04-15 20:04:33','2021-03-28 18:30:27','2021-03-28 18:30:27'),(25,'rhoncus mauris enim leo','ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet',1,1,6,3,10,5,3,'2021-05-03 08:16:14','2021-03-28 18:30:27','2021-03-28 18:30:27'),(26,'aliquam augue quam sollicitudin vitae consectetuer eget rutrum at','pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut',1,1,2,2,7,3,3,'2021-04-05 07:38:42','2021-03-28 18:30:27','2021-03-28 18:30:27'),(27,'lectus in est risus auctor sed tristique','sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio',1,5,7,4,8,4,6,'2021-05-31 15:11:36','2021-03-28 18:30:27','2021-03-28 18:30:27'),(28,'accumsan tortor quis turpis sed ante','quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus',1,2,7,4,7,2,10,'2021-04-15 19:44:37','2021-03-28 18:30:27','2021-03-28 18:30:27'),(29,'interdum eu tincidunt in leo maecenas','lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis',1,4,2,3,4,3,5,'2021-05-21 22:34:30','2021-03-28 18:30:27','2021-03-28 18:30:27'),(30,'nec nisi vulputate nonummy maecenas tincidunt lacus at velit','est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium',1,2,5,3,7,4,6,'2021-04-27 19:13:55','2021-03-28 18:30:27','2021-03-28 18:30:27'),(31,'diam nam tristique tortor','enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu',1,2,6,1,5,3,7,'2021-05-11 02:21:01','2021-03-28 18:30:27','2021-03-28 18:30:27'),(32,'quisque erat eros viverra eget congue','vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt',1,4,4,4,3,1,5,'2021-05-20 07:14:43','2021-03-28 18:30:27','2021-03-28 18:30:27'),(33,'mi sit amet lobortis sapien','lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie',1,1,5,4,3,8,7,'2021-05-03 09:53:29','2021-03-28 18:30:27','2021-03-28 18:30:27'),(34,'proin at turpis a pede posuere nonummy integer','vel nulla eget eros elementum pellentesque quisque porta volutpat erat',1,6,1,3,1,8,5,'2021-05-25 17:00:30','2021-03-28 18:30:27','2021-03-28 18:30:27'),(35,'porttitor lacus at turpis donec posuere metus vitae ipsum aliquam','consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id',1,4,5,4,7,2,8,'2021-04-22 09:02:49','2021-03-28 18:30:27','2021-03-28 18:30:27'),(36,'lorem ipsum dolor sit','nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis',1,2,3,3,1,3,10,'2021-04-30 12:58:26','2021-03-28 18:30:27','2021-03-28 18:30:27'),(37,'turpis eget elit sodales scelerisque mauris sit amet eros suspendisse','adipiscing elit proin risus praesent lectus vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus',1,6,1,2,7,3,9,'2021-05-22 05:08:06','2021-03-28 18:30:27','2021-03-28 18:30:27'),(38,'sit amet justo morbi ut','morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor',1,5,1,1,1,2,4,'2021-05-24 16:02:12','2021-03-28 18:30:27','2021-03-28 18:30:27'),(39,'eu mi nulla ac enim in tempor','vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat',1,1,2,3,7,10,3,'2021-05-15 14:16:14','2021-03-28 18:30:27','2021-03-28 18:30:27'),(40,'sociis natoque penatibus et magnis dis parturient','blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget',1,3,5,1,2,10,10,'2021-05-03 15:00:28','2021-03-28 18:30:27','2021-03-28 18:30:27'),(41,'sapien ut nunc vestibulum ante ipsum primis','fermentum donec ut mauris eget massa tempor convallis nulla neque libero',1,2,7,3,2,8,8,'2021-05-31 19:13:38','2021-03-28 18:30:27','2021-03-28 18:30:27'),(42,'sed tincidunt eu felis fusce posuere felis','ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices',1,3,6,4,7,2,1,'2021-05-20 05:53:07','2021-03-28 18:30:27','2021-03-28 18:30:27'),(43,'lacinia sapien quis libero','morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit',1,5,4,4,4,8,10,'2021-04-27 15:23:55','2021-03-28 18:30:27','2021-03-28 18:30:27'),(44,'pellentesque volutpat dui maecenas tristique est et tempus semper est','cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia',1,5,1,4,7,2,10,'2021-04-03 00:25:42','2021-03-28 18:30:27','2021-03-28 18:30:27'),(45,'vivamus in felis eu sapien cursus','pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero',1,1,7,3,10,4,10,'2021-04-05 01:43:59','2021-03-28 18:30:27','2021-03-28 18:30:27'),(46,'vel est donec odio justo sollicitudin','sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus',1,6,1,4,1,4,8,'2021-04-10 18:25:29','2021-03-28 18:30:27','2021-03-28 18:30:27'),(47,'eget semper rutrum nulla','dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem',1,2,6,1,9,7,6,'2021-05-21 08:15:11','2021-03-28 18:30:27','2021-03-28 18:30:27'),(48,'ligula pellentesque ultrices phasellus id','ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet',1,2,5,1,8,3,8,'2021-04-23 12:52:02','2021-03-28 18:30:27','2021-03-28 18:30:27'),(49,'interdum in ante vestibulum ante ipsum primis in faucibus orci','donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam',1,4,4,2,2,6,5,'2021-05-20 19:16:57','2021-03-28 18:30:27','2021-03-28 18:30:27'),(50,'in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae','faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate',1,3,3,2,6,8,9,'2021-04-20 10:29:20','2021-03-28 18:30:27','2021-03-28 18:30:27'),(51,'et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum','praesent lectus vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus',1,1,4,3,3,1,9,'2021-04-15 12:12:05','2021-03-28 18:30:27','2021-03-28 18:30:27'),(52,'vitae ipsum aliquam non','in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris',1,5,3,3,3,6,6,'2021-04-13 15:33:16','2021-03-28 18:30:27','2021-03-28 18:30:27'),(53,'ut mauris eget massa tempor convallis','nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros',1,4,4,4,9,4,10,'2021-04-09 17:22:06','2021-03-28 18:30:27','2021-03-28 18:30:27'),(54,'tellus in sagittis dui','vestibulum ante ipsum primis in faucibus orci luctus et ultrices',1,3,2,4,4,5,7,'2021-04-20 09:33:34','2021-03-28 18:30:27','2021-03-28 18:30:27'),(55,'aliquet at feugiat non','lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus',1,1,7,4,8,5,8,'2021-05-07 00:42:13','2021-03-28 18:30:27','2021-03-28 18:30:27'),(56,'nunc commodo placerat praesent blandit nam nulla integer pede justo','adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy',1,1,7,1,2,8,6,'2021-05-02 21:20:45','2021-03-28 18:30:27','2021-03-28 18:30:27'),(57,'elit sodales scelerisque mauris sit amet eros suspendisse accumsan','ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus',1,1,5,3,3,3,5,'2021-05-30 22:56:20','2021-03-28 18:30:27','2021-03-28 18:30:27'),(58,'lacus morbi sem mauris','neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl',1,1,5,2,7,7,2,'2021-04-18 21:44:47','2021-03-28 18:30:27','2021-03-28 18:30:27'),(59,'augue a suscipit nulla elit ac nulla','justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem',1,6,2,4,8,4,10,'2021-04-16 07:50:52','2021-03-28 18:30:27','2021-03-28 18:30:27'),(60,'enim blandit mi in porttitor pede','dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices',1,4,3,4,7,2,10,'2021-05-22 05:55:39','2021-03-28 18:30:27','2021-03-28 18:30:27'),(61,'consequat nulla nisl nunc nisl duis bibendum felis','porttitor pede justo eu massa donec dapibus duis at velit',1,1,6,1,8,9,7,'2021-04-22 04:43:56','2021-03-28 18:30:27','2021-03-28 18:30:27'),(62,'turpis sed ante vivamus tortor duis mattis egestas','nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam',1,1,6,2,10,3,1,'2021-05-08 06:25:00','2021-03-28 18:30:27','2021-03-28 18:30:27'),(63,'lectus vestibulum quam sapien varius ut blandit non','accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed',1,2,6,1,6,3,2,'2021-05-26 18:45:04','2021-03-28 18:30:27','2021-03-28 18:30:27'),(64,'maecenas tristique est et tempus semper est quam','donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit',1,6,6,1,7,2,3,'2021-04-14 06:16:35','2021-03-28 18:30:27','2021-03-28 18:30:27'),(65,'dui maecenas tristique est et tempus semper est quam','in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor',1,1,5,1,8,4,10,'2021-04-03 04:28:03','2021-03-28 18:30:27','2021-03-28 18:30:27'),(66,'semper interdum mauris ullamcorper purus sit amet','sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam',1,4,3,2,1,6,1,'2021-04-20 02:11:30','2021-03-28 18:30:27','2021-03-28 18:30:27'),(67,'a nibh in quis justo maecenas rhoncus aliquam','sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc',1,5,7,4,4,9,1,'2021-04-29 16:33:23','2021-03-28 18:30:27','2021-03-28 18:30:27'),(68,'purus aliquet at feugiat non pretium quis','sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus',1,3,3,1,6,5,5,'2021-04-12 02:39:31','2021-03-28 18:30:27','2021-03-28 18:30:27'),(69,'libero non mattis pulvinar nulla','suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue',1,1,6,4,5,10,4,'2021-05-16 21:07:19','2021-03-28 18:30:27','2021-03-28 18:30:27'),(70,'id turpis integer aliquet massa','pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum',1,1,1,1,4,6,10,'2021-05-04 18:37:16','2021-03-28 18:30:27','2021-03-28 18:30:27'),(71,'in quam fringilla rhoncus mauris enim','nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui',1,1,5,3,1,3,10,'2021-04-02 16:12:01','2021-03-28 18:30:27','2021-03-28 18:30:27'),(72,'penatibus et magnis dis parturient montes nascetur','lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan',1,6,2,4,6,9,10,'2021-04-10 07:31:44','2021-03-28 18:30:27','2021-03-28 18:30:27'),(73,'ipsum integer a nibh in quis justo','vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet',1,1,2,1,4,3,2,'2021-05-19 15:04:06','2021-03-28 18:30:27','2021-03-28 18:30:27'),(74,'odio cras mi pede malesuada','sit amet consectetuer adipiscing elit proin risus praesent lectus vestibulum quam sapien varius ut blandit non',1,3,4,1,8,1,8,'2021-04-27 21:57:39','2021-03-28 18:30:27','2021-03-28 18:30:27'),(75,'pede justo eu massa donec dapibus duis at velit','sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor',1,3,6,1,6,4,3,'2021-04-30 07:14:13','2021-03-28 18:30:27','2021-03-28 18:30:27'),(76,'tellus semper interdum mauris','diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam',1,5,7,4,8,9,2,'2021-05-15 21:54:49','2021-03-28 18:30:27','2021-03-28 18:30:27'),(77,'est risus auctor sed tristique in tempus','sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod',1,1,5,4,1,4,8,'2021-04-28 09:09:58','2021-03-28 18:30:27','2021-03-28 18:30:27'),(78,'imperdiet et commodo vulputate justo in blandit','odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor',1,4,3,1,9,5,6,'2021-04-15 21:34:09','2021-03-28 18:30:27','2021-03-28 18:30:27'),(79,'dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis','tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh',1,2,5,2,8,9,7,'2021-05-30 04:41:46','2021-03-28 18:30:27','2021-03-28 18:30:27'),(80,'dui vel sem sed sagittis nam congue risus','sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla',1,4,6,1,6,8,1,'2021-05-31 19:24:31','2021-03-28 18:30:27','2021-03-28 18:30:27'),(81,'nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque','platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat',1,4,1,3,5,10,3,'2021-04-25 10:31:41','2021-03-28 18:30:27','2021-03-28 18:30:27'),(82,'aliquet pulvinar sed nisl','id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec',1,6,4,3,6,8,4,'2021-05-28 04:18:02','2021-03-28 18:30:27','2021-03-28 18:30:27'),(83,'in porttitor pede justo eu massa donec dapibus duis','tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer',1,5,1,2,4,4,7,'2021-05-31 09:07:03','2021-03-28 18:30:27','2021-03-28 18:30:27'),(84,'ultrices aliquet maecenas leo odio condimentum id','blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus',1,5,4,2,4,4,3,'2021-05-10 09:57:32','2021-03-28 18:30:27','2021-03-28 18:30:27'),(85,'posuere felis sed lacus','morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id',1,2,5,1,7,2,5,'2021-04-02 04:11:35','2021-03-28 18:30:27','2021-03-28 18:30:27'),(86,'dictumst morbi vestibulum velit id pretium iaculis diam','vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia',1,3,5,4,1,10,6,'2021-04-20 22:20:51','2021-03-28 18:30:27','2021-03-28 18:30:27'),(87,'nisl duis bibendum felis sed interdum venenatis turpis enim','pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut',1,4,5,3,9,8,7,'2021-05-30 01:23:13','2021-03-28 18:30:27','2021-03-28 18:30:27'),(88,'quam pharetra magna ac consequat metus sapien ut','nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus',1,1,7,1,3,7,2,'2021-05-25 18:29:33','2021-03-28 18:30:27','2021-03-28 18:30:27'),(89,'sed justo pellentesque viverra pede ac diam','maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla',1,6,7,3,2,9,2,'2021-05-09 11:38:50','2021-03-28 18:30:27','2021-03-28 18:30:27'),(90,'aenean sit amet justo morbi','velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam',1,6,6,3,6,6,3,'2021-05-18 09:10:32','2021-03-28 18:30:27','2021-03-28 18:30:27'),(91,'tortor id nulla ultrices aliquet maecenas leo odio condimentum id','morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit',1,1,4,2,2,8,1,'2021-04-20 21:30:52','2021-03-28 18:30:27','2021-03-28 18:30:27'),(92,'cubilia curae donec pharetra magna vestibulum aliquet','varius integer ac leo pellentesque ultrices mattis odio donec vitae',1,4,7,4,1,2,1,'2021-04-16 08:39:06','2021-03-28 18:30:27','2021-03-28 18:30:27'),(93,'nulla ac enim in tempor','natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa',1,3,7,4,6,10,4,'2021-05-03 19:42:36','2021-03-28 18:30:27','2021-03-28 18:30:27'),(94,'nibh fusce lacus purus','diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices',1,4,4,4,10,4,7,'2021-04-29 15:41:29','2021-03-28 18:30:27','2021-03-28 18:30:27'),(95,'sodales scelerisque mauris sit','dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero',1,3,3,3,8,10,6,'2021-04-20 02:25:01','2021-03-28 18:30:27','2021-03-28 18:30:27'),(96,'turpis donec posuere metus vitae ipsum','neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin',1,1,4,4,1,5,3,'2021-05-29 19:46:31','2021-03-28 18:30:27','2021-03-28 18:30:27'),(97,'id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum','eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed',1,2,3,2,8,1,4,'2021-04-05 19:36:52','2021-03-28 18:30:27','2021-03-28 18:30:27'),(98,'posuere cubilia curae duis faucibus accumsan odio curabitur convallis','purus eu magna vulputate luctus cum sociis natoque penatibus et',1,2,3,2,10,4,1,'2021-05-10 18:44:06','2021-03-28 18:30:27','2021-03-28 18:30:27'),(99,'habitasse platea dictumst aliquam augue quam sollicitudin vitae','porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis',1,2,7,2,8,9,6,'2021-04-09 01:48:52','2021-03-28 18:30:27','2021-03-28 18:30:27'),(100,'hac habitasse platea dictumst morbi vestibulum','orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non',1,3,1,2,10,5,6,'2021-05-24 20:44:13','2021-03-28 18:30:27','2021-03-28 18:30:27');
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks_change_history`
--

DROP TABLE IF EXISTS `tasks_change_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks_change_history` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `task_id` int unsigned NOT NULL COMMENT 'Ссылка на задачу',
  `user_id` int unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  `task_field` varchar(50) NOT NULL COMMENT 'Имя поля',
  `before_value` text COMMENT 'Значение до',
  `after_value` text COMMENT 'Значение после',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  PRIMARY KEY (`id`),
  KEY `tasks_change_history_task_id_user_id_idx` (`task_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='История изменений задач';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks_change_history`
--

LOCK TABLES `tasks_change_history` WRITE;
/*!40000 ALTER TABLE `tasks_change_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks_change_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks_comments`
--

DROP TABLE IF EXISTS `tasks_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks_comments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор комментария',
  `task_id` int unsigned NOT NULL COMMENT 'Ссылка на задачу',
  `user_id` int unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  `comment` text NOT NULL COMMENT 'Текст комментария',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  KEY `tasks_comments_user_id_fk` (`user_id`),
  KEY `tasks_comments_task_id_user_id_idx` (`task_id`,`user_id`),
  CONSTRAINT `tasks_comments_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Комментарии к задачам';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks_comments`
--

LOCK TABLES `tasks_comments` WRITE;
/*!40000 ALTER TABLE `tasks_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks_subordination`
--

DROP TABLE IF EXISTS `tasks_subordination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks_subordination` (
  `parent_task_id` int unsigned NOT NULL COMMENT 'Ссылка на родительскую задачу',
  `child_task_id` int unsigned NOT NULL COMMENT 'Ссылка на дочернюю задачу',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  PRIMARY KEY (`parent_task_id`,`child_task_id`) COMMENT 'Составной первичный ключ',
  KEY `tasks_subordination_parent_task_id_child_task_id_idx` (`parent_task_id`,`child_task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Связанность задач';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks_subordination`
--

LOCK TABLES `tasks_subordination` WRITE;
/*!40000 ALTER TABLE `tasks_subordination` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks_subordination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор пользователя',
  `login` varchar(50) NOT NULL COMMENT 'Уникальный логин пользователя',
  `first_name` varchar(50) NOT NULL COMMENT 'Имя пользователя',
  `last_name` varchar(50) NOT NULL COMMENT 'Фамилия пользователя',
  `middle_name` varchar(50) DEFAULT NULL COMMENT 'Отчество пользователя',
  `email` varchar(50) NOT NULL COMMENT 'email пользователя',
  `phone` varchar(50) NOT NULL COMMENT 'Номер телефона пользователя',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Признак активности (0 - удален)',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `users_login_uq` (`login`),
  UNIQUE KEY `users_email_uq` (`email`),
  UNIQUE KEY `users_phone_uq` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Пользователи';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'i.ivanov','Иван','Иванов','Иванович','i.ivanov@test_company.com','79121001111',1,'2021-03-28 16:18:18','2021-03-28 16:18:18'),(2,'p.petrov','Петр','Петров','Петрович','p.petrov@test_company.com','79121002222',1,'2021-03-28 16:18:18','2021-03-28 16:18:18'),(3,'n.sidorov','Николай','Сидоров','Александрович','n.sidorov@test_company.com','79121003333',1,'2021-03-28 16:18:18','2021-03-28 16:18:18'),(4,'s.pavlov','Сергей','Павлов','Семенович','s.pavlov@test_company.com','79121004444',1,'2021-03-28 16:18:18','2021-03-28 16:18:18'),(5,'g.strunin','Геннадий','Струнин','Алексеевич','g.strunin@test_company.com','79121005555',1,'2021-03-28 16:18:18','2021-03-28 16:18:18'),(6,'m.zolotova','Мария','Золотова','Егоровна','m.zolotova@test_company.com','79122001020',1,'2021-03-28 16:18:18','2021-03-28 16:18:18'),(7,'d.veselova','Дарья','Веселова','Игоревна','d.veselova@test_company.com','79122002030',1,'2021-03-28 16:18:18','2021-03-28 16:18:18'),(8,'i.stroinaya','Ирина','Стройная','Олеговна','i.stroinaya@test_company.com','79122003040',1,'2021-03-28 16:18:18','2021-03-28 16:18:18'),(9,'e.zaharova','Екатерина','Захарова','Георгиевна','e.zaharova@test_company.com','79122004050',1,'2021-03-28 16:18:18','2021-03-28 16:18:18'),(10,'a.krasova','Анастасия','Красова','Николаевна','a.krasova@test_company.com','79122005060',1,'2021-03-28 16:18:18','2021-03-28 16:18:18');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_photo`
--

DROP TABLE IF EXISTS `users_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_photo` (
  `user_id` int unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  `file_directory` varchar(255) NOT NULL COMMENT 'Уникальный путь к файлу',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `file_directory` (`file_directory`),
  CONSTRAINT `users_photo_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Фото пользователей';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_photo`
--

LOCK TABLES `users_photo` WRITE;
/*!40000 ALTER TABLE `users_photo` DISABLE KEYS */;
INSERT INTO `users_photo` VALUES (1,'users_photo/i.ivanov.png','2021-03-28 16:24:19','2021-03-28 16:24:19'),(2,'users_photo/p.petrov.png','2021-03-28 16:24:19','2021-03-28 16:24:19'),(3,'users_photo/n.sidorov.png','2021-03-28 16:24:19','2021-03-28 16:24:19'),(4,'users_photo/s.pavlov.png','2021-03-28 16:24:19','2021-03-28 16:24:19'),(5,'users_photo/g.strunin.png','2021-03-28 16:24:19','2021-03-28 16:24:19'),(6,'users_photo/m.zolotova.png','2021-03-28 16:24:19','2021-03-28 16:24:19'),(7,'users_photo/d.veselova.png','2021-03-28 16:24:19','2021-03-28 16:24:19'),(8,'users_photo/i.stroinaya.png','2021-03-28 16:24:19','2021-03-28 16:24:19'),(9,'users_photo/e.zaharova.png','2021-03-28 16:24:19','2021-03-28 16:24:19'),(10,'users_photo/a.krasova.png','2021-03-28 16:24:19','2021-03-28 16:24:19');
/*!40000 ALTER TABLE `users_photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_profiles`
--

DROP TABLE IF EXISTS `users_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_profiles` (
  `user_id` int unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  `gender` char(1) NOT NULL COMMENT 'Пол',
  `birthday` date NOT NULL COMMENT 'Дата рождения',
  `department_id` int unsigned NOT NULL COMMENT 'Ссылка на отдел',
  `position_id` int unsigned NOT NULL COMMENT 'Ссылка на должность',
  `last_login` datetime DEFAULT NULL COMMENT 'Последний вход в систему',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  UNIQUE KEY `user_id` (`user_id`),
  KEY `users_profiles_birthday` (`birthday`),
  CONSTRAINT `users_profiles_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Профили пользователей';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_profiles`
--

LOCK TABLES `users_profiles` WRITE;
/*!40000 ALTER TABLE `users_profiles` DISABLE KEYS */;
INSERT INTO `users_profiles` VALUES (1,'M','1985-08-11',5,1,NULL,'2021-03-28 17:01:59','2021-03-28 17:01:59'),(2,'M','1978-03-25',5,4,NULL,'2021-03-28 17:01:59','2021-03-28 17:01:59'),(3,'M','1991-07-05',5,5,NULL,'2021-03-28 17:01:59','2021-03-28 17:01:59'),(4,'M','1982-11-17',3,1,NULL,'2021-03-28 17:01:59','2021-03-28 17:01:59'),(5,'M','1997-04-29',5,6,NULL,'2021-03-28 17:01:59','2021-03-28 17:01:59'),(6,'W','1979-09-03',1,1,NULL,'2021-03-28 17:01:59','2021-03-28 17:59:01'),(7,'W','1989-02-28',2,1,NULL,'2021-03-28 17:01:59','2021-03-28 17:01:59'),(8,'W','1982-07-15',2,2,NULL,'2021-03-28 17:01:59','2021-03-28 17:01:59'),(9,'W','1999-01-30',3,3,NULL,'2021-03-28 17:01:59','2021-03-28 17:01:59'),(10,'W','1981-05-10',4,1,NULL,'2021-03-28 17:01:59','2021-03-28 17:01:59');
/*!40000 ALTER TABLE `users_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles_projects`
--

DROP TABLE IF EXISTS `users_roles_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_roles_projects` (
  `project_id` int unsigned NOT NULL COMMENT 'Ссылка на проект',
  `user_id` int unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  `role_id` int unsigned NOT NULL COMMENT 'Ссылка на роль',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`project_id`,`user_id`) COMMENT 'Составной первичный ключ',
  KEY `users_roles_projects_user_id_fk` (`user_id`),
  CONSTRAINT `users_roles_projects_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Роли пользователей в проектах';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles_projects`
--

LOCK TABLES `users_roles_projects` WRITE;
/*!40000 ALTER TABLE `users_roles_projects` DISABLE KEYS */;
INSERT INTO `users_roles_projects` VALUES (1,1,1,'2021-03-28 17:20:05','2021-03-28 17:20:05'),(1,2,2,'2021-03-28 17:20:05','2021-03-28 17:20:05'),(1,3,2,'2021-03-28 17:20:05','2021-03-28 17:20:05'),(1,4,1,'2021-03-28 17:20:05','2021-03-28 17:20:05'),(1,5,2,'2021-03-28 17:20:05','2021-03-28 17:20:05'),(1,6,2,'2021-03-28 17:20:05','2021-03-28 17:20:05'),(1,7,2,'2021-03-28 17:20:05','2021-03-28 17:20:05'),(1,8,2,'2021-03-28 17:20:05','2021-03-28 17:20:05'),(1,9,3,'2021-03-28 17:20:05','2021-03-28 17:20:05'),(1,10,2,'2021-03-28 17:20:05','2021-03-28 17:20:05');
/*!40000 ALTER TABLE `users_roles_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_count_tasks_statuses`
--

DROP TABLE IF EXISTS `v_count_tasks_statuses`;
/*!50001 DROP VIEW IF EXISTS `v_count_tasks_statuses`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_count_tasks_statuses` AS SELECT 
 1 AS `name`,
 1 AS `TO DO`,
 1 AS `IN PROGRESS`,
 1 AS `HOLD`,
 1 AS `TEST`,
 1 AS `REWIEV`,
 1 AS `READY FOR RELEASE`,
 1 AS `DONE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_workers`
--

DROP TABLE IF EXISTS `v_workers`;
/*!50001 DROP VIEW IF EXISTS `v_workers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_workers` AS SELECT 
 1 AS `id`,
 1 AS `fio`,
 1 AS `login`,
 1 AS `birthday`,
 1 AS `phone`,
 1 AS `email`,
 1 AS `department`,
 1 AS `position`,
 1 AS `gender`,
 1 AS `status`,
 1 AS `last_login`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_count_tasks_statuses`
--

/*!50001 DROP VIEW IF EXISTS `v_count_tasks_statuses`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_count_tasks_statuses` AS select `p`.`name` AS `name`,sum(if((`t`.`status_id` = 1),1,0)) AS `TO DO`,sum(if((`t`.`status_id` = 2),1,0)) AS `IN PROGRESS`,sum(if((`t`.`status_id` = 3),1,0)) AS `HOLD`,sum(if((`t`.`status_id` = 4),1,0)) AS `TEST`,sum(if((`t`.`status_id` = 5),1,0)) AS `REWIEV`,sum(if((`t`.`status_id` = 6),1,0)) AS `READY FOR RELEASE`,sum(if((`t`.`status_id` = 7),1,0)) AS `DONE` from ((`tasks` `t` join `projects` `p` on((`t`.`project_id` = `p`.`id`))) join `task_statuses` `ts` on((`t`.`status_id` = `ts`.`id`))) where (`t`.`task_type_id` in (2,3,4,5)) group by `p`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_workers`
--

/*!50001 DROP VIEW IF EXISTS `v_workers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_workers` AS select `u`.`id` AS `id`,concat(`u`.`last_name`,' ',`u`.`first_name`,' ',`u`.`last_name`) AS `fio`,`u`.`login` AS `login`,`up`.`birthday` AS `birthday`,`u`.`phone` AS `phone`,`u`.`email` AS `email`,`d`.`name` AS `department`,`p`.`name` AS `position`,`up`.`gender` AS `gender`,if((`u`.`is_active` = 1),'Работает','Уволен') AS `status`,`up`.`last_login` AS `last_login` from (((`users` `u` left join `users_profiles` `up` on((`u`.`id` = `up`.`user_id`))) left join `departments` `d` on((`up`.`department_id` = `d`.`id`))) left join `positions` `p` on((`up`.`position_id` = `p`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-28 19:16:35
