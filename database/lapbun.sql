-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 05, 2023 lúc 08:23 PM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `lapbun`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `brand`
--

INSERT INTO `brand` (`id`, `name`, `description`) VALUES
(1, 'Disney land', 'Disneyland Park is the first theme park of the Walt Disney Company built on the two theme parks at the Disneyland Resort in Anaheim.'),
(2, 'Lego', 'Lego is a line of assembled toys under the Lego Group based in Billund, Denmark.'),
(3, 'One piece', 'One Piece, once published in Vietnam under the name Pirate Island is a manga for teenagers by author Oda Eiichiro.'),
(4, 'Dragon ball', 'Manga popular of art Akkiratoriyama'),
(5, 'Naruto', 'Anime about ninja'),
(6, 'AOT', 'Attack on Titan');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `procart_id` int(11) NOT NULL,
  `uscart_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`id`, `procart_id`, `uscart_id`, `quantity`) VALUES
(6, 7, 6, 1),
(7, 7, 9, 1),
(8, 7, 9, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230214200144', '2023-02-14 21:01:55', 130),
('DoctrineMigrations\\Version20230220115620', '2023-02-20 12:56:27', 103),
('DoctrineMigrations\\Version20230220130311', '2023-02-20 14:04:41', 65),
('DoctrineMigrations\\Version20230221112856', '2023-02-21 12:29:59', 84),
('DoctrineMigrations\\Version20230221113330', '2023-02-21 12:33:40', 59),
('DoctrineMigrations\\Version20230221132331', '2023-02-21 14:23:41', 187),
('DoctrineMigrations\\Version20230301184230', '2023-03-01 19:42:44', 1064),
('DoctrineMigrations\\Version20230302110306', '2023-03-02 12:03:14', 63),
('DoctrineMigrations\\Version20230303104910', '2023-03-03 11:49:14', 259),
('DoctrineMigrations\\Version20230303105435', '2023-03-03 11:54:43', 102),
('DoctrineMigrations\\Version20230305174947', '2023-03-05 18:49:58', 1030),
('DoctrineMigrations\\Version20230305180403', '2023-03-05 19:04:13', 166);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `createdate` date NOT NULL,
  `quantity` int(11) NOT NULL,
  `ouser` varchar(255) NOT NULL,
  `oproduct` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `createdate`, `quantity`, `ouser`, `oproduct`) VALUES
(1, '2023-03-04', 1, 'An@gmail.com', 'Enel'),
(6, '2023-03-04', 1, 'An@gmail.com', 'Enel'),
(7, '2023-03-04', 1, 'An@gmail.com', 'Enel');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `created` date NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `created`, `image`, `quantity`, `brand_id`) VALUES
(1, 'Goku', 1500, '2023-02-14', 'GokuSSj1-640097201bffb.jpg', 12, 4),
(7, 'Enel', 1250, '2023-01-17', 'Enel-640099796f873.jpg', 16, 3),
(8, 'Luffy Gear 4', 1625, '2023-01-18', 'LuffyG4Wano-6400999d0a17d.jpg', 32, 3),
(9, 'Luffy Gear 4 bound man', 1725, '2023-01-12', 'LuffyG4-640099f421c2d.jpg', 16, 3),
(10, 'Levi', 1360, '2023-02-08', 'levi-64009aa5a6456.webp', 13, 6),
(11, 'Naruto kyubi', 1725, '2023-02-09', 'NarutoKuybi-64009accb5755.jpg', 13, 5),
(12, 'Dragon ball combo', 3636, '2023-01-13', 'ComboS11SDBZ-64009b0e522e8.jpg', 3, 4),
(13, 'Obito', 1120, '2023-01-19', 'Obito-6402958688b96.webp', 13, 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `telephone` int(11) NOT NULL,
  `birthday` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `name`, `address`, `telephone`, `birthday`) VALUES
(5, 'admin@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$.UbDM.wTfROmRrWD42gE4uQiTyJbNzukA/jiyHXbwCtDO9/nIs5bm', 'Annn', '20 hoa son', 917379031, '2002-06-22'),
(6, 'letfortrue@gmail.com', '[\"ROLE_USER\"]', '$2y$13$JFjcHLJ78Iz6jh3ml8FAze0/W2EBPf8nOszIou0vuhq0dYxoJraFO', 'Ann laboon', 'hoa son', 917379032, '2002-06-13'),
(7, 'admin1@gmail.com', '[\"ROLE_USER\"]', '$2y$13$CljijQBuFepzubsPjEyL2OmZTIZG7upWbGYubgl0MD8a8lerUP.xa', 'ngochien', 'cantho', 866581786, '2023-02-26'),
(8, 'jimbe@gmail.com', '[\"ROLE_USER\"]', '$2y$13$rBORY82UaFSbvYHaLe3ple8XXDOpxUHc2d2q4wf/h6EFfxMSI/coO', 'Ha Ngoc Hien', 'cantho', 866581786, '2023-02-27'),
(9, 'An@gmail.com', '[\"ROLE_USER\"]', '$2y$13$LjBU4ION4V5.K3zm7ddrJOwrYk62OfT.4VodEpdLe35Fj1g.cHBku', 'An an', 'can tho', 2147483647, '2023-03-16'),
(10, 'kien@gmail.com', '[\"ROLE_USER\"]', '$2y$13$Zwnl7rINDyvYoA/zD7OcV.Br7GnC3CHEKYta0Pkd1AoJB672zHy32', 'Kien', 'can tho', 566256263, '2023-03-16');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_BA388B745E4A66B` (`procart_id`),
  ADD KEY `IDX_BA388B7F95B1686` (`uscart_id`);

--
-- Chỉ mục cho bảng `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Chỉ mục cho bảng `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D34A04AD44F5D008` (`brand_id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `FK_BA388B745E4A66B` FOREIGN KEY (`procart_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_BA388B7F95B1686` FOREIGN KEY (`uscart_id`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD44F5D008` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
