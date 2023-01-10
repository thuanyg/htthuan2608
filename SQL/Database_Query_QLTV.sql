CREATE DATABASE ThuVien
drop database ThuVien
CREATE TABLE Sach (
	MaSH char(10) primary key,
	TenSH nvarchar(200),
	NhaXB nvarchar(50),
	NamXB smallint, --CHECK (NamXB < YEAR(CURDATE()) ),
	SoL smallint CHECK (SoL >= 0),
	Gia float CHECK (Gia >= 0),
	MaVT char(10),
)
CREATE TABLE ViTri (
	MaVT char(10) primary key,
	SoKe smallint CHECK (SoKe >= 0),
)

CREATE TABLE TheLoai (
	MaTL char(10) primary key,
	TenTL nvarchar(30),
	MaVT char(10)
)
CREATE TABLE TheLoaiSach (
	MaTL char(10) not null,
	MaSH char(10) not null
)
CREATE TABLE TacGia (
	MaTG char(10) primary key,
	TenTG nvarchar(50),
	NgaySinh date
)

CREATE TABLE VietSach(
	MaTG char(10) not null,
	MaSH char(10) not null
)
CREATE TABLE ThuThu (
	MaTT char(10) primary key,
	TenTT nvarchar(50),
	NgaySinh date,
	DiaChi nvarchar(100),
	SDT int,
	Email char(50)
)
CREATE TABLE QuanLySach (
	MaTT char(10) not null,
	MaSH char(10) not null
)

CREATE TABLE PhieuMuon (
	MaPM char(10) primary key,
	NgayMuon date,
	NgayTra date, --CHECK (PhieuMuon.NgayTra > PhieuMuon.NgayMuon),
	NgayHenTra date,-- CHECK (PhieuMuon.NgayHenTra > PhieuMuon.NgayMuon),
	MaTT char(10),
	MaThe char(10)
)
CREATE TABLE Muon (
	MaSH char(10) not null,
	MaPM char(10) not null,
	SoLuong int CHECK (SoLuong > 0),
	CONSTRAINT FK01 foreign key (MaSH) references Sach(MaSH),
	CONSTRAINT FK02 foreign key (MaPM) references PhieuMuon(MaPM)
)
CREATE TABLE TheThuVien(
	MaThe char(10) primary key,
	NgayBD date,
	NgayHH date
)
CREATE TABLE DocGia (
	MaDG char(10) primary key,
	HoTen nvarchar(50),
	GT bit,
	NgaySinh date, -- CHECK (NgaySinh < Curdate() ),
	DiaChi nvarchar(100),
	SDT int
)

CREATE TABLE DangKy (
	MaThe char(10),
	MaDG char(10),
	CONSTRAINT PK_DB5 PRIMARY KEY (MaThe, MaDG)
)
CREATE TABLE PhieuNhap (
	MaSH char(10) not null,
	MaTT char(10) not null,
	SoL int,
	NgayNhap date,
	GhiChu nvarchar(50)
)


----- INSERT DATA -----
INSERT INTO Sach 
VALUES	('SH01', N'Đắc Nhân Tâm', N'Trẻ', 1998, 23, 35000, 'VT01'),
		('SH02', N'The One King', N'Lao động - Xã Hội', 2003, 3, 40000, 'VT01'),
		('SH03', N' Đời thay đổi khi chúng ta thay đổi', N'Trẻ', 2000, 10, 53500, 'VT01'),
		('SH04', N'Dám nghĩ lớn', N'Trẻ', 1999, 24, 67000, 'VT01'),
		('SH05', N'Nhà giả kim', N'Văn học', 2000, 45, 36000, 'VT01'),
		('SH06', N'Công Nghiệp Tương Lai', N'Trẻ', 2004, 34, 43000, 'VT02'),
		('SH07', N'Deep Learning – Cuộc Cách Mạng Học Sâu', N'Giáo dục', 2014, 2, 60000, 'VT02'),
		('SH08', N'Gián Điệp Mạng', N'Trẻ', 2010,14, 30000, 'VT02'),
		('SH09', N'Cải Tổ Doanh Nghiệp Trong Thời Đại Số', N'Tổng hợp TPHCM', 2005, 9, 40000, 'VT02')

