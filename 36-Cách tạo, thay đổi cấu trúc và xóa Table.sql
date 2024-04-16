CREATE TABLE [nhanvien](
	MaNV INT NOT NULL PRIMARY KEY,
	HoTen VARCHAR(50) NOT NULL,
	Phai VARCHAR(10),
	NgaySinh DATE,
	DiaChi VARCHAR(255),
	SDT VARCHAR(10)
);

-- Tao Table khach hang với số điện thoại bằng 10 kí tự và mỗi kí tự phải từ [0-9]
CREATE TABLE KhachHang(
	MaKH INT IDENTITY(100, 5) NOT NULL PRIMARY KEY,
	TenKH VARCHAR(50) NOT NULL,
	DiaChi VARCHAR(255),
	SDT VARCHAR(10) CHECK (SDT LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);

CREATE TABLE KhachHang_1(
	MaKH INT IDENTITY(100, 5) NOT NULL PRIMARY KEY,
	TenKH VARCHAR(50) NOT NULL,
	DiaChi VARCHAR(255),
	SDT VARCHAR(10) CHECK (LEN(SDT)=10 AND PATINDEX('%[^0-9]%', SDT)=0)
);

-- Thêm cột email
ALTER TABLE nhanvien
ADD Email VARCHAR(100);

-- Thay đổi kiểu dữ liệu column
ALTER TABLE nhanvien
ALTER COLUMN HoTen VARCHAR(100);
-- thêm ràng buộc
ALTER TABLE nhanvien
ADD CONSTRAINT NgaySinhCheck CHECK (NgaySinh < GETDATE());

-- TRUNCATE va DROP
-- Reset data in table
TRUNCATE TABLE KhachHang_1;
-- Xóa table
DROP TABLE KhachHang_1;

-- Bài tập tổng hợp
-- Yêu cầu 1: Tạo bảng sinh viên với các cột sau
create table SinhVien(
	MaSV INT NOT NULL PRIMARY KEY,
	HoTen VARCHAR(50) NOT NULL,
	Lop VARCHAR(20),
	Nganh VARCHAR(20),
	DiemTB FLOAT
);
-- Thêm cột Email vào table SinhVien vs kiểu dữ liệu VARCHAR(100)
ALTER TABLE SinhVien
ADD Email VARCHAR(100)
-- Sửa đổi kiểu dữ liệu cột DiemTB trong bảng SinhVien thành kiểu dữ liệu DECIMAL(2,1)
ALTER TABLE SinhVien
ALTER COLUMN DIemTB DECIMAL(3,1)
-- Xóa cột Nganh khỏi bảng SinhVien
ALTER TABLE SinhVien
DROP COLUMN Nganh
-- Thêm rảng buộc kiểu dữ liệu column DiemTB trong table SinhVien để giá trị phải >=0 và <=10 
ALTER TABLE SinhVien
ADD CONSTRAINT DiemTBCheck CHECK (DiemTB >=0 AND DiemTB <=10);
-- Thêm ràng buộc duy nhất cột MaSV trong table SinhVien
ALTER TABLE SinhVien
ADD CONSTRAINT MaSVUnique UNIQUE (MaSV);
-- Thêm dữ liệu vào table SinhVien thủ công
-- Xóa dữ liệu bảng SinhVien
TRUNCATE TABLE SinhVien
-- Xóa bảng SinhVien
DROP TABLE SinhVien
-- Tạo lại bảng quay lại cái đầu