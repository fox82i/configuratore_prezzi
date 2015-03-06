-- phpMyAdmin SQL Dump
-- version 4.3.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 06, 2015 alle 16:23
-- Versione del server: 5.5.20
-- PHP Version: 5.5.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `configuratore_prezzi`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `connettore_alimentazione`
--

CREATE TABLE IF NOT EXISTS `connettore_alimentazione` (
  `id_connettore` int(11) NOT NULL COMMENT 'PK per il connettore di alimentazione',
  `descrizione_connettore` varchar(50) COLLATE utf8_bin NOT NULL COMMENT 'tipo di connettore di alimentazione',
  `data_inserimento` date NOT NULL COMMENT 'data di inserimento del nuovo connettore',
  `lunghezza_cavo` int(11) NOT NULL COMMENT 'lunghezza cavo std per connettore di alimentazione (MM)',
  `portata_max_12V` int(11) NOT NULL COMMENT 'portata riferita al cavo di alimentazione a 12V',
  `portata_max_24V` int(11) NOT NULL COMMENT 'portata riferita al cavo di alimentazione a 24V',
  `sdoppiabile` tinyint(4) NOT NULL COMMENT 'Indica se l''alimentazione per quel connettore può essere doppia o meno',
  `codice_articolo` varchar(11) COLLATE utf8_bin NOT NULL COMMENT 'codice articolo connettore',
  `descrizione_articolo` varchar(50) COLLATE utf8_bin NOT NULL COMMENT 'descrizione di massima del connettore',
  `um` varchar(3) COLLATE utf8_bin NOT NULL COMMENT 'unità di miusura',
  `qta` int(11) NOT NULL COMMENT 'quantità di utilizzo',
  `costo` double NOT NULL COMMENT 'costo riferito al singolo pezzo',
  `data_validita` date NOT NULL COMMENT 'data inizio validità'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tipi di connettori per lampade lineari';

--
-- Dump dei dati per la tabella `connettore_alimentazione`
--

INSERT INTO `connettore_alimentazione` (`id_connettore`, `descrizione_connettore`, `data_inserimento`, `lunghezza_cavo`, `portata_max_12V`, `portata_max_24V`, `sdoppiabile`, `codice_articolo`, `descrizione_articolo`, `um`, `qta`, `costo`, `data_validita`) VALUES
(1, 'Twin', '2014-06-09', 3000, 36, 72, 1, '30903560000', 'CONNECTION CORD X REEL L=3mt + INPUT 12V', 'PZ', 1, 0.73, '2014-07-28'),
(2, 'M-Track', '2014-06-09', 600, 36, 72, 0, '80000000001', 'PROLUNGA MINITRACK LED L=700mm (xREEL)', 'PZ', 1, 1.9, '2014-07-28'),
(3, 'Sliding', '2014-06-09', 0, 36, 72, 0, '80000000002', 'N.2 TESTATE SLIDING + CONTATTI (xREEL)', 'PZ', 1, 2.8, '2014-07-28'),
(4, 'Modular', '2014-06-09', 500, 36, 72, 0, '80000000003', 'PROLUNGA MODULAR LED L=600mm (xREEL)', 'PZ', 1, 2, '2014-07-28');

-- --------------------------------------------------------

--
-- Struttura della tabella `costo_assemblaggio_lampada`
--

CREATE TABLE IF NOT EXISTS `costo_assemblaggio_lampada` (
  `note` varchar(100) COLLATE utf8_bin NOT NULL COMMENT 'qta di pezzi',
  `da` int(11) NOT NULL COMMENT 'misure di partenza',
  `a` int(11) NOT NULL COMMENT 'misure di fine',
  `costo` double NOT NULL COMMENT 'costo',
  `UM` varchar(3) COLLATE utf8_bin NOT NULL COMMENT 'unità di misura',
  `QTA` int(11) NOT NULL COMMENT 'quantità',
  `tipo_lavorazione` varchar(50) COLLATE utf8_bin NOT NULL COMMENT 'tipo di lavorazione eseguita sulla lampada',
  `nome_prodotto` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='costo di assemblaggio per la produzione di una lampada in produzione';

--
-- Dump dei dati per la tabella `costo_assemblaggio_lampada`
--

INSERT INTO `costo_assemblaggio_lampada` (`note`, `da`, `a`, `costo`, `UM`, `QTA`, `tipo_lavorazione`, `nome_prodotto`) VALUES
('circa 240"', 0, 600, 1.24, 'PZ', 1, 'ASSEMBLAGGIO', 'BALI'),
('circa 180"', 0, 600, 0.93, 'PZ', 1, 'ASSEMBLAGGIO', 'BRASILIA'),
('circa 420"', 0, 600, 1.86, 'PZ', 1, 'ASSEMBLAGGIO', 'DERBY'),
('circa 360"', 0, 600, 1.86, 'PZ', 1, 'ASSEMBLAGGIO', 'GENEVE'),
('circa 240"', 0, 600, 1.24, 'PZ', 1, 'ASSEMBLAGGIO', 'LEDO'),
('circa 360"', 0, 600, 1.86, 'PZ', 1, 'ASSEMBLAGGIO', 'LUGANO'),
('circa 240"', 0, 600, 1.24, 'PZ', 1, 'ASSEMBLAGGIO', 'MALINDI'),
('circa 240"', 0, 600, 1.24, 'PZ', 1, 'ASSEMBLAGGIO', 'MALINDI-in'),
('circa 240"', 0, 600, 1.24, 'PZ', 1, 'ASSEMBLAGGIO', 'MANILA'),
('circa 420"', 0, 600, 2.17, 'PZ', 1, 'ASSEMBLAGGIO', 'PERTH'),
('circa 240"', 0, 600, 1.24, 'PZ', 1, 'ASSEMBLAGGIO', 'VENICE'),
('circa 10" a schermo', 0, 1500, 0.05, 'PZ', 1, 'TAGLIO SCHERMO', 'BALI'),
('circa 10" a schermo', 0, 1500, 0.05, 'PZ', 1, 'TAGLIO SCHERMO', 'BRASILIA'),
('circa 10" a schermo', 0, 1500, 0.05, 'PZ', 1, 'TAGLIO SCHERMO', 'DERBY'),
('circa 10" a schermo', 0, 1500, 0.05, 'PZ', 1, 'TAGLIO SCHERMO', 'GENEVE'),
('circa 10" a profilo', 0, 1500, 0.05, 'PZ', 1, 'TAGLIO SCHERMO', 'LEDO'),
('circa 10" a schermo', 0, 1500, 0.05, 'PZ', 1, 'TAGLIO SCHERMO', 'LUGANO'),
('circa 10" a schermo', 0, 1500, 0.05, 'PZ', 1, 'TAGLIO SCHERMO', 'MALINDI-in'),
('circa 10" a schermo', 0, 1500, 0.05, 'PZ', 1, 'TAGLIO SCHERMO', 'MANILA'),
('circa 10" a schermo', 0, 1500, 0.05, 'PZ', 1, 'TAGLIO SCHERMO', 'PERTH'),
('circa 10" a schermo', 0, 1500, 0.05, 'PZ', 1, 'TAGLIO SCHERMO', 'SKYLINE'),
('circa 60" a schermo', 0, 1500, 0.31, 'PZ', 1, 'TAGLIO SCHERMO + FRESATA', 'MALINDI'),
('circa 10" a profilo', 0, 2000, 0.05, 'PZ', 1, 'TAGLIO REELPLATE', 'BALI'),
('circa 10" a profilo', 0, 2000, 0.05, 'PZ', 1, 'TAGLIO REELPLATE', 'DERBY'),
('circa 10" a profilo', 0, 2000, 0.05, 'PZ', 1, 'TAGLIO REELPLATE', 'GENEVE'),
('circa 10" a profilo', 0, 2000, 0.05, 'PZ', 1, 'TAGLIO REELPLATE', 'LEDO'),
('circa 10" a profilo', 0, 2000, 0.05, 'PZ', 1, 'TAGLIO REELPLATE', 'LUGANO'),
('circa 10" a profilo', 0, 2000, 0.05, 'PZ', 1, 'TAGLIO REELPLATE', 'MALINDI'),
('circa 10" a profilo', 0, 2000, 0.05, 'PZ', 1, 'TAGLIO REELPLATE', 'MALINDI-in'),
('circa 10" a profilo', 0, 2000, 0.05, 'PZ', 1, 'TAGLIO REELPLATE', 'MANILA'),
('circa 10" a profilo', 0, 2000, 0.05, 'PZ', 1, 'TAGLIO REELPLATE', 'PERTH'),
('circa 30" a profilo', 0, 2000, 0.16, 'PZ', 1, 'TAGLIO VERGA', 'BRASILIA'),
('circa 60" a profilo', 0, 2000, 0.16, 'PZ', 1, 'TAGLIO VERGA', 'LEDO'),
('circa 30" a profilo', 0, 2000, 0.16, 'PZ', 1, 'TAGLIO VERGA', 'SKYLINE'),
('circa 150" a profilo', 0, 2000, 0.78, 'PZ', 1, 'TAGLIO VERGA + FRESATURA x SENSORE', 'PERTH'),
('circa 150" a profilo', 0, 2000, 0.39, 'PZ', 1, 'TAGLIO VERGA + FRESATURA x USCITA CAVO', 'DERBY'),
('circa 75" a profilo', 0, 2000, 0.39, 'PZ', 1, 'TAGLIO VERGA + FRESATURA x USCITA CAVO', 'GENEVE'),
('circa 75" a profilo', 0, 2000, 0.39, 'PZ', 1, 'TAGLIO VERGA + FRESATURA x USCITA CAVO', 'LUGANO'),
('circa 30" a profilo', 0, 2000, 0.16, 'PZ', 1, 'TAGLIO VERGA + FRESATURA x USCITA CAVO', 'MALINDI'),
('circa 30" a profilo', 0, 2000, 0.16, 'PZ', 1, 'TAGLIO VERGA + FRESATURA x USCITA CAVO', 'MALINDI-in'),
('circa 30" a profilo', 0, 2000, 0.16, 'PZ', 1, 'TAGLIO VERGA + FRESATURA x USCITA CAVO', 'MANILA'),
('circa 20" a profilo', 0, 2000, 0.1, 'PZ', 1, 'TAGLIO VERGA + PUNZONATURA x USCITA CAVO', 'BALI'),
('circa 300"', 601, 1200, 1.55, 'PZ', 1, 'ASSEMBLAGGIO', 'BALI'),
('circa 300"', 601, 1200, 1.24, 'PZ', 1, 'ASSEMBLAGGIO', 'BRASILIA'),
('circa 450"', 601, 1200, 2.17, 'PZ', 1, 'ASSEMBLAGGIO', 'DERBY'),
('circa 420"', 601, 1200, 2.17, 'PZ', 1, 'ASSEMBLAGGIO', 'GENEVE'),
('circa 300"', 601, 1200, 1.55, 'PZ', 1, 'ASSEMBLAGGIO', 'LEDO'),
('circa 420"', 601, 1200, 2.17, 'PZ', 1, 'ASSEMBLAGGIO', 'LUGANO'),
('circa 300"', 601, 1200, 1.55, 'PZ', 1, 'ASSEMBLAGGIO', 'MALINDI'),
('circa 300"', 601, 1200, 1.55, 'PZ', 1, 'ASSEMBLAGGIO', 'MALINDI-in'),
('circa 300"', 601, 1200, 1.55, 'PZ', 1, 'ASSEMBLAGGIO', 'MANILA'),
('circa 450"', 601, 1200, 2.33, 'PZ', 1, 'ASSEMBLAGGIO', 'PERTH'),
('circa 300"', 601, 1200, 1.55, 'PZ', 1, 'ASSEMBLAGGIO', 'SKYLINE'),
('circa 360"', 1201, 2000, 1.86, 'PZ', 1, 'ASSEMBLAGGIO', 'BALI'),
('circa 300"', 1201, 2000, 1.55, 'PZ', 1, 'ASSEMBLAGGIO', 'BRASILIA'),
('circa 510"', 1201, 2000, 2.48, 'PZ', 1, 'ASSEMBLAGGIO', 'DERBY'),
('circa 480"', 1201, 2000, 2.48, 'PZ', 1, 'ASSEMBLAGGIO', 'GENEVE'),
('circa 360"', 1201, 2000, 1.86, 'PZ', 1, 'ASSEMBLAGGIO', 'LEDO'),
('circa 480"', 1201, 2000, 2.48, 'PZ', 1, 'ASSEMBLAGGIO', 'LUGANO'),
('circa 360"', 1201, 2000, 1.86, 'PZ', 1, 'ASSEMBLAGGIO', 'MALINDI'),
('circa 360"', 1201, 2000, 1.86, 'PZ', 1, 'ASSEMBLAGGIO', 'MALINDI-in'),
('circa 360"', 1201, 2000, 1.86, 'PZ', 1, 'ASSEMBLAGGIO', 'MANILA'),
('circa 510"', 1201, 2000, 2.64, 'PZ', 1, 'ASSEMBLAGGIO', 'PERTH'),
('circa 360"', 1201, 2000, 1.86, 'PZ', 1, 'ASSEMBLAGGIO', 'SKYLINE'),
('circa 20" a schermo', 1501, 3000, 0.1, 'PZ', 1, 'TAGLIO SCHERMO', 'BALI'),
('circa 20" a schermo', 1501, 3000, 0.1, 'PZ', 1, 'TAGLIO SCHERMO', 'BRASILIA'),
('circa 20" a schermo', 1501, 3000, 0.1, 'PZ', 1, 'TAGLIO SCHERMO', 'DERBY'),
('circa 20" a schermo', 1501, 3000, 0.1, 'PZ', 1, 'TAGLIO SCHERMO', 'GENEVE'),
('circa 20" a profilo', 1501, 3000, 0.1, 'PZ', 1, 'TAGLIO SCHERMO', 'LEDO'),
('circa 20" a schermo', 1501, 3000, 0.1, 'PZ', 1, 'TAGLIO SCHERMO', 'LUGANO'),
('circa 20" a schermo', 1501, 3000, 0.1, 'PZ', 1, 'TAGLIO SCHERMO', 'MALINDI-in'),
('circa 20" a schermo', 1501, 3000, 0.1, 'PZ', 1, 'TAGLIO SCHERMO', 'MANILA'),
('circa 20" a schermo', 1501, 3000, 0.1, 'PZ', 1, 'TAGLIO SCHERMO', 'PERTH'),
('circa 20" a schermo', 1501, 3000, 0.1, 'PZ', 1, 'TAGLIO SCHERMO', 'SKYLINE'),
('circa 90" a schermo', 1501, 3000, 0.47, 'PZ', 1, 'TAGLIO SCHERMO + FRESATA', 'MALINDI'),
('circa 450"', 2001, 3000, 2.33, 'PZ', 1, 'ASSEMBLAGGIO', 'BALI'),
('circa 390"', 2001, 3000, 2.02, 'PZ', 1, 'ASSEMBLAGGIO', 'BRASILIA'),
('circa 600"', 2001, 3000, 2.95, 'PZ', 1, 'ASSEMBLAGGIO', 'DERBY'),
('circa 570"', 2001, 3000, 2.95, 'PZ', 1, 'ASSEMBLAGGIO', 'GENEVE'),
('circa 450"', 2001, 3000, 2.33, 'PZ', 1, 'ASSEMBLAGGIO', 'LEDO'),
('circa 570"', 2001, 3000, 2.95, 'PZ', 1, 'ASSEMBLAGGIO', 'LUGANO'),
('circa 450"', 2001, 3000, 2.33, 'PZ', 1, 'ASSEMBLAGGIO', 'MALINDI'),
('circa 450"', 2001, 3000, 2.33, 'PZ', 1, 'ASSEMBLAGGIO', 'MALINDI-in'),
('circa 450"', 2001, 3000, 2.33, 'PZ', 1, 'ASSEMBLAGGIO', 'MANILA'),
('circa 600"', 2001, 3000, 3.1, 'PZ', 1, 'ASSEMBLAGGIO', 'PERTH'),
('circa 450"', 2001, 3000, 2.33, 'PZ', 1, 'ASSEMBLAGGIO', 'SKYLINE'),
('circa 20" a profilo', 2001, 3000, 0.1, 'PZ', 1, 'TAGLIO REELPLATE', 'BALI'),
('circa 20" a profilo', 2001, 3000, 0.1, 'PZ', 1, 'TAGLIO REELPLATE', 'DERBY'),
('circa 20" a profilo', 2001, 3000, 0.1, 'PZ', 1, 'TAGLIO REELPLATE', 'GENEVE'),
('circa 20" a profilo', 2001, 3000, 0.1, 'PZ', 1, 'TAGLIO REELPLATE', 'LUGANO'),
('circa 20" a profilo', 2001, 3000, 0.1, 'PZ', 1, 'TAGLIO REELPLATE', 'MALINDI'),
('circa 20" a profilo', 2001, 3000, 0.1, 'PZ', 1, 'TAGLIO REELPLATE', 'MALINDI-in'),
('circa 20" a profilo', 2001, 3000, 0.1, 'PZ', 1, 'TAGLIO REELPLATE', 'MANILA'),
('circa 20" a profilo', 2001, 3000, 0.1, 'PZ', 1, 'TAGLIO REELPLATE', 'PERTH'),
('circa 60" a profilo', 2001, 3000, 0.31, 'PZ', 1, 'TAGLIO VERGA', 'BRASILIA'),
('circa 60" a profilo', 2001, 3000, 0.31, 'PZ', 1, 'TAGLIO VERGA', 'SKYLINE'),
('circa 180" a profilo', 2001, 3000, 0.93, 'PZ', 1, 'TAGLIO VERGA + FRESATURA x SENSORE', 'PERTH'),
('circa 180" a profilo', 2001, 3000, 0.54, 'PZ', 1, 'TAGLIO VERGA + FRESATURA x USCITA CAVO', 'DERBY'),
('circa 105" a profilo', 2001, 3000, 0.54, 'PZ', 1, 'TAGLIO VERGA + FRESATURA x USCITA CAVO', 'GENEVE'),
('circa 105" a profilo', 2001, 3000, 0.54, 'PZ', 1, 'TAGLIO VERGA + FRESATURA x USCITA CAVO', 'LUGANO'),
('circa 60" a profilo', 2001, 3000, 0.31, 'PZ', 1, 'TAGLIO VERGA + FRESATURA x USCITA CAVO', 'MALINDI'),
('circa 60" a profilo', 2001, 3000, 0.31, 'PZ', 1, 'TAGLIO VERGA + FRESATURA x USCITA CAVO', 'MALINDI-in'),
('circa 60" a profilo', 2001, 3000, 0.31, 'PZ', 1, 'TAGLIO VERGA + FRESATURA x USCITA CAVO', 'MANILA'),
('circa 40" a profilo', 2001, 3000, 0.21, 'PZ', 1, 'TAGLIO VERGA + PUNZONATURA x USCITA CAVO', 'BALI'),
('circa 20" a profilo', 2001, 4300, 0.1, 'PZ', 1, 'TAGLIO REELPLATE', 'LEDO'),
('circa 90" a profilo', 2001, 4300, 0.31, 'PZ', 1, 'TAGLIO VERGA', 'LEDO');

-- --------------------------------------------------------

--
-- Struttura della tabella `diba`
--

CREATE TABLE IF NOT EXISTS `diba` (
  `nome_prodotto` varchar(50) COLLATE utf8_bin NOT NULL COMMENT 'nome prodotto',
  `posizione` int(11) NOT NULL COMMENT 'ordine in sequenza diba',
  `codice_componente` varchar(13) COLLATE utf8_bin NOT NULL COMMENT 'codice del componente',
  `descrizione_componente` varchar(50) COLLATE utf8_bin NOT NULL COMMENT 'descrizione di massima del componente',
  `UM` varchar(3) COLLATE utf8_bin NOT NULL COMMENT 'unità di misura componente',
  `quantita` int(11) NOT NULL COMMENT 'quantità di utilizzo',
  `costo` double NOT NULL COMMENT 'costo componente',
  `inizio_validita` date NOT NULL COMMENT 'inizio validità utilizzo del componente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='DIBA prodotto lineare';

--
-- Dump dei dati per la tabella `diba`
--

INSERT INTO `diba` (`nome_prodotto`, `posizione`, `codice_componente`, `descrizione_componente`, `UM`, `quantita`, `costo`, `inizio_validita`) VALUES
('BALI', 10, '40210081200', 'PROFILO BALI L=4300mm', 'PZV', 1, 4.6, '2013-04-22'),
('BALI', 11, '40211602000', 'PROF.REEL PLATE I L=4300mm GREZZO', 'PZV', 1, 1.45, '2013-04-23'),
('BALI', 13, '41400610300', 'PASSACAVO IN PVC xFORI D=6mm', 'PZ', 1, 0.02, '2015-02-03'),
('BALI', 110, '81106000100', 'ETIC.IMB.SING. 75x45 PROD. CE', 'PZV', 1, 0.006, '2013-04-22'),
('BALI', 120, '81106020100', 'ETIC.IMB.MULT.100x80 PROD. CE', 'PZV', 1, 0.006, '2013-04-22'),
('BALI', 160, '81110391000', 'ETIC.13x35mm ''12VDC MAX1,5A''', 'PZ', 1, 0.006, '2013-04-22'),
('BALI', 170, '81110621000', 'ETIC.15x8 SELEZIONE COLORE LED', 'PZ', 1, 0.006, '2013-04-22'),
('BALI', 130, '81115301000', 'ETIC.13x70mm  DATI DI TARGA BALI ENEC', 'PZ', 1, 0.006, '2013-04-22'),
('BALI', 40, '81900371000', 'TESTATA BALI', 'PZ', 2, 0.02, '2013-04-22'),
('BALI', 60, '81900561000', 'FERMACAVO PRODOTTI LED-HE', 'PZ', 2, 0.11, '2013-04-22'),
('BALI', 70, 'F01010500414', 'VITE AUTOFIL. 2,9x6,5mm TSP', 'PZ', 2, 0.001, '2013-04-22'),
('BRASILIA', 10, '40211641200', 'PROF.BRASILIA L=4300mm ANODIZZATO', 'PZV', 1, 5.4, '2015-02-10'),
('BRASILIA', 40, '40403271000', 'FERMACAVO BRASILIA SX', 'PZ', 1, 0.05, '2015-02-10'),
('BRASILIA', 42, '40403281000', 'FERMACAVO BRASILIA DX', 'PZ', 1, 0.05, '2015-02-10'),
('BRASILIA', 110, '81106000100', 'ETIC.IMB.SING. 75x45 PROD. CE', 'PZV', 1, 0.006, '2015-02-10'),
('BRASILIA', 120, '81106020100', 'ETIC.IMB.MULT.100x80 PROD. CE', 'PZV', 1, 0.006, '2015-02-10'),
('BRASILIA', 160, '81110391000', 'ETIC.13x35mm ''12VDC MAX1,5A''', 'PZ', 1, 0.006, '2015-02-10'),
('BRASILIA', 170, '81110621000', 'ETIC.15x8 SELEZIONE COLORE LED', 'PZ', 1, 0.006, '2015-02-10'),
('BRASILIA', 130, '81116061000', 'ETIC.13x70mm DATI DI TARGA LUGANO NO ENE', 'PZ', 1, 0.006, '2015-02-10'),
('DERBY', 10, '40210781200', 'PROF.ESTR. DERBY/PERTH 4300mm', 'PZV', 1, 6.75, '2015-02-16'),
('DERBY', 11, '40211602000', 'PROF.REEL PLATE I L=4300mm GREZZO', 'PZV', 1, 1.45, '2015-02-16'),
('DERBY', 110, '81106000100', 'ETIC.IMB.SING. 75x45 PROD. CE', 'PZV', 1, 0.006, '2015-02-16'),
('DERBY', 120, '81106020100', 'ETIC.IMB.MULT.100x80 PROD. CE', 'PZV', 1, 0.006, '2015-02-16'),
('DERBY', 160, '81110391000', 'ETIC.13x35mm ''12VDC MAX1,5A''', 'PZ', 1, 0.006, '2015-02-16'),
('DERBY', 170, '81110621000', 'ETIC.15x8 SELEZIONE COLORE LED', 'PZ', 1, 0.006, '2015-02-16'),
('DERBY', 130, '81116061000', 'ETIC.13x70mm DATI DI TARGA LUGANO NO ENE', 'PZ', 1, 0.006, '2015-02-16'),
('DERBY', 43, '81201066500', 'TESTATA DERBY DX', 'PZ', 1, 0.03, '2015-02-16'),
('DERBY', 42, '81201076500', 'TESTATA DERBY SX', 'PZ', 1, 0.03, '2015-02-16'),
('DERBY', 60, '81900561000', 'FERMACAVO PRODOTTI LED-HE', 'PZ', 2, 0.11, '2015-02-16'),
('DERBY', 61, '81900881000', 'FERMACAVO DERBY-PERTH', 'PZ', 2, 0.08, '2015-02-16'),
('DERBY', 40, '81900911000', 'PIASTRINA TESTATA DERBY SX', 'PZ', 1, 0.08, '2015-02-16'),
('DERBY', 41, '81900921000', 'PIASTRINA TESTATA DERBY DX', 'PZ', 1, 0.08, '2015-02-16'),
('DERBY', 70, 'F01010500414', 'VITE AUTOFIL. 2,9x6,5mm TSP', 'PZ', 3, 0.04, '2015-02-16'),
('DERBY', 71, 'F01010500438', 'VITE AUTOFIL. 2,9x9,5mm TSP', 'PZ', 2, 0.01, '2015-02-16'),
('GENEVE', 10, '40211411200', 'PROF.GENEVE - LUGANO L=4300mm ANODIZZATO', 'PZV', 1, 4.43, '2015-02-10'),
('GENEVE', 11, '40211602000', 'PROF.REEL PLATE I L=4300mm GREZZO', 'PZV', 1, 1.45, '2015-02-10'),
('GENEVE', 40, '40402781000', 'TESTATA INTERNA SX GENEVE', 'PZ', 1, 0.08, '2015-02-10'),
('GENEVE', 41, '40402791000', 'TESTATA SX GENEVE', 'PZ', 1, 0.08, '2015-02-10'),
('GENEVE', 42, '40402801000', 'TESTATA DX GENEVE', 'PZ', 1, 0.08, '2015-02-10'),
('GENEVE', 72, '50200130100', 'DIMA GENEVE - LUGANO', 'PZ', 2, 0.01, '2015-02-10'),
('GENEVE', 110, '81106000100', 'ETIC.IMB.SING. 75x45 PROD. CE', 'PZV', 1, 0.006, '2015-02-10'),
('GENEVE', 120, '81106020100', 'ETIC.IMB.MULT.100x80 PROD. CE', 'PZV', 1, 0.006, '2015-02-10'),
('GENEVE', 160, '81110391000', 'ETIC.13x35mm ''12VDC MAX1,5A''', 'PZ', 1, 0.006, '2015-02-10'),
('GENEVE', 170, '81110621000', 'ETIC.15x8 SELEZIONE COLORE LED', 'PZ', 1, 0.006, '2015-02-10'),
('GENEVE', 130, '81116061000', 'ETIC.13x70mm DATI DI TARGA LUGANO NO ENE', 'PZ', 1, 0.006, '2015-02-10'),
('GENEVE', 60, '81900561000', 'FERMACAVO PRODOTTI LED-HE', 'PZ', 2, 0.11, '2015-02-10'),
('GENEVE', 70, 'F01010500414', 'VITE AUTOFIL. 2,9x6,5mm TSP', 'PZ', 2, 0.04, '2015-02-10'),
('LEDO', 10, '40211071201', 'PROFILO ALLUMINIO 4,3MT', 'PZV', 1, 3.46, '2014-07-24'),
('LEDO', 11, '40211612000', 'PROF. REEL PALTE ii L=4300mm GREZZO', 'PZV', 1, 0.9, '2014-07-24'),
('LEDO', 40, '40402626200', 'TESTATA LEDO INTERNA', 'PZ', 2, 0.06, '2014-07-24'),
('LEDO', 42, '40402636500', 'TAPPO COPRIFILO LEDO', 'PZ', 2, 0.06, '2014-07-24'),
('LEDO', 43, '40402646500', 'TAPPO COPRIVITE LEDO', 'PZ', 2, 0.06, '2014-07-24'),
('LEDO', 41, '40402656500', 'TESTATA LEDO ESTERNA', 'PZ', 2, 0.06, '2014-07-24'),
('LEDO', 44, '40600611100', 'VITE TESTA RIBASSATA 2X5.6mm', 'PZ', 2, 0.01, '2014-07-24'),
('LUGANO', 10, '40211411200', 'PROF.GENEVE - LUGANO L=4300mm ANODIZZATO', 'PZV', 1, 4.43, '2013-04-17'),
('LUGANO', 11, '40211602000', 'PROF.REEL PLATE I L=4300mm GREZZO', 'PZV', 1, 1.45, '2013-04-17'),
('LUGANO', 40, '40402811000', 'TESTATA INTERNA SX LUGANO', 'PZ', 1, 0.08, '2013-04-17'),
('LUGANO', 41, '40402821000', 'TESTATA SX LUGANO', 'PZ', 1, 0.08, '2013-04-17'),
('LUGANO', 42, '40402831000', 'TESTATA DX LUGANO', 'PZ', 1, 0.08, '2013-04-17'),
('LUGANO', 72, '50200130100', 'DIMA GENEVE - LUGANO', 'PZ', 2, 0.01, '2013-04-17'),
('LUGANO', 110, '81106000100', 'ETIC.IMB.SING. 75x45 PROD. CE', 'PZV', 1, 0.006, '2013-04-17'),
('LUGANO', 120, '81106020100', 'ETIC.IMB.MULT.100x80 PROD. CE', 'PZV', 1, 0.006, '2013-04-17'),
('LUGANO', 160, '81110391000', 'ETIC.13x35mm ''12VDC MAX1,5A''', 'PZ', 1, 0.006, '2013-04-17'),
('LUGANO', 170, '81110621000', 'ETIC.15x8 SELEZIONE COLORE LED', 'PZ', 1, 0.006, '2013-04-17'),
('LUGANO', 130, '81116061000', 'ETIC.13x70mm DATI DI TARGA LUGANO NO ENE', 'PZ', 1, 0.006, '2013-04-17'),
('LUGANO', 60, '81900561000', 'FERMACAVO PRODOTTI LED-HE', 'PZ', 2, 0.11, '2013-04-17'),
('LUGANO', 70, 'F01010500414', 'VITE AUTOFIL. 2,9x6,5mm TSP', 'PZ', 2, 0.04, '2013-04-17'),
('MALINDI', 10, '40211351200', 'PROF.MALINDI L=4300mm ANODIZZATO', 'PZV', 1, 3.12, '2013-04-16'),
('MALINDI', 11, '40211602000', 'PROF.REEL PLATE I L=4300mm GREZZO', 'PZV', 1, 1.45, '2013-04-16'),
('MALINDI', 110, '81106000100', 'ETIC.IMB.SING. 75x45 PROD. CE', 'PZ', 1, 0.006, '2013-04-16'),
('MALINDI', 120, '81106020100', 'ETIC.IMB.MULT.100x80 PROD. CE', 'PZ', 1, 0.006, '2013-04-16'),
('MALINDI', 160, '81110391000', 'ETIC.13x35mm ''12VDC MAX1,5A''', 'PZ', 1, 0.006, '2013-04-16'),
('MALINDI', 160, '81110391000', 'ETIC.13x35mm ''12VDC MAX1,5A''', 'PZ', 1, 0.006, '2013-05-03'),
('MALINDI', 170, '81110621000', 'ETIC.15x8 SELEZIONE COLORE LED', 'PZ', 1, 0.006, '2013-04-16'),
('MALINDI', 130, '81115891000', 'ETIC.13x70 DATI TARGA MALINDI/.in NO ENE', 'PZ', 1, 0.006, '2013-04-16'),
('MALINDI', 60, '81900561000', 'FERMACAVO PRODOTTI LED-HE', 'PZ', 2, 0.11, '2013-04-16'),
('MALINDI', 70, 'F01010500414', 'VITE AUTOFIL. 2,9x6,5mm TSP', 'PZ', 2, 0.04, '2013-04-16'),
('MALINDI-in', 10, '40211351200', 'PROF.MALINDI L=4300mm ANODIZZATO', 'PZV', 1, 3.12, '2013-04-16'),
('MALINDI-in', 11, '40211602000', 'PROF.REEL PLATE I L=4300mm GREZZO', 'PZV', 1, 1.45, '2013-04-16'),
('MALINDI-in', 110, '81106000100', 'ETIC.IMB.SING. 75x45 PROD. CE', 'PZ', 1, 0.006, '2013-04-16'),
('MALINDI-in', 120, '81106020100', 'ETIC.IMB.MULT.100x80 PROD. CE', 'PZ', 1, 0.006, '2013-04-16'),
('MALINDI-in', 160, '81110391000', 'ETIC.13x35mm ''12VDC MAX1,5A''', 'PZ', 1, 0.006, '2013-04-16'),
('MALINDI-in', 160, '81110391000', 'ETIC.13x35mm ''12VDC MAX1,5A''', 'PZ', 1, 0.006, '2013-05-03'),
('MALINDI-in', 170, '81110621000', 'ETIC.15x8 SELEZIONE COLORE LED', 'PZ', 1, 0.006, '2013-04-16'),
('MALINDI-in', 130, '81115891000', 'ETIC.13x70 DATI TARGA MALINDI/.in NO ENE', 'PZ', 1, 0.006, '2013-04-16'),
('MALINDI-in', 60, '81900561000', 'FERMACAVO PRODOTTI LED-HE', 'PZ', 2, 0.11, '2013-04-16'),
('MALINDI-in', 70, 'F01010500414', 'VITE AUTOFIL. 2,9x6,5mm TSP', 'PZ', 2, 0.04, '2013-04-16'),
('MANILA', 10, '40211171200', 'VERGA MANILA-E L=4,3mt', 'PZV', 1, 3.23, '2012-11-19'),
('MANILA', 11, '40211602000', 'Supporto in alluminio per motore LED REEL', 'PZV', 1, 1.45, '2012-11-29'),
('MANILA', 50, '81102990100', 'Etichetta logo testata', 'PZ', 1, 0.00375, '2012-11-19'),
('MANILA', 110, '81106000100', 'Etichetta imballo singolo', 'PZ', 1, 0.00375, '2012-11-19'),
('MANILA', 120, '81106020100', 'Etichetta imballo multiplo', 'PZ', 1, 0.00375, '2012-11-19'),
('MANILA', 160, '81110391000', 'Etichetta ETL bandiera per incasso', 'PZ', 1, 0.00375, '2012-11-19'),
('MANILA', 170, '81110621000', 'Etichetta selezione colore', 'PZ', 1, 0.00375, '2012-11-19'),
('MANILA', 130, '81115291000', 'Etichetta dati di targa', 'PZ', 1, 0.00375, '2012-11-19'),
('MANILA', 140, '81115341000', 'Etichetta marchio ETL', 'PZ', 1, 0.00375, '2012-11-19'),
('MANILA', 150, '81115361000', 'Etichetta ETL bandiera incasso', 'PZ', 1, 0.00375, '2012-11-19'),
('MANILA', 40, '81900361000', 'TESTATA MANILA', 'PZ', 2, 0.02, '2012-11-19'),
('MANILA', 60, '81900561000', 'FERMACAVO PRODOTTI LED-HE', 'PZ', 2, 0.11, '2012-11-19'),
('MANILA', 70, 'F01010500414', 'VITE AUTOFIL. 2,9x6,5mm TSP', 'PZ', 2, 0.04, '2012-11-19'),
('PERTH', 10, '40210781200', 'PROF.ESTR. DERBY/PERTH 4300mm', 'PZV', 1, 6.75, '2015-02-10'),
('PERTH', 11, '40211602000', 'PROF.REEL PLATE I L=4300mm GREZZO', 'PZV', 1, 1.45, '2015-02-10'),
('PERTH', 110, '81106000100', 'ETIC.IMB.SING. 75x45 PROD. CE', 'PZV', 1, 0.006, '2015-02-10'),
('PERTH', 120, '81106020100', 'ETIC.IMB.MULT.100x80 PROD. CE', 'PZV', 1, 0.006, '2015-02-10'),
('PERTH', 160, '81110391000', 'ETIC.13x35mm ''12VDC MAX1,5A''', 'PZ', 1, 0.006, '2015-02-10'),
('PERTH', 170, '81110621000', 'ETIC.15x8 SELEZIONE COLORE LED', 'PZ', 1, 0.006, '2015-02-10'),
('PERTH', 130, '81116061000', 'ETIC.13x70mm DATI DI TARGA LUGANO NO ENE', 'PZ', 1, 0.006, '2015-02-10'),
('PERTH', 43, '81201046500', 'TESTATA PERTH DX', 'PZ', 1, 0.03, '2015-02-10'),
('PERTH', 42, '81201056500', 'TESTATA PERTH SX', 'PZ', 1, 0.03, '2015-02-10'),
('PERTH', 60, '81900561000', 'FERMACAVO PRODOTTI LED-HE', 'PZ', 2, 0.11, '2015-02-10'),
('PERTH', 61, '81900881000', 'FERMACAVO DERBY-PERTH', 'PZ', 2, 0.08, '2015-02-10'),
('PERTH', 40, '81900891000', 'PIASTRINA TESTATA PERTH SX', 'PZ', 1, 0.08, '2015-02-10'),
('PERTH', 41, '81900901000', 'PIASTRINA TESTATA PERTH DX', 'PZ', 1, 0.08, '2015-02-10'),
('PERTH', 70, 'F01010500414', 'VITE AUTOFIL. 2,9x6,5mm TSP', 'PZ', 3, 0.04, '2015-02-10'),
('PERTH', 71, 'F01010500438', 'VITE AUTOFIL. 2,9x9,5mm TSP', 'PZ', 2, 0.01, '2015-02-10'),
('SKYLINE', 10, '40211631200', 'PROF.SKYLINE L=4300mm ANODIZZATO', 'PZV', 1, 3.43, '2015-02-16'),
('SKYLINE', 110, '81106000100', 'ETIC.IMB.SING. 75x45 PROD. CE', 'PZV', 1, 0.006, '2015-02-16'),
('SKYLINE', 120, '81106020100', 'ETIC.IMB.MULT.100x80 PROD. CE', 'PZV', 1, 0.006, '2015-02-16'),
('SKYLINE', 160, '81110391000', 'ETIC.13x35mm ''12VDC MAX1,5A''', 'PZ', 1, 0.006, '2015-02-16'),
('SKYLINE', 170, '81110621000', 'ETIC.15x8 SELEZIONE COLORE LED', 'PZ', 1, 0.006, '2015-02-16'),
('SKYLINE', 130, '81115301000', 'ETIC.13x70mm  DATI DI TARGA BALI ENEC', 'PZ', 1, 0.006, '2015-02-16');

-- --------------------------------------------------------

--
-- Struttura della tabella `lavorazioni_prodotto`
--

CREATE TABLE IF NOT EXISTS `lavorazioni_prodotto` (
  `tipo_lavorazione` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Fasi di lavorazioni '
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `lavorazioni_prodotto`
--

INSERT INTO `lavorazioni_prodotto` (`tipo_lavorazione`) VALUES
('ASSEMBLAGGIO'),
('TAGLIO REELPLATE'),
('TAGLIO SCHERMO'),
('TAGLIO SCHERMO + FRESATA'),
('TAGLIO VERGA'),
('TAGLIO VERGA + FRESATURA x SENSORE'),
('TAGLIO VERGA + FRESATURA x USCITA CAVO'),
('TAGLIO VERGA + PUNZONATURA x USCITA CAVO');

-- --------------------------------------------------------

--
-- Struttura della tabella `moq`
--

CREATE TABLE IF NOT EXISTS `moq` (
  `da` int(11) NOT NULL,
  `a` int(11) NOT NULL,
  `MOQ` double NOT NULL,
  `data_validita` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `moq`
--

INSERT INTO `moq` (`da`, `a`, `MOQ`, `data_validita`) VALUES
(1, 9, 3.6, '2014-07-29'),
(10, 19, 1.8, '2014-07-29'),
(20, 99, 0, '2015-01-29');

-- --------------------------------------------------------

--
-- Struttura della tabella `motore_led`
--

CREATE TABLE IF NOT EXISTS `motore_led` (
  `codice_motore_led` varchar(2) COLLATE utf8_bin NOT NULL COMMENT 'codice identificativo del tipo motore led',
  `descrizione_motore` varchar(150) COLLATE utf8_bin NOT NULL COMMENT 'motore led',
  `data_inserimento` date NOT NULL COMMENT 'data inserimento motore led',
  `VDC` varchar(5) COLLATE utf8_bin NOT NULL,
  `versione_led` varchar(5) COLLATE utf8_bin NOT NULL COMMENT 'versione del tipo di led',
  `obsoleta` tinyint(4) NOT NULL COMMENT 'Indica se il motore led è obsoleto o meno',
  `lunghezza_bobina` int(11) NOT NULL COMMENT 'lunghezza in mm della bobina reel',
  `costo_bobina_reel` double NOT NULL COMMENT 'costo per 1 bobina'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Motori led presenti in azienda';

--
-- Dump dei dati per la tabella `motore_led`
--

INSERT INTO `motore_led` (`codice_motore_led`, `descrizione_motore`, `data_inserimento`, `VDC`, `versione_led`, `obsoleta`, `lunghezza_bobina`, `costo_bobina_reel`) VALUES
('A', '60 LED/mt', '2012-11-14', '12Vdc', '3528', 0, 5000, 0),
('B', '120 LED/mt', '2012-11-14', '12Vdc', '3528', 0, 0, 0),
('C', '108 LED/mt', '2014-03-12', '12Vdc', '3528', 0, 5000, 28),
('D', '60 LED/mt', '2014-05-27', '12Vdc', '5050', 0, 5000, 30.46),
('E', '156 LED/mt', '2014-05-27', '12Vdc', '3528', 0, 5000, 37.07),
('F', '120/120 EMOTION', '2014-05-27', '12Vdc', '3014', 0, 10000, 67.2),
('G', '72 LED/mt', '2014-05-27', '12Vdc', '3528', 0, 5000, 22.06),
('I', '156 LED/mt', '2014-05-27', '24Vdc', '3528', 0, 5000, 37.07),
('M', '108 LED/mt', '2014-05-27', '24Vdc', '3528', 0, 5000, 28),
('N', '72 LED/mt', '2014-05-27', '24Vdc', '3528', 0, 5000, 22.06);

-- --------------------------------------------------------

--
-- Struttura della tabella `motore_led_luce`
--

CREATE TABLE IF NOT EXISTS `motore_led_luce` (
  `motore_led` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'codice motore led',
  `id_tipo_luce` int(11) NOT NULL COMMENT 'colore della luce, temeperatutra',
  `data_inserimento` date NOT NULL COMMENT 'data inserimento/modifica',
  `codice_articolo` varchar(11) NOT NULL COMMENT 'codice articolo bobina reel',
  `descrizione_articolo` varchar(50) NOT NULL COMMENT 'Descrizione del codice reel'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `motore_led_luce`
--

INSERT INTO `motore_led_luce` (`motore_led`, `id_tipo_luce`, `data_inserimento`, `codice_articolo`, `descrizione_articolo`) VALUES
('C', 1, '2014-05-27', '30903270000', 'STRIP REEL 5MT 3000K 11,8W/m 12V 108L/m'),
('C', 3, '2014-05-27', '30903290000', 'STRIP REEL 5MT 6000K 11,8W/m 12V 108L/m'),
('C', 4, '2014-05-27', '30903280000', 'STRIP REEL 5MT 4000K 11,8W/m 12V 108L/m'),
('D', 1, '2014-05-27', '30902860000', 'STRIP REEL 5050 3000K 72,0W 12V 60L/M'),
('D', 3, '2014-05-27', '30902880000', 'STRIP REEL 5050 6000K 72,0W 12V 60L/M'),
('D', 4, '2014-05-27', '30902870000', 'STRIP REEL 5050 4200K 72,0W 12V 60L/M'),
('E', 1, '2014-05-27', '30902970000', 'STRIP REEL 5MT 3000K 16,9W/m 12V 156L/m'),
('E', 3, '2014-05-27', '30903220000', 'STRIP REEL 5MT 6000K 16,9W/m 12V 156L/m'),
('E', 4, '2014-05-27', '30902980000', 'STRIP REEL 5MT 4000K 16,9W/m 12V 156L/m'),
('F', 6, '2014-05-27', '30903350000', 'STRIP REEL 10MT EMOTION 120/120 12V'),
('G', 1, '2014-05-27', '30903240000', 'STRIP REEL 5MT 3000K 7,8W/m 12V 72L/m'),
('G', 3, '2014-05-27', '30903260000', 'STRIP REEL 5MT 6000K 7,8W/m 12V 72L/m'),
('G', 4, '2014-05-27', '30903250000', 'STRIP REEL 5MT 4000K 7,8W/m 12V 72L/m'),
('I', 1, '2014-05-27', '30903000000', 'STRIP REEL 5MT 3000K 16,9W/m 24V 156L/m'),
('I', 3, '2014-05-27', '30903230000', 'STRIP REEL 5MT 6000K 16,9W/m 24V 156L/m'),
('I', 4, '2014-05-27', '30903010000', 'STRIP REEL 5MT 4000K 16,9W/m 24V 156L/m'),
('M', 1, '2014-05-27', '30903800000', 'STRIP REEL 5MT 3000K 11,8W/m 24V 108L/m'),
('M', 3, '2014-05-27', '30903820000', 'STRIP REEL 5MT 6000K 11,8W/m 24V 108L/m'),
('M', 4, '2014-05-27', '30903810000', 'STRIP REEL 5MT 4000K 11,8W/m 24V 108L/m'),
('N', 1, '2014-05-27', '30903840000', 'STRIP REEL 5MT 3000K 7,8W/m 24V 72L/m'),
('N', 3, '2014-05-27', '30903860000', 'STRIP REEL 5MT 6000K 7,8W/m 24V 72L/m'),
('N', 4, '2014-05-27', '30903850000', 'STRIP REEL 5MT 4000K 7,8W/m 24V 72L/m');

-- --------------------------------------------------------

--
-- Struttura della tabella `prodotti_lineari`
--

CREATE TABLE IF NOT EXISTS `prodotti_lineari` (
  `nome_prodotto` varchar(50) COLLATE utf8_bin NOT NULL COMMENT 'nome prodotto lineare',
  `codice_articolo` varchar(13) COLLATE utf8_bin DEFAULT NULL COMMENT 'codice articolo associato alle lunghezze della barra',
  `lunghezza_minima_accettata` int(11) NOT NULL COMMENT 'lunghezza minima accettata per costruzione barra',
  `lunghezza_massima_accettata` int(11) NOT NULL COMMENT 'lunghezza massima accettata per costruzione barra',
  `lente` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT 'Definisce se il prodotto finale deve avere, nelle barre led, le lenti o meno',
  `data_inserimento` date NOT NULL,
  `obsoleta` tinyint(1) NOT NULL COMMENT 'Definisce se il prodotto non può essere utilizzato nel configuratore => 1 true , 0 false (quindi visibile) '
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Prodotti led lineari aziendali';

--
-- Dump dei dati per la tabella `prodotti_lineari`
--

INSERT INTO `prodotti_lineari` (`nome_prodotto`, `codice_articolo`, `lunghezza_minima_accettata`, `lunghezza_massima_accettata`, `lente`, `data_inserimento`, `obsoleta`) VALUES
('BALI', '15900000000', 150, 3000, 'SI', '2013-04-15', 0),
('BORNEO', NULL, 150, 3000, NULL, '2014-05-27', 1),
('BRASILIA', NULL, 150, 3000, NULL, '2014-05-27', 0),
('DERBY', NULL, 150, 3000, NULL, '2014-05-27', 0),
('GENEVE', NULL, 150, 3000, NULL, '2014-05-27', 0),
('LEDO', NULL, 150, 3000, NULL, '2014-05-27', 0),
('LUGANO', '20600000000', 150, 3000, 'SI', '2013-04-15', 0),
('MALINDI', '20000000000', 150, 3000, 'SI', '2013-04-15', 0),
('MALINDI-in', NULL, 150, 3000, NULL, '2014-05-27', 0),
('MANILA', '15710011201', 150, 3000, 'SI', '2012-11-14', 0),
('MECCANO', NULL, 150, 3000, NULL, '2014-05-27', 1),
('MISKA', NULL, 150, 3000, NULL, '2014-05-27', 0),
('PERTH', NULL, 150, 3000, NULL, '2014-05-27', 0),
('SKYLINE', NULL, 150, 3000, NULL, '2014-05-27', 0),
('TIFANY', NULL, 150, 3000, NULL, '2014-05-27', 0),
('VENICE', '15800000000', 150, 3000, 'SI', '2015-02-10', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `prodotto_lineare_motore_led_accensione`
--

CREATE TABLE IF NOT EXISTS `prodotto_lineare_motore_led_accensione` (
  `prodotto_lineare` varchar(50) COLLATE utf8_bin NOT NULL COMMENT 'Nome prodotto lineare',
  `motore_led` varchar(2) COLLATE utf8_bin NOT NULL COMMENT 'motore led associato',
  `id_sistema_accensione` int(11) NOT NULL COMMENT 'sistema di accensione legato al prodotto e tipo reel',
  `ingombro_tecnico` double NOT NULL COMMENT 'ingombro tecnico da considerare per la costruzione della lambada (testate, spazio per il touch etc)',
  `id_sistema_fissaggio` int(11) NOT NULL COMMENT 'tipo di sistema di fissaggio',
  `id_connettore` int(11) NOT NULL COMMENT 'tipo di connettore associabile alla lampada',
  `giunzione_MF` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT 'definisco se un prodotto ha la giunzione MF standard oppure è fattibile. Se no vuol dire che ha lo sliding attivo',
  `uscita_cavo` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT 'definisco l''uscita del cavo di un prodotto. Può essere standard, in questo caso vedo la descrizione di dove è std, oppure reversibile',
  `descrizione_uscita_cavo` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT 'definisce dove è std l''uscita cavo per una lampada',
  `data_inserimento` date NOT NULL COMMENT 'data inserimento associazione'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Associazione dei motori led per ogni prodotto lineare';

--
-- Dump dei dati per la tabella `prodotto_lineare_motore_led_accensione`
--

INSERT INTO `prodotto_lineare_motore_led_accensione` (`prodotto_lineare`, `motore_led`, `id_sistema_accensione`, `ingombro_tecnico`, `id_sistema_fissaggio`, `id_connettore`, `giunzione_MF`, `uscita_cavo`, `descrizione_uscita_cavo`, `data_inserimento`) VALUES
('BALI', 'C', 1, 59, 1, 1, 'SI', 'REVER', '', '2014-03-12'),
('BALI', 'C', 1, 59, 1, 2, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'C', 1, 59, 1, 4, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'C', 1, 59, 3, 1, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'C', 1, 59, 3, 2, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'C', 1, 59, 3, 4, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'C', 2, 96, 1, 1, 'SI', 'REVER', '', '2014-05-30'),
('BALI', 'C', 2, 96, 1, 2, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'C', 2, 96, 1, 4, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'C', 2, 96, 3, 1, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'C', 2, 96, 3, 2, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'C', 2, 96, 3, 4, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'D', 1, 59, 1, 1, 'SI', 'REVER', '', '2014-05-27'),
('BALI', 'D', 1, 59, 1, 2, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'D', 1, 59, 1, 4, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'D', 1, 59, 3, 1, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'D', 1, 59, 3, 2, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'D', 1, 59, 3, 4, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'D', 2, 96, 1, 1, 'SI', 'REVER', '', '2014-05-30'),
('BALI', 'D', 2, 96, 1, 2, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'D', 2, 96, 1, 4, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'D', 2, 96, 3, 1, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'D', 2, 96, 3, 2, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'D', 2, 96, 3, 4, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'E', 1, 59, 1, 1, 'SI', 'REVER', '', '2014-05-27'),
('BALI', 'E', 1, 59, 1, 2, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'E', 1, 59, 1, 4, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'E', 1, 59, 3, 1, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'E', 1, 59, 3, 2, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'E', 1, 59, 3, 4, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'E', 2, 96, 1, 1, 'SI', 'REVER', '', '2014-05-30'),
('BALI', 'E', 2, 96, 1, 2, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'E', 2, 96, 1, 4, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'E', 2, 96, 3, 1, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'E', 2, 96, 3, 2, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'E', 2, 96, 3, 4, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'F', 1, 59, 1, 1, 'SI', 'REVER', '', '2014-05-27'),
('BALI', 'F', 1, 59, 3, 1, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'F', 4, 0, 1, 1, 'SI', 'REVER', '', '2014-05-30'),
('BALI', 'G', 1, 59, 1, 1, 'SI', 'REVER', '', '2014-05-27'),
('BALI', 'G', 1, 59, 1, 2, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'G', 1, 59, 1, 4, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'G', 1, 59, 3, 1, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'G', 1, 59, 3, 2, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'G', 1, 59, 3, 4, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'G', 2, 96, 1, 1, 'SI', 'REVER', '', '2014-05-30'),
('BALI', 'G', 2, 96, 1, 2, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'G', 2, 96, 1, 4, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'G', 2, 96, 3, 1, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'G', 2, 96, 3, 2, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'G', 2, 96, 3, 4, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'I', 1, 59, 1, 1, 'SI', 'REVER', '', '2014-05-27'),
('BALI', 'I', 1, 59, 1, 2, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'I', 1, 59, 1, 4, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'I', 1, 59, 3, 1, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'I', 1, 59, 3, 2, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'I', 1, 59, 3, 4, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'I', 2, 96, 1, 1, 'SI', 'REVER', '', '2014-05-30'),
('BALI', 'I', 2, 96, 1, 2, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'I', 2, 96, 1, 4, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'I', 2, 96, 3, 1, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'I', 2, 96, 3, 2, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'I', 2, 96, 3, 4, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'M', 1, 59, 1, 1, 'SI', 'REVER', '', '2014-05-27'),
('BALI', 'M', 1, 59, 1, 2, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'M', 1, 59, 1, 4, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'M', 1, 59, 3, 1, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'M', 1, 59, 3, 2, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'M', 1, 59, 3, 4, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'M', 2, 96, 1, 1, 'SI', 'REVER', '', '2014-05-30'),
('BALI', 'M', 2, 96, 1, 2, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'M', 2, 96, 1, 4, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'M', 2, 96, 3, 1, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'M', 2, 96, 3, 2, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'M', 2, 96, 3, 4, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'N', 1, 59, 1, 1, 'SI', 'REVER', '', '2014-05-27'),
('BALI', 'N', 1, 59, 1, 2, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'N', 1, 59, 1, 4, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'N', 1, 59, 3, 1, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'N', 1, 59, 3, 2, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'N', 1, 59, 3, 4, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'N', 2, 96, 1, 1, 'SI', 'REVER', '', '2014-05-30'),
('BALI', 'N', 2, 96, 1, 2, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'N', 2, 96, 1, 4, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'N', 2, 96, 3, 1, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'N', 2, 96, 3, 2, 'SI', 'REVER', '', '2014-06-09'),
('BALI', 'N', 2, 96, 3, 4, 'SI', 'REVER', '', '2014-06-09'),
('BORNEO', 'C', 1, 0, 1, 1, '', '', '', '2014-05-27'),
('BORNEO', 'D', 1, 0, 1, 1, '', '', '', '2014-05-27'),
('BORNEO', 'E', 1, 0, 1, 1, '', '', '', '2014-05-27'),
('BORNEO', 'G', 1, 0, 1, 1, '', '', '', '2014-05-27'),
('BORNEO', 'I', 1, 0, 1, 1, '', '', '', '2014-05-27'),
('BORNEO', 'M', 1, 0, 1, 1, '', '', '', '2014-05-27'),
('BORNEO', 'N', 1, 0, 1, 1, '', '', '', '2014-05-27'),
('BRASILIA', 'C', 1, 57, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-27'),
('BRASILIA', 'C', 1, 57, 1, 2, 'SI', 'STD', 'sinistra', '2014-06-09'),
('BRASILIA', 'C', 1, 57, 1, 4, 'SI', 'STD', 'sinistra', '2014-06-09'),
('BRASILIA', 'C', 1, 49, 2, 1, 'SI', 'STD', 'sinistra', '2014-05-27'),
('BRASILIA', 'C', 1, 49, 2, 2, 'SI', 'STD', 'sinistra', '2014-06-09'),
('BRASILIA', 'C', 1, 49, 2, 4, 'SI', 'STD', 'sinistra', '2014-06-09'),
('BRASILIA', 'C', 1, 65, 3, 1, 'SI', 'STD', 'sinistra', '2014-05-27'),
('BRASILIA', 'C', 1, 65, 3, 2, 'SI', 'STD', 'sinistra', '2014-06-09'),
('BRASILIA', 'C', 1, 65, 3, 4, 'SI', 'STD', 'sinistra', '2014-06-09'),
('BRASILIA', 'D', 1, 57, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-27'),
('BRASILIA', 'D', 1, 57, 1, 2, 'SI', 'STD', 'sinistra', '2014-06-09'),
('BRASILIA', 'D', 1, 57, 1, 4, 'SI', 'STD', 'sinistra', '2014-06-09'),
('BRASILIA', 'D', 1, 49, 2, 1, 'SI', 'STD', 'sinistra', '2014-05-27'),
('BRASILIA', 'D', 1, 49, 2, 2, 'SI', 'STD', 'sinistra', '2014-06-09'),
('BRASILIA', 'D', 1, 49, 2, 4, 'SI', 'STD', 'sinistra', '2014-06-09'),
('BRASILIA', 'D', 1, 65, 3, 1, 'SI', 'STD', 'sinistra', '2014-05-27'),
('BRASILIA', 'D', 1, 65, 3, 2, 'SI', 'STD', 'sinistra', '2014-06-09'),
('BRASILIA', 'D', 1, 65, 3, 4, 'SI', 'STD', 'sinistra', '2014-06-09'),
('BRASILIA', 'E', 1, 57, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-27'),
('BRASILIA', 'E', 1, 57, 1, 2, 'SI', 'STD', 'sinistra', '2014-06-09'),
('BRASILIA', 'E', 1, 57, 1, 4, 'SI', 'STD', 'sinistra', '2014-06-09'),
('BRASILIA', 'E', 1, 49, 2, 1, 'SI', 'STD', 'sinistra', '2014-05-27'),
('BRASILIA', 'E', 1, 49, 2, 2, 'SI', 'STD', 'sinistra', '2014-06-09'),
('BRASILIA', 'E', 1, 49, 2, 4, 'SI', 'STD', 'sinistra', '2014-06-09'),
('BRASILIA', 'E', 1, 65, 3, 1, 'SI', 'STD', 'sinistra', '2014-05-27'),
('BRASILIA', 'E', 1, 65, 3, 2, 'SI', 'STD', 'sinistra', '2014-06-09'),
('BRASILIA', 'E', 1, 65, 3, 4, 'SI', 'STD', 'sinistra', '2014-06-09'),
('BRASILIA', 'G', 1, 57, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-27'),
('BRASILIA', 'G', 1, 57, 1, 2, 'SI', 'STD', 'sinistra', '2014-06-09'),
('BRASILIA', 'G', 1, 57, 1, 4, 'SI', 'STD', 'sinistra', '2014-06-09'),
('BRASILIA', 'G', 1, 49, 2, 1, 'SI', 'STD', 'sinistra', '2014-05-27'),
('BRASILIA', 'G', 1, 49, 2, 2, 'SI', 'STD', 'sinistra', '2014-06-09'),
('BRASILIA', 'G', 1, 49, 2, 4, 'SI', 'STD', 'sinistra', '2014-06-09'),
('BRASILIA', 'G', 1, 65, 3, 1, 'SI', 'STD', 'sinistra', '2014-05-27'),
('BRASILIA', 'G', 1, 65, 3, 2, 'SI', 'STD', 'sinistra', '2014-06-09'),
('BRASILIA', 'G', 1, 65, 3, 4, 'SI', 'STD', 'sinistra', '2014-06-09'),
('BRASILIA', 'I', 1, 57, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-27'),
('BRASILIA', 'I', 1, 57, 1, 2, 'SI', 'STD', 'sinistra', '2014-06-09'),
('BRASILIA', 'I', 1, 57, 1, 4, 'SI', 'STD', 'sinistra', '2014-06-09'),
('BRASILIA', 'I', 1, 49, 2, 1, 'SI', 'STD', 'sinistra', '2014-05-27'),
('BRASILIA', 'I', 1, 49, 2, 2, 'SI', 'STD', 'sinistra', '2014-06-09'),
('BRASILIA', 'I', 1, 49, 2, 4, 'SI', 'STD', 'sinistra', '2014-06-09'),
('BRASILIA', 'I', 1, 65, 3, 1, 'SI', 'STD', 'sinistra', '2014-05-27'),
('BRASILIA', 'I', 1, 65, 3, 2, 'SI', 'STD', 'sinistra', '2014-06-09'),
('BRASILIA', 'I', 1, 65, 3, 4, 'SI', 'STD', 'sinistra', '2014-06-09'),
('BRASILIA', 'M', 1, 57, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-27'),
('BRASILIA', 'M', 1, 57, 1, 2, 'SI', 'STD', 'sinistra', '2014-06-09'),
('BRASILIA', 'M', 1, 57, 1, 4, 'SI', 'STD', 'sinistra', '2014-06-09'),
('BRASILIA', 'M', 1, 49, 2, 1, 'SI', 'STD', 'sinistra', '2014-05-27'),
('BRASILIA', 'M', 1, 49, 2, 2, 'SI', 'STD', 'sinistra', '2014-06-09'),
('BRASILIA', 'M', 1, 49, 2, 4, 'SI', 'STD', 'sinistra', '2014-06-09'),
('BRASILIA', 'M', 1, 65, 3, 1, 'SI', 'STD', 'sinistra', '2014-05-27'),
('BRASILIA', 'M', 1, 65, 3, 2, 'SI', 'STD', 'sinistra', '2014-06-09'),
('BRASILIA', 'M', 1, 65, 3, 4, 'SI', 'STD', 'sinistra', '2014-06-09'),
('BRASILIA', 'N', 1, 57, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-27'),
('BRASILIA', 'N', 1, 57, 1, 2, 'SI', 'STD', 'sinistra', '2014-06-09'),
('BRASILIA', 'N', 1, 57, 1, 4, 'SI', 'STD', 'sinistra', '2014-06-09'),
('BRASILIA', 'N', 1, 49, 2, 1, 'SI', 'STD', 'sinistra', '2014-05-27'),
('BRASILIA', 'N', 1, 49, 2, 2, 'SI', 'STD', 'sinistra', '2014-06-09'),
('BRASILIA', 'N', 1, 49, 2, 4, 'SI', 'STD', 'sinistra', '2014-06-09'),
('BRASILIA', 'N', 1, 65, 3, 1, 'SI', 'STD', 'sinistra', '2014-05-27'),
('BRASILIA', 'N', 1, 65, 3, 2, 'SI', 'STD', 'sinistra', '2014-06-09'),
('BRASILIA', 'N', 1, 65, 3, 4, 'SI', 'STD', 'sinistra', '2014-06-09'),
('DERBY', 'C', 1, 45, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-27'),
('DERBY', 'C', 2, 82, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-30'),
('DERBY', 'E', 1, 45, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-27'),
('DERBY', 'E', 2, 82, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-30'),
('DERBY', 'F', 1, 45, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-27'),
('DERBY', 'F', 4, 82, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-30'),
('DERBY', 'G', 1, 45, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-27'),
('DERBY', 'G', 2, 82, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-30'),
('DERBY', 'I', 1, 45, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-27'),
('DERBY', 'I', 2, 82, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-30'),
('DERBY', 'M', 1, 45, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-27'),
('DERBY', 'M', 2, 82, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-30'),
('DERBY', 'N', 1, 45, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-27'),
('DERBY', 'N', 2, 82, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-30'),
('GENEVE', 'C', 1, 77, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-27'),
('GENEVE', 'E', 1, 77, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-27'),
('GENEVE', 'G', 1, 77, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-27'),
('GENEVE', 'I', 1, 77, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-27'),
('GENEVE', 'M', 1, 77, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-27'),
('GENEVE', 'N', 1, 77, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-27'),
('LEDO', 'C', 1, 36, 1, 1, 'SI', 'REVER', '', '2014-05-27'),
('LEDO', 'C', 1, 36, 1, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'C', 1, 36, 1, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'C', 1, 36, 2, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'C', 1, 36, 2, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'C', 1, 36, 2, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'C', 1, 36, 3, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'C', 1, 36, 3, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'C', 1, 36, 3, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'C', 2, 73, 1, 1, 'SI', 'REVER', '', '2014-05-30'),
('LEDO', 'C', 2, 73, 1, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'C', 2, 73, 1, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'C', 2, 73, 2, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'C', 2, 73, 2, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'C', 2, 73, 2, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'C', 2, 73, 3, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'C', 2, 73, 3, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'C', 2, 73, 3, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'D', 1, 36, 1, 1, 'SI', 'REVER', '', '2014-05-27'),
('LEDO', 'D', 1, 36, 1, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'D', 1, 36, 1, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'D', 1, 36, 2, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'D', 1, 36, 2, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'D', 1, 36, 2, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'D', 1, 36, 3, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'D', 1, 36, 3, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'D', 1, 36, 3, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'D', 2, 73, 1, 1, 'SI', 'REVER', '', '2014-05-30'),
('LEDO', 'D', 2, 73, 1, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'D', 2, 73, 1, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'D', 2, 73, 2, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'D', 2, 73, 2, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'D', 2, 73, 2, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'D', 2, 73, 3, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'D', 2, 73, 3, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'D', 2, 73, 3, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'E', 1, 36, 1, 1, 'SI', 'REVER', '', '2014-05-27'),
('LEDO', 'E', 1, 36, 1, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'E', 1, 36, 1, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'E', 1, 36, 2, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'E', 1, 36, 2, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'E', 1, 36, 2, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'E', 1, 36, 3, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'E', 1, 36, 3, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'E', 1, 36, 3, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'E', 2, 73, 1, 1, 'SI', 'REVER', '', '2014-05-30'),
('LEDO', 'E', 2, 73, 1, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'E', 2, 73, 1, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'E', 2, 73, 2, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'E', 2, 73, 2, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'E', 2, 73, 2, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'E', 2, 73, 3, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'E', 2, 73, 3, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'E', 2, 73, 3, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'G', 1, 36, 1, 1, 'SI', 'REVER', '', '2014-05-27'),
('LEDO', 'G', 1, 36, 1, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'G', 1, 36, 1, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'G', 1, 36, 2, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'G', 1, 36, 2, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'G', 1, 36, 2, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'G', 1, 36, 3, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'G', 1, 36, 3, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'G', 1, 36, 3, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'G', 2, 73, 1, 1, 'SI', 'REVER', '', '2014-05-30'),
('LEDO', 'G', 2, 73, 1, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'G', 2, 73, 1, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'G', 2, 73, 2, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'G', 2, 73, 2, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'G', 2, 73, 2, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'G', 2, 73, 3, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'G', 2, 73, 3, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'G', 2, 73, 3, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'I', 1, 36, 1, 1, 'SI', 'REVER', '', '2014-05-27'),
('LEDO', 'I', 1, 36, 1, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'I', 1, 36, 1, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'I', 1, 36, 2, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'I', 1, 36, 2, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'I', 1, 36, 2, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'I', 1, 36, 3, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'I', 1, 36, 3, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'I', 1, 36, 3, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'I', 2, 73, 1, 1, 'SI', 'REVER', '', '2014-05-30'),
('LEDO', 'I', 2, 73, 1, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'I', 2, 73, 1, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'I', 2, 73, 2, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'I', 2, 73, 2, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'I', 2, 73, 2, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'I', 2, 73, 3, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'I', 2, 73, 3, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'I', 2, 73, 3, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'M', 1, 36, 1, 1, 'SI', 'REVER', '', '2014-05-27'),
('LEDO', 'M', 1, 36, 1, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'M', 1, 36, 1, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'M', 1, 36, 2, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'M', 1, 36, 2, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'M', 1, 36, 2, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'M', 1, 36, 3, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'M', 1, 36, 3, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'M', 1, 36, 3, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'M', 2, 73, 1, 1, 'SI', 'REVER', '', '2014-05-30'),
('LEDO', 'M', 2, 73, 1, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'M', 2, 73, 1, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'M', 2, 73, 2, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'M', 2, 73, 2, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'M', 2, 73, 2, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'M', 2, 73, 3, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'M', 2, 73, 3, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'M', 2, 73, 3, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'N', 1, 36, 1, 1, 'SI', 'REVER', '', '2014-05-27'),
('LEDO', 'N', 1, 36, 1, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'N', 1, 36, 1, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'N', 1, 36, 2, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'N', 1, 36, 2, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'N', 1, 36, 2, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'N', 1, 36, 3, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'N', 1, 36, 3, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'N', 1, 36, 3, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'N', 2, 73, 1, 1, 'SI', 'REVER', '', '2014-05-30'),
('LEDO', 'N', 2, 73, 1, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'N', 2, 73, 1, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'N', 2, 73, 2, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'N', 2, 73, 2, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'N', 2, 73, 2, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'N', 2, 73, 3, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'N', 2, 73, 3, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'N', 2, 73, 3, 4, 'SI', 'REVER', '', '2014-06-09'),
('LUGANO', 'C', 1, 77, 1, 1, 'SI', 'STD', 'sinistra', '2014-03-12'),
('LUGANO', 'C', 2, 114, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-30'),
('LUGANO', 'E', 1, 77, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-27'),
('LUGANO', 'E', 2, 114, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-30'),
('LUGANO', 'F', 1, 77, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-27'),
('LUGANO', 'F', 4, 0, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-30'),
('LUGANO', 'G', 1, 77, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-27'),
('LUGANO', 'G', 2, 114, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-30'),
('LUGANO', 'I', 1, 77, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-27'),
('LUGANO', 'I', 2, 114, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-30'),
('LUGANO', 'M', 1, 77, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-27'),
('LUGANO', 'M', 2, 114, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-30'),
('LUGANO', 'N', 1, 77, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-27'),
('LUGANO', 'N', 2, 114, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-30'),
('MALINDI', 'C', 1, 53, 1, 1, 'NO', 'REVER', '', '2014-03-12'),
('MALINDI', 'C', 1, 53, 1, 3, 'NO', 'REVER', '', '2014-06-09'),
('MALINDI', 'C', 2, 90, 1, 1, 'STD', 'REVER', '', '2014-05-30'),
('MALINDI', 'C', 2, 90, 1, 3, 'NO', 'REVER', '', '2014-06-09'),
('MALINDI', 'E', 1, 53, 1, 1, 'NO', 'REVER', '', '2014-05-27'),
('MALINDI', 'E', 1, 53, 1, 3, 'NO', 'REVER', '', '2014-06-09'),
('MALINDI', 'E', 2, 90, 1, 1, 'STD', 'REVER', '', '2014-05-30'),
('MALINDI', 'E', 2, 90, 1, 3, 'NO', 'REVER', '', '2014-06-09'),
('MALINDI', 'F', 1, 53, 1, 1, 'NO', 'REVER', '', '2014-05-27'),
('MALINDI', 'F', 4, 0, 1, 1, 'STD', 'REVER', '', '2014-05-30'),
('MALINDI', 'G', 1, 53, 1, 1, 'NO', 'REVER', '', '2014-05-27'),
('MALINDI', 'G', 1, 53, 1, 3, 'NO', 'REVER', '', '2014-06-09'),
('MALINDI', 'G', 2, 90, 1, 1, 'STD', 'REVER', '', '2014-05-30'),
('MALINDI', 'G', 2, 90, 1, 3, 'NO', 'REVER', '', '2014-06-09'),
('MALINDI', 'I', 1, 53, 1, 1, 'NO', 'REVER', '', '2014-05-27'),
('MALINDI', 'I', 1, 53, 1, 3, 'NO', 'REVER', '', '2014-06-09'),
('MALINDI', 'I', 2, 90, 1, 1, 'STD', 'REVER', '', '2014-05-30'),
('MALINDI', 'I', 2, 90, 1, 3, 'NO', 'REVER', '', '2014-06-09'),
('MALINDI', 'M', 1, 53, 1, 1, 'NO', 'REVER', '', '2014-05-27'),
('MALINDI', 'M', 1, 53, 1, 3, 'NO', 'REVER', '', '2014-06-09'),
('MALINDI', 'M', 2, 90, 1, 1, 'STD', 'REVER', '', '2014-05-30'),
('MALINDI', 'M', 2, 90, 1, 3, 'NO', 'REVER', '', '2014-06-09'),
('MALINDI', 'N', 1, 53, 1, 1, 'NO', 'REVER', '', '2014-05-27'),
('MALINDI', 'N', 1, 53, 1, 3, 'NO', 'REVER', '', '2014-06-09'),
('MALINDI', 'N', 2, 90, 1, 1, 'STD', 'REVER', '', '2014-05-30'),
('MALINDI', 'N', 2, 90, 1, 3, 'NO', 'REVER', '', '2014-06-09'),
('MALINDI-in', 'C', 1, 41, 1, 1, 'SI', 'REVER', '', '2014-05-27'),
('MALINDI-in', 'C', 1, 41, 1, 3, 'SI', 'REVER', '', '2014-06-09'),
('MALINDI-in', 'C', 2, 78, 1, 1, 'SI', 'REVER', '', '2014-05-30'),
('MALINDI-in', 'C', 2, 78, 1, 3, 'SI', 'REVER', '', '2014-06-09'),
('MALINDI-in', 'E', 1, 41, 1, 1, 'SI', 'REVER', '', '2014-05-27'),
('MALINDI-in', 'E', 1, 41, 1, 3, 'SI', 'REVER', '', '2014-06-09'),
('MALINDI-in', 'E', 2, 78, 1, 1, 'SI', 'REVER', '', '2014-05-30'),
('MALINDI-in', 'E', 2, 78, 1, 3, 'SI', 'REVER', '', '2014-06-09'),
('MALINDI-in', 'F', 1, 41, 1, 1, 'SI', 'REVER', '', '2014-05-27'),
('MALINDI-in', 'F', 4, 0, 1, 1, 'SI', 'REVER', '', '2014-05-30'),
('MALINDI-in', 'G', 1, 41, 1, 1, 'SI', 'REVER', '', '2014-05-27'),
('MALINDI-in', 'G', 1, 41, 1, 3, 'SI', 'REVER', '', '2014-06-09'),
('MALINDI-in', 'G', 2, 78, 1, 1, 'SI', 'REVER', '', '2014-05-30'),
('MALINDI-in', 'G', 2, 78, 1, 3, 'SI', 'REVER', '', '2014-06-09'),
('MALINDI-in', 'I', 1, 41, 1, 1, 'SI', 'REVER', '', '2014-05-27'),
('MALINDI-in', 'I', 1, 41, 1, 3, 'SI', 'REVER', '', '2014-06-09'),
('MALINDI-in', 'I', 2, 78, 1, 1, 'SI', 'REVER', '', '2014-05-30'),
('MALINDI-in', 'I', 2, 78, 1, 3, 'SI', 'REVER', '', '2014-06-09'),
('MALINDI-in', 'M', 1, 41, 1, 1, 'SI', 'REVER', '', '2014-05-27'),
('MALINDI-in', 'M', 1, 41, 1, 3, 'SI', 'REVER', '', '2014-06-09'),
('MALINDI-in', 'M', 2, 78, 1, 1, 'SI', 'REVER', '', '2014-05-30'),
('MALINDI-in', 'M', 2, 78, 1, 3, 'SI', 'REVER', '', '2014-06-09'),
('MALINDI-in', 'N', 1, 41, 1, 1, 'SI', 'REVER', '', '2014-05-27'),
('MALINDI-in', 'N', 1, 41, 1, 3, 'SI', 'REVER', '', '2014-06-09'),
('MALINDI-in', 'N', 2, 78, 1, 1, 'SI', 'REVER', '', '2014-05-30'),
('MALINDI-in', 'N', 2, 78, 1, 3, 'SI', 'REVER', '', '2014-06-09'),
('MANILA', 'C', 1, 53, 1, 1, 'SI', 'REVER', '', '2014-05-27'),
('MANILA', 'C', 2, 90, 1, 1, 'SI', 'REVER', '', '2014-05-30'),
('MANILA', 'E', 1, 53, 1, 1, 'SI', 'REVER', '', '2014-05-27'),
('MANILA', 'E', 2, 90, 1, 1, 'SI', 'REVER', '', '2014-05-30'),
('MANILA', 'F', 1, 53, 1, 1, 'SI', 'REVER', '', '2014-05-27'),
('MANILA', 'F', 4, 0, 1, 1, 'SI', 'REVER', '', '2014-05-30'),
('MANILA', 'G', 1, 53, 1, 1, 'SI', 'REVER', '', '2014-05-27'),
('MANILA', 'G', 2, 90, 1, 1, 'SI', 'REVER', '', '2014-05-30'),
('MANILA', 'I', 1, 53, 1, 1, 'SI', 'REVER', '', '2014-05-27'),
('MANILA', 'I', 2, 90, 1, 1, 'SI', 'REVER', '', '2014-05-30'),
('MANILA', 'M', 1, 53, 1, 1, 'SI', 'REVER', '', '2014-05-27'),
('MANILA', 'M', 2, 90, 1, 1, 'SI', 'REVER', '', '2014-05-30'),
('MANILA', 'N', 1, 53, 1, 1, 'SI', 'REVER', '', '2014-05-27'),
('MANILA', 'N', 2, 90, 1, 1, 'SI', 'REVER', '', '2014-05-30'),
('MECCANO', 'C', 1, 0, 1, 1, '', '', '', '2014-05-27'),
('MECCANO', 'C', 2, 0, 1, 1, '', '', '', '2014-05-30'),
('MECCANO', 'C', 3, 0, 1, 1, '', '', '', '2014-05-30'),
('MECCANO', 'C', 5, 0, 1, 1, '', '', '', '2014-05-30'),
('MECCANO', 'D', 1, 0, 1, 1, '', '', '', '2014-05-27'),
('MECCANO', 'D', 2, 0, 1, 1, '', '', '', '2014-05-30'),
('MECCANO', 'D', 3, 0, 1, 1, '', '', '', '2014-05-30'),
('MECCANO', 'D', 5, 0, 1, 1, '', '', '', '2014-05-30'),
('MECCANO', 'E', 1, 0, 1, 1, '', '', '', '2014-05-27'),
('MECCANO', 'E', 2, 0, 1, 1, '', '', '', '2014-05-30'),
('MECCANO', 'E', 3, 0, 1, 1, '', '', '', '2014-05-30'),
('MECCANO', 'E', 5, 0, 1, 1, '', '', '', '2014-05-30'),
('MECCANO', 'G', 1, 0, 1, 1, '', '', '', '2014-05-27'),
('MECCANO', 'G', 2, 0, 1, 1, '', '', '', '2014-05-30'),
('MECCANO', 'G', 3, 0, 1, 1, '', '', '', '2014-05-30'),
('MECCANO', 'G', 5, 0, 1, 1, '', '', '', '2014-05-30'),
('MECCANO', 'I', 1, 0, 1, 1, '', '', '', '2014-05-27'),
('MECCANO', 'I', 2, 0, 1, 1, '', '', '', '2014-05-30'),
('MECCANO', 'I', 3, 0, 1, 1, '', '', '', '2014-05-30'),
('MECCANO', 'I', 5, 0, 1, 1, '', '', '', '2014-05-30'),
('MECCANO', 'M', 1, 0, 1, 1, '', '', '', '2014-05-27'),
('MECCANO', 'M', 2, 0, 1, 1, '', '', '', '2014-05-30'),
('MECCANO', 'M', 3, 0, 1, 1, '', '', '', '2014-05-30'),
('MECCANO', 'M', 5, 0, 1, 1, '', '', '', '2014-05-30'),
('MECCANO', 'N', 1, 0, 1, 1, '', '', '', '2014-05-27'),
('MECCANO', 'N', 2, 0, 1, 1, '', '', '', '2014-05-30'),
('MECCANO', 'N', 3, 0, 1, 1, '', '', '', '2014-05-30'),
('MECCANO', 'N', 5, 0, 1, 1, '', '', '', '2014-05-30'),
('MISKA', 'C', 1, 75, 1, 1, 'STD', 'STD', 'sinistra', '2014-05-27'),
('MISKA', 'C', 3, 78, 1, 1, 'STD', 'STD', 'sinistra', '2014-05-30'),
('MISKA', 'E', 1, 75, 1, 1, 'STD', 'STD', 'sinistra', '2014-05-27'),
('MISKA', 'E', 3, 78, 1, 1, 'STD', 'STD', 'sinistra', '2014-05-30'),
('MISKA', 'G', 1, 75, 1, 1, 'STD', 'STD', 'sinistra', '2014-05-27'),
('MISKA', 'G', 3, 78, 1, 1, 'STD', 'STD', 'sinistra', '2014-05-30'),
('MISKA', 'I', 1, 75, 1, 1, 'STD', 'STD', 'sinistra', '2014-05-27'),
('MISKA', 'I', 3, 78, 1, 1, 'STD', 'STD', 'sinistra', '2014-05-30'),
('MISKA', 'M', 1, 75, 1, 1, 'STD', 'STD', 'sinistra', '2014-05-27'),
('MISKA', 'M', 3, 78, 1, 1, 'STD', 'STD', 'sinistra', '2014-05-30'),
('MISKA', 'N', 1, 75, 1, 1, 'STD', 'STD', 'sinistra', '2014-05-27'),
('MISKA', 'N', 3, 78, 1, 1, 'STD', 'STD', 'sinistra', '2014-05-30'),
('PERTH', 'C', 1, 53, 1, 1, 'SI', 'STD', 'sinistra', '2015-02-10'),
('PERTH', 'C', 3, 53, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-30'),
('PERTH', 'D', 1, 53, 1, 1, 'SI', 'STD', 'sinistra', '2015-02-10'),
('PERTH', 'D', 3, 53, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-30'),
('PERTH', 'E', 1, 53, 1, 1, 'SI', 'STD', 'sinistra', '2015-02-10'),
('PERTH', 'E', 3, 53, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-30'),
('PERTH', 'G', 1, 53, 1, 1, 'SI', 'STD', 'sinistra', '2015-02-10'),
('PERTH', 'G', 3, 53, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-30'),
('PERTH', 'I', 1, 53, 1, 1, 'SI', 'STD', 'sinistra', '2015-02-10'),
('PERTH', 'I', 3, 53, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-30'),
('PERTH', 'M', 1, 53, 1, 1, 'SI', 'STD', 'sinistra', '2015-02-10'),
('PERTH', 'M', 3, 53, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-30'),
('PERTH', 'N', 1, 53, 1, 1, 'SI', 'STD', 'sinistra', '2015-02-10'),
('PERTH', 'N', 3, 53, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-30'),
('SKYLINE', 'C', 1, 46, 1, 1, '', '', '', '2014-05-27'),
('SKYLINE', 'C', 1, 46, 1, 2, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'C', 1, 46, 1, 3, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'C', 1, 46, 1, 4, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'C', 1, 36, 2, 1, '', '', '', '2014-05-27'),
('SKYLINE', 'C', 1, 36, 2, 2, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'C', 1, 36, 2, 3, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'C', 1, 36, 2, 4, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'C', 1, 54, 3, 1, '', '', '', '2014-05-27'),
('SKYLINE', 'C', 1, 54, 3, 2, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'C', 1, 54, 3, 4, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'D', 1, 46, 1, 1, '', '', '', '2014-05-27'),
('SKYLINE', 'D', 1, 46, 1, 2, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'D', 1, 46, 1, 3, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'D', 1, 46, 1, 4, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'D', 1, 36, 2, 1, '', '', '', '2014-05-27'),
('SKYLINE', 'D', 1, 36, 2, 2, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'D', 1, 36, 2, 3, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'D', 1, 36, 2, 4, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'D', 1, 54, 3, 1, '', '', '', '2014-05-27'),
('SKYLINE', 'D', 1, 54, 3, 2, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'D', 1, 54, 3, 4, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'E', 1, 46, 1, 1, '', '', '', '2014-05-27'),
('SKYLINE', 'E', 1, 46, 1, 2, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'E', 1, 46, 1, 3, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'E', 1, 46, 1, 4, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'E', 1, 36, 2, 1, '', '', '', '2014-05-27'),
('SKYLINE', 'E', 1, 36, 2, 2, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'E', 1, 36, 2, 3, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'E', 1, 36, 2, 4, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'E', 1, 54, 3, 1, '', '', '', '2014-05-27'),
('SKYLINE', 'E', 1, 54, 3, 2, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'E', 1, 54, 3, 4, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'G', 1, 46, 1, 1, '', '', '', '2014-05-27'),
('SKYLINE', 'G', 1, 46, 1, 2, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'G', 1, 46, 1, 3, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'G', 1, 46, 1, 4, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'G', 1, 36, 2, 1, '', '', '', '2014-05-27'),
('SKYLINE', 'G', 1, 36, 2, 2, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'G', 1, 36, 2, 3, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'G', 1, 36, 2, 4, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'G', 1, 54, 3, 1, '', '', '', '2014-05-27'),
('SKYLINE', 'G', 1, 54, 3, 2, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'G', 1, 54, 3, 4, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'I', 1, 46, 1, 1, '', '', '', '2014-05-27'),
('SKYLINE', 'I', 1, 46, 1, 2, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'I', 1, 46, 1, 3, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'I', 1, 46, 1, 4, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'I', 1, 36, 2, 1, '', '', '', '2014-05-27'),
('SKYLINE', 'I', 1, 36, 2, 2, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'I', 1, 36, 2, 3, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'I', 1, 36, 2, 4, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'I', 1, 54, 3, 1, '', '', '', '2014-05-27'),
('SKYLINE', 'I', 1, 54, 3, 2, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'I', 1, 54, 3, 4, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'M', 1, 46, 1, 1, '', '', '', '2014-05-27'),
('SKYLINE', 'M', 1, 46, 1, 2, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'M', 1, 46, 1, 3, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'M', 1, 46, 1, 4, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'M', 1, 36, 2, 1, '', '', '', '2014-05-27'),
('SKYLINE', 'M', 1, 36, 2, 2, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'M', 1, 36, 2, 3, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'M', 1, 36, 2, 4, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'M', 1, 54, 3, 1, '', '', '', '2014-05-27'),
('SKYLINE', 'M', 1, 54, 3, 2, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'M', 1, 54, 3, 4, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'N', 1, 46, 1, 1, '', '', '', '2014-05-27'),
('SKYLINE', 'N', 1, 46, 1, 2, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'N', 1, 46, 1, 3, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'N', 1, 46, 1, 4, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'N', 1, 36, 2, 1, '', '', '', '2014-05-27'),
('SKYLINE', 'N', 1, 36, 2, 2, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'N', 1, 36, 2, 3, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'N', 1, 36, 2, 4, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'N', 1, 54, 3, 1, '', '', '', '2014-05-27'),
('SKYLINE', 'N', 1, 54, 3, 2, 'SI', 'STD', 'sinistra', '2014-06-09'),
('SKYLINE', 'N', 1, 54, 3, 4, 'SI', 'STD', 'sinistra', '2014-06-09'),
('TIFANY', 'C', 1, 53, 1, 1, 'STD', 'STD', 'sinistra', '2014-05-27'),
('TIFANY', 'C', 1, 53, 1, 3, 'STD', 'STD', 'sinistra', '2014-06-09'),
('TIFANY', 'C', 2, 90, 1, 1, 'STD', 'STD', 'sinistra', '2014-05-30'),
('TIFANY', 'C', 2, 90, 1, 3, 'STD', 'STD', 'sinistra', '2014-06-09'),
('TIFANY', 'E', 1, 53, 1, 1, 'STD', 'STD', 'sinistra', '2014-05-27'),
('TIFANY', 'E', 1, 53, 1, 3, 'STD', 'STD', 'sinistra', '2014-06-09'),
('TIFANY', 'E', 2, 90, 1, 1, 'STD', 'STD', 'sinistra', '2014-05-30'),
('TIFANY', 'E', 2, 90, 1, 3, 'STD', 'STD', 'sinistra', '2014-06-09'),
('TIFANY', 'G', 1, 53, 1, 1, 'STD', 'STD', 'sinistra', '2014-05-27'),
('TIFANY', 'G', 1, 53, 1, 3, 'STD', 'STD', 'sinistra', '2014-06-09'),
('TIFANY', 'G', 2, 90, 1, 1, 'STD', 'STD', 'sinistra', '2014-05-30'),
('TIFANY', 'G', 2, 90, 1, 3, 'STD', 'STD', 'sinistra', '2014-06-09'),
('TIFANY', 'I', 1, 53, 1, 1, 'STD', 'STD', 'sinistra', '2014-05-27'),
('TIFANY', 'I', 1, 53, 1, 3, 'STD', 'STD', 'sinistra', '2014-06-09'),
('TIFANY', 'I', 2, 90, 1, 1, 'STD', 'STD', 'sinistra', '2014-05-30'),
('TIFANY', 'I', 2, 90, 1, 3, 'STD', 'STD', 'sinistra', '2014-06-09'),
('TIFANY', 'M', 1, 53, 1, 1, 'STD', 'STD', 'sinistra', '2014-05-27'),
('TIFANY', 'M', 1, 53, 1, 3, 'STD', 'STD', 'sinistra', '2014-06-09'),
('TIFANY', 'M', 2, 90, 1, 1, 'STD', 'STD', 'sinistra', '2014-05-30'),
('TIFANY', 'M', 2, 90, 1, 3, 'STD', 'STD', 'sinistra', '2014-06-09'),
('TIFANY', 'N', 1, 53, 1, 1, 'STD', 'STD', 'sinistra', '2014-05-27'),
('TIFANY', 'N', 1, 53, 1, 3, 'STD', 'STD', 'sinistra', '2014-06-09'),
('TIFANY', 'N', 2, 90, 1, 1, 'STD', 'STD', 'sinistra', '2014-05-30'),
('TIFANY', 'N', 2, 90, 1, 3, 'STD', 'STD', 'sinistra', '2014-06-09');

-- --------------------------------------------------------

--
-- Struttura della tabella `regole_cavo_bipolare`
--

CREATE TABLE IF NOT EXISTS `regole_cavo_bipolare` (
  `codice_articolo` varchar(11) NOT NULL,
  `descrizione_articolo` varchar(500) NOT NULL,
  `da` int(11) NOT NULL,
  `a` int(11) NOT NULL,
  `UM` varchar(3) NOT NULL,
  `qta` int(11) NOT NULL,
  `costo` double NOT NULL,
  `classe` varchar(30) NOT NULL COMMENT 'indica se devo utilizzare nel momento in cui è maggiore dello std o meno',
  `note` varchar(255) NOT NULL COMMENT 'note sul significato',
  `inizio_validitia` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `regole_cavo_bipolare`
--

INSERT INTO `regole_cavo_bipolare` (`codice_articolo`, `descrizione_articolo`, `da`, `a`, `UM`, `qta`, `costo`, `classe`, `note`, `inizio_validitia`) VALUES
('31900220000', 'CAVO BIPOLARE 2XAWG24 AWM2468 TRASP.', 3001, 9999, 'PZ', 1, 0.5, 'MAGGIORE_STD', 'se è maggiore dello std ad ogni 1mt devo sommare il costo.Il costo comprende già la manodopera', '2014-07-29'),
('31900220000', 'CAVO BIPOLARE 2XAWG24 AWM2468 TRASP.', 1, 3000, 'PZ', 1, 0.36, 'MINORE_STD', 'se è minore dello std allora applico interamente questo costo. Il costo comprende già la manodopera', '2014-07-29');

-- --------------------------------------------------------

--
-- Struttura della tabella `regole_clips_reel_plate`
--

CREATE TABLE IF NOT EXISTS `regole_clips_reel_plate` (
  `nome_prodotto` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `costo` double NOT NULL,
  `ordine` int(11) NOT NULL,
  `codice_articolo_fissaggio` varchar(13) NOT NULL,
  `descrizione_articolo` varchar(30) NOT NULL,
  `UM` varchar(3) NOT NULL,
  `da` int(11) NOT NULL,
  `a` int(11) NOT NULL,
  `qta` int(11) NOT NULL,
  `inizio_validita` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `regole_clips_reel_plate`
--

INSERT INTO `regole_clips_reel_plate` (`nome_prodotto`, `costo`, `ordine`, `codice_articolo_fissaggio`, `descrizione_articolo`, `UM`, `da`, `a`, `qta`, `inizio_validita`) VALUES
('BALI', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 0, 600, 3, '2015-02-03'),
('BALI', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 601, 900, 4, '2015-02-03'),
('BALI', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 901, 1200, 5, '2015-02-03'),
('BALI', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 1201, 1500, 6, '2015-02-03'),
('BALI', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 1501, 1800, 7, '2015-02-03'),
('BALI', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 1801, 2100, 8, '2015-02-03'),
('BALI', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 2101, 2400, 9, '2015-02-03'),
('BALI', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 2401, 2700, 10, '2015-02-03'),
('BALI', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 2701, 3000, 11, '2015-02-03'),
('DERBY', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 0, 600, 3, '2015-02-16'),
('DERBY', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 601, 900, 4, '2015-02-16'),
('DERBY', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 901, 1200, 5, '2015-02-16'),
('DERBY', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 1201, 1500, 6, '2015-02-16'),
('DERBY', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 1501, 1800, 7, '2015-02-16'),
('DERBY', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 1801, 2100, 8, '2015-02-16'),
('DERBY', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 2101, 2400, 9, '2015-02-16'),
('DERBY', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 2401, 2700, 10, '2015-02-16'),
('DERBY', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 2701, 3000, 11, '2015-02-16'),
('LUGANO', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 0, 600, 3, '2015-02-03'),
('LUGANO', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 601, 900, 4, '2015-02-03'),
('LUGANO', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 901, 1200, 5, '2015-02-03'),
('LUGANO', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 1201, 1500, 6, '2015-02-03'),
('LUGANO', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 1501, 1800, 7, '2015-02-03'),
('LUGANO', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 1801, 2100, 8, '2015-02-03'),
('LUGANO', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 2101, 2400, 9, '2015-02-03'),
('LUGANO', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 2401, 2700, 10, '2015-02-03'),
('LUGANO', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 2701, 3000, 11, '2015-02-03'),
('MALINDI', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 0, 600, 3, '2015-02-03'),
('MALINDI', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 601, 900, 4, '2015-02-03'),
('MALINDI', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 901, 1200, 5, '2015-02-03'),
('MALINDI', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 1201, 1500, 6, '2015-02-03'),
('MALINDI', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 1501, 1800, 7, '2015-02-03'),
('MALINDI', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 1801, 2100, 8, '2015-02-03'),
('MALINDI', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 2101, 2400, 9, '2015-02-03'),
('MALINDI', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 2401, 2700, 10, '2015-02-03'),
('MALINDI', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 2701, 3000, 11, '2015-02-03'),
('MALINDI-in', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 0, 600, 3, '2015-02-03'),
('MALINDI-in', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 601, 900, 4, '2015-02-03'),
('MALINDI-in', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 901, 1200, 5, '2015-02-03'),
('MALINDI-in', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 1201, 1500, 6, '2015-02-03'),
('MALINDI-in', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 1501, 1800, 7, '2015-02-03'),
('MALINDI-in', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 1801, 2100, 8, '2015-02-03'),
('MALINDI-in', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 2101, 2400, 9, '2015-02-03'),
('MALINDI-in', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 2401, 2700, 10, '2015-02-03'),
('MALINDI-in', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 2701, 3000, 11, '2015-02-03'),
('MANILA', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 0, 600, 3, '2015-02-03'),
('MANILA', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 601, 900, 4, '2015-02-03'),
('MANILA', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 901, 1200, 5, '2015-02-03'),
('MANILA', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 1201, 1500, 6, '2015-02-03'),
('MANILA', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 1501, 1800, 7, '2015-02-03'),
('MANILA', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 1801, 2100, 8, '2015-02-03'),
('MANILA', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 2101, 2400, 9, '2015-02-03'),
('MANILA', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 2401, 2700, 10, '2015-02-03'),
('MANILA', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 2701, 3000, 11, '2015-02-03'),
('PERTH', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 0, 600, 3, '2015-02-10'),
('PERTH', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 601, 900, 4, '2015-02-10'),
('PERTH', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 901, 1200, 5, '2015-02-10'),
('PERTH', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 1201, 1500, 6, '2015-02-10'),
('PERTH', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 1501, 1800, 7, '2015-02-10'),
('PERTH', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 1801, 2100, 8, '2015-02-10'),
('PERTH', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 2101, 2400, 9, '2015-02-10'),
('PERTH', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 2401, 2700, 10, '2015-02-10'),
('PERTH', 0.02, 12, '40403940000', 'CLIP REEL PLATE I', 'PZ', 2701, 3000, 11, '2015-02-10');

-- --------------------------------------------------------

--
-- Struttura della tabella `regole_imballi`
--

CREATE TABLE IF NOT EXISTS `regole_imballi` (
  `da` int(11) NOT NULL COMMENT 'inizio range',
  `a` int(11) NOT NULL COMMENT 'fine range',
  `ordine` int(11) NOT NULL COMMENT 'ordine di comparsa in diba',
  `codice_articolo_imballo` varchar(11) COLLATE utf8_bin NOT NULL COMMENT 'codice articolo dell''imballo',
  `descrizione_imballo` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'Descrittivo breve dell''imballo ',
  `UM` varchar(3) COLLATE utf8_bin NOT NULL COMMENT 'unità di misura',
  `coefficente_utilizzo` int(11) NOT NULL COMMENT 'grado di utilizzo della scatola in base ai pezzi',
  `quantita` int(11) NOT NULL COMMENT 'quantità utilizzata in diba',
  `costo` double NOT NULL COMMENT 'costo singolo pezzo di imballo a lampada',
  `inizio_validita` date NOT NULL COMMENT 'data inizio validità di utilizzo del codice'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Regole per la selezione dell''imballo o più imballi';

--
-- Dump dei dati per la tabella `regole_imballi`
--

INSERT INTO `regole_imballi` (`da`, `a`, `ordine`, `codice_articolo_imballo`, `descrizione_imballo`, `UM`, `coefficente_utilizzo`, `quantita`, `costo`, `inizio_validita`) VALUES
(1, 389, 190, '50100010100', 'SCAT.IMB.SING.FREEDOM 8W (390*46*34)', 'PZ', 1, 1, 0.3, '2012-11-19'),
(1, 389, 200, '50100050600', 'SCAT.IMB.MULTIPLO FREEDOM 8W', 'PZ', 10, 1, 0.3, '2012-11-19'),
(390, 619, 190, '50100020100', 'SCAT.IMB.SING.FREEDOM 13W (620*46*34)', 'PZ', 1, 1, 0.3, '2012-11-19'),
(390, 619, 200, '50100060600', 'SCAT.IMB.MULTIPLO FREEDOM 13W', 'PZ', 10, 1, 0.3, '2012-11-19'),
(620, 949, 190, '50100030100', 'SCAT.IMB.SING.FREEDOM 21W (950X46X34)', 'PZ', 1, 1, 0.3, '2012-11-19'),
(620, 949, 200, '50100070600', 'SCAT.IMB.MULTIPLO FREEDOM 21W', 'PZ', 10, 1, 0.3, '2012-11-19'),
(950, 1249, 190, '50100040100', 'SCAT.IMB.SING.FREEDOM 28W (1250*46*34)', 'PZ', 1, 1, 0.3, '2012-11-19'),
(950, 1249, 200, '50100080600', 'SCAT.IMB.MULTIPLO FREEDOM 28W', 'PZ', 10, 1, 0.3, '2012-11-19'),
(1250, 1540, 190, '50100120100', 'SCAT.IMB.SING.FREEDOM 35W (1550*46*34)', 'PZ', 1, 1, 0.5, '2012-11-19'),
(1250, 1540, 200, '50100130600', 'SCAT.IMB.MULTIPLO FREEDOM 35W', 'PZ', 10, 1, 0.5, '2012-11-19'),
(1541, 1999, 200, '41400630000', 'TAPPO IN PLASTICA xTUBOLARE', 'PZ', 1, 2, 0, '2013-05-03'),
(1541, 1999, 190, '50101510600', 'TUBOLARE IN CARTONE D40mm L2mt', 'PZ', 1, 1, 0.5, '2012-11-19'),
(2000, 3000, 200, '41400630000', 'TAPPO IN PLASTICA xTUBOLARE', 'PZ', 1, 2, 0, '2013-05-03'),
(2000, 3000, 190, '50101520600', 'TUBOLARE IN CARTONE D40mm L3mt', 'PZ', 1, 1, 0.5, '2015-01-30');

-- --------------------------------------------------------

--
-- Struttura della tabella `regole_piastrina_cavi`
--

CREATE TABLE IF NOT EXISTS `regole_piastrina_cavi` (
  `nome_prodotto` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `costo` double NOT NULL,
  `ordine` int(11) NOT NULL,
  `codice_articolo_fissaggio` varchar(13) NOT NULL,
  `descrizione_articolo` varchar(30) NOT NULL,
  `UM` varchar(3) NOT NULL,
  `da` int(11) NOT NULL,
  `a` int(11) NOT NULL,
  `qta` int(11) NOT NULL,
  `inizio_validita` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `regole_piastrina_cavi`
--

INSERT INTO `regole_piastrina_cavi` (`nome_prodotto`, `costo`, `ordine`, `codice_articolo_fissaggio`, `descrizione_articolo`, `UM`, `da`, `a`, `qta`, `inizio_validita`) VALUES
('PERTH', 0.07, 44, '81900971000', 'PIASTRINA xCAVI PERTH', 'PZ', 0, 450, 2, '2015-02-10'),
('PERTH', 0.07, 44, '81900971000', 'PIASTRINA xCAVI PERTH', 'PZ', 401, 850, 3, '2015-02-10'),
('PERTH', 0.07, 44, '81900971000', 'PIASTRINA xCAVI PERTH', 'PZ', 851, 1250, 4, '2015-02-10'),
('PERTH', 0.07, 44, '81900971000', 'PIASTRINA xCAVI PERTH', 'PZ', 1251, 1650, 5, '2015-02-10'),
('PERTH', 0.07, 44, '81900971000', 'PIASTRINA xCAVI PERTH', 'PZ', 1651, 2050, 6, '2015-02-10'),
('PERTH', 0.07, 44, '81900971000', 'PIASTRINA xCAVI PERTH', 'PZ', 2051, 2450, 7, '2015-02-10'),
('PERTH', 0.07, 44, '81900971000', 'PIASTRINA xCAVI PERTH', 'PZ', 2451, 2850, 8, '2015-02-10'),
('PERTH', 0.07, 44, '81900971000', 'PIASTRINA xCAVI PERTH', 'PZ', 2851, 3000, 9, '2015-02-10');

-- --------------------------------------------------------

--
-- Struttura della tabella `regole_schermo`
--

CREATE TABLE IF NOT EXISTS `regole_schermo` (
  `nome_prodotto` varchar(50) COLLATE utf8_bin NOT NULL COMMENT 'nome del prodotto per il tipo di schermo selezionato',
  `codice_schermo` varchar(2) COLLATE utf8_bin NOT NULL COMMENT 'Tipo di schermo',
  `ordine` int(11) NOT NULL COMMENT 'posizione in diba',
  `codice_articolo_schermo` varchar(13) COLLATE utf8_bin NOT NULL COMMENT 'codice articolo del tipo di schermo',
  `descrizione_schermo` varchar(50) COLLATE utf8_bin NOT NULL COMMENT 'descrizione del tipo di schermo',
  `UM` varchar(3) COLLATE utf8_bin NOT NULL COMMENT 'unità di misura',
  `QTA` int(11) NOT NULL COMMENT 'qta utile',
  `costo` double NOT NULL COMMENT 'costo relativo ai 3mt di verga di plastica',
  `standard` tinyint(4) NOT NULL COMMENT 'definisco se lo schermo è standard o meno',
  `inizio_validita` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Associazione codice articolo schermo al prodotto';

--
-- Dump dei dati per la tabella `regole_schermo`
--

INSERT INTO `regole_schermo` (`nome_prodotto`, `codice_schermo`, `ordine`, `codice_articolo_schermo`, `descrizione_schermo`, `UM`, `QTA`, `costo`, `standard`, `inizio_validita`) VALUES
('BALI', 'NA', 20, '0000000000', 'NESSUN SCHERMO', 'PZ', 1, 0, 0, '2014-07-28'),
('BALI', 'OP', 20, '40301990100', 'SCHERMO PRODOTTI XL L=3mt VERGA OPALE768', 'PZ', 1, 1.56, 0, '2014-07-28'),
('BALI', 'TR', 20, '40301990100', 'SCHERMO PRODOTTI XL L=3mt TRASPARENTE656', 'PZV', 1, 1.56, 0, '2013-04-22'),
('BRASILIA', 'NA', 20, '00000000000', 'NESSUN SCHERMO', 'PZ', 1, 0, 0, '2014-07-28'),
('BRASILIA', 'TR', 20, '40302000000', 'SCHERMO PRODOTTI XL L=3mt TRASPARENTE656', 'PZ', 1, 1.95, 0, '2014-07-28'),
('DERBY', 'NA', 20, '00000000000', 'NESSUN SCHERMO', 'PZ', 1, 0, 0, '2014-07-28'),
('DERBY', 'OP', 20, '40301990100', 'SCHERMO PRODOTTI XL L=3mt OPALE768', 'PZ', 1, 1.56, 0, '2014-07-28'),
('DERBY', 'TR', 20, '40301990000', 'SCHERMO PRODOTTI XL L=3mt TRASPARENTE656', 'PZ', 1, 1.56, 0, '2014-07-28'),
('GENEVE', 'NA', 20, '0000000000', 'NESSUN SCHERMO', 'PZ', 1, 0, 0, '2015-02-10'),
('GENEVE', 'OP', 20, '40301990100', 'SCHERMO PRODOTTI XL L=3mt VERGA OPALE768', 'PZ', 1, 1.41, 0, '2014-07-28'),
('GENEVE', 'TR', 20, '40301990000', 'SCHERMO PRODOTTI XL L=3mt TRASPARENTE656', 'PZV', 1, 1.41, 0, '2014-07-24'),
('LEDO', 'NA', 20, '0000000000', 'NESSUN SCHERMO', 'PZ', 1, 0, 0, '2014-07-28'),
('LEDO', 'OP', 20, '40301990100', 'SCHERMO PRODOTTI XL L=3mt VERGA OPALE768', 'PZ', 1, 1.56, 0, '2014-07-28'),
('LEDO', 'TR', 20, '40301990000', 'SCHERMO PRODOTTI XL L=3mt TRASPARENTE656', 'PZV', 1, 1.56, 0, '2014-07-24'),
('LUGANO', 'NA', 20, '0000000000', 'NESSUN SCHERMO', 'PZ', 1, 0, 0, '2014-07-28'),
('LUGANO', 'OP', 20, '40301990100', 'SCHERMO PRODOTTI XL L=3mt VERGA OPALE768', 'PZ', 1, 1.56, 0, '2014-07-28'),
('LUGANO', 'TR', 20, '40301990000', 'SCHERMO PRODOTTI XL L=3mt TRASPARENTE656', 'PZV', 1, 1.56, 0, '2014-07-24'),
('MALINDI', 'NA', 20, '0000000000', 'NESSUN SCHERMO', 'PZ', 1, 0, 0, '2014-07-28'),
('MALINDI', 'OP', 20, '40301920100', 'SCHERMO MALINDI OPALE SPORGENTE 3mt', 'PZV', 1, 2.1, 0, '2013-04-22'),
('MALINDI', 'OP', 20, '40301920100', 'SCHERMO MALINDI OPALE MATTATO 3mt (satinato in ma)', 'PZ', 1, 2.1, 0, '2014-07-28'),
('MALINDI', 'TR', 20, '40301920000', 'SCHERMO MALINDI TRASP. SPORGENTE 3mt', 'PZV', 1, 2.1, 0, '2013-04-22'),
('MALINDI', 'TR', 20, '40301990000', 'SCHERMO PRODOTTI XL L=3mt TRASPARENTE656', 'PZ', 1, 2.1, 0, '2014-07-28'),
('MALINDI-in', 'OP', 20, '40301930100', 'SCHERMO MALINDI-in OPALE MATTATO 3mt', 'PZ', 1, 1.56, 0, '2014-07-28'),
('MALINDI-in', 'TR', 20, '40301990000', 'SCHERMO PRODOTTI XL L=3mt TRASPARENTE656', 'PZ', 1, 1.56, 0, '2014-07-28'),
('MANILA', 'NA', 20, '0000000000', 'NESSUN SCHERMO', 'PZ', 0, 1.56, 0, '2015-02-09'),
('MANILA', 'OP', 20, '40301990100', 'SSCHERMO PRODOTTI XL L=3mt VERGA OPALE768', 'PZV', 1, 1.56, 0, '2013-04-22'),
('MANILA', 'TR', 20, '40301990000', 'SCHERMO PRODOTTI XL L=3mt TRASPARENTE656', 'PZV', 1, 1.56, 0, '2014-07-24'),
('MISKA', 'NA', 20, '0000000000', 'NESSUN SCHERMO', 'PZ', 1, 0, 0, '2014-07-28'),
('MISKA', 'OP', 20, '40302010100', 'SCHERMO MISKA L=3mt VERGA OPALE 02397 al 2%', 'PZ', 1, 1.56, 0, '2014-07-28'),
('PERTH', 'NA', 20, '0000000000', 'NESSUN SCHERMO', 'PZ', 1, 0, 0, '2014-07-28'),
('PERTH', 'OP', 20, '40301990100', 'SCHERMO PRODOTTI XL L=3mt VERGA OPALE768', 'PZ', 1, 1.41, 0, '2014-07-28'),
('PERTH', 'TR', 20, '40301990000', 'SCHERMO PRODOTTI XL L=3mt TRASPARENTE656', 'PZV', 1, 1.41, 0, '2014-07-24'),
('SKYLINE', 'NA', 20, '00000000000', 'NESSUN SCHERMO', 'PZ', 1, 0, 0, '2014-07-28'),
('SKYLINE', 'OP', 20, '40301990100', 'SCHERMO PRODOTTI XL L=3mt OPALE768', 'PZ', 1, 1.56, 0, '2014-07-28'),
('SKYLINE', 'TR', 20, '40301990000', 'SCHERMO PRODOTTI XL L=3mt TRASPARENTE656', 'PZ', 1, 1.56, 0, '2014-07-28'),
('TIFANY', 'NA', 20, '0000000000', 'NESSUN SCHERMO', 'PZ', 1, 0, 0, '2014-07-28'),
('TIFANY', 'OP', 20, '40302020100', 'SCHERMO TIFANY L=3mt OPALE', 'PZ', 1, 1.56, 0, '2014-07-28');

-- --------------------------------------------------------

--
-- Struttura della tabella `regole_sistema_fissaggio`
--

CREATE TABLE IF NOT EXISTS `regole_sistema_fissaggio` (
  `nome_prodotto` varchar(50) COLLATE utf8_bin NOT NULL COMMENT 'Nome prodotto con sistema di fissaggio',
  `costo` double NOT NULL COMMENT 'costo singolo pezzo',
  `tipo_fissaggio` int(11) NOT NULL COMMENT 'tipo di fissaggio',
  `ordine` int(11) NOT NULL COMMENT 'ordine visualizzazione in diba',
  `codice_articolo_fissaggio` varchar(13) COLLATE utf8_bin NOT NULL COMMENT 'codice articolo fissaggio',
  `descrizione_articolo_fissaggio` varchar(50) COLLATE utf8_bin NOT NULL COMMENT 'descrizione fissaggio',
  `descrizione_breve` varchar(2) COLLATE utf8_bin NOT NULL,
  `UM` varchar(3) COLLATE utf8_bin NOT NULL COMMENT 'unità di misura',
  `da` int(11) NOT NULL COMMENT 'inizio misure per il fissaggio',
  `a` int(11) NOT NULL COMMENT 'limite misuara per il fissaggio',
  `qta` varchar(4) COLLATE utf8_bin DEFAULT NULL COMMENT 'quantità di utilizzo per singolo prodotto',
  `inizio_validita` date NOT NULL COMMENT 'data inizio utilizzo di quel codice per quel sistema di fissaggio'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Regole per determinare il codice articolo di fissaggio per il prodotto';

--
-- Dump dei dati per la tabella `regole_sistema_fissaggio`
--

INSERT INTO `regole_sistema_fissaggio` (`nome_prodotto`, `costo`, `tipo_fissaggio`, `ordine`, `codice_articolo_fissaggio`, `descrizione_articolo_fissaggio`, `descrizione_breve`, `UM`, `da`, `a`, `qta`, `inizio_validita`) VALUES
('BALI', 0.25, 1, 73, '81000850000', 'CONF.FIX BALI 4 CLIPS TONDE', '', 'PZ', 0, 1200, '1', '2015-02-03'),
('BALI', 0.25, 1, 73, '81000850000', 'CONF.FIX BALI 4 CLIPS TONDE', '', 'PZ', 1201, 2000, '2', '2015-02-03'),
('BALI', 0.25, 1, 73, '81000850000', 'CONF.FIX BALI 4 CLIPS TONDE', '', 'PZ', 2001, 3000, '3', '2015-02-03'),
('BALI', 0.55, 3, 73, '41400660900', 'MAGNETE SC35MA NI 20x11,6x4mm', '', 'PZ', 0, 1000, '2', '2015-02-03'),
('BALI', 0.55, 3, 73, '41400660900', 'MAGNETE SC35MA NI 20x11,6x4mm', '', 'PZ', 1001, 2000, '3', '2015-02-03'),
('BALI', 0.55, 3, 73, '41400660900', 'MAGNETE SC35MA NI 20x11,6x4mm', '', 'PZ', 2001, 3000, '4', '2015-02-03'),
('BRASILIA', 0.07, 1, 73, '40403251000', 'TESTATA BRASILIA SX LEGNO/MAGNETE', '', 'PZ', 0, 3000, '1', '2015-02-10'),
('BRASILIA', 0.07, 1, 74, '40403261000', 'TESTATA BRASILIA DX LEGNO/MAGNETE', '', 'PZ', 0, 3000, '1', '2015-02-10'),
('BRASILIA', 0.07, 2, 73, '40403231000', 'TESTATA BRASILIA SX VETRO', '', 'PZ', 0, 3000, '1', '2015-02-10'),
('BRASILIA', 0.07, 2, 74, '40403241000', 'TESTATA BRASILIA DX VETRO', '', 'PZ', 0, 3000, '1', '2015-02-10'),
('BRASILIA', 0.2, 2, 75, '55300060000', 'BIADESIVO DUPLOCOLL CPT 500 F  65MTx5MM', '', 'MT', 0, 3000, '1', '2015-02-10'),
('BRASILIA', 0.07, 3, 73, '40403251000', 'TESTATA BRASILIA SX LEGNO/MAGNETE', '', 'PZ', 0, 3000, '1', '2015-02-10'),
('BRASILIA', 0.07, 3, 74, '40403261000', 'TESTATA BRASILIA DX LEGNO/MAGNETE', '', 'PZ', 0, 3000, '1', '2015-02-10'),
('BRASILIA', 0.07, 3, 75, '40403291000', 'TAPPO CHIUSURA TESTATA BRASILIA MAGN/LE', '', 'PZ', 0, 3000, '2', '2015-02-10'),
('BRASILIA', 0.07, 3, 77, '40600561100', 'VITE TSP 2,5x10mm IMP.A CROCE', '', 'PZ', 1001, 2000, '3', '2015-02-10'),
('BRASILIA', 0.07, 3, 76, '41400690900', 'MAGNETE SC35MA xC-PROFILE WALL', '', 'PZ', 0, 1000, '2', '2015-02-10'),
('BRASILIA', 0.07, 3, 76, '41400690900', 'MAGNETE SC35MA xC-PROFILE WALL', '', 'PZ', 1001, 2000, '3', '2015-02-10'),
('BRASILIA', 0.07, 3, 76, '41400690900', 'MAGNETE SC35MA xC-PROFILE WALL', '', 'PZ', 2001, 3000, '4', '2015-02-10'),
('DERBY', 0.37, 1, 73, '81000740000', 'CONFEZIONE 3CLIPS DERBY/PERTH', '', 'PZ', 0, 1000, '1', '2015-02-16'),
('DERBY', 0.37, 1, 73, '81000740000', 'CONFEZIONE 3CLIPS DERBY/PERTH', '', 'PZ', 1001, 2000, '2', '2015-02-16'),
('DERBY', 0.37, 1, 73, '81000740000', 'CONFEZIONE 3CLIPS DERBY/PERTH', '', 'PZ', 2001, 3000, '3', '2015-02-16'),
('GENEVE', 0.17, 1, 73, '81000840000', 'CONFEZIONE 4CLIPS GENEVE - LUGANO', '', 'PZ', 0, 1200, '1', '2015-02-10'),
('GENEVE', 0.17, 1, 73, '81000840000', 'CONFEZIONE 4CLIPS GENEVE - LUGANO', '', 'PZ', 1201, 2000, '2', '2015-02-10'),
('GENEVE', 0.17, 1, 73, '81000840000', 'CONFEZIONE 4CLIPS GENEVE - LUGANO', '', 'PZ', 2001, 3000, '3', '2015-02-10'),
('LEDO', 0.14, 1, 73, '40402570000', 'CLIPS FISSAGGIO SU LEGNO LEDO', '', 'PZ', 0, 1000, '2', '2014-07-24'),
('LEDO', 0.14, 1, 73, '40402570000', 'CLIPS FISS. SU LEGNO LEDO', '', 'PZ', 1001, 2000, '3', '2014-07-25'),
('LEDO', 0.14, 1, 73, '40402570000', 'CLIPS FISS. SU LEGNO LEDO', '', 'PZ', 2001, 3000, '4', '2014-07-25'),
('LEDO', 0.005, 1, 74, 'F01010400458', 'VITE AUTOFILE 2.9X16mm TC', '', 'PZ', 0, 1000, '2', '2014-07-24'),
('LEDO', 0.005, 1, 74, 'F1010400458', 'VITE AUTOFIL  2.9X16cm', '', 'PZ', 1001, 2000, '3', '2014-07-25'),
('LEDO', 0.005, 1, 74, 'F1010400458', 'VITE AUTOFIL  2.9X16cm', '', 'PZ', 2001, 3000, '4', '2014-07-25'),
('LEDO', 0.28, 2, 73, '40402580000', 'CLIPS FISS su vetro ledo', '', 'PZ', 0, 1000, '2', '2014-07-24'),
('LEDO', 0.28, 2, 73, '40402580000', 'CLIPS FISS su vetro ledo', '', 'PZ', 1001, 2000, '3', '2014-07-25'),
('LEDO', 0.28, 2, 73, '40402580000', 'CLIPS FISS su vetro ledo', '', 'PZ', 2001, 3000, '4', '2014-07-25'),
('LEDO', 0.4, 2, 74, '55300050000', 'BIADESIVO DUPLOCOLL CPT 500 F ', '', 'MT', 0, 1000, '0.04', '2014-07-24'),
('LEDO', 0.4, 2, 74, '55300050000', 'BIADESIVO DUPLOCOLL CPT 500 F', '', 'MT', 1001, 2000, '0.06', '2014-07-25'),
('LEDO', 0.4, 2, 74, '55300050000', 'BIADESIVO DUPLOCOLL CPT 500 F', '', 'MT', 2001, 3000, '0.08', '2014-07-25'),
('LEDO', 0.55, 3, 73, '40100660900', 'MAGNETE SC35MA NI 20x11,6x4mm ', '', 'PZ', 0, 1000, '2', '2014-07-25'),
('LEDO', 0.55, 3, 73, '40100660900', 'MAGNETE SC35MA NI 20x11,6x4mm ', '', 'PZ', 1001, 2000, '3', '2014-07-25'),
('LEDO', 0.55, 3, 73, '40400660900', 'MAGNETE SC35MA NI 20x11,6x4mm ', '', 'PZ', 2001, 3000, '4', '2014-07-25'),
('LEDO', 0.14, 3, 74, '40402590000', 'CLIPS FISSAGGIO SU METALLO LED', '', 'PZ', 0, 1000, '2', '2014-07-24'),
('LEDO', 0.14, 3, 74, '40402590000', 'CLIPS FISSAGGIO SU METALLO LED', '', 'PZ', 1001, 2000, '3', '2014-07-24'),
('LEDO', 0.14, 3, 74, '40402590000', 'CLIPS FISSAGGIO SU METALLO LED', '', 'PZ', 2001, 3000, '4', '2014-07-24'),
('LUGANO', 0.17, 1, 73, '81000840000', 'CONFEZIONE 4CLIPS GENEVE - LUGANO', '', 'PZ', 0, 1200, '1', '2015-02-03'),
('LUGANO', 0.17, 1, 73, '81000840000', 'CONFEZIONE 4CLIPS GENEVE - LUGANO', '', 'PZ', 1201, 2000, '2', '2015-02-03'),
('LUGANO', 0.17, 1, 73, '81000840000', 'CONFEZIONE 4CLIPS GENEVE - LUGANO', '', 'PZ', 2001, 3000, '3', '2015-02-03'),
('MALINDI', 0.05, 1, 73, '40900120000', 'MOLLA MANILA-E 14,5+0,5mm', '', 'PZ', 0, 700, '2', '2015-02-06'),
('MALINDI', 0.05, 1, 73, '40900120000', 'MOLLA MANILA-E 14,5+0,5mm', '', 'PZ', 701, 1000, '3', '2015-02-06'),
('MALINDI', 0.05, 1, 73, '40900120000', 'MOLLA MANILA-E 14,5+0,5mm', '', 'PZ', 1001, 1500, '4', '2015-02-06'),
('MALINDI', 0.05, 1, 73, '40900120000', 'MOLLA MANILA-E 14,5+0,5mm', '', 'PZ', 1501, 2000, '5', '2015-02-06'),
('MALINDI', 0.05, 1, 73, '40900120000', 'MOLLA MANILA-E 14,5+0,5mm', '', 'PZ', 2001, 2500, '6', '2015-02-06'),
('MALINDI', 0.05, 1, 73, '40900120000', 'MOLLA MANILA-E 14,5+0,5mm', '', 'PZ', 2501, 3000, '7', '2015-02-06'),
('MALINDI-in', 0.05, 1, 73, '40900120000', 'MOLLA MANILA-E 14,5+0,5mm', '', 'PZ', 0, 700, '2', '2015-02-06'),
('MALINDI-in', 0.05, 1, 73, '40900120000', 'MOLLA MANILA-E 14,5+0,5mm', '', 'PZ', 701, 1000, '3', '2015-02-06'),
('MALINDI-in', 0.05, 1, 73, '40900120000', 'MOLLA MANILA-E 14,5+0,5mm', '', 'PZ', 1001, 1500, '4', '2015-02-06'),
('MALINDI-in', 0.05, 1, 73, '40900120000', 'MOLLA MANILA-E 14,5+0,5mm', '', 'PZ', 1501, 2000, '5', '2015-02-06'),
('MALINDI-in', 0.05, 1, 73, '40900120000', 'MOLLA MANILA-E 14,5+0,5mm', '', 'PZ', 2001, 2500, '6', '2015-02-06'),
('MALINDI-in', 0.05, 1, 73, '40900120000', 'MOLLA MANILA-E 14,5+0,5mm', '', 'PZ', 2501, 3000, '7', '2015-02-06'),
('MANILA', 0.05, 1, 73, '40900120000', 'MOLLA MANILA-E 14,5+0,5mm', '', 'PZ', 0, 700, '2', '2015-02-06'),
('MANILA', 0.05, 1, 73, '40900120000', 'MOLLA MANILA-E 14,5+0,5mm', '', 'PZ', 701, 1000, '3', '2015-02-06'),
('MANILA', 0.05, 1, 73, '40900120000', 'MOLLA MANILA-E 14,5+0,5mm', '', 'PZ', 1001, 1500, '4', '2015-02-06'),
('MANILA', 0.05, 1, 73, '40900120000', 'MOLLA MANILA-E 14,5+0,5mm', '', 'PZ', 1501, 2000, '5', '2015-02-06'),
('MANILA', 0.05, 1, 73, '40900120000', 'MOLLA MANILA-E 14,5+0,5mm', '', 'PZ', 2001, 2500, '6', '2015-02-06'),
('MANILA', 0.05, 1, 73, '40900120000', 'MOLLA MANILA-E 14,5+0,5mm', '', 'PZ', 2501, 3000, '7', '2015-02-06'),
('PERTH', 0.37, 1, 73, '81000740000', 'CONFEZIONE 3CLIPS DERBY/PERTH', '', 'PZ', 0, 1000, '1', '2015-02-10'),
('PERTH', 0.37, 1, 73, '81000740000', 'CONFEZIONE 3CLIPS DERBY/PERTH', '', 'PZ', 1001, 2000, '2', '2015-02-10'),
('PERTH', 0.37, 1, 73, '81000740000', 'CONFEZIONE 3CLIPS DERBY/PERTH', '', 'PZ', 2001, 3000, '3', '2015-02-10'),
('SKYLINE', 0.08, 1, 44, '40403091000', 'TESTATA SKYLINE DX INTERNA LEGNO-MAGNETE', '', 'PZ', 0, 3000, '1', '2015-02-16'),
('SKYLINE', 0.08, 1, 45, '40403101000', 'TESTATA SKYLINE DX ESTERNA LEGNO-MAGNETE', '', 'PZ', 0, 3000, '1', '2015-02-16'),
('SKYLINE', 0.08, 1, 42, '40403131000', 'TESTATA SKYLINE SX INTERNA LEGNO-MAGNETE', '', 'PZ', 0, 3000, '1', '2015-02-16'),
('SKYLINE', 0.08, 1, 43, '40403141000', 'TESTATA SKYLINE SX ESTERNA LEGNO-MAGNETE', '', 'PZ', 0, 3000, '1', '2015-02-16'),
('SKYLINE', 0.01, 1, 71, '40600361100', 'VITE AUTOFIL.TSP CROCE 2,2x16', '', 'PZ', 0, 3000, '1', '2015-02-16'),
('SKYLINE', 0.01, 1, 70, '40600631100', 'VITE AUTOFIL.TSP CROCE 2,2x4,8', '', 'PZ', 0, 3000, '1', '2015-02-16'),
('SKYLINE', 0.08, 2, 44, '40403111000', 'TESTATA SKYLINE DX INTERNA VETRO', '', 'PZ', 0, 3000, '1', '2015-02-16'),
('SKYLINE', 0.08, 2, 45, '40403121000', 'TESTATA SKYLINE DX ESTERNA VETRO', '', 'PZ', 0, 3000, '1', '2015-02-16'),
('SKYLINE', 0.08, 2, 42, '4040315100', 'TESTATA SKYLINE SX INTERNA VETRO', '', 'PZ', 0, 3000, '1', '2015-02-16'),
('SKYLINE', 0.08, 2, 43, '40403161000', 'TESTATA SKYLINE SX ESTERNA VETRO', '', 'PZ', 0, 3000, '1', '2015-02-16'),
('SKYLINE', 0.01, 2, 70, '40600361100', 'VITE AUTOFIL.TSP CROCE 2,2x16', '', 'PZ', 0, 3000, '1', '2015-02-16'),
('SKYLINE', 0.2, 2, 71, '55300060000', 'BIADESIVO DUPLOCOLL CPT 500 F  65MTx5MM', '', 'MT', 0, 3000, '1', '2015-02-16'),
('SKYLINE', 0.45, 2, 72, '55300070000', 'BIADESIVO DUPLOCOLL CPT 500 E 5x430mm', '', 'PZV', 0, 3000, '1', '2015-02-16'),
('SKYLINE', 0.08, 3, 44, '40403091000', 'TESTATA SKYLINE DX INTERNA LEGNO-MAGNETE', '', 'PZ', 0, 3000, '1', '2015-02-16'),
('SKYLINE', 0.08, 3, 45, '40403101000', 'TESTATA SKYLINE DX ESTERNA LEGNO-MAGNETE', '', 'PZ', 0, 3000, '1', '2015-02-16'),
('SKYLINE', 0.08, 3, 42, '40403131000', 'TESTATA SKYLINE SX INTERNA LEGNO-MAGNETE', '', 'PZ', 0, 3000, '1', '2015-02-16'),
('SKYLINE', 0.08, 3, 43, '40403141000', 'TESTATA SKYLINE SX ESTERNA LEGNO-MAGNETE', '', 'PZ', 0, 3000, '1', '2015-02-16'),
('SKYLINE', 0.01, 3, 71, '40600631100', 'VITE AUTOFIL.TSP CROCE 2,2x4,8', '', 'PZ', 0, 3000, '1', '2015-02-16'),
('SKYLINE', 0.3, 3, 73, '41400690900', 'MAGNETE SC35MA xC-PROFILE WALL', '', 'PZ', 0, 1000, '2', '2015-02-16'),
('SKYLINE', 0.3, 3, 73, '41400690900', 'MAGNETE SC35MA xC-PROFILE WALL', '', 'PZ', 1001, 2000, '3', '2015-02-16'),
('SKYLINE', 0.3, 3, 73, '41400690900', 'MAGNETE SC35MA xC-PROFILE WALL', '', 'PZ', 2001, 3000, '4', '2015-02-16'),
('SKYLINE', 0.008, 3, 72, '55300050000', 'BIADESIVO DUPLOCOLL CPT 500 F  65MTx10MM', '', 'PZ', 0, 1000, '2', '2015-02-16'),
('SKYLINE', 0.008, 3, 72, '55300050000', 'BIADESIVO DUPLOCOLL CPT 500 F 65MTx10MM', '', 'PZ', 1001, 2000, '3', '2015-02-16'),
('SKYLINE', 0.008, 3, 72, '55300050000', 'BIADESIVO DUPLOCOLL CPT 500 F 65MTx10MM', '', 'PZ', 2001, 3000, '4', '2015-02-16'),
('SKYLINE', 0.01, 3, 70, 'F01010500438', 'VITE AUTOFIL. 2,9x9,5mm TSP', '', 'PZ', 0, 3000, '1', '2015-02-16');

-- --------------------------------------------------------

--
-- Struttura della tabella `rincaro_prodotto`
--

CREATE TABLE IF NOT EXISTS `rincaro_prodotto` (
  `nome_prodotto` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Nome del prodotto',
  `id_accensione` int(11) NOT NULL COMMENT 'sistema di accensione',
  `rincaro` double NOT NULL COMMENT 'prezzo di rincaro in euro',
  `date_update` date NOT NULL COMMENT 'data aggiornamento'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='In base al prodotto ed al sistema di accensione, determino il rincaro';

--
-- Dump dei dati per la tabella `rincaro_prodotto`
--

INSERT INTO `rincaro_prodotto` (`nome_prodotto`, `id_accensione`, `rincaro`, `date_update`) VALUES
('BALI', 1, 6, '2015-02-05'),
('BALI', 2, 5.2, '2015-02-05'),
('LEDO', 1, 6, '2015-01-30'),
('LEDO', 2, 5.2, '2015-01-30');

-- --------------------------------------------------------

--
-- Struttura della tabella `schermo`
--

CREATE TABLE IF NOT EXISTS `schermo` (
  `codice_schermo` varchar(2) COLLATE utf8_bin NOT NULL COMMENT 'Codice dello schermo da inserire nella lampada',
  `descrizione_schermo` varchar(15) COLLATE utf8_bin NOT NULL COMMENT 'Descrizione di massima sul significato del tipo di schermo',
  `data_inserimento` date NOT NULL COMMENT 'data inserimento'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Elenco degli schermi disponibili per le lampade configurabili';

--
-- Dump dei dati per la tabella `schermo`
--

INSERT INTO `schermo` (`codice_schermo`, `descrizione_schermo`, `data_inserimento`) VALUES
('NA', 'NESSUN SCHERMO', '2014-07-28'),
('OP', 'OPALE', '2013-04-15'),
('TR', 'TRASPARENTE', '2013-04-15');

-- --------------------------------------------------------

--
-- Struttura della tabella `sistemi_accensione`
--

CREATE TABLE IF NOT EXISTS `sistemi_accensione` (
  `id_accensione` int(11) NOT NULL,
  `descrizione` varchar(50) COLLATE utf8_bin NOT NULL COMMENT 'descrizione accessorio ',
  `descrizione_breve` varchar(5) COLLATE utf8_bin NOT NULL COMMENT 'descrizione breve accessorio per fini di descrittivo',
  `corrente` varchar(5) COLLATE utf8_bin NOT NULL COMMENT 'sarebbero gli amper di portata',
  `portata_max_12V` int(11) NOT NULL COMMENT 'portata massima oltre al quale la barra led non funziona. Valori in W per corrente a 12V',
  `portata_max_24V` int(11) NOT NULL COMMENT 'portata massima oltre al quale la barra led non funziona. Valori in W per corrente a 24V',
  `UM` varchar(3) COLLATE utf8_bin NOT NULL,
  `QTA` int(11) NOT NULL,
  `costo` double DEFAULT NULL,
  `codice_articolo` varchar(11) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Accessori per i prodotti lineari';

--
-- Dump dei dati per la tabella `sistemi_accensione`
--

INSERT INTO `sistemi_accensione` (`id_accensione`, `descrizione`, `descrizione_breve`, `corrente`, `portata_max_12V`, `portata_max_24V`, `UM`, `QTA`, `costo`, `codice_articolo`) VALUES
(1, 'NESSUNO', 'N.A.', '', 36, 72, '', 0, 0, ''),
(2, 'TOUCH', 'TC', '2A', 36, 60, '', 0, 5.15, '32800640100'),
(3, 'PIR PANASONIC', 'SL', '3A', 36, 72, '', 0, 12.9, '12807530000'),
(4, 'TOUCH EMOTION', 'TE', '2A', 36, 60, '', 0, 8.4, '32800820300'),
(5, 'IR MECCANO', 'IR', '3A', 36, 72, '', 0, 0, ''),
(6, 'PIR MURATA', 'PM', '3A', 36, 72, '', 0, 8.32, '80707160101');

-- --------------------------------------------------------

--
-- Struttura della tabella `sistemi_fissaggio`
--

CREATE TABLE IF NOT EXISTS `sistemi_fissaggio` (
  `id_sistema_fissaggio` int(11) NOT NULL COMMENT 'PK',
  `descrizione_sistema_fissaggio` varchar(11) COLLATE utf8_bin NOT NULL COMMENT 'descrizione del sistema di fissaggio',
  `magnetic_clips` tinyint(1) NOT NULL COMMENT 'definisco se quel sistema di fissaggio può avere le magnetic clips',
  `data_inserimento` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `sistemi_fissaggio`
--

INSERT INTO `sistemi_fissaggio` (`id_sistema_fissaggio`, `descrizione_sistema_fissaggio`, `magnetic_clips`, `data_inserimento`) VALUES
(1, 'Legno', 0, '2014-06-04'),
(2, 'Vetro', 1, '2014-06-04'),
(3, 'Metallo', 1, '2014-06-04');

-- --------------------------------------------------------

--
-- Struttura della tabella `tipo_luce`
--

CREATE TABLE IF NOT EXISTS `tipo_luce` (
  `tipo_luce` varchar(15) COLLATE utf8_bin NOT NULL COMMENT 'definisce se la luce è calda,fredda,naturale',
  `temperatura_colore` varchar(9) COLLATE utf8_bin NOT NULL COMMENT 'in base al colore della luce viene inserito il valori in °K',
  `codifica_temperatura` varchar(2) COLLATE utf8_bin NOT NULL COMMENT 'Serve per identificare la temperatura del colore in funzione del range di appartenenza. Vedi codifica codice',
  `id_tipo_luce` int(11) NOT NULL COMMENT 'pk automatica',
  `temperatura_colore_comm` varchar(9) COLLATE utf8_bin NOT NULL COMMENT 'temperatura colore per il commerciale'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Colore luce led';

--
-- Dump dei dati per la tabella `tipo_luce`
--

INSERT INTO `tipo_luce` (`tipo_luce`, `temperatura_colore`, `codifica_temperatura`, `id_tipo_luce`, `temperatura_colore_comm`) VALUES
('WARM WHITE', '2500-3500', 'WW', 1, '3000'),
('COLD WHITE', '5000-6500', 'CW', 3, '6000'),
('NATURAL WHITE', '3500-4500', 'NW', 4, '4000'),
('N.A.', 'N.A.', '00', 5, ''),
('EMOTION', '2700-6400', 'EM', 6, '2700-6400');

-- --------------------------------------------------------

--
-- Struttura della tabella `vdc`
--

CREATE TABLE IF NOT EXISTS `vdc` (
  `VDC` varchar(5) COLLATE utf8_bin NOT NULL COMMENT 'Valore tensione continua',
  `valore` int(11) NOT NULL COMMENT 'valore tensione per calcolo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `vdc`
--

INSERT INTO `vdc` (`VDC`, `valore`) VALUES
('12Vdc', 12),
('24Vdc', 24);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `connettore_alimentazione`
--
ALTER TABLE `connettore_alimentazione`
  ADD PRIMARY KEY (`id_connettore`);

--
-- Indexes for table `costo_assemblaggio_lampada`
--
ALTER TABLE `costo_assemblaggio_lampada`
  ADD PRIMARY KEY (`da`,`a`,`tipo_lavorazione`,`nome_prodotto`), ADD KEY `nome_prodotto` (`nome_prodotto`), ADD KEY `tipo_lavorazione` (`tipo_lavorazione`);

--
-- Indexes for table `diba`
--
ALTER TABLE `diba`
  ADD PRIMARY KEY (`nome_prodotto`,`codice_componente`,`inizio_validita`);

--
-- Indexes for table `lavorazioni_prodotto`
--
ALTER TABLE `lavorazioni_prodotto`
  ADD PRIMARY KEY (`tipo_lavorazione`);

--
-- Indexes for table `moq`
--
ALTER TABLE `moq`
  ADD PRIMARY KEY (`da`,`a`,`data_validita`);

--
-- Indexes for table `motore_led`
--
ALTER TABLE `motore_led`
  ADD PRIMARY KEY (`codice_motore_led`), ADD KEY `VDC` (`VDC`), ADD KEY `versione_led` (`versione_led`);

--
-- Indexes for table `motore_led_luce`
--
ALTER TABLE `motore_led_luce`
  ADD PRIMARY KEY (`motore_led`,`id_tipo_luce`), ADD KEY `id_tipo_luce` (`id_tipo_luce`);

--
-- Indexes for table `prodotti_lineari`
--
ALTER TABLE `prodotti_lineari`
  ADD PRIMARY KEY (`nome_prodotto`);

--
-- Indexes for table `prodotto_lineare_motore_led_accensione`
--
ALTER TABLE `prodotto_lineare_motore_led_accensione`
  ADD PRIMARY KEY (`prodotto_lineare`,`motore_led`,`id_sistema_accensione`,`id_sistema_fissaggio`,`id_connettore`), ADD KEY `motore_led` (`motore_led`), ADD KEY `id_sistema_accensione` (`id_sistema_accensione`), ADD KEY `ingombro_tecnico` (`ingombro_tecnico`), ADD KEY `id_sistema_fissaggio` (`id_sistema_fissaggio`), ADD KEY `id_connettore` (`id_connettore`);

--
-- Indexes for table `regole_cavo_bipolare`
--
ALTER TABLE `regole_cavo_bipolare`
  ADD PRIMARY KEY (`classe`);

--
-- Indexes for table `regole_clips_reel_plate`
--
ALTER TABLE `regole_clips_reel_plate`
  ADD PRIMARY KEY (`nome_prodotto`,`codice_articolo_fissaggio`,`da`,`a`,`inizio_validita`);

--
-- Indexes for table `regole_imballi`
--
ALTER TABLE `regole_imballi`
  ADD PRIMARY KEY (`da`,`a`,`codice_articolo_imballo`,`inizio_validita`), ADD KEY `da` (`da`), ADD KEY `a` (`a`);

--
-- Indexes for table `regole_piastrina_cavi`
--
ALTER TABLE `regole_piastrina_cavi`
  ADD PRIMARY KEY (`nome_prodotto`,`codice_articolo_fissaggio`,`da`,`a`,`inizio_validita`);

--
-- Indexes for table `regole_schermo`
--
ALTER TABLE `regole_schermo`
  ADD PRIMARY KEY (`nome_prodotto`,`codice_schermo`,`inizio_validita`,`codice_articolo_schermo`), ADD KEY `codice_schermo` (`codice_schermo`);

--
-- Indexes for table `regole_sistema_fissaggio`
--
ALTER TABLE `regole_sistema_fissaggio`
  ADD PRIMARY KEY (`nome_prodotto`,`tipo_fissaggio`,`codice_articolo_fissaggio`,`da`,`a`,`inizio_validita`), ADD KEY `tipo_fissaggio` (`tipo_fissaggio`);

--
-- Indexes for table `rincaro_prodotto`
--
ALTER TABLE `rincaro_prodotto`
  ADD PRIMARY KEY (`nome_prodotto`,`id_accensione`,`rincaro`), ADD KEY `id_accensione` (`id_accensione`);

--
-- Indexes for table `schermo`
--
ALTER TABLE `schermo`
  ADD PRIMARY KEY (`codice_schermo`);

--
-- Indexes for table `sistemi_accensione`
--
ALTER TABLE `sistemi_accensione`
  ADD PRIMARY KEY (`id_accensione`);

--
-- Indexes for table `sistemi_fissaggio`
--
ALTER TABLE `sistemi_fissaggio`
  ADD PRIMARY KEY (`id_sistema_fissaggio`);

--
-- Indexes for table `tipo_luce`
--
ALTER TABLE `tipo_luce`
  ADD PRIMARY KEY (`id_tipo_luce`);

--
-- Indexes for table `vdc`
--
ALTER TABLE `vdc`
  ADD PRIMARY KEY (`VDC`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `connettore_alimentazione`
--
ALTER TABLE `connettore_alimentazione`
  MODIFY `id_connettore` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK per il connettore di alimentazione',AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sistemi_accensione`
--
ALTER TABLE `sistemi_accensione`
  MODIFY `id_accensione` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `sistemi_fissaggio`
--
ALTER TABLE `sistemi_fissaggio`
  MODIFY `id_sistema_fissaggio` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tipo_luce`
--
ALTER TABLE `tipo_luce`
  MODIFY `id_tipo_luce` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk automatica',AUTO_INCREMENT=7;
--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `costo_assemblaggio_lampada`
--
ALTER TABLE `costo_assemblaggio_lampada`
ADD CONSTRAINT `costo_assemblaggio_lampada_ibfk_1` FOREIGN KEY (`nome_prodotto`) REFERENCES `prodotti_lineari` (`nome_prodotto`) ON DELETE NO ACTION ON UPDATE CASCADE,
ADD CONSTRAINT `costo_assemblaggio_lampada_ibfk_2` FOREIGN KEY (`tipo_lavorazione`) REFERENCES `lavorazioni_prodotto` (`tipo_lavorazione`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Limiti per la tabella `diba`
--
ALTER TABLE `diba`
ADD CONSTRAINT `diba_ibfk_1` FOREIGN KEY (`nome_prodotto`) REFERENCES `prodotti_lineari` (`nome_prodotto`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Limiti per la tabella `motore_led`
--
ALTER TABLE `motore_led`
ADD CONSTRAINT `motore_led_ibfk_1` FOREIGN KEY (`VDC`) REFERENCES `vdc` (`VDC`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Limiti per la tabella `motore_led_luce`
--
ALTER TABLE `motore_led_luce`
ADD CONSTRAINT `motore_led_luce_ibfk_1` FOREIGN KEY (`id_tipo_luce`) REFERENCES `tipo_luce` (`id_tipo_luce`) ON DELETE NO ACTION ON UPDATE CASCADE,
ADD CONSTRAINT `motore_led_luce_ibfk_2` FOREIGN KEY (`motore_led`) REFERENCES `motore_led` (`codice_motore_led`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Limiti per la tabella `prodotto_lineare_motore_led_accensione`
--
ALTER TABLE `prodotto_lineare_motore_led_accensione`
ADD CONSTRAINT `prodotto_lineare_motore_led_accensione_ibfk_1` FOREIGN KEY (`prodotto_lineare`) REFERENCES `prodotti_lineari` (`nome_prodotto`) ON DELETE NO ACTION ON UPDATE CASCADE,
ADD CONSTRAINT `prodotto_lineare_motore_led_accensione_ibfk_2` FOREIGN KEY (`motore_led`) REFERENCES `motore_led` (`codice_motore_led`) ON DELETE NO ACTION ON UPDATE CASCADE,
ADD CONSTRAINT `prodotto_lineare_motore_led_accensione_ibfk_3` FOREIGN KEY (`id_sistema_accensione`) REFERENCES `sistemi_accensione` (`id_accensione`) ON DELETE NO ACTION ON UPDATE CASCADE,
ADD CONSTRAINT `prodotto_lineare_motore_led_accensione_ibfk_4` FOREIGN KEY (`id_sistema_fissaggio`) REFERENCES `sistemi_fissaggio` (`id_sistema_fissaggio`) ON DELETE NO ACTION ON UPDATE CASCADE,
ADD CONSTRAINT `prodotto_lineare_motore_led_accensione_ibfk_5` FOREIGN KEY (`id_connettore`) REFERENCES `connettore_alimentazione` (`id_connettore`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Limiti per la tabella `regole_clips_reel_plate`
--
ALTER TABLE `regole_clips_reel_plate`
ADD CONSTRAINT `nome_prodotto` FOREIGN KEY (`nome_prodotto`) REFERENCES `prodotti_lineari` (`nome_prodotto`);

--
-- Limiti per la tabella `regole_piastrina_cavi`
--
ALTER TABLE `regole_piastrina_cavi`
ADD CONSTRAINT `regole_piastrina_cavi_ibfk_1` FOREIGN KEY (`nome_prodotto`) REFERENCES `prodotti_lineari` (`nome_prodotto`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Limiti per la tabella `regole_schermo`
--
ALTER TABLE `regole_schermo`
ADD CONSTRAINT `regole_schermo_ibfk_1` FOREIGN KEY (`nome_prodotto`) REFERENCES `prodotti_lineari` (`nome_prodotto`) ON DELETE NO ACTION ON UPDATE CASCADE,
ADD CONSTRAINT `regole_schermo_ibfk_2` FOREIGN KEY (`codice_schermo`) REFERENCES `schermo` (`codice_schermo`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Limiti per la tabella `regole_sistema_fissaggio`
--
ALTER TABLE `regole_sistema_fissaggio`
ADD CONSTRAINT `regole_sistema_fissaggio_ibfk_1` FOREIGN KEY (`nome_prodotto`) REFERENCES `prodotti_lineari` (`nome_prodotto`) ON DELETE NO ACTION ON UPDATE CASCADE,
ADD CONSTRAINT `regole_sistema_fissaggio_ibfk_2` FOREIGN KEY (`tipo_fissaggio`) REFERENCES `sistemi_fissaggio` (`id_sistema_fissaggio`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Limiti per la tabella `rincaro_prodotto`
--
ALTER TABLE `rincaro_prodotto`
ADD CONSTRAINT `rincaro_prodotto_ibfk_1` FOREIGN KEY (`id_accensione`) REFERENCES `sistemi_accensione` (`id_accensione`) ON DELETE NO ACTION ON UPDATE CASCADE,
ADD CONSTRAINT `rincaro_prodotto_ibfk_2` FOREIGN KEY (`nome_prodotto`) REFERENCES `prodotti_lineari` (`nome_prodotto`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
