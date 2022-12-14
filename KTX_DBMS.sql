USE [master]
GO
/****** Object:  Database [KTX_DBMS]    Script Date: 11/13/2021 12:07:49 PM ******/
CREATE DATABASE [KTX_DBMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KTX_DBMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\KTX_DBMS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KTX_DBMS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\KTX_DBMS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [KTX_DBMS] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KTX_DBMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KTX_DBMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KTX_DBMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KTX_DBMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KTX_DBMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KTX_DBMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [KTX_DBMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KTX_DBMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KTX_DBMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KTX_DBMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KTX_DBMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KTX_DBMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KTX_DBMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KTX_DBMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KTX_DBMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KTX_DBMS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [KTX_DBMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KTX_DBMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KTX_DBMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KTX_DBMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KTX_DBMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KTX_DBMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KTX_DBMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KTX_DBMS] SET RECOVERY FULL 
GO
ALTER DATABASE [KTX_DBMS] SET  MULTI_USER 
GO
ALTER DATABASE [KTX_DBMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KTX_DBMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KTX_DBMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KTX_DBMS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KTX_DBMS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [KTX_DBMS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'KTX_DBMS', N'ON'
GO
ALTER DATABASE [KTX_DBMS] SET QUERY_STORE = OFF
GO
USE [KTX_DBMS]
GO
/****** Object:  UserDefinedFunction [dbo].[func_SoLuongNhanVienTheoCongViec]    Script Date: 11/13/2021 12:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[func_SoLuongNhanVienTheoCongViec](@ChucVu nchar(10))
returns int
as
begin
	declare @count int
	select @count = COUNT(MaNhanVien)
	from NhanVien
	where ChucVu = @ChucVu
	return @count
end
GO
/****** Object:  UserDefinedFunction [dbo].[func_SoLuongSinhVienTheoGioiTinh]    Script Date: 11/13/2021 12:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[func_SoLuongSinhVienTheoGioiTinh](@GioiTinh nchar(10))
RETURNS int
AS
BEGIN
	declare @soluong int
	select @soluong = count(MaSinhVien)
	from SinhVien
	where GioiTinh = @GioiTinh
	return @soluong
END
GO
/****** Object:  Table [dbo].[DangNhap]    Script Date: 11/13/2021 12:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DangNhap](
	[TenTaiKhoan] [int] NOT NULL,
	[MatKhau] [varchar](50) NOT NULL,
	[VaiTro] [nvarchar](50) NOT NULL,
	[TrangThai] [nchar](10) NOT NULL,
 CONSTRAINT [PK_DangNhap] PRIMARY KEY CLUSTERED 
(
	[TenTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 11/13/2021 12:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNhanVien] [int] NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[SoDienThoai] [ntext] NOT NULL,
	[GioiTinh] [nchar](10) NOT NULL,
	[TonGiao] [nchar](10) NOT NULL,
	[QuocTich] [nchar](10) NOT NULL,
	[CMND_CCCD] [nvarchar](50) NOT NULL,
	[ChucVu] [nchar](10) NOT NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_ThongTinDangNhapNhanVien]    Script Date: 11/13/2021 12:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_ThongTinDangNhapNhanVien]
AS
SELECT        dbo.NhanVien.MaNhanVien AS [Mã nhân viên], dbo.NhanVien.HoTen AS [Họ tên], dbo.NhanVien.SoDienThoai AS [Liên hệ], dbo.NhanVien.GioiTinh AS [Giới tính], dbo.NhanVien.TonGiao AS [Tôn giáo], 
                         dbo.NhanVien.QuocTich AS [Quốc tịch], dbo.NhanVien.CMND_CCCD AS CMND, dbo.NhanVien.ChucVu AS [Chức vụ], dbo.DangNhap.TenTaiKhoan AS [Tài khoản], dbo.DangNhap.MatKhau AS [Mật khẩu], 
                         dbo.DangNhap.VaiTro AS [Vai trò], dbo.DangNhap.TrangThai AS [Trạng thái]
FROM            dbo.NhanVien INNER JOIN
                         dbo.DangNhap ON dbo.NhanVien.MaNhanVien = dbo.DangNhap.TenTaiKhoan
WHERE        (dbo.DangNhap.VaiTro = N'NhanVien')
GO
/****** Object:  Table [dbo].[SinhVien]    Script Date: 11/13/2021 12:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SinhVien](
	[MaSinhVien] [int] NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[SoDienThoai] [nchar](50) NOT NULL,
	[GioiTinh] [nchar](10) NOT NULL,
	[NamHoc] [int] NOT NULL,
	[TonGiao] [nchar](10) NOT NULL,
	[QuocTich] [nchar](10) NOT NULL,
	[CMND_CCCD] [nchar](10) NOT NULL,
	[SoPhong] [int] NOT NULL,
 CONSTRAINT [PK_SinhVien] PRIMARY KEY CLUSTERED 
(
	[MaSinhVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDonLePhi]    Script Date: 11/13/2021 12:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonLePhi](
	[MaBienLai] [int] NOT NULL,
	[TongTien] [float] NOT NULL,
	[NgayBatDauO] [date] NOT NULL,
	[NgayTaoHoaDon] [date] NOT NULL,
	[TinhTrangThanhToan] [nvarchar](50) NOT NULL,
	[MaSinhVien] [int] NOT NULL,
 CONSTRAINT [PK_HoaDonLePhi] PRIMARY KEY CLUSTERED 
(
	[MaBienLai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_DanhSachHoaDonLePhi]    Script Date: 11/13/2021 12:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[view_DanhSachHoaDonLePhi]
as
	select a.MaBienLai as N'Mã biên lai', a.TongTien as N'Tổng tiền', a.NgayBatDauO as N'Ngày bắt đầu ở', a.NgayTaoHoaDon as N'Ngày tạo HĐ',
	a.TinhTrangThanhToan as N'Thanh toán', a.MaSinhVien as N'MSSV', sv.HoTen
	from HoaDonLePhi a, SinhVien sv
	where a.MaSinhVien = sv.MaSinhVien
GO
/****** Object:  View [dbo].[view_DanhSachHoaDonLePhiChuaThanhToan]    Script Date: 11/13/2021 12:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[view_DanhSachHoaDonLePhiChuaThanhToan]
as
	select a.MaBienLai as N'Mã biên lai', a.TongTien as N'Tổng tiền', a.NgayBatDauO as N'Ngày bắt đầu ở', a.NgayTaoHoaDon as N'Ngày tạo HĐ',
	a.TinhTrangThanhToan as N'Thanh toán', a.MaSinhVien as N'MSSV', sv.HoTen
	from HoaDonLePhi a, SinhVien sv
	where a.MaSinhVien = sv.MaSinhVien and a.TinhTrangThanhToan = N'No'
GO
/****** Object:  Table [dbo].[HoaDonDienNuoc]    Script Date: 11/13/2021 12:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonDienNuoc](
	[MaBienLai] [int] NOT NULL,
	[TienDien] [float] NOT NULL,
	[TienNuoc] [float] NOT NULL,
	[NgayTaoHoaDon] [date] NOT NULL,
	[TinhTrangThanhToan] [nvarchar](50) NOT NULL,
	[SoPhong] [int] NOT NULL,
 CONSTRAINT [PK_HoaDonDienNuoc] PRIMARY KEY CLUSTERED 
(
	[MaBienLai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phong]    Script Date: 11/13/2021 12:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phong](
	[SoPhong] [int] NOT NULL,
	[Tang] [int] NOT NULL,
	[SoLuongSinhVienHienTai] [int] NOT NULL,
	[SoLuongSinhVienToiDa] [int] NOT NULL,
	[NguoiQuanLy] [int] NULL,
 CONSTRAINT [PK_Phong] PRIMARY KEY CLUSTERED 
(
	[SoPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[func_DanhSachHoaDonTheoTang]    Script Date: 11/13/2021 12:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[func_DanhSachHoaDonTheoTang](@Tang int)
RETURNS TABLE
AS
RETURN
	SELECT  MaBienLai as N'Mã biên lai', TienDien as N'Tiền điện', TienNuoc as N'Tiền nước', NgayTaoHoaDon as N'Ngày tạo hóa đơn',
	TinhTrangThanhToan as N'Tình trạng', Tang as N'Tầng'
	FROM HoaDonDienNuoc, Phong
	WHERE HoaDonDienNuoc.SoPhong = Phong.SoPhong AND Phong.Tang = @Tang
GO
/****** Object:  UserDefinedFunction [dbo].[func_DanhSachHoaDonTheoThang]    Script Date: 11/13/2021 12:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[func_DanhSachHoaDonTheoThang](@ThangTaoHoaDon date)
RETURNS TABLE
AS
RETURN
	SELECT  MaBienLai as N'Mã biên lai', TienDien as N'Tiền điện', TienNuoc as N'Tiền nước',
	NgayTaoHoaDon as N'Ngày tạo', TinhTrangThanhToan as N'Tình trạng', SoPhong as N'Số Phòng'
	FROM HoaDonDienNuoc
	WHERE MONTH(@ThangTaoHoaDon) = MONTH(NgayTaoHoaDon) AND YEAR(@ThangTaoHoaDon) = YEAR(NgayTaoHoaDon)
GO
/****** Object:  UserDefinedFunction [dbo].[func_KiemTraThongTinDangNhap]    Script Date: 11/13/2021 12:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[func_KiemTraThongTinDangNhap](@TenTaiKhoan int , @MatKhau varchar(50), @VaiTro nvarchar(50))
RETURNS TABLE
AS
RETURN
	SELECT *
	FROM DangNhap
	WHERE @TenTaiKhoan = DangNhap.TenTaiKhoan AND
		@MatKhau =DangNhap.MatKhau AND
		@VaiTro =DangNhap.VaiTro 
GO
/****** Object:  View [dbo].[view_PhongTrong]    Script Date: 11/13/2021 12:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_PhongTrong]
AS
SELECT        a.SoPhong AS N'Số phòng', a.Tang AS N'Tầng', a.SoLuongSinhVienHienTai AS N'Số lượng SVHT', a.SoLuongSinhVienToiDa AS N'Số lượng SVTĐ', a.NguoiQuanLy AS N'Mã NQL'
FROM            Phong a 
WHERE        a.SoLuongSinhVienHienTai = 0
GO
/****** Object:  View [dbo].[view_PhongConChoTrong]    Script Date: 11/13/2021 12:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_PhongConChoTrong]
AS
SELECT        a.SoPhong AS N'Số phòng', a.Tang AS N'Tầng', a.SoLuongSinhVienHienTai AS N'Số lượng SVHT', a.SoLuongSinhVienToiDa AS N'Số lượng SVTĐ', a.NguoiQuanLy AS N'Mã NQL', n.HoTen AS N'Họ và tên NQL'
FROM            Phong a, NhanVien n
WHERE        a.NguoiQuanLy = n.MaNhanVien AND a.SoLuongSinhVienHienTai >0  AND a.SoLuongSinhVienHienTai < a.SoLuongSinhVienToiDa
GO
/****** Object:  View [dbo].[view_HoaDonDienNuocChuaThanhToan]    Script Date: 11/13/2021 12:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[view_HoaDonDienNuocChuaThanhToan]
as
	select a.MaBienLai as N'Mã biên lai', a.TienDien as N'Tiền điện', a.TienNuoc as N'Tiền nước', a.NgayTaoHoaDon as N'Ngày tạo HĐ', 
	a.TinhTrangThanhToan as N'Thanh toán', a.SoPhong as N'Số phòng'
	from HoaDonDienNuoc a
	where a.TinhTrangThanhToan = N'No'
GO
/****** Object:  UserDefinedFunction [dbo].[func_DanhSachPhongDoNhanVienQuanLy]    Script Date: 11/13/2021 12:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[func_DanhSachPhongDoNhanVienQuanLy](@MaNV int)
RETURNS TABLE
AS
RETURN
	SELECT p.SoPhong as N'Số phòng', p.Tang as N'Tầng', p.SoLuongSinhVienHienTai as N'Số lượng SV hiện tại' 
	,p.SoLuongSinhVienToiDa as N'Số lượng SV tối đa', p.NguoiQuanLy as N'Mã NQL',  nv.HoTen as N'Họ tên'
	FROM Phong p, NhanVien nv
	WHERE p.NguoiQuanLy = @MaNV AND nv.MaNhanVien = @MaNV
GO
/****** Object:  UserDefinedFunction [dbo].[func_DanhSachSinhVienTheoNamHoc]    Script Date: 11/13/2021 12:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[func_DanhSachSinhVienTheoNamHoc](@NamHoc int)
RETURNS TABLE
AS
RETURN
	select MaSinhVien as N'Mã sinh viên', HoTen as N'Họ tên', SoDienThoai as N'Số điện thoại', GioiTinh as N'Giới tính',
	TonGiao as N'Tôn giáo', QuocTich as N'Quốc tịch', SoPhong as N'Số Phòng'
	from SinhVien
	where NamHoc = @NamHoc
GO
/****** Object:  UserDefinedFunction [dbo].[func_DanhSachHoaDonDienNuocTheoTang]    Script Date: 11/13/2021 12:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[func_DanhSachHoaDonDienNuocTheoTang](@tang int)
RETURNS TABLE
AS
RETURN
	select MaBienLai as N'Mã biên lai', TienDien as N'Tiền điện', TienNuoc as N'Tiền nước', 
	NgayTaoHoaDon as N'Ngày tạo đơn', TinhTrangThanhToan as N'Tình trạng thanh toán', SoPhong as N'Số phòng'
	from HoaDonDienNuoc
	where SoPhong/100 = @tang
GO
INSERT [dbo].[DangNhap] ([TenTaiKhoan], [MatKhau], [VaiTro], [TrangThai]) VALUES (100001, N'123456', N'QuanTriVien', N'Active    ')
INSERT [dbo].[DangNhap] ([TenTaiKhoan], [MatKhau], [VaiTro], [TrangThai]) VALUES (100002, N'100002', N'NhanVien', N'Active    ')
INSERT [dbo].[DangNhap] ([TenTaiKhoan], [MatKhau], [VaiTro], [TrangThai]) VALUES (100003, N'100003', N'NhanVien', N'Active    ')
INSERT [dbo].[DangNhap] ([TenTaiKhoan], [MatKhau], [VaiTro], [TrangThai]) VALUES (100004, N'123456', N'NhanVien', N'Active    ')
INSERT [dbo].[DangNhap] ([TenTaiKhoan], [MatKhau], [VaiTro], [TrangThai]) VALUES (100005, N'100005', N'NhanVien', N'Active    ')
INSERT [dbo].[DangNhap] ([TenTaiKhoan], [MatKhau], [VaiTro], [TrangThai]) VALUES (100006, N'100006', N'NhanVien', N'Active    ')
INSERT [dbo].[DangNhap] ([TenTaiKhoan], [MatKhau], [VaiTro], [TrangThai]) VALUES (100007, N'100007', N'NhanVien', N'Active    ')
INSERT [dbo].[DangNhap] ([TenTaiKhoan], [MatKhau], [VaiTro], [TrangThai]) VALUES (100008, N'100008', N'NhanVien', N'Active    ')
INSERT [dbo].[DangNhap] ([TenTaiKhoan], [MatKhau], [VaiTro], [TrangThai]) VALUES (100009, N'100009', N'NhanVien', N'Active    ')
INSERT [dbo].[DangNhap] ([TenTaiKhoan], [MatKhau], [VaiTro], [TrangThai]) VALUES (100010, N'100010', N'NhanVien', N'Active    ')
INSERT [dbo].[DangNhap] ([TenTaiKhoan], [MatKhau], [VaiTro], [TrangThai]) VALUES (100011, N'100011', N'NhanVien', N'Active    ')
INSERT [dbo].[DangNhap] ([TenTaiKhoan], [MatKhau], [VaiTro], [TrangThai]) VALUES (100012, N'100012', N'NhanVien', N'Active    ')
INSERT [dbo].[DangNhap] ([TenTaiKhoan], [MatKhau], [VaiTro], [TrangThai]) VALUES (100013, N'100013', N'NhanVien', N'Active    ')
INSERT [dbo].[DangNhap] ([TenTaiKhoan], [MatKhau], [VaiTro], [TrangThai]) VALUES (100014, N'100014', N'NhanVien', N'Active    ')
INSERT [dbo].[DangNhap] ([TenTaiKhoan], [MatKhau], [VaiTro], [TrangThai]) VALUES (100015, N'100015', N'NhanVien', N'Active    ')
INSERT [dbo].[DangNhap] ([TenTaiKhoan], [MatKhau], [VaiTro], [TrangThai]) VALUES (100100, N'100100', N'QuanTriVien', N'Active    ')
GO
INSERT [dbo].[HoaDonDienNuoc] ([MaBienLai], [TienDien], [TienNuoc], [NgayTaoHoaDon], [TinhTrangThanhToan], [SoPhong]) VALUES (34102, 44000, 39000, CAST(N'2021-11-01' AS Date), N'Yes', 102)
INSERT [dbo].[HoaDonDienNuoc] ([MaBienLai], [TienDien], [TienNuoc], [NgayTaoHoaDon], [TinhTrangThanhToan], [SoPhong]) VALUES (106586, 101000, 95000, CAST(N'2021-11-01' AS Date), N'No', 402)
INSERT [dbo].[HoaDonDienNuoc] ([MaBienLai], [TienDien], [TienNuoc], [NgayTaoHoaDon], [TinhTrangThanhToan], [SoPhong]) VALUES (287943, 163000, 76000, CAST(N'2021-11-01' AS Date), N'Yes', 303)
INSERT [dbo].[HoaDonDienNuoc] ([MaBienLai], [TienDien], [TienNuoc], [NgayTaoHoaDon], [TinhTrangThanhToan], [SoPhong]) VALUES (417642, 115000, 102000, CAST(N'2021-11-01' AS Date), N'Yes', 101)
INSERT [dbo].[HoaDonDienNuoc] ([MaBienLai], [TienDien], [TienNuoc], [NgayTaoHoaDon], [TinhTrangThanhToan], [SoPhong]) VALUES (636143, 185000, 159000, CAST(N'2021-10-18' AS Date), N'Yes', 801)
INSERT [dbo].[HoaDonDienNuoc] ([MaBienLai], [TienDien], [TienNuoc], [NgayTaoHoaDon], [TinhTrangThanhToan], [SoPhong]) VALUES (710046, 150000, 110000, CAST(N'2021-11-01' AS Date), N'Yes', 501)
INSERT [dbo].[HoaDonDienNuoc] ([MaBienLai], [TienDien], [TienNuoc], [NgayTaoHoaDon], [TinhTrangThanhToan], [SoPhong]) VALUES (762478, 154000, 151000, CAST(N'2021-11-02' AS Date), N'Yes', 302)
INSERT [dbo].[HoaDonDienNuoc] ([MaBienLai], [TienDien], [TienNuoc], [NgayTaoHoaDon], [TinhTrangThanhToan], [SoPhong]) VALUES (763166, 187000, 148000, CAST(N'2021-11-02' AS Date), N'No', 502)
INSERT [dbo].[HoaDonDienNuoc] ([MaBienLai], [TienDien], [TienNuoc], [NgayTaoHoaDon], [TinhTrangThanhToan], [SoPhong]) VALUES (775289, 131000, 93000, CAST(N'2021-11-11' AS Date), N'No', 401)
INSERT [dbo].[HoaDonDienNuoc] ([MaBienLai], [TienDien], [TienNuoc], [NgayTaoHoaDon], [TinhTrangThanhToan], [SoPhong]) VALUES (803645, 126000, 68000, CAST(N'2021-11-01' AS Date), N'No', 601)
GO
INSERT [dbo].[HoaDonLePhi] ([MaBienLai], [TongTien], [NgayBatDauO], [NgayTaoHoaDon], [TinhTrangThanhToan], [MaSinhVien]) VALUES (485339, 3000000, CAST(N'2021-11-02' AS Date), CAST(N'2021-11-02' AS Date), N'Yes', 18618760)
INSERT [dbo].[HoaDonLePhi] ([MaBienLai], [TongTien], [NgayBatDauO], [NgayTaoHoaDon], [TinhTrangThanhToan], [MaSinhVien]) VALUES (529645, 3000000, CAST(N'2021-11-02' AS Date), CAST(N'2021-11-02' AS Date), N'No', 21416652)
INSERT [dbo].[HoaDonLePhi] ([MaBienLai], [TongTien], [NgayBatDauO], [NgayTaoHoaDon], [TinhTrangThanhToan], [MaSinhVien]) VALUES (555056, 3000000, CAST(N'2021-11-02' AS Date), CAST(N'2021-11-02' AS Date), N'Yes', 20334082)
INSERT [dbo].[HoaDonLePhi] ([MaBienLai], [TongTien], [NgayBatDauO], [NgayTaoHoaDon], [TinhTrangThanhToan], [MaSinhVien]) VALUES (632039, 3000000, CAST(N'2021-11-02' AS Date), CAST(N'2021-11-02' AS Date), N'Yes', 19217736)
INSERT [dbo].[HoaDonLePhi] ([MaBienLai], [TongTien], [NgayBatDauO], [NgayTaoHoaDon], [TinhTrangThanhToan], [MaSinhVien]) VALUES (648754, 3000000, CAST(N'2021-11-02' AS Date), CAST(N'2021-11-02' AS Date), N'Yes', 20140714)
INSERT [dbo].[HoaDonLePhi] ([MaBienLai], [TongTien], [NgayBatDauO], [NgayTaoHoaDon], [TinhTrangThanhToan], [MaSinhVien]) VALUES (689174, 3000000, CAST(N'2021-11-02' AS Date), CAST(N'2021-11-02' AS Date), N'No', 18137555)
INSERT [dbo].[HoaDonLePhi] ([MaBienLai], [TongTien], [NgayBatDauO], [NgayTaoHoaDon], [TinhTrangThanhToan], [MaSinhVien]) VALUES (729594, 3000000, CAST(N'2021-11-02' AS Date), CAST(N'2021-11-02' AS Date), N'No', 19110342)
INSERT [dbo].[HoaDonLePhi] ([MaBienLai], [TongTien], [NgayBatDauO], [NgayTaoHoaDon], [TinhTrangThanhToan], [MaSinhVien]) VALUES (755959, 3000000, CAST(N'2021-11-02' AS Date), CAST(N'2021-11-02' AS Date), N'No', 21818651)
INSERT [dbo].[HoaDonLePhi] ([MaBienLai], [TongTien], [NgayBatDauO], [NgayTaoHoaDon], [TinhTrangThanhToan], [MaSinhVien]) VALUES (810434, 3000000, CAST(N'2021-11-02' AS Date), CAST(N'2021-11-02' AS Date), N'No', 20863594)
INSERT [dbo].[HoaDonLePhi] ([MaBienLai], [TongTien], [NgayBatDauO], [NgayTaoHoaDon], [TinhTrangThanhToan], [MaSinhVien]) VALUES (814710, 3000000, CAST(N'2021-11-02' AS Date), CAST(N'2021-11-02' AS Date), N'No', 18610250)
INSERT [dbo].[HoaDonLePhi] ([MaBienLai], [TongTien], [NgayBatDauO], [NgayTaoHoaDon], [TinhTrangThanhToan], [MaSinhVien]) VALUES (850854, 3000000, CAST(N'2021-11-02' AS Date), CAST(N'2021-11-02' AS Date), N'No', 19110365)
INSERT [dbo].[HoaDonLePhi] ([MaBienLai], [TongTien], [NgayBatDauO], [NgayTaoHoaDon], [TinhTrangThanhToan], [MaSinhVien]) VALUES (889255, 3000000, CAST(N'2021-11-02' AS Date), CAST(N'2021-11-02' AS Date), N'No', 18112318)
INSERT [dbo].[HoaDonLePhi] ([MaBienLai], [TongTien], [NgayBatDauO], [NgayTaoHoaDon], [TinhTrangThanhToan], [MaSinhVien]) VALUES (891274, 3000000, CAST(N'2021-11-02' AS Date), CAST(N'2021-11-02' AS Date), N'Yes', 19110426)
INSERT [dbo].[HoaDonLePhi] ([MaBienLai], [TongTien], [NgayBatDauO], [NgayTaoHoaDon], [TinhTrangThanhToan], [MaSinhVien]) VALUES (893002, 3000000, CAST(N'2021-11-02' AS Date), CAST(N'2021-11-02' AS Date), N'Yes', 21521643)
INSERT [dbo].[HoaDonLePhi] ([MaBienLai], [TongTien], [NgayBatDauO], [NgayTaoHoaDon], [TinhTrangThanhToan], [MaSinhVien]) VALUES (945974, 3000000, CAST(N'2021-11-02' AS Date), CAST(N'2021-11-02' AS Date), N'Yes', 18724264)
INSERT [dbo].[HoaDonLePhi] ([MaBienLai], [TongTien], [NgayBatDauO], [NgayTaoHoaDon], [TinhTrangThanhToan], [MaSinhVien]) VALUES (970889, 3000000, CAST(N'2021-11-02' AS Date), CAST(N'2021-11-02' AS Date), N'Yes', 18278093)
INSERT [dbo].[HoaDonLePhi] ([MaBienLai], [TongTien], [NgayBatDauO], [NgayTaoHoaDon], [TinhTrangThanhToan], [MaSinhVien]) VALUES (1114665, 3000000, CAST(N'2021-11-02' AS Date), CAST(N'2021-11-02' AS Date), N'Yes', 20475809)
INSERT [dbo].[HoaDonLePhi] ([MaBienLai], [TongTien], [NgayBatDauO], [NgayTaoHoaDon], [TinhTrangThanhToan], [MaSinhVien]) VALUES (1155285, 3000000, CAST(N'2021-11-02' AS Date), CAST(N'2021-11-02' AS Date), N'Yes', 21502066)
INSERT [dbo].[HoaDonLePhi] ([MaBienLai], [TongTien], [NgayBatDauO], [NgayTaoHoaDon], [TinhTrangThanhToan], [MaSinhVien]) VALUES (1174598, 3000000, CAST(N'2021-11-02' AS Date), CAST(N'2021-11-02' AS Date), N'Yes', 19842951)
INSERT [dbo].[HoaDonLePhi] ([MaBienLai], [TongTien], [NgayBatDauO], [NgayTaoHoaDon], [TinhTrangThanhToan], [MaSinhVien]) VALUES (1231388, 3000000, CAST(N'2021-11-11' AS Date), CAST(N'2021-11-11' AS Date), N'No', 21362412)
INSERT [dbo].[HoaDonLePhi] ([MaBienLai], [TongTien], [NgayBatDauO], [NgayTaoHoaDon], [TinhTrangThanhToan], [MaSinhVien]) VALUES (1377296, 3000000, CAST(N'2021-11-02' AS Date), CAST(N'2021-11-02' AS Date), N'No', 20905262)
INSERT [dbo].[HoaDonLePhi] ([MaBienLai], [TongTien], [NgayBatDauO], [NgayTaoHoaDon], [TinhTrangThanhToan], [MaSinhVien]) VALUES (1395991, 3000000, CAST(N'2021-11-02' AS Date), CAST(N'2021-11-02' AS Date), N'Yes', 20381244)
INSERT [dbo].[HoaDonLePhi] ([MaBienLai], [TongTien], [NgayBatDauO], [NgayTaoHoaDon], [TinhTrangThanhToan], [MaSinhVien]) VALUES (1440831, 3000000, CAST(N'2021-11-02' AS Date), CAST(N'2021-11-02' AS Date), N'No', 18887064)
INSERT [dbo].[HoaDonLePhi] ([MaBienLai], [TongTien], [NgayBatDauO], [NgayTaoHoaDon], [TinhTrangThanhToan], [MaSinhVien]) VALUES (1664497, 3000000, CAST(N'2021-11-02' AS Date), CAST(N'2021-11-02' AS Date), N'Yes', 21321232)
INSERT [dbo].[HoaDonLePhi] ([MaBienLai], [TongTien], [NgayBatDauO], [NgayTaoHoaDon], [TinhTrangThanhToan], [MaSinhVien]) VALUES (1780533, 3000000, CAST(N'2021-11-02' AS Date), CAST(N'2021-11-02' AS Date), N'No', 19310104)
INSERT [dbo].[HoaDonLePhi] ([MaBienLai], [TongTien], [NgayBatDauO], [NgayTaoHoaDon], [TinhTrangThanhToan], [MaSinhVien]) VALUES (1849861, 3000000, CAST(N'2021-11-02' AS Date), CAST(N'2021-11-02' AS Date), N'Yes', 18122873)
INSERT [dbo].[HoaDonLePhi] ([MaBienLai], [TongTien], [NgayBatDauO], [NgayTaoHoaDon], [TinhTrangThanhToan], [MaSinhVien]) VALUES (1935130, 3000000, CAST(N'2021-11-02' AS Date), CAST(N'2021-11-02' AS Date), N'Yes', 19808033)
INSERT [dbo].[HoaDonLePhi] ([MaBienLai], [TongTien], [NgayBatDauO], [NgayTaoHoaDon], [TinhTrangThanhToan], [MaSinhVien]) VALUES (2038857, 3000000, CAST(N'2021-11-02' AS Date), CAST(N'2021-11-02' AS Date), N'Yes', 21718850)
INSERT [dbo].[HoaDonLePhi] ([MaBienLai], [TongTien], [NgayBatDauO], [NgayTaoHoaDon], [TinhTrangThanhToan], [MaSinhVien]) VALUES (2050703, 3000000, CAST(N'2021-11-02' AS Date), CAST(N'2021-11-02' AS Date), N'Yes', 20115485)
INSERT [dbo].[HoaDonLePhi] ([MaBienLai], [TongTien], [NgayBatDauO], [NgayTaoHoaDon], [TinhTrangThanhToan], [MaSinhVien]) VALUES (2105233, 3000000, CAST(N'2021-11-02' AS Date), CAST(N'2021-11-02' AS Date), N'Yes', 19502847)
INSERT [dbo].[HoaDonLePhi] ([MaBienLai], [TongTien], [NgayBatDauO], [NgayTaoHoaDon], [TinhTrangThanhToan], [MaSinhVien]) VALUES (2132950, 3000000, CAST(N'2021-11-02' AS Date), CAST(N'2021-11-02' AS Date), N'No', 18173789)
INSERT [dbo].[HoaDonLePhi] ([MaBienLai], [TongTien], [NgayBatDauO], [NgayTaoHoaDon], [TinhTrangThanhToan], [MaSinhVien]) VALUES (2194896, 3000000, CAST(N'2021-11-02' AS Date), CAST(N'2021-11-02' AS Date), N'Yes', 21808983)
INSERT [dbo].[HoaDonLePhi] ([MaBienLai], [TongTien], [NgayBatDauO], [NgayTaoHoaDon], [TinhTrangThanhToan], [MaSinhVien]) VALUES (2221721, 3000000, CAST(N'2021-11-02' AS Date), CAST(N'2021-11-02' AS Date), N'Yes', 18871126)
INSERT [dbo].[HoaDonLePhi] ([MaBienLai], [TongTien], [NgayBatDauO], [NgayTaoHoaDon], [TinhTrangThanhToan], [MaSinhVien]) VALUES (2299845, 3000000, CAST(N'2021-11-02' AS Date), CAST(N'2021-11-02' AS Date), N'No', 21253062)
INSERT [dbo].[HoaDonLePhi] ([MaBienLai], [TongTien], [NgayBatDauO], [NgayTaoHoaDon], [TinhTrangThanhToan], [MaSinhVien]) VALUES (2382663, 3000000, CAST(N'2021-11-02' AS Date), CAST(N'2021-11-02' AS Date), N'Yes', 20347113)
INSERT [dbo].[HoaDonLePhi] ([MaBienLai], [TongTien], [NgayBatDauO], [NgayTaoHoaDon], [TinhTrangThanhToan], [MaSinhVien]) VALUES (2424715, 3000000, CAST(N'2021-11-02' AS Date), CAST(N'2021-11-02' AS Date), N'No', 19232151)
INSERT [dbo].[HoaDonLePhi] ([MaBienLai], [TongTien], [NgayBatDauO], [NgayTaoHoaDon], [TinhTrangThanhToan], [MaSinhVien]) VALUES (2473342, 3000000, CAST(N'2021-11-02' AS Date), CAST(N'2021-11-02' AS Date), N'Yes', 18688714)
INSERT [dbo].[HoaDonLePhi] ([MaBienLai], [TongTien], [NgayBatDauO], [NgayTaoHoaDon], [TinhTrangThanhToan], [MaSinhVien]) VALUES (2629143, 3000000, CAST(N'2021-11-02' AS Date), CAST(N'2021-11-02' AS Date), N'Yes', 21468844)
INSERT [dbo].[HoaDonLePhi] ([MaBienLai], [TongTien], [NgayBatDauO], [NgayTaoHoaDon], [TinhTrangThanhToan], [MaSinhVien]) VALUES (2741466, 3000000, CAST(N'2021-11-02' AS Date), CAST(N'2021-11-02' AS Date), N'Yes', 21686255)
INSERT [dbo].[HoaDonLePhi] ([MaBienLai], [TongTien], [NgayBatDauO], [NgayTaoHoaDon], [TinhTrangThanhToan], [MaSinhVien]) VALUES (2816493, 3000000, CAST(N'2021-11-02' AS Date), CAST(N'2021-11-02' AS Date), N'No', 19548579)
INSERT [dbo].[HoaDonLePhi] ([MaBienLai], [TongTien], [NgayBatDauO], [NgayTaoHoaDon], [TinhTrangThanhToan], [MaSinhVien]) VALUES (2861261, 3000000, CAST(N'2021-11-02' AS Date), CAST(N'2021-11-02' AS Date), N'Yes', 20251588)
INSERT [dbo].[HoaDonLePhi] ([MaBienLai], [TongTien], [NgayBatDauO], [NgayTaoHoaDon], [TinhTrangThanhToan], [MaSinhVien]) VALUES (2912479, 3000000, CAST(N'2021-11-02' AS Date), CAST(N'2021-11-02' AS Date), N'Yes', 21934732)
INSERT [dbo].[HoaDonLePhi] ([MaBienLai], [TongTien], [NgayBatDauO], [NgayTaoHoaDon], [TinhTrangThanhToan], [MaSinhVien]) VALUES (3088372, 3000000, CAST(N'2021-11-02' AS Date), CAST(N'2021-11-02' AS Date), N'Yes', 18708622)
GO
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [SoDienThoai], [GioiTinh], [TonGiao], [QuocTich], [CMND_CCCD], [ChucVu]) VALUES (100001, N'Hồ Bảo Thành', N'0900457224', N'nam       ', N'hồi giáo  ', N'Việt Nam  ', N'5903413195', N'Quản lý   ')
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [SoDienThoai], [GioiTinh], [TonGiao], [QuocTich], [CMND_CCCD], [ChucVu]) VALUES (100002, N'Nguyễn Hoài Thu', N'0973374874', N'nữ        ', N'không     ', N'Việt Nam  ', N'239248361', N'Quản lý   ')
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [SoDienThoai], [GioiTinh], [TonGiao], [QuocTich], [CMND_CCCD], [ChucVu]) VALUES (100003, N'Phạm Văn Bách', N'0957847854', N'nam       ', N'Không     ', N'Việt Nam  ', N'2132131212', N'Quản lý   ')
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [SoDienThoai], [GioiTinh], [TonGiao], [QuocTich], [CMND_CCCD], [ChucVu]) VALUES (100004, N'John Kelly', N'0904376878', N'nam       ', N'không     ', N'Úc        ', N'3254354665', N'Quản lý   ')
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [SoDienThoai], [GioiTinh], [TonGiao], [QuocTich], [CMND_CCCD], [ChucVu]) VALUES (100005, N'Lê Thị Phượng', N'0987657643', N'nữ        ', N'không     ', N'Việt Nam  ', N'3214567863', N'Quản lý   ')
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [SoDienThoai], [GioiTinh], [TonGiao], [QuocTich], [CMND_CCCD], [ChucVu]) VALUES (100006, N'Phan Tấn Long', N'0987987567', N'nam       ', N'không     ', N'Việt Nam  ', N'2345245765', N'Quản lý   ')
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [SoDienThoai], [GioiTinh], [TonGiao], [QuocTich], [CMND_CCCD], [ChucVu]) VALUES (100007, N'Phạm Thu Hoài', N'096767324', N'nữ        ', N'không     ', N'Việt Nam  ', N'2312353213', N'Quản lý   ')
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [SoDienThoai], [GioiTinh], [TonGiao], [QuocTich], [CMND_CCCD], [ChucVu]) VALUES (100008, N'Ngô Trường Thắng', N'0646577284', N'nam       ', N'không     ', N'Việt Nam  ', N'7048251605', N'Quản lý   ')
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [SoDienThoai], [GioiTinh], [TonGiao], [QuocTich], [CMND_CCCD], [ChucVu]) VALUES (100009, N'Phạm Đình Toàn', N'0443522382', N'nam       ', N'thiên chúa', N'Việt Nam  ', N'8213744013', N'Bảo vệ    ')
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [SoDienThoai], [GioiTinh], [TonGiao], [QuocTich], [CMND_CCCD], [ChucVu]) VALUES (100010, N'Cao Kim Hồng', N'0149797552', N'nữ        ', N'cao đài   ', N'Việt Nam  ', N'7588714426', N'Lao công  ')
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [SoDienThoai], [GioiTinh], [TonGiao], [QuocTich], [CMND_CCCD], [ChucVu]) VALUES (100011, N'Trần Khánh Duy', N'0512950081', N'nam       ', N'không     ', N'Việt Nam  ', N'1565852133', N'Bảo vệ    ')
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [SoDienThoai], [GioiTinh], [TonGiao], [QuocTich], [CMND_CCCD], [ChucVu]) VALUES (100012, N'Đỗ Thái', N'0898638629', N'nam       ', N'không     ', N'Việt Nam  ', N'1535215311', N'Bảo vệ    ')
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [SoDienThoai], [GioiTinh], [TonGiao], [QuocTich], [CMND_CCCD], [ChucVu]) VALUES (100013, N'Vương Công Tuấn Minh', N'0520533963', N'nam       ', N'phật giáo ', N'Việt Nam  ', N'8614644385', N'Bảo vệ    ')
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [SoDienThoai], [GioiTinh], [TonGiao], [QuocTich], [CMND_CCCD], [ChucVu]) VALUES (100014, N'Cao Dư Minh', N'036339433', N'nữ        ', N'không     ', N'Việt Nam  ', N'7516471420', N'Lao công  ')
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [SoDienThoai], [GioiTinh], [TonGiao], [QuocTich], [CMND_CCCD], [ChucVu]) VALUES (100015, N'Ninh Thúy Nhi', N'0537806822', N'nữ        ', N'cao đài   ', N'Việt Nam  ', N'8508062260', N'Lao công  ')
GO
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (101, 1, 4, 4, 100001)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (102, 1, 1, 4, 100001)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (103, 1, 1, 6, 100001)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (104, 1, 2, 6, 100001)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (105, 1, 0, 8, 100001)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (106, 1, 0, 8, 100001)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (107, 1, 0, 8, 100001)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (108, 1, 0, 8, 100001)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (201, 2, 1, 4, 100002)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (202, 2, 1, 4, 100002)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (203, 2, 0, 6, 100002)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (204, 2, 0, 6, 100002)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (205, 2, 0, 8, 100002)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (206, 2, 0, 8, 100002)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (207, 2, 0, 8, 100001)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (208, 2, 0, 8, 100001)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (209, 1, 0, 8, 100002)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (301, 3, 0, 4, 100001)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (302, 3, 1, 4, 100001)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (303, 3, 6, 6, 100003)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (304, 3, 1, 6, 100003)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (305, 3, 1, 8, 100003)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (306, 3, 0, 8, 100003)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (307, 3, 0, 8, 100003)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (308, 3, 0, 8, 100001)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (401, 4, 4, 4, 100004)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (402, 4, 4, 4, 100004)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (501, 5, 3, 4, 100005)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (502, 5, 3, 4, 100005)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (503, 5, 0, 6, 100005)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (504, 5, 0, 6, 100001)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (505, 5, 0, 8, 100005)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (601, 6, 2, 4, 100006)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (602, 6, 0, 4, 100006)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (603, 6, 2, 6, 100006)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (604, 6, 0, 6, 100006)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (701, 7, 3, 4, 100007)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (702, 7, 0, 4, 100007)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (703, 7, 0, 6, 100007)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (704, 7, 0, 6, 100001)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (705, 7, 0, 8, 100001)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (706, 7, 1, 8, 100007)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (801, 8, 2, 4, 100008)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (802, 8, 0, 4, 100008)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (803, 8, 0, 6, 100008)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (804, 8, 0, 6, 100008)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (805, 8, 0, 8, 100008)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (806, 8, 0, 8, 100008)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (807, 8, 0, 8, 100008)
INSERT [dbo].[Phong] ([SoPhong], [Tang], [SoLuongSinhVienHienTai], [SoLuongSinhVienToiDa], [NguoiQuanLy]) VALUES (808, 8, 0, 8, 100001)
GO
INSERT [dbo].[SinhVien] ([MaSinhVien], [HoTen], [SoDienThoai], [GioiTinh], [NamHoc], [TonGiao], [QuocTich], [CMND_CCCD], [SoPhong]) VALUES (18112318, N'Hồ Mộng Thanh', N'0469229229                                        ', N'nữ        ', 4, N'phật giáo ', N'Việt Nam  ', N'4135450614', 303)
INSERT [dbo].[SinhVien] ([MaSinhVien], [HoTen], [SoDienThoai], [GioiTinh], [NamHoc], [TonGiao], [QuocTich], [CMND_CCCD], [SoPhong]) VALUES (18122873, N'Lý Kim Ngọc', N'0124926718                                        ', N'nữ        ', 4, N'thiên chúa', N'Việt Nam  ', N'1676817216', 303)
INSERT [dbo].[SinhVien] ([MaSinhVien], [HoTen], [SoDienThoai], [GioiTinh], [NamHoc], [TonGiao], [QuocTich], [CMND_CCCD], [SoPhong]) VALUES (18137555, N'Đỗ Tiến Lan', N'0281937821                                        ', N'nữ        ', 4, N'phật giáo ', N'Việt Nam  ', N'7598798734', 201)
INSERT [dbo].[SinhVien] ([MaSinhVien], [HoTen], [SoDienThoai], [GioiTinh], [NamHoc], [TonGiao], [QuocTich], [CMND_CCCD], [SoPhong]) VALUES (18173789, N'Ngô Quý Tài', N'0148983930                                        ', N'nam       ', 4, N'cao đài   ', N'Việt Nam  ', N'1307595361', 402)
INSERT [dbo].[SinhVien] ([MaSinhVien], [HoTen], [SoDienThoai], [GioiTinh], [NamHoc], [TonGiao], [QuocTich], [CMND_CCCD], [SoPhong]) VALUES (18278093, N'Phạm Tâm Nhi', N'0391515162                                        ', N'nữ        ', 4, N'cao đài   ', N'Việt Nam  ', N'5669128598', 303)
INSERT [dbo].[SinhVien] ([MaSinhVien], [HoTen], [SoDienThoai], [GioiTinh], [NamHoc], [TonGiao], [QuocTich], [CMND_CCCD], [SoPhong]) VALUES (18610250, N'Hồ Lê Toàn', N'0409584541                                        ', N'nam       ', 4, N'không     ', N'Việt Nam  ', N'3598654896', 501)
INSERT [dbo].[SinhVien] ([MaSinhVien], [HoTen], [SoDienThoai], [GioiTinh], [NamHoc], [TonGiao], [QuocTich], [CMND_CCCD], [SoPhong]) VALUES (18618760, N'Quế Hồng Đào', N'0616226436                                        ', N'nữ        ', 4, N'hồi giáo  ', N'Việt Nam  ', N'5545179572', 303)
INSERT [dbo].[SinhVien] ([MaSinhVien], [HoTen], [SoDienThoai], [GioiTinh], [NamHoc], [TonGiao], [QuocTich], [CMND_CCCD], [SoPhong]) VALUES (18688714, N'Trần Hoàng Mai', N'0766992630                                        ', N'nữ        ', 4, N'không     ', N'Việt Nam  ', N'2573063021', 101)
INSERT [dbo].[SinhVien] ([MaSinhVien], [HoTen], [SoDienThoai], [GioiTinh], [NamHoc], [TonGiao], [QuocTich], [CMND_CCCD], [SoPhong]) VALUES (18708622, N'Cao Thị Hân', N'0455303769                                        ', N'nữ        ', 4, N'không     ', N'Việt Nam  ', N'1220597763', 104)
INSERT [dbo].[SinhVien] ([MaSinhVien], [HoTen], [SoDienThoai], [GioiTinh], [NamHoc], [TonGiao], [QuocTich], [CMND_CCCD], [SoPhong]) VALUES (18724264, N'Nguyễn Bình Thái ', N'0614462486                                        ', N'nam       ', 4, N'không     ', N'Việt Nam  ', N'2604985022', 601)
INSERT [dbo].[SinhVien] ([MaSinhVien], [HoTen], [SoDienThoai], [GioiTinh], [NamHoc], [TonGiao], [QuocTich], [CMND_CCCD], [SoPhong]) VALUES (18871126, N'Hứa Dư Quốc', N'0934865499                                        ', N'nam       ', 4, N'không     ', N'Việt Nam  ', N'7368677978', 501)
INSERT [dbo].[SinhVien] ([MaSinhVien], [HoTen], [SoDienThoai], [GioiTinh], [NamHoc], [TonGiao], [QuocTich], [CMND_CCCD], [SoPhong]) VALUES (18887064, N'Vương Quang ', N'0293694232                                        ', N'nam       ', 4, N'không     ', N'Việt Nam  ', N'4231297719', 401)
INSERT [dbo].[SinhVien] ([MaSinhVien], [HoTen], [SoDienThoai], [GioiTinh], [NamHoc], [TonGiao], [QuocTich], [CMND_CCCD], [SoPhong]) VALUES (19110342, N'Đỗ Duy Dương', N'0932819838                                        ', N'nam       ', 3, N'không     ', N'Việt Nam  ', N'3821738716', 801)
INSERT [dbo].[SinhVien] ([MaSinhVien], [HoTen], [SoDienThoai], [GioiTinh], [NamHoc], [TonGiao], [QuocTich], [CMND_CCCD], [SoPhong]) VALUES (19110365, N'Phạm Đinh Quốc Hòa', N'0921321376                                        ', N'nam       ', 3, N'không     ', N'Việt Nam  ', N'921382713 ', 801)
INSERT [dbo].[SinhVien] ([MaSinhVien], [HoTen], [SoDienThoai], [GioiTinh], [NamHoc], [TonGiao], [QuocTich], [CMND_CCCD], [SoPhong]) VALUES (19110426, N'Võ Nhật Phi', N'0932713718                                        ', N'nam       ', 3, N'không     ', N'Việt Nam  ', N'938427728 ', 706)
INSERT [dbo].[SinhVien] ([MaSinhVien], [HoTen], [SoDienThoai], [GioiTinh], [NamHoc], [TonGiao], [QuocTich], [CMND_CCCD], [SoPhong]) VALUES (19217736, N'Cao Thủy Kiều', N'0309488448                                        ', N'nữ        ', 3, N'tin lành  ', N'Việt Nam  ', N'5048877503', 304)
INSERT [dbo].[SinhVien] ([MaSinhVien], [HoTen], [SoDienThoai], [GioiTinh], [NamHoc], [TonGiao], [QuocTich], [CMND_CCCD], [SoPhong]) VALUES (19232151, N'Lý Anh Tài', N'0262143289                                        ', N'nam       ', 3, N'hòa hảo   ', N'Việt Nam  ', N'5026652585', 603)
INSERT [dbo].[SinhVien] ([MaSinhVien], [HoTen], [SoDienThoai], [GioiTinh], [NamHoc], [TonGiao], [QuocTich], [CMND_CCCD], [SoPhong]) VALUES (19310104, N'Nguyễn Duy Hoàng', N'0178321078                                        ', N'nam       ', 3, N'không     ', N'Việt Nam  ', N'5113521714', 401)
INSERT [dbo].[SinhVien] ([MaSinhVien], [HoTen], [SoDienThoai], [GioiTinh], [NamHoc], [TonGiao], [QuocTich], [CMND_CCCD], [SoPhong]) VALUES (19502847, N'Cao Công Chí', N'0892206360                                        ', N'nam       ', 3, N'không     ', N'Việt Nam  ', N'7585026089', 701)
INSERT [dbo].[SinhVien] ([MaSinhVien], [HoTen], [SoDienThoai], [GioiTinh], [NamHoc], [TonGiao], [QuocTich], [CMND_CCCD], [SoPhong]) VALUES (19548579, N'Lý Duy Mạnh', N'0716774271                                        ', N'nam       ', 3, N'không     ', N'Việt Nam  ', N'6029150966', 603)
INSERT [dbo].[SinhVien] ([MaSinhVien], [HoTen], [SoDienThoai], [GioiTinh], [NamHoc], [TonGiao], [QuocTich], [CMND_CCCD], [SoPhong]) VALUES (19808033, N'Đỗ Nhật Na', N'0352330145                                        ', N'nữ        ', 3, N'không     ', N'Việt Nam  ', N'5824351114', 302)
INSERT [dbo].[SinhVien] ([MaSinhVien], [HoTen], [SoDienThoai], [GioiTinh], [NamHoc], [TonGiao], [QuocTich], [CMND_CCCD], [SoPhong]) VALUES (19842951, N'Vương Tấn Phi', N'0862764459                                        ', N'nam       ', 3, N'không     ', N'Việt Nam  ', N'3775743019', 401)
INSERT [dbo].[SinhVien] ([MaSinhVien], [HoTen], [SoDienThoai], [GioiTinh], [NamHoc], [TonGiao], [QuocTich], [CMND_CCCD], [SoPhong]) VALUES (20115485, N'Đào Hồng Thắm', N'0958874521                                        ', N'nữ        ', 2, N'không     ', N'Việt Nam  ', N'6498489415', 102)
INSERT [dbo].[SinhVien] ([MaSinhVien], [HoTen], [SoDienThoai], [GioiTinh], [NamHoc], [TonGiao], [QuocTich], [CMND_CCCD], [SoPhong]) VALUES (20140714, N'Tạ Bích Chi', N'0928019481                                        ', N'nữ        ', 2, N'không     ', N'Việt Nam  ', N'4645307518', 101)
INSERT [dbo].[SinhVien] ([MaSinhVien], [HoTen], [SoDienThoai], [GioiTinh], [NamHoc], [TonGiao], [QuocTich], [CMND_CCCD], [SoPhong]) VALUES (20251588, N'Tạ Thị Thủy', N'0723334472                                        ', N'nữ        ', 2, N'không     ', N'Việt Nam  ', N'7139774073', 305)
INSERT [dbo].[SinhVien] ([MaSinhVien], [HoTen], [SoDienThoai], [GioiTinh], [NamHoc], [TonGiao], [QuocTich], [CMND_CCCD], [SoPhong]) VALUES (20334082, N'La Thúy Tâm', N'0521805148                                        ', N'nữ        ', 2, N'không     ', N'Việt Nam  ', N'7571093561', 303)
INSERT [dbo].[SinhVien] ([MaSinhVien], [HoTen], [SoDienThoai], [GioiTinh], [NamHoc], [TonGiao], [QuocTich], [CMND_CCCD], [SoPhong]) VALUES (20347113, N'Quế Phương Lâm', N'0824829102                                        ', N'nam       ', 2, N'không     ', N'Việt Nam  ', N'5298868283', 501)
INSERT [dbo].[SinhVien] ([MaSinhVien], [HoTen], [SoDienThoai], [GioiTinh], [NamHoc], [TonGiao], [QuocTich], [CMND_CCCD], [SoPhong]) VALUES (20381244, N'Hứa Bảo Đa', N'0423368730                                        ', N'nam       ', 2, N'không     ', N'Việt Nam  ', N'2073494827', 402)
INSERT [dbo].[SinhVien] ([MaSinhVien], [HoTen], [SoDienThoai], [GioiTinh], [NamHoc], [TonGiao], [QuocTich], [CMND_CCCD], [SoPhong]) VALUES (20475809, N'Đỗ Đông Trí', N'0439485303                                        ', N'nam       ', 2, N'không     ', N'Việt Nam  ', N'5747502933', 701)
INSERT [dbo].[SinhVien] ([MaSinhVien], [HoTen], [SoDienThoai], [GioiTinh], [NamHoc], [TonGiao], [QuocTich], [CMND_CCCD], [SoPhong]) VALUES (20863594, N'Nguyễn Thúy Kiều', N'0644111740                                        ', N'nữ        ', 2, N'hồi giáo  ', N'Việt Nam  ', N'8226470019', 101)
INSERT [dbo].[SinhVien] ([MaSinhVien], [HoTen], [SoDienThoai], [GioiTinh], [NamHoc], [TonGiao], [QuocTich], [CMND_CCCD], [SoPhong]) VALUES (20905262, N'Ninh Tá Nhật', N'0400156245                                        ', N'nam       ', 2, N'thiên chúa', N'Việt Nam  ', N'338735948 ', 601)
INSERT [dbo].[SinhVien] ([MaSinhVien], [HoTen], [SoDienThoai], [GioiTinh], [NamHoc], [TonGiao], [QuocTich], [CMND_CCCD], [SoPhong]) VALUES (21253062, N'Đỗ Ngọc Nhi', N'0627760688                                        ', N'nữ        ', 1, N'không     ', N'Việt Nam  ', N'2155819187', 202)
INSERT [dbo].[SinhVien] ([MaSinhVien], [HoTen], [SoDienThoai], [GioiTinh], [NamHoc], [TonGiao], [QuocTich], [CMND_CCCD], [SoPhong]) VALUES (21321232, N'Phạm Nhật Trường', N'0644537617                                        ', N'nam       ', 1, N'cao đài   ', N'Việt Nam  ', N'2963229909', 401)
INSERT [dbo].[SinhVien] ([MaSinhVien], [HoTen], [SoDienThoai], [GioiTinh], [NamHoc], [TonGiao], [QuocTich], [CMND_CCCD], [SoPhong]) VALUES (21362412, N'Hứa Tâm Linh', N'0745705161                                        ', N'nữ        ', 1, N'hòa hảo   ', N'Việt Nam  ', N'3984793594', 101)
INSERT [dbo].[SinhVien] ([MaSinhVien], [HoTen], [SoDienThoai], [GioiTinh], [NamHoc], [TonGiao], [QuocTich], [CMND_CCCD], [SoPhong]) VALUES (21416652, N'Phạm Long Vy', N'0217795079                                        ', N'nữ        ', 1, N'không     ', N'Việt Nam  ', N'1350406581', 303)
INSERT [dbo].[SinhVien] ([MaSinhVien], [HoTen], [SoDienThoai], [GioiTinh], [NamHoc], [TonGiao], [QuocTich], [CMND_CCCD], [SoPhong]) VALUES (21468844, N'Phùng Lê Huy Hoàng', N'0586926588                                        ', N'nam       ', 1, N'hồi giáo  ', N'Việt Nam  ', N'2408903584', 402)
INSERT [dbo].[SinhVien] ([MaSinhVien], [HoTen], [SoDienThoai], [GioiTinh], [NamHoc], [TonGiao], [QuocTich], [CMND_CCCD], [SoPhong]) VALUES (21502066, N'Dương Thành Thanh', N'0295036385                                        ', N'nam       ', 1, N'hồi giáo  ', N'Việt Nam  ', N'4434613961', 502)
INSERT [dbo].[SinhVien] ([MaSinhVien], [HoTen], [SoDienThoai], [GioiTinh], [NamHoc], [TonGiao], [QuocTich], [CMND_CCCD], [SoPhong]) VALUES (21521643, N'La Bảo Anh', N'0417485456                                        ', N'nữ        ', 1, N'tin lành  ', N'Việt Nam  ', N'7414533405', 104)
INSERT [dbo].[SinhVien] ([MaSinhVien], [HoTen], [SoDienThoai], [GioiTinh], [NamHoc], [TonGiao], [QuocTich], [CMND_CCCD], [SoPhong]) VALUES (21686255, N'Ninh Trần Phong Tuấn', N'0388692257                                        ', N'nam       ', 1, N'không     ', N'Việt Nam  ', N'7414359031', 502)
INSERT [dbo].[SinhVien] ([MaSinhVien], [HoTen], [SoDienThoai], [GioiTinh], [NamHoc], [TonGiao], [QuocTich], [CMND_CCCD], [SoPhong]) VALUES (21718850, N'Võ Quốc Sơn', N'0459355443                                        ', N'nam       ', 1, N'không     ', N'Việt Nam  ', N'7141517914', 402)
INSERT [dbo].[SinhVien] ([MaSinhVien], [HoTen], [SoDienThoai], [GioiTinh], [NamHoc], [TonGiao], [QuocTich], [CMND_CCCD], [SoPhong]) VALUES (21808983, N'Cao Đức Tuân', N'0618521271                                        ', N'nam       ', 1, N'không     ', N'Việt Nam  ', N'1994191462', 502)
INSERT [dbo].[SinhVien] ([MaSinhVien], [HoTen], [SoDienThoai], [GioiTinh], [NamHoc], [TonGiao], [QuocTich], [CMND_CCCD], [SoPhong]) VALUES (21818651, N'Hồ Kim Anh', N'0646158663                                        ', N'nữ        ', 1, N'không     ', N'Việt Nam  ', N'1892885517', 103)
INSERT [dbo].[SinhVien] ([MaSinhVien], [HoTen], [SoDienThoai], [GioiTinh], [NamHoc], [TonGiao], [QuocTich], [CMND_CCCD], [SoPhong]) VALUES (21934732, N'Đoàn Mộng Đức', N'0957143939                                        ', N'nam       ', 1, N'không     ', N'Việt Nam  ', N'3432326593', 701)
GO
ALTER TABLE [dbo].[HoaDonDienNuoc] ADD  CONSTRAINT [DF_HoaDonDienNuoc_NgayTaoHoaDon]  DEFAULT (getdate()) FOR [NgayTaoHoaDon]
GO
ALTER TABLE [dbo].[NhanVien] ADD  CONSTRAINT [DF_NhanVien_QuocTich]  DEFAULT (N'Việt Nam') FOR [QuocTich]
GO
ALTER TABLE [dbo].[Phong] ADD  CONSTRAINT [DF_Phong_NguoiQuanLy]  DEFAULT ((100001)) FOR [NguoiQuanLy]
GO
ALTER TABLE [dbo].[SinhVien] ADD  CONSTRAINT [DF_SinhVien_QuocTich]  DEFAULT (N'Việt Nam') FOR [QuocTich]
GO
ALTER TABLE [dbo].[HoaDonDienNuoc]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonDienNuoc_Phong] FOREIGN KEY([SoPhong])
REFERENCES [dbo].[Phong] ([SoPhong])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDonDienNuoc] CHECK CONSTRAINT [FK_HoaDonDienNuoc_Phong]
GO
ALTER TABLE [dbo].[HoaDonLePhi]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonLePhi_SinhVien] FOREIGN KEY([MaSinhVien])
REFERENCES [dbo].[SinhVien] ([MaSinhVien])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDonLePhi] CHECK CONSTRAINT [FK_HoaDonLePhi_SinhVien]
GO
ALTER TABLE [dbo].[Phong]  WITH CHECK ADD  CONSTRAINT [FK_Phong_NhanVien] FOREIGN KEY([NguoiQuanLy])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Phong] CHECK CONSTRAINT [FK_Phong_NhanVien]
GO
ALTER TABLE [dbo].[SinhVien]  WITH CHECK ADD  CONSTRAINT [FK_SinhVien_Phong] FOREIGN KEY([SoPhong])
REFERENCES [dbo].[Phong] ([SoPhong])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SinhVien] CHECK CONSTRAINT [FK_SinhVien_Phong]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [CHECK_CCCD_NV] CHECK  ((len([CMND_CCCD])>(8)))
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [CHECK_CCCD_NV]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [CHECK_MSNV] CHECK  (([MaNhanVien]>(100000) AND [MaNhanVien]<(999999)))
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [CHECK_MSNV]
GO
ALTER TABLE [dbo].[Phong]  WITH CHECK ADD  CONSTRAINT [CHECK_SoluongSV] CHECK  (([SoLuongSinhVienToiDa]>=(2) AND [SoLuongSinhVienToiDa]<(9)))
GO
ALTER TABLE [dbo].[Phong] CHECK CONSTRAINT [CHECK_SoluongSV]
GO
ALTER TABLE [dbo].[SinhVien]  WITH CHECK ADD  CONSTRAINT [CHECK_CCCD_SV] CHECK  ((len([CMND_CCCD])>(8)))
GO
ALTER TABLE [dbo].[SinhVien] CHECK CONSTRAINT [CHECK_CCCD_SV]
GO
ALTER TABLE [dbo].[SinhVien]  WITH CHECK ADD  CONSTRAINT [CHECK_MSSV] CHECK  (([MaSinhVien]>(10000000) AND [MaSinhVien]<=(99999999)))
GO
ALTER TABLE [dbo].[SinhVien] CHECK CONSTRAINT [CHECK_MSSV]
GO
ALTER TABLE [dbo].[SinhVien]  WITH CHECK ADD  CONSTRAINT [CHECK_NamHocSV] CHECK  (([NamHoc]<(5)))
GO
ALTER TABLE [dbo].[SinhVien] CHECK CONSTRAINT [CHECK_NamHocSV]
GO
/****** Object:  StoredProcedure [dbo].[sp_CapNhatHoaDonDienNuoc]    Script Date: 11/13/2021 12:07:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Cập nhật hóa đơn
CREATE PROCEDURE [dbo].[sp_CapNhatHoaDonDienNuoc]
@MaBienLai int, @TienDien float, @TienNuoc float, @NgayTaoHoaDon date, @TinhTrangThanhToan nvarchar(50), @SoPhong int
AS
UPDATE HoaDonDienNuoc
SET 	TienDien = @TienDien,
	TienNuoc = @TienNuoc,
	NgayTaoHoaDon = @NgayTaoHoaDon,
TinhTrangThanhToan = @TinhTrangThanhToan,	
	SoPhong = @SoPhong
WHERE MaBienLai = @MaBienLai
GO
/****** Object:  StoredProcedure [dbo].[sp_CapNhatHoaDonLePhi]    Script Date: 11/13/2021 12:07:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Cập nhật hóa đơn lệ phí
CREATE PROCEDURE [dbo].[sp_CapNhatHoaDonLePhi]
@MaBienLai int, @TongTien float, @NgayBatDauO date, @NgayTaoHoaDon date,@TinhTrangThanhToan nvarchar(50), @MaSinhVien int
AS
UPDATE HoaDonLePhi
SET	TongTien = @TongTien,
	NgayBatDauO = @NgayBatDauO,
NgayTaoHoaDon = @NgayTaoHoaDon,	
TinhTrangThanhToan = @TinhTrangThanhToan,
MaSinhVien = @MaSinhVien
WHERE MaBienLai = @MaBienLai
GO
/****** Object:  StoredProcedure [dbo].[sp_CapNhatNhanVien]    Script Date: 11/13/2021 12:07:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Sửa nhân viên
CREATE PROCEDURE [dbo].[sp_CapNhatNhanVien]
  @MaNhanVien int, @HoTen nvarchar(50), @SoDienThoai ntext, @GioiTinh nchar(10), @TonGiao nchar(10), @QuocTich nchar(10), @CMND nvarchar(50), @ChucVu nchar(10) 
AS
UPDATE NhanVien
SET	HoTen = @HoTen,
	SoDienThoai = @SoDienThoai,
	GioiTinh = @GioiTinh,
		TonGiao = @TonGiao,
		QuocTich = @QuocTich,
		CMND_CCCD = @CMND,
		ChucVu = @ChucVu
WHERE MaNhanVien = @MaNhanVien
GO
/****** Object:  StoredProcedure [dbo].[sp_CapNhatPhong]    Script Date: 11/13/2021 12:07:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Cập nhật phòng
CREATE PROCEDURE [dbo].[sp_CapNhatPhong]
@SoPhong int, @SoLuongSinhVienToiDa int, @NguoiQuanLy int
AS
UPDATE Phong
SET 	SoLuongSinhVienToiDa = @SoLuongSinhVienToiDa,
	NguoiQuanLy = @NguoiQuanLy
WHERE SoPhong = @SoPhong
GO
/****** Object:  StoredProcedure [dbo].[sp_CapNhatSinhVien]    Script Date: 11/13/2021 12:07:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Cập nhật thông tin sinh viên
CREATE PROCEDURE [dbo].[sp_CapNhatSinhVien]
@MaSinhVien int, @HoTen nvarchar(50), @SoDienThoai nchar(50), @GioiTinh nchar(10), @NamHoc int, @TonGiao nchar(10), @QuocTich nchar(10), @CMND nchar(10), @SoPhong int
AS
UPDATE SinhVien
SET	HoTen = @HoTen,
	SoDienThoai = @SoDienThoai,
	GioiTinh = @GioiTinh,
	NamHoc = @NamHoc,
	TonGiao = @TonGiao,
	QuocTich = @QuocTich,
	CMND_CCCD = @CMND,
	SoPhong = @SoPhong
WHERE MaSinhVien = @MaSinhVien
GO
/****** Object:  StoredProcedure [dbo].[sp_DanhSachHoaDonDienNuoc]    Script Date: 11/13/2021 12:07:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_DanhSachHoaDonDienNuoc]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT a.MaBienLai as N'Mã biên lai', a.TienDien as N'Tiền điện', a.TienNuoc as N'Tiền nước', a.NgayTaoHoaDon as N'Ngày tạo HĐ',
	a.TinhTrangThanhToan as N'Thanh toán', a.SoPhong as N'Số phòng'
	FROM HoaDonDienNuoc a
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DanhSachHoaDonLePhi]    Script Date: 11/13/2021 12:07:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_DanhSachHoaDonLePhi]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT a.MaBienLai as N'Mã biên lai', a.TongTien as N'Tổng tiền', a.NgayBatDauO as N'Ngày bắt đầu ở',
	a.NgayTaoHoaDon as N'Ngày tạo HĐ', a.TinhTrangThanhToan as N'Thanh toán', a.MaSinhVien as N'MSSV', sv.HoTen as N'Họ tên'
	FROM HoaDonLePhi a, SinhVien sv
	WHERE a.MaSinhVien = sv.MaSinhVien
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DanhSachNhanVien]    Script Date: 11/13/2021 12:07:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DanhSachNhanVien]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT a.MaNhanVien as N'Mã NV', a.HoTen as N'Họ tên', a.SoDienThoai as N'Liên hệ', a.GioiTinh as N'Giới tính',
	a.TonGiao as N'Tôn giáo', a.QuocTich as N'Quốc tịch', a.CMND_CCCD as N'CMND', a.ChucVu as N'Chức vụ'
	FROM NhanVien a
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DanhSachPhong]    Script Date: 11/13/2021 12:07:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_DanhSachPhong]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT p.SoPhong as N'Số phòng', p.Tang as N'Tầng', p.SoLuongSinhVienHienTai as N'Số lượng SVHT',
	p.SoLuongSinhVienToiDa as N'Số lượng SVTĐ', p.NguoiQuanLy as N'Mã NQL', n.HoTen as N'Họ tên'
	FROM Phong p, NhanVien n
	WHERE p.NguoiQuanLy = n.MaNhanVien
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DanhSachPhongTheoTang]    Script Date: 11/13/2021 12:07:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Xuất danh sách phòng theo tầng
CREATE PROCEDURE [dbo].[sp_DanhSachPhongTheoTang]
@Tang int
AS
SELECT * FROM Phong WHERE Tang = @Tang
GO
/****** Object:  StoredProcedure [dbo].[sp_DanhSachSinhVien]    Script Date: 11/13/2021 12:07:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DanhSachSinhVien]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT a.MaSinhVien as N'MSSV', a.HoTen as N'Họ tên', a.SoDienThoai as N'Liên hệ', a.GioiTinh as N'Giới tính',
	a.NamHoc as N'Năm học', a.TonGiao as N'Tôn giáo', a.QuocTich as N'Quốc tịch', a.CMND_CCCD as N'CMND',a.SoPhong as N'Số phòng'
	FROM SinhVien a
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DanhSachSinhVienTheoPhong]    Script Date: 11/13/2021 12:07:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Xuất danh sách sinh viên theo phòng
CREATE PROCEDURE [dbo].[sp_DanhSachSinhVienTheoPhong]
 @SoPhong int
AS
	SELECT a.MaSinhVien as N'MSSV', a.HoTen as N'Họ tên', a.SoDienThoai as N'Liên hệ', a.GioiTinh as N'Giới tính',
	a.NamHoc as N'Năm học', a.TonGiao as N'Tôn giáo', a.QuocTich as N'Quốc tịch', a.CMND_CCCD as N'CMND',a.SoPhong as N'Số phòng' 
	FROM SinhVien a
	WHERE SoPhong = @SoPhong
GO
/****** Object:  StoredProcedure [dbo].[sp_DoiMatKhau]    Script Date: 11/13/2021 12:07:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_DoiMatKhau]
@TenTaiKhoan int, @MatKhau varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE DangNhap
	SET MatKhau = @MatKhau	
	WHERE TenTaiKhoan = @TenTaiKhoan
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemHoaDonDienNuoc]    Script Date: 11/13/2021 12:07:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Thêm hóa đơn điện nước
CREATE PROCEDURE [dbo].[sp_ThemHoaDonDienNuoc]
@MaBienLai int, @TienDien float, @TienNuoc float, @NgayTaoHoaDon date, @TinhTrangThanhToan nvarchar(50), @SoPhong int
AS
INSERT INTO HoaDonDienNuoc(MaBienLai, TienDien, TienNuoc, NgayTaoHoaDon, TinhTrangThanhToan, SoPhong)
VALUES(@MaBienLai, @TienDien, @TienNuoc, @NgayTaoHoaDon, @TinhTrangThanhToan , @SoPhong)
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemHoaDonLePhi]    Script Date: 11/13/2021 12:07:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Thêm hóa đơn lệ phí
CREATE PROCEDURE [dbo].[sp_ThemHoaDonLePhi]
@MaBienLai int, @TongTien float, @NgayBatDauO date, @NgayTaoHoaDon date, @MaSinhVien int, @TinhTrangThanhToan nvarchar(50)
AS 
INSERT INTO HoaDonLePhi(MaBienLai, TongTien, NgayBatDauO, NgayTaoHoaDon,TinhTrangThanhToan, MaSinhVien)
VALUES(@MaBienLai, @TongTien, @NgayBatDauO, @NgayTaoHoaDon,@TinhTrangThanhToan, @MaSinhVien)
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemNhanVien]    Script Date: 11/13/2021 12:07:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*--------------------------CÀI ĐẶT CÁC STORED PROCEDURES--------------------------*/
--Thêm nhân viên
CREATE PROCEDURE [dbo].[sp_ThemNhanVien]
 @MaNhanVien int, @HoTen nvarchar(50), @SoDienThoai ntext, @GioiTinh nchar(10), @TonGiao nchar(10), @QuocTich nchar(10), @CMND nvarchar(50), @ChucVu nchar(10) 
AS
INSERT INTO NhanVien( MaNhanVien, HoTen , SoDienThoai , GioiTinh, TonGiao , QuocTich, CMND_CCCD, ChucVu)
VALUES( @MaNhanVien, @HoTen, @SoDienThoai, @GioiTinh , @TonGiao, @QuocTich , @CMND, @ChucVu)
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemPhong]    Script Date: 11/13/2021 12:07:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Thêm phòng
CREATE PROCEDURE [dbo].[sp_ThemPhong]
@SoPhong int, @Tang int,@SoLuongSinhVienHienTai int, @SoLuongSinhVienToiDa int, @NguoiQuanLy int
AS
INSERT INTO Phong(SoPhong, Tang,SoLuongSinhVienHienTai, SoLuongSinhVienToiDa, NguoiQuanLy)
VALUES(@SoPhong, @Tang,@SoLuongSinhVienHienTai, @SoLuongSinhVienToiDa, @NguoiQuanLy)
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemSinhVien]    Script Date: 11/13/2021 12:07:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Nhập thông tin sinh viên
CREATE PROCEDURE [dbo].[sp_ThemSinhVien]
@MaSinhVien int, @HoTen nvarchar(50), @SoDienThoai nchar(50), @GioiTinh nchar(10), @NamHoc int, @TonGiao nchar(10), @QuocTich nchar(10), @CMND nchar(10), @SoPhong int
AS
INSERT INTO SinhVien(MaSinhVien, HoTen, SoDienThoai, GioiTinh, NamHoc, TonGiao, QuocTich, CMND_CCCD, SoPhong)
VALUES (@MaSinhVien, @HoTen, @SoDienThoai, @GioiTinh, @NamHoc , @TonGiao , @QuocTich, @CMND , @SoPhong)
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaHoaDonDienNuoc]    Script Date: 11/13/2021 12:07:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Xóa hóa đơn điện nước
CREATE PROCEDURE [dbo].[sp_XoaHoaDonDienNuoc]
@MaBienLai int
AS
DELETE FROM HoaDonDienNuoc WHERE MaBienLai = @MaBienLai
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaHoaDonLePhi]    Script Date: 11/13/2021 12:07:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Xóa hóa đơn lệ phí
CREATE PROCEDURE [dbo].[sp_XoaHoaDonLePhi]
@MaBienLai int
AS
DELETE FROM HoaDonLePhi WHERE MaBienLai = @MaBienLai
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaNhanVien]    Script Date: 11/13/2021 12:07:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Xóa nhân viên
CREATE PROCEDURE [dbo].[sp_XoaNhanVien]
@MaNhanVien int
AS
DELETE FROM NhanVien WHERE MaNhanVien = @MaNhanVien
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaPhong]    Script Date: 11/13/2021 12:07:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Xóa phòng
CREATE PROCEDURE [dbo].[sp_XoaPhong]
@SoPhong int
AS
DELETE FROM Phong WHERE SoPhong = @SoPhong
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaSinhVien]    Script Date: 11/13/2021 12:07:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Xóa sinh viên
CREATE PROCEDURE [dbo].[sp_XoaSinhVien] 
@MaSinhVien int
AS
DELETE FROM SinhVien WHERE MaSinhVien = @MaSinhVien
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SinhVien', @level2type=N'CONSTRAINT',@level2name=N'CHECK_CCCD_SV'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "HoaDonDienNuoc"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 239
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_HoaDonDienNuocChuaThanhToan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_HoaDonDienNuocChuaThanhToan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_PhongConChoTrong'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_PhongConChoTrong'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_PhongTrong'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_PhongTrong'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[26] 2[23] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "NhanVien"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DangNhap"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_ThongTinDangNhapNhanVien'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_ThongTinDangNhapNhanVien'
GO
USE [master]
GO
ALTER DATABASE [KTX_DBMS] SET  READ_WRITE 
GO
