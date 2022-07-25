-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2020 at 10:13 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tltd`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categoryCode` varchar(10) NOT NULL,
  `categoryName` varchar(50) NOT NULL,
  `itemCode` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categoryCode`, `categoryName`, `itemCode`) VALUES
('nahid5555-', 'nahid5555', 'NRK123'),
('NRK123-01', 'nahid00', 'NRK123'),
('RS00-01', 'Ball Bearing', 'RS00'),
('RS00-02', 'Needle Bearing', 'RS00'),
('RS00-03', 'Thas Bearing', 'RS00'),
('RS00-04', ' Taper Roller Bearing', 'RS00'),
('RS00-05', 'Bearing Coker', 'RS00'),
('RS00-06', 'Bearing ', 'RS00'),
('RS00-07', 'Bearing Socket', 'RS00'),
('RS00-08', 'Flat Belt', 'RS00'),
('RS00-09', 'Timing Belt', 'RS00'),
('RS00-10', 'Overhead Belt', 'RS00'),
('RS00-11', 'V Belt', 'RS00'),
('RS00-12', 'Spindle Tape', 'RS00'),
('RS00-13', 'Spindle Lock', 'RS00'),
('RS00-14', 'Bolister', 'RS00'),
('RS00-15', 'Spindle', 'RS00'),
('RS00-16', 'Spindle Oil', 'RS00'),
('RS00-17', 'Gear Oil', 'RS00'),
('RS00-18', 'Grease', 'RS00'),
('RS00-19', 'Rubber Cot', 'RS00'),
('RS00-20', 'Hidraulic Oil', 'RS00'),
('RS00-21', 'Roller Chain', 'RS00'),
('RS00-22', 'Bobbin Holder Moving', 'RS00'),
('RS00-23', 'Bobbin Holder Fixed', 'RS00'),
('RS00-24', 'Master Tape', 'RS00'),
('RS00-25', 'Overhead  Net', 'RS00'),
('RS00-26', 'Suction Net', 'RS00'),
('RS00-27', 'Suction  Pipe', 'RS00'),
('RS00-28', 'Overhead Pipe', 'RS00'),
('RS00-29', 'Overhead  Nozel', 'RS00'),
('RS00-30', 'Roving Gide', 'RS00'),
('RS00-31', 'Tin Pully', 'RS00'),
('RS00-32', 'Ring Cup', 'RS00'),
('RS00-33', 'Plastic Compound', 'RS00'),
('RS00-34', 'Grease Nipple', 'RS00'),
('RS00-35', 'Fixole', 'RS00'),
('RS00-36', 'Super Glue', 'RS00'),
('RS00-37', 'Aica ', 'RS00'),
('RS00-38', 'P.V.C Cement gum', 'RS00'),
('RS00-39', 'Aurber Cap', 'RS00'),
('RS00-40', 'Jet Powder', 'RS00'),
('RS00-41', 'Kerocin', 'RS00'),
('RS00-42', 'Telcom Powder', 'RS00'),
('RS00-43', 'White Powder', 'RS00'),
('RS00-44', 'Coper Brush', 'RS00'),
('RS00-45', 'Bottole Brush', 'RS00'),
('RS00-46', 'Plastick Brush', 'RS00'),
('RS00-47', 'Lappet Set', 'RS00'),
('RS00-48', 'Oberhead Elbow', 'RS00'),
('RS00-49', 'Overhead Wheel', 'RS00'),
('RS00-50', 'Overhead Pulley', 'RS00'),
('RS00-51', 'Bottom Apron', 'RS00'),
('RS00-52', 'Top Apron', 'RS00'),
('RS00-53', 'Plastic Creadle', 'RS00'),
('RS00-54', 'Jokey Pulley', 'RS00'),
('RS00-55', 'Petrol', 'RS00'),
('RS00-56', 'Arm pressure', 'RS00'),
('RS00-57', 'Emary Papper', 'RS00'),
('RS00-58', 'Roller Stand', 'RS00'),
('RS00-59', 'Suction Bush', 'RS00'),
('RS00-60', 'Tension Bucket', 'RS00'),
('RS00-61', 'Grinding Stone', 'RS00'),
('RS00-62', 'Grinding Stone Diomond', 'RS00'),
('RS00-63', 'Grinding Stone Dixe', 'RS00'),
('RS00-64', 'Resat Spring', 'RS00'),
('RS00-65', 'Kabza', 'RS00'),
('RS00-66', 'Cress Bolt', 'RS00'),
('RS00-67', 'L N Key Cot + Bolt', 'RS00'),
('RS00-68', 'Ring Clearer', 'RS00'),
('RS00-69', 'Oil Can', 'RS00'),
('RS00-70', 'Grease Gun', 'RS00'),
('RS00-71', 'Spacer', 'RS00'),
('RS00-72', 'WD-40', 'RS00'),
('RS00-73', 'Poller', 'RS00'),
('RS00-74', 'Spindle eye', 'RS00'),
('RS00-75', 'Korium -v-97', 'RS00'),
('RS00-76', 'Tin Pulley', 'RS00'),
('RS00-77', 'Separetor', 'RS00'),
('RS00-78', 'Ring Cup', 'RS00'),
('TEST000-01', 'TEST ACT', 'TEST000'),
('TEST000-02', 'TEST ACT 2', 'TEST000');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `itemCode` varchar(10) NOT NULL,
  `itemName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`itemCode`, `itemName`) VALUES
