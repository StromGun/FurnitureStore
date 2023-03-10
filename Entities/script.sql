USE [master]
GO
/****** Object:  Database [FurnitureStore]    Script Date: 10.01.2023 23:09:58 ******/
CREATE DATABASE [FurnitureStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FurnitureStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FurnitureStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FurnitureStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FurnitureStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FurnitureStore] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FurnitureStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FurnitureStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FurnitureStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FurnitureStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FurnitureStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FurnitureStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [FurnitureStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FurnitureStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FurnitureStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FurnitureStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FurnitureStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FurnitureStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FurnitureStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FurnitureStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FurnitureStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FurnitureStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FurnitureStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FurnitureStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FurnitureStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FurnitureStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FurnitureStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FurnitureStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FurnitureStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FurnitureStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FurnitureStore] SET  MULTI_USER 
GO
ALTER DATABASE [FurnitureStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FurnitureStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FurnitureStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FurnitureStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FurnitureStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FurnitureStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FurnitureStore] SET QUERY_STORE = OFF
GO
USE [FurnitureStore]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 10.01.2023 23:09:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Login] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Checks]    Script Date: 10.01.2023 23:09:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Checks](
	[Check_number] [int] IDENTITY(1,1) NOT NULL,
	[Seller_number] [int] NOT NULL,
	[Date_of_sale] [date] NOT NULL,
 CONSTRAINT [PK_Checks] PRIMARY KEY CLUSTERED 
(
	[Check_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturers]    Script Date: 10.01.2023 23:09:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturers](
	[Manufacturer_number] [int] IDENTITY(1,1) NOT NULL,
	[Manufacturer_name] [nvarchar](max) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Manufacturers] PRIMARY KEY CLUSTERED 
(
	[Manufacturer_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 10.01.2023 23:09:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
 CONSTRAINT [PK_OrderProduct] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 10.01.2023 23:09:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DateOrder] [date] NOT NULL,
	[Cost] [money] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 10.01.2023 23:09:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Product_number] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[ProductType] [int] NOT NULL,
	[Manufacturer_number] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[Guarantee_period] [date] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Product_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 10.01.2023 23:09:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sellers]    Script Date: 10.01.2023 23:09:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sellers](
	[Seller_number] [int] IDENTITY(1,1) NOT NULL,
	[First_name] [nvarchar](50) NOT NULL,
	[Last_name] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Birthday] [date] NOT NULL,
	[Date_of_receipt] [date] NOT NULL,
 CONSTRAINT [PK_Sellers] PRIMARY KEY CLUSTERED 
