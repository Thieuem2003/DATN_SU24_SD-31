USE [master]
GO
/****** Object:  Database [ShopGiay]    Script Date: 8/7/2024 2:34:32 AM ******/
CREATE DATABASE [ShopGiay]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopGiay', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ShopGiay.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShopGiay_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ShopGiay_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ShopGiay] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopGiay].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopGiay] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopGiay] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopGiay] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopGiay] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopGiay] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopGiay] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ShopGiay] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopGiay] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopGiay] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopGiay] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopGiay] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopGiay] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopGiay] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopGiay] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopGiay] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShopGiay] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopGiay] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopGiay] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopGiay] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopGiay] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopGiay] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopGiay] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopGiay] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShopGiay] SET  MULTI_USER 
GO
ALTER DATABASE [ShopGiay] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopGiay] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopGiay] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopGiay] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShopGiay] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShopGiay] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ShopGiay] SET QUERY_STORE = ON
GO
ALTER DATABASE [ShopGiay] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ShopGiay]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 8/7/2024 2:34:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fullname] [nvarchar](100) NULL,
	[Phone] [varchar](15) NULL,
	[Address] [nvarchar](255) NULL,
	[CityName] [nvarchar](100) NULL,
	[DistrictName] [nvarchar](100) NULL,
	[WardName] [nvarchar](100) NULL,
	[CityId] [int] NULL,
	[DistrictId] [int] NULL,
	[WardId] [int] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[CreateBy] [varchar](30) NULL,
	[UpdateBy] [varchar](30) NULL,
	[Status] [int] NULL,
	[IdCustomer] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Background]    Script Date: 8/7/2024 2:34:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Background](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](30) NULL,
	[Url] [varchar](255) NULL,
	[Content] [nvarchar](255) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[CreateBy] [varchar](30) NULL,
	[UpdateBy] [varchar](30) NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 8/7/2024 2:34:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](30) NULL,
	[PurchaseDate] [datetime] NULL,
	[EstimatedDate] [datetime] NULL,
	[PaymentDate] [datetime] NULL,
	[DelyveryDate] [datetime] NULL,
	[TotalPrice] [money] NULL,
	[ShipPrice] [money] NULL,
	[TotalPriceLast] [money] NULL,
	[Note] [nvarchar](255) NULL,
	[PayType] [int] NULL,
	[PayStatus] [int] NULL,
	[TypeStatus] [int] NULL,
	[Status] [int] NULL,
	[CodeGHN] [varchar](30) NULL,
	[IdCoupon] [int] NULL,
	[IdAddress] [int] NULL,
	[IdCustomer] [int] NULL,
	[IdVoucher] [int] NULL,
	[IdEmployee] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillDetail]    Script Date: 8/7/2024 2:34:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UnitPrice] [money] NULL,
	[Quantity] [int] NULL,
	[IdColor] [int] NULL,
	[IdSize] [int] NULL,
	[IdOrder] [int] NULL,
	[IdProductDetail] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillHistory]    Script Date: 8/7/2024 2:34:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Note] [nvarchar](255) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[CreateBy] [varchar](30) NULL,
	[UpdateBy] [varchar](30) NULL,
	[Status] [int] NULL,
	[IdOrder] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 8/7/2024 2:34:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [nvarchar](255) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[CreateBy] [varchar](30) NULL,
	[UpdateBy] [varchar](30) NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 8/7/2024 2:34:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdCustomer] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartDetail]    Script Date: 8/7/2024 2:34:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UnitPrice] [money] NULL,
	[Quantity] [int] NULL,
	[IdColor] [int] NULL,
	[IdSize] [int] NULL,
	[IdCart] [int] NULL,
	[IdProductDetail] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 8/7/2024 2:34:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [nvarchar](255) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[CreateBy] [varchar](30) NULL,
	[UpdateBy] [varchar](30) NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Color]    Script Date: 8/7/2024 2:34:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [nvarchar](255) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[CreateBy] [varchar](30) NULL,
	[UpdateBy] [varchar](30) NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coupon]    Script Date: 8/7/2024 2:34:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupon](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](30) NULL,
	[Name] [nvarchar](100) NULL,
	[IsType] [bit] NULL,
	[Discount] [int] NULL,
	[Cash] [money] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[CreateBy] [varchar](30) NULL,
	[UpdateBy] [varchar](30) NULL,
	[Status] [int] NULL,
	[IdCustomer] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 8/7/2024 2:34:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](30) NULL,
	[Fullname] [nvarchar](100) NULL,
	[Username] [varchar](30) NULL,
	[Password] [varchar](30) NULL,
	[Image] [varchar](255) NULL,
	[Gender] [bit] NULL,
	[Phone] [varchar](15) NULL,
	[Email] [varchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[CreateBy] [varchar](30) NULL,
	[UpdateBy] [varchar](30) NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 8/7/2024 2:34:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](30) NULL,
	[Fullname] [nvarchar](100) NULL,
	[Username] [varchar](30) NULL,
	[Password] [varchar](30) NULL,
	[Image] [varchar](255) NULL,
	[Gender] [bit] NULL,
	[Phone] [varchar](15) NULL,
	[Email] [varchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[CreateBy] [varchar](30) NULL,
	[UpdateBy] [varchar](30) NULL,
	[Status] [int] NULL,
	[IdRole] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 8/7/2024 2:34:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [nvarchar](255) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[CreateBy] [varchar](30) NULL,
	[UpdateBy] [varchar](30) NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OperationHistory]    Script Date: 8/7/2024 2:34:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperationHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [nvarchar](100) NULL,
	[IdProductDetail] [int] NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 8/7/2024 2:34:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](30) NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[CreateBy] [varchar](30) NULL,
	[UpdateBy] [varchar](30) NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Voucher]    Script Date: 8/7/2024 2:34:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Voucher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdVoucher] [int] NULL,
	[IdProduct] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDetail]    Script Date: 8/7/2024 2:34:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Weight] [float] NULL,
	[Price] [money] NULL,
	[Discount] [int] NULL,
	[Description] [nvarchar](255) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[CreateBy] [varchar](30) NULL,
	[UpdateBy] [varchar](30) NULL,
	[Status] [int] NULL,
	[IdProduct] [int] NULL,
	[IdBrand] [int] NULL,
	[IdCategory] [int] NULL,
	[IdSoleType] [int] NULL,
	[DiscountDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDetail_Color_Size]    Script Date: 8/7/2024 2:34:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetail_Color_Size](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdProductDetail] [int] NULL,
	[IdColor] [int] NULL,
	[IdSize] [int] NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDetail_Material]    Script Date: 8/7/2024 2:34:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetail_Material](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdProductDetail] [int] NULL,
	[IdMaterial] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDetailHistory]    Script Date: 8/7/2024 2:34:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetailHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImageMain] [varchar](max) NULL,
	[ImageList] [varchar](max) NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateBy] [varchar](30) NULL,
	[Name] [nvarchar](100) NULL,
	[Price] [money] NULL,
	[Weight] [float] NULL,
	[Description] [nvarchar](255) NULL,
	[IdCategory] [int] NULL,
	[IdSoleType] [int] NULL,
	[IdBrand] [int] NULL,
	[IdToe] [int] NULL,
	[IdSole] [int] NULL,
	[IdShoelace] [int] NULL,
	[IdHeelcushion] [int] NULL,
	[IdDesign] [int] NULL,
	[IdMaterial] [varchar](max) NULL,
	[IdVoucher] [varchar](max) NULL,
	[IdColor_Size_Quantity] [varchar](max) NULL,
	[Discount] [int] NULL,
	[DiscountDate] [datetime] NULL,
	[SupplierName] [nvarchar](100) NULL,
	[SupplierPhone] [varchar](15) NULL,
	[SupplierAddress] [nvarchar](255) NULL,
	[SupplierAgree] [nvarchar](255) NULL,
	[IdProductDetail] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductFault]    Script Date: 8/7/2024 2:34:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductFault](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Note] [nvarchar](255) NULL,
	[IdColor] [int] NULL,
	[IdSize] [int] NULL,
	[Quantity] [int] NULL,
	[IdProductDetail] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImage]    Script Date: 8/7/2024 2:34:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Url] [nvarchar](255) NULL,
	[MainImage] [bit] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[CreateBy] [varchar](30) NULL,
	[UpdateBy] [varchar](30) NULL,
	[Status] [int] NULL,
	[IdProduct] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 8/7/2024 2:34:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Score] [int] NULL,
	[Note] [nvarchar](255) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[CreateBy] [varchar](30) NULL,
	[UpdateBy] [varchar](30) NULL,
	[Status] [int] NULL,
	[IdProductDetail] [int] NULL,
	[IdCustomer] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RatingImage]    Script Date: 8/7/2024 2:34:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RatingImage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Url] [varchar](255) NULL,
	[IdRating] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReturnExchange]    Script Date: 8/7/2024 2:34:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReturnExchange](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](30) NULL,
	[Image] [varchar](255) NULL,
	[Note] [nvarchar](255) NULL,
	[RequestDate] [datetime] NULL,
	[ProcessingDate] [datetime] NULL,
	[IsReturnExchange] [bit] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[CreateBy] [varchar](30) NULL,
	[UpdateBy] [varchar](30) NULL,
	[Status] [int] NULL,
	[IdCustomer] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReturnExchangeDetail]    Script Date: 8/7/2024 2:34:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReturnExchangeDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdReturnExchange] [int] NULL,
	[IdOrderDetail] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReturnExchangeHistory]    Script Date: 8/7/2024 2:34:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReturnExchangeHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Note] [nvarchar](255) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[CreateBy] [varchar](30) NULL,
	[UpdateBy] [varchar](30) NULL,
	[Status] [int] NULL,
	[IdReturnExchange] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 8/7/2024 2:34:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[CreateBy] [varchar](30) NULL,
	[UpdateBy] [varchar](30) NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 8/7/2024 2:34:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [nvarchar](255) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[CreateBy] [varchar](30) NULL,
	[UpdateBy] [varchar](30) NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SoleType]    Script Date: 8/7/2024 2:34:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SoleType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [nvarchar](255) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[CreateBy] [varchar](30) NULL,
	[UpdateBy] [varchar](30) NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voucher]    Script Date: 8/7/2024 2:34:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voucher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](30) NULL,
	[Name] [nvarchar](100) NULL,
	[TypeVoucher] [bit] NULL,
	[IsVoucher] [bit] NULL,
	[Discount] [int] NULL,
	[Cash] [money] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[CreateBy] [varchar](30) NULL,
	[UpdateBy] [varchar](30) NULL,
	[Status] [int] NULL,
	[Minimum] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([Id], [Fullname], [Phone], [Address], [CityName], [DistrictName], [WardName], [CityId], [DistrictId], [WardId], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdCustomer]) VALUES (1, N'Hà Rím', N'0348637918', N'Bến cá Dông Tiến', N'Thái Bình', N'Huyện Thái Thụy', N'Xã Thái Đô', 226, 1869, 260805, CAST(N'2024-08-06T19:50:43.040' AS DateTime), NULL, NULL, NULL, 0, 1)
INSERT [dbo].[Address] ([Id], [Fullname], [Phone], [Address], [CityName], [DistrictName], [WardName], [CityId], [DistrictId], [WardId], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdCustomer]) VALUES (2, N'Thieu', N'0826492642', N'Bến ca A xù', N'Lai Châu', N'Huyện Sìn Hồ', N'Xã Ma Quai', 264, 2006, 70407, CAST(N'2024-08-06T23:59:00.147' AS DateTime), NULL, NULL, NULL, 0, 2)
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
SET IDENTITY_INSERT [dbo].[Background] ON 

