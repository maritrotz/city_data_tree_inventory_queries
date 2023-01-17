DROP DATABASE IF EXISTS `city_data_and_tree_inventory`;
CREATE DATABASE  IF NOT EXISTS `city_data_and_tree_inventory` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `city_data_and_tree_inventory`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: city_data_and_tree_inventory
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `city_id` int unsigned NOT NULL AUTO_INCREMENT,
  `city` varchar(30) NOT NULL,
  `metro_id` int unsigned NOT NULL,
  PRIMARY KEY (`city_id`),
  KEY `fk_cities_metro_areas1_idx` (`metro_id`),
  CONSTRAINT `fk_cities_metro_areas1` FOREIGN KEY (`metro_id`) REFERENCES `metro_areas` (`metro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=815 DEFAULT CHARSET=utf8mb3 COMMENT='Longest city name in the US is 22 characters long, so just set it at VARCHAR(30). ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (800,'Albuquerque',700),(801,'Aurora',701),(802,'Austin',702),(803,'Baltimore',703),(804,'Columbus',704),(805,'Durham',705),(806,'Honolulu',706),(807,'Knoxville',707),(808,'Louisville',708),(809,'New York',709),(810,'San Jose',710),(811,'Seattle',711),(812,'Sioux Falls',712),(813,'Tampa',713),(814,'Washington',714);
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city_states`
--

DROP TABLE IF EXISTS `city_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city_states` (
  `city_id` int unsigned NOT NULL,
  `state_id` int unsigned NOT NULL,
  `mental_health_issues_prev` decimal(5,2) unsigned DEFAULT NULL,
  `physical_health_issues_prev` decimal(5,2) unsigned DEFAULT NULL,
  `diabetes_prev` decimal(5,2) unsigned DEFAULT NULL,
  `high_BP_prev` decimal(5,2) unsigned DEFAULT NULL,
  KEY `fk_city_states_cities1_idx` (`city_id`),
  KEY `fk_city_states_states1_idx` (`state_id`),
  CONSTRAINT `fk_city_states_cities1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`city_id`),
  CONSTRAINT `fk_city_states_states1` FOREIGN KEY (`state_id`) REFERENCES `state_pop` (`state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city_states`
--

LOCK TABLES `city_states` WRITE;
/*!40000 ALTER TABLE `city_states` DISABLE KEYS */;
INSERT INTO `city_states` VALUES (800,1008,14.30,13.20,8.70,26.30),(801,1001,13.00,11.40,8.40,26.40),(802,1013,12.40,10.30,9.70,27.30),(803,1006,15.90,13.00,12.60,36.40),(804,1010,15.70,12.60,12.10,34.30),(805,1007,13.10,11.60,10.70,34.20),(806,1004,10.30,10.70,11.20,30.30),(807,1012,16.60,14.20,10.70,33.50),(808,1005,14.90,15.50,12.00,39.00),(809,1009,13.10,12.40,10.90,28.00),(810,1000,10.60,9.90,8.80,24.90),(811,1014,11.50,8.90,7.30,22.00),(812,1011,10.70,10.10,8.00,27.00),(813,1003,15.20,13.90,10.60,32.80),(814,1002,11.40,9.00,9.50,28.00);
/*!40000 ALTER TABLE `city_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metro_areas`
--

DROP TABLE IF EXISTS `metro_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metro_areas` (
  `metro_id` int unsigned NOT NULL AUTO_INCREMENT,
  `metropolitan_area` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`metro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=715 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metro_areas`
--

LOCK TABLES `metro_areas` WRITE;
/*!40000 ALTER TABLE `metro_areas` DISABLE KEYS */;
INSERT INTO `metro_areas` VALUES (700,'Albuquerque, NM'),(701,'Denver-Aurora-Lakewood, CO'),(702,'Austin-Round Rock-Georgetown, TX'),(703,'Baltimore-Colombia-Towson, MD'),(704,'Columbus, OH'),(705,'Durham-Chapel Hill, NC'),(706,'Urban Honolulu, HI'),(707,'Knoxville, TN'),(708,'Lousville/Jefferson County, KY-IN'),(709,'New York-Newark-Jersey City, NY-NJ-PA'),(710,'San Jose-Sunnyvale-Santa Clara, CA'),(711,'Seattle-Tacoma-Bellevue, WA'),(712,'Sioux Falls, SD'),(713,'Tampa-St. Petersburg-Clearwater, FL'),(714,'Washington-Arlington-Alexandria, DC-VA-MD-WV');
/*!40000 ALTER TABLE `metro_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_income`
--

DROP TABLE IF EXISTS `personal_income`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_income` (
  `income_id` int unsigned NOT NULL AUTO_INCREMENT,
  `pers_income_2021` int unsigned DEFAULT NULL,
  `metro_id` int unsigned NOT NULL,
  PRIMARY KEY (`income_id`),
  KEY `fk_personal_income_metro_areas1_idx` (`metro_id`),
  CONSTRAINT `fk_personal_income_metro_areas1` FOREIGN KEY (`metro_id`) REFERENCES `metro_areas` (`metro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=915 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_income`
--

LOCK TABLES `personal_income` WRITE;
/*!40000 ALTER TABLE `personal_income` DISABLE KEYS */;
INSERT INTO `personal_income` VALUES (900,52263,700),(901,78150,701),(902,71372,702),(903,70490,703),(904,59876,704),(905,63375,705),(906,63912,706),(907,55752,707),(908,59425,708),(909,85136,709),(910,136338,710),(911,89274,711),(912,71570,712),(913,58315,713),(914,80822,714);
/*!40000 ALTER TABLE `personal_income` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state_pop`
--

DROP TABLE IF EXISTS `state_pop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state_pop` (
  `state_id` int unsigned NOT NULL AUTO_INCREMENT,
  `state_abbrev` char(2) DEFAULT NULL,
  `total_state_pop` int unsigned DEFAULT NULL,
  `foreign_born_pop` int unsigned DEFAULT NULL,
  `percent_foreign_born` decimal(5,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`state_id`),
  UNIQUE KEY `state_abbrev_UNIQUE` (`state_abbrev`)
) ENGINE=InnoDB AUTO_INCREMENT=1015 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state_pop`
--

LOCK TABLES `state_pop` WRITE;
/*!40000 ALTER TABLE `state_pop` DISABLE KEYS */;
INSERT INTO `state_pop` VALUES (1000,'CA',39237836,10451810,26.60),(1001,'CO',5812069,570273,9.80),(1002,'DC',670050,89226,13.30),(1003,'FL',21781128,4608653,21.20),(1004,'HI',1441553,270345,18.80),(1005,'KY',4509394,182011,4.00),(1006,'MD',6165129,979051,15.90),(1007,'NC',10551162,869786,8.20),(1008,'NM',2115877,192634,9.10),(1009,'NY',19835913,4427356,22.30),(1010,'OH',11780017,584839,5.00),(1011,'SD',895376,30983,3.50),(1012,'TN',6975218,370765,5.30),(1013,'TX',29527941,5092132,17.20),(1014,'WA',7738692,1143311,14.80);
/*!40000 ALTER TABLE `state_pop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tree_classifications`
--

DROP TABLE IF EXISTS `tree_classifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tree_classifications` (
  `tree_id` int unsigned NOT NULL AUTO_INCREMENT,
  `common_name` varchar(45) DEFAULT NULL,
  `scientific_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`tree_id`),
  UNIQUE KEY `scientific_name_UNIQUE` (`scientific_name`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tree_classifications`
--

LOCK TABLES `tree_classifications` WRITE;
/*!40000 ALTER TABLE `tree_classifications` DISABLE KEYS */;
INSERT INTO `tree_classifications` VALUES (1,'Locust','Robinia sp.'),(2,'Oak','Quercus sp.'),(3,'Ash','Fraxinus sp.'),(4,'Scotch pine','Pinus sylvestris'),(5,'Honeylocust','Gleditsia triacanthos'),(6,'Elm hybrid','Ulmus sp.'),(7,'Chinese elm','Ulmus parvifolia'),(8,'Austrian pine','Pinus nigra'),(9,'Willow','Salix sp.'),(10,'American elm','Ulmus americana'),(11,'Ponderosa pine','Pinus ponderosa'),(12,'Blue spruce','Picea pungens'),(13,'Cottonwood','Populus sp.'),(14,'Lanceleaf cottonwood','Populus acuminata'),(15,'Littleleaf linden','Tilia cordata'),(16,'White ash','Fraxinus americana'),(17,'Apple/Crabapple','Malus sp.'),(18,'Green ash','Fraxinus pennsylvanica'),(19,'Chanticleer pear','Pyrus calleryana'),(20,'Shademaster honeylocust','Gleditsia triacanthos \'Shademaster\''),(21,'Northern red oak','Quercus rubra'),(22,'Linden','Tilia sp.'),(23,'English oak','Quercus robur'),(24,'Escarpment live oak','Quercus fusiformis'),(25,'Pecan','Carya illinoinensis'),(26,'Southern live oak','Quercus virginiana'),(27,'Post oak','Quercus stellata'),(28,'Cedar elm','Ulmus crassifolia'),(29,'Sassafras','Sassafras albidum'),(30,'Red maple','Acer rubrum'),(31,'Freeman maple','Acer freemanii'),(32,'American linden','Tilia americana'),(33,'Arborvitae','Thuja sp.'),(34,'American sycamore','Platanus occidentalis'),(35,'Eastern redbud','Cercis canadensis'),(36,'Norway maple','Acer platanoides'),(37,'Tuliptree','Liriodendron tulipifera'),(38,'Amur maple','Acer tataricum'),(39,'Pin oak','Quercus palustris'),(40,'Sugar maple','Acer saccharum'),(41,'Hedge maple','Acer campestre'),(42,'Black european alder','Alnus glutinosa'),(43,'Eastern cottonwood','Populus deltoides'),(44,'Silver maple','Acer saccharinum'),(45,'Amur corktree','Phellodendron amurense'),(46,'River birch','Betula nigra'),(47,'Trident maple','Acer buergerianum'),(48,'Ginkgo','Ginkgo biloba'),(49,'Shantung maple','Acer truncatum'),(50,'Swamp white oak','Quercus bicolor'),(51,'Common crapemyrtle','Lagerstroemia sp.'),(52,'Chinese redbud','Cercis chinensis'),(53,'Chinese fringe tree','Chionanthus retusus'),(54,'Yellowwood','Cladrastis kentukea'),(55,'Chinese pistache','Pistacia chinensis'),(56,'Giant crape myrtle','Lagerstroemia speciosa'),(57,'Pink tecoma','Tabebuia heterophylla'),(58,'Ohia lehua / ilehua','Metrosideros polymorpha'),(59,'Neem tree','Azadirachta indica'),(60,'Kamani','Calophyllum inophyllum'),(61,'Golden shower','Cassia fistula'),(62,'Standing dead tree (Snag)','None'),(63,'False olive','Cassine orientalis'),(64,'Coconut palm','Cocos nucifera'),(65,'White tecoma','Tabebuia berteroi'),(66,'Tulipwood','Harpullia pendula'),(67,'Conifer','Podocarpus sp.'),(68,'Plumeria pudica','Plumeria pudica'),(69,'Alahe\'e','Psydrax odorata'),(70,'Haole kou','Cordia sebestena'),(71,'Guava','Psidium guajava'),(72,'Formosan koa','Acacia confusa'),(73,'Fiji fan palm','Pritchardia pacifica'),(74,'Fiddlewood','Citharexylum spinosum'),(75,'Scrambled egg tree','Senna surattensis'),(76,'Common hackberry','Celtis occidentalis'),(77,'Loblolly pine','Pinus taeda'),(78,'Willow oak','Quercus phellos'),(79,'Flowering dogwood','Cornus florida'),(80,'Common baldcypress','Taxodium distichum'),(81,'American hornbeam','Carpinus caroliniana'),(82,'London planetree','Platanus x acerifolia'),(83,'Shumard oak','Quercus shumardii'),(84,'Princeton elm','Ulmus americana \'Princeton\''),(85,'Eastern white pine','Pinus strobus'),(86,'Tree of heaven','Ailanthus altissima'),(87,'Southern red oak','Quercus falcata'),(88,'Black walnut','Juglans nigra'),(89,'Black locust','Robinia pseudoacacia'),(90,'White oak','Quercus alba'),(91,'Bur oak','Quercus macrocarpa'),(92,'Common persimmon','Diospyros virginiana'),(93,'Sweetgum','Liquidambar styraciflua'),(94,'Shingle oak','Quercus imbricaria'),(95,'Northern catalpa','Catalpa speciosa'),(96,'Sugar hackberry','Celtis laevigata'),(97,'Siberian elm','Ulmus pumila'),(98,'Black cherry','Prunus serotina'),(99,'Sycamore maple','Acer pseudoplatanus'),(100,'Mugga Ironbark','Eucalyptus sideroxylon'),(101,'California sycamore','Platanus racemosa'),(102,'European white birch','Betula pendula'),(103,'Kwanzan flowering cherry','Prunus serrulata \'Kwanzan\''),(104,'Wintergold crabapple','Malus \'Winter Gold\''),(105,'European beech','Fagus sylvatica'),(106,'Leyland cypress','Cupressocyparis leylandii'),(107,'Orangebark stewartia','Stewartia monadelpha'),(108,'Purpleleaf plum','Prunus x blireiana'),(109,'Thundercloud purpleleaf plum','Prunus cerasifera \'Thundercloud\''),(110,'Japanese snowbell tree','Styrax japonicus'),(111,'Common serviceberry','Amelanchier arborea'),(112,'Cockspur hawthorn','Crataegus crus-galli'),(113,'Purpleleaf plum','Prunus cerasifera'),(114,'Yellow birch','Betula alleghaniensis'),(115,'Dogwood','Cornus sp.'),(116,'Carriere hawthorn','Crataegus lavallei'),(117,'Arnold Buckeye','Aesculus arnoldiana'),(118,'Kentucky Coffeetree','Gymnocladus dioicus'),(119,'Miyabe Maple','Acer miyabei'),(120,'Vanguard elm','Ulmus \'Morton Plainsman\''),(121,'Amur Maackia','Maackia amurensis'),(122,'Crapemyrtle','Lagerstroemia indica'),(123,'Bottlebrush','Callistemon viminalis'),(124,'Loquat','Eriobotrya japonica'),(125,'Sand live oak','Quercus geminata'),(126,'Camphortree','Cinnamomum camphora'),(127,'Bluejack oak','Quercus incana'),(128,'Carolina laurelcherry','Prunus caroliniana'),(129,'Sand pine','Pinus clausa'),(130,'Cabbage palm','Sabal palmetto'),(131,'Nuttall oak','Quercus nuttallii'),(132,'New harmony elm','Ulmus americana \'New Harmony\''),(133,'Plane tree','Platanus sp.'),(134,'Japanese zelkova','Zelkova serrata');
/*!40000 ALTER TABLE `tree_classifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tree_condition`
--

DROP TABLE IF EXISTS `tree_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tree_condition` (
  `condition_id` int unsigned NOT NULL AUTO_INCREMENT,
  `condition_description` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`condition_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='conditions: dead, poor, fair, good, excellent';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tree_condition`
--

LOCK TABLES `tree_condition` WRITE;
/*!40000 ALTER TABLE `tree_condition` DISABLE KEYS */;
INSERT INTO `tree_condition` VALUES (1,'good'),(2,'fair'),(3,'excellent'),(4,'poor'),(5,'dead/dying');
/*!40000 ALTER TABLE `tree_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tree_measurements`
--

DROP TABLE IF EXISTS `tree_measurements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tree_measurements` (
  `city_id` int unsigned NOT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `tree_id` int unsigned NOT NULL,
  `dbh_cm` decimal(5,2) unsigned DEFAULT NULL,
  `height_m` decimal(5,2) unsigned DEFAULT NULL,
  `condition_id` int unsigned NOT NULL,
  `native_id` int unsigned NOT NULL,
  KEY `city_id_idx` (`city_id`),
  KEY `fk_city_trees_trees1_idx` (`tree_id`),
  KEY `fk_city_trees_tree_condition1_idx` (`condition_id`),
  KEY `fk_city_trees_tree_native_status1_idx` (`native_id`),
  CONSTRAINT `city_id` FOREIGN KEY (`city_id`) REFERENCES `cities` (`city_id`),
  CONSTRAINT `fk_city_trees_tree_condition1` FOREIGN KEY (`condition_id`) REFERENCES `tree_condition` (`condition_id`),
  CONSTRAINT `fk_city_trees_tree_native_status1` FOREIGN KEY (`native_id`) REFERENCES `tree_native_status` (`native_id`),
  CONSTRAINT `fk_city_trees_trees1` FOREIGN KEY (`tree_id`) REFERENCES `tree_classifications` (`tree_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tree_measurements`
--

LOCK TABLES `tree_measurements` WRITE;
/*!40000 ALTER TABLE `tree_measurements` DISABLE KEYS */;
INSERT INTO `tree_measurements` VALUES (800,-106.56836580,35.06045584,1,0.00,25.03,5,3),(800,-106.65503720,35.13927167,2,0.00,101.36,2,3),(800,-106.58112720,35.05217585,3,0.00,45.29,5,3),(800,-106.57505580,35.05245023,5,0.00,147.64,5,1),(800,-106.71653930,35.14963169,5,0.00,98.43,1,1),(800,-106.71664030,35.14974424,5,0.00,114.83,1,1),(800,-106.71644050,35.15012146,6,0.00,98.43,1,3),(800,-106.71638440,35.15002222,6,0.00,82.02,1,3),(800,-106.71633410,35.14993063,3,0.00,49.21,1,3),(800,-106.71624920,35.14983483,6,0.00,82.02,1,3),(800,-106.71618680,35.14970982,3,0.00,65.62,1,3),(800,-106.71612760,35.14963007,7,0.00,82.02,1,1),(800,-106.71607270,35.14953650,7,0.00,65.62,1,1),(800,-106.71601300,35.14943452,6,0.00,59.06,1,3),(800,-106.71593720,35.14934022,7,0.00,98.43,1,1),(800,-106.71586830,35.14924614,6,0.00,82.02,1,3),(800,-106.71581580,35.14914715,6,0.00,65.62,1,3),(800,-106.71573840,35.14903236,3,0.00,59.06,1,3),(800,-106.71567840,35.14893369,3,0.00,49.21,2,3),(800,-106.71562250,35.14886249,7,0.00,49.21,1,1),(800,-106.71552320,35.14869892,3,0.00,65.62,1,3),(800,-106.71545910,35.14861084,7,0.00,65.62,2,1),(800,-106.71539870,35.14849712,7,0.00,65.62,1,1),(800,-106.71564550,35.14805579,5,0.00,98.43,1,1),(800,-106.71573060,35.14811610,5,0.00,82.02,4,1),(801,-104.79458000,39.63095000,8,50.80,0.00,2,1),(801,-104.67708700,39.59151500,8,7.62,0.00,2,1),(801,-104.75526500,39.64327600,9,20.32,0.00,1,3),(801,-104.82361100,39.64294700,10,31.75,0.00,2,1),(801,-104.67585200,39.59158700,11,10.16,0.00,2,2),(801,-104.74060200,39.66032600,5,7.62,0.00,2,1),(801,-104.77898000,39.65251400,8,17.78,0.00,2,1),(801,-104.84169760,39.68288123,12,17.78,0.00,2,2),(801,-104.75492600,39.64257100,13,30.48,0.00,2,3),(801,-104.74074500,39.66048500,14,8.89,0.00,1,2),(801,-104.80798700,39.67111600,15,10.16,0.00,2,1),(801,-104.87140100,39.68554000,16,15.24,0.00,5,1),(801,-104.81692910,39.71140186,12,25.40,0.00,4,2),(801,-104.75565400,39.64292100,17,25.40,0.00,2,3),(801,-104.74154500,39.66000100,8,15.24,0.00,1,1),(801,-104.87620500,39.73123600,18,50.80,0.00,2,1),(801,-104.75568180,39.73506406,19,25.40,0.00,2,1),(801,-104.86290900,39.72384261,5,15.24,0.00,4,1),(801,-104.76693870,39.74426605,5,45.72,0.00,2,1),(801,-104.74120400,39.66009700,21,5.08,0.00,2,1),(801,-104.80331940,39.63277444,17,20.32,0.00,1,3),(801,-104.79740300,39.64387800,22,43.18,0.00,2,3),(801,-104.77125200,39.62899800,23,17.78,0.00,1,1),(801,-104.74201600,39.66030800,8,12.70,0.00,2,1),(801,-104.77793590,39.65228554,17,30.48,0.00,2,3),(802,-97.73690460,30.27315066,24,68.58,88.58,4,2),(802,-97.73657690,30.27391038,10,55.88,26.25,2,2),(802,-97.73659670,30.27335967,24,86.36,98.43,4,2),(802,-97.73631910,30.27381596,25,76.20,26.25,4,2),(802,-97.73616730,30.27359805,26,50.80,26.25,2,2),(802,-97.73605630,30.27328994,10,60.96,26.25,2,2),(802,-97.73648850,30.27319048,24,68.58,98.43,2,2),(802,-97.73649000,30.27333063,26,68.58,26.25,4,2),(802,-97.73682110,30.27311879,24,48.26,59.06,4,2),(802,-97.73677570,30.27306578,24,83.82,114.83,4,2),(802,-97.73653330,30.27302805,24,91.44,104.99,2,2),(802,-97.73645850,30.27290503,24,73.66,114.83,1,2),(802,-97.73614440,30.27285182,24,78.74,114.83,2,2),(802,-97.74530500,30.27242725,25,60.96,141.08,2,2),(802,-97.74534400,30.27265455,25,63.50,137.80,2,2),(802,-97.74519410,30.27257318,25,83.82,121.39,2,2),(802,-97.74565120,30.27281227,25,76.20,137.80,2,2),(802,-97.74577010,30.27283741,25,53.34,147.64,2,2),(802,-97.74564990,30.27220111,27,63.50,26.25,2,2),(802,-97.74577850,30.27246317,27,71.12,124.67,2,2),(802,-97.74584020,30.27259138,28,48.26,118.11,4,2),(802,-97.74590500,30.27268239,27,91.44,26.25,2,2),(802,-97.74613490,30.27221920,28,50.80,118.11,2,2),(802,-97.74600660,30.27221224,28,66.04,147.64,2,2),(802,-97.74584460,30.27219164,25,50.80,114.83,2,2),(803,-76.70568460,39.37045186,10,35.56,131.23,2,2),(803,-76.70576590,39.37034711,29,18.80,114.83,1,2),(803,-76.70419620,39.36213277,30,58.93,164.04,1,2),(803,-76.70382900,39.36206055,31,20.83,114.83,3,1),(803,-76.70410420,39.36214655,30,57.66,213.25,4,2),(803,-76.70835440,39.36216210,21,99.82,295.28,1,2),(803,-76.70675260,39.36223853,21,118.11,229.66,2,2),(803,-76.70799430,39.36215479,21,125.73,278.87,2,2),(803,-76.70814780,39.36216514,32,65.53,262.47,3,2),(803,-76.70642810,39.36231399,21,91.95,196.85,3,2),(803,-76.70781200,39.36216594,32,82.80,246.06,1,2),(803,-76.70652310,39.36229439,32,81.28,229.66,1,2),(803,-76.70733410,39.36218346,32,60.71,213.25,1,2),(803,-76.70486050,39.36313629,33,59.94,147.64,4,3),(803,-76.70683620,39.36223166,18,69.09,196.85,2,2),(803,-76.70849630,39.36215818,32,61.72,213.25,2,2),(803,-76.70282610,39.37141143,34,70.10,229.66,1,2),(803,-76.70505690,39.37173573,35,2.54,22.97,4,2),(803,-76.70555130,39.36891796,36,56.64,131.23,3,1),(803,-76.70962160,39.36445823,16,33.53,98.43,2,2),(803,-76.70986260,39.36464138,16,42.93,98.43,1,2),(803,-76.70993770,39.36465173,37,71.37,164.04,3,2),(803,-76.70272080,39.36499393,38,30.48,49.21,2,1),(803,-76.70578040,39.37037144,39,35.56,131.23,2,2),(803,-76.70022580,39.37077310,30,39.37,131.23,2,2),(804,-83.09886440,39.92003384,40,25.40,0.00,1,2),(804,-83.04344610,40.10803001,41,17.78,0.00,2,3),(804,-82.96501020,40.10091001,15,5.08,0.00,2,1),(804,-83.11208020,39.92795936,18,17.78,0.00,4,2),(804,-82.91624930,40.07267436,18,22.86,0.00,4,2),(804,-82.91626570,40.07246727,18,25.40,0.00,4,2),(804,-82.91625480,40.07258534,18,22.86,0.00,4,2),(804,-83.07929360,40.11655707,40,30.48,0.00,2,2),(804,-83.01048510,39.98207361,42,15.24,0.00,2,3),(804,-83.01065070,39.98208040,42,35.56,0.00,1,3),(804,-83.04792830,40.11014081,5,22.86,0.00,2,2),(804,-83.04814090,40.11016984,5,15.24,0.00,2,2),(804,-83.04771210,40.11011179,5,20.32,0.00,2,2),(804,-82.96597700,39.98448845,43,68.58,0.00,2,2),(804,-82.95038730,39.94375783,44,60.96,0.00,2,2),(804,-82.97867530,39.95962336,44,58.42,0.00,2,2),(804,-82.95248760,40.00389137,45,5.08,0.00,3,1),(804,-82.98168240,40.07670649,93,60.96,0.00,1,2),(804,-82.94249600,40.09496254,93,30.48,0.00,2,2),(804,-83.02114800,40.03223271,17,35.56,0.00,2,3),(804,-82.93828360,40.08847206,40,20.32,0.00,2,2),(804,-82.93833920,40.08868035,30,20.32,0.00,2,2),(804,-82.93835110,40.08855541,44,43.18,0.00,2,2),(804,-82.93835420,40.08850798,44,30.48,0.00,2,2),(804,-83.01486580,39.98571174,15,45.72,0.00,2,1),(805,-78.89805390,36.00505754,46,1.27,0.00,3,2),(805,-78.87823180,35.98862431,47,4.06,0.00,3,1),(805,-78.90029220,36.00655796,48,1.27,0.00,3,1),(805,-78.90202900,35.99445078,10,10.16,0.00,1,2),(805,-78.90166950,35.99425222,10,10.16,0.00,1,2),(805,-78.90237360,35.99464284,10,10.16,0.00,1,2),(805,-78.91454150,35.99932469,48,2.03,0.00,3,1),(805,-78.90042900,35.99355886,10,10.16,0.00,1,2),(805,-78.91456160,35.99837424,49,1.27,0.00,3,1),(805,-78.88320000,36.02114000,50,1.27,0.00,3,2),(805,-78.90054170,35.99362288,10,10.16,0.00,1,2),(805,-78.90065430,35.99369016,10,10.16,0.00,1,2),(805,-78.90597760,35.98455051,51,5.08,0.00,1,3),(805,-78.91857150,35.99799123,52,1.27,0.00,3,1),(805,-78.90087020,35.99381385,10,10.16,0.00,1,2),(805,-78.91908780,35.99793047,52,1.27,0.00,1,1),(805,-78.92332970,36.01049382,53,2.54,0.00,3,1),(805,-78.90963750,36.01330609,48,1.27,0.00,3,1),(805,-78.91931980,35.99781437,52,1.27,0.00,2,1),(805,-78.91931710,35.99768200,52,1.27,0.00,2,1),(805,-78.92129370,35.99783325,54,1.27,0.00,3,2),(805,-78.90820850,36.01415486,52,2.03,0.00,3,1),(805,-78.92308330,35.99777267,55,2.03,0.00,3,1),(805,-78.92290490,35.99776281,55,2.03,0.00,3,1),(805,-78.90822890,36.01541555,35,2.54,0.00,3,2),(806,-157.83300000,21.30293590,75,10.16,49.21,4,1),(806,-157.80525160,21.31995578,70,7.62,32.81,1,1),(806,-157.80525700,21.32013569,70,7.62,29.53,1,1),(806,-157.80167100,21.32793442,56,2.54,32.81,1,1),(806,-157.80600000,21.31023000,66,2.54,39.37,1,1),(806,-157.80263030,21.29657492,71,7.62,22.97,1,1),(806,-157.80397210,21.29445633,63,7.62,36.09,1,1),(806,-157.80388890,21.29464002,68,2.54,19.69,1,1),(806,-157.84883270,21.33904136,72,7.62,124.67,2,1),(806,-157.84348500,21.32062442,73,7.62,45.93,2,1),(806,-157.85439090,21.29191911,57,0.00,0.00,1,1),(806,-157.85435870,21.29199034,57,0.00,0.00,1,1),(806,-157.79400000,21.26888000,65,2.54,36.09,1,1),(806,-157.79400000,21.26892000,65,2.54,32.81,1,1),(806,-157.85400000,21.29248000,59,2.54,39.37,2,1),(806,-157.84563480,21.28940934,62,0.00,0.00,5,3),(806,-157.84768940,21.28530128,64,0.00,0.00,5,1),(806,-157.84764980,21.28525004,64,0.00,0.00,5,1),(806,-157.80900000,21.31658000,58,2.54,6.56,1,2),(806,-157.85595060,21.30532445,69,7.62,45.93,1,2),(806,-157.85113540,21.30376700,74,7.62,32.81,1,1),(806,-157.82379030,21.30421640,61,0.00,68.90,1,1),(806,-157.82555580,21.29711582,60,2.54,19.69,1,1),(806,-157.82589900,21.29810067,67,2.54,32.81,4,3),(806,-157.84500000,21.30359000,66,2.54,32.81,1,1),(807,-84.02660000,35.90664000,76,35.56,0.00,2,2),(807,-84.02700000,35.90707000,77,35.56,0.00,2,2),(807,-84.02800000,35.90536000,78,33.02,0.00,1,2),(807,-84.02730000,35.90556000,79,15.24,0.00,2,2),(807,-83.92700000,35.98128000,80,33.02,0.00,3,2),(807,-83.93907710,35.96781645,81,5.08,0.00,2,2),(807,-83.93903020,35.96778458,134,5.08,0.00,2,3),(807,-83.93878030,35.96770426,46,5.08,0.00,2,2),(807,-83.93881750,35.96774215,83,5.08,0.00,2,2),(807,-83.93889980,35.96780566,10,5.08,0.00,2,2),(807,-83.93921680,35.96793125,10,5.08,0.00,2,2),(807,-83.89380000,36.02219000,15,27.94,0.00,2,1),(807,-83.89380000,36.02233000,85,53.34,0.00,2,2),(807,-83.89440000,36.02348000,18,40.64,0.00,2,2),(807,-83.89320000,36.02148000,40,33.02,0.00,2,2),(807,-83.89520000,36.02327000,86,38.10,0.00,2,1),(807,-84.00240000,35.98080000,87,101.60,0.00,3,2),(807,-83.89177060,35.97590205,88,30.48,0.00,1,2),(807,-83.87590620,35.94815770,89,68.58,0.00,4,2),(807,-84.08355780,35.86402196,30,10.16,0.00,1,2),(807,-84.08361320,35.86417086,30,10.16,0.00,1,2),(807,-84.08329450,35.86440490,30,5.08,0.00,1,2),(807,-84.08310590,35.86455343,30,5.08,0.00,1,2),(807,-83.91008440,36.03246643,44,68.58,0.00,5,2),(807,-83.91014880,36.03246752,44,101.60,0.00,5,2),(808,-85.80093690,38.22745406,90,1.00,0.00,2,2),(808,-85.80124820,38.22775172,91,1.00,0.00,1,2),(808,-85.80128570,38.22747901,91,1.00,0.00,4,2),(808,-85.80031330,38.22762779,92,1.00,0.00,2,2),(808,-85.80145920,38.22749262,78,1.00,0.00,1,2),(808,-85.79919550,38.22756167,93,1.00,0.00,1,2),(808,-85.80111100,38.22746738,94,1.00,0.00,1,2),(808,-85.80090400,38.22772982,90,1.00,0.00,4,2),(808,-85.79915090,38.22792385,93,1.00,0.00,1,2),(808,-85.79920990,38.22740864,25,1.00,0.00,2,2),(808,-85.79923820,38.22730667,95,1.00,0.00,1,2),(808,-85.79920120,38.22747720,96,1.00,0.00,1,2),(808,-85.80142200,38.22776490,78,1.00,0.00,2,2),(808,-85.79937990,38.22782151,95,1.00,0.00,1,2),(808,-85.80107660,38.22774112,94,1.00,0.00,2,2),(808,-85.79922750,38.22763334,92,1.00,0.00,2,2),(808,-85.80043340,38.22771554,18,34.00,0.00,4,2),(808,-85.80004490,38.22765205,39,43.00,0.00,1,2),(808,-85.80034740,38.22733388,18,30.00,0.00,4,2),(808,-85.80076070,38.22810909,97,2.00,0.00,1,1),(808,-85.80229550,38.22754034,10,9.00,0.00,4,2),(808,-85.80187250,38.22717786,97,23.00,0.00,1,1),(808,-85.80305270,38.22724032,98,55.00,0.00,2,2),(808,-85.80374450,38.22729662,44,38.00,0.00,2,2),(808,-85.80141510,38.22850451,98,16.00,0.00,1,2),(809,-73.84421520,40.72309177,30,7.62,0.00,2,2),(809,-73.81867950,40.79411067,39,53.34,0.00,2,2),(809,-73.93660770,40.71758074,5,7.62,0.00,1,1),(809,-73.93445620,40.71353749,5,25.40,0.00,1,1),(809,-73.97597940,40.66677776,32,53.34,0.00,1,2),(809,-73.98495000,40.77004563,5,27.94,0.00,1,1),(809,-73.98533810,40.77020969,5,27.94,0.00,1,1),(809,-73.98729650,40.76272385,32,22.86,0.00,1,2),(809,-74.07625480,40.59657931,5,15.24,0.00,1,1),(809,-73.96974390,40.58635725,82,53.34,0.00,2,1),(809,-73.91117080,40.78242823,82,27.94,0.00,1,1),(809,-73.91201960,40.78173511,82,20.32,0.00,4,1),(809,-74.16267040,40.55710259,82,33.02,0.00,2,1),(809,-73.96821050,40.69473314,82,55.88,0.00,1,1),(809,-73.92113020,40.66431740,82,76.20,0.00,2,1),(809,-73.96760070,40.69331418,5,30.48,0.00,1,1),(809,-73.99159680,40.59378755,48,5.08,0.00,2,1),(809,-73.96452450,40.64878769,5,35.56,0.00,1,1),(809,-73.86529990,40.73764622,5,35.56,0.00,2,1),(809,-73.97258750,40.69149917,48,25.40,0.00,1,1),(809,-73.98588940,40.66123875,5,27.94,0.00,1,1),(809,-73.96045570,40.77217148,5,35.56,0.00,1,1),(809,-73.98096430,40.78208720,78,10.16,0.00,2,2),(809,-74.13856340,40.56882124,99,22.86,0.00,1,1),(809,-73.97218380,40.67483919,78,5.08,0.00,1,2),(810,-121.76637970,37.22369553,82,31.75,147.64,2,1),(810,-121.76624620,37.22366224,100,66.04,213.25,2,1),(810,-121.76607020,37.22360942,101,76.20,213.25,2,2),(810,-121.76576570,37.22350326,82,55.88,180.45,2,1),(810,-121.76492790,37.22314395,100,69.85,213.25,2,1),(810,-121.76475520,37.22305109,101,81.28,246.06,2,2),(810,-121.76446150,37.22288218,82,27.94,164.04,2,1),(810,-121.76427740,37.22277524,82,60.96,164.04,2,1),(810,-121.76417470,37.22269320,100,40.64,164.04,4,1),(810,-121.76414400,37.22267038,100,74.93,229.66,2,1),(810,-121.76399130,37.22255415,101,53.34,229.66,1,2),(810,-121.76390760,37.22248725,101,0.00,0.00,2,3),(810,-121.76349690,37.22261527,55,38.10,131.23,1,1),(810,-121.76425500,37.22316385,55,30.48,114.83,2,1),(810,-121.76557380,37.22378740,55,26.67,114.83,2,1),(810,-121.76636890,37.22403455,55,20.32,98.43,2,1),(810,-121.76676290,37.22413554,55,27.94,114.83,2,1),(810,-121.76324500,37.22178643,101,95.25,213.25,1,2),(810,-121.76309290,37.22153506,82,45.72,164.04,2,1),(810,-121.76303380,37.22143677,82,0.00,0.00,2,3),(810,-121.76294600,37.22127052,82,35.56,131.23,1,1),(810,-121.76288930,37.22113027,100,64.77,262.47,2,1),(810,-121.76281760,37.22097833,82,36.83,164.04,2,1),(810,-121.76276600,37.22083108,100,0.00,0.00,2,3),(810,-121.76261860,37.22050127,100,57.15,213.25,2,1),(811,-122.28207990,47.63520680,102,40.64,0.00,3,1),(811,-122.31024330,47.59754830,21,33.02,0.00,1,1),(811,-122.35520360,47.67391609,17,15.24,0.00,5,3),(811,-122.31895200,47.64914080,103,5.08,0.00,2,3),(811,-122.34473060,47.61309227,41,15.24,0.00,3,1),(811,-122.30265150,47.68876831,47,2.54,0.00,3,1),(811,-122.35127070,47.63906265,103,15.24,0.00,3,3),(811,-122.39183770,47.68562512,104,12.70,0.00,2,3),(811,-122.30873360,47.57391706,105,45.72,0.00,1,1),(811,-122.38665890,47.63990574,99,25.40,0.00,1,1),(811,-122.35726150,47.65465603,106,43.18,0.00,1,3),(811,-122.37921890,47.69839335,107,33.02,0.00,1,1),(811,-122.31947110,47.62016754,15,71.12,0.00,2,1),(811,-122.31060460,47.61756292,10,50.80,0.00,2,1),(811,-122.39078450,47.55973063,108,12.70,0.00,1,3),(811,-122.29573660,47.61896690,113,2.54,0.00,3,1),(811,-122.29989080,47.63786331,110,2.54,0.00,3,1),(811,-122.39920780,47.67134548,111,15.24,0.00,2,1),(811,-122.36073360,47.66923548,112,17.78,0.00,1,1),(811,-122.36120000,47.70872400,111,5.08,0.00,1,1),(811,-122.32734880,47.68279320,48,5.08,0.00,1,1),(811,-122.29947830,47.66784125,113,40.64,0.00,2,1),(811,-122.34863710,47.65533597,114,38.10,0.00,1,1),(811,-122.35660000,47.70698500,115,5.08,0.00,3,3),(811,-122.28143940,47.63055908,116,38.10,0.00,1,3),(812,-96.75460130,43.50783569,91,2.00,29.53,1,2),(812,-96.73985940,43.56179432,35,2.00,22.97,1,1),(812,-96.73987220,43.56177513,117,2.00,0.00,2,2),(812,-96.73988590,43.56179490,35,2.00,22.97,1,1),(812,-96.73992960,43.56184514,91,5.00,0.00,2,2),(812,-96.73996030,43.56184063,118,2.00,0.00,1,2),(812,-96.73965050,43.56156560,117,3.00,0.00,2,2),(812,-96.73966330,43.56154019,35,2.00,22.97,1,1),(812,-96.70180420,43.53323936,119,2.00,39.37,3,1),(812,-96.70162680,43.53312799,45,2.00,26.25,1,1),(812,-96.65373070,43.51014902,45,1.00,13.12,1,1),(812,-96.65474420,43.51007423,120,2.00,36.09,1,1),(812,-96.65484540,43.50996527,120,2.00,32.81,1,1),(812,-96.65517750,43.51231938,118,3.00,0.00,3,2),(812,-96.65552900,43.51177268,117,2.00,26.25,1,2),(812,-96.65734060,43.51091931,45,1.00,16.40,1,1),(812,-96.65746330,43.51090284,120,3.00,0.00,1,1),(812,-96.65940020,43.51257269,45,2.00,19.69,2,1),(812,-96.80374350,43.49710382,121,5.00,49.21,1,1),(812,-96.80371500,43.49717081,119,5.00,0.00,3,1),(812,-96.76358630,43.53365055,121,3.00,39.37,1,1),(812,-96.72308600,43.53242133,121,5.00,45.93,2,1),(812,-96.74000290,43.56124939,45,5.00,0.00,3,1),(812,-96.74027040,43.56117838,119,1.00,0.00,2,1),(812,-96.74116650,43.56121603,121,5.00,32.81,1,1),(813,-82.50443680,27.94302574,26,5.08,32.81,3,2),(813,-82.49650100,27.89819480,122,5.08,26.25,3,1),(813,-82.47000240,27.97886193,123,5.08,26.25,2,3),(813,-82.46053640,28.00507092,122,5.08,26.25,1,1),(813,-82.43992800,27.99294553,124,5.08,26.25,1,1),(813,-82.43993150,27.99305485,123,5.08,26.25,1,3),(813,-82.40361370,28.05639233,125,38.10,52.49,2,2),(813,-82.40363820,28.05643066,125,31.75,137.80,1,2),(813,-82.40374450,28.05665520,126,27.94,124.67,3,1),(813,-82.40366220,28.05644774,127,19.05,67.26,1,2),(813,-82.40385110,28.05666441,98,11.43,85.30,1,2),(813,-82.40369830,28.05671708,128,12.70,90.22,1,2),(813,-82.40371410,28.05673732,128,15.24,82.02,2,2),(813,-82.40368060,28.05645494,128,24.13,86.94,1,2),(813,-82.41201280,28.06887960,122,12.70,44.29,2,1),(813,-82.40376580,28.05635795,125,74.93,188.65,1,2),(813,-82.40416280,28.05730646,125,67.31,123.03,2,2),(813,-82.40372010,28.05672022,129,11.43,72.18,1,2),(813,-82.40376030,28.05634094,130,43.18,73.82,3,2),(813,-82.40375660,28.05635057,130,30.48,34.45,2,2),(813,-82.40379380,28.05665180,125,58.42,159.12,2,2),(813,-82.40380880,28.05663711,98,8.89,70.54,2,2),(813,-82.40397360,28.05709761,125,15.24,103.35,2,2),(813,-82.40436420,28.05733861,125,77.47,154.20,1,2),(813,-82.40382440,28.05633656,130,45.72,83.66,1,2),(814,-77.04638400,38.93275209,39,67.31,0.00,1,2),(814,-77.04624310,38.93280341,39,57.66,0.00,1,2),(814,-76.99789590,38.88557378,131,12.70,0.00,1,3),(814,-77.04547070,38.93237612,21,27.94,0.00,1,2),(814,-77.03880040,38.92938776,19,22.86,0.00,2,1),(814,-77.04603590,38.93300419,7,39.88,0.00,3,1),(814,-76.99944260,38.88670817,15,36.58,0.00,1,1),(814,-76.99676350,38.88599588,76,3.81,0.00,1,2),(814,-77.04689820,38.93387347,132,5.08,0.00,3,2),(814,-77.03758910,38.92956312,134,10.16,0.00,2,3),(814,-77.04135910,38.93256077,10,3.56,0.00,1,2),(814,-77.03808710,38.93102667,97,27.94,0.00,1,1),(814,-77.03944420,38.92964410,21,25.91,0.00,3,2),(814,-76.99340020,38.88468516,10,43.94,0.00,1,2),(814,-76.99752670,38.88599604,30,5.08,0.00,1,2),(814,-77.04301710,38.93141254,134,15.24,0.00,1,1),(814,-77.03915500,38.92633035,31,3.81,0.00,3,2),(814,-77.04615790,38.93295210,36,24.89,0.00,1,1),(814,-76.99838180,38.88749187,118,10.67,0.00,1,1),(814,-77.04457630,38.93030540,132,27.43,0.00,3,2),(814,-77.04135480,38.93384543,39,27.94,0.00,1,2),(814,-76.99850640,38.88787262,30,13.21,0.00,1,2),(814,-76.98682500,38.88754622,132,19.30,0.00,1,2),(814,-76.99625000,38.88440498,78,33.02,0.00,1,2),(814,-76.99866870,38.88863430,30,12.70,0.00,2,2);
/*!40000 ALTER TABLE `tree_measurements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tree_native_status`
--

DROP TABLE IF EXISTS `tree_native_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tree_native_status` (
  `native_id` int unsigned NOT NULL AUTO_INCREMENT,
  `native_description` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`native_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='native status: unknown, introduced, naturally_occurring';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tree_native_status`
--

LOCK TABLES `tree_native_status` WRITE;
/*!40000 ALTER TABLE `tree_native_status` DISABLE KEYS */;
INSERT INTO `tree_native_status` VALUES (1,'introduced'),(2,'naturally_occurring'),(3,'unknown');
/*!40000 ALTER TABLE `tree_native_status` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-04 17:47:15
