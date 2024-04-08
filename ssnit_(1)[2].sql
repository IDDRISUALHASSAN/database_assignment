-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2024 at 10:41 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ssnit`
--

-- --------------------------------------------------------

--
-- Table structure for table `beneficiary`
--

CREATE TABLE `beneficiary` (
  `id` int(11) AUTO_INCREMENT NOT NULL`
  `benefictType` varchar(15) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `benefictingID` int(11) NOT NULL,
  `memberID` int(11) DEFAULT NULL,
  `employerID` int(11) DEFAULT NULL,
  `dependentID` int(11) DEFAULT NULL,
  `benefictingAmount` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contribution`
--

CREATE TABLE `contribution` (
  `id` int(11) AUTO_INCREMENT NOT NUL
  `contributionID` int(11) NOT NULL,
  `memberID` int(11) DEFAULT NULL,
  `employerID` int(11) DEFAULT NULL,
  `contributingDate` date DEFAULT NULL,
  `contributingAmount` float DEFAULT NULL,
  `totalAmountContributed` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dependent`
--

CREATE TABLE `dependent` (
  `id` int(11) AUTO_INCREMENT NOT NUL
  `surname` varchar(15) DEFAULT NULL,
  `otherName` varchar(30) DEFAULT NULL,
  `teleNumber` int(11) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `gender` varchar(9) DEFAULT NULL,
  `relationship` varchar(15) DEFAULT NULL,
  `dependentID` int(11) NOT NULL,
  `memberID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employer`
--

CREATE TABLE `employer` (
  `id` int(11) AUTO_INCREMENT NOT NUL
  `surname` varchar(15) DEFAULT NULL,
  `otherNames` varchar(30) DEFAULT NULL,
  `teleNumber` int(11) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `gender` varchar(9) DEFAULT NULL,
  `employerID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id` int(11) AUTO_INCREMENT NOT NUL
  `surname` varchar(15) DEFAULT NULL,
  `otherNames` varchar(30) DEFAULT NULL,
  `teleNumber` int(11) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `gender` varchar(9) DEFAULT NULL,
  `memberID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `beneficiary`
--
ALTER TABLE `beneficiary`
  ADD PRIMARY KEY (`benefictingID`),
  ADD KEY `memberID` (`memberID`),
  ADD KEY `employerID` (`employerID`),
  ADD KEY `dependentID` (`dependentID`);

--
-- Indexes for table `contribution`
--
ALTER TABLE `contribution`
  ADD PRIMARY KEY (`contributionID`),
  ADD KEY `memberID` (`memberID`),
  ADD KEY `employerID` (`employerID`);

--
-- Indexes for table `dependent`
--
ALTER TABLE `dependent`
  ADD PRIMARY KEY (`dependentID`),
  ADD KEY `memberID` (`memberID`);

--
-- Indexes for table `employer`
--
ALTER TABLE `employer`
  ADD PRIMARY KEY (`employerID`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`memberID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `beneficiary`
--
ALTER TABLE `beneficiary`
  MODIFY `benefictingID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contribution`
--
ALTER TABLE `contribution`
  MODIFY `contributionID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dependent`
--
ALTER TABLE `dependent`
  MODIFY `dependentID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employer`
--
ALTER TABLE `employer`
  MODIFY `employerID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `memberID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `beneficiary`
--
ALTER TABLE `beneficiary`
  ADD CONSTRAINT `beneficiary_ibfk_1` FOREIGN KEY (`memberID`) REFERENCES `member` (`memberID`),
  ADD CONSTRAINT `beneficiary_ibfk_2` FOREIGN KEY (`employerID`) REFERENCES `employer` (`employerID`),
  ADD CONSTRAINT `beneficiary_ibfk_3` FOREIGN KEY (`dependentID`) REFERENCES `dependent` (`dependentID`);

--
-- Constraints for table `contribution`
--
ALTER TABLE `contribution`
  ADD CONSTRAINT `contribution_ibfk_1` FOREIGN KEY (`memberID`) REFERENCES `member` (`memberID`),
  ADD CONSTRAINT `contribution_ibfk_2` FOREIGN KEY (`employerID`) REFERENCES `employer` (`employerID`);

--
-- Constraints for table `dependent`
--
ALTER TABLE `dependent`
  ADD CONSTRAINT `dependent_ibfk_1` FOREIGN KEY (`memberID`) REFERENCES `member` (`memberID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
