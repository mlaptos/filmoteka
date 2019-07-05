-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 05, 2019 at 08:08 PM
-- Server version: 10.1.39-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `videoteka`
--

-- --------------------------------------------------------

--
-- Table structure for table `film`
--

CREATE TABLE `film` (
  `idFilm` int(11) NOT NULL,
  `naslov` varchar(45) NOT NULL,
  `redatelj` varchar(30) NOT NULL,
  `glumci` tinytext NOT NULL,
  `opis` mediumtext NOT NULL,
  `trajanje` varchar(45) NOT NULL,
  `blagajna` varchar(45) NOT NULL,
  `poster` varchar(240) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

--
-- Dumping data for table `film`
--

INSERT INTO `film` (`idFilm`, `naslov`, `redatelj`, `glumci`, `opis`, `trajanje`, `blagajna`, `poster`) VALUES
(1, 'Guardians of the Galaxy', 'James Gunn', 'Chris Pratt, Zoe Saldana, Dave Bautista, Vin Diesel, Bradley Cooper', 'Grupa međugalaktičkih kriminalaca mora zaustavit fanatične ratnike u pohodu na osvajanje svemira', '2h 1min', '773, 3 milijuna USD', 'cuvarigalaksije.jpg'),
(2, 'Pokemon Detective Pikachu', 'Rob Letterman', 'Ryan Reynolds, Justice Smith, Kathryn Newton', 'U svijetu gdje ljudi sakupljaju Pokemone kako bi se borili, dječak naleti na inteligentnog Pikachua koji zna pričati te uz to želi postati detektiv.', '1h 44min', '130 milijuna USD', 'pikachu.jpg'),
(3, 'Ready Player One', 'Steven Spielberg', 'T.J. Miller, Olivia Cooke, Tye Sheridan, Hannah John-Kamen, Letitia Wright', 'Kada kreator svijeta virtualne stvarnosti zvane OASIS umre, izbaci video u kojem izaziva sve korisnike OASIS-a da pronađu \"Easter Eggove\" koji će pronalazaču dati blago.', '2h 20min', '582, 9 milijuna USD', 'igrac1.jpg'),
(4, 'Deadpool 2', 'David Leitch', 'Ryan Reynolds, Rhett Reese, Paul Wernick', 'placeholder', '2h 15min', '785 milijuna USD', 'dp2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE `korisnik` (
  `idKorisnik` int(11) NOT NULL,
  `ime` varchar(45) NOT NULL,
  `prezime` varchar(45) NOT NULL,
  `email` varchar(30) NOT NULL,
  `lozinka` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`idKorisnik`, `ime`, `prezime`, `email`, `lozinka`) VALUES
(1, 'test1', 'test1', 'test@gmail.com', 'qwer1234'),
(2, 'test2', 'test2', 'test2@gmail.com', 'test1234'),
(3, 'test3', 'test3', 'test3@gmail.com', 'qwer1234'),
(4, 'test4', 'test4', 'test4@gmail.com', 'test1234'),
(5, 'test5', 'test5', 'test5@gmail.com', 'test1234'),
(6, 'test6', 'test6', 'test6@gmail.com', 'qwer1234'),
(7, 'test7', 'test7', 'test7@gmail.com', 'asdf1234'),
(8, 'test8', 'test8', 'test8@gmail.com', 'qwer1234'),
(9, 'admin', 'admin', 'admin@gmail.com', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `zanr`
--

CREATE TABLE `zanr` (
  `idZanr` int(11) NOT NULL,
  `nazivZanra` varchar(45) NOT NULL,
  `film_idFilm` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

--
-- Dumping data for table `zanr`
--

INSERT INTO `zanr` (`idZanr`, `nazivZanra`, `film_idFilm`) VALUES
(1, 'Znanstvena-Fantastika', 1),
(2, 'Akcijska-Avantura', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`idFilm`);

--
-- Indexes for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD PRIMARY KEY (`idKorisnik`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`) USING BTREE;

--
-- Indexes for table `zanr`
--
ALTER TABLE `zanr`
  ADD PRIMARY KEY (`idZanr`),
  ADD UNIQUE KEY `fk_zanr_film` (`film_idFilm`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `film`
--
ALTER TABLE `film`
  MODIFY `idFilm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `korisnik`
--
ALTER TABLE `korisnik`
  MODIFY `idKorisnik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `zanr`
--
ALTER TABLE `zanr`
  MODIFY `idZanr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `zanr`
--
ALTER TABLE `zanr`
  ADD CONSTRAINT `zanr_ibfk_1` FOREIGN KEY (`film_idFilm`) REFERENCES `film` (`idFilm`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