(
	[Seller_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([Login], [Password]) VALUES (N'1', N'1')
GO
SET IDENTITY_INSERT [dbo].[Checks] ON 

INSERT [dbo].[Checks] ([Check_number], [Seller_number], [Date_of_sale]) VALUES (1, 1, CAST(N'2021-02-05' AS Date))
INSERT [dbo].[Checks] ([Check_number], [Seller_number], [Date_of_sale]) VALUES (2, 2, CAST(N'2022-07-17' AS Date))
INSERT [dbo].[Checks] ([Check_number], [Seller_number], [Date_of_sale]) VALUES (3, 3, CAST(N'2020-12-19' AS Date))
SET IDENTITY_INSERT [dbo].[Checks] OFF
GO
SET IDENTITY_INSERT [dbo].[Manufacturers] ON 

INSERT [dbo].[Manufacturers] ([Manufacturer_number], [Manufacturer_name], [Country], [City]) VALUES (1, N'Максим', N'Россия', N'Пермь')
INSERT [dbo].[Manufacturers] ([Manufacturer_number], [Manufacturer_name], [Country], [City]) VALUES (2, N'Семён', N'Россия', N'Кунгур')
INSERT [dbo].[Manufacturers] ([Manufacturer_number], [Manufacturer_name], [Country], [City]) VALUES (3, N'Дмитрий', N'Россия', N'Шадейка')
INSERT [dbo].[Manufacturers] ([Manufacturer_number], [Manufacturer_name], [Country], [City]) VALUES (4, N'Alicia', N'Чехия', N'Прага')
INSERT [dbo].[Manufacturers] ([Manufacturer_number], [Manufacturer_name], [Country], [City]) VALUES (5, N'Глазовская мебельная фабрика «Глазов»', N'Россия', N'Москва')
INSERT [dbo].[Manufacturers] ([Manufacturer_number], [Manufacturer_name], [Country], [City]) VALUES (6, N'Ивару', N'Россия', N'Волгоград')
INSERT [dbo].[Manufacturers] ([Manufacturer_number], [Manufacturer_name], [Country], [City]) VALUES (7, N'Ижмебель', N'Россия', N'Воронеж')
INSERT [dbo].[Manufacturers] ([Manufacturer_number], [Manufacturer_name], [Country], [City]) VALUES (8, N'Леко', N'Россия', N'Москва')
INSERT [dbo].[Manufacturers] ([Manufacturer_number], [Manufacturer_name], [Country], [City]) VALUES (9, N'МСТ.Мебель', N'Россия', N'Москва')
INSERT [dbo].[Manufacturers] ([Manufacturer_number], [Manufacturer_name], [Country], [City]) VALUES (10, N'Моби', N'Россия', N'Брянск')
INSERT [dbo].[Manufacturers] ([Manufacturer_number], [Manufacturer_name], [Country], [City]) VALUES (11, N'Модерн', N'Россия', N'Москва')
INSERT [dbo].[Manufacturers] ([Manufacturer_number], [Manufacturer_name], [Country], [City]) VALUES (12, N'Риннэр', N'Россия', N'Пермь')
INSERT [dbo].[Manufacturers] ([Manufacturer_number], [Manufacturer_name], [Country], [City]) VALUES (13, N'Сакура', N'Беларусь', N'Минск')
INSERT [dbo].[Manufacturers] ([Manufacturer_number], [Manufacturer_name], [Country], [City]) VALUES (14, N'Сильва', N'Россия', N'Москва')
INSERT [dbo].[Manufacturers] ([Manufacturer_number], [Manufacturer_name], [Country], [City]) VALUES (15, N'ТЭКС', N'Россия', N'Санк-Петербург')
SET IDENTITY_INSERT [dbo].[Manufacturers] OFF
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID]) VALUES (1, 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID]) VALUES (1, 2)
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([ID], [DateOrder], [Cost]) VALUES (1, CAST(N'2022-05-06' AS Date), 53.0000)
INSERT [dbo].[Orders] ([ID], [DateOrder], [Cost]) VALUES (2, CAST(N'2022-06-05' AS Date), 4215.0000)
INSERT [dbo].[Orders] ([ID], [DateOrder], [Cost]) VALUES (3, CAST(N'2022-06-06' AS Date), 4650.0000)
INSERT [dbo].[Orders] ([ID], [DateOrder], [Cost]) VALUES (4, CAST(N'2022-07-09' AS Date), 5000.0000)
INSERT [dbo].[Orders] ([ID], [DateOrder], [Cost]) VALUES (5, CAST(N'2022-05-08' AS Date), 500.0000)
INSERT [dbo].[Orders] ([ID], [DateOrder], [Cost]) VALUES (6, CAST(N'2022-05-08' AS Date), 530.0000)
INSERT [dbo].[Orders] ([ID], [DateOrder], [Cost]) VALUES (7, CAST(N'2022-05-08' AS Date), 570.0000)
INSERT [dbo].[Orders] ([ID], [DateOrder], [Cost]) VALUES (8, CAST(N'2022-05-08' AS Date), 800.0000)
INSERT [dbo].[Orders] ([ID], [DateOrder], [Cost]) VALUES (9, CAST(N'2022-05-08' AS Date), 5500.0000)
INSERT [dbo].[Orders] ([ID], [DateOrder], [Cost]) VALUES (10, CAST(N'2022-05-08' AS Date), 500.0000)
INSERT [dbo].[Orders] ([ID], [DateOrder], [Cost]) VALUES (11, CAST(N'2022-05-08' AS Date), 9000.0000)
INSERT [dbo].[Orders] ([ID], [DateOrder], [Cost]) VALUES (12, CAST(N'2022-05-08' AS Date), 580.0000)
INSERT [dbo].[Orders] ([ID], [DateOrder], [Cost]) VALUES (13, CAST(N'2022-05-08' AS Date), 1000.0000)
INSERT [dbo].[Orders] ([ID], [DateOrder], [Cost]) VALUES (14, CAST(N'2022-05-09' AS Date), 100.0000)
INSERT [dbo].[Orders] ([ID], [DateOrder], [Cost]) VALUES (15, CAST(N'2022-05-09' AS Date), 730.0000)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Product_number], [Name], [ProductType], [Manufacturer_number], [Price], [Guarantee_period]) VALUES (1, N'Шкаф', 8, 1, 500.0000, CAST(N'2021-03-05' AS Date))
INSERT [dbo].[Products] ([Product_number], [Name], [ProductType], [Manufacturer_number], [Price], [Guarantee_period]) VALUES (2, N'Табуретка', 2, 2, 150.0000, CAST(N'2022-08-17' AS Date))
INSERT [dbo].[Products] ([Product_number], [Name], [ProductType], [Manufacturer_number], [Price], [Guarantee_period]) VALUES (3, N'Стол', 1, 3, 250.0000, CAST(N'2021-01-09' AS Date))
INSERT [dbo].[Products] ([Product_number], [Name], [ProductType], [Manufacturer_number], [Price], [Guarantee_period]) VALUES (4, N'Комод', 4, 2, 150.0000, CAST(N'2022-05-07' AS Date))
INSERT [dbo].[Products] ([Product_number], [Name], [ProductType], [Manufacturer_number], [Price], [Guarantee_period]) VALUES (5, N'Кровать Астор с ПМ (1600?2000) (Легенд Вайт)', 3, 1, 27143.0000, CAST(N'2025-05-06' AS Date))
INSERT [dbo].[Products] ([Product_number], [Name], [ProductType], [Manufacturer_number], [Price], [Guarantee_period]) VALUES (6, N'Кровать Палермо-3 1400 с подъемным механизмом', 3, 1, 20143.0000, CAST(N'2025-09-08' AS Date))
INSERT [dbo].[Products] ([Product_number], [Name], [ProductType], [Manufacturer_number], [Price], [Guarantee_period]) VALUES (7, N'Кровать Веста (900?2000) Ясень шимо светлый', 3, 2, 4643.0000, CAST(N'2023-05-06' AS Date))
INSERT [dbo].[Products] ([Product_number], [Name], [ProductType], [Manufacturer_number], [Price], [Guarantee_period]) VALUES (8, N'Кровать Веста (900?2000) Ясень шимо темный', 3, 2, 27143.0000, CAST(N'2023-05-06' AS Date))
INSERT [dbo].[Products] ([Product_number], [Name], [ProductType], [Manufacturer_number], [Price], [Guarantee_period]) VALUES (9, N'Кровать Люкс Sherlock 48 (1400?2000)', 3, 3, 8643.0000, CAST(N'2024-05-06' AS Date))
INSERT [dbo].[Products] ([Product_number], [Name], [ProductType], [Manufacturer_number], [Price], [Guarantee_period]) VALUES (10, N'BAUHAUS 4 Кровать (1200)', 3, 5, 5143.0000, CAST(N'2023-04-03' AS Date))
INSERT [dbo].[Products] ([Product_number], [Name], [ProductType], [Manufacturer_number], [Price], [Guarantee_period]) VALUES (11, N'Кровать Люкс Sherlock 50 (900?2000)', 3, 8, 6143.0000, CAST(N'2024-05-06' AS Date))
INSERT [dbo].[Products] ([Product_number], [Name], [ProductType], [Manufacturer_number], [Price], [Guarantee_period]) VALUES (12, N'Шкаф МЦН 8 Комфорт Дуб золотистый/Графит', 9, 6, 6143.0000, CAST(N'2024-05-06' AS Date))
INSERT [dbo].[Products] ([Product_number], [Name], [ProductType], [Manufacturer_number], [Price], [Guarantee_period]) VALUES (13, N'Тумба прикроватная Brownie 41 (Мокко/Белый)', 7, 4, 6965.0000, CAST(N'2024-09-04' AS Date))
INSERT [dbo].[Products] ([Product_number], [Name], [ProductType], [Manufacturer_number], [Price], [Guarantee_period]) VALUES (14, N'Тумба прикроватная «Амели»', 7, 8, 4743.0000, CAST(N'2024-07-01' AS Date))
INSERT [dbo].[Products] ([Product_number], [Name], [ProductType], [Manufacturer_number], [Price], [Guarantee_period]) VALUES (15, N'Тумба прикроватная Линда (Легенд Вайт)', 7, 11, 7243.0000, CAST(N'2024-05-06' AS Date))
INSERT [dbo].[Products] ([Product_number], [Name], [ProductType], [Manufacturer_number], [Price], [Guarantee_period]) VALUES (16, N'Тумба прикроватная Палермо-3', 7, 12, 2343.0000, CAST(N'2024-02-06' AS Date))
INSERT [dbo].[Products] ([Product_number], [Name], [ProductType], [Manufacturer_number], [Price], [Guarantee_period]) VALUES (17, N'Тумба ТВ малая «BEST» мод.№ 1.2', 11, 9, 5443.0000, CAST(N'2026-07-06' AS Date))
INSERT [dbo].[Products] ([Product_number], [Name], [ProductType], [Manufacturer_number], [Price], [Guarantee_period]) VALUES (18, N'Тумба под ТВ Гринвич 08.115', 11, 8, 2343.0000, CAST(N'2026-06-09' AS Date))
INSERT [dbo].[Products] ([Product_number], [Name], [ProductType], [Manufacturer_number], [Price], [Guarantee_period]) VALUES (19, N'Бьянка Тумба ТВ', 11, 6, 8943.0000, CAST(N'2026-03-06' AS Date))
INSERT [dbo].[Products] ([Product_number], [Name], [ProductType], [Manufacturer_number], [Price], [Guarantee_period]) VALUES (20, N'Тумба для телеаппаратуры Танго 14', 11, 14, 10643.0000, CAST(N'2026-05-06' AS Date))
INSERT [dbo].[Products] ([Product_number], [Name], [ProductType], [Manufacturer_number], [Price], [Guarantee_period]) VALUES (21, N'«SHERLOCK» Тумба ТВ 3', 11, 2, 5643.0000, CAST(N'2026-05-06' AS Date))
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([ID], [Name]) VALUES (1, N'Стол')
INSERT [dbo].[ProductType] ([ID], [Name]) VALUES (2, N'Стул')
INSERT [dbo].[ProductType] ([ID], [Name]) VALUES (3, N'Кровать')
INSERT [dbo].[ProductType] ([ID], [Name]) VALUES (4, N'Комод')
INSERT [dbo].[ProductType] ([ID], [Name]) VALUES (5, N'Полка')
INSERT [dbo].[ProductType] ([ID], [Name]) VALUES (6, N'Диван')
INSERT [dbo].[ProductType] ([ID], [Name]) VALUES (7, N'Тумба прикроватная')
INSERT [dbo].[ProductType] ([ID], [Name]) VALUES (8, N'Шкаф для белья')
INSERT [dbo].[ProductType] ([ID], [Name]) VALUES (9, N'Шкаф для одежды')
INSERT [dbo].[ProductType] ([ID], [Name]) VALUES (10, N'Стеллаж')
INSERT [dbo].[ProductType] ([ID], [Name]) VALUES (11, N'Тумбы ТВ')
INSERT [dbo].[ProductType] ([ID], [Name]) VALUES (12, N'Стол обеденный')
INSERT [dbo].[ProductType] ([ID], [Name]) VALUES (13, N'Компьютерный стол')
INSERT [dbo].[ProductType] ([ID], [Name]) VALUES (14, N'Кресло')
INSERT [dbo].[ProductType] ([ID], [Name]) VALUES (15, N'Угловой диван')
SET IDENTITY_INSERT [dbo].[ProductType] OFF
GO
SET IDENTITY_INSERT [dbo].[Sellers] ON 

