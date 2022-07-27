-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 27, 2022 at 03:30 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `hk_irs`
--

-- --------------------------------------------------------

--
-- Table structure for table `categorytable`
--

CREATE TABLE `categorytable` (
  `categoryID` int(15) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categorytable`
--

INSERT INTO `categorytable` (`categoryID`, `categoryName`) VALUES
(1, 'Ware House Product'),
(2, 'Raw Material'),
(3, 'Construction Material'),
(4, 'Repair Material');

-- --------------------------------------------------------

--
-- Table structure for table `customerrequesttable`
--

CREATE TABLE `customerrequesttable` (
  `requestID` int(15) NOT NULL,
  `requestType` varchar(255) NOT NULL,
  `requestDepartment` varchar(233) NOT NULL,
  `requestTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `requestStatus` enum('VERIFIED','PENDING','DECLINED') DEFAULT 'PENDING',
  `userID` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `departmenttable`
--

CREATE TABLE `departmenttable` (
  `departmentID` int(10) NOT NULL,
  `departmentName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `departmenttable`
--

INSERT INTO `departmenttable` (`departmentID`, `departmentName`) VALUES
(1, 'Management'),
(2, 'Admin'),
(3, 'Tech');

-- --------------------------------------------------------

--
-- Table structure for table `internalrequesttable`
--

CREATE TABLE `internalrequesttable` (
  `requestID` int(15) NOT NULL,
  `requestType` varchar(233) NOT NULL,
  `requestReason` varchar(600) NOT NULL,
  `requestDepartment` varchar(244) NOT NULL,
  `requestTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `requestStatus` enum('VERIFIED','PENDING','DECLINED') DEFAULT 'PENDING',
  `userID` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `materialrequesttable`
--

CREATE TABLE `materialrequesttable` (
  `requestID` int(15) NOT NULL,
  `requestType` varchar(233) NOT NULL,
  `requestDepartment` varchar(233) NOT NULL,
  `requestTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `requestStatus` enum('VERIFIED','PENDING','DECLINED') DEFAULT 'PENDING',
  `userID` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `materialtable`
--

CREATE TABLE `materialtable` (
  `materialID` int(15) NOT NULL,
  `materialName` varchar(255) NOT NULL,
  `quantity` int(15) NOT NULL,
  `categoryID` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `materialtable`
--

INSERT INTO `materialtable` (`materialID`, `materialName`, `quantity`, `categoryID`) VALUES
(1, 'Selotape', 20, 1),
(2, 'Polyteen', 200, 2);

-- --------------------------------------------------------

--
-- Table structure for table `productstable`
--

CREATE TABLE `productstable` (
  `productID` int(15) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `quantity` int(15) NOT NULL,
  `categoryID` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `productstable`
--

INSERT INTO `productstable` (`productID`, `productName`, `quantity`, `categoryID`) VALUES
(1, 'Celophene', 530, 1),
(2, 'Akwa', 200, 3);

-- --------------------------------------------------------

--
-- Table structure for table `producttable`
--

CREATE TABLE `producttable` (
  `productID` int(15) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `quantity` int(15) NOT NULL,
  `categoryID` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `producttable`
--

INSERT INTO `producttable` (`productID`, `productName`, `quantity`, `categoryID`) VALUES
(1, 'Akwa', 200, 0),
(2, 'Ede', 530, 0);

-- --------------------------------------------------------

--
-- Table structure for table `usertable`
--

CREATE TABLE `usertable` (
  `prefix` varchar(233) NOT NULL DEFAULT 'USR',
  `userID` int(15) NOT NULL,
  `userSerialNumber` varchar(255) DEFAULT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `phonenumber` varchar(255) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `userRole` enum('admin','PERFORMING AUTHORITY 1','PERFORMING AUTHORITY 2','VERIFYING AUTHORITY','AUTHORIZING AUTHORITY 1','AUTHORIZING AUTHORITY 2','VERIFYING AUTHORITY') DEFAULT NULL,
  `departmentID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usertable`
--

INSERT INTO `usertable` (`prefix`, `userID`, `userSerialNumber`, `username`, `password`, `fullname`, `phonenumber`, `email`, `userRole`, `departmentID`) VALUES
('USR', 1, '7887', 'admin', 'admin', 'chika ani', '44445567', 'casmonas@gmail.com', 'admin', 2),
('USR', 2, '6689', 'requester', 'requester', 'Chika Ani', '08130103364', 'casmonas@gmail.com', 'VERIFYING AUTHORITY', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categorytable`
--
ALTER TABLE `categorytable`
  ADD PRIMARY KEY (`categoryID`);

--
-- Indexes for table `customerrequesttable`
--
ALTER TABLE `customerrequesttable`
  ADD PRIMARY KEY (`requestID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `departmenttable`
--
ALTER TABLE `departmenttable`
  ADD PRIMARY KEY (`departmentID`);

--
-- Indexes for table `internalrequesttable`
--
ALTER TABLE `internalrequesttable`
  ADD PRIMARY KEY (`requestID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `materialrequesttable`
--
ALTER TABLE `materialrequesttable`
  ADD PRIMARY KEY (`requestID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `materialtable`
--
ALTER TABLE `materialtable`
  ADD PRIMARY KEY (`materialID`),
  ADD KEY `categoryID` (`categoryID`);

--
-- Indexes for table `productstable`
--
ALTER TABLE `productstable`
  ADD PRIMARY KEY (`productID`),
  ADD KEY `categoryID` (`categoryID`);

--
-- Indexes for table `producttable`
--
ALTER TABLE `producttable`
  ADD PRIMARY KEY (`productID`);

--
-- Indexes for table `usertable`
--
ALTER TABLE `usertable`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `prefix` (`prefix`,`userID`),
  ADD UNIQUE KEY `userSerialNumber` (`prefix`,`userID`,`userSerialNumber`),
  ADD KEY `departmentID` (`departmentID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categorytable`
--
ALTER TABLE `categorytable`
  MODIFY `categoryID` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customerrequesttable`
--
ALTER TABLE `customerrequesttable`
  MODIFY `requestID` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departmenttable`
--
ALTER TABLE `departmenttable`
  MODIFY `departmentID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `internalrequesttable`
--
ALTER TABLE `internalrequesttable`
  MODIFY `requestID` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `materialrequesttable`
--
ALTER TABLE `materialrequesttable`
  MODIFY `requestID` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `materialtable`
--
ALTER TABLE `materialtable`
  MODIFY `materialID` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `productstable`
--
ALTER TABLE `productstable`
  MODIFY `productID` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `producttable`
--
ALTER TABLE `producttable`
  MODIFY `productID` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `usertable`
--
ALTER TABLE `usertable`
  MODIFY `userID` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customerrequesttable`
--
ALTER TABLE `customerrequesttable`
  ADD CONSTRAINT `customerrequesttable_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `usertable` (`userID`);

--
-- Constraints for table `internalrequesttable`
--
ALTER TABLE `internalrequesttable`
  ADD CONSTRAINT `internalrequesttable_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `usertable` (`userID`);

--
-- Constraints for table `materialrequesttable`
--
ALTER TABLE `materialrequesttable`
  ADD CONSTRAINT `materialrequesttable_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `usertable` (`userID`);

--
-- Constraints for table `materialtable`
--
ALTER TABLE `materialtable`
  ADD CONSTRAINT `materialtable_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `categorytable` (`categoryID`);

--
-- Constraints for table `productstable`
--
ALTER TABLE `productstable`
  ADD CONSTRAINT `productstable_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `categorytable` (`categoryID`);

--
-- Constraints for table `usertable`
--
ALTER TABLE `usertable`
  ADD CONSTRAINT `usertable_ibfk_1` FOREIGN KEY (`departmentID`) REFERENCES `departmenttable` (`departmentID`);
COMMIT;
