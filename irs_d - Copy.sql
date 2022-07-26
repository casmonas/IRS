-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 25, 2022 at 08:02 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `irs`
--

-- --------------------------------------------------------

--
-- Table structure for table `categorytable`
--

CREATE TABLE `categorytable` (
  `categoryID` varchar(15) NOT NULL,
  `categoryName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categorytable`
--

INSERT INTO `categorytable` (`categoryID`, `categoryName`) VALUES
('CAT101', 'Ware House Product'),
('CAT102', 'Raw Material'),
('CAT103', 'Construction Material'),
('CAT104', 'Repair Material');

-- --------------------------------------------------------

--
-- Table structure for table `departmenttable`
--

CREATE TABLE `departmenttable` (
  `departmentID` int(10) NOT NULL,
  `departmentName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `departmenttable`
--

INSERT INTO `departmenttable` (`departmentID`, `departmentName`) VALUES
(1, 'Management');

-- --------------------------------------------------------

--
-- Table structure for table `materialtable`
--

CREATE TABLE `materialtable` (
  `materialID` int(15) NOT NULL,
  `materialName` varchar(50) NOT NULL,
  `quantity` int(10) NOT NULL,
  `categoryID` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `materialtable`
--

INSERT INTO `materialtable` (`materialID`, `materialName`, `quantity`, `categoryID`) VALUES
(67, 'Selotape', 20, 'CAT103'),
(345, 'Polyteen', 200, 'CAT101');

-- --------------------------------------------------------

--
-- Table structure for table `requesttable`
--

CREATE TABLE `requesttable` (
  `requestID` varchar(15) NOT NULL,
  `requestType` varchar(15) NOT NULL,
  `requestTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `requestStatus` enum('VERIFIED','PENDING','DECLINED') DEFAULT NULL,
  `userID` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `requesttable`
--

INSERT INTO `requesttable` (`requestID`, `requestType`, `requestTime`, `requestStatus`, `userID`) VALUES
('345', 'Expense Request', '0000-00-00 00:00:00', NULL, 'USR100'),
('445', 'Expense Request', '2022-07-24 15:43:22', NULL, 'USR100'),
('5666666', 'Operational Dem', '2022-07-24 20:21:09', NULL, 'USR100'),
('REQ101', 'Internal Reques', '2022-07-23 01:29:48', 'PENDING', 'USR100');

-- --------------------------------------------------------

--
-- Table structure for table `usertable`
--

CREATE TABLE `usertable` (
  `userID` varchar(15) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `DOB` date NOT NULL,
  `userImage` varchar(150) DEFAULT NULL,
  `phonenumber` int(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `userRole` varchar(15) NOT NULL,
  `departmentID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usertable`
--

INSERT INTO `usertable` (`userID`, `username`, `password`, `fullname`, `DOB`, `userImage`, `phonenumber`, `email`, `userRole`, `departmentID`) VALUES
('USR100', 'admin', 'admin', 'Chika Ani', '0000-00-00', 'admin.jpg', 4455444, 'casmonas@gmail.com', 'admin', 1),
('USR2', 'requester', 'requester', 'Agusta Angela', '1994-04-14', NULL, 5658768, 'casmonas@gmail.com', 'requester', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categorytable`
--
ALTER TABLE `categorytable`
  ADD PRIMARY KEY (`categoryID`);

--
-- Indexes for table `departmenttable`
--
ALTER TABLE `departmenttable`
  ADD PRIMARY KEY (`departmentID`);

--
-- Indexes for table `materialtable`
--
ALTER TABLE `materialtable`
  ADD PRIMARY KEY (`materialID`),
  ADD KEY `categoryID` (`categoryID`);

--
-- Indexes for table `requesttable`
--
ALTER TABLE `requesttable`
  ADD PRIMARY KEY (`requestID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `usertable`
--
ALTER TABLE `usertable`
  ADD PRIMARY KEY (`userID`),
  ADD KEY `departmentID` (`departmentID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `materialtable`
--
ALTER TABLE `materialtable`
  ADD CONSTRAINT `materialtable_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `categorytable` (`categoryID`);

--
-- Constraints for table `requesttable`
--
ALTER TABLE `requesttable`
  ADD CONSTRAINT `requesttable_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `usertable` (`userID`);

--
-- Constraints for table `usertable`
--
ALTER TABLE `usertable`
  ADD CONSTRAINT `usertable_ibfk_1` FOREIGN KEY (`departmentID`) REFERENCES `departmenttable` (`departmentID`);
COMMIT;
