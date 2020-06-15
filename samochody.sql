-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 16 Cze 2020, 00:31
-- Wersja serwera: 10.4.11-MariaDB
-- Wersja PHP: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `samochody`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `posiada`
--

CREATE TABLE `posiada` (
  `VIN` varchar(12) COLLATE utf8_polish_ci NOT NULL,
  `PESEL` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `posiada`
--

INSERT INTO `posiada` (`VIN`, `PESEL`) VALUES
('194329', 1201221213),
('194329', 1693282716),
('12334', 1693282716),
('12443214', 1201221213);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `samochody`
--

CREATE TABLE `samochody` (
  `model` varchar(12) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `marka` varchar(12) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `numer_nadwozia` varchar(12) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `rocznik` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `samochody`
--

INSERT INTO `samochody` (`model`, `marka`, `numer_nadwozia`, `rocznik`) VALUES
('Seicento', 'Fiat', '12334', 1999),
('e76', 'BMW', '12443214', 2004),
('a61', 'Audi', '194329', 2012);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wlasciciel`
--

CREATE TABLE `wlasciciel` (
  `imie` varchar(15) COLLATE utf8_polish_ci NOT NULL,
  `nazwisko` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `PESEL` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `wlasciciel`
--

INSERT INTO `wlasciciel` (`imie`, `nazwisko`, `PESEL`) VALUES
('Genowefa', 'Hardogóra', 1201221213),
('Kamil', 'Świtek', 1693282716);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `posiada`
--
ALTER TABLE `posiada`
  ADD KEY `PESEL` (`PESEL`),
  ADD KEY `VIN` (`VIN`);

--
-- Indeksy dla tabeli `samochody`
--
ALTER TABLE `samochody`
  ADD PRIMARY KEY (`numer_nadwozia`);

--
-- Indeksy dla tabeli `wlasciciel`
--
ALTER TABLE `wlasciciel`
  ADD PRIMARY KEY (`PESEL`);

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `posiada`
--
ALTER TABLE `posiada`
  ADD CONSTRAINT `posiada_ibfk_1` FOREIGN KEY (`PESEL`) REFERENCES `wlasciciel` (`PESEL`),
  ADD CONSTRAINT `posiada_ibfk_2` FOREIGN KEY (`VIN`) REFERENCES `samochody` (`numer_nadwozia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
