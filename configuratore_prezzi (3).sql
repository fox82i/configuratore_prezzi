-- phpMyAdmin SQL Dump
-- version 4.2.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Lug 23, 2014 alle 17:30
-- Versione del server: 5.5.20
-- PHP Version: 5.3.8

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
  `sdoppiabile` tinyint(4) NOT NULL COMMENT 'Indica se l''alimentazione per quel connettore può essere doppia o meno'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tipi di connettori per lampade lineari' AUTO_INCREMENT=5 ;

--
-- Dump dei dati per la tabella `connettore_alimentazione`
--

INSERT INTO `connettore_alimentazione` (`id_connettore`, `descrizione_connettore`, `data_inserimento`, `lunghezza_cavo`, `portata_max_12V`, `portata_max_24V`, `sdoppiabile`) VALUES
(1, 'Twin', '2014-06-09', 3000, 24, 48, 1),
(2, 'M-Track', '2014-06-09', 600, 24, 48, 0),
(3, 'Sliding', '2014-06-09', 0, 24, 48, 0),
(4, 'Modular', '2014-06-09', 500, 24, 48, 0);

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
  `QTA` int(11) NOT NULL COMMENT 'quantità'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='costo di assemblaggio per la produzione di una lampada in produzione';

--
-- Dump dei dati per la tabella `costo_assemblaggio_lampada`
--