INSERT INTO ViTri
VALUES ('VT01', 1), ('VT02', 2), ('VT03', 3)

INSERT INTO TheLoai
VALUES	('TL01', N'Giáo dục', 'VT01'),
		('TL02', N'Hướng nghiệp', 'VT01'),
		('TL03', N'Tình cảm', 'VT01'),
		('TL04', N'Công nghệ thông tin', 'VT02')

INSERT INTO TheLoaiSach 
VALUES ('TL01', 'SH01'), ('TL01', 'SH02'), ('TL01', 'SH03'), ('TL01', 'SH04'), ('TL01', 'SH05'),
		('TL04', 'SH06'), ('TL04', 'SH07'), ('TL02', 'SH08')

INSERT INTO TacGia
VALUES	('TG01', N'Pao Degavs','1965-11-12'),
		('TG02', N'Rome', '1945-08-03'),
		('TG03', N'Khuyết Danh', '1985-02-23'),
		('TG04', N'Mễ Mông', '1990-12-03')

INSERT INTO VietSach 
VALUES	('TG01', 'SH01'), ('TG01', 'SH02'), ('TG01', 'SH03'), ('TG02', 'SH04'), ('TG03', 'SH05'), ('TG04', 'SH06')

INSERT INTO ThuThu 
VALUES ('TT01', N'Hoàng Trung Hiếu', '2003-11-09', N'Thanh Hóa', 0987654113, 'hieubeo112@gmail.com'),
		('TT02', N'Vũ Văn Nam', '2003-02-02', N'Hưng Yên', 0385277162, 'namvvhungyen@gmail.com')

INSERT INTO QuanLySach 
VALUES	('TT01', 'SH01'), ('TT01', 'SH02'), ('TT01', 'SH03'), ('TT01', 'SH04'), ('TT01', 'SH05'),
		('TT02', 'SH06'), ('TT02', 'SH07'), ('TT02', 'SH08')

INSERT INTO PhieuMuon
VALUES	('PM01', '2022-12-02', NULL, '2023-02-02', 'TT01', 'ID01'),
		('PM02', '2022-09-13', NULL, '2022-12-13', 'TT01', 'ID02'),
		('PM03', '2022-08-02', NULL, '2022-12-13', 'TT01', 'ID02')

INSERT INTO Muon 
VALUES	('SH01', 'PM01', 1), ('SH02','PM02', 2), ('SH02','PM03', 3)

INSERT INTO TheThuVien
VALUES	('ID01', '2022-01-01', '2025-01-01'),
		('ID02', '2020-02-01', '2024-02-01'),
		('ID03', '2021-01-01', '2025-01-01'),
		('ID04', '2021-04-01', '2025-04-01')
INSERT INTO DocGia
VALUES	('DG01', N'Hoàng Tiến Thuận', 1, '2003-08-26', N'Bắc Ninh', 0373897359),
		('DG02', N'Hoàng Trung Hiếu', 1, '2003-02-23', N'Thanh Hóa', 0987263222),
		('DG03', N'Trịnh Hùng Mạnh', 1, '2003-01-21', N'Hà Nội', 0986712323),
		('DG04', N'Nguyễn Thủy Tiên', 0, '2003-03-26', N'Quảng Ninh', 0976820332)
INSERT INTO DangKy 
VALUES	('ID01', 'DG01'),('ID02', 'DG02'),('ID03', 'DG03'),('ID04', 'DG04')
INSERT INTO PhieuNhap 
VALUES	('SH01', 'TT01', 100, '2020-02-02', null),
		('SH02', 'TT01', 150, '2020-01-01', null)

