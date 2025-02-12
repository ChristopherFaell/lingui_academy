/*!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.6.18-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: lingui_academy
-- ------------------------------------------------------
-- Server version	10.6.18-MariaDB-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `classroom`
--

DROP TABLE IF EXISTS `classroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classroom` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `capacity` bigint(20) unsigned NOT NULL,
  `house_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_classroom_house_id_FK` (`house_id`),
  CONSTRAINT `idx_classroom_house_id_FK` FOREIGN KEY (`house_id`) REFERENCES `house` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classroom`
--

LOCK TABLES `classroom` WRITE;
/*!40000 ALTER TABLE `classroom` DISABLE KEYS */;
/*!40000 ALTER TABLE `classroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classroom_information`
--

DROP TABLE IF EXISTS `classroom_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classroom_information` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `classroom_id` bigint(20) unsigned NOT NULL,
  `modality_id` bigint(20) unsigned NOT NULL,
  `level_id` bigint(20) unsigned NOT NULL,
  `unit_id` bigint(20) unsigned NOT NULL,
  `component_id` bigint(20) unsigned DEFAULT NULL,
  `teacher_user_language_id` bigint(20) unsigned NOT NULL,
  `classroom_type_id` bigint(20) unsigned NOT NULL,
  `start_date_time` datetime NOT NULL,
  `end_date_time` datetime NOT NULL,
  `duration_hour` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_classroom_information_classroom_id_FK` (`classroom_id`),
  KEY `idx_classroom_information_modality_id_FK` (`modality_id`),
  KEY `idx_classroom_information_level_id_FK` (`level_id`),
  KEY `idx_classroom_information_unit_id_FK` (`unit_id`),
  KEY `idx_classroom_information_component_id_FK` (`component_id`),
  KEY `idx_classroom_information_classroom_type_id_FK` (`classroom_type_id`),
  KEY `idx_classroom_information_teacher_user_language_id_FK` (`teacher_user_language_id`),
  CONSTRAINT `idx_classroom_information_classroom_id_FK` FOREIGN KEY (`classroom_id`) REFERENCES `classroom` (`id`),
  CONSTRAINT `idx_classroom_information_classroom_type_id_FK` FOREIGN KEY (`classroom_type_id`) REFERENCES `classroom_type` (`id`),
  CONSTRAINT `idx_classroom_information_component_id_FK` FOREIGN KEY (`component_id`) REFERENCES `component` (`id`),
  CONSTRAINT `idx_classroom_information_level_id_FK` FOREIGN KEY (`level_id`) REFERENCES `level` (`id`),
  CONSTRAINT `idx_classroom_information_modality_id_FK` FOREIGN KEY (`modality_id`) REFERENCES `modality` (`id`),
  CONSTRAINT `idx_classroom_information_teacher_user_language_id_FK` FOREIGN KEY (`teacher_user_language_id`) REFERENCES `teacher_user_language` (`id`),
  CONSTRAINT `idx_classroom_information_unit_id_FK` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classroom_information`
--

LOCK TABLES `classroom_information` WRITE;
/*!40000 ALTER TABLE `classroom_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `classroom_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classroom_type`
--

DROP TABLE IF EXISTS `classroom_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classroom_type` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classroom_type`
--

LOCK TABLES `classroom_type` WRITE;
/*!40000 ALTER TABLE `classroom_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `classroom_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `component`
--

DROP TABLE IF EXISTS `component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `component` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `component`
--

LOCK TABLES `component` WRITE;
/*!40000 ALTER TABLE `component` DISABLE KEYS */;
/*!40000 ALTER TABLE `component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract`
--

DROP TABLE IF EXISTS `contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contract` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `month_amount` bigint(20) unsigned NOT NULL,
  `hour_amount` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract`
--

LOCK TABLES `contract` WRITE;
/*!40000 ALTER TABLE `contract` DISABLE KEYS */;
/*!40000 ALTER TABLE `contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_type`
--

DROP TABLE IF EXISTS `document_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_type` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `abbrevation` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_type`
--

LOCK TABLES `document_type` WRITE;
/*!40000 ALTER TABLE `document_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `document_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollment_level`
--

DROP TABLE IF EXISTS `enrollment_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrollment_level` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` bigint(20) unsigned NOT NULL,
  `language_id` bigint(20) unsigned NOT NULL,
  `level_id` bigint(20) unsigned NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_enrollment_level_student_id_FK` (`student_id`),
  KEY `idx_enrollment_level_language_id_FK` (`language_id`),
  KEY `idx_enrollment_level_level_id_FK` (`level_id`),
  CONSTRAINT `idx_enrollment_level_language_id_FK` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`),
  CONSTRAINT `idx_enrollment_level_level_id_FK` FOREIGN KEY (`level_id`) REFERENCES `level` (`id`),
  CONSTRAINT `idx_enrollment_level_student_id_FK` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment_level`
--

LOCK TABLES `enrollment_level` WRITE;
/*!40000 ALTER TABLE `enrollment_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `enrollment_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollment_level_unit`
--

DROP TABLE IF EXISTS `enrollment_level_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrollment_level_unit` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `enrollment_level_id` bigint(20) unsigned NOT NULL,
  `unit_id` bigint(20) unsigned NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_enrollment_unit_enrollment_level_id_FK` (`enrollment_level_id`),
  KEY `idx_enrollment_unit_unit_id_FK` (`unit_id`),
  CONSTRAINT `idx_enrollment_unit_enrollment_level_id_FK` FOREIGN KEY (`enrollment_level_id`) REFERENCES `enrollment_level` (`id`),
  CONSTRAINT `idx_enrollment_unit_unit_id_FK` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment_level_unit`
--

LOCK TABLES `enrollment_level_unit` WRITE;
/*!40000 ALTER TABLE `enrollment_level_unit` DISABLE KEYS */;
/*!40000 ALTER TABLE `enrollment_level_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `house`
--

DROP TABLE IF EXISTS `house`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `house` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `house`
--

LOCK TABLES `house` WRITE;
/*!40000 ALTER TABLE `house` DISABLE KEYS */;
/*!40000 ALTER TABLE `house` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `url` text NOT NULL,
  `icon` varchar(255) NOT NULL,
  `item_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_item_item_id_FK` (`item_id`),
  CONSTRAINT `idx_item_item_id_FK` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `abbreviation` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `level`
--

DROP TABLE IF EXISTS `level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `level` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level`
--

LOCK TABLES `level` WRITE;
/*!40000 ALTER TABLE `level` DISABLE KEYS */;
/*!40000 ALTER TABLE `level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modality`
--

DROP TABLE IF EXISTS `modality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modality` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kind` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modality`
--

LOCK TABLES `modality` WRITE;
/*!40000 ALTER TABLE `modality` DISABLE KEYS */;
/*!40000 ALTER TABLE `modality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_item`
--

DROP TABLE IF EXISTS `permission_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` bigint(20) unsigned NOT NULL,
  `item_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_permission_item_permission_id_FK` (`permission_id`),
  KEY `idx_permission_item_item_id_FK` (`item_id`),
  CONSTRAINT `idx_permission_item_item_id_FK` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  CONSTRAINT `idx_permission_item_permission_id_FK` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_item`
--

LOCK TABLES `permission_item` WRITE;
/*!40000 ALTER TABLE `permission_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permission_item`
--

DROP TABLE IF EXISTS `role_permission_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_permission_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned NOT NULL,
  `permission_id` bigint(20) unsigned NOT NULL,
  `item_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_role_permission_item_role_id_FK` (`role_id`),
  KEY `idx_role_permission_item_permission_id_FK` (`permission_id`),
  KEY `idx_role_permission_item_item_id_FK` (`item_id`),
  CONSTRAINT `idx_role_permission_item_item_id_FK` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  CONSTRAINT `idx_role_permission_item_permission_id_FK` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`),
  CONSTRAINT `idx_role_permission_item_role_id_FK` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permission_item`
--

LOCK TABLES `role_permission_item` WRITE;
/*!40000 ALTER TABLE `role_permission_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_permission_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `student_code` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_student_user_id_FK` (`user_id`),
  CONSTRAINT `idx_student_user_id_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_classroom_information`
--

DROP TABLE IF EXISTS `student_classroom_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_classroom_information` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` bigint(20) unsigned NOT NULL,
  `classroom_information_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_student_classroom_information_student_id_FK` (`student_id`),
  KEY `idx_student_classroom_information_classroom_information_id_FK` (`classroom_information_id`),
  CONSTRAINT `idx_student_classroom_information_classroom_information_id_FK` FOREIGN KEY (`classroom_information_id`) REFERENCES `classroom_information` (`id`),
  CONSTRAINT `idx_student_classroom_information_student_id_FK` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_classroom_information`
--

LOCK TABLES `student_classroom_information` WRITE;
/*!40000 ALTER TABLE `student_classroom_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_classroom_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_contract`
--

DROP TABLE IF EXISTS `student_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_contract` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` bigint(20) unsigned NOT NULL,
  `contract_id` bigint(20) unsigned NOT NULL,
  `contract_start_date` date NOT NULL,
  `contract_end_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_student_contract_student_id_FK` (`student_id`),
  KEY `idx_student_contract_contract_id_FK` (`contract_id`),
  CONSTRAINT `idx_student_contract_contract_id_FK` FOREIGN KEY (`contract_id`) REFERENCES `contract` (`id`),
  CONSTRAINT `idx_student_contract_student_id_FK` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_contract`
--

LOCK TABLES `student_contract` WRITE;
/*!40000 ALTER TABLE `student_contract` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_language`
--

DROP TABLE IF EXISTS `student_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_language` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` bigint(20) unsigned NOT NULL,
  `language_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_student_language_language_id_FK` (`language_id`),
  KEY `idx_student_language_student_id_FK` (`student_id`),
  CONSTRAINT `idx_student_language_language_id_FK` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`),
  CONSTRAINT `idx_student_language_student_id_FK` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_language`
--

LOCK TABLES `student_language` WRITE;
/*!40000 ALTER TABLE `student_language` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_user_language`
--

DROP TABLE IF EXISTS `teacher_user_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher_user_language` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `language_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_teacher_user_language_user_id_FK` (`user_id`),
  KEY `idx_teacher_user_language_language_id_FK` (`language_id`),
  CONSTRAINT `idx_teacher_user_language_language_id_FK` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`),
  CONSTRAINT `idx_teacher_user_language_user_id_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_user_language`
--

LOCK TABLES `teacher_user_language` WRITE;
/*!40000 ALTER TABLE `teacher_user_language` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher_user_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit`
--

LOCK TABLES `unit` WRITE;
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;
/*!40000 ALTER TABLE `unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `document_type_id` bigint(20) unsigned NOT NULL,
  `document_number` bigint(20) unsigned NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` bigint(20) unsigned NOT NULL,
  `workday_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_document_number_unique` (`document_number`),
  UNIQUE KEY `idx_user_email_unique` (`email`),
  KEY `idx_user_document_type_id_FK` (`document_type_id`),
  KEY `idx_user_workday_id_FK` (`workday_id`),
  CONSTRAINT `idx_user_document_type_id_FK` FOREIGN KEY (`document_type_id`) REFERENCES `document_type` (`id`),
  CONSTRAINT `idx_user_workday_id_FK` FOREIGN KEY (`workday_id`) REFERENCES `workday` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_role_user_id_FK` (`user_id`),
  KEY `idx_user_role_role_id_FK` (`role_id`),
  CONSTRAINT `idx_user_role_role_id_FK` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `idx_user_role_user_id_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workday`
--

DROP TABLE IF EXISTS `workday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workday` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `journal` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workday`
--

LOCK TABLES `workday` WRITE;
/*!40000 ALTER TABLE `workday` DISABLE KEYS */;
/*!40000 ALTER TABLE `workday` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-29 15:06:27
