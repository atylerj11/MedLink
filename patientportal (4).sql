-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 24, 2023 at 01:54 PM
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
  `PatientID` int NOT NULL,
  `DoctorID` int NOT NULL,
  `TestID` int NOT NULL,
  `DiagnosesID` int NOT NULL,
  `Date` date NOT NULL,
  `Time` time DEFAULT NULL,
  `Type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AppointSummary` varchar(500) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`AppointmentID`, `PatientID`, `DoctorID`, `TestID`, `DiagnosesID`, `Date`, `Time`, `Type`, `AppointSummary`) VALUES
(1, 1, 1, 0, 0, '2023-10-10', '10:30:00', 'Checkup', ''),
(2, 2, 1, 0, 0, '2023-10-12', '11:00:00', 'Follow-up', ''),
(3, 3, 1, 0, 0, '2023-10-15', '11:30:00', 'Consultation', ''),
(4, 4, 1, 0, 0, '2023-10-18', '12:00:00', 'Checkup', ''),
(5, 5, 1, 0, 0, '2023-10-20', '12:30:00', 'Follow-up', ''),
(6, 6, 2, 0, 0, '2023-10-22', '13:30:00', 'Consultation', ''),
(7, 7, 2, 0, 0, '2023-10-25', '14:00:00', 'Checkup', ''),
(8, 8, 2, 0, 0, '2023-10-28', '10:00:00', 'Follow-up', ''),
(9, 9, 2, 0, 0, '2023-10-31', '11:00:00', 'Consultation', ''),
(10, 10, 2, 0, 0, '2023-11-02', '12:00:00', 'Checkup', ''),
(11, 11, 3, 0, 0, '2023-11-05', '12:30:00', 'Follow-up', ''),
(12, 12, 3, 0, 0, '2023-11-08', '13:30:00', 'Consultation', ''),
(13, 13, 3, 0, 0, '2023-11-11', '12:30:00', 'Checkup', ''),
(14, 14, 3, 0, 0, '2023-11-14', '14:30:00', 'Follow-up', ''),
(15, 15, 3, 0, 0, '2023-11-17', '14:00:00', 'Consultation', ''),
(16, 16, 4, 0, 0, '2023-11-20', '15:00:00', 'Checkup', ''),
(17, 17, 4, 0, 0, '2023-11-23', '12:00:00', 'Follow-up', ''),
(18, 18, 4, 0, 0, '2023-11-26', '11:00:00', 'Consultation', ''),
(19, 19, 4, 0, 0, '2023-11-29', '11:30:00', 'Checkup', ''),
(20, 20, 4, 0, 0, '2023-12-02', '12:30:00', 'Follow-up', ''),
(21, 21, 5, 0, 0, '2023-12-05', '11:00:00', 'Consultation', ''),
(22, 22, 5, 0, 0, '2023-12-08', '11:30:00', 'Checkup', ''),
(23, 23, 5, 0, 0, '2023-12-11', '15:00:00', 'Follow-up', ''),
(24, 24, 5, 0, 0, '2023-12-14', '15:30:00', 'Consultation', ''),
(25, 25, 5, 0, 0, '2023-12-17', '14:00:00', 'Checkup', '');

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
  `doctorid` int NOT NULL,
  `UserID` int DEFAULT NULL,
  `TestID` int NOT NULL,
  `DiagnosesID` int NOT NULL,
  `FirstName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LastName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doctorid`, `UserID`, `TestID`, `DiagnosesID`, `FirstName`, `LastName`) VALUES
(1, 2, 0, 0, 'Eason', 'Chang'),
(2, 3, 0, 0, 'Manpreet', 'Bhinder'),
(3, 4, 0, 0, 'Michael', 'Colella'),
(4, 5, 0, 0, 'Donovan', 'Santiago'),
(5, 6, 0, 0, 'Nafees', 'Ishraq');

-- --------------------------------------------------------

--
-- Table structure for table `fileupload`
--

CREATE TABLE `fileupload` (
  `FileID` int NOT NULL,
  `TestID` int NOT NULL,
  `FileName` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `FilePath` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `FileSize` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `PatientID` int NOT NULL,
  `UserID` int DEFAULT NULL,
  `FamilyID` int DEFAULT NULL,
  `TestID` int NOT NULL,
  `DiagnosesID` int NOT NULL,
  `FirstName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LastName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Gender` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `EmergencyName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EmergencyPhoneNumber` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Allergies` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Conditions` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ExistingIllnesses` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `BloodPressure` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SugarLevels` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`PatientID`, `UserID`, `FamilyID`, `TestID`, `DiagnosesID`, `FirstName`, `LastName`, `Gender`, `DateOfBirth`, `EmergencyName`, `EmergencyPhoneNumber`, `Allergies`, `Conditions`, `ExistingIllnesses`, `BloodPressure`, `SugarLevels`) VALUES
