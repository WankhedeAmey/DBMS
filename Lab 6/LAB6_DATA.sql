-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
    --
    -- Host: localhost    Database: final
    -- ------------------------------------------------------
    -- Server version	5.7.29-0ubuntu0.18.04.1
     
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
    -- Table structure for table `IMDB`
    --
     
    DROP TABLE IF EXISTS `IMDB`;
    /*!40101 SET @saved_cs_client     = @@character_set_client */;
    /*!40101 SET character_set_client = utf8 */;
    CREATE TABLE `IMDB` (
      `ACTOR_ID` int(11) NOT NULL,
      `ACTOR_FNAME` varchar(20) DEFAULT NULL,
      `ACTOR_LNAME` varchar(20) DEFAULT NULL,
      `GENDER` char(1) DEFAULT NULL,
      `ROLE` varchar(20) DEFAULT NULL,
      `ACTOR_FEE` int(11) DEFAULT NULL,
      `MOVIE_ID` int(11) NOT NULL,
      `MOVIE_NAME` varchar(50) DEFAULT NULL,
      `MOVIE_YEAR` int(11) DEFAULT NULL,
      `MOVIE_GENRE` varchar(20) DEFAULT NULL,
      `DIRECTOR_ID` int(11) NOT NULL,
      `DIRECTOR_FNAME` varchar(20) DEFAULT NULL,
      `DIRECTOR_LNAME` varchar(20) DEFAULT NULL,
      `DIRECTOR_FEE` int(11) DEFAULT NULL,
      PRIMARY KEY (`ACTOR_ID`,`MOVIE_ID`,`DIRECTOR_ID`)
    ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
    /*!40101 SET character_set_client = @saved_cs_client */;
     
    --
    -- Dumping data for table `IMDB`
    --
     
    LOCK TABLES `IMDB` WRITE;
    /*!40000 ALTER TABLE `IMDB` DISABLE KEYS */;
    INSERT INTO `IMDB` VALUES (2,'Judy','Garland','F','Lead',200,20,'A Star Is Born',1954,'Romance',64,'George','Cukor',300),(7,'Daniel','Craig','M','Lead',77777,108,'Casino Royale',2006,'Spy',58,'Martin','Campbell',700000),(7,'Daniel','Craig','M','Supporting',80000,109,'Knives Out',2019,'Drama',59,'Rian','Johnson',600000),(23,'Tom','Cruise','M','Lead',34000,45,'Top Gun',1986,'Action',34,'Tony','Scott',60000),(23,'Tom','Cruise','M','Lead',70000,107,'Edge Of Tommorow',2014,'Thriller',54,'Doug','Liman',40000),(39,'Ryan','Gosling','M','Lead',60000,379,'La La Land',2016,'Drama',62,'Damien','Chazelle',80000),(40,'Lady','Gaga','F','Lead',45000,380,'A Star Is Born',2018,'Romance',63,'Bradley','Cooper',60000),(49,'Val','Kilmer','M','Supporting',20000,45,'Top Gun',1986,'Action',34,'Tony','Scott',60000),(88,'Bruno','Ganz','M','Lead',88000,88,'Downfall',2004,'Drama',88,'Oliver','Hirschbiegel',88000),(89,'Emma','Stone','F','Lead',60000,379,'La La Land',2016,'Drama',62,'Damien','Chazelle',80000),(200,'Tom','Hanks','M','Lead',60000,60,'Saving Private Ryan',1998,'Action',42,'Steven','Spielberg',100000),(200,'Tom','Hanks','M','Lead',80000,62,'Forrest Gump',1994,'Drama',43,'Robert','Zemeckis',90000),(200,'Tom','Hanks','M','Lead',80000,65,'Cast Away',2000,'Romance',43,'Robert','Zemeckis',90000),(200,'Tom','Hanks','M','Supporting',80000,67,'Catch Me If You Can',2002,'Drama',42,'Steven','Spielberg',100000),(200,'Tom','Hanks','M','Lead',100000,72,'Bridge of Spies',2015,'Thriller',42,'Steven','Spielberg',100000),(201,'Matt','Damon','M','Supporting',40000,60,'Saving Private Ryan',1998,'Action',42,'Steven','Spielberg',100000),(201,'Matt','Damon','M','Lead',100000,82,'The Martian',2015,'Thriller',45,'Ridley','Scott',600000),(202,'Leonardo','Dicaprio','M','Lead',75000,64,'Titanic',1997,'Drama',44,'James','Cameron',90000),(202,'Leonardo','Dicaprio','M','Lead',90000,67,'Catch Me If You Can',2002,'Drama',42,'Steven','Spielberg',100000),(203,'Wilson','McBall','M','Supporting',100,65,'Cast Away',2000,'Romance',43,'Robert','Zemeckis',90000),(205,'Kate','Winslet','F','Lead',60000,64,'Titanic',1997,'Drama',44,'James','Cameron',90000),(205,'Kate','Winslet','F','Lead',80000,70,'Eternal Sunshine of The Spotless Mind',2004,'Romance',46,'Michel','Gondry',120000),(206,'Jim','Carrey','M','Lead',100000,70,'Eternal Sunshine of The Spotless Mind',2004,'Romance',46,'Michel','Gondry',120000),(206,'Jim','Carrey','M','Lead',130000,93,'The Truman Show',1998,'Fiction',47,'Peter','Wier',135000),(207,'Tobey','Maguire','M','Lead',70000,94,'Spiderman',2002,'Fiction',48,'Sam','Raimi',140000),(207,'Tobey','Maguire','M','Lead',100000,95,'Spiderman 2',2004,'Fiction',48,'Sam','Raimi',140000),(207,'Tobey','Maguire','M','Lead',150000,96,'Spiderman 3',2007,'Fiction',48,'Sam','Raimi',140000),(208,'Keanu','Reeves','M','Lead',200000,98,'John Wick',2014,'Action',49,'Chad','Stahelski',250000),(208,'Keanu','Reeves','M','Lead',210000,99,'John Wick: Chapter 2',2017,'Action',49,'Chad','Stahelski',250000),(208,'Keanu','Reeves','M','Lead',220000,100,'John Wick: Chapter 3 - Parabellum',2019,'Action',49,'Chad','Stahelski',250000),(209,'Aaron','Paul','M','Lead',200000,103,'El Camino',2019,'Thriller',53,'Vince','Gilligan',300000),(220,'William','Defoe','M','Supporting',60000,94,'Spiderman',2002,'Fiction',48,'Sam','Raimi',140000),(220,'William','Defoe','M','Lead',90000,110,'The Lighthouse',2019,'Horror',60,'Robert','Eggers',200000),(221,'Robert','Pattinson','M','Lead',90000,110,'The Lighthouse',2019,'Horror',60,'Robert','Eggers',200000),(405,'Angelina','Jolie','F','Lead',50000,378,'Maleficient',2014,'Fantasy',61,'Robert','Stomberg',34000);
    /*!40000 ALTER TABLE `IMDB` ENABLE KEYS */;
    UNLOCK TABLES;
    /*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
     
    /*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
    /*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
    /*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
    /*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
    /*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
    /*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
    /*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
     
    -- Dump completed on 2020-03-13 19:20:52