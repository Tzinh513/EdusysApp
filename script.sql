USE [master]
GO
/****** Object:  Database [EduSys]    Script Date: 10/20/2022 12:14:11 AM ******/
CREATE DATABASE [EduSys]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EduSys', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\EduSys.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EduSys_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\EduSys_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EduSys] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EduSys].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EduSys] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EduSys] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EduSys] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EduSys] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EduSys] SET ARITHABORT OFF 
GO
ALTER DATABASE [EduSys] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EduSys] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EduSys] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EduSys] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EduSys] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EduSys] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EduSys] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EduSys] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EduSys] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EduSys] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EduSys] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EduSys] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EduSys] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EduSys] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EduSys] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EduSys] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EduSys] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EduSys] SET RECOVERY FULL 
GO
ALTER DATABASE [EduSys] SET  MULTI_USER 
GO
ALTER DATABASE [EduSys] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EduSys] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EduSys] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EduSys] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [EduSys] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'EduSys', N'ON'
GO
USE [EduSys]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 10/20/2022 12:14:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Account_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BangDiem]    Script Date: 10/20/2022 12:14:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BangDiem](
	[MaHV] [int] NOT NULL,
	[MaKH] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChuyenDe]    Script Date: 10/20/2022 12:14:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuyenDe](
	[MaCD] [nchar](5) NOT NULL,
	[TenCD] [nvarchar](50) NOT NULL,
	[HocPhi] [float] NOT NULL CONSTRAINT [DF_ChuyenDe_HocPhi]  DEFAULT ((0)),
	[ThoiLuong] [int] NOT NULL CONSTRAINT [DF_ChuyenDe_ThoiLuong]  DEFAULT ((30)),
	[Hinh] [nvarchar](500) NOT NULL CONSTRAINT [DF_ChuyenDe_Hinh]  DEFAULT (N'chuyen-de.png'),
	[MoTa] [nvarchar](255) NOT NULL CONSTRAINT [DF_ChuyenDe_MoTa]  DEFAULT (''),
 CONSTRAINT [PK_ChuyenDe] PRIMARY KEY CLUSTERED 
(
	[MaCD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HocVien]    Script Date: 10/20/2022 12:14:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HocVien](
	[MaHV] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NOT NULL,
	[MaNH] [nchar](7) NOT NULL,
	[Diem] [float] NOT NULL CONSTRAINT [DF_HocVien_Diem]  DEFAULT ((0)),
 CONSTRAINT [PK_HocVien] PRIMARY KEY CLUSTERED 
(
	[MaHV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhoaHoc]    Script Date: 10/20/2022 12:14:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhoaHoc](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[MaCD] [nchar](5) NOT NULL,
	[HocPhi] [float] NOT NULL CONSTRAINT [DF_KhoaHoc_HocPhi]  DEFAULT ((0)),
	[ThoiLuong] [int] NOT NULL CONSTRAINT [DF_KhoaHoc_ThoiLuong]  DEFAULT ((0)),
	[NgayKG] [date] NOT NULL,
	[GhiChu] [nvarchar](50) NULL,
	[MaNV] [nvarchar](50) NOT NULL,
	[NgayTao] [date] NOT NULL CONSTRAINT [DF_KhoaHoc_NgayTao]  DEFAULT (getdate()),
 CONSTRAINT [PK_KhoaHoc] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LastAccount]    Script Date: 10/20/2022 12:14:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LastAccount](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_LastAccount] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mess]    Script Date: 10/20/2022 12:14:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mess](
	[IDMess] [int] IDENTITY(1,1) NOT NULL,
	[NguoiGui] [varchar](50) NOT NULL,
	[NguoiNhan] [varchar](50) NOT NULL,
	[NoiDung] [nvarchar](max) NOT NULL,
	[NgayGui] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Mess] PRIMARY KEY CLUSTERED 
(
	[IDMess] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NguoiHoc]    Script Date: 10/20/2022 12:14:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiHoc](
	[MaNH] [nchar](7) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[GioiTinh] [bit] NOT NULL CONSTRAINT [DF_NguoiHoc_GioiTinh]  DEFAULT ((0)),
	[DienThoai] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[GhiChu] [nvarchar](max) NULL,
	[MaNV] [nvarchar](50) NOT NULL,
	[NgayDK] [date] NOT NULL CONSTRAINT [DF_NguoiHoc_NgayDK]  DEFAULT (getdate()),
 CONSTRAINT [PK_NguoiHoc] PRIMARY KEY CLUSTERED 
(
	[MaNH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 10/20/2022 12:14:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[VaiTro] [bit] NOT NULL CONSTRAINT [DF_QuanTri_VaiTro]  DEFAULT ((0)),
 CONSTRAINT [PK_QuanTri] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'TeoNV', N'songlong', 1)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'TeoNV', N'songlong', 2)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'TeoNV', N'songlong', 3)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'TeoNV', N'songlong', 4)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'TeoNV', N'songlong', 5)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'TeoNV', N'songlong', 1002)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'TeoNV', N'songlong', 1003)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'TeoNV', N'songlong', 1004)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'TeoNV', N'songlong', 1005)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'TeoNV', N'songlong', 1006)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'TeoNV', N'songlong', 1007)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'TeoNV', N'songlong', 1008)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'TeoNV', N'songlong', 1009)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'TeoNV', N'songlong', 1010)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'TeoNV', N'songlong', 1011)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'TeoNV', N'songlong', 1012)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'TeoNV', N'songlong', 1013)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'TeoNV', N'songlong', 1014)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'TeoNV', N'songlong', 1015)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'TeoNV', N'songlong', 1016)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'TeoNV', N'songlong', 1017)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'TeoNV', N'songlong', 1018)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'TeoNV', N'songlong', 1019)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'TeoNV', N'songlong', 1020)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'TeoNV', N'songlong', 1021)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'TeoNV', N'songlong', 1022)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'TeoNV', N'songlong', 1023)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'TeoNV', N'songlong', 1024)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'TeoNV', N'songlong', 1025)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'TeoNV', N'songlong', 1026)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'TeoNV', N'songlong', 1027)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'TeoNV', N'songlong', 1028)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'TeoNV', N'songlong', 1029)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'PheoNC', N'123456', 1030)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'PheoNC', N'123456', 1031)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'PheoNC', N'123456', 1032)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'PheoNC', N'123456', 1033)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'PheoNC', N'123456', 1034)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'PheoNC', N'123456', 1035)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'TeoNV', N'songlong', 1036)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'PheoNC', N'123456', 1037)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'PheoNC', N'123456', 1038)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'PheoNC', N'123456', 1039)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'TeoNV', N'songlong', 1040)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'PheoNC', N'123456', 1041)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'NoPT', N'123456', 1042)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'NoPT', N'123456', 1043)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'PheoNC', N'123456', 1044)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'NoPT', N'123456', 1045)