(1, 4, NULL, 0, 0, 'Alyssa', 'Jimenez', 'Female', '2002-07-25', 'Joyce Tola', '631-631-6310', 'No Allergies', 'No Conditions', 'No Illnesses', '180', '70'),
(2, NULL, NULL, 0, 0, 'Steven', 'Tola', 'Male', '2010-03-10', 'Joyce Tola', '631-631-6310', 'No Allergies', 'No Conditions', 'No Illnesses', '180/70', 'Normal'),
(3, NULL, NULL, 0, 0, 'Mark', 'White', 'Male', '2002-05-05', 'Ashley White', '631-344-6432', 'Pollen', 'Asthma', 'NONE', '120/80', 'Normal'),
(4, NULL, NULL, 0, 0, 'Leonard', 'Thompson', 'Male', '1981-04-21', 'John Thompson', '606-507-8418', 'Penicillin', 'Hypertension', 'Diabetes', '140/90', 'High'),
(5, NULL, NULL, 0, 0, 'Nora', 'Buckley', 'Female', '2000-04-29', 'Nicola Buckley', '434-876-1073', 'None', 'High Blood Pressure', 'Asthma', '140/90', 'High'),
(6, NULL, NULL, 0, 0, 'Sarah', 'Wilson', 'Female', '1980-03-10', 'David Wilson', '516-234-3123', 'Nuts', 'High Cholesterol', 'Arthritis', '130/85', 'High'),
(7, NULL, NULL, 0, 0, 'Emily', 'Brown', 'Female', '1995-07-25', 'Chris Brown', '516-009-9273', 'Eggs', 'Asthma', 'None', '125/78', 'Normal'),
(8, NULL, NULL, 0, 0, 'Daniel', 'Clark', 'Male', '1998-12-05', 'Maria Clark', '516-654-2002', 'Dust', 'Diabetes', 'Depression', '135/88', 'High'),
(9, NULL, NULL, 0, 0, 'Olivia', 'Anderson', 'Female', '1982-06-30', 'Michael Anderson', '516-022-1234', 'Peanuts', 'High Blood Pressure', 'None', '122/79', 'Normal'),
(10, NULL, NULL, 0, 0, 'William', 'Martinez', 'Male', '1993-04-12', 'Linda Martinez', '631-909-7621', 'Shellfish', 'Asthma', 'None', '128/83', 'Normal'),
(11, NULL, NULL, 0, 0, 'Sophia', 'Garcia', 'Female', '1997-10-18', 'Robert Garcia', '631-455-7821', 'Penicillin', 'High Cholesterol', 'Anxiety', '138/91', 'High'),
(12, NULL, NULL, 0, 0, 'James', 'Smith', 'Male', '1987-02-28', 'Jennifer Smith', '631-123-2345', 'Nuts', 'Hypertension', 'Depression', '132/86', 'High'),
(13, NULL, NULL, 0, 0, 'Ava', 'Lee', 'Female', '1991-11-14', 'Daniel Lee', '631-092-2348', 'Eggs', 'None', 'Migraine', '118/76', 'Normal'),
(14, NULL, NULL, 0, 0, 'Liam', 'Johnson', 'Male', '1989-08-07', 'Jessica Johnson', '718-672-1022', 'Pollen', 'Asthma', 'None', '126/82', 'Normal'),
(15, NULL, NULL, 0, 0, 'Mia', 'Gonzalez', 'Female', '1994-03-22', 'Anthony Gonzalez', '718-222-2222', 'Dust', 'High Cholesterol', 'Anxiety', '133/87', 'High'),
(16, NULL, NULL, 0, 0, 'Noah', 'Davis', 'Male', '1984-01-08', 'Lisa Davis', '718-333-3432', 'Shellfish', 'Hypertension', 'Depression', '129/84', 'High'),
(17, NULL, NULL, 0, 0, 'Isabella', 'Hernandez', 'Female', '1983-07-04', 'William Hernandez', '718-000-5555', 'Penicillin', 'None', 'None', '124/81', 'Normal'),
(18, NULL, NULL, 0, 0, 'Benjamin', 'Lopez', 'Male', '1996-12-30', 'Maria Lopez', '929-123-3455', 'Nuts', 'High Cholesterol', 'Migraine', '137/90', 'High'),
(19, NULL, NULL, 0, 0, 'Charlotte', 'Wilson', 'Female', '1981-09-11', 'John Wilson', '929-555-5571', 'Eggs', 'Asthma', 'Depression', '123/77', 'Normal'),
(20, NULL, NULL, 0, 0, 'Henry', 'Anderson', 'Male', '1990-05-03', 'Susan Anderson', '929-786-7381', 'Dust', 'Hypertension', 'None', '131/85', 'High'),
(21, NULL, NULL, 0, 0, 'Amelia', 'Thomas', 'Female', '1988-02-17', 'David Thomas', '929-390-0912', 'Pollen', 'None', 'Anxiety', '121/78', 'Normal'),
(22, NULL, NULL, 0, 0, 'Elijah', 'Hall', 'Male', '1999-08-25', 'Jennifer Hall', '929-505-1023', 'Shellfish', 'High Cholesterol', 'Migraine', '139/92', 'High'),
(23, NULL, NULL, 0, 0, 'Prince', 'Singh', 'Male', '1994-12-25', 'Snow Kaur', '516-234-5211', 'None', 'Asthma', 'None', '120/80', 'Normal'),
(24, NULL, NULL, 0, 0, 'Scarlet', 'Davis', 'Female', '1999-06-03', 'Cody Davis', '516-900-8715', 'Dog allergy', 'Depression', 'None', '120/80', 'Normal'),
(25, NULL, NULL, 0, 0, 'Lisa', 'Simpson', 'Female', '1975-11-13', 'Mateo Simpson', '631-2344-5142', 'None', 'None', 'None', '120/80', 'Normal');

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `PrescriptionID` int NOT NULL,
  `DoctorID` int DEFAULT NULL,
  `PatientID` int DEFAULT NULL,
  `Name` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Dosage` int DEFAULT NULL,
  `Status` varchar(25) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`PrescriptionID`, `DoctorID`, `PatientID`, `Name`, `Dosage`, `Status`) VALUES
(1, 1, 3, 'Fluticasone Propionate Inhaler', 200, ''),
(2, 1, 11, 'Atorvastatin', 40, ''),
(3, 2, 15, 'Paroxetine', 8, ''),
(4, 3, 18, 'Palforzia', 1, ''),
(5, 4, 24, 'Citalopram', 30, ''),
(6, 4, 7, 'Fluticasone Propionate Inhaler\r\n', 200, ''),
(7, 3, 6, 'Atorvastatin', 40, ''),
(8, 5, 21, 'Paroxetine', 10, ''),
(9, 5, 22, 'Palforzia', 2, ''),
(10, 5, 12, 'Citalopram', 40, '');

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
  `FirstName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LastName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `secretary`
