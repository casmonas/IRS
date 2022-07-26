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
  `categoryID` int(15) NOT NULL,
  `categoryName` varchar(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categorytable`
--

INSERT INTO `categorytable` ( `categoryID`,`categoryName`) VALUES
(1,'Ware House Product'),
(2, 'Raw Material'),
(3, 'Construction Material'),
( 4,'Repair Material');

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

INSERT INTO `departmenttable` ( `departmentID`,`departmentName`) VALUES
( 1,'Management'),
( 2,'Admin'),
(3, 'Tech');

-- --------------------------------------------------------

--
-- Table structure for table `materialtable` UNSIGNED ZEROFILL
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
(1,'Selotape',20,1),
(2,'Polyteen',200,2);

CREATE TABLE `producttable` (
  `productID` int(15) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `quantity` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `requesttable`
--

CREATE TABLE `materialrequesttable` (
  `requestID` int(15) NOT NULL,
  `requestType` varchar(233) NOT NULL,
  `requestDepartment` varchar(233) NOT NULL,
  `requestTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `requestStatus` enum ('VERIFIED','PENDING','DECLINED') DEFAULT 'PENDING',
  `userID` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `customerrequesttable` (
  `requestID` int(15) NOT NULL,
  `requestType` varchar(255) NOT NULL,
  `requestDepartment` varchar(233) NOT NULL,
  `requestTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `requestStatus` enum ('VERIFIED','PENDING','DECLINED') DEFAULT 'PENDING',
  `userID` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `internalrequesttable` (
  `requestID` int(15) NOT NULL,
  `requestType` varchar(233) NOT NULL,
  `requestReason` varchar (600) NOT NULL,
  `requestDepartment` varchar(244) NOT NULL,
  `requestTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `requestStatus` enum ('VERIFIED','PENDING','DECLINED') DEFAULT 'PENDING',
  `userID` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `requesttable`
--

/* INSERT INTO `requesttable` (`requestID`, `requestType`, `requestTime`, `requestStatus`, `userID`) VALUES
('345', 'Expense Request', '0000-00-00 00:00:00', NULL, 'USR100'),
('445', 'Expense Request', '2022-07-24 15:43:22', NULL, 'USR100'),
('5666666', 'Operational Dem', '2022-07-24 20:21:09', NULL, 'USR100'),
('REQ101', 'Internal Reques', '2022-07-23 01:29:48', 'PENDING', 'USR100'); */

-- --------------------------------------------------------

--
-- Table structure for table `usertable`
--

CREATE TABLE `usertable` (
  `prefix` varchar (233) NOT NULL DEFAULT 'USR',
  `userID` int(15) NOT NULL,
  `userSerialNumber` varchar(255),
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `phonenumber` int(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `userRole` enum('admin','PERFORMING AUTHORITY 1','PERFORMING AUTHORITY 2','VERIFYING AUTHORITY','AUTHORIZING AUTHORITY 1','AUTHORIZING AUTHORITY 2','VERIFYING AUTHORITY'),
  `departmentID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usertable`
--

/* INSERT INTO `usertable` (`userID`, `username`, `password`, `fullname`, `DOB`, `userImage`, `phonenumber`, `email`, `userRole`, `departmentID`) VALUES
('USR100', 'admin', 'admin', 'Chika Ani', '0000-00-00', 'admin.jpg', 4455444, 'casmonas@gmail.com', 'admin', 1),
('USR2', 'requester', 'requester', 'Agusta Angela', '1994-04-14', NULL, 5658768, 'casmonas@gmail.com', 'requester', 1);
 */
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

  ALTER TABLE `producttable`
  ADD PRIMARY KEY (`productID`);

--
-- Indexes for table `materialtable`
--
ALTER TABLE `materialtable`
  ADD PRIMARY KEY (`materialID`),
  ADD KEY `categoryID` (`categoryID`);

--
-- Indexes for table `requesttable`
--
ALTER TABLE `materialrequesttable`
  ADD PRIMARY KEY (`requestID`),
  ADD KEY `userID` (`userID`);

  ALTER TABLE `customerrequesttable`
  ADD PRIMARY KEY (`requestID`),
  ADD KEY `userID` (`userID`);

  ALTER TABLE `internalrequesttable`
  ADD PRIMARY KEY (`requestID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `usertable`
--
ALTER TABLE `usertable`
  ADD PRIMARY KEY (`userID`),
   ADD UNIQUE KEY `prefix` (`prefix`,`userID`),
      ADD UNIQUE KEY `userSerialNumber` (`prefix`,`userID`,`userSerialNumber`),
  ADD KEY `departmentID` (`departmentID`);

--


  ALTER TABLE `usertable`
  MODIFY `userID` int(15) NOT NULL AUTO_INCREMENT;

  
  ALTER TABLE `categorytable`
  MODIFY `categoryID` int(15) NOT NULL AUTO_INCREMENT;


 ALTER TABLE `departmenttable`
  MODIFY `departmentID` int(10) NOT NULL AUTO_INCREMENT;

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
ALTER TABLE `materialrequesttable`
  ADD CONSTRAINT `materialrequesttable_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `usertable` (`userID`);


ALTER TABLE `internalrequesttable`
  ADD CONSTRAINT `internalrequesttable_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `usertable` (`userID`);

ALTER TABLE `customerrequesttable`
  ADD CONSTRAINT `customerrequesttable_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `usertable` (`userID`);

--
-- Constraints for table `usertable`
--
ALTER TABLE `usertable`
  ADD CONSTRAINT `usertable_ibfk_1` FOREIGN KEY (`departmentID`) REFERENCES `departmenttable` (`departmentID`);


  
  
   ALTER TABLE `producttable`
  MODIFY `productID` int(15) NOT NULL AUTO_INCREMENT;

   ALTER TABLE `materialtable`
  MODIFY `materialID` int(15) NOT NULL AUTO_INCREMENT;

ALTER TABLE `materialrequesttable`
  MODIFY `requestID` int(15) NOT NULL AUTO_INCREMENT;

ALTER TABLE `customerrequesttable`
  MODIFY `requestID` int(15) NOT NULL AUTO_INCREMENT;

ALTER TABLE `internalrequesttable`
  MODIFY `requestID` int(15) NOT NULL AUTO_INCREMENT;





COMMIT;
