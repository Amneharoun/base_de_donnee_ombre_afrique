-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: Ombre_Afrique
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.24.04.1

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
-- Table structure for table `Plat`
--

DROP TABLE IF EXISTS `Plat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Plat` (
  `code_plat` bigint NOT NULL AUTO_INCREMENT,
  `nom_plat` varchar(255) DEFAULT NULL,
  `description_plat` text,
  `prix_plat` decimal(10,2) DEFAULT NULL,
  `categorie_plat` varchar(100) DEFAULT NULL,
  `temps_preparation_plat` int DEFAULT NULL,
  `liste_ingredient_plat` text,
  PRIMARY KEY (`code_plat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Plat`
--

LOCK TABLES `Plat` WRITE;
/*!40000 ALTER TABLE `Plat` DISABLE KEYS */;
/*!40000 ALTER TABLE `Plat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id_client` bigint NOT NULL AUTO_INCREMENT,
  `nom_client` varchar(100) DEFAULT NULL,
  `tel_client` varchar(20) DEFAULT NULL,
  `adresse_client` text,
  `preference_client` text,
  `point_fidelite_client` int DEFAULT NULL,
  `id_commande` bigint DEFAULT NULL,
  PRIMARY KEY (`id_client`),
  KEY `id_commande` (`id_commande`),
  CONSTRAINT `client_ibfk_1` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (5,'youma','44444444','Gassi, N’Djamena','Peu épicé',100,5);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commande`
--

DROP TABLE IF EXISTS `commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commande` (
  `id_commande` bigint NOT NULL AUTO_INCREMENT,
  `date_heure_commande` datetime DEFAULT NULL,
  `type_commande` varchar(50) DEFAULT NULL,
  `montant_commande` decimal(10,2) DEFAULT NULL,
  `statut_commande` varchar(50) DEFAULT NULL,
  `id_employe` bigint DEFAULT NULL,
  `id_facture` bigint DEFAULT NULL,
  PRIMARY KEY (`id_commande`),
  KEY `id_employe` (`id_employe`),
  KEY `id_facture` (`id_facture`),
  CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`id_employe`) REFERENCES `employe` (`id_employe`),
  CONSTRAINT `commande_ibfk_2` FOREIGN KEY (`id_facture`) REFERENCES `facture` (`id_facture`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commande`
--

LOCK TABLES `commande` WRITE;
/*!40000 ALTER TABLE `commande` DISABLE KEYS */;
INSERT INTO `commande` VALUES (5,'2025-05-01 11:00:00','sur place',10.00,'tchadienne',2,1),(8,'2025-08-09 14:00:00','livraison domicile',1.00,'tchadienne',3,2),(9,'2024-10-09 17:30:00','livraison domicile',11.00,'tchadienne',4,3);
/*!40000 ALTER TABLE `commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `composer`
--

DROP TABLE IF EXISTS `composer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `composer` (
  `id_plat` bigint NOT NULL,
  `id_ingredient` bigint NOT NULL,
  PRIMARY KEY (`id_plat`,`id_ingredient`),
  KEY `id_ingredient` (`id_ingredient`),
  CONSTRAINT `composer_ibfk_1` FOREIGN KEY (`id_plat`) REFERENCES `plat` (`id_plat`),
  CONSTRAINT `composer_ibfk_2` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient` (`id_ingredient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `composer`
--

LOCK TABLES `composer` WRITE;
/*!40000 ALTER TABLE `composer` DISABLE KEYS */;
INSERT INTO `composer` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `composer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contenir`
--

DROP TABLE IF EXISTS `contenir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contenir` (
  `id_commande` bigint NOT NULL,
  `id_plat` bigint NOT NULL,
  PRIMARY KEY (`id_commande`,`id_plat`),
  KEY `id_plat` (`id_plat`),
  CONSTRAINT `contenir_ibfk_1` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`),
  CONSTRAINT `contenir_ibfk_2` FOREIGN KEY (`id_plat`) REFERENCES `plat` (`id_plat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenir`
--

LOCK TABLES `contenir` WRITE;
/*!40000 ALTER TABLE `contenir` DISABLE KEYS */;
INSERT INTO `contenir` VALUES (5,3);
/*!40000 ALTER TABLE `contenir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destiner`
--

DROP TABLE IF EXISTS `destiner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `destiner` (
  `id_table` bigint NOT NULL,
  `id_commande` bigint NOT NULL,
  PRIMARY KEY (`id_table`,`id_commande`),
  KEY `id_commande` (`id_commande`),
  CONSTRAINT `destiner_ibfk_1` FOREIGN KEY (`id_table`) REFERENCES `restaurant_table` (`id_table`),
  CONSTRAINT `destiner_ibfk_2` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destiner`
--

LOCK TABLES `destiner` WRITE;
/*!40000 ALTER TABLE `destiner` DISABLE KEYS */;
INSERT INTO `destiner` VALUES (1,5);
/*!40000 ALTER TABLE `destiner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employe`
--

DROP TABLE IF EXISTS `employe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employe` (
  `id_employe` bigint NOT NULL AUTO_INCREMENT,
  `nom_employe` varchar(100) DEFAULT NULL,
  `prenom_employe` varchar(100) DEFAULT NULL,
  `tel_employe` varchar(20) DEFAULT NULL,
  `adresse_employe` text,
  `poste_employe` varchar(100) DEFAULT NULL,
  `salaire_employe` decimal(10,2) DEFAULT NULL,
  `date_embauche_employe` date DEFAULT NULL,
  `categorie_plat_preferee` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_employe`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employe`
--

LOCK TABLES `employe` WRITE;
/*!40000 ALTER TABLE `employe` DISABLE KEYS */;
INSERT INTO `employe` VALUES (1,'Mahamat','Issa','66223344','Avenue Charles de Gaulle, N’Djamena','Serveur',150000.00,'2023-03-01',NULL),(2,'Abakar','Fatimé','66334455','Quartier Chagoua, N’Djamena','Cuisinière',175000.00,'2022-09-15',NULL),(3,'Mht','abdelkerim','66847475','farcha N\'Djamena',' DG',3.00,'2017-07-01',NULL),(4,'Afrah','Haroun','60798764','farcha N\'Djamena',' PDG',1.00,'2025-07-01',NULL),(5,'Dupont','Zoe','0600000000','123 rue de Paris','Serveur',1800.00,'2024-01-15','italien'),(6,'mama','fatime','63079057','soudan rue de 123','cuisiniére',1900.00,'2024-01-15','italien');
/*!40000 ALTER TABLE `employe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employé`
--

DROP TABLE IF EXISTS `employé`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employé` (
  `id_employé_employé` bigint NOT NULL AUTO_INCREMENT,
  `nom_employé` bigint DEFAULT NULL,
  `prenom_employé` bigint DEFAULT NULL,
  `tel_employé` bigint DEFAULT NULL,
  `adresse_employé` bigint DEFAULT NULL,
  `post_employé` bigint DEFAULT NULL,
  `salaire_employé` bigint DEFAULT NULL,
  `dat_embouche_employé` bigint DEFAULT NULL,
  PRIMARY KEY (`id_employé_employé`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employé`
--

LOCK TABLES `employé` WRITE;
/*!40000 ALTER TABLE `employé` DISABLE KEYS */;
/*!40000 ALTER TABLE `employé` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facture`
--

DROP TABLE IF EXISTS `facture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facture` (
  `id_facture` bigint NOT NULL AUTO_INCREMENT,
  `date_facture` date DEFAULT NULL,
  `montant_facture` decimal(10,2) DEFAULT NULL,
  `detail_plat_facture` text,
  `mode_paiement_facture` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_facture`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facture`
--

LOCK TABLES `facture` WRITE;
/*!40000 ALTER TABLE `facture` DISABLE KEYS */;
INSERT INTO `facture` VALUES (1,'2025-04-01',10.00,'pizza','moov money'),(2,'2025-04-01',10.00,'hamburgure','airtel money'),(3,'2025-01-01',3.00,'soup','orange money');
/*!40000 ALTER TABLE `facture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fournisseur`
--

DROP TABLE IF EXISTS `fournisseur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fournisseur` (
  `id_fournisseur` bigint NOT NULL AUTO_INCREMENT,
  `nom_fournisseur` varchar(100) DEFAULT NULL,
  `contact_fournisseur` varchar(50) DEFAULT NULL,
  `condition_paiement` text,
  `specialite_fournisseur` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_fournisseur`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fournisseur`
--

LOCK TABLES `fournisseur` WRITE;
/*!40000 ALTER TABLE `fournisseur` DISABLE KEYS */;
INSERT INTO `fournisseur` VALUES (1,'Fournil Tchad Alimentation','fourniltchad@td.com','Paiement mensuel','Produits secs'),(2,'Marché Central Viande','marchéviande@td.com','Paiement à la commande','Viande locale');
/*!40000 ALTER TABLE `fournisseur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient` (
  `id_ingredient` bigint NOT NULL AUTO_INCREMENT,
  `nom_ingredient` varchar(100) DEFAULT NULL,
  `quantite_ingredient` varchar(50) DEFAULT NULL,
  `prix_ingredient` decimal(10,2) DEFAULT NULL,
  `description_ingredient` text,
  `id_fournisseur` bigint DEFAULT NULL,
  PRIMARY KEY (`id_ingredient`),
  KEY `id_fournisseur` (`id_fournisseur`),
  CONSTRAINT `ingredient_ibfk_1` FOREIGN KEY (`id_fournisseur`) REFERENCES `fournisseur` (`id_fournisseur`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES (1,'Arachide','1 kg',700.00,'Graines locales non grillées',1),(2,'Viande de bœuf','500 g',1500.00,'Viande fraîche locale',2);
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plat`
--

DROP TABLE IF EXISTS `plat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plat` (
  `id_plat` bigint NOT NULL AUTO_INCREMENT,
  `nom_plat` varchar(100) DEFAULT NULL,
  `description_plat` text,
  `prix_plat` decimal(10,2) DEFAULT NULL,
  `categorie_plat` varchar(50) DEFAULT NULL,
  `temps_preparation` int DEFAULT NULL,
  `liste_ingredients` text,
  PRIMARY KEY (`id_plat`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plat`
--

LOCK TABLES `plat` WRITE;
/*!40000 ALTER TABLE `plat` DISABLE KEYS */;
INSERT INTO `plat` VALUES (1,'Riz Sauce Arachide','Plat traditionnel avec pâte d’arachide et riz',2500.00,'Tchadien',45,'Riz, Arachide, Sel'),(2,'La Bouillie','Bouillie de mil avec lait et sucre',1500.00,'Petit Déjeuner',20,'Mil, Lait, Sucre'),(3,'hamburgure','hamburgur is delicius',5000.00,'londien',2,'pat, poulet, tomate,'),(4,'souroundou','souroundou just food for my contry',100.00,'tchadien',2,'riz, oignons, tomate,'),(5,'soup','soup is very good food ',1500.00,'tchadien',6,'viande, oignons, pomme de terre,carote,'),(10,'afrah','afrah est belle',9.01,'londienne',1,'reve'),(11,'Pizza Margherita','Pizza avec tomate, mozzarella et basilic',9.99,'italien',15,'tomate, mozzarella, basilic'),(12,'Fasoulia','Fasoulia est delicuiés',8.99,'soudanien',15,'tomte, oignons, haricot');
/*!40000 ALTER TABLE `plat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserver`
--

DROP TABLE IF EXISTS `reserver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserver` (
  `id_client` bigint NOT NULL,
  `id_table` bigint NOT NULL,
  PRIMARY KEY (`id_client`,`id_table`),
  KEY `id_table` (`id_table`),
  CONSTRAINT `reserver_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`),
  CONSTRAINT `reserver_ibfk_2` FOREIGN KEY (`id_table`) REFERENCES `restaurant_table` (`id_table`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserver`
--

LOCK TABLES `reserver` WRITE;
/*!40000 ALTER TABLE `reserver` DISABLE KEYS */;
INSERT INTO `reserver` VALUES (5,1);
/*!40000 ALTER TABLE `reserver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_table`
--

DROP TABLE IF EXISTS `restaurant_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_table` (
  `id_table` bigint NOT NULL AUTO_INCREMENT,
  `nom_table` varchar(50) DEFAULT NULL,
  `capacite_table` int DEFAULT NULL,
  `zone_emplacement` varchar(100) DEFAULT NULL,
  `etat_table` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_table`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_table`
--

LOCK TABLES `restaurant_table` WRITE;
/*!40000 ALTER TABLE `restaurant_table` DISABLE KEYS */;
INSERT INTO `restaurant_table` VALUES (1,'TCH-01',4,'Salle climatisée','Libre'),(2,'TCH-02',6,'Terrasse ombragée','Occupée');
/*!40000 ALTER TABLE `restaurant_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-02 16:03:46