----- ALTER TABLE -------
ALTER TABLE Sach ADD CONSTRAINT FK_1 FOREIGN KEY (MaVT) REFERENCES ViTri(MaVT)
ALTER TABLE TheLoai ADD CONSTRAINT FK_3 FOREIGN KEY (MaVT) REFERENCES ViTri(MaVT)
ALTER TABLE TheLoaiSach ADD CONSTRAINT FK_4 FOREIGN KEY (MaSH) REFERENCES Sach(MaSH),
							CONSTRAINT FK_5 FOREIGN KEY (MaTL) REFERENCES TheLoai(MaTL),
							CONSTRAINT PK_DB1 PRIMARY KEY (MaTL, MaSH)
ALTER TABLE VietSach ADD CONSTRAINT FK_6 FOREIGN KEY (MaSH) REFERENCES Sach(MaSH),
						CONSTRAINT FK_7 FOREIGN KEY (MaTG) REFERENCES TacGia(MaTG),
						CONSTRAINT PK_DB2 PRIMARY KEY (MaTG, MaSH)
ALTER TABLE QuanLySach ADD CONSTRAINT FK_8 FOREIGN KEY (MaSH) REFERENCES Sach(MaSH),
							CONSTRAINT FK_9 FOREIGN KEY (MaTT) REFERENCES ThuThu(MaTT),
							CONSTRAINT PK_DB3 PRIMARY KEY (MaTT, MaSH)
ALTER TABLE Muon ADD CONSTRAINT PK_DB_4 PRIMARY KEY (MaSH, MaPM)
ALTER TABLE PhieuMuon ADD CONSTRAINT FK_12 FOREIGN KEY (MaTT) REFERENCES ThuThu(MaTT),
							CONSTRAINT FK_13 FOREIGN KEY (MaThe) REFERENCES TheThuVien(MaThe)
ALTER TABLE DangKy ADD CONSTRAINT FK_DK_TTV FOREIGN KEY (MaThe) REFERENCES TheThuVien(MaThe),
						CONSTRAINT FK_DK_DocGia FOREIGN KEY (MaDG) REFERENCES DocGia(MaDG)
ALTER TABLE PhieuNhap  ADD CONSTRAINT FK_Sach_PN FOREIGN KEY (MaSH) REFERENCES Sach(MaSH),
							CONSTRAINT FK_ThuThu_PN  FOREIGN KEY (MaTT) REFERENCES ThuThu(MaTT),
							CONSTRAINT PK_DB4 PRIMARY KEY (MaTT, MaSH)

----------------------
select * from TacGia
-----đếm số độc giả là nữ đến từ bắc ninh hoặc quảng ninh----
select count(MaDG) as solg from DocGia
where DiaChi = N'Bắc Ninh' or DiaChi = N'Quảng Ninh'
group by GT
having GT= 0
--------đưa ra những quyển sách xuất bản sau năm 2000 và có số lượng lớn hơn 10
select *
from Sach
where SoL > 10 and NamXB > 1945
-------- đưa ra những quyển sách co giá cao nhất ------
select TenSH, Gia from Sach
where Gia=(select max(Gia) from Sach) 
order by Gia
-------- Đưa ra những người mượn sách trong ngày 3-9-2022

SELECT HoTen, DocGia.MaDG
From PhieuMuon join DangKy on PhieuMuon.MaThe = DangKy.MaThe
Join DocGia on DocGia.MaDG = DangKy.MaDG
WHERE NgayMuon = '2022-09-13' 

-- lấy ra tất cả sách có số lượng lớn hơn 10 và giá bán từ 30-50k
select * from Sach where SoL>10 and Gia between 30000 and 50000

-- lấy ra tất cả các sách ở kệ số 2
select * from Sach join ViTri on Sach.MaVT=ViTri.MaVT  
where SoKe=2