INSERT [dbo].[Sellers] ([Seller_number], [First_name], [Last_name], [Patronymic], [Birthday], [Date_of_receipt]) VALUES (1, N'Дмитрий', N'Катаев', N'Денисович', CAST(N'2002-08-13' AS Date), CAST(N'2020-09-24' AS Date))
INSERT [dbo].[Sellers] ([Seller_number], [First_name], [Last_name], [Patronymic], [Birthday], [Date_of_receipt]) VALUES (2, N'Иван', N'Катаев', N'Денисович', CAST(N'2002-08-13' AS Date), CAST(N'2020-10-26' AS Date))
INSERT [dbo].[Sellers] ([Seller_number], [First_name], [Last_name], [Patronymic], [Birthday], [Date_of_receipt]) VALUES (3, N'Семён', N'Коновалов', N'Игоревич', CAST(N'2001-07-29' AS Date), CAST(N'2019-03-07' AS Date))
SET IDENTITY_INSERT [dbo].[Sellers] OFF
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Orders]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([Product_number])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Manufacturers] FOREIGN KEY([Manufacturer_number])
REFERENCES [dbo].[Manufacturers] ([Manufacturer_number])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Manufacturers]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductType] FOREIGN KEY([ProductType])
REFERENCES [dbo].[ProductType] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductType]
GO
USE [master]
GO
ALTER DATABASE [FurnitureStore] SET  READ_WRITE 
GO