('@@00', '@@@'),
('EG00', 'Electric Goods'),
('NRK123', 'Nahid'),
('RR00', 'RRR'),
('RS00', 'Ring Section'),
('SP00', 'Spare Parts'),
('TEST000', 'TEST');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productId` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `categoryCode` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productId`, `description`, `categoryCode`) VALUES
('me2-01', 'me2', 'nahid5555-'),
('nahid5555-01', 'mlmlml', 'nahid5555-'),
('NRK123-01-01', 'nahid000', 'NRK123-01'),
('RS00-01-01', '1210K', 'RS00-01'),
('RS00-01-02', '1209K', 'RS00-01'),
('RS00-01-03', '6306', 'RS00-01'),
('RS00-01-04', '6207', 'RS00-01'),
('RS00-01-05', '6206', 'RS00-01'),
('RS00-01-06', '6205', 'RS00-01'),
('RS00-01-07', '6204', 'RS00-01'),
('RS00-01-08', '6203', 'RS00-01'),
('RS00-01-09', '6202', 'RS00-01'),
('RS00-01-10', '7206', 'RS00-01'),
('RS00-01-11', '6807', 'RS00-01'),
('RS00-01-12', '6804', 'RS00-01'),
('RS00-01-13', '3004', 'RS00-01'),
('RS00-01-14', '6002', 'RS00-01'),
('RS00-01-15', '6005', 'RS00-01'),
('RS00-01-16', '6009E', 'RS00-01'),
('RS00-01-17', '6302', 'RS00-01'),
('RS00-01-18', '608', 'RS00-01'),
('RS00-02-01', '3224 LZ', 'RS00-02'),
('RS00-02-02', '2822 LZ', 'RS00-02'),
('RS00-03-01', '51206', 'RS00-03'),
('RS00-04-01', '32007', 'RS00-04'),
('RS00-04-02', '30205', 'RS00-04'),
('RS00-05-01', '608(Plastic+Coper)', 'RS00-05'),
('RS00-06-01', 'Y.S.N-41', 'RS00-06'),
('RS00-07-01', 'H 2313', 'RS00-07'),
('RS00-07-02', 'H 2310', 'RS00-07'),
('RS00-07-03', 'H210', 'RS00-07'),
('RS00-07-04', 'H209', 'RS00-07'),
('RS00-08-01', '1055x110x4mm', 'RS00-08'),
('RS00-08-02', '1200x60x4mm', 'RS00-08'),
('RS00-09-01', '1264x40x8mm', 'RS00-09'),
('RS00-09-02', '1216x40x8', 'RS00-09'),
('RS00-09-03', '1168x40x8mm', 'RS00-09'),
('RS00-09-04', '1536x25x8mm', 'RS00-09'),
('RS00-09-05', '270x3mm', 'RS00-09'),
('RS00-09-06', '255x5x3mm', 'RS00-09'),
('RS00-10-01', '11x2.5x1mm', 'RS00-10'),
('RS00-11-01', 'Ax35', 'RS00-11'),
('RS00-11-02', 'Ax41', 'RS00-11'),
('RS00-11-03', 'Ax39', 'RS00-11'),
('RS00-12-01', '2625x10x1', 'RS00-12'),
('RS00-13-01', 'N/A', 'RS00-13'),
('RS00-14-01', 'N/A', 'RS00-14'),
('RS00-15-01', 'N/A', 'RS00-15'),
('RS00-16-01', 'HP-10', 'RS00-16'),
('RS00-17-01', 'HP-460', 'RS00-17'),
('RS00-17-02', '150', 'RS00-17'),
('RS00-18-01', 'XHP-222', 'RS00-18'),
('RS00-19-01', '19x30x28mm', 'RS00-19'),
('RS00-20-01', '68', 'RS00-20'),
('RS00-21-01', '08B', 'RS00-21'),
('RS00-22-01', 'N/A', 'RS00-22'),
('RS00-23-01', 'N/A', 'RS00-23'),
('RS00-24-01', 'N/A', 'RS00-24'),
('RS00-25-01', 'N/A', 'RS00-25'),
('RS00-26-01', 'N/A', 'RS00-26'),
('RS00-27-01', 'N/A', 'RS00-27'),
('RS00-28-01', 'Reskin', 'RS00-28'),
('RS00-28-02', 'Corgoted', 'RS00-28'),
('RS00-29-01', 'N/A', 'RS00-29'),
('RS00-30-01', 'N/A', 'RS00-30'),
('RS00-31-01', 'N/A', 'RS00-31'),
('RS00-32-01', 'N/A', 'RS00-32'),
('RS00-33-01', 'N/A', 'RS00-33'),
('RS00-34-01', 'N/A', 'RS00-34'),
('RS00-35-01', 'N/A', 'RS00-35'),
('RS00-36-01', 'N/A', 'RS00-36'),
('RS00-37-01', 'N/A', 'RS00-37'),
('RS00-38-01', 'N/A', 'RS00-38'),
('RS00-39-01', 'N/A', 'RS00-39'),
('RS00-40-01', 'N/A', 'RS00-40'),
('RS00-41-01', 'N/A', 'RS00-41'),
('RS00-42-01', 'N/A', 'RS00-42'),
('RS00-43-01', 'N/A', 'RS00-43'),
('RS00-44-01', 'N/A', 'RS00-44'),
('RS00-45-01', 'N/A', 'RS00-45'),
('RS00-46-01', 'N/A', 'RS00-46'),
('RS00-47-01', 'N/A', 'RS00-47'),
('RS00-48-01', 'N/A', 'RS00-48'),
('RS00-49-01', 'N/A', 'RS00-49'),
('RS00-50-01', 'N/A', 'RS00-50'),
('RS00-51-01', 'N/A', 'RS00-51'),
('RS00-52-01', 'N/A', 'RS00-52'),
('RS00-53-01', 'N/A', 'RS00-53'),
('RS00-54-01', 'N/A', 'RS00-54'),
('RS00-55-01', 'N/A', 'RS00-55'),
('RS00-56-01', 'N/A', 'RS00-56'),
('RS00-57-01', 'N/A', 'RS00-57'),
('RS00-58-01', 'N/A', 'RS00-58'),
('RS00-59-01', 'N/A', 'RS00-59'),
('RS00-60-01', 'N/A', 'RS00-60'),
('RS00-61-01', 'N/A', 'RS00-61'),
('RS00-62-01', 'N/A', 'RS00-62'),
('RS00-63-01', 'N/A', 'RS00-63'),
('RS00-64-01', 'N/A', 'RS00-64'),
('RS00-65-01', 'N/A', 'RS00-65'),
('RS00-66-01', 'N/A', 'RS00-66'),
('RS00-67-01', 'N/A', 'RS00-67'),
('RS00-68-01', 'N/A', 'RS00-68'),
('RS00-69-01', 'N/A', 'RS00-69'),
('RS00-70-01', 'N/A', 'RS00-70'),
('RS00-71-01', 'N/A', 'RS00-71'),
('RS00-72-01', 'N/A', 'RS00-72'),
('RS00-73-01', 'N/A', 'RS00-73'),
('RS00-74-01', 'N/A', 'RS00-74'),
('RS00-75-01', 'N/A', 'RS00-75'),
('RS00-76-01', 'N/A', 'RS00-76'),
('RS00-77-01', 'N/A', 'RS00-77'),
('TEST000-01-01', 'TEST 01', 'TEST000-01'),
('TEST000-01-02', 'TEST 2', 'TEST000-01'),
('TEST000-02-01', '****', 'TEST000-02');

