USE [master]
GO
/****** Object:  Database [EnocaNLayerDb]    Script Date: 25.01.2023 21:12:22 ******/
CREATE DATABASE [EnocaNLayerDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EnocaNLayerDb', FILENAME = N'C:\Users\Elif\EnocaNLayerDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EnocaNLayerDb_log', FILENAME = N'C:\Users\Elif\EnocaNLayerDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [EnocaNLayerDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EnocaNLayerDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EnocaNLayerDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EnocaNLayerDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EnocaNLayerDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EnocaNLayerDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EnocaNLayerDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [EnocaNLayerDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [EnocaNLayerDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EnocaNLayerDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EnocaNLayerDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EnocaNLayerDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EnocaNLayerDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EnocaNLayerDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EnocaNLayerDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EnocaNLayerDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EnocaNLayerDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EnocaNLayerDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EnocaNLayerDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EnocaNLayerDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EnocaNLayerDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EnocaNLayerDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EnocaNLayerDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [EnocaNLayerDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EnocaNLayerDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EnocaNLayerDb] SET  MULTI_USER 
GO
ALTER DATABASE [EnocaNLayerDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EnocaNLayerDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EnocaNLayerDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EnocaNLayerDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EnocaNLayerDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EnocaNLayerDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [EnocaNLayerDb] SET QUERY_STORE = OFF
GO
USE [EnocaNLayerDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 25.01.2023 21:12:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Firms]    Script Date: 25.01.2023 21:12:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Firms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirmName] [nvarchar](150) NOT NULL,
	[ValidationState] [bit] NOT NULL,
	[OrderStartTime] [datetime2](7) NOT NULL,
	[OrderEndTime] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[UpdateDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Firms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 25.01.2023 21:12:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](200) NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[ProductId] [int] NOT NULL,
	[FirmId] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[UpdateDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 25.01.2023 21:12:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](200) NOT NULL,
	[FirmId] [int] NOT NULL,
	[Stock] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[UpdateDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230124225453_Init', N'6.0.1')
GO
SET IDENTITY_INSERT [dbo].[Firms] ON 

INSERT [dbo].[Firms] ([Id], [FirmName], [ValidationState], [OrderStartTime], [OrderEndTime], [CreatedDate], [UpdateDate]) VALUES (3, N'Yemek Sepeti', 1, CAST(N'2023-01-25T09:00:00.0000000' AS DateTime2), CAST(N'2023-01-25T15:00:00.0000000' AS DateTime2), CAST(N'2023-01-25T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Firms] ([Id], [FirmName], [ValidationState], [OrderStartTime], [OrderEndTime], [CreatedDate], [UpdateDate]) VALUES (5, N'Getir', 0, CAST(N'2023-01-25T09:00:00.0000000' AS DateTime2), CAST(N'2023-01-25T15:00:00.0000000' AS DateTime2), CAST(N'2023-01-25T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Firms] ([Id], [FirmName], [ValidationState], [OrderStartTime], [OrderEndTime], [CreatedDate], [UpdateDate]) VALUES (7, N'Amazon', 1, CAST(N'2023-01-25T15:00:00.0000000' AS DateTime2), CAST(N'2023-01-25T22:00:00.0000000' AS DateTime2), CAST(N'2023-01-25T14:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Firms] ([Id], [FirmName], [ValidationState], [OrderStartTime], [OrderEndTime], [CreatedDate], [UpdateDate]) VALUES (8, N'Hepsi Burada', 0, CAST(N'2023-01-25T18:00:00.0850000' AS DateTime2), CAST(N'2023-01-25T21:59:59.0850000' AS DateTime2), CAST(N'2023-01-25T13:54:06.7634383' AS DateTime2), NULL)
INSERT [dbo].[Firms] ([Id], [FirmName], [ValidationState], [OrderStartTime], [OrderEndTime], [CreatedDate], [UpdateDate]) VALUES (9, N'N11', 1, CAST(N'2023-01-25T10:00:00.2350000' AS DateTime2), CAST(N'2023-01-25T23:59:59.2350000' AS DateTime2), CAST(N'2023-01-25T13:57:08.5146177' AS DateTime2), NULL)
INSERT [dbo].[Firms] ([Id], [FirmName], [ValidationState], [OrderStartTime], [OrderEndTime], [CreatedDate], [UpdateDate]) VALUES (11, N'Casper', 1, CAST(N'2023-01-25T11:17:08.6970000' AS DateTime2), CAST(N'2023-01-25T11:17:08.6970000' AS DateTime2), CAST(N'2023-01-25T14:17:52.9313037' AS DateTime2), NULL)
INSERT [dbo].[Firms] ([Id], [FirmName], [ValidationState], [OrderStartTime], [OrderEndTime], [CreatedDate], [UpdateDate]) VALUES (12, N'string2', 1, CAST(N'2023-01-25T13:28:48.9090000' AS DateTime2), CAST(N'2023-01-25T14:28:48.9090000' AS DateTime2), CAST(N'2023-01-25T16:28:55.8234917' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Firms] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [CustomerName], [OrderDate], [ProductId], [FirmId], [CreatedDate], [UpdateDate]) VALUES (1, N'Elif Bölük', CAST(N'2023-01-25T10:46:47.1340000' AS DateTime2), 1, 3, CAST(N'2023-01-25T13:47:17.8231514' AS DateTime2), NULL)
INSERT [dbo].[Orders] ([Id], [CustomerName], [OrderDate], [ProductId], [FirmId], [CreatedDate], [UpdateDate]) VALUES (2, N'Aslı Yıldız', CAST(N'2023-01-25T10:00:00.0000000' AS DateTime2), 1, 3, CAST(N'2023-01-25T10:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Orders] ([Id], [CustomerName], [OrderDate], [ProductId], [FirmId], [CreatedDate], [UpdateDate]) VALUES (3, N'Sema Ay', CAST(N'2023-01-25T14:33:02.1138439' AS DateTime2), 1, 3, CAST(N'2023-01-25T14:33:02.1138462' AS DateTime2), NULL)
INSERT [dbo].[Orders] ([Id], [CustomerName], [OrderDate], [ProductId], [FirmId], [CreatedDate], [UpdateDate]) VALUES (4, N'Melisa Güneş', CAST(N'2023-01-25T20:08:42.7037909' AS DateTime2), 3, 7, CAST(N'2023-01-25T20:08:42.7037930' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [ProductName], [FirmId], [Stock], [Price], [CreatedDate], [UpdateDate]) VALUES (1, N'Pizza', 3, 10, CAST(100.00 AS Decimal(18, 2)), CAST(N'2023-01-25T09:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Products] ([Id], [ProductName], [FirmId], [Stock], [Price], [CreatedDate], [UpdateDate]) VALUES (2, N'Hamburger', 3, 15, CAST(110.00 AS Decimal(18, 2)), CAST(N'2023-01-25T09:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Products] ([Id], [ProductName], [FirmId], [Stock], [Price], [CreatedDate], [UpdateDate]) VALUES (3, N'Su', 5, 200, CAST(150.00 AS Decimal(18, 2)), CAST(N'2023-01-25T09:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Products] ([Id], [ProductName], [FirmId], [Stock], [Price], [CreatedDate], [UpdateDate]) VALUES (4, N'Kalem', 5, 70, CAST(45.00 AS Decimal(18, 2)), CAST(N'2023-01-25T09:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Products] ([Id], [ProductName], [FirmId], [Stock], [Price], [CreatedDate], [UpdateDate]) VALUES (5, N'Kitap', 7, 50, CAST(80.00 AS Decimal(18, 2)), CAST(N'2023-01-25T09:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Products] ([Id], [ProductName], [FirmId], [Stock], [Price], [CreatedDate], [UpdateDate]) VALUES (6, N'Mum', 7, 100, CAST(50.00 AS Decimal(18, 2)), CAST(N'2023-01-25T10:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Products] ([Id], [ProductName], [FirmId], [Stock], [Price], [CreatedDate], [UpdateDate]) VALUES (7, N'oje', 5, 5, CAST(50.00 AS Decimal(18, 2)), CAST(N'2023-01-25T17:15:48.3240853' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
/****** Object:  Index [IX_Products_FirmId]    Script Date: 25.01.2023 21:12:22 ******/
CREATE NONCLUSTERED INDEX [IX_Products_FirmId] ON [dbo].[Products]
(
	[FirmId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Firms_FirmId] FOREIGN KEY([FirmId])
REFERENCES [dbo].[Firms] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Firms_FirmId]
GO
USE [master]
GO
ALTER DATABASE [EnocaNLayerDb] SET  READ_WRITE 
GO
