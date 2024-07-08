-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 08, 2024 lúc 04:22 PM
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
-- Cơ sở dữ liệu: `qlibanthuoc`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitiethoadon`
--

CREATE TABLE `chitiethoadon` (
  `SOHOADON` varchar(20) NOT NULL,
  `MATHUOC` varchar(20) NOT NULL,
  `GIABAN` int(11) NOT NULL,
  `SOLUONG` int(11) NOT NULL,
  `MUCGIAMGIA` int(11) NOT NULL CHECK (`MUCGIAMGIA` between 0 and 100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chitiethoadon`
--

INSERT INTO `chitiethoadon` (`SOHOADON`, `MATHUOC`, `GIABAN`, `SOLUONG`, `MUCGIAMGIA`) VALUES
('HD001', 'T001', 50000, 2, 10),
('HD001', 'T002', 30000, 1, 5),
('HD002', 'T003', 45000, 3, 15),
('HD002', 'T004', 35000, 4, 0),
('HD003', 'T005', 20000, 5, 20),
('HD003', 'T006', 40000, 2, 10),
('HD004', 'T016', 45000, 3, 10),
('HD004', 'T017', 65000, 2, 5),
('HD005', 'T003', 75000, 4, 15),
('HD005', 'T018', 75000, 4, 15),
('HD005', 'T019', 55000, 1, 0),
('HD006', 'T007', 65000, 2, 5),
('HD006', 'T012', 75000, 4, 15),
('HD006', 'T013', 65000, 2, 5),
('HD006', 'T015', 65000, 2, 5),
('HD007', 'T008', 75000, 4, 15),
('HD007', 'T010', 65000, 2, 5),
('HD007', 'T011', 75000, 4, 15);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadonban`
--

CREATE TABLE `hoadonban` (
  `SOHOADON` varchar(20) NOT NULL,
  `MAKHACHHANG` varchar(20) NOT NULL,
  `MANHANVIEN` varchar(20) NOT NULL,
  `NGAYMUA` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `hoadonban`
--

INSERT INTO `hoadonban` (`SOHOADON`, `MAKHACHHANG`, `MANHANVIEN`, `NGAYMUA`) VALUES
('HD001', 'KH001', 'NV001', '2024-01-15'),
('HD002', 'KH002', 'NV002', '2024-02-20'),
('HD003', 'KH003', 'NV003', '2024-03-25'),
('HD004', 'KH004', 'NV004', '2024-04-15'),
('HD005', 'KH005', 'NV005', '2024-05-20'),
('HD006', 'KH004', 'NV004', '2024-05-01'),
('HD007', 'KH005', 'NV005', '2024-05-05');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

CREATE TABLE `khachhang` (
  `MAKHACHHANG` varchar(20) NOT NULL,
  `TENKHACHHANG` varchar(50) NOT NULL,
  `DIACHI` varchar(50) NOT NULL,
  `EMAIL` varchar(50) NOT NULL,
  `DIENTHOAI` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `khachhang`
--

INSERT INTO `khachhang` (`MAKHACHHANG`, `TENKHACHHANG`, `DIACHI`, `EMAIL`, `DIENTHOAI`) VALUES
('KH001', 'Nguyen Van Cuong', '123 Le Loi, Ha Noi', 'nguyenvana@example.com', '0901234567'),
('KH002', 'Tran Thi Thanh', '456 Tran Hung Dao, Ha Noi', 'tranthib@example.com', '0912345678'),
('KH003', 'Le Thi Chi', '789 Nguyen Hue, Ha Noi', 'lethic@example.com', '0923456789'),
('KH004', 'Pham Thi Hai', '123 Nguyen Trai, Ha Noi', 'phamthig@example.com', '0908765432'),
('KH005', 'Bui Van Huy', '456 Ly Thuong Kiet, Ha Noi', 'buivanh@example.com', '0917654321');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhacungcap`
--