-- --------------------------------------------------------

--
-- Table structure for table `req_offer`
--

CREATE TABLE `req_offer` (
  `prefix` varchar(3) NOT NULL DEFAULT 'REQ',
  `r_id` int(10) UNSIGNED ZEROFILL NOT NULL,
  `r_uname` varchar(255) NOT NULL,
  `r_uptime` varchar(255) NOT NULL,
  `r_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `req_offer`
--

INSERT INTO `req_offer` (`prefix`, `r_id`, `r_uname`, `r_uptime`, `r_status`) VALUES
('REQ', 0000000009, 'mahfuz', '16/03/2020', 0),
('REQ', 0000000010, 'mahfuz', '16/03/2020', 0),
('REQ', 0000000011, 'mahfuz', '16/03/2020', 0),
('REQ', 0000000012, 'mahfuz', '16/03/2020', 0),
('REQ', 0000000013, 'mahfuz', '17/03/2020', 0),
('REQ', 0000000014, 'mahfuz', '17/03/2020', 0),
('REQ', 0000000015, 'mahfuz', '18/03/2020 05:49:12am', 0),
('REQ', 0000000016, 'mahfuz', '18/03/2020 05:50:54am', 0),
('REQ', 0000000017, 'mahfuz', 'March 18, 2020, 10:58 am', 1),
('REQ', 0000000018, 'mahfuz', 'March 18, 2020 11:21 am', 0);

-- --------------------------------------------------------

--
-- Table structure for table `req_offer_items`
--

CREATE TABLE `req_offer_items` (
  `req_order_id` int(255) NOT NULL,
  `req_Id` int(255) NOT NULL,
  `req_item` varchar(100) NOT NULL,
  `req_cat` varchar(100) NOT NULL,
  `req_det` varchar(200) NOT NULL,
  `req_quan` int(200) NOT NULL,
  `req_unit` varchar(50) NOT NULL,
  `req_rate` double NOT NULL,
  `req_remark` varchar(200) NOT NULL,
  `req_uname` varchar(255) NOT NULL,
  `req_upTime` varchar(255) NOT NULL,
  `req_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `req_offer_items`
--

INSERT INTO `req_offer_items` (`req_order_id`, `req_Id`, `req_item`, `req_cat`, `req_det`, `req_quan`, `req_unit`, `req_rate`, `req_remark`, `req_uname`, `req_upTime`, `req_status`) VALUES
(9, 1, 'TEST000', 'TEST000-02', 'TEST000-02-01', 10, 'pcs', 100, 'TEST', 'mahfuz', '16/03/2020', 0),
(9, 1, 'RS00', 'RS00-05', 'RS00-05-01', 2, 'pcs', 100, 'TEST', 'mahfuz', '16/03/2020', 0),
(9, 1, 'RS00', 'RS00-10', 'RS00-10-01', 10, 'pcs', 50, 'TEST', 'mahfuz', '16/03/2020', 0),
(10, 1, 'TEST000', 'TEST000-02', 'TEST000-02-01', 10, 'ft', 100, 'TEST', 'mahfuz', '16/03/2020', 0),
(11, 1, 'RS00', 'RS00-09', 'RS00-09-05', 9999, 'm', 50, 'TEST', 'mahfuz', '16/03/2020', 0),
(11, 1, 'RS00', 'RS00-07', 'RS00-07-02', 5, 'pcs', 5, '9999', 'mahfuz', '16/03/2020', 0),
(12, 1, 'RS00', 'RS00-69', 'RS00-69-01', 10, 'pcs', 350, 'n1', 'mahfuz', '16/03/2020', 0),
(12, 1, 'RS00', 'RS00-65', 'RS00-65-01', 50, 'pcs', 50, 'n1', 'mahfuz', '16/03/2020', 0),
(12, 1, 'RS00', 'RS00-12', 'RS00-12-01', 20, 'pcs', 500, 'n1', 'mahfuz', '16/03/2020', 0),
(13, 1, 'NRK123', 'nahid5555-', 'nahid5555-01', 50, 'pcs', 10000, 'iamahid', 'mahfuz', '17/03/2020', 0),
(13, 1, 'NRK123', 'NRK123-01', 'NRK123-01-01', 900, 'pcs', 80000, 'iamahid-01', 'mahfuz', '17/03/2020', 0),
(14, 1, 'NRK123', 'nahid5555-', 'me2-01', 55, 'pcs', 50, 'n1', 'mahfuz', '17/03/2020', 0),
(15, 1, 'NRK123', 'NRK123-01', 'NRK123-01-01', 10, 'pcs', 100, 'TEST', 'mahfuz', '18/03/2020 05:49:12am', 0),
(16, 1, 'TEST000', 'TEST000-02', 'TEST000-02-01', 10, 'pcs', 50, 'TEST', 'mahfuz', '18/03/2020 05:50:54am', 0),
(17, 1, 'NRK123', 'nahid5555-', 'me2-01', 9999, 'pkt', 100, 'TEST', 'mahfuz', 'March 18, 2020, 10:58 am', 0),
(18, 1, 'TEST000', 'TEST000-02', 'TEST000-02-01', 10, 'pcs', 100, 'TEST', 'mahfuz', 'March 18, 2020 11:21 am', 0);

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `unitId` int(11) NOT NULL,
  `unit_details` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`unitId`, `unit_details`) VALUES
