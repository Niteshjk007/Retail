-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 19, 2023 at 12:25 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `store`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `username` varchar(30) NOT NULL,
  `address` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`username`, `address`) VALUES
('nitesh', 'Chickpet, Banaglore'),
('nitesh', 'Cubbonpete, Bangalore'),
('nitesh', 'Majestic'),
('nitesh', 'Mantri Mall, Bangalore'),
('shreyas', 'Malleshwaram'),
('shreyas', 'Rajajinagar'),
('shreyas', 'Soldevanahalli');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('admin', 'Nitesh'),
('nitesh', '696969'),
('niteshjk', '696969');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `username` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `contact_no` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`username`, `name`, `email`, `password`, `contact_no`) VALUES
('govind', 'Govind Seervi', 'govind@gmail.com', '12345', '3242343414'),
('nitesh', 'Nitesh', 'Nitesh@abc.com', '2002', '1234567890'),
('shreyas', 'Shreyas NM', 'Shreyas@abc.com', '2002', '1234567890');

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `username` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `address` varchar(100) NOT NULL,
  `password` varchar(30) NOT NULL,
  `contact_no` varchar(30) NOT NULL,
  `S_ID` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`username`, `name`, `email`, `address`, `password`, `contact_no`, `S_ID`) VALUES
('Nitesh', 'Nitesh JK', 'Nitesh_1@abc.com', 'Cottonpete', '2002', '1234567890', 1),
('nitesh2', 'Nitesh JK', 'niteshjk16@gmail.com', 'KG Palya', '2002', '7892599494', 4),
('nitesh3', 'Nitesh Anna', 'nites@gmail.com', 'Siddapura', '2002', '9886168959', 5),
('Shreyas', 'Shreyas NM', 'Shreyas_2@abc.com', 'Dasarahalli', '2002', '1234567890', 2),
('shreyasw', 'Shreyas NM', 'shreyasgunda@gmail.com', 'Dasarhalli', '2002', '8878921312', 3);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `ordeS_ID` int(30) NOT NULL,
  `total_price` varchar(30) NOT NULL,
  `order_date` date NOT NULL,
  `order_status` varchar(30) NOT NULL,
  `delivery_address` varchar(70) NOT NULL,
  `username` varchar(30) NOT NULL,
  `S_ID` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`ordeS_ID`, `total_price`, `order_date`, `order_status`, `delivery_address`, `username`, `S_ID`) VALUES
(1, '127998', '2023-01-19', 'DELIVERED', 'Chickpet, Banaglore', 'nitesh', 1),
(2, '84', '2023-01-19', 'DELIVERED', 'Majestic', 'nitesh', 5),
(3, '35055', '2023-01-19', 'DELIVERED', 'KG Palya', 'govind', 2),
(4, '926', '2023-01-19', 'DELIVERED', 'Cubbonpete', 'govind', 4),
(5, '346999', '2023-01-19', 'PLACED', 'Siddapura', 'govind', 1),
(6, '6450', '2023-01-19', 'PLACED', 'Soldevanahalli', 'shreyas', 3),
(7, '107000', '2023-01-19', 'PLACED', 'Majestic', 'nitesh', 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `ordeS_ID` int(30) NOT NULL,
  `product_ID` int(30) NOT NULL,
  `quantity` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`ordeS_ID`, `product_ID`, `quantity`) VALUES
(1, 3, 1),
(1, 5, 1),
(2, 25, 1),
(2, 26, 1),
(3, 8, 1),
(3, 11, 1),
(4, 19, 1),
(4, 20, 1),
(4, 21, 4),
(5, 2, 2),
(5, 4, 1),
(6, 13, 3),
(6, 15, 1),
(6, 17, 2),
(6, 18, 1),
(7, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_ID` int(30) NOT NULL,
  `amount` int(30) NOT NULL,
  `payment_date` date NOT NULL,
  `ordeS_ID` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_ID`, `amount`, `payment_date`, `ordeS_ID`) VALUES