INSERT INTO `costo_assemblaggio_lampada` (`note`, `da`, `a`, `costo`, `UM`, `QTA`) VALUES
('circa 240"', 0, 600, 1.24, 'PZ', 1),
('circa 300"', 601, 1200, 1.55, 'PZ', 1),
('circa 360"', 1201, 2000, 1.86, 'PZ', 1),
('circa 450"', 2001, 3000, 2.33, 'PZ', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `costo_taglio_reelplate`
--

CREATE TABLE IF NOT EXISTS `costo_taglio_reelplate` (
  `da` int(11) NOT NULL,
  `a` int(11) NOT NULL,
  `costo` double NOT NULL,
  `UM` varchar(3) COLLATE utf8_bin NOT NULL,
  `QTA` int(11) NOT NULL,
  `note` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `costo_taglio_reelplate`
--

INSERT INTO `costo_taglio_reelplate` (`da`, `a`, `costo`, `UM`, `QTA`, `note`) VALUES
(0, 2000, 0.05, 'PZ', 1, 'circa 10" a profilo'),
(2001, 4300, 0.1, 'PZ', 1, 'circa 20" a profilo');

-- --------------------------------------------------------

--
-- Struttura della tabella `costo_taglio_schermo`
--

CREATE TABLE IF NOT EXISTS `costo_taglio_schermo` (
  `da` int(11) NOT NULL,
  `a` int(11) NOT NULL,
  `costo` double NOT NULL,
  `UM` varchar(3) COLLATE utf8_bin NOT NULL,
  `QTA` int(11) NOT NULL,
  `note` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `costo_taglio_schermo`
--

INSERT INTO `costo_taglio_schermo` (`da`, `a`, `costo`, `UM`, `QTA`, `note`) VALUES
(0, 1500, 0.05, 'PZ', 1, 'circa 10" a profilo'),
(1501, 3000, 0.1, 'PZ', 1, 'circa 20" a profilo');

-- --------------------------------------------------------

--
-- Struttura della tabella `costo_taglio_verga`
--

CREATE TABLE IF NOT EXISTS `costo_taglio_verga` (
  `da` int(11) NOT NULL,
  `a` int(11) NOT NULL,
  `costo` double NOT NULL,
  `UM` varchar(3) COLLATE utf8_bin NOT NULL,
  `QTA` int(11) NOT NULL,
  `note` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `costo_taglio_verga`
--

INSERT INTO `costo_taglio_verga` (`da`, `a`, `costo`, `UM`, `QTA`, `note`) VALUES
(0, 2000, 0.16, 'PZ', 1, 'circa 60" a profilo'),
(2001, 4300, 0.31, 'PZ', 1, 'circa 90" a profilo');

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
('C', '108 LED/mt', '2014-03-12', '12Vdc', '3528', 0, 5000, 27.16),
('D', '60 LED/mt', '2014-05-27', '12Vdc', '5050', 0, 5000, 30.46),
('E', '156 LED/mt', '2014-05-27', '12Vdc', '3528', 0, 5000, 37.07),
('F', '120/120 EMOTION', '2014-05-27', '12Vdc', '3014', 0, 10000, 94.1),
('G', '72 LED/mt', '2014-05-27', '12Vdc', '3528', 0, 5000, 20.72),
('I', '156 LED/mt', '2014-05-27', '24Vdc', '3528', 0, 5000, 37.07),
('M', '108 LED/mt', '2014-05-27', '24Vdc', '3528', 0, 5000, 27.16),
('N', '72 LED/mt', '2014-05-27', '24Vdc', '3528', 0, 5000, 20.72);

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
('GENEVE', NULL, 150, 30000, NULL, '2014-05-27', 0),
('LEDO', NULL, 150, 3000, NULL, '2014-05-27', 0),
('LUGANO', '20600000000', 150, 3000, 'SI', '2013-04-15', 0),
('MALINDI', '20000000000', 150, 3000, 'SI', '2013-04-15', 0),
('MALINDI-in', NULL, 150, 3000, NULL, '2014-05-27', 0),
('MANILA', '15710011201', 450, 3000, 'SI', '2012-11-14', 0),
('MECCANO', NULL, 150, 3000, NULL, '2014-05-27', 1),
('MISKA', NULL, 150, 3000, NULL, '2014-05-27', 0),
('PERTH', NULL, 150, 3000, NULL, '2014-05-27', 0),
('SKYLINE', NULL, 150, 3000, NULL, '2014-05-27', 0),
('TIFANY', NULL, 150, 3000, NULL, '2014-05-27', 0);

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
('LEDO', 'C', 1, 35.2, 1, 1, 'SI', 'REVER', '', '2014-05-27'),
('LEDO', 'C', 1, 35.2, 1, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'C', 1, 35.2, 1, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'C', 1, 35.2, 2, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'C', 1, 35.2, 2, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'C', 1, 35.2, 2, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'C', 1, 35.2, 3, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'C', 1, 35.2, 3, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'C', 1, 35.2, 3, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'C', 2, 72.2, 1, 1, 'SI', 'REVER', '', '2014-05-30'),
('LEDO', 'C', 2, 72.2, 1, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'C', 2, 72.2, 1, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'C', 2, 72.2, 2, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'C', 2, 72.2, 2, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'C', 2, 72.2, 2, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'C', 2, 72.2, 3, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'C', 2, 72.2, 3, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'C', 2, 72.2, 3, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'D', 1, 35.2, 1, 1, 'SI', 'REVER', '', '2014-05-27'),
('LEDO', 'D', 1, 35.2, 1, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'D', 1, 35.2, 1, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'D', 1, 35.2, 2, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'D', 1, 35.2, 2, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'D', 1, 35.2, 2, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'D', 1, 35.2, 3, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'D', 1, 35.2, 3, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'D', 1, 35.2, 3, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'D', 2, 72.2, 1, 1, 'SI', 'REVER', '', '2014-05-30'),
('LEDO', 'D', 2, 72.2, 1, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'D', 2, 72.2, 1, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'D', 2, 72.2, 2, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'D', 2, 72.2, 2, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'D', 2, 72.2, 2, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'D', 2, 72.2, 3, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'D', 2, 72.2, 3, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'D', 2, 72.2, 3, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'E', 1, 35.2, 1, 1, 'SI', 'REVER', '', '2014-05-27'),
('LEDO', 'E', 1, 35.2, 1, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'E', 1, 35.2, 1, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'E', 1, 35.2, 2, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'E', 1, 35.2, 2, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'E', 1, 35.2, 2, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'E', 1, 35.2, 3, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'E', 1, 35.2, 3, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'E', 1, 35.2, 3, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'E', 2, 72.2, 1, 1, 'SI', 'REVER', '', '2014-05-30'),
('LEDO', 'E', 2, 72.2, 1, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'E', 2, 72.2, 1, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'E', 2, 72.2, 2, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'E', 2, 72.2, 2, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'E', 2, 72.2, 2, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'E', 2, 72.2, 3, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'E', 2, 72.2, 3, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'E', 2, 72.2, 3, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'G', 1, 35.2, 1, 1, 'SI', 'REVER', '', '2014-05-27'),
('LEDO', 'G', 1, 35.2, 1, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'G', 1, 35.2, 1, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'G', 1, 35.2, 2, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'G', 1, 35.2, 2, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'G', 1, 35.2, 2, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'G', 1, 35.2, 3, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'G', 1, 35.2, 3, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'G', 1, 35.2, 3, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'G', 2, 72.2, 1, 1, 'SI', 'REVER', '', '2014-05-30'),
('LEDO', 'G', 2, 72.2, 1, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'G', 2, 72.2, 1, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'G', 2, 72.2, 2, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'G', 2, 72.2, 2, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'G', 2, 72.2, 2, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'G', 2, 72.2, 3, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'G', 2, 72.2, 3, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'G', 2, 72.2, 3, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'I', 1, 35.2, 1, 1, 'SI', 'REVER', '', '2014-05-27'),
('LEDO', 'I', 1, 35.2, 1, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'I', 1, 35.2, 1, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'I', 1, 35.2, 2, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'I', 1, 35.2, 2, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'I', 1, 35.2, 2, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'I', 1, 35.2, 3, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'I', 1, 35.2, 3, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'I', 1, 35.2, 3, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'I', 2, 72.2, 1, 1, 'SI', 'REVER', '', '2014-05-30'),
('LEDO', 'I', 2, 72.2, 1, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'I', 2, 72.2, 1, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'I', 2, 72.2, 2, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'I', 2, 72.2, 2, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'I', 2, 72.2, 2, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'I', 2, 72.2, 3, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'I', 2, 72.2, 3, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'I', 2, 72.2, 3, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'M', 1, 35.2, 1, 1, 'SI', 'REVER', '', '2014-05-27'),
('LEDO', 'M', 1, 35.2, 1, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'M', 1, 35.2, 1, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'M', 1, 35.2, 2, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'M', 1, 35.2, 2, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'M', 1, 35.2, 2, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'M', 1, 35.2, 3, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'M', 1, 35.2, 3, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'M', 1, 35.2, 3, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'M', 2, 72.2, 1, 1, 'SI', 'REVER', '', '2014-05-30'),
('LEDO', 'M', 2, 72.2, 1, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'M', 2, 72.2, 1, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'M', 2, 72.2, 2, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'M', 2, 72.2, 2, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'M', 2, 72.2, 2, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'M', 2, 72.2, 3, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'M', 2, 72.2, 3, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'M', 2, 72.2, 3, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'N', 1, 35.2, 1, 1, 'SI', 'REVER', '', '2014-05-27'),
('LEDO', 'N', 1, 35.2, 1, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'N', 1, 35.2, 1, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'N', 1, 35.2, 2, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'N', 1, 35.2, 2, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'N', 1, 35.2, 2, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'N', 1, 35.2, 3, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'N', 1, 35.2, 3, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'N', 1, 35.2, 3, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'N', 2, 72.2, 1, 1, 'SI', 'REVER', '', '2014-05-30'),
('LEDO', 'N', 2, 72.2, 1, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'N', 2, 72.2, 1, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'N', 2, 72.2, 2, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'N', 2, 72.2, 2, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'N', 2, 72.2, 2, 4, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'N', 2, 72.2, 3, 1, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'N', 2, 72.2, 3, 2, 'SI', 'REVER', '', '2014-06-09'),
('LEDO', 'N', 2, 72.2, 3, 4, 'SI', 'REVER', '', '2014-06-09'),
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
('MALINDI', 'C', 1, 53, 1, 1, 'STD', 'REVER', '', '2014-03-12'),
('MALINDI', 'C', 1, 53, 1, 3, 'STD', 'REVER', '', '2014-06-09'),
('MALINDI', 'C', 2, 90, 1, 1, 'STD', 'REVER', '', '2014-05-30'),
('MALINDI', 'C', 2, 90, 1, 3, 'STD', 'REVER', '', '2014-06-09'),
('MALINDI', 'E', 1, 53, 1, 1, 'STD', 'REVER', '', '2014-05-27'),
('MALINDI', 'E', 1, 53, 1, 3, 'STD', 'REVER', '', '2014-06-09'),
('MALINDI', 'E', 2, 90, 1, 1, 'STD', 'REVER', '', '2014-05-30'),
('MALINDI', 'E', 2, 90, 1, 3, 'STD', 'REVER', '', '2014-06-09'),
('MALINDI', 'F', 1, 53, 1, 1, 'STD', 'REVER', '', '2014-05-27'),
('MALINDI', 'F', 4, 0, 1, 1, 'STD', 'REVER', '', '2014-05-30'),
('MALINDI', 'G', 1, 53, 1, 1, 'STD', 'REVER', '', '2014-05-27'),
('MALINDI', 'G', 1, 53, 1, 3, 'STD', 'REVER', '', '2014-06-09'),
('MALINDI', 'G', 2, 90, 1, 1, 'STD', 'REVER', '', '2014-05-30'),
('MALINDI', 'G', 2, 90, 1, 3, 'STD', 'REVER', '', '2014-06-09'),
('MALINDI', 'I', 1, 53, 1, 1, 'STD', 'REVER', '', '2014-05-27'),
('MALINDI', 'I', 1, 53, 1, 3, 'STD', 'REVER', '', '2014-06-09'),
('MALINDI', 'I', 2, 90, 1, 1, 'STD', 'REVER', '', '2014-05-30'),
('MALINDI', 'I', 2, 90, 1, 3, 'STD', 'REVER', '', '2014-06-09'),
('MALINDI', 'M', 1, 53, 1, 1, 'STD', 'REVER', '', '2014-05-27'),
('MALINDI', 'M', 1, 53, 1, 3, 'STD', 'REVER', '', '2014-06-09'),
('MALINDI', 'M', 2, 90, 1, 1, 'STD', 'REVER', '', '2014-05-30'),
('MALINDI', 'M', 2, 90, 1, 3, 'STD', 'REVER', '', '2014-06-09'),
('MALINDI', 'N', 1, 53, 1, 1, 'STD', 'REVER', '', '2014-05-27'),
('MALINDI', 'N', 1, 53, 1, 3, 'STD', 'REVER', '', '2014-06-09'),
('MALINDI', 'N', 2, 90, 1, 1, 'STD', 'REVER', '', '2014-05-30'),
('MALINDI', 'N', 2, 90, 1, 3, 'STD', 'REVER', '', '2014-06-09'),
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
('MANILA', 'E', 1, 59, 1, 1, 'SI', 'REVER', '', '2014-05-27'),
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
('PERTH', 'C', 3, 53, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-30'),
('PERTH', 'D', 3, 53, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-30'),
('PERTH', 'E', 3, 53, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-30'),
('PERTH', 'G', 3, 53, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-30'),
('PERTH', 'I', 3, 53, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-30'),
('PERTH', 'M', 3, 53, 1, 1, 'SI', 'STD', 'sinistra', '2014-05-30'),
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
  `COSTO` int(11) NOT NULL,
  `codice_articolo` varchar(11) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Accessori per i prodotti lineari' AUTO_INCREMENT=7 ;

--
-- Dump dei dati per la tabella `sistemi_accensione`
--

INSERT INTO `sistemi_accensione` (`id_accensione`, `descrizione`, `descrizione_breve`, `corrente`, `portata_max_12V`, `portata_max_24V`, `UM`, `QTA`, `COSTO`, `codice_articolo`) VALUES
(1, 'NESSUNO', 'N.A.', '', 0, 0, '', 0, 0, ''),
(2, 'TOUCH', 'TC', '2A', 24, 48, '', 0, 0, '32800640100'),
(3, 'PIR PANASONIC', 'SL', '2A', 24, 48, '', 0, 0, '12807530000'),
(4, 'TOUCH EMOTION', 'TE', '2A', 24, 48, '', 0, 0, '32800820300'),
(5, 'IR MECCANO', 'IR', '2A', 24, 48, '', 0, 0, ''),
(6, 'PIR MURATA', 'PM', '2A', 24, 48, '', 0, 0, '80707160101');

-- --------------------------------------------------------

--
-- Struttura della tabella `sistemi_fissaggio`
--

CREATE TABLE IF NOT EXISTS `sistemi_fissaggio` (
`id_sistema_fissaggio` int(11) NOT NULL COMMENT 'PK',
  `descrizione_sistema_fissaggio` varchar(11) COLLATE utf8_bin NOT NULL COMMENT 'descrizione del sistema di fissaggio',
  `magnetic_clips` tinyint(1) NOT NULL COMMENT 'definisco se quel sistema di fissaggio può avere le magnetic clips',
  `data_inserimento` date NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Colore luce led' AUTO_INCREMENT=7 ;

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
 ADD PRIMARY KEY (`da`,`a`);

--
-- Indexes for table `costo_taglio_reelplate`
--
ALTER TABLE `costo_taglio_reelplate`
 ADD PRIMARY KEY (`da`,`a`);

--
-- Indexes for table `costo_taglio_schermo`
--
ALTER TABLE `costo_taglio_schermo`
 ADD PRIMARY KEY (`da`,`a`);

--
-- Indexes for table `costo_taglio_verga`
--
ALTER TABLE `costo_taglio_verga`
 ADD PRIMARY KEY (`da`,`a`);

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