--

INSERT INTO `secretary` (`SecretaryID`, `UserID`, `FirstName`, `LastName`) VALUES
(1, NULL, 'Barry', 'Allen'),
(2, NULL, 'Diego', 'White'),
(3, NULL, 'Edward ', 'Collins'),
(4, NULL, 'Jacob', 'Black'),
(5, NULL, 'Nick', 'Joe');

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
  `UserName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FirstName` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `LastName` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userid`
--

INSERT INTO `userid` (`UserID`, `UserName`, `Password`, `Email`, `FirstName`, `LastName`) VALUES
(1, 'atylerj11', 'password', 'atylerj11@gmail.com', '', ''),
(2, 'easonchang', '$2y$10$h2aRu8wfyQsvqkfxsCwKG.TL1dlrv2Lv83JAT8AxDL1AB8jkCPgka', 'easonchang8866@gmail.com', 'Eason', 'Chang'),
(3, 'alyssa', '$2y$10$dPyz6sYAqQFThC4a6gM3teSndCoC5HNWwRdQ4C8dvkG0sYeVOKapG', 'easonswife@gmail.com', '', ''),
(4, 'alyssa12', '$2y$10$6.Oqm5qxq6jLlLREb2EXGuMsPAGQtUuHiFrHYk/GAVTpupW3yc9km', 'easonswife@gmail.com', 'Alyssa', 'Jimenez');

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
  ADD PRIMARY KEY (`doctorid`);

--
-- Indexes for table `fileupload`
--
ALTER TABLE `fileupload`
  ADD PRIMARY KEY (`FileID`);

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

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `AppointmentID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `doctorid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `fileupload`
--
ALTER TABLE `fileupload`
  MODIFY `FileID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `PatientID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `secretary`
--
ALTER TABLE `secretary`
  MODIFY `SecretaryID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `userid`
--
ALTER TABLE `userid`
  MODIFY `UserID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
