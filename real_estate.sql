-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 25, 2023 at 08:12 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `real_estate`
--

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

CREATE TABLE `agents` (
  `agentid` int(11) NOT NULL,
  `state` varchar(50) NOT NULL,
  `agent_name` varchar(100) NOT NULL,
  `phonenum` varchar(15) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `agents`
--

INSERT INTO `agents` (`agentid`, `state`, `agent_name`, `phonenum`, `email`) VALUES
(1, 'Andhra Pradesh', 'Ravi Kumar', '9876543210', 'ravi.kumar@gmail.com'),
(2, 'Arunachal Pradesh', 'Meera Devi', '9876543211', 'meera.devi@gmail.com'),
(3, 'Assam', 'Amit Choudhury', '9876543212', 'amit.choudhury@gmail.com'),
(4, 'Bihar', 'Sneha Gupta', '9876543213', 'sneha.gupta@gmail.com'),
(5, 'Chhattisgarh', 'Vikas Sahu', '9876543214', 'vikas.sahu@gmail.com'),
(6, 'Goa', 'Aditi Deshmukh', '9876543215', 'aditi.deshmukh@gmail.com'),
(7, 'Gujarat', 'Raj Patel', '9876543216', 'raj.patel@gmail.com'),
(8, 'Haryana', 'Neha Malik', '9876543217', 'neha.malik@gmail.com'),
(9, 'Himachal Pradesh', 'Ankur Sharma', '9876543218', 'ankur.sharma@gmail.com'),
(10, 'Jharkhand', 'Pooja Kumari', '9876543219', 'pooja.kumari@gmail.com'),
(11, 'Karnataka', 'Arjun Rao', '9876543220', 'arjun.rao@gmail.com'),
(12, 'Kerala', 'Deepa Nair', '9876543221', 'deepa.nair@gmail.com'),
(13, 'Madhya Pradesh', 'Rahul Verma', '9876543222', 'rahul.verma@gmail.com'),
(14, 'Maharashtra', 'Aishwarya Desai', '9876543223', 'aishwarya.desai@gmail.com'),
(15, 'Manipur', 'Suresh Meitei', '9876543224', 'suresh.meitei@gmail.com'),
(16, 'Meghalaya', 'Linda Lyngdoh', '9876543225', 'linda.lyngdoh@gmail.com'),
(17, 'Mizoram', 'Ronald Khiangte', '9876543226', 'ronald.khiangte@gmail.com'),
(18, 'Nagaland', 'Aruna Ao', '9876543227', 'aruna.ao@gmail.com'),
(19, 'Odisha', 'Prakash Mohanty', '9876543228', 'prakash.mohanty@gmail.com'),
(20, 'Punjab', 'Gurpreet Singh', '9876543229', 'gurpreet.singh@gmail.com'),
(21, 'Rajasthan', 'Neha Choudhary', '9876543230', 'neha.choudhary@gmail.com'),
(22, 'Sikkim', 'Karan Rai', '9876543231', 'karan.rai@gmail.com'),
(23, 'Tamil Nadu', 'Divya Suresh', '9876543232', 'divya.suresh@gmail.com'),
(24, 'Telangana', 'Vikram Reddy', '9876543233', 'vikram.reddy@gmail.com'),
(25, 'Tripura', 'Ananya Das', '9876543234', 'ananya.das@gmail.com'),
(26, 'Uttar Pradesh', 'Rajat Verma', '9876543235', 'rajat.verma@gmail.com'),
(27, 'Uttarakhand', 'Priya Rawat', '9876543236', 'priya.rawat@gmail.com'),
(28, 'West Bengal', 'Sayan Ghosh', '9876543237', 'sayan.ghosh@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `PropertyID` int(11) NOT NULL,
  `Title` varchar(500) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Type` enum('Sale','Rent','Both') DEFAULT NULL,
  `PriceSale` int(11) DEFAULT NULL,
  `PriceRent` int(11) DEFAULT NULL,
  `State` varchar(100) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`PropertyID`, `Title`, `Description`, `Type`, `PriceSale`, `PriceRent`, `State`, `City`) VALUES
(101, '2 BHK Apartment', 'Spacious 2 BHK', 'Both', 550000, 15000, 'Andhra Pradesh', 'Visakhapatnam'),
(102, '3 BHK Villa', 'Modern Villa', 'Sale', 6500000, 0, 'Andhra Pradesh', 'Vijayawada'),
(103, '1 BHK Flat', 'Compact 1 BHK', 'Rent', 0, 8000, 'Andhra Pradesh', 'Rajahmundry'),
(104, '4 BHK House', 'Luxury Home', 'Both', 7500000, 22000, 'Andhra Pradesh', 'Kurnool'),
(105, '1 RK Studio', 'Studio Apartment', 'Rent', 0, 5000, 'Andhra Pradesh', 'Kakinada'),
(106, 'Farm House', 'Peaceful farmhouse with lot of open space', 'Sale', 3500000, 0, 'Andhra Pradesh', 'Machilipatnam'),
(107, 'Duplex Apartment', 'Spacious duplex apartment', 'Both', 4000000, 20000, 'Andhra Pradesh', 'Guntur'),
(108, 'Designer House', 'Architect designed house', 'Sale', 9000000, 0, 'Andhra Pradesh', 'Warangal'),
(109, 'Penthouse', 'Huge penthouse apartment', 'Both', 7500000, 40000, 'Andhra Pradesh', 'Tirupati'),
(110, 'Studio', 'Tiny but affordable studio', 'Rent', 0, 4000, 'Andhra Pradesh', 'Kadapa'),
(111, 'Commercial Shop', 'Good commercial real estate', 'Sale', 2200000, 0, 'Arunachal Pradesh', 'Itanagar'),
(112, 'Mountain Retreat', 'Idyllic mountain home', 'Both', 3500000, 25000, 'Arunachal Pradesh', 'Pasighat'),
(113, 'Resort Villa', 'Luxury villa in resort township', 'Sale', 7000000, 0, 'Arunachal Pradesh', 'Dibrugarh'),
(114, 'Service Apartment', 'Service apartment with facilities', 'Rent', 0, 18000, 'Arunachal Pradesh', 'Tezu'),
(115, 'Luxury Villa', 'Super luxury designer villa', 'Sale', 12000000, 0, 'Arunachal Pradesh', 'North Lakhimpur'),
(116, 'Penthouse', 'Prestigious penthouse', 'Both', 8500000, 45000, 'Arunachal Pradesh', 'Namsai'),
(117, 'Houseboat', 'Beautiful houseboat on River Brahmaputra', 'Rent', 0, 25000, 'Arunachal Pradesh', 'Passighat'),
(118, 'Designer House', 'Futuristic designer house', 'Sale', 6500000, 0, 'Arunachal Pradesh', 'Silapathar'),
(119, 'Beach House', 'Charming beach house with great views', 'Both', 4000000, 30000, 'Arunachal Pradesh', 'Tezpur'),
(120, 'Cottage', 'Cozy countryside cottage', 'Rent', 0, 12000, 'Arunachal Pradesh', 'Khonsa'),
(121, 'Penthouse', 'Prestigious penthouse', 'Sale', 9500000, 0, 'Assam', 'Guwahati'),
(122, 'Service Apartment', 'Service apartment with facilities', 'Rent', 0, 22000, 'Assam', 'Silchar'),
(123, 'Villa', 'Charming villa in gated community', 'Both', 4500000, 28000, 'Assam', 'Dibrugarh'),
(124, 'Bungalow', 'Sprawling bungalow with lot of open space', 'Sale', 7800000, 0, 'Assam', 'Nagaon'),
(125, 'Studio', 'Compact studio for singles', 'Rent', 0, 5000, 'Assam', 'Tinsukia'),
(126, 'Designer House', 'Ultra modern designer house', 'Both', 6500000, 35000, 'Assam', 'Jorhat'),
(127, 'Beach House', 'Beautiful sea facing beach house', 'Sale', 5200000, 0, 'Assam', 'Bongaigaon'),
(128, 'Cottage', 'Lakeview cottage in resort township', 'Rent', 0, 15000, 'Assam', 'Dhubri'),
(129, 'Farm House', 'Picturesque farmhouse with lot of greenery', 'Both', 3800000, 20000, 'Assam', 'Goalpara'),
(130, 'Houseboat', 'Luxurious houseboat on River Brahmaputra', 'Sale', 4500000, 0, 'Assam', 'Barpeta'),
(131, 'Bungalow', 'Charming bungalow in gated community', 'Rent', 0, 35000, 'Bihar', 'Patna'),
(132, 'Villa', 'Mediterranean style luxury villa', 'Sale', 9800000, 0, 'Bihar', 'Gaya'),
(133, 'Houseboat', 'Beautiful houseboat on River Ganges', 'Both', 5200000, 28000, 'Bihar', 'Bhagalpur'),
(134, 'Resort Cottage', 'Cottage in resort township', 'Rent', 0, 22000, 'Bihar', 'Muzaffarpur'),
(135, 'Farm House', 'Lush green farmhouse property', 'Sale', 4500000, 0, 'Bihar', 'Darbhanga'),
(136, 'Penthouse', 'Ultra luxury penthouse in highrise', 'Both', 12000000, 55000, 'Bihar', 'Katihar'),
(137, 'Designer Apartment', 'Designer apartment in elite highrise', 'Rent', 0, 45000, 'Bihar', 'Purnia'),
(138, 'Mountain Retreat', 'Splendid mountain retreat with views', 'Sale', 7500000, 0, 'Bihar', 'Saharsa'),
(139, 'Beach House', 'Serene beach house with private beach', 'Both', 6800000, 38000, 'Bihar', 'Hajipur'),
(140, 'Service Apartment', 'Service apartment with 5-star facilities', 'Rent', 0, 28000, 'Bihar', 'Chapra'),
(141, 'Bungalow', 'Luxurious riverfront facing bungalow', 'Both', 7200000, 48000, 'Chhattisgarh', 'Raipur'),
(142, 'Mountain Cottage', 'Cozy mountain getaway cottage', 'Rent', 0, 18000, 'Chhattisgarh', 'Bhilai'),
(143, 'Farm House', 'Modern farmhouse with swimming pool', 'Sale', 5800000, 0, 'Chhattisgarh', 'Bilaspur'),
(144, 'Penthouse', 'Penthouse with panoramic hill views', 'Both', 9500000, 55000, 'Chhattisgarh', 'Rajnandgaon'),
(145, 'Designer House', 'Designer house by celebrity architect', 'Rent', 0, 42000, 'Chhattisgarh', 'Raigarh'),
(146, 'Beach Villa', 'Stunning villa with private beach access', 'Sale', 9200000, 0, 'Chhattisgarh', 'Korba'),
(147, 'Resort Apartment', 'Apartment in 5-star resort township', 'Both', 4500000, 28000, 'Chhattisgarh', 'Jashpur'),
(148, 'Service Apartment', 'Service apartment with all amenities', 'Rent', 0, 22000, 'Chhattisgarh', 'Janjgir'),
(149, 'Luxury Villa', 'Sheer luxury villa with pool,gym etc', 'Sale', 15800000, 0, 'Chhattisgarh', 'Kawardha'),
(150, 'Cottage', 'Quaint cottage in peaceful village', 'Both', 2200000, 15000, 'Chhattisgarh', 'Kanker'),
(151, 'Luxury House', 'Palatial luxury house for large family', 'Rent', 0, 75000, 'Goa', 'Panaji'),
(152, 'Designer Apartment', 'Designer apartment in elite highrise', 'Sale', 6500000, 0, 'Goa', 'Margao'),
(153, 'Penthouse', 'Spectacular penthouse with sea views', 'Both', 12500000, 98000, 'Goa', 'Mapusa'),
(154, 'Beach Bungalow', 'Charming beach bungalow in North Goa', 'Rent', 0, 55000, 'Goa', 'Ponda'),
(155, 'Private Island', 'Ultra luxury private island with villa', 'Sale', 58000000, 0, 'Goa', 'Verna'),
(156, 'Farm Villa', 'Luxurious farm villa outside city', 'Both', 8500000, 75000, 'Goa', 'Curchorem'),
(157, 'Beach House', 'Designer beach house in South Goa', 'Rent', 0, 85000, 'Goa', 'Canacona'),
(158, 'Sea View Apartment', 'Sea view apartment in beach resort', 'Sale', 4500000, 0, 'Goa', 'Quepem'),
(159, 'Boutique Hotel', 'Charming boutique heritage hotel', 'Both', 22900000, 220000, 'Goa', 'Sanguem'),
(160, 'Resort Cottage', 'Cottage in luxury beach resort', 'Rent', 0, 45000, 'Goa', 'Cavelossim'),
(161, 'Designer House', 'Ultra modern designer house with pool', 'Both', 9800000, 75000, 'Gujarat', 'Ahmedabad'),
(162, 'Service Apartment', 'Service apartment in elite township', 'Sale', 5800000, 0, 'Gujarat', 'Surat'),
(163, 'Luxury Villa', 'Opulent luxury villa for large family', 'Rent', 0, 98000, 'Gujarat', 'Vadodara'),
(164, 'Beach Penthouse', 'Stunning penthouse with sea views', 'Both', 11280000, 125000, 'Gujarat', 'Rajkot'),
(165, 'Heritage Haveli', 'Royal heritage haveli for events', 'Sale', 18500000, 0, 'Gujarat', 'Bhavnagar'),
(166, 'Designeer Apartment', 'Designer apartment in elite highrise', 'Rent', 0, 75000, 'Gujarat', 'Jamnagar'),
(167, 'Farm Stay', 'Charming farm stay retreat outside city', 'Both', 3850000, 45000, 'Gujarat', 'Gandhidham'),
(168, 'Studio', 'Compact and affordable studio apartment', 'Sale', 2100000, 0, 'Gujarat', 'Anand'),
(169, 'Luxury Bungalow', 'Sprawling luxury bungalow in elite suburb', 'Rent', 0, 125000, 'Gujarat', 'Kutch'),
(170, 'Resort Apartment', 'Apartment in beachside luxury resort', 'Both', 6500000, 55000, 'Gujarat', 'Bhuj'),
(171, 'Heritage Palace', 'Royal heritage palace from 19th century', 'Both', 32800000, 350000, 'Haryana', 'Faridabad'),
(172, 'Farm House', 'Beautiful farmhouse outside city', 'Rent', 0, 85000, 'Haryana', 'Gurgaon'),
(173, 'Penthouse', 'Penthouse in tallest highrise in city', 'Sale', 16800000, 0, 'Haryana', 'Hisar'),
(174, 'Designer House', 'Cutting-edge designer house by celebrity', 'Both', 12800000, 220000, 'Haryana', 'Panipat'),
(175, 'Luxury Apartment', 'Super elite luxury apartment', 'Rent', 0, 155000, 'Haryana', 'Rohtak'),
(176, 'Royal Villa', 'Opulent royal villa like old palaces', 'Sale', 22900000, 0, 'Haryana', 'Karnal'),
(177, 'Forest Cottage', 'Cottage in private forest reserve', 'Both', 8500000, 75000, 'Haryana', 'Sonipat'),
(178, 'Beach Penthouse', 'Ultra luxury penthouse with sea view', 'Rent', 0, 205000, 'Haryana', 'Yamunanagar'),
(179, 'Heritage Haveli', 'Grand historic haveli from colonial era', 'Sale', 39500000, 0, 'Haryana', 'Panchkula'),
(180, 'Resort Apartment', 'Apartment in celebrity preferred resort', 'Both', 7200000, 110000, 'Haryana', 'Sirsa'),
(181, 'Royal Mansion', 'Magnificent royal mansion in city center', 'Rent', 0, 620000, 'Karnataka', 'Bengaluru'),
(182, 'Celebrity Penthouse', 'Ultra luxury celebrity penthouse', 'Sale', 18900000, 0, 'Karnataka', 'Mysuru'),
(183, 'Heritage Bungalow', 'Stately heritage bungalow', 'Both', 12800000, 550000, 'Karnataka', 'Belagavi'),
(184, 'Luxury Yacht', 'Ultra luxury yacht to sail coast', 'Rent', 0, 625000, 'Karnataka', 'Kalaburagi'),
(185, 'Houseboat', 'Charming houseboat to cruise backwaters', 'Sale', 8500000, 0, 'Karnataka', 'Hubballi-Dharwad'),
(186, 'Mountain Lodge', 'Rustic luxury mountain lodge', 'Both', 12900000, 325000, 'Karnataka', 'Mangaluru'),
(187, 'Resort Penthouse', 'Penthouse in premium beach resort', 'Rent', 0, 220000, 'Karnataka', 'Davangere'),
(188, 'Private Villa', 'Ultra private luxury jungle villa', 'Sale', 21800000, 0, 'Karnataka', 'Ballari'),
(189, 'Heritage Palace', 'Magnificent heritage palace hotel', 'Both', 58900000, 850000, 'Karnataka', 'Shivamogga'),
(190, 'Luxury Apartment', 'Elite luxury apartment in city center', 'Rent', 0, 355000, 'Karnataka', 'Raichur'),
(191, 'Celebrity Villa', 'Ultra elite celebrity villa with helipad', 'Rent', 0, 720000, 'Kerala', 'Kochi'),
(192, 'Luxury Houseboat', 'Opulent luxury houseboat to sail Kerala', 'Sale', 12900000, 0, 'Kerala', 'Thiruvananthapuram'),
(193, 'Beach Villa', 'Spectaclar private villa on secluded beach', 'Both', 23900000, 980000, 'Kerala', 'Kozhikode'),
(194, 'Heritage Mansion', 'Grand historic mansion from colonial times', 'Rent', 0, 655000, 'Kerala', 'Kollam'),
(195, 'Village Farmstay', 'Charming village farmstay retreat', 'Sale', 3850000, 0, 'Kerala', 'Thrissur'),
(196, 'Waterfront Penthouse', 'Magnificent penthouse with sea views', 'Both', 17900000, 325000, 'Kerala', 'Kannur'),
(197, 'Royal Palace', 'Opulent historical royal palace hotel', 'Rent', 0, 1200000, 'Kerala', 'Malappuram'),
(198, 'Luxury House', 'Ultra luxury modern designer house', 'Sale', 22900000, 0, 'Kerala', 'Kottayam'),
(199, 'Beach House', 'Romantic luxury beachfront house', 'Both', 12900000, 650000, 'Kerala', 'Palakkad'),
(200, 'Resort Cottage', 'Lovely cottage in premium beach resort', 'Rent', 0, 325000, 'Kerala', 'Alappuzha'),
(201, 'Heriatge Haveli', 'Ornate heritage haveli from history', 'Sale', 28900000, 0, 'Madhya Pradesh', 'Gwalior'),
(202, 'Forest Cabin', 'Cozy log cabin in dense pine forests', 'Rent', 0, 45000, 'Madhya Pradesh', 'Indore'),
(203, 'Farm Villa', 'Spectacular farm villa outside city', 'Both', 7580000, 220000, 'Madhya Pradesh', 'Bhopal'),
(204, 'Houseboat', 'Grand luxury houseboat to sail waters', 'Sale', 6380000, 0, 'Madhya Pradesh', 'Jabalpur'),
(205, 'Mountain Chalet', 'Charming mountain chalet with views', 'Rent', 0, 58000, 'Madhya Pradesh', 'Ujjain'),
(206, 'Weekend Cottage', 'Cozy weekend getaway countryside cottage', 'Both', 2850000, 34000, 'Madhya Pradesh', 'Sagar'),
(207, 'Heritage Bungalow', 'Elegant British era heritage bungalow', 'Sale', 4550000, 0, 'Madhya Pradesh', 'Dewas'),
(208, 'Royal Palace', 'Opulent heritage royal palace hotel', 'Rent', 0, 725000, 'Madhya Pradesh', 'Jabalpur'),
(209, 'Farmhouse', 'Beautiful farmhouse outside city', 'Sale', 7000000, 0, 'Madhya Pradesh', 'Bhopal'),
(210, '1 BHK Flat', 'Compact 1 BHK', 'Rent', 0, 8000, 'Madhya Pradesh', 'Indore'),
(211, 'Mountain Chalet', 'Cozy mountain chalet with panoramic views', 'Both', 4200000, 28000, 'Himachal Pradesh', 'Shimla'),
(212, 'Riverfront Cottage', 'Charming cottage on the banks of River Beas', 'Rent', 0, 15000, 'Himachal Pradesh', 'Kullu'),
(213, 'Luxury Resort Villa', 'Villa in a luxury resort with spa and golf', 'Sale', 9800000, 0, 'Himachal Pradesh', 'Manali'),
(214, 'Ski Chalet', 'Ski-in, ski-out chalet for winter enthusiasts', 'Both', 6500000, 35000, 'Himachal Pradesh', 'Dharamshala'),
(215, 'Hillside Bungalow', 'Bungalow with breathtaking views of the hills', 'Rent', 0, 18000, 'Himachal Pradesh', 'Chamba'),
(216, 'Mountain Retreat', 'Secluded retreat in the lap of the Himalayas', 'Sale', 5500000, 0, 'Himachal Pradesh', 'Mandi'),
(217, 'Heritage Haveli', 'Restored heritage haveli with modern amenities', 'Both', 7500000, 42000, 'Himachal Pradesh', 'Palampur'),
(218, 'Forest Cabin', 'Rustic cabin surrounded by dense pine forest', 'Rent', 0, 12000, 'Himachal Pradesh', 'Solan'),
(219, 'Riverside Lodge', 'Lodge overlooking the Beas River', 'Sale', 4800000, 0, 'Himachal Pradesh', 'Nahan'),
(220, 'Mountain View Apartment', 'Apartment with stunning mountain views', 'Both', 3500000, 20000, 'Himachal Pradesh', 'Bilaspur'),
(221, 'Executive Penthouse', 'Executive penthouse with city skyline views', 'Rent', 0, 55000, 'Haryana', 'Ambala'),
(222, 'Country Estate', 'Sprawling estate in the Haryana countryside', 'Sale', 12500000, 0, 'Haryana', 'Fatehabad'),
(223, 'Urban Studio', 'Compact studio in the heart of the city', 'Both', 2800000, 18000, 'Haryana', 'Kaithal'),
(224, 'Riverfront Villa', 'Villa with a private riverfront location', 'Rent', 0, 25000, 'Haryana', 'Palwal'),
(225, 'Highrise Apartment', 'Apartment in a luxurious highrise building', 'Sale', 7800000, 0, 'Haryana', 'Jind'),
(226, 'Lakeview Cottage', 'Cottage with panoramic views of a serene lake', 'Both', 5200000, 30000, 'Haryana', 'Rewari'),
(227, 'Golf Course Villa', 'Villa overlooking a prestigious golf course', 'Rent', 0, 35000, 'Haryana', 'Rohtak'),
(228, 'Modern Townhouse', 'Contemporary townhouse in a prime location', 'Sale', 9800000, 0, 'Haryana', 'Sirsa'),
(229, 'Rural Retreat', 'Retreat in the peaceful Haryana countryside', 'Both', 4500000, 22000, 'Haryana', 'Thanesar'),
(230, 'City Center Condo', 'Condo in the heart of the bustling city center', 'Rent', 0, 20000, 'Haryana', 'Tohana'),
(232, 'Hillside Villa', 'Villa nestled in the hills with lush greenery', 'Rent', 0, 30000, 'Maharashtra', 'Pune'),
(233, 'Beachfront House', 'Chic house with direct access to the beach', 'Sale', 12000000, 0, 'Maharashtra', 'Mumbai'),
(234, 'Heritage Apartment', 'Apartment in a heritage building with character', 'Rent', 0, 25000, 'Maharashtra', 'Nagpur'),
(235, 'Luxury Penthouse', 'Opulent penthouse with exclusive amenities', 'Both', 15800000, 55000, 'Maharashtra', 'Nashik'),
(236, 'Riverside Retreat', 'Retreat along the scenic banks of the river', 'Sale', 9800000, 0, 'Maharashtra', 'Aurangabad'),
(237, 'Skyrise Condo', 'Condo in a highrise tower with sky-high views', 'Rent', 0, 35000, 'Maharashtra', 'Solapur'),
(238, 'Vineyard Estate', 'Estate surrounded by vineyards and rolling hills', 'Both', 18500000, 48000, 'Maharashtra', 'Amravati'),
(239, 'Modern Townhome', 'Sleek and modern townhome in a vibrant neighborhood', 'Sale', 7200000, 0, 'Maharashtra', 'Kolhapur'),
(240, 'Lakeside Cottage', 'Cozy cottage overlooking a serene lake', 'Rent', 0, 18000, 'Maharashtra', 'Akola'),
(241, 'Valley View Apartment', 'Apartment with picturesque views of the valley', 'Both', 4500000, 22000, 'Manipur', 'Imphal'),
(242, 'Hilltop Retreat', 'Secluded retreat perched on a hilltop', 'Rent', 0, 18000, 'Manipur', 'Thoubal'),
(243, 'Lakeside Cabin', 'Rustic cabin with a view of a tranquil lake', 'Sale', 5800000, 0, 'Manipur', 'Bishnupur'),
(244, 'Modern Condo', 'Contemporary condo in the heart of the city', 'Rent', 0, 25000, 'Manipur', 'Churachandpur'),
(245, 'Riverfront House', 'House with a frontage along a scenic river', 'Both', 7200000, 35000, 'Manipur', 'Senapati'),
(246, 'Countryside Villa', 'Villa in the peaceful Manipur countryside', 'Sale', 9800000, 0, 'Manipur', 'Tamenglong'),
(247, 'City Center Apartment', 'Apartment in the bustling city center', 'Rent', 0, 28000, 'Manipur', 'Ukhrul'),
(248, 'Tea Estate Bungalow', 'Bungalow on a lush tea estate with mountain views', 'Both', 7500000, 42000, 'Manipur', 'Kangpokpi'),
(249, 'Mountain View Chalet', 'Charming chalet with panoramic mountain views', 'Sale', 5200000, 0, 'Manipur', 'Noney'),
(250, 'Lakeside Retreat', 'Retreat by the side of a serene lake', 'Rent', 0, 20000, 'Manipur', 'Kakching'),
(251, 'Mountain Cabin', 'Cozy cabin with views of the majestic mountains', 'Both', 5200000, 28000, 'Meghalaya', 'Shillong'),
(252, 'Waterfall Retreat', 'Retreat with a view of a cascading waterfall', 'Rent', 0, 15000, 'Meghalaya', 'Cherrapunji'),
(253, 'Lakefront Cottage', 'Quaint cottage with a frontage along a tranquil lake', 'Sale', 6800000, 0, 'Meghalaya', 'Tura'),
(254, 'Hillside Bungalow', 'Bungalow nestled on the slopes of the hills', 'Rent', 0, 22000, 'Meghalaya', 'Jowai'),
(255, 'Valley View Villa', 'Villa offering panoramic views of the lush valley', 'Both', 8500000, 45000, 'Meghalaya', 'Williamnagar'),
(256, 'Forest Lodge', 'Lodge surrounded by dense forests and wildlife', 'Sale', 5800000, 0, 'Meghalaya', 'Baghmara'),
(257, 'Riverside Retreat', 'Retreat along the serene banks of a river', 'Rent', 0, 18000, 'Meghalaya', 'Resubelpara'),
(258, 'City Center Apartment', 'Apartment in the heart of the city', 'Both', 3500000, 20000, 'Meghalaya', 'Nongpoh'),
(259, 'Tea Garden Estate', 'Estate house on a sprawling tea garden', 'Sale', 7200000, 0, 'Meghalaya', 'Nongstoin'),
(260, 'Lakeside Chalet', 'Charming chalet overlooking a peaceful lake', 'Rent', 0, 25000, 'Meghalaya', 'Khliehriat'),
(261, 'Hilltop Retreat', 'Secluded retreat perched on a hilltop', 'Both', 4800000, 25000, 'Mizoram', 'Aizawl'),
(262, 'Lakeside Cabin', 'Rustic cabin with a view of a tranquil lake', 'Rent', 0, 18000, 'Mizoram', 'Lunglei'),
(263, 'Mountain View Villa', 'Villa with stunning views of the surrounding mountains', 'Sale', 7500000, 0, 'Mizoram', 'Saiha'),
(264, 'City Center Apartment', 'Apartment in the bustling city center', 'Rent', 0, 22000, 'Mizoram', 'Champhai'),
(265, 'Riverfront House', 'House with a frontage along a scenic river', 'Both', 5800000, 32000, 'Mizoram', 'Kolasib'),
(266, 'Countryside Cottage', 'Charming cottage in the peaceful Mizoram countryside', 'Sale', 6800000, 0, 'Mizoram', 'Serchhip'),
(267, 'Forest Lodge', 'Lodge surrounded by dense forests and wildlife', 'Rent', 0, 20000, 'Mizoram', 'Mamit'),
(268, 'Hillside Bungalow', 'Bungalow nestled on the slopes of the hills', 'Both', 5200000, 28000, 'Mizoram', 'Khawzawl'),
(269, 'Tea Estate Bungalow', 'Bungalow on a lush tea estate with mountain views', 'Sale', 7200000, 0, 'Mizoram', 'Lawngtlai'),
(270, 'Lakeside Retreat', 'Retreat by the side of a serene lake', 'Rent', 0, 22000, 'Mizoram', 'Hnahthial'),
(271, 'Mountain Cabin', 'Cozy cabin with views of the Naga hills', 'Both', 5200000, 28000, 'Nagaland', 'Kohima'),
(272, 'Riverside Retreat', 'Retreat along the serene banks of a river', 'Rent', 0, 18000, 'Nagaland', 'Dimapur'),
(273, 'Hilltop Bungalow', 'Bungalow perched on a hilltop with panoramic views', 'Sale', 7500000, 0, 'Nagaland', 'Mokokchung'),
(274, 'City Center Apartment', 'Apartment in the heart of the city', 'Rent', 0, 25000, 'Nagaland', 'Tuensang'),
(275, 'Valley View Villa', 'Villa offering panoramic views of the lush valley', 'Both', 8500000, 45000, 'Nagaland', 'Wokha'),
(276, 'Countryside Cottage', 'Charming cottage in the peaceful Nagaland countryside', 'Sale', 6800000, 0, 'Nagaland', 'Zunheboto'),
(277, 'Lakeside Chalet', 'Charming chalet overlooking a serene lake', 'Rent', 0, 20000, 'Nagaland', 'Phek'),
(278, 'Mountain View Lodge', 'Lodge with stunning views of the surrounding mountains', 'Both', 5800000, 32000, 'Nagaland', 'Longleng'),
(279, 'Hillside Retreat', 'Secluded retreat on the slopes of the Naga hills', 'Sale', 7200000, 0, 'Nagaland', 'Peren'),
(280, 'Cityscape Apartment', 'Apartment with views of the cityscape', 'Rent', 0, 22000, 'Nagaland', 'Kiphire'),
(281, 'Beachfront Villa', 'Luxurious villa with direct access to the beach', 'Both', 9800000, 55000, 'Odisha', 'Bhubaneswar'),
(282, 'Hillside Retreat', 'Secluded retreat perched on a hillside', 'Rent', 0, 22000, 'Odisha', 'Cuttack'),
(283, 'Lakeside Mansion', 'Grand mansion with views of a serene lake', 'Sale', 15800000, 0, 'Odisha', 'Rourkela'),
(284, 'City Center Apartment', 'Apartment in the heart of the city', 'Rent', 0, 28000, 'Odisha', 'Berhampur'),
(285, 'Riverfront House', 'House with a frontage along a scenic river', 'Both', 7200000, 35000, 'Odisha', 'Sambalpur'),
(286, 'Countryside Cottage', 'Charming cottage in the peaceful Odisha countryside', 'Sale', 5800000, 0, 'Odisha', 'Puri'),
(287, 'Forest Lodge', 'Lodge surrounded by dense forests and wildlife', 'Rent', 0, 18000, 'Odisha', 'Balasore'),
(288, 'Hilltop Bungalow', 'Bungalow nestled on the slopes of a hill', 'Both', 5200000, 28000, 'Odisha', 'Brahmapur'),
(289, 'Tea Estate Bungalow', 'Bungalow on a lush tea estate with mountain views', 'Sale', 7200000, 0, 'Odisha', 'Bhadrak'),
(290, 'Lakeside Retreat', 'Retreat by the side of a serene lake', 'Rent', 0, 20000, 'Odisha', 'Baripada'),
(291, 'City View Apartment', 'Modern apartment with city skyline views', 'Both', 6500000, 35000, 'Punjab', 'Chandigarh'),
(292, 'Riverside Villa', 'Villa with a private riverside setting', 'Rent', 0, 18000, 'Punjab', 'Ludhiana'),
(293, 'Luxury Penthouse', 'Opulent penthouse with exclusive amenities', 'Sale', 12800000, 0, 'Punjab', 'Amritsar'),
(294, 'Downtown Condo', 'Condo in the heart of downtown with urban views', 'Rent', 0, 25000, 'Punjab', 'Jalandhar'),
(295, 'Heritage House', 'Historic house with architectural charm', 'Both', 7800000, 42000, 'Punjab', 'Patiala'),
(296, 'Countryside Cottage', 'Charming cottage in the peaceful Punjab countryside', 'Sale', 6800000, 0, 'Punjab', 'Bathinda'),
(297, 'Lakefront Retreat', 'Retreat with a view of a tranquil lake', 'Rent', 0, 20000, 'Punjab', 'Pathankot'),
(298, 'Mountain View Bungalow', 'Bungalow with panoramic views of the mountains', 'Both', 8500000, 45000, 'Punjab', 'Hoshiarpur'),
(299, 'City Center Apartment', 'Apartment in the bustling city center', 'Sale', 7200000, 0, 'Punjab', 'Moga'),
(300, 'Rural Farmhouse', 'Farmhouse in a rural setting with open spaces', 'Rent', 0, 22000, 'Punjab', 'Firozpur'),
(301, 'Royal Palace', 'Magnificent royal palace in the heart of Jaipur', 'Both', 22800000, 120000, 'Rajasthan', 'Jaipur'),
(302, 'Desert Retreat', 'Luxurious retreat in the Thar Desert', 'Rent', 0, 32000, 'Rajasthan', 'Jodhpur'),
(303, 'Lakeview Villa', 'Villa with stunning views of Udaipur\'s lakes', 'Sale', 9800000, 0, 'Rajasthan', 'Udaipur'),
(304, 'City Center Apartment', 'Modern apartment in the bustling city center', 'Rent', 0, 25000, 'Rajasthan', 'Kota'),
(305, 'Haveli', 'Traditional haveli with intricate architecture', 'Both', 7200000, 42000, 'Rajasthan', 'Bikaner'),
(306, 'Countryside Cottage', 'Charming cottage in the serene Rajasthan countryside', 'Sale', 5800000, 0, 'Rajasthan', 'Ajmer'),
(307, 'Camel Safari Camp', 'Campsite offering unique camel safari experiences', 'Rent', 0, 18000, 'Rajasthan', 'Pushkar'),
(308, 'Mountain View Bungalow', 'Bungalow with panoramic views of the Aravalli Range', 'Both', 8500000, 45000, 'Rajasthan', 'Mount Abu'),
(309, 'Cityscape Apartment', 'Apartment with views of the cityscape in Jaisalmer', 'Sale', 7200000, 0, 'Rajasthan', 'Jaisalmer'),
(310, 'Rural Farmhouse', 'Farmhouse in a rural setting with traditional charm', 'Rent', 0, 22000, 'Rajasthan', 'Sikar'),
(311, 'Mountain View Cottage', 'Cozy cottage with breathtaking views of the Himalayas', 'Both', 5200000, 28000, 'Sikkim', 'Gangtok'),
(312, 'Riverside Retreat', 'Retreat along the serene banks of Teesta River', 'Rent', 0, 18000, 'Sikkim', 'Namchi'),
(313, 'Hillside Bungalow', 'Bungalow perched on the hills with panoramic views', 'Sale', 7500000, 0, 'Sikkim', 'Rangpo'),
(314, 'City Center Apartment', 'Modern apartment in the heart of Gangtok', 'Rent', 0, 25000, 'Sikkim', 'Mangan'),
(315, 'Valley View Villa', 'Villa offering scenic views of the lush valleys', 'Both', 8500000, 45000, 'Sikkim', 'Singtam'),
(316, 'Countryside Cabin', 'Charming cabin in the peaceful Sikkim countryside', 'Sale', 6800000, 0, 'Sikkim', 'Soreng'),
(317, 'Lakeside Chalet', 'Chalet with a picturesque view of a serene lake', 'Rent', 0, 20000, 'Sikkim', 'Gyalshing'),
(318, 'Mountain View Lodge', 'Lodge with stunning views of the snow-capped mountains', 'Both', 5800000, 32000, 'Sikkim', 'Lachen'),
(319, 'Hilltop Retreat', 'Secluded retreat on the hills for tranquility', 'Sale', 7200000, 0, 'Sikkim', 'Majitar'),
(320, 'Cityscape Apartment', 'Apartment with views of Gangtok cityscape', 'Rent', 0, 22000, 'Sikkim', 'Jorethang'),
(321, 'Marina View Apartment', 'Luxury apartment with stunning views of Marina Beach', 'Both', 11200000, 55000, 'Tamil Nadu', 'Chennai'),
(322, 'Hillside Retreat', 'Secluded retreat nestled in the Nilgiri Hills', 'Rent', 0, 22000, 'Tamil Nadu', 'Ooty'),
(323, 'Beachfront Villa', 'Villa with direct access to the pristine beach', 'Sale', 15800000, 0, 'Tamil Nadu', 'Puducherry'),
(324, 'City Center Apartment', 'Modern apartment in the heart of Chennai', 'Rent', 0, 28000, 'Tamil Nadu', 'Coimbatore'),
(325, 'Heritage House', 'Traditional house with architectural charm', 'Both', 7800000, 42000, 'Tamil Nadu', 'Madurai'),
(326, 'Countryside Cottage', 'Charming cottage in the serene Tamil Nadu countryside', 'Sale', 6800000, 0, 'Tamil Nadu', 'Tiruchirappalli'),
(327, 'Hill Station Chalet', 'Chalet in the scenic hill station of Kodaikanal', 'Rent', 0, 18000, 'Tamil Nadu', 'Kodaikanal'),
(328, 'Mountain View Bungalow', 'Bungalow with panoramic views of the Western Ghats', 'Both', 8500000, 45000, 'Tamil Nadu', 'Dindigul'),
(329, 'Cityscape Apartment', 'Apartment with views of the cityscape in Coimbatore', 'Sale', 7200000, 0, 'Tamil Nadu', 'Tirunelveli'),
(330, 'Rural Farmhouse', 'Farmhouse in a rural setting with open spaces', 'Rent', 0, 22000, 'Tamil Nadu', 'Nagercoil'),
(331, 'City View Apartment', 'Modern apartment with city skyline views', 'Both', 6500000, 35000, 'Telangana', 'Hyderabad'),
(332, 'Riverside Villa', 'Villa with a private riverside setting', 'Rent', 0, 18000, 'Telangana', 'Warangal'),
(333, 'Luxury Penthouse', 'Opulent penthouse with exclusive amenities', 'Sale', 12800000, 0, 'Telangana', 'Nizamabad'),
(334, 'Downtown Condo', 'Condo in the heart of downtown with urban views', 'Rent', 0, 25000, 'Telangana', 'Karimnagar'),
(335, 'Heritage House', 'Historic house with architectural charm', 'Both', 7800000, 42000, 'Telangana', 'Ramagundam'),
(336, 'Countryside Cottage', 'Charming cottage in the peaceful Telangana countryside', 'Sale', 6800000, 0, 'Telangana', 'Khammam'),
(337, 'Lakefront Retreat', 'Retreat with a view of a tranquil lake', 'Rent', 0, 20000, 'Telangana', 'Mahbubnagar'),
(338, 'Mountain View Bungalow', 'Bungalow with panoramic views of the mountains', 'Both', 8500000, 45000, 'Telangana', 'Nalgonda'),
(339, 'City Center Apartment', 'Apartment in the bustling city center', 'Sale', 7200000, 0, 'Telangana', 'Suryapet'),
(340, 'Rural Farmhouse', 'Farmhouse in a rural setting with open spaces', 'Rent', 0, 22000, 'Telangana', 'Miryalaguda'),
(341, 'Lakeside Cabin', 'Cozy cabin with views of a serene lake', 'Both', 5200000, 28000, 'Tripura', 'Agartala'),
(342, 'Riverside Retreat', 'Retreat along the serene banks of a river', 'Rent', 0, 18000, 'Tripura', 'Udaipur'),
(343, 'Hillside Bungalow', 'Bungalow perched on the hills with panoramic views', 'Sale', 7500000, 0, 'Tripura', 'Belonia'),
(344, 'City Center Apartment', 'Modern apartment in the heart of the city', 'Rent', 0, 25000, 'Tripura', 'Dharmanagar'),
(345, 'Valley View Villa', 'Villa offering panoramic views of the lush valley', 'Both', 8500000, 45000, 'Tripura', 'Ambassa'),
(346, 'Countryside Cabin', 'Charming cabin in the peaceful Tripura countryside', 'Sale', 6800000, 0, 'Tripura', 'Kailasahar'),
(347, 'Lakeside Chalet', 'Charming chalet overlooking a serene lake', 'Rent', 0, 20000, 'Tripura', 'Khowai'),
(348, 'Mountain View Lodge', 'Lodge with stunning views of the surrounding mountains', 'Both', 5800000, 32000, 'Tripura', 'Kamalpur'),
(349, 'Hillside Retreat', 'Secluded retreat on the slopes of the hills', 'Sale', 7200000, 0, 'Tripura', 'Sonamura'),
(350, 'Cityscape Apartment', 'Apartment with views of the cityscape', 'Rent', 0, 22000, 'Tripura', 'Santirbazar'),
(351, 'Heritage Haveli', 'Ornate heritage haveli from history', 'Both', 28900000, 0, 'Uttar Pradesh', 'Lucknow'),
(352, 'Forest Cabin', 'Cozy log cabin in dense pine forests', 'Rent', 0, 45000, 'Uttar Pradesh', 'Kanpur'),
(353, 'Farm Villa', 'Spectacular farm villa outside city', 'Both', 7580000, 220000, 'Uttar Pradesh', 'Agra'),
(354, 'Houseboat', 'Grand luxury houseboat to sail waters', 'Sale', 6380000, 0, 'Uttar Pradesh', 'Varanasi'),
(355, 'Mountain Chalet', 'Charming mountain chalet with views', 'Rent', 0, 58000, 'Uttar Pradesh', 'Allahabad'),
(356, 'Weekend Cottage', 'Cozy weekend getaway countryside cottage', 'Both', 2850000, 34000, 'Uttar Pradesh', 'Meerut'),
(357, 'Heritage Bungalow', 'Elegant British era heritage bungalow', 'Sale', 4550000, 0, 'Uttar Pradesh', 'Bareilly'),
(358, 'Royal Palace', 'Opulent heritage royal palace hotel', 'Rent', 0, 725000, 'Uttar Pradesh', 'Aligarh'),
(359, 'Farmhouse', 'Beautiful farmhouse outside city', 'Sale', 7000000, 0, 'Uttar Pradesh', 'Moradabad'),
(360, '1 BHK Flat', 'Compact 1 BHK', 'Rent', 0, 8000, 'Uttar Pradesh', 'Saharanpur'),
(361, 'Mountain View Cottage', 'Cozy cottage with breathtaking views of the Himalayas', 'Both', 5200000, 28000, 'Uttarakhand', 'Dehradun'),
(362, 'Riverside Retreat', 'Retreat along the serene banks of Ganges', 'Rent', 0, 18000, 'Uttarakhand', 'Haridwar'),
(363, 'Hillside Bungalow', 'Bungalow perched on the hills with panoramic views', 'Sale', 7500000, 0, 'Uttarakhand', 'Roorkee'),
(364, 'City Center Apartment', 'Modern apartment in the heart of Nainital', 'Rent', 0, 25000, 'Uttarakhand', 'Haldwani'),
(365, 'Valley View Villa', 'Villa offering scenic views of the lush valleys', 'Both', 8500000, 45000, 'Uttarakhand', 'Rudrapur'),
(366, 'Countryside Cabin', 'Charming cabin in the peaceful Uttarakhand countryside', 'Sale', 6800000, 0, 'Uttarakhand', 'Kashipur'),
(367, 'Lakeside Chalet', 'Chalet with a picturesque view of a serene lake', 'Rent', 0, 20000, 'Uttarakhand', 'Rishikesh'),
(368, 'Mountain View Lodge', 'Lodge with stunning views of the snow-capped mountains', 'Both', 5800000, 32000, 'Uttarakhand', 'Pauri'),
(369, 'Hilltop Retreat', 'Secluded retreat on the hills for tranquility', 'Sale', 7200000, 0, 'Uttarakhand', 'Kotdwar'),
(370, 'Cityscape Apartment', 'Apartment with views of the cityscape in Mussoorie', 'Rent', 0, 22000, 'Uttarakhand', 'Tehri'),
(371, 'Marina View Apartment', 'Luxury apartment with views of the Hooghly River', 'Both', 11200000, 55000, 'West Bengal', 'Kolkata'),
(372, 'Tea Estate Bungalow', 'Bungalow within a scenic tea estate', 'Rent', 0, 22000, 'West Bengal', 'Darjeeling'),
(373, 'Beachfront Villa', 'Villa with direct access to the Bay of Bengal', 'Sale', 15800000, 0, 'West Bengal', 'Digha'),
(374, 'City Center Apartment', 'Modern apartment in the heart of Kolkata', 'Rent', 0, 28000, 'West Bengal', 'Howrah'),
(375, 'Heritage House', 'Traditional house with cultural heritage', 'Both', 7800000, 42000, 'West Bengal', 'Asansol'),
(376, 'Countryside Cottage', 'Charming cottage in the serene West Bengal countryside', 'Sale', 6800000, 0, 'West Bengal', 'Durgapur'),
(377, 'Riverfront Retreat', 'Retreat with a view of a tranquil river', 'Rent', 0, 20000, 'West Bengal', 'Bardhaman'),
(378, 'Mountain View Bungalow', 'Bungalow with panoramic views of the Eastern Ghats', 'Both', 8500000, 45000, 'West Bengal', 'Siliguri'),
(379, 'City Center Apartment', 'Apartment in the bustling city center of Siliguri', 'Sale', 7200000, 0, 'West Bengal', 'Kharagpur'),
(380, 'Rural Farmhouse', 'Farmhouse in a rural setting with open spaces', 'Rent', 0, 22000, 'West Bengal', 'Haldia'),
(381, 'Jagtap Niwas', 'A beautiful and pleasant environment house features harmonious design, abundant natural light, lush green surroundings and a serene ambiance that welcomes and soothes', 'Both', 10000000, 50000, 'Maharashtra', 'Satara'),
(382, 'Magic House', '3bhk plot with large balcony', 'Sale', 1000000, 50000, 'Maharashtra', 'Satara'),
(383, 'kwrh wrffiojrw', 'erwlffn3rowfb3ori', 'Sale', 50000, 40000, 'Andhra Pradesh', 'kadapa');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transaction_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `transaction_type` enum('buysale','buyrent','addsale','addrent','addboth') DEFAULT NULL,
  `property_id` int(11) DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transaction_id`, `user_id`, `transaction_type`, `property_id`, `agent_id`) VALUES
(1, 3, 'addboth', 382, 14),
(2, 3, 'buysale', 382, 14),
(3, 3, 'buyrent', 382, 14),
(4, 3, 'addsale', 382, 14),
(5, 3, 'addsale', 383, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone_num` varchar(15) DEFAULT NULL,
  `email_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `phone_num`, `email_id`) VALUES
(1, 'admin123', '$2y$10$I9mLQK4TpbpH5Ct3bhtKveGRAMQVxU0liqf/OMYc4AriB.proijxK', '1234567890', 'jagtapatharv18@gmail.com'),
(2, 'atharv123', '$2y$10$8xP1HPpVoL.v8CA2iDU.IuxGSLqveAK9hJVTaHOx5jyisBBIG3XOi', '1234567890', 'jagtap.atharv21b@iiitg.ac.in'),
(3, 'kedar123', '$2y$10$VuygOyI5fnBOPHV/zkvIcuMjhEfb0WAFXszE0kfRURlUN0RH81FHW', '1234567890', 'jagtap.atharv21b@iiitg.ac.in');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`agentid`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`PropertyID`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