(1, 127998, '2023-01-19', 1),
(2, 35055, '2023-01-19', 3),
(3, 346999, '2023-01-19', 5);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_ID` int(30) NOT NULL,
  `name` varchar(60) NOT NULL,
  `price` int(30) NOT NULL,
  `description` varchar(250) NOT NULL,
  `S_ID` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_ID`, `name`, `price`, `description`, `S_ID`) VALUES
(1, 'MacbookPro', 100000, 'Apple MacBook Pro 2022 (M2, 13.3 Inch, 8GB, 256GB, macOS Monterey, Space Grey)', 1),
(2, 'Acer Predator', 107000, 'Acer Predator Helios 300 G3-572', 1),
(3, 'Galaxy S22 Ultra', 109999, 'S22 Ultra (12GB | 256GB) ', 1),
(4, 'Apple iPhone 14 Pro Max', 132999, 'Apple iPhone 14 Pro Max 128GB Deep Purple', 1),
(5, 'Redmi Note 11 Pro ', 17999, 'Redmi Note 11 Pro (Star Blue, 6GB RAM, 128GB Storage) | 67W Turbo Charge | 120Hz Super AMOLED Display | Charger Included | Get 2 Months of YouTube Premium Free!', 1),
(6, 'Realme GT', 43000, 'Realme GT 256 GB (Racing Yellow, 12 GB RAM)', 1),
(7, 'Pink silk cotton Saree', 4555, 'Fabric Silk Cotton Color Pink Zari Tested Origin Coimbatore , Tamilnadu Style Weaving Wash Care Dry Wash', 2),
(8, 'GREY IKKAT SILK SAREE', 24805, 'Fabric Pure Silk Color Grey Zari German Silver Origin Bhoodan Pochampally,Telangana Print Ikkat Wash Care Dry Wash Silk Mark Included', 2),
(9, 'GREEN SILK COTTON SAREE', 4995, 'Fabric Silk Cotton Color Green Zari Tested Origin Coimbatore , Tamilnadu Style Weaving Wash Care Dry Wash', 2),
(10, 'Pink Kanchipuram Silk Saree', 31485, 'Pink Kanchipuram Silk Saree with Zari Brocade on the body and Zari Border. Includes unstitched blouse.', 2),
(11, 'Green Kanchipuram Silk Saree', 10250, 'Green Kanchipuram Silk Saree with Jacquard With Zari Butta on the body and Zari Border. Includes unstitched blouse.', 2),
(13, 'Levi Ackerman Poster', 500, 'Vintage Poster', 3),
(14, 'Luffy Round Neck Sweatshirt', 1500, 'Sweatshirt Black', 3),
(15, 'One Piece B Set of 6 Action Figure', 1500, 'Action Figures', 3),
(16, 'Eren Yeager OG Photo Frame', 300, 'Photo Frame', 3),
(17, 'Tokyo Revengers Bomber Jacket', 1600, 'Bomber Jacket', 3),
(18, 'Mangekyo Sharingan Poster', 250, 'Naruto sasuke eternal mangekyu sharingan Poster - Naruto shippuden', 3),
(19, 'Amul Milk 1L', 66, 'Amul Taaza Homogenised Toned Milk 1 L (Tetra Pak)', 4),
(20, 'Amul Cheese Block 200 g ', 120, 'Amul Cheese Block 200 g (Carton) Cheese is a dairy product, derived from milk and produced in wide ranges of flavours, textures and forms by coagulation of the milk protein, Casein.', 4),
(21, 'India Gate Super Basmati Rice 1 kg', 185, 'India Gate Super Basmati Rice 1 kg India Gate Super Basmati Rice is defined by its fine texture, long and slender pearlescent white grains, and distinct aroma', 4),
(22, 'Maggi 2-Minute Masala Instant Noodles 560 g', 88, 'Maggi 2-Minute Masala Instant Noodles 560 g Maggi 2-Minutes Noodles have been a classic Indian snack for a good few decades now. Nestle brings you another delicious instant food product - Maggi 2-Minute Masala Instant Noodles!', 4),
(23, 'Cadbury Oreo Original Vanilla Creme Biscuits 300 g', 65, 'Cadbury Oreo Original Vanilla Creme Biscuits 300 g Cadbury Oreo Original Vanilla Creme Biscuits bring together the rich and smooth flavours of creme filling with the bold taste of crunchy chocolate biscuits', 4),
(24, 'KitKat Share Bag 18 g (7 pcs)', 100, 'KitKat Share Bag 18 g (7 pcs) KitKat was first introduced in the UK market in 1935 under the name of Chocolate Crips and has since then remained as the famous four fingers chocolate.', 4),
(25, 'GELUSIL MPS ORIGINAL MINT FLAVOUR Chewable Tablet 15\'s', 20, 'ACTIVATED DIMETHICONE+Dried aluminium hydroxide+MAGNESIUM ALUMINIUM SILICATE HYDRATE', 5),
(26, 'Crocin Pain Relief Tablet 15\'S', 64, 'Crocin Pain Relief Tablet 15\'S', 5),
(27, '3,4-methylenedioxy-methamphetamine (MDMA)', 1000, 'Molly ectasy', 5),
(28, 'Cannabis sativa', 7000, 'The main, active ingredient in marijuana is THC (short for delta-9-tetrahydrocannabinol)', 5),
(29, 'Nicip 100mg Tablet 10\'S', 35, 'NICIP 100MG TABLET contains Nimesulide which belongs to the group of medicines called Non-steroidal anti-inflammatory drugs (NSAIDs).', 5),
(30, 'Volini Spray 100gm', 272, 'VOLINI Spray contains Diclofenac, Linseed Oil, Menthol and Methyl Salicylate Diclofenac sodium and methyl salicylate are non-steroidal anti-inflammatory drugs', 5);

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `review_ID` int(30) NOT NULL,
  `rating` int(30) NOT NULL,
  `description` varchar(100) NOT NULL,
  `ordeS_ID` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`review_ID`, `rating`, `description`, `ordeS_ID`) VALUES
