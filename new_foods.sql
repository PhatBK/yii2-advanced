-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 26, 2018 lúc 09:46 AM
-- Phiên bản máy phục vụ: 10.1.36-MariaDB
-- Phiên bản PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `foods`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

CREATE TABLE `bill` (
  `code` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_food` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_user` int(11) NOT NULL,
  `total` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `book`
--

CREATE TABLE `book` (
  `code` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_table` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_user` int(11) NOT NULL,
  `time` time NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `book`
--

INSERT INTO `book` (`code`, `code_table`, `code_user`, `time`, `date`) VALUES
('B0001', 'T0001', 1, '09:30:00', '2018-10-26'),
('B0002', 'T0001', 1, '22:00:12', '2018-10-25'),
('B475h', 'T4560', 1, '11:48:05', '2018-10-26'),
('B6754', 'T4560', 1, '11:47:26', '2018-10-26');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `code` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `view` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`code`, `name`, `view`) VALUES
('aabb', 'Ăn Chay', 1),
('csad', 'Lẩu', 1),
('dqwdw', 'Rau Củ', 1),
('dsdd', 'Đồ Nướng', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chef`
--

CREATE TABLE `chef` (
  `code` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int(10) UNSIGNED NOT NULL,
  `sex` tinyint(1) NOT NULL,
  `experience` int(2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chef`
--

INSERT INTO `chef` (`code`, `name`, `age`, `sex`, `experience`) VALUES
('A0001', 'Nguyễn Huy Phát', 22, 1, 1),
('B0001', 'Cao Đức Phát', 60, 1, 20);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `feedback`
--

CREATE TABLE `feedback` (
  `code` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_user` int(11) NOT NULL,
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `foods`
--

CREATE TABLE `foods` (
  `code` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_category` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `images`
--

CREATE TABLE `images` (
  `code_food` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_link` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menu`
--

CREATE TABLE `menu` (
  `code` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_food` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_table` char(5) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1540454479),
('m130524_201442_init', 1540454483);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nutrition`
--

CREATE TABLE `nutrition` (
  `code_food` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `protein` float UNSIGNED NOT NULL,
  `fast` float UNSIGNED NOT NULL,
  `carbon` float UNSIGNED NOT NULL,
  `fiber` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rate`
--

CREATE TABLE `rate` (
  `code` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_user` int(11) NOT NULL,
  `code_food` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scores` int(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `raw`
--

CREATE TABLE `raw` (
  `code` int(5) NOT NULL,
  `code_food` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `origin` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tables`
--

CREATE TABLE `tables` (
  `code` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `orders` int(4) UNSIGNED NOT NULL,
  `capacity` int(2) UNSIGNED NOT NULL,
  `status` int(1) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tables`
--

INSERT INTO `tables` (`code`, `orders`, `capacity`, `status`) VALUES
('T0001', 1, 5, 0),
('T0002', 6, 8, 1),
('T4560', 300, 12, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `task`
--

CREATE TABLE `task` (
  `code` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_food` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_chef` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(1) UNSIGNED DEFAULT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `level` int(1) NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `username`, `level`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'phatbk', 0, '123456789', '123456789', '123456789', 'phatsn11081996@gmail.com', 0, 26102018, 26102018);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `video`
--

CREATE TABLE `video` (
  `code` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_food` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varbinary(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`code`),
  ADD KEY `foreign_key_foods` (`code_food`),
  ADD KEY `foreign_key_user` (`code_user`);

--
-- Chỉ mục cho bảng `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`code`),
  ADD KEY `foreign_key_table` (`code_table`),
  ADD KEY `foreign_key_user_book` (`code_user`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`code`);

--
-- Chỉ mục cho bảng `chef`
--
ALTER TABLE `chef`
  ADD PRIMARY KEY (`code`);

--
-- Chỉ mục cho bảng `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`code`),
  ADD KEY `foreign_key_user_feedback` (`code_user`);

--
-- Chỉ mục cho bảng `foods`
--
ALTER TABLE `foods`
  ADD PRIMARY KEY (`code`),
  ADD KEY `foreign_key_category` (`code_category`);

--
-- Chỉ mục cho bảng `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`code_food`);

--
-- Chỉ mục cho bảng `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`code`),
  ADD KEY `foreign_key_tables_menu` (`code_table`),
  ADD KEY `foreign_key_foods_menu` (`code_food`);

--
-- Chỉ mục cho bảng `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Chỉ mục cho bảng `nutrition`
--
ALTER TABLE `nutrition`
  ADD PRIMARY KEY (`code_food`);

--
-- Chỉ mục cho bảng `rate`
--
ALTER TABLE `rate`
  ADD PRIMARY KEY (`code`),
  ADD KEY `foreign_key_foods_rate` (`code_food`),
  ADD KEY `foreign_key_user_rate` (`code_user`);

--
-- Chỉ mục cho bảng `raw`
--
ALTER TABLE `raw`
  ADD PRIMARY KEY (`code`),
  ADD KEY `code_food` (`code_food`);

--
-- Chỉ mục cho bảng `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`code`);

--
-- Chỉ mục cho bảng `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`code`),
  ADD KEY `code_food` (`code_food`,`code_chef`),
  ADD KEY `foreign_key_chef_task` (`code_chef`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- Chỉ mục cho bảng `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`code`),
  ADD KEY `code_food` (`code_food`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `foreign_key_foods` FOREIGN KEY (`code_food`) REFERENCES `foods` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foreign_key_user` FOREIGN KEY (`code_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `foreign_key_table` FOREIGN KEY (`code_table`) REFERENCES `tables` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foreign_key_user_book` FOREIGN KEY (`code_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `foreign_key_user_feedback` FOREIGN KEY (`code_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `foods`
--
ALTER TABLE `foods`
  ADD CONSTRAINT `foreign_key_category` FOREIGN KEY (`code_category`) REFERENCES `category` (`code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `foreign_key_foods_image` FOREIGN KEY (`code_food`) REFERENCES `foods` (`code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `foreign_key_foods_menu` FOREIGN KEY (`code_food`) REFERENCES `foods` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foreign_key_tables_menu` FOREIGN KEY (`code_table`) REFERENCES `tables` (`code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `nutrition`
--
ALTER TABLE `nutrition`
  ADD CONSTRAINT `foreign_key_food_natrition` FOREIGN KEY (`code_food`) REFERENCES `foods` (`code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `rate`
--
ALTER TABLE `rate`
  ADD CONSTRAINT `foreign_key_foods_rate` FOREIGN KEY (`code_food`) REFERENCES `foods` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foreign_key_user_rate` FOREIGN KEY (`code_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `raw`
--
ALTER TABLE `raw`
  ADD CONSTRAINT `foreign_key_foods_raw` FOREIGN KEY (`code_food`) REFERENCES `foods` (`code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `foreign_key_chef_task` FOREIGN KEY (`code_chef`) REFERENCES `chef` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foreign_key_foods_task` FOREIGN KEY (`code_food`) REFERENCES `foods` (`code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `video`
--
ALTER TABLE `video`
  ADD CONSTRAINT `foreign_key_foods_video` FOREIGN KEY (`code_food`) REFERENCES `foods` (`code`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
