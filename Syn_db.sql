# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.1.38-MariaDB)
# Database: Syn_db
# Generation Time: 2019-12-06 18:19:55 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table Men�
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Men�`;

CREATE TABLE `Menù` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Nome_menu` varchar(25) CHARACTER SET utf16 DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `Connect_menu_prezzo` FOREIGN KEY (`id`) REFERENCES `Prezzo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Men�` WRITE;
/*!40000 ALTER TABLE `Men�` DISABLE KEYS */;

INSERT INTO `Menù` (`id`, `Nome_menu`)
VALUES
	(6,'Menù du Chef');

/*!40000 ALTER TABLE `Menù` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Piatti
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Piatti`;

CREATE TABLE `Piatti` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Nome_Piatto` varchar(100) CHARACTER SET utf16 DEFAULT '',
  PRIMARY KEY (`id`),
  CONSTRAINT `Connect_Prezzo_Piatti` FOREIGN KEY (`id`) REFERENCES `Prezzo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Piatti` WRITE;
/*!40000 ALTER TABLE `Piatti` DISABLE KEYS */;

INSERT INTO `Piatti` (`id`, `Nome_Piatto`)
VALUES
	(1,'Couscous de lotte'),
	(2,'Crevettes marinées à l\'orange'),
	(3,'Brochettes de lotte'),
	(4,'Crevettes à la chermoula'),
	(5,'Tajine de poisson à la marocaine');

/*!40000 ALTER TABLE `Piatti` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Prezzo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Prezzo`;

CREATE TABLE `Prezzo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Prezzo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Prezzo` WRITE;
/*!40000 ALTER TABLE `Prezzo` DISABLE KEYS */;

INSERT INTO `Prezzo` (`id`, `Prezzo`)
VALUES
	(1,18),
	(2,20),
	(3,20),
	(4,15),
	(5,18),
	(6,45);

/*!40000 ALTER TABLE `Prezzo` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Utenti
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Utenti`;

CREATE TABLE `Utenti` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Nome` varchar(25) DEFAULT NULL,
  `Recensione` varchar(1000) CHARACTER SET utf16 DEFAULT NULL,
  `voto` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Utenti` WRITE;
/*!40000 ALTER TABLE `Utenti` DISABLE KEYS */;

INSERT INTO `Utenti` (`id`, `Nome`, `Recensione`, `voto`)
VALUES
	(1,'Nicola','C\'è poco da dire: uno dei migliori, se non il migliore, ristoranti dove poter mangiare pesce fresco e ostriche. Prezzi giusti. Servizio impeccabile. Chi ama il pesce fresco e soprattutto crudo non può perderlo.',8),
	(2,'Ettore','Ottima cucina di pesce. Ottima proposta di vini.\nMolto bene il crudo.\nOttimo livello',9),
	(3,'Elisa','Posto elegante, personale squisito, cibo di ottima qualità ad un prezzo corretto per quello che si mangia! Se vi piace il pesce è assolutamente da provare!',8),
	(4,'Antonio',NULL,7),
	(5,'Eleonora','Devo dire che la qualità del cibo è calato. I vini sempre gli stessi poca scelta!',6),
	(6,'Alessandra',NULL,7),
	(7,'Martina','Sempre una certezza! Materie prime di altissima qualità e servizio impeccabile! Ottimo come sempre',8),
	(8,'Giuseppe','Tremendo,carissimo(ma non sarebbe quello il problema se il pesce fosse buono) mangiato a pranzo; capesante,spaghetti ricci e fiori di zucca, risotto del capitano (alla crema di scampi pieno di panna) e un branzino grigliato(prezzo da pescato, qualità da allevamento,grasso e molliccio) e arrivati a casa abbiamo entrambi rimesso anche l\'anima',5),
	(9,'Amin','Probably the best fish restaurant in Paris, you can\'t go wrong. Expertise, courtesy and excellent courses for a pleasant evening.',8),
	(10,'Fernando',NULL,7);

/*!40000 ALTER TABLE `Utenti` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
