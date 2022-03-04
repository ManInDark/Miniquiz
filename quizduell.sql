-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 04. Mrz 2022 um 10:45
-- Server-Version: 10.4.22-MariaDB
-- PHP-Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `quizduell`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `antworten`
--

CREATE TABLE `antworten` (
  `fragenid` int(11) NOT NULL,
  `antwort` text NOT NULL,
  `richtig` tinyint(1) NOT NULL DEFAULT 0,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `antworten`
--

INSERT INTO `antworten` (`fragenid`, `antwort`, `richtig`, `id`) VALUES
(1, '7', 1, 1),
(1, '5', 0, 2),
(1, '6', 0, 3),
(1, '8', 0, 4),
(2, '24', 1, 5),
(2, '20', 0, 6),
(2, '27', 0, 7),
(2, '48', 0, 8),
(3, 'Alt + 8/9', 1, 9),
(3, 'Ctrl + 8/9', 0, 10),
(3, 'Alt + 5/6', 0, 11),
(3, 'Ctrl + 5/6', 0, 12),
(4, 'Alt + 5/6', 1, 13),
(4, 'Ctrl + 5/6', 0, 14),
(4, 'Alt + 8/9', 0, 15),
(4, 'Ctrl + 5/6', 0, 16),
(5, '10', 0, 17),
(5, '100', 1, 18),
(5, '1000', 0, 19),
(5, '10000', 0, 20),
(6, '10', 1, 21),
(6, '100', 0, 22),
(6, '1000', 0, 23),
(6, '10000', 0, 24),
(7, 'Atlas', 0, 25),
(7, 'Fundbüro', 0, 26),
(7, 'Explorer', 1, 27),
(7, 'Erkunder', 0, 28),
(8, 'Cortana', 1, 29),
(8, 'Alexa', 0, 30),
(8, 'Bixby', 0, 31),
(8, 'Snips', 0, 32),
(9, '\"Ich kam, sah und siegte.\"', 0, 33),
(9, '\"Du auch, Brutus?\"', 0, 34),
(9, '\"Kaffee bitte.\"', 0, 35),
(9, '\"Die Würfel sind gefallen.\"', 1, 36),
(10, 'John F. Kennedy', 1, 37),
(10, 'Gerhard Schröder', 0, 38),
(10, 'Helmut Schmidt', 0, 39),
(10, 'Helmut Kohl', 0, 40),
(11, 'π', 0, 41),
(11, '2π', 1, 42),
(11, '3π', 0, 43),
(11, '4π', 0, 44),
(12, '20.000', 0, 45),
(12, '30.000', 1, 46),
(12, '40.000', 0, 47),
(12, '50.000', 0, 48);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `fragen`
--

CREATE TABLE `fragen` (
  `id` int(11) NOT NULL,
  `objekt` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `fragen`
--

INSERT INTO `fragen` (`id`, `objekt`) VALUES
(1, 'Wie viele Tage hat eine Woche?'),
(2, 'Wie viele Stunden hat ein Tag?'),
(3, 'Welche Tastenkombination ist nötig für {} mit macOS?'),
(4, 'Welche Tastenkombination ist nötig für [] mit macOS?'),
(5, 'Wie viele Millimeter sind ein Dezimeter?'),
(6, 'Wie viele Meter sind ein Dekameter?'),
(7, 'Das Windows Gegenstück zum Finder heißt?'),
(8, 'Microsofts Version von Siri heißt?'),
(9, 'Was hat Caesar mit \'Alea iacta est\' gemeint?'),
(10, 'Wer sagte \'Ich bin ein Berliner\'?'),
(11, '360° sind?'),
(12, 'Neuburg hat etwa wie viele Einwohner?');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `antworten`
--
ALTER TABLE `antworten`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fragenid` (`fragenid`);

--
-- Indizes für die Tabelle `fragen`
--
ALTER TABLE `fragen`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `antworten`
--
ALTER TABLE `antworten`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT für Tabelle `fragen`
--
ALTER TABLE `fragen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `antworten`
--
ALTER TABLE `antworten`
  ADD CONSTRAINT `antworten_ibfk_1` FOREIGN KEY (`fragenid`) REFERENCES `fragen` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
