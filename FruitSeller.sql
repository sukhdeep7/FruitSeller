USE [master]
GO
/****** Object:  Database [FruitSeller]    Script Date: 4/06/2020 12:57:52 AM ******/
CREATE DATABASE [FruitSeller]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FruitSeller_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\FruitSeller.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FruitSeller_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\FruitSeller.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FruitSeller] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FruitSeller].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FruitSeller] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FruitSeller] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FruitSeller] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FruitSeller] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FruitSeller] SET ARITHABORT OFF 
GO
ALTER DATABASE [FruitSeller] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [FruitSeller] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FruitSeller] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FruitSeller] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FruitSeller] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FruitSeller] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FruitSeller] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FruitSeller] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FruitSeller] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FruitSeller] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FruitSeller] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FruitSeller] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FruitSeller] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FruitSeller] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FruitSeller] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FruitSeller] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FruitSeller] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FruitSeller] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FruitSeller] SET  MULTI_USER 
GO
ALTER DATABASE [FruitSeller] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FruitSeller] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FruitSeller] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FruitSeller] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FruitSeller] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FruitSeller] SET QUERY_STORE = OFF
GO
USE [FruitSeller]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 4/06/2020 12:57:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 4/06/2020 12:57:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Contact] [varchar](50) NULL,
	[Message] [varchar](50) NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 4/06/2020 12:57:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[Contact] [varchar](50) NULL,
	[Designation] [varchar](50) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purchase]    Script Date: 4/06/2020 12:57:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Contact] [varchar](50) NULL,
	[FruitName] [varchar](50) NULL,
	[Qty] [nvarchar](50) NULL,
	[Type] [varchar](50) NULL,
	[Bill] [varchar](50) NULL,
	[BillDate] [varchar](50) NULL,
 CONSTRAINT [PK_Purchase] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 4/06/2020 12:57:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[id] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[Contact] [varchar](50) NULL,
	[FruitName] [varchar](50) NULL,
	[Qty] [nvarchar](50) NULL,
	[Type] [varchar](50) NULL,
	[Bill] [varchar](50) NULL,
	[BillDate] [varchar](50) NULL,
 CONSTRAINT [PK_Sale] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 4/06/2020 12:57:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FruitName] [varchar](50) NULL,
	[Qty] [nvarchar](50) NULL,
	[QtyType] [varchar](50) NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([id], [Name], [Password]) VALUES (1, N'admin@admin.com', N'admin')
SET IDENTITY_INSERT [dbo].[Admin] OFF
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([id], [Name], [Email], [Contact], [Message]) VALUES (2, N'jarnail singh singh', N'anokhasingh209@gmail.com', N'9914755052', N'qwqw')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Contact], [Message]) VALUES (8, N'Mr Test', N'test@mail.com', N'987654', N'This is a test message from MR Test.')
SET IDENTITY_INSERT [dbo].[Contact] OFF
SET IDENTITY_INSERT [dbo].[Purchase] ON 

INSERT [dbo].[Purchase] ([id], [Name], [Contact], [FruitName], [Qty], [Type], [Bill], [BillDate]) VALUES (1, N'RAMMU', N'654489566', N'Bananas', N'90', N'SALES', N'900', N'05/05/2020')
SET IDENTITY_INSERT [dbo].[Purchase] OFF
INSERT [dbo].[Sale] ([id], [Name], [Contact], [FruitName], [Qty], [Type], [Bill], [BillDate]) VALUES (0, N'BestSale', N'09876543', N'Test Fruit Name', N'10000', N'Sale', N'600', N'05/05/2020')
SET IDENTITY_INSERT [dbo].[Stock] ON 

INSERT [dbo].[Stock] ([id], [FruitName], [Qty], [QtyType]) VALUES (2, N'Kiwis', N'90', N'very gud')
INSERT [dbo].[Stock] ([id], [FruitName], [Qty], [QtyType]) VALUES (3, N'Best Fruit', N'100', N'Number')
INSERT [dbo].[Stock] ([id], [FruitName], [Qty], [QtyType]) VALUES (4, N't', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Stock] OFF
USE [master]
GO
ALTER DATABASE [FruitSeller] SET  READ_WRITE 
GO
