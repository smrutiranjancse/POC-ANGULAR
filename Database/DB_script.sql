USE [master]
GO
/****** Object:  Database [DB]    Script Date: 18-04-2021 22:23:55 ******/
CREATE DATABASE [DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB] SET RECOVERY FULL 
GO
ALTER DATABASE [DB] SET  MULTI_USER 
GO
ALTER DATABASE [DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB', N'ON'
GO
ALTER DATABASE [DB] SET QUERY_STORE = OFF
GO
USE [DB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 18-04-2021 22:23:56 ******/
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
/****** Object:  Table [dbo].[DeliveryMethods]    Script Date: 18-04-2021 22:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryMethods](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ShortName] [nvarchar](max) NULL,
	[DeliveryTime] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [int] NOT NULL,
 CONSTRAINT [PK_DeliveryMethods] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 18-04-2021 22:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemOrdered_ProductItemId] [int] NULL,
	[ItemOrdered_ProductName] [nvarchar](max) NULL,
	[ItemOrdered_PictureUrl] [nvarchar](max) NULL,
	[Price] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[OrderId] [int] NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 18-04-2021 22:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BuyerEmail] [nvarchar](max) NULL,
	[OrderDate] [datetimeoffset](7) NOT NULL,
	[ShipToAddress_FirstName] [nvarchar](max) NULL,
	[ShipToAddress_LastName] [nvarchar](max) NULL,
	[ShipToAddress_Street] [nvarchar](max) NULL,
	[ShipToAddress_City] [nvarchar](max) NULL,
	[ShipToAddress_State] [nvarchar](max) NULL,
	[ShipToAddress_ZipCode] [nvarchar](max) NULL,
	[DeliveryMethodId] [int] NULL,
	[Subtotal] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 18-04-2021 22:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Price] [int] NOT NULL,
	[PictureUrl] [nvarchar](max) NOT NULL,
	[ProductTypeId] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTypes]    Script Date: 18-04-2021 22:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_ProductTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210402083327_InitialCreate', N'5.0.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210412111812_OrderEntityAdded', N'5.0.3')
GO
SET IDENTITY_INSERT [dbo].[DeliveryMethods] ON 

INSERT [dbo].[DeliveryMethods] ([Id], [ShortName], [DeliveryTime], [Description], [Price]) VALUES (1, N'DT-1', NULL, N'Fastest Delivery', 10)
INSERT [dbo].[DeliveryMethods] ([Id], [ShortName], [DeliveryTime], [Description], [Price]) VALUES (2, N'DT-2', NULL, N'Get it within 7 days', 5)
INSERT [dbo].[DeliveryMethods] ([Id], [ShortName], [DeliveryTime], [Description], [Price]) VALUES (3, N'DT-3', NULL, N'Get it  within 15 days', 2)
INSERT [dbo].[DeliveryMethods] ([Id], [ShortName], [DeliveryTime], [Description], [Price]) VALUES (4, N'FREE', NULL, N'Free! You get what you pay for', 0)
SET IDENTITY_INSERT [dbo].[DeliveryMethods] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItems] ON 

INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_PictureUrl], [Price], [Quantity], [OrderId]) VALUES (1, 12, N'Broccoli', N'images/products/broccoli.jpg', 50, 1, 1)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_PictureUrl], [Price], [Quantity], [OrderId]) VALUES (2, 1, N'Brown Bread', N'images/products/brown-bread.jpg', 25, 2, 1)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_PictureUrl], [Price], [Quantity], [OrderId]) VALUES (3, 12, N'Broccoli', N'images/products/broccoli.jpg', 50, 1, 2)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_PictureUrl], [Price], [Quantity], [OrderId]) VALUES (4, 2, N'Banana Bread', N'images/products/banana-bread.jpg', 30, 2, 3)
SET IDENTITY_INSERT [dbo].[OrderItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [ShipToAddress_FirstName], [ShipToAddress_LastName], [ShipToAddress_Street], [ShipToAddress_City], [ShipToAddress_State], [ShipToAddress_ZipCode], [DeliveryMethodId], [Subtotal]) VALUES (1, N'smruti@test.com', CAST(N'2021-04-13T20:46:35.5339605+05:30' AS DateTimeOffset), N'Smruti', N'Ranjan', N'St. Mother Teresa Road', N'Bhubaneswar', N'Odisha', N'751007', 1, 100)
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [ShipToAddress_FirstName], [ShipToAddress_LastName], [ShipToAddress_Street], [ShipToAddress_City], [ShipToAddress_State], [ShipToAddress_ZipCode], [DeliveryMethodId], [Subtotal]) VALUES (2, N'smruti@test.com', CAST(N'2021-04-13T22:12:50.6710057+05:30' AS DateTimeOffset), N'Smruti', N'Ranjan', N'St. Mother Teresa Road', N'Bhubaneswar', N'Odisha', N'751007', 2, 50)
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [ShipToAddress_FirstName], [ShipToAddress_LastName], [ShipToAddress_Street], [ShipToAddress_City], [ShipToAddress_State], [ShipToAddress_ZipCode], [DeliveryMethodId], [Subtotal]) VALUES (3, N'smruti@test.com', CAST(N'2021-04-14T00:31:18.5032431+05:30' AS DateTimeOffset), N'Smruti', N'Ranjan', N'St. Mother Teresa Road', N'Bhubaneswar', N'Odisha', N'751007', 2, 60)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [ProductTypeId]) VALUES (1, N'Brown Bread', N'Made with significant amounts of whole grain flour, usually wheat, and sometimes dark-coloured ingredients such as molasses or coffee. It provides fibre, protein, iron, potassium and many other nutrients.', 25, N'images/products/brown-bread.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [ProductTypeId]) VALUES (2, N'Banana Bread', N'Made from mashed bananas, these are often a moist, dense, sweet, cake-like quick bread, usually chemically leavened with baking soda or powder.', 30, N'images/products/banana-bread.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [ProductTypeId]) VALUES (3, N'Milk Bread', N'Soft, light textured with a soft crust and round type of bread made using milk instead of water, as well as white flour, yeast and sugar.', 20, N'images/products/milk-bread.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [ProductTypeId]) VALUES (4, N'Ghee', N'Sourced from milk of indigenous cows bred and is 100% pure and nourishing. Contains fat soluble vitamins and helps in boosting immunity.', 600, N'images/products/ghee.jpg', 2)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [ProductTypeId]) VALUES (6, N'Cheese', N'Derived from pure milk and forms by coagulation of the milk protein casein. It comprises proteins and fat from milk, adds a distinctive taste and is absolutely delicious.', 130, N'images/products/cheese.jpg', 2)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [ProductTypeId]) VALUES (7, N'Butter', N'Made from the fat and protein components of milk or cream, it''s a pasteurized and vegetarian product. It is a semi-solid emulsion at room temperature, consisting of approximately 80% butterfat.', 60, N'images/products/butter.jpg', 2)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [ProductTypeId]) VALUES (8, N'Strawberry', N'They’re an excellent source of vitamin C and manganese and also contain decent amounts of Vitamin B9 and potassium. ', 250, N'images/products/strawberry.jpg', 3)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [ProductTypeId]) VALUES (9, N'Grapes', N'Packed with nutrients and minerals, especially Vitamins C and K. Makes a popular snack because of its sweet flavour. Comes in safe and secure packing.

', 80, N'images/products/grapes.jpg', 3)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [ProductTypeId]) VALUES (10, N'Mango', N'Fresh and natural mangoes shipped directly from the farm. Low in calories yet high in nutrients. Aids immunity, iron absorption and growth and repair. ', 120, N'images/products/mango.jpg', 3)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [ProductTypeId]) VALUES (11, N'Onion', N'Packed with nutrients, these are nutrient-dense, meaning they''re low in calories but high in vitamins and minerals.', 40, N'images/products/onion.jpg', 4)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [ProductTypeId]) VALUES (12, N'Broccoli', N'100% genuine and adulteration-free product. Good source of fibre and protein, and contains iron, potassium, calcium, selenium and magnesium as well as vitamins. ', 50, N'images/products/broccoli.jpg', 4)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [ProductTypeId]) VALUES (13, N'Spinach', N'Rich in nutrients and has low fat and calories. Can be used in curries, soups and salads. Store in refrigerator at a temperature of 0-5 degree Celsius.', 30, N'images/products/spinach.jpg', 4)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductTypes] ON 

INSERT [dbo].[ProductTypes] ([Id], [Name]) VALUES (1, N'Bread')
INSERT [dbo].[ProductTypes] ([Id], [Name]) VALUES (2, N'Dairy')
INSERT [dbo].[ProductTypes] ([Id], [Name]) VALUES (3, N'Fruits')
INSERT [dbo].[ProductTypes] ([Id], [Name]) VALUES (4, N'Vegetables')
SET IDENTITY_INSERT [dbo].[ProductTypes] OFF
GO
/****** Object:  Index [IX_OrderItems_OrderId]    Script Date: 18-04-2021 22:23:56 ******/
CREATE NONCLUSTERED INDEX [IX_OrderItems_OrderId] ON [dbo].[OrderItems]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_DeliveryMethodId]    Script Date: 18-04-2021 22:23:56 ******/
CREATE NONCLUSTERED INDEX [IX_Orders_DeliveryMethodId] ON [dbo].[Orders]
(
	[DeliveryMethodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_ProductTypeId]    Script Date: 18-04-2021 22:23:56 ******/
CREATE NONCLUSTERED INDEX [IX_Products_ProductTypeId] ON [dbo].[Products]
(
	[ProductTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (N'') FOR [Name]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (N'') FOR [Description]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (N'') FOR [PictureUrl]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Orders_OrderId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_DeliveryMethods_DeliveryMethodId] FOREIGN KEY([DeliveryMethodId])
REFERENCES [dbo].[DeliveryMethods] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_DeliveryMethods_DeliveryMethodId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductTypes_ProductTypeId] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[ProductTypes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductTypes_ProductTypeId]
GO
USE [master]
GO
ALTER DATABASE [DB] SET  READ_WRITE 
GO
