-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 26, 2023 at 08:14 PM
-- Server version: 8.0.31
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `patientportal`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `AppointmentID` int NOT NULL,
  `PatientID` int DEFAULT NULL,
  `DoctorID` int DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Type` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE `billing` (
  `BillingID` int NOT NULL,
  `PatientID` int DEFAULT NULL,
  `Details` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `InsuranceName` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `InsuranceNumber` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Address` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CreditNumber` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `ChatID` int NOT NULL,
  `PatientID` int DEFAULT NULL,
  `DoctorID` int DEFAULT NULL,
  `Message` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `diagnoses`
--

CREATE TABLE `diagnoses` (
  `DiagnosesID` int NOT NULL,
  `DoctorID` int DEFAULT NULL,
  `PatientID` int DEFAULT NULL,
  `Description` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `DoctorID` int NOT NULL,
  `UserID` int DEFAULT NULL,
  `FirstName` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LastName` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `family`
--

CREATE TABLE `family` (
  `FamilyID` int NOT NULL,
  `Email` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `PatientID` int NOT NULL,
  `UserID` int DEFAULT NULL,
  `FamilyID` int DEFAULT NULL,
  `FirstName` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LastName` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `EmergencyName` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EmergencyPhoneNumber` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Allergies` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Conditions` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ExistingIllnesses` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `BloodPressure` int DEFAULT NULL,
  `SugarLevels` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `PrescriptionID` int NOT NULL,
  `DoctorID` int DEFAULT NULL,
  `PatientID` int DEFAULT NULL,
  `Name` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Dosage` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refill`
--

CREATE TABLE `refill` (
  `RefillID` int NOT NULL,
  `PrescriptionID` int DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Status` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `script`
--

CREATE TABLE `script` (
  `TypeOfScript` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `DoctorID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `secretary`
--

CREATE TABLE `secretary` (
  `SecretaryID` int NOT NULL,
  `UserID` int DEFAULT NULL,
  `FirstName` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LastName` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `TestID` int NOT NULL,
  `PatientID` int DEFAULT NULL,
  `DoctorID` int DEFAULT NULL,
  `TestName` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Result` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Description` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TypeOfTest` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Reason` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userid`
--

CREATE TABLE `userid` (
  `UserID` int NOT NULL,
  `UserName` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Password` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Email` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`AppointmentID`);

--
-- Indexes for table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`BillingID`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`ChatID`);

--
-- Indexes for table `diagnoses`
--
ALTER TABLE `diagnoses`
  ADD PRIMARY KEY (`DiagnosesID`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`DoctorID`);

--
-- Indexes for table `family`
--
ALTER TABLE `family`
  ADD PRIMARY KEY (`FamilyID`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`PatientID`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`PrescriptionID`);

--
-- Indexes for table `refill`
--
ALTER TABLE `refill`
  ADD PRIMARY KEY (`RefillID`);

--
-- Indexes for table `script`
--
ALTER TABLE `script`
  ADD PRIMARY KEY (`TypeOfScript`);

--
-- Indexes for table `secretary`
--
ALTER TABLE `secretary`
  ADD PRIMARY KEY (`SecretaryID`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`TestID`);

--
-- Indexes for table `userid`
--
ALTER TABLE `userid`
  ADD PRIMARY KEY (`UserID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
