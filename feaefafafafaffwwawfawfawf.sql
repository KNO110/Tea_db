USE [master]
GO
/****** Object:  Database [TEST4]    Script Date: 14.03.2024 18:34:17 ******/
CREATE DATABASE [TEST4]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TEST4', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TEST4.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TEST4_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TEST4_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TEST4] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TEST4].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TEST4] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TEST4] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TEST4] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TEST4] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TEST4] SET ARITHABORT OFF 
GO
ALTER DATABASE [TEST4] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TEST4] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TEST4] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TEST4] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TEST4] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TEST4] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TEST4] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TEST4] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TEST4] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TEST4] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TEST4] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TEST4] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TEST4] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TEST4] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TEST4] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TEST4] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TEST4] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TEST4] SET RECOVERY FULL 
GO
ALTER DATABASE [TEST4] SET  MULTI_USER 
GO
ALTER DATABASE [TEST4] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TEST4] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TEST4] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TEST4] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TEST4] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TEST4] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TEST4', N'ON'
GO
ALTER DATABASE [TEST4] SET QUERY_STORE = ON
GO
ALTER DATABASE [TEST4] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TEST4]
GO
/****** Object:  Table [dbo].[Tea]    Script Date: 14.03.2024 18:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tea](
	[id] [int] NOT NULL,
	[name] [nvarchar](255) NULL,
	[description] [nvarchar](max) NULL,
	[origin_country] [nvarchar](100) NULL,
	[price] [decimal](10, 2) NULL,
	[quantity] [int] NULL,
	[weight_grams] [int] NULL,
	[tea_type] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Tea] ([id], [name], [description], [origin_country], [price], [quantity], [weight_grams], [tea_type]) VALUES (1, N'Чай "Душевный"', N'Ароматный чай для затишного вечора.', N'Китай', CAST(9.99 AS Decimal(10, 2)), 80, 40, N'Чорний')
INSERT [dbo].[Tea] ([id], [name], [description], [origin_country], [price], [quantity], [weight_grams], [tea_type]) VALUES (2, N'Зелений чай "Весенний рассвет"', N'Свіжий і освіжаючий зелений чай з нотками весняного цвітіння.', N'Японія', CAST(12.99 AS Decimal(10, 2)), 90, 35, N'Зелений')
INSERT [dbo].[Tea] ([id], [name], [description], [origin_country], [price], [quantity], [weight_grams], [tea_type]) VALUES (3, N'Чорний чай "Ранок на фермі"', N'Міцний і відпочиваючий чорний чай для початку дня.', N'Індія', CAST(11.49 AS Decimal(10, 2)), 100, 45, N'Чорний')
INSERT [dbo].[Tea] ([id], [name], [description], [origin_country], [price], [quantity], [weight_grams], [tea_type]) VALUES (4, N'Оолонг "Східний вітер"', N'Ніжний і легкий оолонг з вишуканими смаковими відтінками.', N'Китай', CAST(14.79 AS Decimal(10, 2)), 110, 50, N'Оолонг')
INSERT [dbo].[Tea] ([id], [name], [description], [origin_country], [price], [quantity], [weight_grams], [tea_type]) VALUES (5, N'Білий чай "Літній ранок"', N'Легкий і освіжаючий білий чай для літнього ранку.', N'Індія', CAST(13.99 AS Decimal(10, 2)), 95, 30, N'Білий')
INSERT [dbo].[Tea] ([id], [name], [description], [origin_country], [price], [quantity], [weight_grams], [tea_type]) VALUES (10, N'Хех', N'Чеел', N'Абобус', CAST(12.00 AS Decimal(10, 2)), 1, 5, N'Трава')
GO
USE [master]
GO
ALTER DATABASE [TEST4] SET  READ_WRITE 
GO
