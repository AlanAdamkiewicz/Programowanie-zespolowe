-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 12 Cze 2017, 20:25
-- Wersja serwera: 10.1.21-MariaDB
-- Wersja PHP: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `abc-data`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dostawca_importer`
--

CREATE TABLE `dostawca_importer` (
  `dostawca_importer_id` int(11) NOT NULL,
  `nazwa` varchar(255) NOT NULL,
  `typ` varchar(255) NOT NULL,
  `wlasciciel` varchar(255) NOT NULL,
  `adres` varchar(255) NOT NULL,
  `telefon` int(11) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `dostawca_importer`
--

INSERT INTO `dostawca_importer` (`dostawca_importer_id`, `nazwa`, `typ`, `wlasciciel`, `adres`, `telefon`, `email`) VALUES
(2, 'Action', 'Dell', 'Andrzej Golota', 'Rejtana 8', 123456789, 'Dell@gmail.com'),
(3, 'Xkom', 'Asus', 'Zbigniew Nalesnik', 'Krakowska 8', 741258963, 'Xkom@gmail.com'),
(4, 'Sferis', 'Acer', 'Andrzej Baloizy', 'Rejtana 3', 654789321, 'Acer@gmail.com'),
(5, 'Idk', 'Idk', 'Krystian Andrzej', 'Rejtana', 123456789, 'Idk@gmail.com');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klient`
--

