-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 17, 2023 lúc 07:14 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shopping`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', 'f925916e2754e5e03f75dd58a5733251', '2017-01-24 16:21:18', '21-06-2018 08:27:55 PM');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext DEFAULT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(3, 'Whey Protein', 'Whey Protein', '2017-01-24 19:17:37', '17-11-2023 04:30:20 AM'),
(4, 'Sua tang can', 'Sua tang can', '2017-01-24 19:19:32', '17-11-2023 04:31:49 AM'),
(5, 'Protein thuc vat', 'Protein thuc vat', '2017-01-24 19:19:54', '17-11-2023 04:32:14 AM'),
(6, 'Dinh duong chay bo', 'Dinh duong chay bo', '2017-02-20 19:18:52', '17-11-2023 04:32:37 AM');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `paymentMethod` varchar(50) DEFAULT NULL,
  `orderStatus` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `userId`, `productId`, `quantity`, `orderDate`, `paymentMethod`, `orderStatus`) VALUES
(1, 1, '3', 1, '2017-03-07 19:32:57', 'COD', NULL),
(3, 1, '4', 1, '2017-03-10 19:43:04', 'Debit / Credit card', 'Delivered'),
(4, 1, '17', 1, '2017-03-08 16:14:17', 'COD', 'in Process'),
(5, 1, '3', 1, '2017-03-08 19:21:38', 'COD', NULL),
(6, 1, '4', 1, '2017-03-08 19:21:38', 'COD', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ordertrackhistory`
--

CREATE TABLE `ordertrackhistory` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `ordertrackhistory`
--