INSERT [dbo].[Account] ([Username], [Password], [ID]) VALUES (N'NghiemN', N'songlong', 1046)
SET IDENTITY_INSERT [dbo].[Account] OFF
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'JAV01', N'Lập trình Java cơ bản', 250, 90, N'C:\Users\Huy1721\Downloads\anh 3x4 java\anh8.jpg', N'Ping')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'JAV02', N'Lập trình Java nâng cao', 300, 90, N'HTCS.jpg', N'JAV02 - Lập trình Java nâng cao')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'JAV03', N'Lập trình mạng với Java', 200, 70, N'INMA.jpg', N'JAV03 - Lập trình mạng với Java')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'JAV04', N'Lập trình desktop với Swing', 200, 70, N'ADAV.jpg', N'JAV04 - Lập trình desktop với Swing')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'JAVA4', N'L?p trình Java cơ bản', 250, 90, N'Game.jpg', N'Ping')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'PRO01', N'Dự án với công nghệ MS.NET MVC', 300, 90, N'MOWE.png', N'PRO01 - Dự án với công nghệ MS.NET MVC')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'PRO02', N'Dự án với công nghệ Spring MVC', 300, 90, N'Subject.png', N'PRO02 - Dự án với công nghệ Spring MVC')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'PRO03', N'Dự án với công nghệ Servlet/JSP', 300, 90, N'GAME.png', N'PRO03 - Dự án với công nghệ Servlet/JSP')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'PRO04', N'Dự án với AngularJS & WebAPI', 300, 90, N'HTCS.jpg', N'PRO04 - Dự án với AngularJS & WebAPI')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'PRO05', N'Dự án với Swing & JDBC', 300, 90, N'INMA.jpg', N'PRO05 - Dự án với Swing & JDBC')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'PRO06', N'Dự án với WindowForm', 300, 90, N'LAYO.jpg', N'PRO06 - Dự án với WindowForm')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'RDB01', N'Cơ sở dữ liệu SQL Server', 100, 50, N'MOWE.png', N'RDB01 - Cơ sở dữ liệu SQL Server')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'RDB02', N'Lập trình JDBC', 150, 60, N'Subject.png', N'RDB02 - Lập trình JDBC')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'RDB03', N'Lập trình cơ sở dữ liệu Hibernate', 250, 80, N'GAME.png', N'RDB03 - Lập trình cơ sở dữ liệu Hibernate')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'SER01', N'Lập trình web với Servlet/JSP', 350, 100, N'HTCS.jpg', N'SER01 - Lập trình web với Servlet/JSP')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'SER02', N'Lập trình Spring MVC', 400, 110, N'INMA.jpg', N'SER02 - Lập trình Spring MVC')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'SER03', N'Lập trình MS.NET MVC', 400, 110, N'LAYO.jpg', N'SER03 - Lập trình MS.NET MVC')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'SER04', N'Xây dựng Web API với Spring MVC & ASP.NET MVC', 200, 70, N'MOWE.png', N'SER04 - Xây dựng Web API với Spring MVC & ASP.NET MVC')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'WEB01', N'Thiết kế web với HTML và CSS', 200, 70, N'Subject.png', N'WEB01 - Thiết kế web với HTML và CSS')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'WEB02', N'Thiết kế web với Bootstrap', 0, 40, N'GAME.png', N'WEB02 - Thiết kế web với Bootstrap')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'WEB03', N'Lập trình front-end với JavaScript và jQuery', 150, 60, N'HTCS.jpg', N'WEB03 - Lập trình front-end với JavaScript và jQuery')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'WEB04', N'Lập trình AngularJS', 250, 80, N'INMA.jpg', N'WEB04 - Lập trình AngularJS')
SET IDENTITY_INSERT [dbo].[HocVien] ON 

INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (8, 2, N'PS02988', 3)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (12, 3, N'PS02037', 9)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (14, 3, N'PS02867', 2)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (17, 1, N'PS02037', 9)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (19, 1, N'PS02867', 3)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (36, 1, N'PS02988', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (37, 1, N'PS03031', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (38, 1, N'PS03046', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (39, 1, N'PS03080', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (40, 1, N'PS03088', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (41, 1, N'PS03096', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (43, 1, N'PS03120', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (44, 1, N'PS03130', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (46, 3, N'PS03096', 9)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (47, 3, N'PS03120', 6)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (48, 3, N'PS03046', 7)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (56, 5, N'PS02037', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (58, 4, N'PS03031', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1060, 1006, N'PS02988', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1061, 1006, N'PS03031', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1062, 1006, N'PS03046', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1063, 1006, N'PS03080', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1064, 1007, N'PS02988', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1065, 1007, N'PS03031', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1066, 1007, N'PS03046', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1067, 1007, N'PS03080', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1068, 1007, N'PS03088', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1069, 1007, N'PS03096', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1071, 1007, N'PS03120', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1072, 1007, N'PS03130', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1073, 1009, N'PS03134', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1074, 1009, N'PS03172', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1075, 1009, N'PS03202', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1076, 1009, N'PS03203', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1077, 1009, N'PS03205', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1078, 1009, N'PS03222', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1079, 1009, N'PS03230', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1080, 1009, N'PS03233', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1081, 1009, N'PS03251', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1082, 1009, N'PS03304', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1083, 1009, N'PS03306', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1084, 1009, N'PS03308', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1085, 1009, N'PS03325', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1086, 1009, N'PS03346', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1087, 1009, N'PS03383', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1088, 1011, N'PS03425', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1089, 1011, N'PS03454', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1090, 1011, N'PS03472', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1091, 1011, N'PS03488', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1092, 1011, N'PS03530', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1093, 1011, N'PS03553', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1094, 1011, N'PS03561', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1095, 1011, N'PS03596', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1096, 1011, N'PS03603', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1097, 1011, N'PS03610', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1098, 1011, N'PS03614', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1099, 1011, N'PS03618', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1100, 1011, N'PS03638', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1101, 1011, N'PS03640', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1102, 1011, N'PS03662', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1103, 1011, N'PS03674', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1104, 5, N'PS03230', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1105, 5, N'PS03233', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1106, 5, N'PS03251', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1107, 5, N'PS03304', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1108, 5, N'PS03306', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1109, 5, N'PS03308', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1110, 5, N'PS03325', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1111, 5, N'PS03346', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1112, 5, N'PS03383', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1113, 5, N'PS03389', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1114, 5, N'PS03410', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1115, 5, N'PS03411', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1117, 1012, N'PS02037', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1119, 1012, N'PS02867', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1123, 1012, N'PS02988', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1124, 1012, N'PS03031', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1125, 1012, N'PS03046', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1126, 1012, N'PS03080', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1127, 1012, N'PS03088', 0)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1138, 1014, N'PS03088', 5)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1139, 1014, N'PS03096', 6)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1141, 1014, N'PS03120', 2)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1142, 1014, N'PS03130', 9)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1143, 1014, N'PS03134', 10)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1144, 1014, N'PS03172', 10)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1145, 1014, N'PS03202', 7)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (2069, 1012, N'PS24849', 0)
SET IDENTITY_INSERT [dbo].[HocVien] OFF
SET IDENTITY_INSERT [dbo].[KhoaHoc] ON 

INSERT [dbo].[KhoaHoc] ([MaKH], [MaCD], [HocPhi], [ThoiLuong], [NgayKG], [GhiChu], [MaNV], [NgayTao]) VALUES (1, N'PRO02', 300, 90, CAST(N'2018-01-10' AS Date), N'', N'TeoNV', CAST(N'2017-12-31' AS Date))
INSERT [dbo].[KhoaHoc] ([MaKH], [MaCD], [HocPhi], [ThoiLuong], [NgayKG], [GhiChu], [MaNV], [NgayTao]) VALUES (2, N'JAV04', 300, 90, CAST(N'2018-02-11' AS Date), N'', N'TeoNV', CAST(N'2017-12-31' AS Date))
INSERT [dbo].[KhoaHoc] ([MaKH], [MaCD], [HocPhi], [ThoiLuong], [NgayKG], [GhiChu], [MaNV], [NgayTao]) VALUES (3, N'JAV04', 100, 50, CAST(N'2018-03-12' AS Date), N'', N'TeoNV', CAST(N'2017-12-31' AS Date))
INSERT [dbo].[KhoaHoc] ([MaKH], [MaCD], [HocPhi], [ThoiLuong], [NgayKG], [GhiChu], [MaNV], [NgayTao]) VALUES (4, N'JAV04', 250, 80, CAST(N'2018-04-01' AS Date), N'', N'TeoNV', CAST(N'2017-12-31' AS Date))
INSERT [dbo].[KhoaHoc] ([MaKH], [MaCD], [HocPhi], [ThoiLuong], [NgayKG], [GhiChu], [MaNV], [NgayTao]) VALUES (5, N'PRO04', 300, 90, CAST(N'2020-03-08' AS Date), N'', N'TeoNV', CAST(N'2020-03-27' AS Date))
INSERT [dbo].[KhoaHoc] ([MaKH], [MaCD], [HocPhi], [ThoiLuong], [NgayKG], [GhiChu], [MaNV], [NgayTao]) VALUES (1006, N'JAV02', 300, 90, CAST(N'2020-04-12' AS Date), N'Lập trình Java nâng cao', N'TeoNV', CAST(N'2020-05-02' AS Date))
INSERT [dbo].[KhoaHoc] ([MaKH], [MaCD], [HocPhi], [ThoiLuong], [NgayKG], [GhiChu], [MaNV], [NgayTao]) VALUES (1007, N'JAV03', 200, 70, CAST(N'2020-04-12' AS Date), N'Lập trình mạng với Java', N'TeoNV', CAST(N'2020-05-02' AS Date))
INSERT [dbo].[KhoaHoc] ([MaKH], [MaCD], [HocPhi], [ThoiLuong], [NgayKG], [GhiChu], [MaNV], [NgayTao]) VALUES (1008, N'JAV04', 200, 70, CAST(N'2020-04-12' AS Date), N'Lập trình ứng dụng Desktop với Java', N'TeoNV', CAST(N'2020-05-02' AS Date))
INSERT [dbo].[KhoaHoc] ([MaKH], [MaCD], [HocPhi], [ThoiLuong], [NgayKG], [GhiChu], [MaNV], [NgayTao]) VALUES (1009, N'PRO01', 300, 90, CAST(N'2020-04-12' AS Date), N'Lập trình .NET MVC', N'TeoNV', CAST(N'2020-05-02' AS Date))
INSERT [dbo].[KhoaHoc] ([MaKH], [MaCD], [HocPhi], [ThoiLuong], [NgayKG], [GhiChu], [MaNV], [NgayTao]) VALUES (1010, N'PRO02', 300, 90, CAST(N'2020-04-12' AS Date), N'Lập trình Spring MVC', N'TeoNV', CAST(N'2020-05-02' AS Date))
INSERT [dbo].[KhoaHoc] ([MaKH], [MaCD], [HocPhi], [ThoiLuong], [NgayKG], [GhiChu], [MaNV], [NgayTao]) VALUES (1011, N'PRO03', 300, 90, CAST(N'2020-04-12' AS Date), N'Làm dự án với Servlet và JSP', N'TeoNV', CAST(N'2020-05-02' AS Date))
INSERT [dbo].[KhoaHoc] ([MaKH], [MaCD], [HocPhi], [ThoiLuong], [NgayKG], [GhiChu], [MaNV], [NgayTao]) VALUES (1012, N'PRO04', 300, 90, CAST(N'2020-04-12' AS Date), N'Làm dự án với REST API và AngularJS', N'TeoNV', CAST(N'2020-05-02' AS Date))
INSERT [dbo].[KhoaHoc] ([MaKH], [MaCD], [HocPhi], [ThoiLuong], [NgayKG], [GhiChu], [MaNV], [NgayTao]) VALUES (1014, N'JAV01', 250, 90, CAST(N'2020-04-08' AS Date), N'Lập trình Java cơ bản', N'TeoNV', CAST(N'2020-05-02' AS Date))
INSERT [dbo].[KhoaHoc] ([MaKH], [MaCD], [HocPhi], [ThoiLuong], [NgayKG], [GhiChu], [MaNV], [NgayTao]) VALUES (1020, N'JAV01', 300, 90, CAST(N'2020-04-12' AS Date), N'Lập trình Java cơ bản', N'TeoNV', CAST(N'2020-04-12' AS Date))
SET IDENTITY_INSERT [dbo].[KhoaHoc] OFF
SET IDENTITY_INSERT [dbo].[LastAccount] ON 

INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (1, N'TeoNV', N'songlong')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (2, N'', N'')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (3, N'', N'')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (4, N'', N'')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (5, N'', N'')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (6, N'', N'')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (7, N'', N'')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (8, N'', N'')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (9, N'', N'')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (10, N'', N'')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (11, N'', N'')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (12, N'', N'')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (13, N'', N'')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (20, N'', N'')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (22, N'TeoNV', N'songlong')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (23, N'', N'')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (24, N'TeoNV', N'songlong')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (25, N'', N'')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (26, N'', N'')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (27, N'', N'')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (28, N'', N'')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (29, N'', N'')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (30, N'', N'')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (31, N'', N'')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (32, N'', N'')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (33, N'', N'')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (34, N'', N'')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (35, N'', N'')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (36, N'', N'')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (37, N'', N'')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (38, N'', N'')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (39, N'', N'')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (40, N'', N'')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (41, N'PheoNC', N'123456')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (42, N'PheoNC', N'123456')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (43, N'PheoNC', N'123456')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (44, N'PheoNC', N'123456')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (45, N'TeoNV', N'songlong')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (46, N'PheoNC', N'123456')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (47, N'PheoNC', N'123456')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (48, N'', N'')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (49, N'', N'')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (50, N'TeoNV', N'songlong')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (51, N'', N'')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (52, N'NoPT', N'123456')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (53, N'', N'')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (54, N'', N'')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (55, N'', N'')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (56, N'', N'')
INSERT [dbo].[LastAccount] ([ID], [Username], [Password]) VALUES (57, N'', N'')
SET IDENTITY_INSERT [dbo].[LastAccount] OFF
SET IDENTITY_INSERT [dbo].[Mess] ON 

INSERT [dbo].[Mess] ([IDMess], [NguoiGui], [NguoiNhan], [NoiDung], [NgayGui]) VALUES (1, N'NghiemN', N'TeoNV', N'Hello', N'2022-07-03')
INSERT [dbo].[Mess] ([IDMess], [NguoiGui], [NguoiNhan], [NoiDung], [NgayGui]) VALUES (2, N'TeoNV', N'NghiemN', N'Hello', N'2022-07-03')
INSERT [dbo].[Mess] ([IDMess], [NguoiGui], [NguoiNhan], [NoiDung], [NgayGui]) VALUES (4, N'TeoNV', N'NghiemN', N'Hello', N'2003-06-10')
INSERT [dbo].[Mess] ([IDMess], [NguoiGui], [NguoiNhan], [NoiDung], [NgayGui]) VALUES (5, N'TeoNV', N'NghiemN', N'Hello Dạo Này Vẫn Khỏe Chứ mate?', N'                              [19/10/22] 19:09:31')
INSERT [dbo].[Mess] ([IDMess], [NguoiGui], [NguoiNhan], [NoiDung], [NgayGui]) VALUES (6, N'TeoNV', N'NghiemN', N'Alo', N'                              [19/10/22] 19:10:16')
INSERT [dbo].[Mess] ([IDMess], [NguoiGui], [NguoiNhan], [NoiDung], [NgayGui]) VALUES (7, N'TeoNV', N'NghiemN', N'Alo', N'                              [19/10/22] 19:10:17')
INSERT [dbo].[Mess] ([IDMess], [NguoiGui], [NguoiNhan], [NoiDung], [NgayGui]) VALUES (8, N'TeoNV', N'NghiemN', N'Alo', N'                              [19/10/22] 19:10:18')
INSERT [dbo].[Mess] ([IDMess], [NguoiGui], [NguoiNhan], [NoiDung], [NgayGui]) VALUES (9, N'TeoNV', N'NghiemN', N'Sao m không trả lời', N'                              [19/10/22] 19:10:24')
INSERT [dbo].[Mess] ([IDMess], [NguoiGui], [NguoiNhan], [NoiDung], [NgayGui]) VALUES (10, N'', N'NghiemN', N'Xin Chào', N'                              [20/10/22] 00:04:45')
SET IDENTITY_INSERT [dbo].[Mess] OFF
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'       ', N'', CAST(N'2002-10-10' AS Date), 1, N'', N'', N'', N'TeoNV', CAST(N'2022-10-05' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS02037', N'ĐỖ VĂN MINH', CAST(N'1992-10-24' AS Date), 1, N'0968095685', N'PS02037@fpt.edu.vn', N'0968095685 - ĐỖ VĂN MINH', N'PheoNC', CAST(N'1992-10-24' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS02867', N'NGUYỄN HỮU TRÍ', CAST(N'1997-10-27' AS Date), 1, N'0946984711', N'PS02867@fpt.edu.vn', N'0946984711 - NGUYỄN HỮU TRÍ', N'TeoNV', CAST(N'1997-10-27' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS02930', N'TRẦN VĂN NAM', CAST(N'2000-06-03' AS Date), 1, N'0924774498', N'PS02930@fpt.edu.vn', N'0924774498 - TRẦN VĂN NAM', N'TeoNV', CAST(N'2000-06-03' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS02979', N'ĐOÀN TRẦN NHẬT VŨ', CAST(N'1994-08-28' AS Date), 1, N'0912374818', N'PS02979@fpt.edu.vn', N'0912374818 - ĐOÀN TRẦN NHẬT VŨ', N'TeoNV', CAST(N'1994-08-28' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS02983', N'NGUYỄN HOÀNG THIÊN PHƯỚC', CAST(N'1993-04-04' AS Date), 1, N'0912499836', N'PS02983@fpt.edu.vn', N'0912499836 - NGUYỄN HOÀNG THIÊN PHƯỚC', N'PheoNC', CAST(N'1993-04-04' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS02988', N'HỒ HỮU HẬU', CAST(N'1993-02-08' AS Date), 1, N'0924984876', N'PS02988@fpt.edu.vn', N'0924984876 - HỒ HỮU HẬU', N'PheoNC', CAST(N'1993-02-08' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03031', N'PHAN TẤN VIỆT', CAST(N'1990-04-05' AS Date), 1, N'0924832716', N'PS03031@fpt.edu.vn', N'0924832716 - PHAN TẤN VIỆT', N'PheoNC', CAST(N'1990-04-05' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03046', N'NGUYỄN CAO PHƯỚC', CAST(N'1990-01-28' AS Date), 1, N'0977117727', N'PS03046@fpt.edu.vn', N'0977117727 - NGUYỄN CAO PHƯỚC', N'PheoNC', CAST(N'1990-01-28' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03080', N'HUỲNH THANH HUY', CAST(N'1994-09-06' AS Date), 1, N'0916436052', N'PS03080@fpt.edu.vn', N'0916436052 - HUỲNH THANH HUY', N'PheoNC', CAST(N'1994-09-06' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03088', N'NGUYỄN HOÀNG TRUNG', CAST(N'1991-09-02' AS Date), 1, N'0938101529', N'PS03088@fpt.edu.vn', N'0938101529 - NGUYỄN HOÀNG TRUNG', N'PheoNC', CAST(N'1991-09-02' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03096', N'ĐOÀN HỮU KHANG', CAST(N'1994-02-21' AS Date), 1, N'0945196719', N'PS03096@fpt.edu.vn', N'0945196719 - ĐOÀN HỮU KHANG', N'PheoNC', CAST(N'1994-02-21' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03104', N'LÊ THÀNH PHƯƠNG', CAST(N'1993-02-21' AS Date), 0, N'0922948096', N'PS03104@fpt.edu.vn', N'0922948096 - LÊ THÀNH PHƯƠNG', N'TeoNV', CAST(N'1993-02-21' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03120', N'PHẠM NGỌC NHẬT TRƯỜNG', CAST(N'1999-06-24' AS Date), 1, N'0994296169', N'PS03120@fpt.edu.vn', N'0994296169 - PHẠM NGỌC NHẬT TRƯỜNG', N'PheoNC', CAST(N'1999-06-24' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03130', N'ĐẶNG BẢO VIỆT', CAST(N'1990-02-14' AS Date), 1, N'0917749344', N'PS03130@fpt.edu.vn', N'0917749344 - ĐẶNG BẢO VIỆT', N'PheoNC', CAST(N'1990-02-14' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03134', N'LÊ DUY BẢO', CAST(N'1996-08-08' AS Date), 1, N'0926714368', N'PS03134@fpt.edu.vn', N'0926714368 - LÊ DUY BẢO', N'PheoNC', CAST(N'1996-08-08' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03172', N'NGUYỄN ANH TUẤN', CAST(N'1992-02-15' AS Date), 1, N'0920020472', N'PS03172@fpt.edu.vn', N'0920020472 - NGUYỄN ANH TUẤN', N'PheoNC', CAST(N'1992-02-15' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03202', N'PHAN QUỐC QUI', CAST(N'1996-02-04' AS Date), 1, N'0930649274', N'PS03202@fpt.edu.vn', N'0930649274 - PHAN QUỐC QUI', N'PheoNC', CAST(N'1996-02-04' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03203', N'ĐẶNG LÊ QUANG VINH', CAST(N'1990-01-02' AS Date), 1, N'0920197355', N'PS03203@fpt.edu.vn', N'0920197355 - ĐẶNG LÊ QUANG VINH', N'PheoNC', CAST(N'1990-01-02' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03205', N'NGUYỄN MINH SANG', CAST(N'1995-05-02' AS Date), 1, N'0967006218', N'PS03205@fpt.edu.vn', N'0967006218 - NGUYỄN MINH SANG', N'PheoNC', CAST(N'1995-05-02' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03222', N'TRẦM MINH MẪN', CAST(N'1997-02-09' AS Date), 1, N'0911183649', N'PS03222@fpt.edu.vn', N'0911183649 - TRẦM MINH MẪN', N'PheoNC', CAST(N'1997-02-09' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03230', N'NGUYỄN PHẠM MINH HÂN', CAST(N'2000-10-14' AS Date), 1, N'0983469892', N'PS03230@fpt.edu.vn', N'0983469892 - NGUYỄN PHẠM MINH HÂN', N'PheoNC', CAST(N'2000-10-14' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03233', N'LƯU KIM HOÀNG DUY', CAST(N'1996-07-04' AS Date), 1, N'0938357735', N'PS03233@fpt.edu.vn', N'0938357735 - LƯU KIM HOÀNG DUY', N'PheoNC', CAST(N'1996-07-04' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03251', N'TRẦN QUANG VŨ', CAST(N'2000-03-10' AS Date), 1, N'0914531913', N'PS03251@fpt.edu.vn', N'0914531913 - TRẦN QUANG VŨ', N'PheoNC', CAST(N'2000-03-10' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03304', N'BÙI NGỌC THUẬN', CAST(N'1995-01-26' AS Date), 1, N'0999794115', N'PS03304@fpt.edu.vn', N'0999794115 - BÙI NGỌC THUẬN', N'PheoNC', CAST(N'1995-01-26' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03306', N'HỒ VĂN HÀNH', CAST(N'1992-04-15' AS Date), 1, N'0912277868', N'PS03306@fpt.edu.vn', N'0912277868 - HỒ VĂN HÀNH', N'PheoNC', CAST(N'1992-04-15' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03308', N'TRẦN VIẾT HÙNG', CAST(N'1999-02-24' AS Date), 1, N'0916050164', N'PS03308@fpt.edu.vn', N'0916050164 - TRẦN VIẾT HÙNG', N'PheoNC', CAST(N'1999-02-24' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03325', N'NGUYỄN HOÀNG MINH ĐỨC', CAST(N'1996-12-11' AS Date), 1, N'0912234437', N'PS03325@fpt.edu.vn', N'0912234437 - NGUYỄN HOÀNG MINH ĐỨC', N'PheoNC', CAST(N'1996-12-11' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03346', N'PHAN THANH PHONG', CAST(N'1990-01-21' AS Date), 1, N'0937891282', N'PS03346@fpt.edu.vn', N'0937891282 - PHAN THANH PHONG', N'PheoNC', CAST(N'1990-01-21' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03383', N'TRẦN VŨ LUÂN', CAST(N'1998-04-08' AS Date), 1, N'0962030316', N'PS03383@fpt.edu.vn', N'0962030316 - TRẦN VŨ LUÂN', N'PheoNC', CAST(N'1998-04-08' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03389', N'VŨ ĐỨC TUẤN', CAST(N'1993-02-24' AS Date), 1, N'0911637415', N'PS03389@fpt.edu.vn', N'0911637415 - VŨ ĐỨC TUẤN', N'PheoNC', CAST(N'1993-02-24' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03410', N'TRẦN  NHẠT', CAST(N'1992-06-08' AS Date), 1, N'0946219377', N'PS03410@fpt.edu.vn', N'0946219377 - TRẦN  NHẠT', N'PheoNC', CAST(N'1992-06-08' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03411', N'TRƯƠNG THÀNH ĐẠT', CAST(N'1993-11-05' AS Date), 1, N'0991509408', N'PS03411@fpt.edu.vn', N'0991509408 - TRƯƠNG THÀNH ĐẠT', N'PheoNC', CAST(N'1993-11-05' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03425', N'TÔ VĂN NĂNG', CAST(N'1992-07-28' AS Date), 1, N'0915134551', N'PS03425@fpt.edu.vn', N'0915134551 - TÔ VĂN NĂNG', N'PheoNC', CAST(N'1992-07-28' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03454', N'NGUYỄN NHẬT VĨNH', CAST(N'1999-07-09' AS Date), 1, N'0917886371', N'PS03454@fpt.edu.vn', N'0917886371 - NGUYỄN NHẬT VĨNH', N'PheoNC', CAST(N'1999-07-09' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03472', N'NGUYỄN VĂN HUY', CAST(N'1990-01-22' AS Date), 1, N'0960620997', N'PS03472@fpt.edu.vn', N'0960620997 - NGUYỄN VĂN HUY', N'PheoNC', CAST(N'1990-01-22' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03488', N'NGUYỄN NHƯ NGỌC', CAST(N'1995-05-09' AS Date), 0, N'0912880267', N'PS03488@fpt.edu.vn', N'0912880267 - NGUYỄN NHƯ NGỌC', N'PheoNC', CAST(N'1995-05-09' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03530', N'PHẠM THÀNH TÂM', CAST(N'2000-03-11' AS Date), 1, N'0918161783', N'PS03530@fpt.edu.vn', N'0918161783 - PHẠM THÀNH TÂM', N'PheoNC', CAST(N'2000-03-11' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03553', N'ĐINH TẤN CÔNG', CAST(N'2000-08-15' AS Date), 1, N'0918182551', N'PS03553@fpt.edu.vn', N'0918182551 - ĐINH TẤN CÔNG', N'PheoNC', CAST(N'2000-08-15' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03561', N'LÊ MINH ĐIỀN', CAST(N'1995-01-05' AS Date), 1, N'0948199564', N'PS03561@fpt.edu.vn', N'0948199564 - LÊ MINH ĐIỀN', N'PheoNC', CAST(N'1995-01-05' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03596', N'NGUYỄN THANH HIỀN', CAST(N'1991-07-09' AS Date), 1, N'0910545901', N'PS03596@fpt.edu.vn', N'0910545901 - NGUYỄN THANH HIỀN', N'PheoNC', CAST(N'1991-07-09' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03603', N'LÊ PHẠM KIM THANH', CAST(N'1994-08-05' AS Date), 0, N'0924696779', N'PS03603@fpt.edu.vn', N'0924696779 - LÊ PHẠM KIM THANH', N'PheoNC', CAST(N'1994-08-05' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03610', N'TRẦN ĐÌNH TRƯỜNG', CAST(N'1995-01-16' AS Date), 1, N'0941528106', N'PS03610@fpt.edu.vn', N'0941528106 - TRẦN ĐÌNH TRƯỜNG', N'PheoNC', CAST(N'1995-01-16' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03614', N'NGUYỄN VĂN SÁU', CAST(N'1990-04-27' AS Date), 1, N'0940711328', N'PS03614@fpt.edu.vn', N'0940711328 - NGUYỄN VĂN SÁU', N'PheoNC', CAST(N'1990-04-27' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03618', N'PHÍ ĐÌNH VIỆT HÙNG', CAST(N'1996-12-09' AS Date), 1, N'0939020097', N'PS03618@fpt.edu.vn', N'0939020097 - PHÍ ĐÌNH VIỆT HÙNG', N'PheoNC', CAST(N'1996-12-09' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03638', N'PHẠM NHẬT MINH', CAST(N'1997-07-18' AS Date), 1, N'0927771672', N'PS03638@fpt.edu.vn', N'0927771672 - PHẠM NHẬT MINH', N'PheoNC', CAST(N'1997-07-18' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03640', N'LƯU THANH NGỌC', CAST(N'1993-12-01' AS Date), 0, N'0918358164', N'PS03640@fpt.edu.vn', N'0918358164 - LƯU THANH NGỌC', N'PheoNC', CAST(N'1993-12-01' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03662', N'NGUYỄN CAO NGỌC LỢI', CAST(N'1990-04-24' AS Date), 1, N'0930260679', N'PS03662@fpt.edu.vn', N'0930260679 - NGUYỄN CAO NGỌC LỢI', N'PheoNC', CAST(N'1990-04-24' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03674', N'TRẦN TUẤN ANH', CAST(N'1996-06-11' AS Date), 1, N'0914082094', N'PS03674@fpt.edu.vn', N'0914082094 - TRẦN TUẤN ANH', N'PheoNC', CAST(N'1996-06-11' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS24849', N'Ha Huy Tri', CAST(N'2003-10-06' AS Date), 0, N'0387031171', N'hahuytri2K3@gmail.com', N'', N'TeoNV', CAST(N'2022-10-05' AS Date))
INSERT [dbo].[NhanVien] ([MaNV], [MatKhau], [HoTen], [VaiTro]) VALUES (N'LongNDH', N'songlong', N'Nguyễn Đình Hoàng Long', 0)
INSERT [dbo].[NhanVien] ([MaNV], [MatKhau], [HoTen], [VaiTro]) VALUES (N'LongNDT', N'songlong', N'Nguyễn Đình Thiên Long', 0)
INSERT [dbo].[NhanVien] ([MaNV], [MatKhau], [HoTen], [VaiTro]) VALUES (N'NoPT', N'123456', N'Phạm Thị Nở', 0)
INSERT [dbo].[NhanVien] ([MaNV], [MatKhau], [HoTen], [VaiTro]) VALUES (N'NghiemN', N'songlong', N'Nguyễn Nghiệm', 1)
INSERT [dbo].[NhanVien] ([MaNV], [MatKhau], [HoTen], [VaiTro]) VALUES (N'PheoNC', N'123456', N'Nguyễn Chí Phèo', 0)
INSERT [dbo].[NhanVien] ([MaNV], [MatKhau], [HoTen], [VaiTro]) VALUES (N'TeoNV', N'songlong', N'Nguyễn Văn Tèo', 1)
INSERT [dbo].[NhanVien] ([MaNV], [MatKhau], [HoTen], [VaiTro]) VALUES (N'ThaoLTH', N'songlong', N'Lê Thị Hương Thảo', 0)
ALTER TABLE [dbo].[HocVien]  WITH CHECK ADD  CONSTRAINT [FK_HocVien_KhoaHoc] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhoaHoc] ([MaKH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HocVien] CHECK CONSTRAINT [FK_HocVien_KhoaHoc]
GO
ALTER TABLE [dbo].[HocVien]  WITH CHECK ADD  CONSTRAINT [FK_HocVien_NguoiHoc] FOREIGN KEY([MaNH])
REFERENCES [dbo].[NguoiHoc] ([MaNH])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[HocVien] CHECK CONSTRAINT [FK_HocVien_NguoiHoc]
GO
ALTER TABLE [dbo].[KhoaHoc]  WITH CHECK ADD  CONSTRAINT [FK_KhoaHoc_ChuyenDe] FOREIGN KEY([MaCD])
REFERENCES [dbo].[ChuyenDe] ([MaCD])
GO
ALTER TABLE [dbo].[KhoaHoc] CHECK CONSTRAINT [FK_KhoaHoc_ChuyenDe]
GO
ALTER TABLE [dbo].[KhoaHoc]  WITH CHECK ADD  CONSTRAINT [FK_KhoaHoc_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[KhoaHoc] CHECK CONSTRAINT [FK_KhoaHoc_NhanVien]
GO
ALTER TABLE [dbo].[NguoiHoc]  WITH CHECK ADD  CONSTRAINT [FK_NguoiHoc_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[NguoiHoc] CHECK CONSTRAINT [FK_NguoiHoc_NhanVien]
GO
/****** Object:  StoredProcedure [dbo].[sp_BangDiem]    Script Date: 10/20/2022 12:14:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_BangDiem](@MaKH INT)
AS BEGIN
	SELECT
		nh.MaNH,
		nh.HoTen,
		hv.Diem
	FROM HocVien hv
		JOIN NguoiHoc nh ON nh.MaNH=hv.MaNH
	WHERE hv.MaKH = @MaKH
	ORDER BY hv.Diem DESC
END


GO
/****** Object:  StoredProcedure [dbo].[sp_DiemChuyenDe]    Script Date: 10/20/2022 12:14:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_DiemChuyenDe]
AS BEGIN
	SELECT
		TenCD ChuyenDe,
		COUNT(MaHV) SoHV,
		MIN(Diem) ThapNhat,
		MAX(Diem) CaoNhat,
		AVG(Diem) TrungBinh
	FROM KhoaHoc kh
		JOIN HocVien hv ON kh.MaKH=hv.MaKH
		JOIN ChuyenDe cd ON cd.MaCD=kh.MaCD
	GROUP BY TenCD
END


GO
/****** Object:  StoredProcedure [dbo].[sp_DoanhThu]    Script Date: 10/20/2022 12:14:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_DoanhThu](@Year INT)
AS BEGIN
	SELECT
		TenCD ChuyenDe,
		COUNT(DISTINCT kh.MaKH) SoKH,
		COUNT(hv.MaHV) SoHV,
		SUM(kh.HocPhi) DoanhThu,
		MIN(kh.HocPhi) ThapNhat,
		MAX(kh.HocPhi) CaoNhat,
		AVG(kh.HocPhi) TrungBinh
	FROM KhoaHoc kh
		JOIN HocVien hv ON kh.MaKH=hv.MaKH
		JOIN ChuyenDe cd ON cd.MaCD=kh.MaCD
	WHERE YEAR(NgayKG) = @Year
	GROUP BY TenCD
END


GO
/****** Object:  StoredProcedure [dbo].[sp_LuongNguoiHoc]    Script Date: 10/20/2022 12:14:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_LuongNguoiHoc]
AS BEGIN
	SELECT
		YEAR(NgayDK) Nam,
		COUNT(*) SoLuong,
		MIN(NgayDK) DauTien,
		MAX(NgayDK) CuoiCung
	FROM NguoiHoc
	GROUP BY YEAR(NgayDK)
END


GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã chuyên đề, PK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChuyenDe', @level2type=N'COLUMN',@level2name=N'MaCD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên chuyên đề, Unique' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChuyenDe', @level2type=N'COLUMN',@level2name=N'TenCD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Học phí' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChuyenDe', @level2type=N'COLUMN',@level2name=N'HocPhi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Thời lượng (ngày)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChuyenDe', @level2type=N'COLUMN',@level2name=N'ThoiLuong'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hình logo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChuyenDe', @level2type=N'COLUMN',@level2name=N'Hinh'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mô tả chuyên đề' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChuyenDe', @level2type=N'COLUMN',@level2name=N'MoTa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã học viên, PK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HocVien', @level2type=N'COLUMN',@level2name=N'MaHV'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã khóa học, FK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HocVien', @level2type=N'COLUMN',@level2name=N'MaKH'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã người học, FK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HocVien', @level2type=N'COLUMN',@level2name=N'MaNH'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Điểm' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HocVien', @level2type=N'COLUMN',@level2name=N'Diem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã khách hàng, PK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KhoaHoc', @level2type=N'COLUMN',@level2name=N'MaKH'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã chuyên đề, FK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KhoaHoc', @level2type=N'COLUMN',@level2name=N'MaCD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Học phí' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KhoaHoc', @level2type=N'COLUMN',@level2name=N'HocPhi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Thời lượng (ngày)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KhoaHoc', @level2type=N'COLUMN',@level2name=N'ThoiLuong'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày khai giảng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KhoaHoc', @level2type=N'COLUMN',@level2name=N'NgayKG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ghi chú' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KhoaHoc', @level2type=N'COLUMN',@level2name=N'GhiChu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã người tạo, FK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KhoaHoc', @level2type=N'COLUMN',@level2name=N'MaNV'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày tạo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KhoaHoc', @level2type=N'COLUMN',@level2name=N'NgayTao'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã người học, PK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NguoiHoc', @level2type=N'COLUMN',@level2name=N'MaNH'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Họ và tên' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NguoiHoc', @level2type=N'COLUMN',@level2name=N'HoTen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày sinh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NguoiHoc', @level2type=N'COLUMN',@level2name=N'NgaySinh'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Giới tính' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NguoiHoc', @level2type=N'COLUMN',@level2name=N'GioiTinh'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Điện thoại' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NguoiHoc', @level2type=N'COLUMN',@level2name=N'DienThoai'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Địa chỉ email' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NguoiHoc', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ghi chú' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NguoiHoc', @level2type=N'COLUMN',@level2name=N'GhiChu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã người tạo, FK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NguoiHoc', @level2type=N'COLUMN',@level2name=N'MaNV'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày tạo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NguoiHoc', @level2type=N'COLUMN',@level2name=N'NgayDK'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã nhân viên, PK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NhanVien', @level2type=N'COLUMN',@level2name=N'MaNV'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mật khẩu' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NhanVien', @level2type=N'COLUMN',@level2name=N'MatKhau'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Họ và tên' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NhanVien', @level2type=N'COLUMN',@level2name=N'HoTen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Vai trò, 1-trưởng phòng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NhanVien', @level2type=N'COLUMN',@level2name=N'VaiTro'
GO
USE [master]
GO
ALTER DATABASE [EduSys] SET  READ_WRITE 
GO