(1, 5, 'Awesome', 1),
(2, 4, 'Fastest Delivery', 2),
(3, 4, 'Great!!!', 4),
(4, 4, 'Wonderfull', 3);

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE `store` (
  `S_ID` int(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `location` varchar(30) NOT NULL,
  `phone_number` varchar(30) NOT NULL,
  `rating` float(2,1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`S_ID`, `name`, `location`, `phone_number`, `rating`) VALUES
(1, 'Tate Stores', 'Majestic', '1234567890', 5.0),
(2, 'Manish Creations', 'Cubbonpete', '1234567890', 4.0),
(3, 'Anime World', 'MG Road', '890782131', 3.0),
(4, 'MS Mart', 'Cottonpete', '9089087890', 4.0),
(5, 'Medical Store', 'Soldevnahalli', '8899228877', 4.0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`username`,`address`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`username`),
  ADD KEY `manager_ibfk_1` (`S_ID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ordeS_ID`),
  ADD KEY `username` (`username`),
  ADD KEY `S_ID` (`S_ID`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`ordeS_ID`,`product_ID`),
  ADD KEY `product_ID` (`product_ID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_ID`),
  ADD KEY `ordeS_ID` (`ordeS_ID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_ID`),
  ADD KEY `products_ibfk_1` (`S_ID`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`review_ID`),
  ADD KEY `ordeS_ID` (`ordeS_ID`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`S_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `ordeS_ID` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_ID` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_ID` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `review_ID` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `store`
--
ALTER TABLE `store`
  MODIFY `S_ID` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`username`) REFERENCES `customer` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `manager`
--
ALTER TABLE `manager`
  ADD CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`S_ID`) REFERENCES `store` (`S_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`username`) REFERENCES `customer` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`S_ID`) REFERENCES `store` (`S_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`ordeS_ID`) REFERENCES `orders` (`ordeS_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`product_ID`) REFERENCES `products` (`product_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`ordeS_ID`) REFERENCES `orders` (`ordeS_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`S_ID`) REFERENCES `store` (`S_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`ordeS_ID`) REFERENCES `orders` (`ordeS_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