INSERT [dbo].[Background] ([Id], [Type], [Url], [Content], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (1, NULL, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/0bc43648-136a-460e-8b08-99a984c4d5f8?alt=media', N'Hyper Sneakers', CAST(N'2024-08-06T23:50:40.977' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[Background] ([Id], [Type], [Url], [Content], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (2, NULL, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/a6a3a6d2-e875-4d7c-9989-0bdd3c4bad18?alt=media', N'Hyper Sneakers', CAST(N'2024-08-06T23:51:08.220' AS DateTime), NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Background] OFF
GO
SET IDENTITY_INSERT [dbo].[Bill] ON 

INSERT [dbo].[Bill] ([Id], [Code], [PurchaseDate], [EstimatedDate], [PaymentDate], [DelyveryDate], [TotalPrice], [ShipPrice], [TotalPriceLast], [Note], [PayType], [PayStatus], [TypeStatus], [Status], [CodeGHN], [IdCoupon], [IdAddress], [IdCustomer], [IdVoucher], [IdEmployee]) VALUES (1, N'HD1722948696', CAST(N'2024-08-06T19:51:36.813' AS DateTime), NULL, CAST(N'2024-08-06T19:53:44.350' AS DateTime), NULL, 1690000.0000, 39951.0000, 0.0000, N'', 0, 1, 0, 3, NULL, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Bill] ([Id], [Code], [PurchaseDate], [EstimatedDate], [PaymentDate], [DelyveryDate], [TotalPrice], [ShipPrice], [TotalPriceLast], [Note], [PayType], [PayStatus], [TypeStatus], [Status], [CodeGHN], [IdCoupon], [IdAddress], [IdCustomer], [IdVoucher], [IdEmployee]) VALUES (2, N'HD1722948888', CAST(N'2024-08-06T19:54:48.503' AS DateTime), NULL, CAST(N'2024-08-06T19:59:18.640' AS DateTime), CAST(N'2024-08-06T19:59:18.640' AS DateTime), 17380000.0000, 0.0000, 0.0000, N'', 0, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Bill] ([Id], [Code], [PurchaseDate], [EstimatedDate], [PaymentDate], [DelyveryDate], [TotalPrice], [ShipPrice], [TotalPriceLast], [Note], [PayType], [PayStatus], [TypeStatus], [Status], [CodeGHN], [IdCoupon], [IdAddress], [IdCustomer], [IdVoucher], [IdEmployee]) VALUES (3, N'HD1722949175', CAST(N'2024-08-06T19:59:35.997' AS DateTime), NULL, CAST(N'2024-08-06T20:00:59.377' AS DateTime), CAST(N'2024-08-06T20:00:59.377' AS DateTime), 17380000.0000, 0.0000, 0.0000, N'', 1, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[Bill] ([Id], [Code], [PurchaseDate], [EstimatedDate], [PaymentDate], [DelyveryDate], [TotalPrice], [ShipPrice], [TotalPriceLast], [Note], [PayType], [PayStatus], [TypeStatus], [Status], [CodeGHN], [IdCoupon], [IdAddress], [IdCustomer], [IdVoucher], [IdEmployee]) VALUES (4, N'HD1722960920', CAST(N'2024-08-06T23:15:20.167' AS DateTime), NULL, CAST(N'2024-08-06T23:16:10.880' AS DateTime), NULL, 1390000.0000, 38451.0000, 0.0000, N'', 0, 1, 0, 3, NULL, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Bill] ([Id], [Code], [PurchaseDate], [EstimatedDate], [PaymentDate], [DelyveryDate], [TotalPrice], [ShipPrice], [TotalPriceLast], [Note], [PayType], [PayStatus], [TypeStatus], [Status], [CodeGHN], [IdCoupon], [IdAddress], [IdCustomer], [IdVoucher], [IdEmployee]) VALUES (5, N'HD1722962821', CAST(N'2024-08-06T23:47:01.253' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[Bill] ([Id], [Code], [PurchaseDate], [EstimatedDate], [PaymentDate], [DelyveryDate], [TotalPrice], [ShipPrice], [TotalPriceLast], [Note], [PayType], [PayStatus], [TypeStatus], [Status], [CodeGHN], [IdCoupon], [IdAddress], [IdCustomer], [IdVoucher], [IdEmployee]) VALUES (6, N'HD1722963298', CAST(N'2024-08-06T23:54:58.893' AS DateTime), NULL, CAST(N'2024-08-06T23:55:25.700' AS DateTime), NULL, 4263000.0000, 52816.0000, 0.0000, N'', 1, 1, 0, 0, NULL, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Bill] ([Id], [Code], [PurchaseDate], [EstimatedDate], [PaymentDate], [DelyveryDate], [TotalPrice], [ShipPrice], [TotalPriceLast], [Note], [PayType], [PayStatus], [TypeStatus], [Status], [CodeGHN], [IdCoupon], [IdAddress], [IdCustomer], [IdVoucher], [IdEmployee]) VALUES (7, N'HD1722963563', CAST(N'2024-08-06T23:59:23.420' AS DateTime), NULL, CAST(N'2024-08-06T23:59:51.033' AS DateTime), NULL, 8690000.0000, 79950.0000, 0.0000, N'', 1, 1, 0, 4, NULL, 0, 2, 2, NULL, NULL)
INSERT [dbo].[Bill] ([Id], [Code], [PurchaseDate], [EstimatedDate], [PaymentDate], [DelyveryDate], [TotalPrice], [ShipPrice], [TotalPriceLast], [Note], [PayType], [PayStatus], [TypeStatus], [Status], [CodeGHN], [IdCoupon], [IdAddress], [IdCustomer], [IdVoucher], [IdEmployee]) VALUES (8, N'HD1722963748', CAST(N'2024-08-07T00:02:28.977' AS DateTime), NULL, NULL, NULL, 1390000.0000, 43450.0000, 50000.0000, N'', 0, 0, 0, 4, NULL, 0, 2, 2, NULL, NULL)
INSERT [dbo].[Bill] ([Id], [Code], [PurchaseDate], [EstimatedDate], [PaymentDate], [DelyveryDate], [TotalPrice], [ShipPrice], [TotalPriceLast], [Note], [PayType], [PayStatus], [TypeStatus], [Status], [CodeGHN], [IdCoupon], [IdAddress], [IdCustomer], [IdVoucher], [IdEmployee]) VALUES (9, N'HD1722963918', CAST(N'2024-08-07T00:05:18.447' AS DateTime), NULL, NULL, NULL, 4690000.0000, 59950.0000, 50000.0000, N'', 0, 0, 0, 0, NULL, 0, 2, 2, NULL, NULL)
INSERT [dbo].[Bill] ([Id], [Code], [PurchaseDate], [EstimatedDate], [PaymentDate], [DelyveryDate], [TotalPrice], [ShipPrice], [TotalPriceLast], [Note], [PayType], [PayStatus], [TypeStatus], [Status], [CodeGHN], [IdCoupon], [IdAddress], [IdCustomer], [IdVoucher], [IdEmployee]) VALUES (10, N'HD1722964045', CAST(N'2024-08-07T00:07:25.807' AS DateTime), NULL, NULL, NULL, 1390000.0000, 43450.0000, 0.0000, N'', 0, 0, 0, 0, NULL, 0, 2, 2, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Bill] OFF
GO
SET IDENTITY_INSERT [dbo].[BillDetail] ON 

INSERT [dbo].[BillDetail] ([Id], [UnitPrice], [Quantity], [IdColor], [IdSize], [IdOrder], [IdProductDetail]) VALUES (1, 1690000.0000, 1, 5, 12, 1, 5)
INSERT [dbo].[BillDetail] ([Id], [UnitPrice], [Quantity], [IdColor], [IdSize], [IdOrder], [IdProductDetail]) VALUES (2, 8690000.0000, 2, 6, 10, 2, 6)
INSERT [dbo].[BillDetail] ([Id], [UnitPrice], [Quantity], [IdColor], [IdSize], [IdOrder], [IdProductDetail]) VALUES (3, 8690000.0000, 2, 6, 11, 3, 6)
INSERT [dbo].[BillDetail] ([Id], [UnitPrice], [Quantity], [IdColor], [IdSize], [IdOrder], [IdProductDetail]) VALUES (4, 1390000.0000, 1, 3, 8, 4, 7)
INSERT [dbo].[BillDetail] ([Id], [UnitPrice], [Quantity], [IdColor], [IdSize], [IdOrder], [IdProductDetail]) VALUES (5, 6090000.0000, 2, 9, 22, 5, 14)
INSERT [dbo].[BillDetail] ([Id], [UnitPrice], [Quantity], [IdColor], [IdSize], [IdOrder], [IdProductDetail]) VALUES (6, 4263000.0000, 1, 9, 12, 6, 14)
INSERT [dbo].[BillDetail] ([Id], [UnitPrice], [Quantity], [IdColor], [IdSize], [IdOrder], [IdProductDetail]) VALUES (7, 8690000.0000, 1, 6, 11, 7, 6)
INSERT [dbo].[BillDetail] ([Id], [UnitPrice], [Quantity], [IdColor], [IdSize], [IdOrder], [IdProductDetail]) VALUES (8, 1390000.0000, 1, 3, 11, 8, 7)
INSERT [dbo].[BillDetail] ([Id], [UnitPrice], [Quantity], [IdColor], [IdSize], [IdOrder], [IdProductDetail]) VALUES (9, 4690000.0000, 1, 5, 4, 9, 9)
INSERT [dbo].[BillDetail] ([Id], [UnitPrice], [Quantity], [IdColor], [IdSize], [IdOrder], [IdProductDetail]) VALUES (10, 1390000.0000, 1, 3, 8, 10, 7)
SET IDENTITY_INSERT [dbo].[BillDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[BillHistory] ON 

INSERT [dbo].[BillHistory] ([Id], [Note], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdOrder]) VALUES (1, NULL, CAST(N'2024-08-06T19:51:36.830' AS DateTime), NULL, NULL, NULL, 0, 1)
INSERT [dbo].[BillHistory] ([Id], [Note], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdOrder]) VALUES (2, N'Xác nhận đơn', CAST(N'2024-08-06T19:52:30.150' AS DateTime), NULL, N'sa', NULL, 1, 1)
INSERT [dbo].[BillHistory] ([Id], [Note], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdOrder]) VALUES (3, N'Đang giao', CAST(N'2024-08-06T19:53:25.223' AS DateTime), NULL, N'sa', NULL, 2, 1)
INSERT [dbo].[BillHistory] ([Id], [Note], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdOrder]) VALUES (4, N'Xác nhận đã thanh toán', CAST(N'2024-08-06T19:53:44.343' AS DateTime), NULL, N'sa', NULL, 10, 1)
INSERT [dbo].[BillHistory] ([Id], [Note], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdOrder]) VALUES (5, N'Đã giao hàng', CAST(N'2024-08-06T19:54:00.997' AS DateTime), NULL, N'sa', NULL, 3, 1)
INSERT [dbo].[BillHistory] ([Id], [Note], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdOrder]) VALUES (6, N'Tạo hóa đơn tại quầy', CAST(N'2024-08-06T19:54:48.520' AS DateTime), NULL, N'sa', NULL, 0, 2)
INSERT [dbo].[BillHistory] ([Id], [Note], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdOrder]) VALUES (7, N'Đã giao hàng tại quầy', CAST(N'2024-08-06T19:55:37.197' AS DateTime), NULL, N'', NULL, 3, 2)
INSERT [dbo].[BillHistory] ([Id], [Note], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdOrder]) VALUES (8, N'Đã giao hàng tại quầy', CAST(N'2024-08-06T19:59:18.687' AS DateTime), NULL, N'guantoron', NULL, 3, 2)
INSERT [dbo].[BillHistory] ([Id], [Note], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdOrder]) VALUES (9, N'Tạo hóa đơn tại quầy', CAST(N'2024-08-06T19:59:36.013' AS DateTime), NULL, N'guantoron', NULL, 0, 3)
INSERT [dbo].[BillHistory] ([Id], [Note], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdOrder]) VALUES (10, N'Đã giao hàng tại quầy', CAST(N'2024-08-06T19:59:59.800' AS DateTime), NULL, N'', NULL, 3, 3)
INSERT [dbo].[BillHistory] ([Id], [Note], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdOrder]) VALUES (11, N'Đã giao hàng tại quầy', CAST(N'2024-08-06T20:00:29.977' AS DateTime), NULL, N'', NULL, 3, 3)
INSERT [dbo].[BillHistory] ([Id], [Note], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdOrder]) VALUES (12, NULL, CAST(N'2024-08-06T23:15:20.183' AS DateTime), NULL, NULL, NULL, 0, 4)
INSERT [dbo].[BillHistory] ([Id], [Note], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdOrder]) VALUES (13, N'Xac nhan', CAST(N'2024-08-06T23:15:54.130' AS DateTime), NULL, N'guantoron', NULL, 1, 4)
INSERT [dbo].[BillHistory] ([Id], [Note], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdOrder]) VALUES (14, N'Xac nhan', CAST(N'2024-08-06T23:16:04.700' AS DateTime), NULL, N'guantoron', NULL, 2, 4)
INSERT [dbo].[BillHistory] ([Id], [Note], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdOrder]) VALUES (15, N'Xác nhận đã thanh toán', CAST(N'2024-08-06T23:16:10.870' AS DateTime), NULL, N'guantoron', NULL, 10, 4)
INSERT [dbo].[BillHistory] ([Id], [Note], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdOrder]) VALUES (16, N'Xac nhan', CAST(N'2024-08-06T23:16:17.700' AS DateTime), NULL, N'guantoron', NULL, 3, 4)
INSERT [dbo].[BillHistory] ([Id], [Note], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdOrder]) VALUES (17, N'Tạo hóa đơn tại quầy', CAST(N'2024-08-06T23:47:01.283' AS DateTime), NULL, N'guantoron', NULL, 0, 5)
INSERT [dbo].[BillHistory] ([Id], [Note], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdOrder]) VALUES (18, NULL, CAST(N'2024-08-06T23:54:58.910' AS DateTime), NULL, NULL, NULL, 0, 6)
INSERT [dbo].[BillHistory] ([Id], [Note], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdOrder]) VALUES (19, NULL, CAST(N'2024-08-06T23:59:23.433' AS DateTime), NULL, NULL, NULL, 0, 7)
INSERT [dbo].[BillHistory] ([Id], [Note], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdOrder]) VALUES (20, N'ok', CAST(N'2024-08-07T00:01:06.033' AS DateTime), NULL, N'guantoron', NULL, 1, 7)
INSERT [dbo].[BillHistory] ([Id], [Note], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdOrder]) VALUES (21, N'ok', CAST(N'2024-08-07T00:01:17.027' AS DateTime), NULL, N'guantoron', NULL, 4, 7)
INSERT [dbo].[BillHistory] ([Id], [Note], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdOrder]) VALUES (22, NULL, CAST(N'2024-08-07T00:02:28.997' AS DateTime), NULL, NULL, NULL, 0, 8)
INSERT [dbo].[BillHistory] ([Id], [Note], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdOrder]) VALUES (23, N'Hủy đơn', CAST(N'2024-08-07T00:04:07.750' AS DateTime), NULL, NULL, NULL, 4, 8)
INSERT [dbo].[BillHistory] ([Id], [Note], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdOrder]) VALUES (24, NULL, CAST(N'2024-08-07T00:05:18.460' AS DateTime), NULL, NULL, NULL, 0, 9)
INSERT [dbo].[BillHistory] ([Id], [Note], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdOrder]) VALUES (25, NULL, CAST(N'2024-08-07T00:07:25.823' AS DateTime), NULL, NULL, NULL, 0, 10)
SET IDENTITY_INSERT [dbo].[BillHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (1, N'Nike', NULL, CAST(N'2024-08-06T18:53:40.190' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[Brand] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (2, N'Converse', NULL, CAST(N'2024-08-06T19:31:55.937' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[Brand] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (3, N'Adidas', NULL, CAST(N'2024-08-06T20:11:15.807' AS DateTime), NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([Id], [IdCustomer]) VALUES (1, 1)
INSERT [dbo].[Cart] ([Id], [IdCustomer]) VALUES (2, 2)
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (1, N'Man', NULL, CAST(N'2024-08-06T18:52:59.713' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[Category] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (2, N'Jordan', NULL, CAST(N'2024-08-06T19:14:56.143' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[Category] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (3, N'Chuck 1970s', NULL, CAST(N'2024-08-06T19:31:44.070' AS DateTime), CAST(N'2024-08-06T19:33:25.887' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Category] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (4, N'All Star', N'', CAST(N'2024-08-06T19:33:47.347' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[Category] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (5, N'Run Star Hike', N'', CAST(N'2024-08-06T19:34:02.430' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[Category] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (6, N'Run Star Motion', N'', CAST(N'2024-08-06T19:34:17.840' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[Category] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (7, N'Giày Bóng Rổ', N'', CAST(N'2024-08-06T20:09:47.443' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[Category] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (8, N'Giày Chạy', N'', CAST(N'2024-08-06T20:09:57.497' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[Category] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (9, N'Giày Tập', N'', CAST(N'2024-08-06T20:10:04.873' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[Category] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (10, N'Giày Trượt Ván', N'', CAST(N'2024-08-06T20:10:25.847' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[Category] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (11, N'UltraBoost', NULL, CAST(N'2024-08-06T20:16:31.317' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[Category] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (12, N'Air Force 1', NULL, CAST(N'2024-08-06T20:20:08.417' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[Category] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (13, N'React', NULL, CAST(N'2024-08-06T20:27:06.460' AS DateTime), NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Color] ON 

INSERT [dbo].[Color] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (1, N'Bred(Đen đỏ)', NULL, CAST(N'2024-08-06T18:54:38.677' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[Color] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (2, N'Dior Grey(Trắng Xám)', NULL, CAST(N'2024-08-06T19:01:16.783' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[Color] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (3, N'Trắng Đen', NULL, CAST(N'2024-08-06T19:18:14.043' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[Color] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (4, N'Trắng Xám', NULL, CAST(N'2024-08-06T19:23:54.780' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[Color] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (5, N'Trắng ngà', NULL, CAST(N'2024-08-06T19:32:44.247' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[Color] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (6, N'Hamilton Brown', NULL, CAST(N'2024-08-06T19:38:43.640' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[Color] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (7, N'Đen', NULL, CAST(N'2024-08-06T20:27:23.577' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[Color] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (8, N'Xám', NULL, CAST(N'2024-08-06T21:01:25.880' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[Color] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (9, N'Hong Do', NULL, CAST(N'2024-08-06T23:19:15.580' AS DateTime), NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Color] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Id], [Code], [Fullname], [Username], [Password], [Image], [Gender], [Phone], [Email], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (1, N'KH1722948541', N'Xuan Truong', N'truong', N'ShuanToron31947', NULL, NULL, NULL, N'xtruongtdo2003@gmail.com', CAST(N'2024-08-06T19:49:01.793' AS DateTime), CAST(N'2024-08-06T23:52:43.450' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Customer] ([Id], [Code], [Fullname], [Username], [Password], [Image], [Gender], [Phone], [Email], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (2, N'KH1722963478', N'thieu', N'thieu', N'Truong2003', NULL, NULL, NULL, N'congthieu1606@gmail.com', CAST(N'2024-08-06T23:57:58.750' AS DateTime), NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [Code], [Fullname], [Username], [Password], [Image], [Gender], [Phone], [Email], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdRole]) VALUES (1, N'EMP001', N'John Doe', N'sa', N'231003', NULL, 1, N'123456789', N'johndoe@example.com', CAST(N'2023-11-02T08:00:00.000' AS DateTime), CAST(N'2023-11-02T08:00:00.000' AS DateTime), N'Admin', N'Admin', 0, 1)
INSERT [dbo].[Employee] ([Id], [Code], [Fullname], [Username], [Password], [Image], [Gender], [Phone], [Email], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdRole]) VALUES (2, N'NV02', N'Xuan Truong', N'guantoron', N'123', N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/e152862e-75fa-45f0-b518-0c01eef86321?alt=media', 1, N'0348637918', N'abc@gmail.com', NULL, NULL, NULL, NULL, 0, 1)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Material] ON 

INSERT [dbo].[Material] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (1, N'Da', NULL, CAST(N'2024-08-06T18:53:54.237' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[Material] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (2, N'Vải', NULL, CAST(N'2024-08-06T18:53:59.650' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[Material] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (3, N'Carbon giả', NULL, CAST(N'2024-08-06T19:16:14.147' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[Material] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (4, N'Cao su', NULL, CAST(N'2024-08-06T19:32:21.153' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[Material] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (5, N'Vải Lưới', NULL, CAST(N'2024-08-06T20:13:35.277' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[Material] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (6, N'Lưới', NULL, CAST(N'2024-08-06T21:00:18.277' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[Material] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (7, N'Da tổng hợp', NULL, CAST(N'2024-08-06T21:00:28.607' AS DateTime), NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Material] OFF
GO
SET IDENTITY_INSERT [dbo].[OperationHistory] ON 

INSERT [dbo].[OperationHistory] ([Id], [CreateDate], [CreateBy], [IdProductDetail], [Status]) VALUES (1, CAST(N'2024-08-06T18:57:50.593' AS DateTime), N'sa', 1, 1)
INSERT [dbo].[OperationHistory] ([Id], [CreateDate], [CreateBy], [IdProductDetail], [Status]) VALUES (2, CAST(N'2024-08-06T18:59:05.253' AS DateTime), N'sa', 1, 2)
INSERT [dbo].[OperationHistory] ([Id], [CreateDate], [CreateBy], [IdProductDetail], [Status]) VALUES (3, CAST(N'2024-08-06T19:13:40.027' AS DateTime), N'sa', 2, 1)
INSERT [dbo].[OperationHistory] ([Id], [CreateDate], [CreateBy], [IdProductDetail], [Status]) VALUES (4, CAST(N'2024-08-06T19:14:20.690' AS DateTime), N'sa', 2, 2)
INSERT [dbo].[OperationHistory] ([Id], [CreateDate], [CreateBy], [IdProductDetail], [Status]) VALUES (5, CAST(N'2024-08-06T19:19:00.410' AS DateTime), N'sa', 3, 1)
INSERT [dbo].[OperationHistory] ([Id], [CreateDate], [CreateBy], [IdProductDetail], [Status]) VALUES (6, CAST(N'2024-08-06T19:20:29.910' AS DateTime), N'sa', 3, 2)
INSERT [dbo].[OperationHistory] ([Id], [CreateDate], [CreateBy], [IdProductDetail], [Status]) VALUES (7, CAST(N'2024-08-06T19:20:46.100' AS DateTime), N'sa', 2, 2)
INSERT [dbo].[OperationHistory] ([Id], [CreateDate], [CreateBy], [IdProductDetail], [Status]) VALUES (8, CAST(N'2024-08-06T19:20:59.063' AS DateTime), N'sa', 1, 2)
INSERT [dbo].[OperationHistory] ([Id], [CreateDate], [CreateBy], [IdProductDetail], [Status]) VALUES (9, CAST(N'2024-08-06T19:27:07.223' AS DateTime), N'sa', 4, 1)
INSERT [dbo].[OperationHistory] ([Id], [CreateDate], [CreateBy], [IdProductDetail], [Status]) VALUES (10, CAST(N'2024-08-06T19:37:29.513' AS DateTime), N'sa', 5, 1)
INSERT [dbo].[OperationHistory] ([Id], [CreateDate], [CreateBy], [IdProductDetail], [Status]) VALUES (11, CAST(N'2024-08-06T19:41:16.130' AS DateTime), N'sa', 6, 1)
INSERT [dbo].[OperationHistory] ([Id], [CreateDate], [CreateBy], [IdProductDetail], [Status]) VALUES (12, CAST(N'2024-08-06T20:15:03.547' AS DateTime), N'guantoron', 7, 1)
INSERT [dbo].[OperationHistory] ([Id], [CreateDate], [CreateBy], [IdProductDetail], [Status]) VALUES (13, CAST(N'2024-08-06T20:19:09.673' AS DateTime), N'guantoron', 8, 1)
INSERT [dbo].[OperationHistory] ([Id], [CreateDate], [CreateBy], [IdProductDetail], [Status]) VALUES (14, CAST(N'2024-08-06T20:23:21.547' AS DateTime), N'guantoron', 9, 1)
INSERT [dbo].[OperationHistory] ([Id], [CreateDate], [CreateBy], [IdProductDetail], [Status]) VALUES (15, CAST(N'2024-08-06T20:28:08.647' AS DateTime), N'guantoron', 10, 1)
INSERT [dbo].[OperationHistory] ([Id], [CreateDate], [CreateBy], [IdProductDetail], [Status]) VALUES (16, CAST(N'2024-08-06T20:31:31.867' AS DateTime), N'guantoron', 11, 1)
INSERT [dbo].[OperationHistory] ([Id], [CreateDate], [CreateBy], [IdProductDetail], [Status]) VALUES (17, CAST(N'2024-08-06T20:53:23.367' AS DateTime), N'guantoron', 12, 1)
INSERT [dbo].[OperationHistory] ([Id], [CreateDate], [CreateBy], [IdProductDetail], [Status]) VALUES (18, CAST(N'2024-08-06T21:03:03.580' AS DateTime), N'guantoron', 13, 1)
INSERT [dbo].[OperationHistory] ([Id], [CreateDate], [CreateBy], [IdProductDetail], [Status]) VALUES (19, CAST(N'2024-08-06T21:50:08.510' AS DateTime), N'guantoron', 13, 2)
INSERT [dbo].[OperationHistory] ([Id], [CreateDate], [CreateBy], [IdProductDetail], [Status]) VALUES (20, CAST(N'2024-08-06T21:50:19.223' AS DateTime), N'guantoron', 12, 2)
INSERT [dbo].[OperationHistory] ([Id], [CreateDate], [CreateBy], [IdProductDetail], [Status]) VALUES (21, CAST(N'2024-08-06T21:50:28.917' AS DateTime), N'guantoron', 11, 2)
INSERT [dbo].[OperationHistory] ([Id], [CreateDate], [CreateBy], [IdProductDetail], [Status]) VALUES (22, CAST(N'2024-08-06T21:50:39.697' AS DateTime), N'guantoron', 10, 2)
INSERT [dbo].[OperationHistory] ([Id], [CreateDate], [CreateBy], [IdProductDetail], [Status]) VALUES (23, CAST(N'2024-08-06T21:51:00.787' AS DateTime), N'guantoron', 5, 2)
INSERT [dbo].[OperationHistory] ([Id], [CreateDate], [CreateBy], [IdProductDetail], [Status]) VALUES (24, CAST(N'2024-08-06T21:51:20.673' AS DateTime), N'guantoron', 1, 2)
INSERT [dbo].[OperationHistory] ([Id], [CreateDate], [CreateBy], [IdProductDetail], [Status]) VALUES (25, CAST(N'2024-08-06T23:24:38.970' AS DateTime), N'guantoron', 14, 1)
SET IDENTITY_INSERT [dbo].[OperationHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Code], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (1, N'SP1722945470', N'Nike Air Jordan 4 Retro', N'Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4.', CAST(N'2024-08-06T18:57:50.527' AS DateTime), CAST(N'2024-08-06T21:51:20.703' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (2, N'SP1722946419', N'Dior x Air Jordan 1 High', N'Dior x Air Jordan 1 High chắc chắn là một trong những bản collab sneaker hot nhất trong cả thập kỷ, hình bóng một đôi Air Jordan chưa bao giờ thực sự bùng nổ như thế này trước đây, và đã đến lúc để mọi người phải trầm trồ', CAST(N'2024-08-06T19:13:39.977' AS DateTime), CAST(N'2024-08-06T19:20:46.100' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (3, N'SP1722946740', N'Air Jordan 1 Mid SE ‘All Star 2021', N'Air Jordan Mid SE GS ‘All Star 2021’ ra mắt kỷ niệm mùa giải của NBA với một thiết kế mới độc đáo.', CAST(N'2024-08-06T19:19:00.367' AS DateTime), CAST(N'2024-08-06T19:20:29.923' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (4, N'SP1722947227', N'Air Jordan 1 Low Triple', N'Air Jordan 1 Low Triple White là một phiên bản mới hoàn toàn mới của hình bóng AJ1 huyền thoại đã được nhiều thế hệ sneakerhead khác nhau yêu thích.', CAST(N'2024-08-06T19:27:07.170' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (5, N'SP1722947849', N'Converse Chuck Taylor All Star High Top', N'Giày Converse Chuck Taylor All Star High Top ‘Traveler’ hứa hẹn là một siêu phẩm mà bất cứ sneakerhead nào cũng mong muốn sở hữu trong tủ giày của mình.', CAST(N'2024-08-06T19:37:29.463' AS DateTime), CAST(N'2024-08-06T21:51:00.803' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (6, N'SP1722948076', N'Converse Carhartt WIP x Chuck 70 High', N'Converse Carhartt WIP x Chuck 70 High ‘Hamilton Brown’ là một đôi giày thể thao tuyệt vời, mang lại sự thoải mái, phong cách và thời trang cho người dùng.', CAST(N'2024-08-06T19:41:16.083' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (7, N'SP1722950103', N'Adidas Pro Bounce 2018', N'Giày bóng rổ Adidas Pro Bounce 2018 ‘White Black’ là một đôi giày được thiết kế cho các cầu thủ bóng rổ đang tìm kiếm sự thoải mái, hiệu suất và phong cách.', CAST(N'2024-08-06T20:15:03.473' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (8, N'SP1722950349', N'Adidas UltraBoost 4.0', N'Adidas Ultra Boost 4.0 White đã được đồn đại trong một thời gian khá dài với bản phát hành dự kiến ​​vào tháng 12 hoặc đầu năm 2018. Rất may vì ở thời điểm hiện tại, bạn không cần không cần phải chờ đợi lâu cho phiên bản sneaker êm ái này', CAST(N'2024-08-06T20:19:09.630' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (9, N'SP1722950601', N'Nike Air Force 1 ID ‘Gucci’', N'Nike Air Force 1 ID ‘Gucci’ hiện đã có sẵn tại Hyper Sneakers, đừng bỏ lỡ cơ hội của mình nhé!', CAST(N'2024-08-06T20:23:21.503' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (10, N'SP1722950888', N'Nike React Infinity Run Flyknit 2', N'Nike React Infinity Run Flyknit 2 ‘Black’ hiện đã có sẵn tại Hyper Sneaker, đừng bỏ lỡ cơ hội của mình nhé!', CAST(N'2024-08-06T20:28:08.600' AS DateTime), CAST(N'2024-08-06T21:50:39.713' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (11, N'SP1722951091', N'Nike ReactX Infinity 4', N'Nike ReactX Infinity 4 là một phiên bản giày chạy bộ trong dòng ReactX Infinity, với thiết kế màu “Black White” (đen trắng), tạo nên vẻ ngoại hình đơn giản và phong cách thể thao.', CAST(N'2024-08-06T20:31:31.820' AS DateTime), CAST(N'2024-08-06T21:50:28.930' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (12, N'SP1722952403', N'Nike ReactX Infinity 4', N'Nike ReactX Infinity 4 ‘Black Racer Blue’ DR2665-005 là một đôi giày chạy tuyệt vời, phù hợp với các runner ở mọi cấp độ. Màu sắc đen xanhRacer Blue mang đến vẻ ngoài hiện đại, cá tính, thích hợp để phối với nhiều trang phục thể thao khác nhau.', CAST(N'2024-08-06T20:53:23.317' AS DateTime), CAST(N'2024-08-06T21:50:19.233' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (13, N'SP1722952983', N'Nike P-6000', N'Nếu bạn đang tìm kiếm một đôi giày thể thao chất lượng, thoải mái và thời trang, thì giày Nike P-6000 ‘Light Iron Ore’ là một lựa chọn hoàn hảo.', CAST(N'2024-08-06T21:03:03.533' AS DateTime), CAST(N'2024-08-06T21:50:08.533' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (14, N'SP1722961478', N'Nike React Infinity Run Flyknit 2', NULL, CAST(N'2024-08-06T23:24:38.923' AS DateTime), NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductDetail] ON 

INSERT [dbo].[ProductDetail] ([Id], [Weight], [Price], [Discount], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct], [IdBrand], [IdCategory], [IdSoleType], [DiscountDate]) VALUES (1, 900, 8690000.0000, 0, N'Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4.', CAST(N'2024-08-06T18:57:50.550' AS DateTime), CAST(N'2024-08-06T21:51:20.637' AS DateTime), NULL, NULL, 0, 1, 1, 1, 1, NULL)
INSERT [dbo].[ProductDetail] ([Id], [Weight], [Price], [Discount], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct], [IdBrand], [IdCategory], [IdSoleType], [DiscountDate]) VALUES (2, 900, 23000000.0000, 0, N'Dior x Air Jordan 1 High chắc chắn là một trong những bản collab sneaker hot nhất trong cả thập kỷ, hình bóng một đôi Air Jordan chưa bao giờ thực sự bùng nổ như thế này trước đây, và đã đến lúc để mọi người phải trầm trồ', CAST(N'2024-08-06T19:13:39.997' AS DateTime), CAST(N'2024-08-06T19:20:46.077' AS DateTime), NULL, NULL, 0, 2, 1, 1, 2, NULL)
INSERT [dbo].[ProductDetail] ([Id], [Weight], [Price], [Discount], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct], [IdBrand], [IdCategory], [IdSoleType], [DiscountDate]) VALUES (3, 900, 10790000.0000, 3, N'Air Jordan Mid SE GS ‘All Star 2021’ ra mắt kỷ niệm mùa giải của NBA với một thiết kế mới độc đáo.', CAST(N'2024-08-06T19:19:00.387' AS DateTime), CAST(N'2024-08-06T19:20:29.883' AS DateTime), NULL, NULL, 0, 3, 1, 2, 2, NULL)
INSERT [dbo].[ProductDetail] ([Id], [Weight], [Price], [Discount], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct], [IdBrand], [IdCategory], [IdSoleType], [DiscountDate]) VALUES (4, 900, 4690000.0000, 5, N'Air Jordan 1 Low Triple White là một phiên bản mới hoàn toàn mới của hình bóng AJ1 huyền thoại đã được nhiều thế hệ sneakerhead khác nhau yêu thích.', CAST(N'2024-08-06T19:27:07.193' AS DateTime), NULL, NULL, NULL, 0, 4, 1, 2, 2, NULL)
INSERT [dbo].[ProductDetail] ([Id], [Weight], [Price], [Discount], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct], [IdBrand], [IdCategory], [IdSoleType], [DiscountDate]) VALUES (5, 900, 1690000.0000, 0, N'Giày Converse Chuck Taylor All Star High Top ‘Traveler’ hứa hẹn là một siêu phẩm mà bất cứ sneakerhead nào cũng mong muốn sở hữu trong tủ giày của mình.', CAST(N'2024-08-06T19:37:29.487' AS DateTime), CAST(N'2024-08-06T21:51:00.753' AS DateTime), NULL, NULL, 0, 5, 2, 4, 2, NULL)
INSERT [dbo].[ProductDetail] ([Id], [Weight], [Price], [Discount], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct], [IdBrand], [IdCategory], [IdSoleType], [DiscountDate]) VALUES (6, 900, 8690000.0000, 0, N'Converse Carhartt WIP x Chuck 70 High ‘Hamilton Brown’ là một đôi giày thể thao tuyệt vời, mang lại sự thoải mái, phong cách và thời trang cho người dùng.', CAST(N'2024-08-06T19:41:16.103' AS DateTime), NULL, NULL, NULL, 0, 6, 2, 3, 2, NULL)
INSERT [dbo].[ProductDetail] ([Id], [Weight], [Price], [Discount], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct], [IdBrand], [IdCategory], [IdSoleType], [DiscountDate]) VALUES (7, 980, 1390000.0000, 0, N'Giày bóng rổ Adidas Pro Bounce 2018 ‘White Black’ là một đôi giày được thiết kế cho các cầu thủ bóng rổ đang tìm kiếm sự thoải mái, hiệu suất và phong cách.', CAST(N'2024-08-06T20:15:03.493' AS DateTime), NULL, NULL, NULL, 0, 7, 3, 7, 3, NULL)
INSERT [dbo].[ProductDetail] ([Id], [Weight], [Price], [Discount], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct], [IdBrand], [IdCategory], [IdSoleType], [DiscountDate]) VALUES (8, 970, 5090000.0000, 13, N'Adidas Ultra Boost 4.0 White đã được đồn đại trong một thời gian khá dài với bản phát hành dự kiến ​​vào tháng 12 hoặc đầu năm 2018. Rất may vì ở thời điểm hiện tại, bạn không cần không cần phải chờ đợi lâu cho phiên bản sneaker êm ái này', CAST(N'2024-08-06T20:19:09.650' AS DateTime), NULL, NULL, NULL, 0, 8, 3, 11, 3, NULL)
INSERT [dbo].[ProductDetail] ([Id], [Weight], [Price], [Discount], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct], [IdBrand], [IdCategory], [IdSoleType], [DiscountDate]) VALUES (9, 930, 4690000.0000, 0, N'Nike Air Force 1 ID ‘Gucci’ hiện đã có sẵn tại Hyper Sneakers, đừng bỏ lỡ cơ hội của mình nhé!', CAST(N'2024-08-06T20:23:21.523' AS DateTime), NULL, NULL, NULL, 0, 9, 1, 12, 2, NULL)
INSERT [dbo].[ProductDetail] ([Id], [Weight], [Price], [Discount], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct], [IdBrand], [IdCategory], [IdSoleType], [DiscountDate]) VALUES (10, 910, 5490000.0000, 0, N'Nike React Infinity Run Flyknit 2 ‘Black’ hiện đã có sẵn tại Hyper Sneaker, đừng bỏ lỡ cơ hội của mình nhé!', CAST(N'2024-08-06T20:28:08.620' AS DateTime), CAST(N'2024-08-06T21:50:39.667' AS DateTime), NULL, NULL, 0, 10, 1, 13, 4, NULL)
INSERT [dbo].[ProductDetail] ([Id], [Weight], [Price], [Discount], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct], [IdBrand], [IdCategory], [IdSoleType], [DiscountDate]) VALUES (11, 931, 4890000.0000, 0, N'Nike ReactX Infinity 4 là một phiên bản giày chạy bộ trong dòng ReactX Infinity, với thiết kế màu “Black White” (đen trắng), tạo nên vẻ ngoại hình đơn giản và phong cách thể thao.', CAST(N'2024-08-06T20:31:31.840' AS DateTime), CAST(N'2024-08-06T21:50:28.880' AS DateTime), NULL, NULL, 0, 11, 1, 13, 4, NULL)
INSERT [dbo].[ProductDetail] ([Id], [Weight], [Price], [Discount], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct], [IdBrand], [IdCategory], [IdSoleType], [DiscountDate]) VALUES (12, 980, 3490000.0000, 0, N'Nike ReactX Infinity 4 ‘Black Racer Blue’ DR2665-005 là một đôi giày chạy tuyệt vời, phù hợp với các runner ở mọi cấp độ. Màu sắc đen xanhRacer Blue mang đến vẻ ngoài hiện đại, cá tính, thích hợp để phối với nhiều trang phục thể thao khác nhau.', CAST(N'2024-08-06T20:53:23.330' AS DateTime), CAST(N'2024-08-06T21:50:19.203' AS DateTime), NULL, NULL, 0, 12, 1, 13, 4, NULL)
INSERT [dbo].[ProductDetail] ([Id], [Weight], [Price], [Discount], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct], [IdBrand], [IdCategory], [IdSoleType], [DiscountDate]) VALUES (13, 892, 3890000.0000, 0, N'Nếu bạn đang tìm kiếm một đôi giày thể thao chất lượng, thoải mái và thời trang, thì giày Nike P-6000 ‘Light Iron Ore’ là một lựa chọn hoàn hảo.', CAST(N'2024-08-06T21:03:03.550' AS DateTime), CAST(N'2024-08-06T21:50:08.420' AS DateTime), NULL, NULL, 0, 13, 1, 13, 3, NULL)
INSERT [dbo].[ProductDetail] ([Id], [Weight], [Price], [Discount], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct], [IdBrand], [IdCategory], [IdSoleType], [DiscountDate]) VALUES (14, 720, 6090000.0000, 30, NULL, CAST(N'2024-08-06T23:24:38.940' AS DateTime), NULL, NULL, NULL, 0, 14, 1, 13, 4, NULL)
SET IDENTITY_INSERT [dbo].[ProductDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductDetail_Color_Size] ON 

INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (33, 3, 3, 4, 20)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (34, 3, 3, 2, 20)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (35, 3, 3, 6, 20)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (36, 3, 3, 8, 20)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (37, 3, 3, 10, 20)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (38, 2, 2, 14, 20)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (39, 2, 2, 16, 20)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (40, 2, 2, 18, 20)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (61, 4, 4, 3, 30)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (62, 4, 4, 5, 30)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (63, 4, 4, 8, 30)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (64, 4, 4, 6, 60)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (65, 4, 4, 9, 30)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (66, 4, 4, 2, 30)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (67, 4, 4, 4, 30)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (68, 4, 4, 10, 30)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (69, 4, 4, 11, 30)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (70, 4, 4, 12, 30)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (71, 4, 4, 13, 30)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (72, 4, 4, 14, 30)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (73, 4, 4, 15, 30)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (74, 4, 4, 16, 30)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (75, 4, 4, 18, 30)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (76, 4, 4, 17, 30)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (77, 4, 4, 19, 30)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (89, 6, 6, 10, 11)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (90, 6, 6, 11, 11)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (91, 6, 6, 12, 13)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (92, 6, 6, 13, 13)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (93, 6, 6, 14, 13)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (94, 6, 6, 16, 13)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (95, 6, 6, 15, 13)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (96, 6, 6, 17, 13)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (97, 6, 6, 18, 13)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (98, 7, 3, 8, 38)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (99, 7, 3, 10, 36)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (100, 7, 3, 11, 36)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (101, 7, 3, 13, 36)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (102, 7, 3, 12, 36)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (103, 7, 3, 9, 40)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (104, 7, 3, 15, 20)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (105, 7, 3, 16, 23)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (106, 7, 3, 17, 25)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (107, 7, 3, 18, 11)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (108, 7, 3, 14, 20)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (109, 8, 5, 1, 43)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (110, 8, 4, 5, 43)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (111, 8, 5, 3, 23)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (112, 8, 4, 10, 23)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (113, 9, 5, 4, 8)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (114, 9, 5, 5, 24)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (115, 9, 5, 3, 27)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (116, 9, 5, 1, 13)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (117, 9, 5, 2, 50)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (118, 9, 5, 6, 30)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (160, 13, 8, 22, 8)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (161, 13, 8, 21, 25)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (162, 13, 8, 3, 12)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (163, 13, 8, 4, 12)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (164, 13, 8, 2, 12)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (165, 13, 8, 5, 12)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (166, 13, 8, 6, 12)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (167, 13, 8, 7, 12)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (168, 13, 8, 8, 12)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (169, 13, 8, 9, 12)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (170, 13, 8, 11, 12)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (171, 13, 8, 10, 12)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (172, 13, 8, 12, 12)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (173, 13, 8, 13, 12)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (174, 13, 8, 14, 57)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (175, 13, 8, 16, 57)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (176, 13, 8, 15, 57)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (177, 13, 8, 17, 57)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (178, 13, 8, 18, 57)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (179, 13, 8, 20, 234)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (180, 13, 8, 19, 57)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (181, 12, 7, 10, 26)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (182, 12, 7, 11, 25)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (183, 12, 7, 8, 24)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (184, 12, 7, 16, 74)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (185, 11, 3, 8, 21)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (186, 11, 3, 9, 21)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (187, 11, 3, 10, 21)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (188, 11, 3, 11, 27)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (189, 11, 3, 12, 50)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (190, 11, 3, 14, 57)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (191, 11, 3, 13, 50)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (192, 10, 7, 10, 30)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (193, 10, 7, 11, 30)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (194, 10, 7, 12, 30)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (195, 10, 7, 13, 30)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (196, 10, 7, 16, 38)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (197, 10, 7, 14, 38)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (198, 10, 7, 15, 38)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (199, 10, 7, 17, 32)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (200, 10, 7, 18, 50)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (201, 5, 5, 12, 19)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (202, 5, 5, 11, 20)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (203, 5, 5, 10, 20)
GO
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (204, 5, 5, 14, 20)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (205, 5, 5, 13, 20)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (206, 5, 5, 15, 20)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (207, 5, 5, 16, 20)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (208, 5, 5, 17, 20)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (209, 5, 5, 18, 20)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (210, 5, 5, 20, 20)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (211, 5, 5, 19, 20)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (212, 1, 1, 1, 10)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (213, 1, 1, 2, 10)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (214, 1, 1, 4, 10)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (215, 1, 1, 3, 10)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (216, 1, 1, 5, 10)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (217, 1, 1, 7, 10)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (218, 1, 1, 6, 10)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (219, 1, 1, 8, 10)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (220, 1, 1, 9, 10)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (221, 1, 1, 11, 10)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (222, 1, 1, 10, 10)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (223, 1, 1, 12, 10)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (224, 1, 1, 13, 10)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (225, 1, 1, 14, 10)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (226, 1, 1, 15, 10)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (227, 1, 1, 18, 10)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (228, 1, 1, 16, 10)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (229, 1, 1, 17, 10)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (230, 1, 1, 19, 10)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (231, 1, 1, 20, 10)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (232, 14, 9, 22, 10)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (233, 14, 9, 12, 49)
INSERT [dbo].[ProductDetail_Color_Size] ([Id], [IdProductDetail], [IdColor], [IdSize], [Quantity]) VALUES (234, 14, 9, 14, 20)
SET IDENTITY_INSERT [dbo].[ProductDetail_Color_Size] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductDetail_Material] ON 

INSERT [dbo].[ProductDetail_Material] ([Id], [IdProductDetail], [IdMaterial]) VALUES (9, 3, 3)
INSERT [dbo].[ProductDetail_Material] ([Id], [IdProductDetail], [IdMaterial]) VALUES (10, 3, 1)
INSERT [dbo].[ProductDetail_Material] ([Id], [IdProductDetail], [IdMaterial]) VALUES (11, 2, 2)
INSERT [dbo].[ProductDetail_Material] ([Id], [IdProductDetail], [IdMaterial]) VALUES (14, 4, 1)
INSERT [dbo].[ProductDetail_Material] ([Id], [IdProductDetail], [IdMaterial]) VALUES (16, 6, 1)
INSERT [dbo].[ProductDetail_Material] ([Id], [IdProductDetail], [IdMaterial]) VALUES (17, 6, 4)
INSERT [dbo].[ProductDetail_Material] ([Id], [IdProductDetail], [IdMaterial]) VALUES (18, 7, 5)
INSERT [dbo].[ProductDetail_Material] ([Id], [IdProductDetail], [IdMaterial]) VALUES (19, 8, 5)
INSERT [dbo].[ProductDetail_Material] ([Id], [IdProductDetail], [IdMaterial]) VALUES (20, 9, 1)
INSERT [dbo].[ProductDetail_Material] ([Id], [IdProductDetail], [IdMaterial]) VALUES (21, 9, 2)
INSERT [dbo].[ProductDetail_Material] ([Id], [IdProductDetail], [IdMaterial]) VALUES (27, 13, 6)
INSERT [dbo].[ProductDetail_Material] ([Id], [IdProductDetail], [IdMaterial]) VALUES (28, 13, 7)
INSERT [dbo].[ProductDetail_Material] ([Id], [IdProductDetail], [IdMaterial]) VALUES (29, 12, 5)
INSERT [dbo].[ProductDetail_Material] ([Id], [IdProductDetail], [IdMaterial]) VALUES (30, 11, 5)
INSERT [dbo].[ProductDetail_Material] ([Id], [IdProductDetail], [IdMaterial]) VALUES (31, 10, 5)
INSERT [dbo].[ProductDetail_Material] ([Id], [IdProductDetail], [IdMaterial]) VALUES (32, 5, 2)
INSERT [dbo].[ProductDetail_Material] ([Id], [IdProductDetail], [IdMaterial]) VALUES (33, 1, 2)
INSERT [dbo].[ProductDetail_Material] ([Id], [IdProductDetail], [IdMaterial]) VALUES (34, 1, 1)
INSERT [dbo].[ProductDetail_Material] ([Id], [IdProductDetail], [IdMaterial]) VALUES (35, 14, 5)
SET IDENTITY_INSERT [dbo].[ProductDetail_Material] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductDetailHistory] ON 

INSERT [dbo].[ProductDetailHistory] ([Id], [ImageMain], [ImageList], [UpdateDate], [UpdateBy], [Name], [Price], [Weight], [Description], [IdCategory], [IdSoleType], [IdBrand], [IdToe], [IdSole], [IdShoelace], [IdHeelcushion], [IdDesign], [IdMaterial], [IdVoucher], [IdColor_Size_Quantity], [Discount], [DiscountDate], [SupplierName], [SupplierPhone], [SupplierAddress], [SupplierAgree], [IdProductDetail]) VALUES (1, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/a4b15b6f-f3a5-40dd-a603-f2cc3298172d?alt=media', N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/a3bf36f1-8d91-4432-8048-0caff5232b42?alt=media,https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/2e31f590-fd66-4977-a618-37e2ae3ba196?alt=media,https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/20f83000-8895-40e6-b394-1f618d1b9c01?alt=media,', CAST(N'2024-08-06T18:59:05.223' AS DateTime), N'sa', N'Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006', 8690000.0000, 900, N'Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4.', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, N'2,1,', N'', N'1-1-10,', 0, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[ProductDetailHistory] ([Id], [ImageMain], [ImageList], [UpdateDate], [UpdateBy], [Name], [Price], [Weight], [Description], [IdCategory], [IdSoleType], [IdBrand], [IdToe], [IdSole], [IdShoelace], [IdHeelcushion], [IdDesign], [IdMaterial], [IdVoucher], [IdColor_Size_Quantity], [Discount], [DiscountDate], [SupplierName], [SupplierPhone], [SupplierAddress], [SupplierAgree], [IdProductDetail]) VALUES (2, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/398bbb9a-03bc-4b09-8383-d965fab2e310?alt=media', N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/7fbc99e5-62c7-48d8-bd6b-d5323b9f574e?alt=media,https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/c639e986-e69c-4323-8af4-9069737701fb?alt=media,https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/fb7291da-946e-49d7-a197-a9b278279a42?alt=media,', CAST(N'2024-08-06T19:14:20.677' AS DateTime), N'sa', N'Dior x Air Jordan 1 High CN8607-002', 23000000.0000, 900, NULL, 1, 2, 1, NULL, NULL, NULL, NULL, NULL, N'2,', N'', N'2-18-20,2-16-20,2-14-20,', 0, NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[ProductDetailHistory] ([Id], [ImageMain], [ImageList], [UpdateDate], [UpdateBy], [Name], [Price], [Weight], [Description], [IdCategory], [IdSoleType], [IdBrand], [IdToe], [IdSole], [IdShoelace], [IdHeelcushion], [IdDesign], [IdMaterial], [IdVoucher], [IdColor_Size_Quantity], [Discount], [DiscountDate], [SupplierName], [SupplierPhone], [SupplierAddress], [SupplierAgree], [IdProductDetail]) VALUES (3, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/42aa1d25-a9eb-4aff-bb57-9056c7766491?alt=media', N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/ad22574c-3947-4934-a67b-b91ad0f468ab?alt=media,https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/7650dca5-0ef1-4c4c-a2ed-0c559d53dda7?alt=media,https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/41e99de1-1137-4a11-ae04-6636933ca654?alt=media,', CAST(N'2024-08-06T19:20:29.893' AS DateTime), N'sa', N'Air Jordan 1 Mid SE ‘All Star 2021 Carbon Fiber’ (GS) DD2192-001', 10790000.0000, 900, N'Air Jordan Mid SE GS ‘All Star 2021’ ra mắt kỷ niệm mùa giải của NBA với một thiết kế mới độc đáo.', 2, 2, 1, NULL, NULL, NULL, NULL, NULL, N'3,1,', N'', N'3-8-20,3-10-20,3-6-20,3-4-20,3-2-20,', 3, NULL, NULL, NULL, NULL, NULL, 3)
INSERT [dbo].[ProductDetailHistory] ([Id], [ImageMain], [ImageList], [UpdateDate], [UpdateBy], [Name], [Price], [Weight], [Description], [IdCategory], [IdSoleType], [IdBrand], [IdToe], [IdSole], [IdShoelace], [IdHeelcushion], [IdDesign], [IdMaterial], [IdVoucher], [IdColor_Size_Quantity], [Discount], [DiscountDate], [SupplierName], [SupplierPhone], [SupplierAddress], [SupplierAgree], [IdProductDetail]) VALUES (4, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/398bbb9a-03bc-4b09-8383-d965fab2e310?alt=media', N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/c639e986-e69c-4323-8af4-9069737701fb?alt=media,https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/fb7291da-946e-49d7-a197-a9b278279a42?alt=media,https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/7fbc99e5-62c7-48d8-bd6b-d5323b9f574e?alt=media,', CAST(N'2024-08-06T19:20:46.083' AS DateTime), N'sa', N'Dior x Air Jordan 1 High CN8607-002', 23000000.0000, 900, N'Dior x Air Jordan 1 High chắc chắn là một trong những bản collab sneaker hot nhất trong cả thập kỷ, hình bóng một đôi Air Jordan chưa bao giờ thực sự bùng nổ như thế này trước đây, và đã đến lúc để mọi người phải trầm trồ', 1, 2, 1, NULL, NULL, NULL, NULL, NULL, N'2,', N'', N'2-18-20,2-14-20,2-16-20,', 0, NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[ProductDetailHistory] ([Id], [ImageMain], [ImageList], [UpdateDate], [UpdateBy], [Name], [Price], [Weight], [Description], [IdCategory], [IdSoleType], [IdBrand], [IdToe], [IdSole], [IdShoelace], [IdHeelcushion], [IdDesign], [IdMaterial], [IdVoucher], [IdColor_Size_Quantity], [Discount], [DiscountDate], [SupplierName], [SupplierPhone], [SupplierAddress], [SupplierAgree], [IdProductDetail]) VALUES (5, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/a4b15b6f-f3a5-40dd-a603-f2cc3298172d?alt=media', N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/a3bf36f1-8d91-4432-8048-0caff5232b42?alt=media,https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/2e31f590-fd66-4977-a618-37e2ae3ba196?alt=media,https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/20f83000-8895-40e6-b394-1f618d1b9c01?alt=media,', CAST(N'2024-08-06T19:20:59.037' AS DateTime), N'sa', N'Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006', 8690000.0000, 900, N'Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4.', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, N'1,2,', N'', N'1-1-10,1-18-10,1-8-10,1-4-10,1-7-10,1-14-10,1-19-10,1-15-10,1-10-10,1-12-10,1-5-10,1-16-10,1-17-10,1-20-10,1-9-10,1-11-10,1-6-10,1-3-10,1-13-10,1-2-10,', 0, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[ProductDetailHistory] ([Id], [ImageMain], [ImageList], [UpdateDate], [UpdateBy], [Name], [Price], [Weight], [Description], [IdCategory], [IdSoleType], [IdBrand], [IdToe], [IdSole], [IdShoelace], [IdHeelcushion], [IdDesign], [IdMaterial], [IdVoucher], [IdColor_Size_Quantity], [Discount], [DiscountDate], [SupplierName], [SupplierPhone], [SupplierAddress], [SupplierAgree], [IdProductDetail]) VALUES (6, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/f46bbf9e-0a56-4f83-afbd-cf2af871fc06?alt=media', N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/73cb3bef-4698-40d2-9aa9-71a18b5320aa?alt=media,https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/98bd35ff-24c8-4db5-93ce-f5fea3826365?alt=media,https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/90d1aae9-2be1-412d-8c55-f12812e1a6fa?alt=media,', CAST(N'2024-08-06T21:50:08.450' AS DateTime), N'guantoron', N'Nike P-6000 ‘Light Iron Ore’', 3890000.0000, 892, N'Nếu bạn đang tìm kiếm một đôi giày thể thao chất lượng, thoải mái và thời trang, thì giày Nike P-6000 ‘Light Iron Ore’ là một lựa chọn hoàn hảo.', 13, 3, 1, NULL, NULL, NULL, NULL, NULL, N'6,7,', N'', N'8-21-25,8-15-57,8-2-12,8-17-57,8-4-12,8-7-12,8-14-57,8-11-12,8-19-57,8-12-12,8-8-12,8-20-234,8-18-57,8-13-12,8-16-57,8-5-12,8-22-8,8-3-12,8-10-12,8-6-12,8-9-12,', 0, NULL, NULL, NULL, NULL, NULL, 13)
INSERT [dbo].[ProductDetailHistory] ([Id], [ImageMain], [ImageList], [UpdateDate], [UpdateBy], [Name], [Price], [Weight], [Description], [IdCategory], [IdSoleType], [IdBrand], [IdToe], [IdSole], [IdShoelace], [IdHeelcushion], [IdDesign], [IdMaterial], [IdVoucher], [IdColor_Size_Quantity], [Discount], [DiscountDate], [SupplierName], [SupplierPhone], [SupplierAddress], [SupplierAgree], [IdProductDetail]) VALUES (7, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/29c41dcf-5e97-468a-acce-d9cdcb235947?alt=media', N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/7c5ae332-c747-40f3-8911-362f7ffb7c36?alt=media,https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/3efe2424-3a97-4f4e-9e49-cd1045829766?alt=media,https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/c3c9c486-ca67-44c9-b6b5-d93fdd560e59?alt=media,', CAST(N'2024-08-06T21:50:19.210' AS DateTime), N'guantoron', N'Nike ReactX Infinity 4 ‘Black Racer Blue’', 3490000.0000, 980, N'Nike ReactX Infinity 4 ‘Black Racer Blue’ DR2665-005 là một đôi giày chạy tuyệt vời, phù hợp với các runner ở mọi cấp độ. Màu sắc đen xanhRacer Blue mang đến vẻ ngoài hiện đại, cá tính, thích hợp để phối với nhiều trang phục thể thao khác nhau.', 13, 4, 1, NULL, NULL, NULL, NULL, NULL, N'5,', N'', N'7-11-25,7-8-24,7-16-74,7-10-26,', 0, NULL, NULL, NULL, NULL, NULL, 12)
INSERT [dbo].[ProductDetailHistory] ([Id], [ImageMain], [ImageList], [UpdateDate], [UpdateBy], [Name], [Price], [Weight], [Description], [IdCategory], [IdSoleType], [IdBrand], [IdToe], [IdSole], [IdShoelace], [IdHeelcushion], [IdDesign], [IdMaterial], [IdVoucher], [IdColor_Size_Quantity], [Discount], [DiscountDate], [SupplierName], [SupplierPhone], [SupplierAddress], [SupplierAgree], [IdProductDetail]) VALUES (8, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/ab2bd54d-c3cf-4033-977b-b65442e45e8f?alt=media', N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/77abd424-fb64-4769-8bab-21cf17c2724a?alt=media,https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/0163c4d2-b54a-468e-a4fb-3ebf59b81bb4?alt=media,https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/15d4b950-ceb7-44eb-86d9-bd84293f2d47?alt=media,', CAST(N'2024-08-06T21:50:28.900' AS DateTime), N'guantoron', N'Nike ReactX Infinity 4 ‘Oreo’', 4890000.0000, 931, N'Nike ReactX Infinity 4 là một phiên bản giày chạy bộ trong dòng ReactX Infinity, với thiết kế màu “Black White” (đen trắng), tạo nên vẻ ngoại hình đơn giản và phong cách thể thao.', 13, 4, 1, NULL, NULL, NULL, NULL, NULL, N'5,', N'', N'3-11-27,3-9-21,3-10-21,3-12-50,3-13-50,3-8-21,3-14-57,', 0, NULL, NULL, NULL, NULL, NULL, 11)
INSERT [dbo].[ProductDetailHistory] ([Id], [ImageMain], [ImageList], [UpdateDate], [UpdateBy], [Name], [Price], [Weight], [Description], [IdCategory], [IdSoleType], [IdBrand], [IdToe], [IdSole], [IdShoelace], [IdHeelcushion], [IdDesign], [IdMaterial], [IdVoucher], [IdColor_Size_Quantity], [Discount], [DiscountDate], [SupplierName], [SupplierPhone], [SupplierAddress], [SupplierAgree], [IdProductDetail]) VALUES (9, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/4d6d2b56-a843-431a-8ac8-e87f9c018ba6?alt=media', N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/7560706e-cdaa-403d-9047-e9c9f17d8a49?alt=media,https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/75ef98ae-3e98-4109-9e99-8cf893383033?alt=media,https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/d168c874-f745-4f98-9e74-dd8d3279daec?alt=media,', CAST(N'2024-08-06T21:50:39.677' AS DateTime), N'guantoron', N'Nike React Infinity Run Flyknit 2 ‘', 5490000.0000, 910, N'Nike React Infinity Run Flyknit 2 ‘Black’ hiện đã có sẵn tại Hyper Sneaker, đừng bỏ lỡ cơ hội của mình nhé!', 13, 4, 1, NULL, NULL, NULL, NULL, NULL, N'5,', N'', N'7-17-32,7-18-50,7-16-38,7-13-30,7-10-30,7-12-30,7-11-30,7-14-38,7-15-38,', 0, NULL, NULL, NULL, NULL, NULL, 10)
INSERT [dbo].[ProductDetailHistory] ([Id], [ImageMain], [ImageList], [UpdateDate], [UpdateBy], [Name], [Price], [Weight], [Description], [IdCategory], [IdSoleType], [IdBrand], [IdToe], [IdSole], [IdShoelace], [IdHeelcushion], [IdDesign], [IdMaterial], [IdVoucher], [IdColor_Size_Quantity], [Discount], [DiscountDate], [SupplierName], [SupplierPhone], [SupplierAddress], [SupplierAgree], [IdProductDetail]) VALUES (10, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/d521bdb9-af4b-4191-b439-c4ab8d5e7866?alt=media', N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/02b6cf0e-6638-41e4-8664-76d62b14b55c?alt=media,https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/abd9644b-9fd8-4aad-9140-0c47cfee0f3a?alt=media,https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/9abbd49d-50d9-4d6d-ab1c-ca7419bd9d66?alt=media,', CAST(N'2024-08-06T21:51:00.763' AS DateTime), N'guantoron', N'Converse Chuck Taylor All Star High Top ‘Traveler’', 1690000.0000, 900, N'Giày Converse Chuck Taylor All Star High Top ‘Traveler’ hứa hẹn là một siêu phẩm mà bất cứ sneakerhead nào cũng mong muốn sở hữu trong tủ giày của mình.', 4, 2, 2, NULL, NULL, NULL, NULL, NULL, N'2,', N'', N'5-14-20,5-15-20,5-17-20,5-19-20,5-16-20,5-20-20,5-11-20,5-13-20,5-18-20,5-10-20,5-12-19,', 0, NULL, NULL, NULL, NULL, NULL, 5)
INSERT [dbo].[ProductDetailHistory] ([Id], [ImageMain], [ImageList], [UpdateDate], [UpdateBy], [Name], [Price], [Weight], [Description], [IdCategory], [IdSoleType], [IdBrand], [IdToe], [IdSole], [IdShoelace], [IdHeelcushion], [IdDesign], [IdMaterial], [IdVoucher], [IdColor_Size_Quantity], [Discount], [DiscountDate], [SupplierName], [SupplierPhone], [SupplierAddress], [SupplierAgree], [IdProductDetail]) VALUES (11, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/a4b15b6f-f3a5-40dd-a603-f2cc3298172d?alt=media', N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/20f83000-8895-40e6-b394-1f618d1b9c01?alt=media,https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/a3bf36f1-8d91-4432-8048-0caff5232b42?alt=media,https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/2e31f590-fd66-4977-a618-37e2ae3ba196?alt=media,', CAST(N'2024-08-06T21:51:20.647' AS DateTime), N'guantoron', N'Nike Air Jordan 4 Retro ‘Bred Reimagined’', 8690000.0000, 900, N'Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4.', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, N'2,1,', N'', N'1-5-10,1-18-10,1-19-10,1-20-10,1-1-10,1-13-10,1-9-10,1-7-10,1-16-10,1-15-10,1-14-10,1-2-10,1-3-10,1-17-10,1-10-10,1-6-10,1-8-10,1-11-10,1-4-10,1-12-10,', 0, NULL, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[ProductDetailHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductImage] ON 

INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (1, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/a4b15b6f-f3a5-40dd-a603-f2cc3298172d?alt=media', 1, CAST(N'2024-08-06T18:57:52.413' AS DateTime), NULL, NULL, NULL, 0, 1)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (2, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/a3bf36f1-8d91-4432-8048-0caff5232b42?alt=media', 0, CAST(N'2024-08-06T18:57:55.947' AS DateTime), NULL, NULL, NULL, 0, 1)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (3, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/20f83000-8895-40e6-b394-1f618d1b9c01?alt=media', 0, CAST(N'2024-08-06T18:57:56.137' AS DateTime), NULL, NULL, NULL, 0, 1)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (4, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/2e31f590-fd66-4977-a618-37e2ae3ba196?alt=media', 0, CAST(N'2024-08-06T18:57:56.453' AS DateTime), NULL, NULL, NULL, 0, 1)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (5, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/398bbb9a-03bc-4b09-8383-d965fab2e310?alt=media', 1, CAST(N'2024-08-06T19:13:40.593' AS DateTime), NULL, NULL, NULL, 0, 2)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (6, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/c639e986-e69c-4323-8af4-9069737701fb?alt=media', 0, CAST(N'2024-08-06T19:13:42.300' AS DateTime), NULL, NULL, NULL, 0, 2)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (7, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/fb7291da-946e-49d7-a197-a9b278279a42?alt=media', 0, CAST(N'2024-08-06T19:13:42.337' AS DateTime), NULL, NULL, NULL, 0, 2)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (8, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/7fbc99e5-62c7-48d8-bd6b-d5323b9f574e?alt=media', 0, CAST(N'2024-08-06T19:13:42.353' AS DateTime), NULL, NULL, NULL, 0, 2)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (9, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/42aa1d25-a9eb-4aff-bb57-9056c7766491?alt=media', 1, CAST(N'2024-08-06T19:19:01.047' AS DateTime), NULL, NULL, NULL, 0, 3)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (10, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/ad22574c-3947-4934-a67b-b91ad0f468ab?alt=media', 0, CAST(N'2024-08-06T19:19:02.347' AS DateTime), NULL, NULL, NULL, 0, 3)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (11, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/41e99de1-1137-4a11-ae04-6636933ca654?alt=media', 0, CAST(N'2024-08-06T19:19:02.390' AS DateTime), NULL, NULL, NULL, 0, 3)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (12, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/7650dca5-0ef1-4c4c-a2ed-0c559d53dda7?alt=media', 0, CAST(N'2024-08-06T19:19:02.450' AS DateTime), NULL, NULL, NULL, 0, 3)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (13, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/40c3ef68-b0e2-4d4a-a271-9464008573db?alt=media', 1, CAST(N'2024-08-06T19:27:07.797' AS DateTime), NULL, NULL, NULL, 0, 4)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (14, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/8d59167d-28e7-4344-a739-ea69aedfd1a9?alt=media', 0, CAST(N'2024-08-06T19:27:12.237' AS DateTime), NULL, NULL, NULL, 0, 4)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (15, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/91e2fd32-135e-46c7-80b8-f5d54b8c673f?alt=media', 0, CAST(N'2024-08-06T19:27:12.237' AS DateTime), NULL, NULL, NULL, 0, 4)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (16, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/1636ea77-573a-431d-bc3c-7012c8cd82c2?alt=media', 0, CAST(N'2024-08-06T19:27:12.243' AS DateTime), NULL, NULL, NULL, 0, 4)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (17, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/bcb8ca70-5fa1-4283-9fc2-cc8d4396054b?alt=media', 0, CAST(N'2024-08-06T19:27:12.533' AS DateTime), NULL, NULL, NULL, 0, 4)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (18, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/93655dc4-29cf-4768-9287-b9c2d933ff36?alt=media', 0, CAST(N'2024-08-06T19:27:12.667' AS DateTime), NULL, NULL, NULL, 0, 4)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (19, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/6bd0fd6c-670d-43e7-96ce-824d4b3e6d19?alt=media', 0, CAST(N'2024-08-06T19:27:12.687' AS DateTime), NULL, NULL, NULL, 0, 4)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (20, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/b6bd334f-3fb9-40e5-950d-873a632535d4?alt=media', 0, CAST(N'2024-08-06T19:27:16.407' AS DateTime), NULL, NULL, NULL, 0, 4)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (21, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/d521bdb9-af4b-4191-b439-c4ab8d5e7866?alt=media', 1, CAST(N'2024-08-06T19:37:30.363' AS DateTime), NULL, NULL, NULL, 0, 5)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (22, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/abd9644b-9fd8-4aad-9140-0c47cfee0f3a?alt=media', 0, CAST(N'2024-08-06T19:37:32.070' AS DateTime), NULL, NULL, NULL, 0, 5)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (23, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/02b6cf0e-6638-41e4-8664-76d62b14b55c?alt=media', 0, CAST(N'2024-08-06T19:37:32.280' AS DateTime), NULL, NULL, NULL, 0, 5)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (24, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/9abbd49d-50d9-4d6d-ab1c-ca7419bd9d66?alt=media', 0, CAST(N'2024-08-06T19:37:32.367' AS DateTime), NULL, NULL, NULL, 0, 5)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (25, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/e50038d1-43b4-4fe7-8d4e-2b8a593f5a86?alt=media', 1, CAST(N'2024-08-06T19:41:17.343' AS DateTime), NULL, NULL, NULL, 0, 6)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (26, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/3247b00c-b3f6-4503-b9f1-9ad0d1ebaac1?alt=media', 0, CAST(N'2024-08-06T19:41:20.040' AS DateTime), NULL, NULL, NULL, 0, 6)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (27, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/2d5e5719-a8fb-47f8-8542-98e31213be35?alt=media', 0, CAST(N'2024-08-06T19:41:20.187' AS DateTime), NULL, NULL, NULL, 0, 6)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (28, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/639020bf-1187-4548-b145-29b407090f0f?alt=media', 0, CAST(N'2024-08-06T19:41:20.213' AS DateTime), NULL, NULL, NULL, 0, 6)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (29, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/a5faef9a-4def-4db2-ad5d-84434ac20a3b?alt=media', 1, CAST(N'2024-08-06T20:15:04.130' AS DateTime), NULL, NULL, NULL, 0, 7)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (30, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/a1c18291-0306-46aa-90a5-0a2d8e7019e0?alt=media', 0, CAST(N'2024-08-06T20:15:06.763' AS DateTime), NULL, NULL, NULL, 0, 7)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (31, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/1d1ac25f-ddba-4798-b0bb-f205786c4bd9?alt=media', 0, CAST(N'2024-08-06T20:15:07.060' AS DateTime), NULL, NULL, NULL, 0, 7)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (32, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/0fe825ec-0605-42cb-8525-8400b93cfd17?alt=media', 0, CAST(N'2024-08-06T20:15:08.143' AS DateTime), NULL, NULL, NULL, 0, 7)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (33, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/4ba4b5dd-7952-49b1-b916-426692991615?alt=media', 1, CAST(N'2024-08-06T20:19:10.317' AS DateTime), NULL, NULL, NULL, 0, 8)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (34, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/6c65b66c-ca70-43ed-9935-da7879670337?alt=media', 0, CAST(N'2024-08-06T20:19:11.937' AS DateTime), NULL, NULL, NULL, 0, 8)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (35, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/f25c67ab-54ed-4742-bc92-82cbea17320d?alt=media', 0, CAST(N'2024-08-06T20:19:11.947' AS DateTime), NULL, NULL, NULL, 0, 8)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (36, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/2b4c7a9a-6f29-4286-a440-73eea7b15e38?alt=media', 0, CAST(N'2024-08-06T20:19:12.413' AS DateTime), NULL, NULL, NULL, 0, 8)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (37, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/344f4dd6-2a0f-4917-92a8-62012f84e524?alt=media', 1, CAST(N'2024-08-06T20:23:22.357' AS DateTime), NULL, NULL, NULL, 0, 9)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (38, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/d19cd82c-314f-4924-b7ab-3bd8d4c9f3a8?alt=media', 0, CAST(N'2024-08-06T20:23:24.407' AS DateTime), NULL, NULL, NULL, 0, 9)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (39, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/ef539290-ba13-4ba8-b511-9228ea7bf790?alt=media', 0, CAST(N'2024-08-06T20:23:24.523' AS DateTime), NULL, NULL, NULL, 0, 9)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (40, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/e153ce49-3607-48d7-94c6-2aaf2dc1c899?alt=media', 0, CAST(N'2024-08-06T20:23:24.567' AS DateTime), NULL, NULL, NULL, 0, 9)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (41, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/4d6d2b56-a843-431a-8ac8-e87f9c018ba6?alt=media', 1, CAST(N'2024-08-06T20:28:09.413' AS DateTime), NULL, NULL, NULL, 0, 10)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (42, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/7560706e-cdaa-403d-9047-e9c9f17d8a49?alt=media', 0, CAST(N'2024-08-06T20:28:11.303' AS DateTime), NULL, NULL, NULL, 0, 10)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (43, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/75ef98ae-3e98-4109-9e99-8cf893383033?alt=media', 0, CAST(N'2024-08-06T20:28:11.333' AS DateTime), NULL, NULL, NULL, 0, 10)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (44, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/d168c874-f745-4f98-9e74-dd8d3279daec?alt=media', 0, CAST(N'2024-08-06T20:28:11.983' AS DateTime), NULL, NULL, NULL, 0, 10)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (45, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/ab2bd54d-c3cf-4033-977b-b65442e45e8f?alt=media', 1, CAST(N'2024-08-06T20:31:32.567' AS DateTime), NULL, NULL, NULL, 0, 11)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (46, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/0163c4d2-b54a-468e-a4fb-3ebf59b81bb4?alt=media', 0, CAST(N'2024-08-06T20:31:34.140' AS DateTime), NULL, NULL, NULL, 0, 11)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (47, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/15d4b950-ceb7-44eb-86d9-bd84293f2d47?alt=media', 0, CAST(N'2024-08-06T20:31:34.297' AS DateTime), NULL, NULL, NULL, 0, 11)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (48, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/77abd424-fb64-4769-8bab-21cf17c2724a?alt=media', 0, CAST(N'2024-08-06T20:31:34.300' AS DateTime), NULL, NULL, NULL, 0, 11)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (49, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/29c41dcf-5e97-468a-acce-d9cdcb235947?alt=media', 1, CAST(N'2024-08-06T20:53:25.017' AS DateTime), NULL, NULL, NULL, 0, 12)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (50, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/7c5ae332-c747-40f3-8911-362f7ffb7c36?alt=media', 0, CAST(N'2024-08-06T20:53:27.733' AS DateTime), NULL, NULL, NULL, 0, 12)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (51, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/c3c9c486-ca67-44c9-b6b5-d93fdd560e59?alt=media', 0, CAST(N'2024-08-06T20:53:27.853' AS DateTime), NULL, NULL, NULL, 0, 12)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (52, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/3efe2424-3a97-4f4e-9e49-cd1045829766?alt=media', 0, CAST(N'2024-08-06T20:53:27.913' AS DateTime), NULL, NULL, NULL, 0, 12)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (53, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/f46bbf9e-0a56-4f83-afbd-cf2af871fc06?alt=media', 1, CAST(N'2024-08-06T21:03:04.487' AS DateTime), NULL, NULL, NULL, 0, 13)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (54, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/90d1aae9-2be1-412d-8c55-f12812e1a6fa?alt=media', 0, CAST(N'2024-08-06T21:03:08.450' AS DateTime), NULL, NULL, NULL, 0, 13)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (55, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/98bd35ff-24c8-4db5-93ce-f5fea3826365?alt=media', 0, CAST(N'2024-08-06T21:03:08.517' AS DateTime), NULL, NULL, NULL, 0, 13)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (56, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/73cb3bef-4698-40d2-9aa9-71a18b5320aa?alt=media', 0, CAST(N'2024-08-06T21:03:08.563' AS DateTime), NULL, NULL, NULL, 0, 13)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (57, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/737b56a6-6edf-4986-baf9-87f08935227c?alt=media', 1, CAST(N'2024-08-06T23:24:40.153' AS DateTime), NULL, NULL, NULL, 0, 14)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (58, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/c271d9af-b499-498a-973a-66269bc9e2e4?alt=media', 0, CAST(N'2024-08-06T23:24:41.500' AS DateTime), NULL, NULL, NULL, 0, 14)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (59, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/9ab27189-e5bc-44d7-93e3-7a4e6725183b?alt=media', 0, CAST(N'2024-08-06T23:24:41.650' AS DateTime), NULL, NULL, NULL, 0, 14)
INSERT [dbo].[ProductImage] ([Id], [Url], [MainImage], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProduct]) VALUES (60, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/0775cbb1-ba67-4cff-b8c5-c173f1325278?alt=media', 0, CAST(N'2024-08-06T23:24:41.650' AS DateTime), NULL, NULL, NULL, 0, 14)
SET IDENTITY_INSERT [dbo].[ProductImage] OFF
GO
SET IDENTITY_INSERT [dbo].[Rating] ON 

INSERT [dbo].[Rating] ([Id], [Score], [Note], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [IdProductDetail], [IdCustomer]) VALUES (1, 4, N'Tạm', CAST(N'2024-08-06T23:54:11.027' AS DateTime), NULL, NULL, NULL, 0, 5, 1)
SET IDENTITY_INSERT [dbo].[Rating] OFF
GO
SET IDENTITY_INSERT [dbo].[RatingImage] ON 

INSERT [dbo].[RatingImage] ([Id], [Url], [IdRating]) VALUES (1, N'https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/ef4d2303-c1be-429e-a843-8cdd16a4cf10?alt=media', 1)
SET IDENTITY_INSERT [dbo].[RatingImage] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (1, N'admin', CAST(N'2024-08-06T18:50:17.020' AS DateTime), CAST(N'2024-08-06T18:50:17.020' AS DateTime), N'CreatedByExample', N'UpdatedByExample', 1)
INSERT [dbo].[Role] ([Id], [Name], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (2, N'employee', CAST(N'2024-08-06T18:50:17.023' AS DateTime), CAST(N'2024-08-06T18:50:17.023' AS DateTime), N'CreatedByExample', N'UpdatedByExample', 1)
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Size] ON 

INSERT [dbo].[Size] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (1, N'35.5', NULL, CAST(N'2024-08-06T18:55:00.100' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[Size] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (2, N'36', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Size] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (3, N'36.5', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Size] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (4, N'37', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Size] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (5, N'37.5', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Size] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (6, N'38', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Size] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (7, N'38.5', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Size] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (8, N'39', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Size] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (9, N'39.5', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Size] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (10, N'40', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Size] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (11, N'40.5', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Size] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (12, N'41', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Size] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (13, N'41.5', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Size] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (14, N'42', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Size] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (15, N'42.5', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Size] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (16, N'43', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Size] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (17, N'43.5', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Size] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (18, N'44', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Size] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (19, N'44.5', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Size] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (20, N'45', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Size] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (21, N'45.5', NULL, CAST(N'2024-08-06T21:02:40.423' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[Size] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (22, N'46', NULL, CAST(N'2024-08-06T21:02:52.550' AS DateTime), NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Size] OFF
GO
SET IDENTITY_INSERT [dbo].[SoleType] ON 

INSERT [dbo].[SoleType] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (1, N'Công nghệ Air Sole', NULL, CAST(N'2024-08-06T18:53:32.080' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[SoleType] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (2, N'Nhựa cứng', NULL, CAST(N'2024-08-06T19:13:30.917' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[SoleType] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (3, N'Cao su', NULL, CAST(N'2024-08-06T20:12:14.217' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[SoleType] ([Id], [Name], [Description], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status]) VALUES (4, N'Cao su non', NULL, CAST(N'2024-08-06T20:26:50.473' AS DateTime), NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[SoleType] OFF
GO
SET IDENTITY_INSERT [dbo].[Voucher] ON 

INSERT [dbo].[Voucher] ([Id], [Code], [Name], [TypeVoucher], [IsVoucher], [Discount], [Cash], [StartDate], [EndDate], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [Minimum]) VALUES (1, N'VC-HD-100', N'Khuyến mãi', 1, 0, 10, NULL, CAST(N'2024-08-01T00:00:00.000' AS DateTime), CAST(N'2024-08-30T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 0, 1000000)
INSERT [dbo].[Voucher] ([Id], [Code], [Name], [TypeVoucher], [IsVoucher], [Discount], [Cash], [StartDate], [EndDate], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [Minimum]) VALUES (2, N'KM2', N'Khuyen mai', 1, 0, 25, NULL, CAST(N'2024-08-01T00:00:00.000' AS DateTime), CAST(N'2024-08-22T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 0, 100000)
INSERT [dbo].[Voucher] ([Id], [Code], [Name], [TypeVoucher], [IsVoucher], [Discount], [Cash], [StartDate], [EndDate], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [Minimum]) VALUES (3, N'KM2', N'KM2', 0, 0, NULL, 30000.0000, CAST(N'2024-08-02T00:00:00.000' AS DateTime), CAST(N'2024-08-31T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 0, 100000)
INSERT [dbo].[Voucher] ([Id], [Code], [Name], [TypeVoucher], [IsVoucher], [Discount], [Cash], [StartDate], [EndDate], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [Minimum]) VALUES (4, N'KM04', N'KM04', 0, 0, NULL, 50000.0000, CAST(N'2024-08-01T00:00:00.000' AS DateTime), CAST(N'2024-08-20T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 0, 500000)
INSERT [dbo].[Voucher] ([Id], [Code], [Name], [TypeVoucher], [IsVoucher], [Discount], [Cash], [StartDate], [EndDate], [CreateDate], [UpdateDate], [CreateBy], [UpdateBy], [Status], [Minimum]) VALUES (5, N'KM05', N'KM05', 1, 0, 23, NULL, CAST(N'2024-08-01T00:00:00.000' AS DateTime), CAST(N'2024-08-31T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 0, 1000000)
SET IDENTITY_INSERT [dbo].[Voucher] OFF
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD FOREIGN KEY([IdCustomer])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([IdAddress])
REFERENCES [dbo].[Address] ([Id])
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([IdCustomer])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([IdEmployee])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([IdVoucher])
REFERENCES [dbo].[Voucher] ([Id])
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD FOREIGN KEY([IdOrder])
REFERENCES [dbo].[Bill] ([Id])
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD FOREIGN KEY([IdProductDetail])
REFERENCES [dbo].[ProductDetail] ([Id])
GO
ALTER TABLE [dbo].[BillHistory]  WITH CHECK ADD FOREIGN KEY([IdOrder])
REFERENCES [dbo].[Bill] ([Id])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([IdCustomer])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[CartDetail]  WITH CHECK ADD FOREIGN KEY([IdCart])
REFERENCES [dbo].[Cart] ([Id])
GO
ALTER TABLE [dbo].[CartDetail]  WITH CHECK ADD FOREIGN KEY([IdProductDetail])
REFERENCES [dbo].[ProductDetail] ([Id])
GO
ALTER TABLE [dbo].[Coupon]  WITH CHECK ADD FOREIGN KEY([IdCustomer])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([IdRole])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[Product_Voucher]  WITH CHECK ADD FOREIGN KEY([IdProduct])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Product_Voucher]  WITH CHECK ADD FOREIGN KEY([IdVoucher])
REFERENCES [dbo].[Voucher] ([Id])
GO
ALTER TABLE [dbo].[ProductDetail]  WITH CHECK ADD FOREIGN KEY([IdBrand])
REFERENCES [dbo].[Brand] ([Id])
GO
ALTER TABLE [dbo].[ProductDetail]  WITH CHECK ADD FOREIGN KEY([IdCategory])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[ProductDetail]  WITH CHECK ADD FOREIGN KEY([IdProduct])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[ProductDetail]  WITH CHECK ADD FOREIGN KEY([IdSoleType])
REFERENCES [dbo].[SoleType] ([Id])
GO
ALTER TABLE [dbo].[ProductDetail_Color_Size]  WITH CHECK ADD FOREIGN KEY([IdColor])
REFERENCES [dbo].[Color] ([Id])
GO
ALTER TABLE [dbo].[ProductDetail_Color_Size]  WITH CHECK ADD FOREIGN KEY([IdProductDetail])
REFERENCES [dbo].[ProductDetail] ([Id])
GO
ALTER TABLE [dbo].[ProductDetail_Color_Size]  WITH CHECK ADD FOREIGN KEY([IdSize])
REFERENCES [dbo].[Size] ([Id])
GO
ALTER TABLE [dbo].[ProductDetail_Material]  WITH CHECK ADD FOREIGN KEY([IdMaterial])
REFERENCES [dbo].[Material] ([Id])
GO
ALTER TABLE [dbo].[ProductDetail_Material]  WITH CHECK ADD FOREIGN KEY([IdProductDetail])
REFERENCES [dbo].[ProductDetail] ([Id])
GO
ALTER TABLE [dbo].[ProductDetailHistory]  WITH CHECK ADD FOREIGN KEY([IdProductDetail])
REFERENCES [dbo].[ProductDetail] ([Id])
GO
ALTER TABLE [dbo].[ProductFault]  WITH CHECK ADD FOREIGN KEY([IdProductDetail])
REFERENCES [dbo].[ProductDetail] ([Id])
GO
ALTER TABLE [dbo].[ProductImage]  WITH CHECK ADD FOREIGN KEY([IdProduct])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD FOREIGN KEY([IdCustomer])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD FOREIGN KEY([IdProductDetail])
REFERENCES [dbo].[ProductDetail] ([Id])
GO
ALTER TABLE [dbo].[RatingImage]  WITH CHECK ADD FOREIGN KEY([IdRating])
REFERENCES [dbo].[Rating] ([Id])
GO
ALTER TABLE [dbo].[ReturnExchange]  WITH CHECK ADD FOREIGN KEY([IdCustomer])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[ReturnExchangeDetail]  WITH CHECK ADD FOREIGN KEY([IdOrderDetail])
REFERENCES [dbo].[BillDetail] ([Id])
GO
ALTER TABLE [dbo].[ReturnExchangeDetail]  WITH CHECK ADD FOREIGN KEY([IdReturnExchange])
REFERENCES [dbo].[ReturnExchange] ([Id])
GO
ALTER TABLE [dbo].[ReturnExchangeHistory]  WITH CHECK ADD FOREIGN KEY([IdReturnExchange])
REFERENCES [dbo].[ReturnExchange] ([Id])
GO
USE [master]
GO
ALTER DATABASE [ShopGiay] SET  READ_WRITE 
GO
