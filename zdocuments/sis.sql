-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 06, 2018 lúc 07:10 PM
-- Phiên bản máy phục vụ: 10.1.29-MariaDB
-- Phiên bản PHP: 7.2.0

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
-- Cấu trúc bảng cho bảng `dang_ky_hp`
--

CREATE TABLE `dang_ky_hp` (
  `id` int(10) NOT NULL,
  `mssv` int(10) UNSIGNED NOT NULL,
  `mamon` int(10) UNSIGNED NOT NULL,
  `hoc_ky` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dang_ky_hp_tctd`
--

CREATE TABLE `dang_ky_hp_tctd` (
  `id` int(10) NOT NULL,
  `mssv` int(10) UNSIGNED NOT NULL,
  `mamon` int(10) UNSIGNED NOT NULL,
  `hoc_ky` int(2) NOT NULL,
  `ngay_dk` date NOT NULL,
  `trang_thai` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ket_qua_mon`
--

CREATE TABLE `ket_qua_mon` (
  `id` int(10) NOT NULL,
  `mssv` int(10) UNSIGNED NOT NULL,
  `malop` int(10) UNSIGNED NOT NULL,
  `diem_qt` float NOT NULL,
  `diem_kt` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lich_hoc`
--

CREATE TABLE `lich_hoc` (
  `id` int(10) NOT NULL,
  `mssv` int(10) UNSIGNED NOT NULL,
  `ma_lop` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lop_hoc`
--

CREATE TABLE `lop_hoc` (
  `id` int(10) NOT NULL,
  `malop` int(10) UNSIGNED NOT NULL,
  `mamon` int(10) UNSIGNED NOT NULL,
  `hoc_ky` int(2) NOT NULL,
  `vi_tri` char(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thoi_gian` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tin_chi_hocphi_lop` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mon_hoc`
--

CREATE TABLE `mon_hoc` (
  `id` int(10) NOT NULL,
  `ma_mon` int(10) UNSIGNED NOT NULL,
  `ten_mon` varchar(251) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tin_chi` int(2) NOT NULL,
  `khoa_vien` varchar(251) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thoi_luong` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tin_chi_hocphi_HP` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phan_hoi`
--

CREATE TABLE `phan_hoi` (
  `id` int(10) NOT NULL,
  `ma_phan_hoi` int(10) UNSIGNED NOT NULL,
  `tieu_de` varchar(251) COLLATE utf8mb4_unicode_ci NOT NULL,
  `noi_dung` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ngay_dang` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sinh_vien`
--

CREATE TABLE `sinh_vien` (
  `id` int(10) UNSIGNED NOT NULL,
  `mssv` int(10) UNSIGNED NOT NULL,
  `password` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sinh_vien_phan_hoi`
--

CREATE TABLE `sinh_vien_phan_hoi` (
  `id` int(10) NOT NULL,
  `mssv` int(10) UNSIGNED NOT NULL,
  `ma_phanhoi` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thong_tin_sv`
--

CREATE TABLE `thong_tin_sv` (
  `id` int(10) NOT NULL,
  `mssv` int(10) UNSIGNED NOT NULL,
  `ho_ten` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ngay_sinh` date NOT NULL,
  `lop` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chuong_trinh_dao_tao` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `he_hoc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `trang_thai` char(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `dang_ky_hp`
--
ALTER TABLE `dang_ky_hp`
  ADD PRIMARY KEY (`mssv`,`mamon`),
  ADD KEY `hocphandk_foreign_key` (`mamon`);

--
-- Chỉ mục cho bảng `dang_ky_hp_tctd`
--
ALTER TABLE `dang_ky_hp_tctd`
  ADD PRIMARY KEY (`mssv`,`mamon`),
  ADD KEY `monhocdktctd_foreign_key` (`mamon`);

--
-- Chỉ mục cho bảng `ket_qua_mon`
--
ALTER TABLE `ket_qua_mon`
  ADD PRIMARY KEY (`mssv`,`malop`),
  ADD KEY `lophocKQ_foreign_key` (`malop`);

--
-- Chỉ mục cho bảng `lich_hoc`
--
ALTER TABLE `lich_hoc`
  ADD PRIMARY KEY (`mssv`,`ma_lop`),
  ADD KEY `lophoc_foreign_key` (`ma_lop`);

--
-- Chỉ mục cho bảng `lop_hoc`
--
ALTER TABLE `lop_hoc`
  ADD PRIMARY KEY (`malop`,`mamon`),
  ADD KEY `monhoc_foreign_key` (`mamon`);

--
-- Chỉ mục cho bảng `mon_hoc`
--
ALTER TABLE `mon_hoc`
  ADD PRIMARY KEY (`ma_mon`);

--
-- Chỉ mục cho bảng `phan_hoi`
--
ALTER TABLE `phan_hoi`
  ADD PRIMARY KEY (`ma_phan_hoi`);

--
-- Chỉ mục cho bảng `sinh_vien`
--
ALTER TABLE `sinh_vien`
  ADD PRIMARY KEY (`mssv`);

--
-- Chỉ mục cho bảng `sinh_vien_phan_hoi`
--
ALTER TABLE `sinh_vien_phan_hoi`
  ADD PRIMARY KEY (`mssv`,`ma_phanhoi`),
  ADD KEY `phanhoi_foreign_key` (`ma_phanhoi`);

--
-- Chỉ mục cho bảng `thong_tin_sv`
--
ALTER TABLE `thong_tin_sv`
  ADD PRIMARY KEY (`mssv`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `dang_ky_hp`
--
ALTER TABLE `dang_ky_hp`
  ADD CONSTRAINT `hocphandk_foreign_key` FOREIGN KEY (`mamon`) REFERENCES `mon_hoc` (`ma_mon`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sinhvienDK_foreign_key` FOREIGN KEY (`mssv`) REFERENCES `sinh_vien` (`mssv`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `dang_ky_hp_tctd`
--
ALTER TABLE `dang_ky_hp_tctd`
  ADD CONSTRAINT `monhocdktctd_foreign_key` FOREIGN KEY (`mamon`) REFERENCES `mon_hoc` (`ma_mon`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sinhvienkdtctd_foreign_key` FOREIGN KEY (`mssv`) REFERENCES `sinh_vien` (`mssv`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `ket_qua_mon`
--
ALTER TABLE `ket_qua_mon`
  ADD CONSTRAINT `lophocKQ_foreign_key` FOREIGN KEY (`malop`) REFERENCES `lop_hoc` (`malop`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sinhvienKQ_foreign_key` FOREIGN KEY (`mssv`) REFERENCES `sinh_vien` (`mssv`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `lich_hoc`
--
ALTER TABLE `lich_hoc`
  ADD CONSTRAINT `lophoc_foreign_key` FOREIGN KEY (`ma_lop`) REFERENCES `lop_hoc` (`malop`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sinhvienLH_foreign_key` FOREIGN KEY (`mssv`) REFERENCES `sinh_vien` (`mssv`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `lop_hoc`
--
ALTER TABLE `lop_hoc`
  ADD CONSTRAINT `monhoc_foreign_key` FOREIGN KEY (`mamon`) REFERENCES `mon_hoc` (`ma_mon`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `sinh_vien_phan_hoi`
--
ALTER TABLE `sinh_vien_phan_hoi`
  ADD CONSTRAINT `phanhoi_foreign_key` FOREIGN KEY (`ma_phanhoi`) REFERENCES `phan_hoi` (`ma_phan_hoi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sinhvienph_foreign_key` FOREIGN KEY (`mssv`) REFERENCES `sinh_vien` (`mssv`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `thong_tin_sv`
--
ALTER TABLE `thong_tin_sv`
  ADD CONSTRAINT `sinhvien_foreign_key` FOREIGN KEY (`mssv`) REFERENCES `sinh_vien` (`mssv`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