CREATE TABLE `nhacungcap` (
  `MACONGTY` varchar(20) NOT NULL,
  `TENCONGTY` varchar(150) NOT NULL,
  `DIACHI` varchar(150) NOT NULL,
  `DIENTHOAI` varchar(13) DEFAULT NULL,
  `EMAIL` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nhacungcap`
--

INSERT INTO `nhacungcap` (`MACONGTY`, `TENCONGTY`, `DIACHI`, `DIENTHOAI`, `EMAIL`) VALUES
('NCC001', 'Công ty cổ phần dược liệu Trung ương 2', '123 Le Loi, TP HCM', '0901234567', 'contact@duoca.com'),
('NCC002', 'Tổng công ty dược Việt Nam – CTCP', '456 Tran Hung Dao, Ha Noi', '0912345678', 'contact@duocb.com'),
('NCC003', 'Công ty cổ phần dược phẩm Trung ương CPC1', '789 Nguyen Hue, Da Nang', '0923456789', 'contact@duocc.com'),
('NCC004', 'Công ty TNHH dược phẩm Khương Duy', 'NN1-NN1A Bạch Mã, Phường 15, Quận 10, TP.HCM', '0912345678', 'kdco@khuongduy.com.vn'),
('NCC005', 'Công ty cổ phần dược phẩm thiết bị y tế Hà Nội (Hapharco)', 'Số 2 Hàng Bài, quận Hoàn Kiếm, TP. Hà Nội', '0923456789', 'Contact@hapharco.com.vn');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhanvien`
--

CREATE TABLE `nhanvien` (
  `MANHANVIEN` varchar(20) NOT NULL,
  `HO` varchar(20) NOT NULL,
  `TEN` varchar(20) NOT NULL,
  `NGAYSINH` date NOT NULL,
  `NGAYLAMVIEC` date NOT NULL,
  `DIACHI` varchar(50) NOT NULL,
  `DIENTHOAI` varchar(13) DEFAULT NULL,
  `LUONGCOBAN` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nhanvien`
--

INSERT INTO `nhanvien` (`MANHANVIEN`, `HO`, `TEN`, `NGAYSINH`, `NGAYLAMVIEC`, `DIACHI`, `DIENTHOAI`, `LUONGCOBAN`) VALUES
('NV001', 'Nguyen', 'Van Dong', '1980-05-15', '2010-01-01', '321 Hai Ba Trung, Ha Noi', '0909876543', 10000000),
('NV002', 'Tran', 'Thi Hong', '1985-07-20', '2012-02-01', '654 Pham Van Dong, Ha Noi', '0918765432', 12000000),
('NV003', 'Le', 'Van Tai', '1990-09-25', '2015-03-01', '987 Le Thanh Ton, Ha Noi', '0927654321', 11000000),
('NV004', 'Pham', 'Thi Khanh', '1982-04-18', '2011-04-01', '321 Tran Phu, Ha Noi', '0908765432', 10500000),
('NV005', 'Bui', 'Van Khai', '1988-08-22', '2013-05-01', '654 Dien Bien Phu, Ha Noi', '0917654321', 11500000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhomthuoc`
--

CREATE TABLE `nhomthuoc` (
  `MANHOMTHUOC` varchar(20) NOT NULL,
  `TENNHOMTHUOC` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nhomthuoc`
--

INSERT INTO `nhomthuoc` (`MANHOMTHUOC`, `TENNHOMTHUOC`) VALUES
('1', 'Thuốc kháng sinh'),
('10', 'Thuốc chống trầm cảm'),
('11', 'Thuốc chống loạn thần'),
('12', 'Thuốc kháng virus'),
('13', 'Thuốc chống đông máu'),
('14', 'Thuốc an thần và gây ngủ'),
('15', 'Thuốc kháng nấm'),
('2', 'Thuốc giảm đau và kháng viêm'),
('3', 'Thuốc điều trị tim mạch'),
('4', 'Thuốc điều trị tiểu đường'),
('5', 'Thuốc chống dị ứng'),
('6', 'Thuốc chống viêm'),
('7', 'Thuốc điều trị loét dạ dày - tá tràng'),
('8', 'Thuốc điều trị hen suyễn và COPD'),
('9', 'Thuốc điều trị ung thư');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thuoc`
--

CREATE TABLE `thuoc` (
  `MATHUOC` varchar(20) NOT NULL,
  `TENTHUOC` varchar(50) NOT NULL,
  `MACONGTY` varchar(20) NOT NULL,
  `MANHOMTHUOC` varchar(20) NOT NULL,
  `NSX` date NOT NULL,
  `HSD` date NOT NULL,
  `SOLUONG` int(11) NOT NULL,
  `DONVITINH` varchar(10) NOT NULL,
  `GIATHUOC` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `thuoc`
--

INSERT INTO `thuoc` (`MATHUOC`, `TENTHUOC`, `MACONGTY`, `MANHOMTHUOC`, `NSX`, `HSD`, `SOLUONG`, `DONVITINH`, `GIATHUOC`) VALUES
('T001', 'Amoxicillin', 'NCC002', '1', '2023-01-01', '2025-01-01', 100, 'Hộp', 50000),
('T002', 'Ibuprofen', 'NCC001', '2', '2023-02-01', '2025-02-01', 200, 'Hộp', 30000),
('T003', 'Lisinopril', 'NCC002', '3', '2023-03-01', '2025-03-01', 150, 'Hộp', 45000),
('T004', 'Metformin', 'NCC002', '4', '2023-04-01', '2025-04-01', 250, 'Hộp', 35000),
('T005', 'Loratadine', 'NCC001', '5', '2023-05-01', '2025-05-01', 300, 'Hộp', 20000),
('T006', 'Prednisone', 'NCC001', '6', '2023-06-01', '2025-06-01', 120, 'Hộp', 40000),
('T007', 'Omeprazole', 'NCC001', '7', '2023-07-01', '2025-07-01', 130, 'Hộp', 50000),
('T008', 'Salbutamol', 'NCC00', '8', '2023-08-01', '2025-08-01', 140, 'Hộp', 45000),
('T009', 'Cyclophosphamide', 'NCC001', '9', '2023-09-01', '2025-09-01', 110, 'Hộp', 60000),
('T010', 'Fluoxetine', 'NCC004', '10', '2023-10-01', '2025-10-01', 115, 'Hộp', 55000),
('T011', 'Risperidone', 'NCC004', '11', '2023-11-01', '2025-11-01', 125, 'Hộp', 50000),
('T012', 'Oseltamivir', 'NCC004', '12', '2023-12-01', '2025-12-01', 135, 'Hộp', 70000),
('T013', 'Warfarin', 'NCC001', '13', '2024-01-01', '2026-01-01', 145, 'Hộp', 40000),
('T014', 'Diazepam', 'NCC004', '14', '2024-02-01', '2026-02-01', 155, 'Hộp', 35000),
('T015', 'Fluconazole', 'NCC001', '15', '2024-03-01', '2026-03-01', 165, 'Hộp', 60000),
('T016', 'Penicillin', 'NCC002', '1', '2023-01-15', '2025-01-15', 180, 'Hộp', 45000),
('T017', 'Ceftriaxone', 'NCC002', '1', '2023-02-20', '2025-02-20', 170, 'Hộp', 65000),
('T018', 'Azithromycin', 'NCC003', '1', '2023-03-25', '2025-03-25', 190, 'Hộp', 75000),
('T019', 'Ciprofloxacin', 'NCC003', '1', '2023-04-30', '2025-04-30', 160, 'Hộp', 55000),
('T020', 'Diclofenac', 'NCC001', '2', '2023-05-10', '2025-05-10', 140, 'Hộp', 35000),
('T021', 'Morphine', 'NCC005', '2', '2023-06-15', '2025-06-15', 130, 'Hộp', 85000),
('T022', 'Amlodipine', 'NCC004', '3', '2023-07-20', '2025-07-20', 120, 'Hộp', 40000),
('T023', 'Atorvastatin', 'NCC005', '3', '2023-08-25', '2025-08-25', 110, 'Hộp', 30000),
('T024', 'Insulin glargine', 'NCC004', '4', '2023-09-30', '2025-09-30', 100, 'Hộp', 95000),
('T025', 'Diphenhydramine', 'NCC005', '5', '2023-10-05', '2025-10-05', 90, 'Hộp', 25000);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  ADD PRIMARY KEY (`SOHOADON`,`MATHUOC`);

--
-- Chỉ mục cho bảng `hoadonban`
--
ALTER TABLE `hoadonban`
  ADD PRIMARY KEY (`SOHOADON`);

--
-- Chỉ mục cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`MAKHACHHANG`);

--
-- Chỉ mục cho bảng `nhacungcap`
--
ALTER TABLE `nhacungcap`
  ADD PRIMARY KEY (`MACONGTY`);

--
-- Chỉ mục cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`MANHANVIEN`);

--
-- Chỉ mục cho bảng `nhomthuoc`
--
ALTER TABLE `nhomthuoc`
  ADD PRIMARY KEY (`MANHOMTHUOC`);

--
-- Chỉ mục cho bảng `thuoc`
--
ALTER TABLE `thuoc`
  ADD PRIMARY KEY (`MATHUOC`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