INSERT INTO `ordertrackhistory` (`id`, `orderId`, `status`, `remark`, `postingDate`) VALUES
(1, 3, 'in Process', 'Order has been Shipped.', '2017-03-10 19:36:45'),
(2, 1, 'Delivered', 'Order Has been delivered', '2017-03-10 19:37:31'),
(3, 3, 'Delivered', 'Product delivered successfully', '2017-03-10 19:43:04'),
(4, 4, 'in Process', 'Product ready for Shipping', '2017-03-10 19:50:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `productreviews`
--

CREATE TABLE `productreviews` (
  `id` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `review` longtext DEFAULT NULL,
  `reviewDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `productreviews`
--

INSERT INTO `productreviews` (`id`, `productId`, `quality`, `price`, `value`, `name`, `summary`, `review`, `reviewDate`) VALUES
(2, 3, 4, 5, 5, 'Anuj Kumar', 'BEST PRODUCT FOR ME :)', 'BEST PRODUCT FOR ME :)', '2017-02-26 20:43:57'),
(3, 3, 3, 4, 3, 'Sarita pandey', 'Nice Product', 'Value for money', '2017-02-26 20:52:46'),
(4, 3, 3, 4, 3, 'Sarita pandey', 'Nice Product', 'Value for money', '2017-02-26 20:59:19');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subCategory` int(11) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productCompany` varchar(255) DEFAULT NULL,
  `productPrice` int(11) DEFAULT NULL,
  `productPriceBeforeDiscount` int(11) DEFAULT NULL,
  `productDescription` longtext DEFAULT NULL,
  `productImage1` varchar(255) DEFAULT NULL,
  `productImage2` varchar(255) DEFAULT NULL,
  `productImage3` varchar(255) DEFAULT NULL,
  `shippingCharge` int(11) DEFAULT NULL,
  `productAvailability` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`) VALUES
(1, 4, 3, 'Serious Mass 6Lbs (2.7kg)', 'nhom4', 20400, 24000, '<div class=\"HoUsOy\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; font-size: 18px; white-space: nowrap; line-height: 1.4; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif;\">sua tang can</div><ul style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 0px; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\"><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\"><br></li></ul></li></ul>', 'lean-body-4-6lbs-30-servings-600x600.webp', 'lean-body-mrp-1-goi-17.webp', 'lean-body-mrp-1-goi-17.webp', 1200, 'In Stock', '2017-01-30 16:54:35', ''),
(2, 4, 4, 'Serious Mass 12Lbs (5.4kg)', 'nhom4', 36990, 2147483647, '<h1 class=\"product_title entry-title\" style=\"box-sizing: border-box; margin-bottom: 6px; line-height: 30px; font-size: 22px; clear: none; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, sans-serif;\">Serious Mass 12Lbs (5.4kg)</h1><div class=\"woocommerce-product-rating\" style=\"box-sizing: border-box; line-height: 2; display: flex; flex-wrap: wrap; align-items: center; margin-bottom: 1.618em; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; margin-top: 0px !important; margin-right: 0px !important; margin-left: 0px !important;\"><div class=\"star-rating\" role=\"img\" aria-label=\"???c x?p h?ng 4.81 5 sao\" style=\"box-sizing: border-box; float: none; overflow: hidden; position: relative; height: 16px; line-height: 1.2em; font-size: 12px; width: 66px !important; font-family: star; margin: auto 0px; display: inline-block; vertical-align: middle;\"></div></div>', 'serious-mass-12lbs-5-4kg-54.webp', 'serious-mass-12lbs-5-4kg-54.webp', 'serious-mass-12lbs-5-4kg-54.webp', 30, 'In Stock', '2017-01-30 16:59:00', ''),
(3, 4, 4, 'Ostrovit Vitamin Vit&Min (90 viên)', 'nhom4', 10999, 200000, '<div><div><h1 class=\"product_title entry-title\" style=\"box-sizing: border-box; margin-bottom: 6px; line-height: 30px; font-size: 22px; clear: none; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, sans-serif;\">Ostrovit Vitamin Vit&amp;Min (90 viên)</h1><div><br></div><div class=\"woocommerce-product-rating\" style=\"box-sizing: border-box; line-height: 2; display: flex; flex-wrap: wrap; align-items: center; margin-bottom: 1.618em; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; margin-top: 0px !important; margin-right: 0px !important; margin-left: 0px !important;\"></div></div></div>', 'ostrovit-vit-min-01.webp', 'ostrovit-vit-min-01.webp', 'ostrovit-vit-min-01.webp', 30, 'In Stock', '2017-02-04 04:03:15', ''),
(4, 4, 4, 'Mutant Mass XXXtreme 22Lbs (10kg)', 'nhom4', 9999, 2147483647, '<div><h1 class=\"product_title entry-title\" style=\"box-sizing: border-box; margin-bottom: 6px; line-height: 30px; font-size: 22px; clear: none; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, sans-serif;\">Mutant Mass XXXtreme 22Lbs (10kg)</h1><div class=\"woocommerce-product-rating\" style=\"box-sizing: border-box; line-height: 2; display: flex; flex-wrap: wrap; align-items: center; margin-bottom: 1.618em; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; margin-top: 0px !important; margin-right: 0px !important; margin-left: 0px !important;\"><div class=\"star-rating\" role=\"img\" aria-label=\"???c x?p h?ng 4.48 5 sao\" style=\"box-sizing: border-box; float: none; overflow: hidden; position: relative; height: 16px; line-height: 1.2em; font-size: 12px; width: 66px !important; font-family: star; margin: auto 0px; display: inline-block; vertical-align: middle;\"></div></div></div>', 'Mutant-Mass-XXXtreme-22Lbs-_10kg_.webp', 'Mutant-Mass-XXXtreme-22Lbs-_10kg_.webp', 'Mutant-Mass-XXXtreme-22Lbs-_10kg_.webp', 45, 'In Stock', '2017-02-04 04:04:43', ''),
(5, 4, 4, 'Mutant Iso Surge 1.6Lbs (720g)', 'nhom4', 11999, 2147483647, '<div><h1 class=\"product_title entry-title\" style=\"box-sizing: border-box; margin-bottom: 6px; line-height: 30px; font-size: 22px; clear: none; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, sans-serif;\">Mutant Iso Surge 1.6Lbs (720g)</h1><div class=\"woocommerce-product-rating\" style=\"box-sizing: border-box; line-height: 2; display: flex; flex-wrap: wrap; align-items: center; margin-bottom: 1.618em; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; margin-top: 0px !important; margin-right: 0px !important; margin-left: 0px !important;\"><div class=\"star-rating\" role=\"img\" aria-label=\"???c x?p h?ng 4.83 5 sao\" style=\"box-sizing: border-box; float: none; overflow: hidden; position: relative; height: 16px; line-height: 1.2em; font-size: 12px; width: 66px !important; font-family: star; margin: auto 0px; display: inline-block; vertical-align: middle;\"></div></div></div>', 'iso-surge-2lbs-900g.webp', 'iso-surge-2lbs-900g.webp', 'iso-surge-2lbs-900g.webp', 30, 'In Stock', '2017-02-04 04:06:17', ''),
(6, 4, 4, 'VitaXtrong Real Whey 10Lbs (4.54kg)', 'Nhom4', 6999, 1000000, '<div><h1 class=\"product_title entry-title\" style=\"box-sizing: border-box; margin-bottom: 6px; line-height: 30px; font-size: 22px; clear: none; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, sans-serif;\">VitaXtrong Real Whey 10Lbs (4.54kg)</h1></div>', 'vitaxtrong-real-whey-10lbs1.webp', 'vitaxtrong-real-whey-10lbs1.webp', 'vitaxtrong-real-whey-10lbs1.webp', 35, 'In Stock', '2017-02-04 04:08:07', ''),
(7, 4, 4, 'BiotechUSA 100% Pure Whey 5Lbs (2.27kg)', 'nhom4', 7490, 0, '<div><h1 class=\"product_title entry-title\" style=\"box-sizing: border-box; margin-bottom: 6px; line-height: 30px; font-size: 22px; clear: none; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, sans-serif;\">BiotechUSA 100% Pure Whey 5Lbs (2.27kg)</h1><div><br></div><div class=\"woocommerce-product-rating\" style=\"box-sizing: border-box; line-height: 2; display: flex; flex-wrap: wrap; align-items: center; margin-bottom: 1.618em; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; margin-top: 0px !important; margin-right: 0px !important; margin-left: 0px !important;\"></div></div>', 'samsung-galaxy-on7-sm-1.jpeg', 'samsung-galaxy-on5-sm-2.jpeg', 'samsung-galaxy-on5-sm-3.jpeg', 20, 'In Stock', '2017-02-04 04:10:17', ''),
(8, 4, 4, 'BiotechUSA 100% Pure Whey 5Lbs (2.27kg)', 'nhom4', 14990, 0, '<div><h1 class=\"product_title entry-title\" style=\"box-sizing: border-box; margin-bottom: 6px; line-height: 30px; font-size: 22px; clear: none; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, sans-serif;\">BiotechUSA 100% Pure Whey 5Lbs (2.27kg)</h1><div><br></div><div class=\"woocommerce-product-rating\" style=\"box-sizing: border-box; line-height: 2; display: flex; flex-wrap: wrap; align-items: center; margin-bottom: 1.618em; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; margin-top: 0px !important; margin-right: 0px !important; margin-left: 0px !important;\"></div></div>', 'biotech-hyper-mass-8-8lbs-4kg-600x600.webp', 'biotech-hyper-mass-8-8lbs-4kg-600x600.webp', 'biotech-hyper-mass-8-8lbs-4kg-600x600.webp', 0, 'In Stock', '2017-02-04 04:11:54', ''),
(9, 4, 5, 'BioX Nitro Juice Gainer (4.08kg)', 'nhom4', 259, 0, '<div><h1 class=\"product_title entry-title\" style=\"box-sizing: border-box; margin-bottom: 6px; line-height: 30px; font-size: 22px; clear: none; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, sans-serif;\">BioX Nitro Juice Gainer (4.08kg)</h1><h1 class=\"product_title entry-title\" style=\"box-sizing: border-box; margin-bottom: 6px; line-height: 30px; font-size: 22px; clear: none; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, sans-serif;\"><div class=\"woocommerce-product-rating\" style=\"box-sizing: border-box; line-height: 2; display: flex; flex-wrap: wrap; align-items: center; margin-bottom: 1.618em; font-size: 14px; font-weight: 400; margin-top: 0px !important; margin-right: 0px !important; margin-left: 0px !important;\"><div class=\"star-rating\" role=\"img\" aria-label=\"???c x?p h?ng 5.00 5 sao\" style=\"box-sizing: border-box; float: none; overflow: hidden; position: relative; height: 16px; line-height: 1.2em; font-size: 12px; width: 66px !important; font-family: star; margin: auto 0px; display: inline-block; vertical-align: middle;\"></div></div></h1><div class=\"woocommerce-product-rating\" style=\"box-sizing: border-box; line-height: 2; display: flex; flex-wrap: wrap; align-items: center; margin-bottom: 1.618em; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; margin-top: 0px !important; margin-right: 0px !important; margin-left: 0px !important;\"></div></div>', 'biox-nitro-juice-gainer-4-08kg-2-600x600.webp', 'biox-nitro-juice-gainer-4-08kg-2-600x600.webp', 'biox-nitro-juice-gainer-4-08kg-2-600x600.webp', 10, 'In Stock', '2017-02-04 04:17:03', ''),
(11, 4, 6, 'Blade Mass Gainer (4000g)', 'nhom4', 19990, 0, '<div><h1 class=\"product_title entry-title\" style=\"box-sizing: border-box; margin-bottom: 6px; line-height: 30px; font-size: 22px; clear: none; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, sans-serif;\">Blade Mass Gainer (4000g)</h1><div><br></div><div class=\"woocommerce-product-rating\" style=\"box-sizing: border-box; line-height: 2; display: flex; flex-wrap: wrap; align-items: center; margin-bottom: 1.618em; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; margin-top: 0px !important; margin-right: 0px !important; margin-left: 0px !important;\"></div></div>', 'blade-sport-muscle-maxx-4000g.webp', 'blade-sport-muscle-maxx-4000g.webp', 'blade-sport-muscle-maxx-4000g.webp', 0, 'In Stock', '2017-02-04 04:26:17', ''),
(15, 3, 8, 'Ostrovit Vege Protein Blend (700g)', 'Nhom4', 2050, 2500, '<div><ul><li><span style=\"color: rgb(15, 15, 15); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; white-space-collapse: preserve;\"><b>Ostrovit Vege Protein</b> is a plant-based protein supplement designed to support your fitness and dietary goals. Packed with essential nutrients, it offers a high-quality blend of plant proteins to aid muscle recovery and promote overall well-being. Elevate your nutrition with Ostrovit Vege Protein for a nourishing and sustainable protein source.</span><br></li></ul></div>', 'it-vege-protein-blend-1-54lbs-700g-600x600.webp', 'lipo-6-black-ultra-concentrate-150x150.webp', 'vitaxtrong-100-pure-creatine-5000-500g-150x150.webp', 50, 'In Stock', '2017-02-04 04:35:13', ''),
(16, 3, 8, 'zzz', 'XYZ', 240, 0, '<ul><li>zzz</li></ul>', 'imggym1.jpeg', 'imggym1.jpeg', 'imggym1.jpeg', 30, 'In Stock', '2017-02-04 04:36:23', ''),
(17, 5, 9, 'BiotechUSA Vegan Protein (2000g)', 'nhom4', 32566, 0, '<div><div><h1 class=\"product_title entry-title\" style=\"box-sizing: border-box; margin-bottom: 6px; line-height: 30px; font-size: 22px; clear: none; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, sans-serif;\">BiotechUSA Vegan Protein (2000g)</h1></div></div>', 'biotechusa-vegan-protein-2000g-1.webp', 'biotechusa-vegan-protein-2000g-1.webp', 'biotechusa-vegan-protein-2000g-1.webp', 0, 'In Stock', '2017-02-04 04:40:37', ''),
(18, 5, 10, 'Complete Vege Pro-7 North Coast Naturals (600g)', 'Nhom4', 6523, 0, '<div><div><h1 class=\"product_title entry-title\" style=\"box-sizing: border-box; margin-bottom: 6px; line-height: 30px; font-size: 22px; clear: none; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, sans-serif;\">Complete Vege Pro-7 North Coast Naturals (600g)</h1><div><br></div><div class=\"woocommerce-product-rating\" style=\"box-sizing: border-box; line-height: 2; display: flex; flex-wrap: wrap; align-items: center; margin-bottom: 1.618em; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; margin-top: 0px !important; margin-right: 0px !important; margin-left: 0px !important;\"></div></div></div>', 'vege-pro-7-north-coast-naturals-600g.webp', 'vege-pro-7-north-coast-naturals-600g.webp', 'vege-pro-7-north-coast-naturals-600g.webp', 0, 'In Stock', '2017-02-04 04:42:27', ''),
(19, 6, 12, 'Gel nang luong BiotechUSA ENERGY GEL', 'nhom4', 379, 0, '<ul style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 0px; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\"><li class=\"_2-riNZ\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 8px 16px; list-style: none; position: relative;\"><h1 class=\"product_title entry-title\" style=\"box-sizing: border-box; margin-bottom: 6px; line-height: 30px; font-size: 22px; clear: none; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, sans-serif;\">Gel Nang Luong BiotechUSA ENERGY GEL</h1><div class=\"woocommerce-product-rating\" style=\"box-sizing: border-box; line-height: 2; display: flex; flex-wrap: wrap; align-items: center; margin-bottom: 1.618em; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, sans-serif; margin-top: 0px !important; margin-right: 0px !important; margin-left: 0px !important;\"></div></li><li class=\"_2-riNZ\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 8px 16px; list-style: none; position: relative;\"><div><br></div></li></ul>', 'gel-nang-luong-biotechusa-energy-gel.webp', 'gel-nang-luong-biotechusa-energy-gel.webp', 'gel-nang-luong-biotechusa-energy-gel.webp', 45, 'In Stock', '2017-03-10 20:16:03', ''),
(20, 6, 12, 'Biotech MultiSalt (60 viên)', 'nhom4', 4129, 5000, '<ul style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 0px; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\"><li class=\"_2-riNZ\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 8px 16px; list-style: none; position: relative;\"><h1 class=\"product_title entry-title\" style=\"box-sizing: border-box; margin-bottom: 6px; line-height: 30px; font-size: 22px; clear: none; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, sans-serif;\"><div class=\"woocommerce-product-rating\" style=\"box-sizing: border-box; line-height: 2; display: flex; flex-wrap: wrap; align-items: center; margin-top: 0px !important; margin-right: 0px !important; margin-bottom: 1.618em; margin-left: 0px !important; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"></div></h1><h1 class=\"product_title entry-title\" style=\"box-sizing: border-box; margin: 0px 0px 6px; font-weight: 700; line-height: 30px; font-size: 22px; display: block; clear: none; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">Biotech MultiSalt (60 viên)</h1></li></ul>', 'biotech-multisalt-60-vien-600x600.webp', 'biotech-multisalt-60-vien.webp', 'biotech-multisalt-60-vien.webp', 0, 'In Stock', '2017-03-10 20:19:22', ''),
(23, 7, 13, 'Lean Body MRP', 'NHOM4', 900000, 1000000, 'ithis product so gud&nbsp;', 'logo', 'imggym2.png', 'imggym3.png', 0, 'In Stock', '2023-11-16 22:40:25', NULL),
(24, 3, 8, 's?das', 'ádas', 0, 0, 'adasd', 'imggym1.jpeg', 'imggym1.jpeg', 'imggym2.jpg', 0, 'In Stock', '2023-11-16 22:59:08', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(2, 4, 'Sua Beo', '2017-01-26 16:24:52', '17-11-2023 04:34:12 AM'),
(3, 4, 'Sua Bo Sung Protein', '2017-01-26 16:29:09', '17-11-2023 04:34:39 AM'),
(4, 4, 'Sua bo sung Calo', '2017-01-30 16:55:48', '17-11-2023 04:34:59 AM'),
(5, 4, 'Sua bo sung Vitamin va Khoang chat', '2017-02-04 04:12:40', '17-11-2023 04:40:31 AM'),
(6, 4, 'Sua su dung chat Xo', '2017-02-04 04:13:00', '17-11-2023 04:41:14 AM'),
(7, 4, 'Sua Beo Phi', '2017-02-04 04:13:27', '17-11-2023 04:41:48 AM'),
(8, 3, 'Hydrolyzed Whey Protein', '2017-02-04 04:13:54', '17-11-2023 04:42:39 AM'),
(9, 5, 'Dau va cac loai hat', '2017-02-04 04:36:45', '17-11-2023 04:44:34 AM'),
(10, 5, 'Gao lut va gao nau', '2017-02-04 04:37:02', '17-11-2023 04:45:03 AM'),
(11, 5, 'Cac loai rau cu', '2017-02-04 04:37:51', '17-11-2023 04:45:29 AM'),
(12, 6, 'Protein', '2017-03-10 20:12:59', '17-11-2023 04:46:20 AM'),
(13, 7, 'Hydrolyzed Whey Protein', '2023-11-16 22:33:30', NULL),
(14, 8, 'Whey Protein Isolate', '2023-11-16 22:34:05', NULL),
(15, 9, 'Whey Protein Blend', '2023-11-16 22:34:25', NULL),
(16, 10, 'Meal Replacement', '2023-11-16 22:35:12', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `userlog`
--

INSERT INTO `userlog` (`id`, `userEmail`, `userip`, `loginTime`, `logout`, `status`) VALUES
(1, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 11:18:50', '', 1),
(2, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 11:29:33', '', 1),
(3, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 11:30:11', '', 1),
(4, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 15:00:23', '26-02-2017 11:12:06 PM', 1),
(5, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:08:58', '', 0),
(6, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:09:41', '', 0),
(7, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:10:04', '', 0),
(8, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:10:31', '', 0),
(9, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:13:43', '', 1),
(10, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-27 18:52:58', '', 0),
(11, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-27 18:53:07', '', 1),
(12, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-03 18:00:09', '', 0),
(13, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-03 18:00:15', '', 1),
(14, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-06 18:10:26', '', 1),
(15, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 12:28:16', '', 1),
(16, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 18:43:27', '', 1),
(17, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 18:55:33', '', 1),
(18, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 19:44:29', '', 1),
(19, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-08 19:21:15', '', 1),
(20, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-15 17:19:38', '', 1),
(21, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-15 17:20:36', '15-03-2017 10:50:39 PM', 1),
(22, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-16 01:13:57', '', 1),
(23, 'hgfhgf@gmass.com', 0x3a3a3100000000000000000000000000, '2018-04-29 09:30:40', '', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `shippingAddress` longtext DEFAULT NULL,
  `shippingState` varchar(255) DEFAULT NULL,
  `shippingCity` varchar(255) DEFAULT NULL,
  `shippingPincode` int(11) DEFAULT NULL,
  `billingAddress` longtext DEFAULT NULL,
  `billingState` varchar(255) DEFAULT NULL,
  `billingCity` varchar(255) DEFAULT NULL,
  `billingPincode` int(11) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contactno`, `password`, `shippingAddress`, `shippingState`, `shippingCity`, `shippingPincode`, `billingAddress`, `billingState`, `billingCity`, `billingPincode`, `regDate`, `updationDate`) VALUES
(1, 'Anuj Kumar', 'anuj.lpu1@gmail.com', 9009857868, 'f925916e2754e5e03f75dd58a5733251', 'CS New Delhi', 'New Delhi', 'Delhi', 110001, 'hà n?i', 'hà n?i', 'hà n?i', 110092, '2017-02-04 19:30:50', ''),
(2, 'Amit ', 'amit@gmail.com', 8285703355, '5c428d8875d2948607f3e3fe134d71b4', '', '', '', 0, '', '', '', 0, '2017-03-15 17:21:22', ''),
(3, 'hg', 'hgfhgf@gmass.com', 1121312312, '827ccb0eea8a706c4c34a16891f84e7b', '', '', '', 0, '', '', '', 0, '2018-04-29 09:30:32', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `wishlist`
--

INSERT INTO `wishlist` (`id`, `userId`, `productId`, `postingDate`) VALUES
(1, 1, 0, '2017-02-27 18:53:17');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `productreviews`
--
ALTER TABLE `productreviews`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `productreviews`
--
ALTER TABLE `productreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