(1, 'pcs'),
(2, 'ft'),
(3, 'm'),
(4, 'pkt'),
(5, 'kg'),
(6, 'lbs');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` varchar(20) NOT NULL,
  `uname` varchar(20) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `designation` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `company` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `uname`, `pass`, `fname`, `lname`, `designation`, `type`, `company`) VALUES
('1005123', 'msharif', '1234', 'Md. Mahmudul Hasan', 'Sharif', 'Manager of Operations', 'moderator', 'TL'),
('1204121', 'reza', '1234', 'Mohammad Rezaul Hoque', 'Khan', 'Manager (Finance & Accounts)', 'accounts', 'ESML'),
('1705144', 'mahfuz', '1234', 'Md. Mahfuzur', ' Rahman', 'Manager of Procurement', 'normal', 'TL'),
('1804130', 'iamnahid', '0000', 'Md. Nahidul', 'Islam', 'Executive IT', 'admin', 'ESML');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categoryCode`),
  ADD KEY `itemCode` (`itemCode`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`itemCode`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productId`),
  ADD KEY `categoryCode` (`categoryCode`);

--
-- Indexes for table `req_offer`
--
ALTER TABLE `req_offer`
  ADD PRIMARY KEY (`r_id`),
  ADD UNIQUE KEY `prefix` (`prefix`,`r_id`);

--
-- Indexes for table `req_offer_items`
--
ALTER TABLE `req_offer_items`
  ADD KEY `req_Id` (`req_Id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`unitId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `req_offer`
--
ALTER TABLE `req_offer`
  MODIFY `r_id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `unitId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`itemCode`) REFERENCES `items` (`itemCode`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`categoryCode`) REFERENCES `categories` (`categoryCode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
