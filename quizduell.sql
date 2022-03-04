-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 04. Mrz 2022 um 08:54
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
-- Tabellenstruktur für Tabelle `fragen`
--

CREATE TABLE `fragen` (
  `id` int(11) NOT NULL,
  `objekt` text NOT NULL,
  `richtig` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `fragen`
--

INSERT INTO `fragen` (`id`, `objekt`, `richtig`) VALUES
(1, '{\"frage\": \"Wie viele Tage hat eine Woche?\",\"antworten\": [\"7\",\"5\",\"6\",\"8\"]}', 0),
(2, '{\"frage\": \"Wie viele Stunden hat ein Tag?\",\"antworten\": [\"24\",\"20\",\"27\",\"48\"]}', 0),
(3, '{\"frage\": \"Welche Tastenkombination ist nötig für {} mit macOS?\",\"antworten\": [\"Alt + 8/9\",\"Ctrl + 8/9\",\"Alt + 5/6\",\"Ctrl + 5/6\"]}', 0),
(4, '{\"frage\": \"Welche Tastenkombination ist nötig für [] mit macOS?\",\"antworten\": [\"Alt + 5/6\",\"Ctrl + 5/6\",\"Alt + 8/9\",\"Ctrl + 5/6\"]}', 0),
(5, '{\"frage\": \"Wie viele Millimeter sind ein Dezimeter?\",\"antworten\": [\"100\",\"10\",\"1000\",\"10000\"]}', 0),
(6, '{\"frage\": \"Wie viele Meter sind ein Dekameter?\",\"antworten\": [\"10\",\"100\",\"1000\",\"10000\"]}', 0),
(7, '{\"frage\": \"Das Windows Gegenstück zum Finder heißt?\",\"antworten\": [\"Explorer\",\"Atlas\",\"Fundbüro\",\"Erkunder\"]}', 0),
(8, '{\"frage\": \"Microsofts Version von Siri heißt?\",\"antworten\": [\"Cortana\",\"Alexa\",\"Bixby\",\"Snips\"]}', 0),
(9, '{\"frage\": \"Was hat Caesar mit \'Alea iacta est\' gemeint?\",\"antworten\": [\"\'Die Würfel sind gefallen.\'\",\"\'Ich kam, sah und siegte.\'\",\"\'Du auch, Brutus?\'\",\"\'Kaffee bitte.\'\"]}', 0),
(10, '{\"frage\": \"Wer sagte \'Ich bin ein Berliner\'?\",\"antworten\": [\"John F. Kennedy\",\"Gerhard Schröder\",\"Helmut Schmidt\",\"Helmut Kohl\"]}', 0),
(11, '{\"frage\":\"360° sind?\", \"antworten\":[\"π\",\"2π\", \"3π\", \"4π\"]}', 1),
(12, '{\"frage\":\"Neuburg hat etwa wie viele Einwohner?\",\"antworten\":[\"20.000\",\"30.000\",\"40.000\",\"50.000\"]}', 1);

--
-- Indizes der exportierten Tabellen
--

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
-- AUTO_INCREMENT für Tabelle `fragen`
--
ALTER TABLE `fragen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
