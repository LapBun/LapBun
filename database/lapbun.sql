-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 02, 2023 lúc 06:07 AM
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
  `description` varchar(255) NOT NULL,
  `product` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `brand`
--

INSERT INTO `brand` (`id`, `name`, `description`, `product`) VALUES
(1, 'Disney land', 'Disneyland Park is the first theme park of the Walt Disney Company built on the two theme parks at the Disneyland Resort in Anaheim.', 'fearure'),
(2, 'Lego', 'Lego is a line of assembled toys under the Lego Group based in Billund, Denmark.', 'lego toy'),
(3, 'One picec', 'One Piece, once published in Vietnam under the name Pirate Island is a manga for teenagers by author Oda Eiichiro.', 'fearure');

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
(1, 1, 6, 1),
(2, 2, 6, 2),
(3, 1, 6, 123),
(4, 2, 5, 1);

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
('DoctrineMigrations\\Version20230301184230', '2023-03-01 19:42:44', 1064);

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
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `brand` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `created`, `image`, `quantity`, `brand`) VALUES
(1, 'Goku', 150, '2023-02-14', 'GokuSSj1-63f1305746bdb.jpg', 12, 'Dragon Ball'),
(2, 'tuna', 150, '2023-02-14', NULL, 12, 'natu'),
(3, 'Zoro Toy', 1000, '2023-03-02', 'tai-xuong-64001bee38aed.jpg', 1, 'Disney land'),
(4, 'Edward Newgate', 1500, '2023-03-08', 'tai-xuong-1-64001d9f5cd90.jpg', 1, 'One piece'),
(5, 'Kaido', 1400, '2023-03-16', 'tai-xuong-2-64001f5646862.jpg', 1, 'Lego'),
(6, 'kizaru', 1200, '2023-03-07', 'bbt-studios-admiral-borsalino-kizaru-yasakani-no-magatama-sd-scale-resin-statue-1-247x296-64001fe28d2d5.jpg', 1, 'One piece');

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
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
