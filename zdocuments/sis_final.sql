-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 30, 2018 lúc 11:41 AM
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
-- Cơ sở dữ liệu: `sis`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `class`
--

CREATE TABLE `class` (
  `code_class` int(8) UNSIGNED NOT NULL,
  `code_subject` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_students` int(3) UNSIGNED NOT NULL,
  `min_students` int(2) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL,
  `semester` int(5) UNSIGNED NOT NULL,
  `teacher` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `day_start` date NOT NULL,
  `day_finish` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `conditions`
--

CREATE TABLE `conditions` (
  `code_subject` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_condition_subj` char(8) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `educations`
--

CREATE TABLE `educations` (
  `code_education` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) UNSIGNED NOT NULL,
  `code_student` int(8) UNSIGNED NOT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `title` int(11) NOT NULL,
  `content` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `plans`
--

CREATE TABLE `plans` (
  `id` int(11) NOT NULL,
  `code_student` int(8) UNSIGNED NOT NULL,
  `code_class` int(8) UNSIGNED NOT NULL,
  `time_start` time DEFAULT NULL,
  `time_finish` time NOT NULL,
  `address` char(8) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `profile`
--

CREATE TABLE `profile` (
  `code_student` int(8) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` char(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `class` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `learning` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `address` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `regist_subject`
--

CREATE TABLE `regist_subject` (
  `id` int(11) UNSIGNED NOT NULL,
  `code_student` int(8) UNSIGNED NOT NULL,
  `code_subject` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `results`
--

CREATE TABLE `results` (
  `code_student` int(8) UNSIGNED NOT NULL,
  `code_class` int(8) UNSIGNED NOT NULL,
  `process_score` float UNSIGNED NOT NULL,
  `finish_score` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `students`
--

CREATE TABLE `students` (
  `code_student` int(8) UNSIGNED NOT NULL,
  `code_education` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `subjects`
--

CREATE TABLE `subjects` (
  `code_subject` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_education` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_subject_condition` char(8) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `subject_info`
--

CREATE TABLE `subject_info` (
  `code_subject` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `train_credit` int(2) UNSIGNED NOT NULL,
  `learn_credit` int(2) UNSIGNED NOT NULL,
  `type_subject` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` char(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight_P` float UNSIGNED NOT NULL,
  `weight_F` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`code_class`),
  ADD KEY `subject_code_class` (`code_subject`);

--
-- Chỉ mục cho bảng `conditions`
--
ALTER TABLE `conditions`
  ADD PRIMARY KEY (`code_condition_subj`),
  ADD KEY `subject_code_foreign_key` (`code_subject`);

--
-- Chỉ mục cho bảng `educations`
--
ALTER TABLE `educations`
  ADD PRIMARY KEY (`code_education`);

--
-- Chỉ mục cho bảng `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_code_foreign_key_feedback` (`code_student`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_key_code_student_plan` (`code_student`),
  ADD KEY `foreign_key_code_class_plan` (`code_class`);

--
-- Chỉ mục cho bảng `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`code_student`);

--
-- Chỉ mục cho bảng `regist_subject`
--
ALTER TABLE `regist_subject`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_key_code_student_regis` (`code_student`),
  ADD KEY `foreign_key_code_subject_regis` (`code_subject`);

--
-- Chỉ mục cho bảng `results`
--
ALTER TABLE `results`
  ADD KEY `student_code_foreign` (`code_student`),
  ADD KEY `class_code_foreign` (`code_class`);

--
-- Chỉ mục cho bảng `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`code_student`),
  ADD UNIQUE KEY `students_email_unique` (`email`),
  ADD KEY `education_code_foreign_key` (`code_education`);

--
-- Chỉ mục cho bảng `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`code_subject`),
  ADD KEY `condition_code_foreign_key` (`code_subject_condition`);

--
-- Chỉ mục cho bảng `subject_info`
--
ALTER TABLE `subject_info`
  ADD PRIMARY KEY (`code_subject`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `plans`
--
ALTER TABLE `plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `regist_subject`
--
ALTER TABLE `regist_subject`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `subject_code_class` FOREIGN KEY (`code_subject`) REFERENCES `subjects` (`code_subject`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `conditions`
--
ALTER TABLE `conditions`
  ADD CONSTRAINT `subject_code_foreign_key` FOREIGN KEY (`code_subject`) REFERENCES `subjects` (`code_subject`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `student_code_foreign_key_feedback` FOREIGN KEY (`code_student`) REFERENCES `students` (`code_student`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `plans`
--
ALTER TABLE `plans`
  ADD CONSTRAINT `foreign_key_code_class_plan` FOREIGN KEY (`code_class`) REFERENCES `class` (`code_class`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foreign_key_code_student_plan` FOREIGN KEY (`code_student`) REFERENCES `students` (`code_student`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `foreign_key_code_student_profile` FOREIGN KEY (`code_student`) REFERENCES `students` (`code_student`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `regist_subject`
--
ALTER TABLE `regist_subject`
  ADD CONSTRAINT `foreign_key_code_student_regis` FOREIGN KEY (`code_student`) REFERENCES `students` (`code_student`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foreign_key_code_subject_regis` FOREIGN KEY (`code_subject`) REFERENCES `subjects` (`code_subject`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `class_code_foreign` FOREIGN KEY (`code_class`) REFERENCES `class` (`code_class`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_code_foreign` FOREIGN KEY (`code_student`) REFERENCES `students` (`code_student`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `education_code_foreign_key` FOREIGN KEY (`code_education`) REFERENCES `educations` (`code_education`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `condition_code_foreign_key` FOREIGN KEY (`code_subject_condition`) REFERENCES `conditions` (`code_condition_subj`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `subject_info`
--
ALTER TABLE `subject_info`
  ADD CONSTRAINT `subject_code_foreign` FOREIGN KEY (`code_subject`) REFERENCES `subjects` (`code_subject`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