CREATE TABLE `klient` (
  `klient_id` int(11) NOT NULL,
  `nazwa` varchar(255) NOT NULL,
  `wlasciciel` varchar(255) NOT NULL,
  `adres` varchar(255) NOT NULL,
  `telefon` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `rabat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `klient`
--

INSERT INTO `klient` (`klient_id`, `nazwa`, `wlasciciel`, `adres`, `telefon`, `email`, `rabat`) VALUES
(1, 'Szkola Nr.5', 'Andrzej Gierek', 'Nisko', 741258963, 'Szkola@gmail.com', 5),
(2, 'MediaExpert', 'Andrzej Andrzej', 'Stalowa Wola', 852369741, 'Media@gmail.com', 2),
(3, 'MediaMarkt', 'Pawel Bolec', 'Krakowska 16', 852369741, 'Media@gmail.com', 5),
(5, 'Przykladowy Klient', 'Adam Kowalski', 'Rzeszów, Okulickiego 7', 865432, 'klient@o2.pl', 0),
(6, 'Idk', 'Krystian Andrzej', 'Rejtana', 123456789, 'Idk@gmail.com', 2),
(7, 'Idk', 'Krystian Andrzej', 'Rejtana', 123456789, 'Idk@gmail.com', 2),
(8, 'Idk', 'Krystian Andrzej', 'Rejtana', 123456789, 'Idk@gmail.com', 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `produkt`
--

CREATE TABLE `produkt` (
  `produkt_id` int(11) NOT NULL,
  `nazwa` varchar(255) NOT NULL,
  `cena_jednostkowa` float NOT NULL,
  `data_waznosci` date NOT NULL,
  `ilosc` int(11) NOT NULL,
  `polozenie` varchar(30) NOT NULL,
  `dostawca_importer_id` int(11) DEFAULT NULL,
  `kraj_pochodzenia` varchar(255) NOT NULL,
  `data_przyjecia` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `produkt`
--

INSERT INTO `produkt` (`produkt_id`, `nazwa`, `cena_jednostkowa`, `data_waznosci`, `ilosc`, `polozenie`, `dostawca_importer_id`, `kraj_pochodzenia`, `data_przyjecia`) VALUES
(1, 'Acer Aspire  69', 1200, '2017-03-31', 150, '1a', NULL, 'Czechy', '0000-00-00'),
(2, 'Asus RamPage', 2000, '2017-04-19', 1500, '4b', NULL, 'Polska', '0000-00-00'),
(3, 'Dell Vostro', 2500, '2017-05-21', 200, '2a', 3, 'Niemcy', '0000-00-00'),
(4, 'Dell Inspiron', 2500, '2017-05-12', 2500, '1', 3, 'Polska', '0000-00-00'),
(5, 'Acer Predator one', 5000, '2017-08-10', 10, '2', NULL, 'Polska', '0000-00-00'),
(7, 'Asus ladowarka 5.5x2.5', 60, '2017-06-15', 40, '4h', 4, 'Polska', '2017-06-04'),
(8, 'Acer ladowarka 5.5x1.7', 65, '2017-06-22', 140, '47o', 4, 'Niemcy', '2017-06-04');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `produkt_temp`
--

CREATE TABLE `produkt_temp` (
  `produkt_temp_id` int(11) NOT NULL,
  `nazwa` varchar(255) NOT NULL,
  `cena_jednostkowa` float NOT NULL,
  `data_waznosci` date NOT NULL,
  `ilosc` int(11) NOT NULL,
  `polozenie` varchar(30) NOT NULL,
  `kraj_pochodzenia` varchar(255) NOT NULL,
  `przyjecie_id` int(11) DEFAULT NULL,
  `dostawca_importer_id` int(11) DEFAULT NULL,
  `data_przyjecia` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `produkt_temp`
--

INSERT INTO `produkt_temp` (`produkt_temp_id`, `nazwa`, `cena_jednostkowa`, `data_waznosci`, `ilosc`, `polozenie`, `kraj_pochodzenia`, `przyjecie_id`, `dostawca_importer_id`, `data_przyjecia`) VALUES
(3, 'SteelSeries', 250, '2017-06-05', 100, '4a', 'Polska', NULL, 3, '2017-06-12'),
(4, 'SteelSeries', 250, '2017-06-05', 100, '4a', 'Polska', NULL, 3, '2017-06-12'),
(5, 'SteelSeries', 250, '2017-06-05', 100, '4a', 'Polska', NULL, 3, '2017-06-12'),
(6, 'Logic', 250, '2017-06-05', 100, '4a', 'Polska', NULL, 3, '2017-06-12');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `produkt_zamowienie`
--

CREATE TABLE `produkt_zamowienie` (
  `produkt_zamowienie_id` int(11) NOT NULL,
  `produkt_id` int(11) DEFAULT NULL,
  `zamowienie_id` int(11) DEFAULT NULL,
  `ilosc` int(11) NOT NULL,
  `cena_jednostkowa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `produkt_zamowienie`
--

INSERT INTO `produkt_zamowienie` (`produkt_zamowienie_id`, `produkt_id`, `zamowienie_id`, `ilosc`, `cena_jednostkowa`) VALUES
(58, 7, 60, 10, 1),
(59, 7, 60, 10, 1),
(60, 8, 61, 10, 65);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `przyjecie`
--

CREATE TABLE `przyjecie` (
  `przyjecie_id` int(11) NOT NULL,
  `uzytkownik_id` int(11) DEFAULT NULL,
  `data_przyjecia` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `raport`
--

CREATE TABLE `raport` (
  `raport_id` int(11) NOT NULL,
  `typ` varchar(255) NOT NULL,
  `data_wygenerowania` date NOT NULL,
  `uzytkownik_id` int(11) DEFAULT NULL,
  `sciezka` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `raport`
--

INSERT INTO `raport` (`raport_id`, `typ`, `data_wygenerowania`, `uzytkownik_id`, `sciezka`) VALUES
(2, 'Daty waznosci', '2017-06-12', 9999, 'reports\\RaportWaznosci2017-06-12.pdf'),
(3, 'Raport Przyjecia', '2017-06-12', 9999, 'reports\\RaportPrzyjecia2017-06-12.pdf');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownik`
--

CREATE TABLE `uzytkownik` (
  `uzytkownik_id` int(11) NOT NULL,
  `imie` varchar(255) NOT NULL,
  `nazwisko` varchar(255) NOT NULL,
  `uprawnienia` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `haslo` varchar(255) NOT NULL,
  `uwagi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `uzytkownik`
--

INSERT INTO `uzytkownik` (`uzytkownik_id`, `imie`, `nazwisko`, `uprawnienia`, `login`, `haslo`, `uwagi`) VALUES
(9996, 'pracownik', 'pracownik', 'Pracownik', 'pracownik', 'c03b3aa75cdf246f09a542ed8bb4ab64fc23ee92', 'pracownik'),
(9997, 'ksiegowy', 'ksiegowy', 'Ksiegowy', 'ksiegowy', '2ad663609bc03fa55656195e0ef31c712dfb00d2', 'ksiegowy'),
(9998, 'kierownik', 'kierownik', 'Kierownik', 'kierownik', 'ff0279b12df077564430fc4f50706c17aafd4544', 'kierownik'),
(9999, 'admin', 'admin', 'admin', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'admin');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienie`
--

CREATE TABLE `zamowienie` (
  `zamowienie_id` int(11) NOT NULL,
  `klient_id` int(11) DEFAULT NULL,
  `uzytkownik_id` int(11) DEFAULT NULL,
  `uwagi` varchar(255) NOT NULL,
  `wartosc` int(11) NOT NULL,
  `stan` varchar(155) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `zamowienie`
--

INSERT INTO `zamowienie` (`zamowienie_id`, `klient_id`, `uzytkownik_id`, `uwagi`, `wartosc`, `stan`) VALUES
(59, 5, 9998, '', 1, 'Wykonane'),
(60, 5, 9998, '', 2, 'Wykonane'),
(61, 2, 9999, '', 65, 'Nowe');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `dostawca_importer`
--
ALTER TABLE `dostawca_importer`
  ADD PRIMARY KEY (`dostawca_importer_id`),
  ADD KEY `dostawca_importer_id` (`dostawca_importer_id`),
  ADD KEY `dostawca_importer_id_2` (`dostawca_importer_id`);

--
-- Indexes for table `klient`
--
ALTER TABLE `klient`
  ADD PRIMARY KEY (`klient_id`);

--
-- Indexes for table `produkt`
--
ALTER TABLE `produkt`
  ADD PRIMARY KEY (`produkt_id`),
  ADD KEY `dostawca_importer_id` (`dostawca_importer_id`);

--
-- Indexes for table `produkt_temp`
--
ALTER TABLE `produkt_temp`
  ADD PRIMARY KEY (`produkt_temp_id`),
  ADD KEY `przyjecie_id` (`przyjecie_id`),
  ADD KEY `dostawca_importer_id` (`dostawca_importer_id`);

--
-- Indexes for table `produkt_zamowienie`
--
ALTER TABLE `produkt_zamowienie`
  ADD PRIMARY KEY (`produkt_zamowienie_id`),
  ADD KEY `produkt_id` (`produkt_id`,`zamowienie_id`),
  ADD KEY `produkt_zamowienie_ibfk_2` (`zamowienie_id`);

--
-- Indexes for table `przyjecie`
--
ALTER TABLE `przyjecie`
  ADD PRIMARY KEY (`przyjecie_id`),
  ADD KEY `uzytkownik_id` (`uzytkownik_id`);

--
-- Indexes for table `raport`
--
ALTER TABLE `raport`
  ADD PRIMARY KEY (`raport_id`),
  ADD KEY `uzytkownik_id` (`uzytkownik_id`);

--
-- Indexes for table `uzytkownik`
--
ALTER TABLE `uzytkownik`
  ADD PRIMARY KEY (`uzytkownik_id`);

--
-- Indexes for table `zamowienie`
--
ALTER TABLE `zamowienie`
  ADD PRIMARY KEY (`zamowienie_id`),
  ADD KEY `klient_id` (`klient_id`,`uzytkownik_id`),
  ADD KEY `uzytkownik_id` (`uzytkownik_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `dostawca_importer`
--
ALTER TABLE `dostawca_importer`
  MODIFY `dostawca_importer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT dla tabeli `klient`
--
ALTER TABLE `klient`
  MODIFY `klient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT dla tabeli `produkt`
--
ALTER TABLE `produkt`
  MODIFY `produkt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT dla tabeli `produkt_temp`
--
ALTER TABLE `produkt_temp`
  MODIFY `produkt_temp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT dla tabeli `produkt_zamowienie`
--
ALTER TABLE `produkt_zamowienie`
  MODIFY `produkt_zamowienie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT dla tabeli `przyjecie`
--
ALTER TABLE `przyjecie`
  MODIFY `przyjecie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT dla tabeli `raport`
--
ALTER TABLE `raport`
  MODIFY `raport_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT dla tabeli `uzytkownik`
--
ALTER TABLE `uzytkownik`
  MODIFY `uzytkownik_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10000;
--
-- AUTO_INCREMENT dla tabeli `zamowienie`
--
ALTER TABLE `zamowienie`
  MODIFY `zamowienie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `produkt`
--
ALTER TABLE `produkt`
  ADD CONSTRAINT `produkt_ibfk_1` FOREIGN KEY (`dostawca_importer_id`) REFERENCES `dostawca_importer` (`dostawca_importer_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `produkt_temp`
--
ALTER TABLE `produkt_temp`
  ADD CONSTRAINT `produkt_temp_ibfk_1` FOREIGN KEY (`przyjecie_id`) REFERENCES `przyjecie` (`przyjecie_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `produkt_temp_ibfk_2` FOREIGN KEY (`dostawca_importer_id`) REFERENCES `dostawca_importer` (`dostawca_importer_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `produkt_zamowienie`
--
ALTER TABLE `produkt_zamowienie`
  ADD CONSTRAINT `produkt_zamowienie_ibfk_1` FOREIGN KEY (`produkt_id`) REFERENCES `produkt` (`produkt_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `produkt_zamowienie_ibfk_2` FOREIGN KEY (`zamowienie_id`) REFERENCES `zamowienie` (`zamowienie_id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Ograniczenia dla tabeli `przyjecie`
--
ALTER TABLE `przyjecie`
  ADD CONSTRAINT `przyjecie_ibfk_1` FOREIGN KEY (`uzytkownik_id`) REFERENCES `uzytkownik` (`uzytkownik_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `raport`
--
ALTER TABLE `raport`
  ADD CONSTRAINT `raport_ibfk_1` FOREIGN KEY (`uzytkownik_id`) REFERENCES `uzytkownik` (`uzytkownik_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `zamowienie`
--
ALTER TABLE `zamowienie`
  ADD CONSTRAINT `zamowienie_ibfk_1` FOREIGN KEY (`klient_id`) REFERENCES `klient` (`klient_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `zamowienie_ibfk_2` FOREIGN KEY (`uzytkownik_id`) REFERENCES `uzytkownik` (`uzytkownik_id`) ON DELETE SET NULL ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