-- đếm số lượng sách do các thủ thư quản lý
select ThuThu.MaTT,TenTT, SUM(Sach.SoL) as'Số Sách'  
from Sach join QuanLySach on Sach.MaSH=QuanLySach.MaSH   
		  join ThuThu on QuanLySach.MaTT=ThuThu.MaTT
group by ThuThu.MaTT,TenTT

-- liệt kê tất cả MaDG, HoTen, GT, SDT, TenSH, TenTL, TenTG, NgayMuon, SoLuong
select DocGia.MaDG, DocGia.HoTen, DocGia.GT,DocGia.SDT,Sach.TenSH,TheLoai.TenTL,TacGia.TenTG,PhieuMuon.NgayMuon, Muon.SoLuong
from Sach
join TheLoaiSach on Sach.MaSH = TheLoaiSach.MaSH
join TheLoai on TheLoaiSach.MaTL = TheLoai.MaTL
join VietSach on VietSach.MaSH = Sach.MaSH
join TacGia on TacGia.MaTG = VietSach.MaTG
join Muon on Muon.MaSH = Sach.MaSH
join PhieuMuon on PhieuMuon.MaPM = Muon.MaPM
join DangKy on DangKy.MaThe = PhieuMuon.MaThe
join DocGia on DocGia.MaDG = DangKy.MaDG
order by NgayMuon desc

-- Liệt kê HoTen số lượng sách họ mượn.
select DocGia.HoTen as N'Họ Tên', SUM(Muon.SoLuong) as N'Tổng số sách đã mượn'
from Muon join PhieuMuon on PhieuMuon.MaPM = Muon.MaPM
join DangKy on DangKy.MaThe = PhieuMuon.MaThe
join DocGia on DocGia.MaDG = DangKy.MaDG
group by DocGia.MaDG, DocGia.HoTen, Muon.MaSH


SELECT TenSH, NhaXB, ViTri.MaVT, SoKe, TenTL
FROM ViTri
Join Sach on ViTri.MaVT = Sach.MaVT
Join TheLoai on TheLoai.MaVT = Vitri.MaVT
WHERE NhaXB = N'Trẻ'


--Cho biết thông tin những quyển sách được mượn trong tháng 9

SELECT Sach.MaSH, TenSH, NamXB, NhaXB, NgayMuon, PhieuMuon.MaPM
FROM Sach Join Muon on Sach.MaSH = Muon.MaSH
Join PhieuMuon on PhieuMuon.MaPM = Muon.MaPM
WHERE MONTH(NgayMuon) = 9

--Đưa ra tên sách, số lượng còn lại và giá của những cuốn sách do Tác Giả 'X' viết 

SELECT TenSH, SoL, Gia
FROM Sach Join VietSach as VS on Sach.MaSH = VS.MaSH
Join TacGia on TacGia.MaTG = VS.MaTG
WHERE TenTG = N'Mễ Mông'
--Đưa ra tất cả độc giả mượn sách, đầu sách đã mượn, số lượng đang mượn, ngày mượn, ngày trả
 
SELECT DocGia.MaDG, DocGia.HoTen, Sach.MaSH, Muon.SoLuong, PhieuMuon.NgayMuon, PhieuMuon.NgayTra
FROM Sach Join Muon on Sach.MaSH = Muon.MaSH
Join PhieuMuon on PhieuMuon.MaPM = Muon.MaPM
Join DangKy on DangKy.MaThe = PhieuMuon.MaThe
Join DocGia on DocGia.MaDG = DangKy.MaDG
--Đưa ra tổng giá trị của các cuốn sách mà độc giả có mã thẻ ID01 đã mượn (Để tính toán cho việc bồi thường (nếu có))

SELECT TenSH, SoLuong, Gia*SoLuong as N'Tổng Tiền'
FROM Muon Join PhieuMuon on Muon.MaPM = PhieuMuon.MaPM
Join TheThuVien as TTV on TTV.MaThe = PhieuMuon.MaThe
Join Sach on Sach.MaSH = Muon.MaSH
WHERE TTV.MaThe = 'ID01'


