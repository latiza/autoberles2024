-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Feb 27. 07:59
-- Kiszolgáló verziója: 10.4.27-MariaDB
-- PHP verzió: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `autoberlespm`
--
CREATE DATABASE IF NOT EXISTS `autoberlespm` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `autoberlespm`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `bodytype`
--

CREATE TABLE `bodytype` (
  `BodyTypeID` int(11) NOT NULL,
  `BodyTypeName` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `bodytype`
--

INSERT INTO `bodytype` (`BodyTypeID`, `BodyTypeName`) VALUES
(1, 'Kombi'),
(2, 'Szedán'),
(3, 'Kupé'),
(4, 'Ferdehátú'),
(5, 'Kabrió'),
(6, 'Terepjáró');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `brand`
--

CREATE TABLE `brand` (
  `BrandID` int(11) NOT NULL,
  `BrandName` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `brand`
--

INSERT INTO `brand` (`BrandID`, `BrandName`) VALUES
(1, 'Suzuki'),
(2, 'Volkswagen'),
(3, 'Mercedes'),
(4, 'Audi'),
(5, 'Volvo'),
(6, 'Opel'),
(7, 'Mini');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `car`
--

CREATE TABLE `car` (
  `CarID` int(11) NOT NULL,
  `ModelID` int(11) NOT NULL,
  `BodyTypeID` int(11) DEFAULT NULL,
  `FuelID` int(11) DEFAULT NULL,
  `DriveID` int(11) DEFAULT NULL,
  `TransmissionID` int(11) DEFAULT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `Picture` varchar(255) NOT NULL,
  `Color` varchar(10) DEFAULT NULL,
  `Engine` varchar(20) DEFAULT NULL,
  `Performance` varchar(6) DEFAULT NULL,
  `Seats` int(11) DEFAULT NULL,
  `ProductionYear` int(11) DEFAULT NULL,
  `AirConditioning` tinyint(4) DEFAULT NULL,
  `Deposit` int(11) DEFAULT NULL,
  `PricePerDay` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `car`
--

INSERT INTO `car` (`CarID`, `ModelID`, `BodyTypeID`, `FuelID`, `DriveID`, `TransmissionID`, `Description`, `Picture`, `Color`, `Engine`, `Performance`, `Seats`, `ProductionYear`, `AirConditioning`, `Deposit`, `PricePerDay`) VALUES
(1, 1, 6, 1, 3, 2, 'A Suzuki Vitara (2015) egy kompakt SUV típusú jármű, amelyet a japán Suzuki gyártott. A jármű a középkategóriába tartozik, és sok tekintetben kiváló teljesítményt nyújt. A Vitara jellegzetes és vonzó megjelenéssel rendelkezik, amely egyszerre modern és sportos. A jármű könnyű és erős konstrukcióval rendelkezik, amely biztosítja a kiváló menettulajdonságokat és a hosszú élettartamot.', '', 'Piros', '1586', '120', 5, 2015, 1, 60000, 15000),
(2, 2, 4, 1, 1, 1, '', '', 'Kék', '1328', '92', 5, 2007, 0, 25000, 11000),
(3, 3, 1, 2, 1, 1, '', '', 'Szürke', '1896', '105', 5, 2007, 1, 35000, 14500),
(4, 4, 4, 1, 1, 1, '', '', 'Fekete', '1198', '69', 5, 2009, 1, 30000, 12500),
(5, 5, 4, 1, 4, 2, '', '', 'Szürke', '1991', '306', 5, 2020, 1, 280000, 55000),
(6, 6, 2, 2, 2, 2, '', '', 'Fekete', '1950', '194', 5, 2019, 1, 300000, 70000),
(7, 7, 5, 2, 1, 1, '', '', 'Szürke', '1598', '110', 4, 2014, 1, 130000, 35000),
(8, 8, 1, 2, 4, 2, '', '', 'Fehér', '2967', '272', 5, 2017, 1, 180000, 50000),
(9, 9, 6, 2, 1, 2, '', '', 'Ezüst', '2400', '175', 5, 2010, 1, 200000, 30000),
(10, 10, 2, 1, 1, 1, '', '', 'Ezüst', '2435', '170', 5, 2000, 0, 80000, 17000),
(11, 11, 1, 2, 1, 2, '', '', 'Szürke', '1956', '165', 5, 2011, 1, 140000, 22000),
(12, 12, 3, 2, 2, 1, '', '', 'Fekete', '1956', '131', 5, 2011, 1, 150000, 25000),
(13, 13, 3, 1, 2, 1, '', '', 'Sötétezüst', '1598', '163', 4, 2002, 0, 120000, 25000);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `carmodel`
--

CREATE TABLE `carmodel` (
  `ModelID` int(11) NOT NULL,
  `BrandID` int(11) NOT NULL,
  `CarModelName` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `carmodel`
--

INSERT INTO `carmodel` (`ModelID`, `BrandID`, `CarModelName`) VALUES
(1, 1, 'Vitara'),
(2, 1, 'Swift'),
(3, 2, 'Golf V'),
(4, 2, 'Polo V'),
(5, 3, 'A35'),
(6, 3, 'E220'),
(7, 4, 'A3'),
(8, 4, 'A6'),
(9, 5, 'XC60'),
(10, 5, 'S60'),
(11, 6, 'Astra'),
(12, 6, 'Insignia'),
(13, 7, 'Cooper S');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `drivetype`
--

CREATE TABLE `drivetype` (
  `DriveID` int(11) NOT NULL,
  `DriveName` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `drivetype`
--

INSERT INTO `drivetype` (`DriveID`, `DriveName`) VALUES
(1, 'FWD'),
(2, 'RWD'),
(3, '4WD'),
(4, 'AWD');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `fueltype`
--

CREATE TABLE `fueltype` (
  `FuelID` int(11) NOT NULL,
  `FuelName` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `fueltype`
--

INSERT INTO `fueltype` (`FuelID`, `FuelName`) VALUES
(1, 'Benzin'),
(2, 'Dízel');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `renter`
--

CREATE TABLE `renter` (
  `RenterID` int(11) NOT NULL,
  `SettlementID` int(11) DEFAULT NULL,
  `Firstname` varchar(30) DEFAULT NULL,
  `Surename` varchar(30) DEFAULT NULL,
  `TelephoneNumber` varchar(12) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Password` varchar(255) NOT NULL,
  `Street` varchar(20) DEFAULT NULL,
  `Address` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `renter`
--

INSERT INTO `renter` (`RenterID`, `SettlementID`, `Firstname`, `Surename`, `TelephoneNumber`, `Email`, `Password`, `Street`, `Address`) VALUES
(1, 1, 'Szabolcs', 'Beke', '06501234567', 'bekeszabi26@gmail.com', '', 'Jópalócok', '7'),
(2, 2, 'Milán', 'Szlobodnyik', '06201234567', 'munyika2003@gmail.com', '', 'Gácsi', '54');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `reservation`
--

CREATE TABLE `reservation` (
  `ReservationID` int(11) NOT NULL,
  `RenterID` int(11) DEFAULT NULL,
  `CarID` int(11) DEFAULT NULL,
  `StartingDay` date DEFAULT NULL,
  `EndingDay` date NOT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `reservation`
--

INSERT INTO `reservation` (`ReservationID`, `RenterID`, `CarID`, `StartingDay`, `EndingDay`, `TimeStamp`) VALUES
(1, 1, 13, '2023-12-20', '2023-12-30', '2023-12-16 23:00:00'),
(2, 2, 11, '2023-11-13', '2024-02-21', '2023-11-09 23:00:00');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `settlement`
--

CREATE TABLE `settlement` (
  `SettlementID` int(11) NOT NULL,
  `SettlementName` varchar(20) DEFAULT NULL,
  `ZipCode` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `settlement`
--

INSERT INTO `settlement` (`SettlementID`, `SettlementName`, `ZipCode`) VALUES
(1, 'Balassagyarmat', '2660'),
(2, 'Bercel', '2687');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `transmissiontype`
--

CREATE TABLE `transmissiontype` (
  `TransmissionID` int(11) NOT NULL,
  `TransmissionType` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `transmissiontype`
--

INSERT INTO `transmissiontype` (`TransmissionID`, `TransmissionType`) VALUES
(1, 'Manuális'),
(2, 'Automata');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `bodytype`
--
ALTER TABLE `bodytype`
  ADD PRIMARY KEY (`BodyTypeID`);

--
-- A tábla indexei `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`BrandID`);

--
-- A tábla indexei `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`CarID`),
  ADD KEY `BodyTypeID` (`BodyTypeID`),
  ADD KEY `FuelID` (`FuelID`),
  ADD KEY `TransmissionID` (`TransmissionID`),
  ADD KEY `DriveID` (`DriveID`),
  ADD KEY `ModelID` (`ModelID`);

--
-- A tábla indexei `carmodel`
--
ALTER TABLE `carmodel`
  ADD PRIMARY KEY (`ModelID`),
  ADD KEY `BrandID` (`BrandID`);

--
-- A tábla indexei `drivetype`
--
ALTER TABLE `drivetype`
  ADD PRIMARY KEY (`DriveID`);

--
-- A tábla indexei `fueltype`
--
ALTER TABLE `fueltype`
  ADD PRIMARY KEY (`FuelID`);

--
-- A tábla indexei `renter`
--
ALTER TABLE `renter`
  ADD PRIMARY KEY (`RenterID`),
  ADD KEY `SettlementID` (`SettlementID`);

--
-- A tábla indexei `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`ReservationID`),
  ADD KEY `RenterID` (`RenterID`),
  ADD KEY `CarID` (`CarID`);

--
-- A tábla indexei `settlement`
--
ALTER TABLE `settlement`
  ADD PRIMARY KEY (`SettlementID`);

--
-- A tábla indexei `transmissiontype`
--
ALTER TABLE `transmissiontype`
  ADD PRIMARY KEY (`TransmissionID`);

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `brand`
--
ALTER TABLE `brand`
  ADD CONSTRAINT `brand_ibfk_1` FOREIGN KEY (`BrandID`) REFERENCES `carmodel` (`BrandID`);

--
-- Megkötések a táblához `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`BodyTypeID`) REFERENCES `bodytype` (`BodyTypeID`),
  ADD CONSTRAINT `car_ibfk_2` FOREIGN KEY (`FuelID`) REFERENCES `fueltype` (`FuelID`),
  ADD CONSTRAINT `car_ibfk_4` FOREIGN KEY (`DriveID`) REFERENCES `drivetype` (`DriveID`),
  ADD CONSTRAINT `car_ibfk_5` FOREIGN KEY (`TransmissionID`) REFERENCES `transmissiontype` (`TransmissionID`),
  ADD CONSTRAINT `car_ibfk_6` FOREIGN KEY (`ModelID`) REFERENCES `carmodel` (`ModelID`);

--
-- Megkötések a táblához `renter`
--
ALTER TABLE `renter`
  ADD CONSTRAINT `renter_ibfk_1` FOREIGN KEY (`SettlementID`) REFERENCES `settlement` (`SettlementID`);

--
-- Megkötések a táblához `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`RenterID`) REFERENCES `renter` (`RenterID`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`CarID`) REFERENCES `car` (`CarID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
