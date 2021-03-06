USE [AssestManagement]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 12/10/2020 3:04:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_data]    Script Date: 12/10/2020 3:04:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_data](
	[Customer_id] [int] NOT NULL,
	[Customer_Name] [varchar](100) NOT NULL,
	[Credit_card_number] [varchar](25) NOT NULL,
	[Credit_card_number_encrypt] [varbinary](max) NULL,
 CONSTRAINT [Pkey3] PRIMARY KEY CLUSTERED 
(
	[Customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 12/10/2020 3:04:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 12/10/2020 3:04:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[City] [varchar](20) NOT NULL,
	[Department] [varchar](20) NOT NULL,
	[Gender] [varchar](6) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 12/10/2020 3:04:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Age] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[DepartmentId] [int] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Site_Asset]    Script Date: 12/10/2020 3:04:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Site_Asset](
	[Site] [varchar](10) NULL,
	[Facility] [varchar](10) NULL,
	[AssetType] [varchar](10) NULL,
	[Model] [varchar](20) NULL,
	[Asset] [varchar](50) NULL,
	[AssetDesc] [varchar](200) NULL,
	[AssetId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Site_Asset] PRIMARY KEY CLUSTERED 
(
	[AssetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_AssestMaster]    Script Date: 12/10/2020 3:04:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_AssestMaster](
	[AssetNo] [int] NOT NULL,
	[AssetType] [nvarchar](200) NULL,
	[AssignedDate] [date] NULL,
	[WarrantyEndDate] [date] NULL,
	[Status] [nvarchar](100) NULL,
	[AssetTaggedUser] [nvarchar](200) NULL,
	[Vendor] [nvarchar](200) NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_Tbl_AssestMaster] PRIMARY KEY CLUSTERED 
(
	[AssetNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_UserMaster]    Script Date: 12/10/2020 3:04:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_UserMaster](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserAddress] [nvarchar](100) NULL,
 CONSTRAINT [PK_Tbl_UserMaster] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDetail]    Script Date: 12/10/2020 3:04:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDetail](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserDetail] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cities] ON 

INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (1, N'New Delhi')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (2, N'Mumbai')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (3, N'Hyderabad')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (4, N'Chennai')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (5, N'Bengaluru')
SET IDENTITY_INSERT [dbo].[Cities] OFF
GO
INSERT [dbo].[Customer_data] ([Customer_id], [Customer_Name], [Credit_card_number], [Credit_card_number_encrypt]) VALUES (25665, N'mssqltips4', N'4545-58478-1245', 0x00223A1829A40C428DE7A22D486515A202000000CA8AF20D834B299A18DD87BF1064F461559137B1A330B34524281648D5C24EE316003613B43B2C141D90EE2EACC8F41F)
INSERT [dbo].[Customer_data] ([Customer_id], [Customer_Name], [Credit_card_number], [Credit_card_number_encrypt]) VALUES (74112, N'MSSQLTips2', N'2147-4574-8475', 0x00223A1829A40C428DE7A22D486515A20200000095E2527E4418E107C47254CD08D64A0BBC2D85993C3813A9CA7A6472F628AF93C8BD058760A9963AEDDA4206F572487D)
INSERT [dbo].[Customer_data] ([Customer_id], [Customer_Name], [Credit_card_number], [Credit_card_number_encrypt]) VALUES (74113, N'MSSQLTips3', N'4574-8475-2147', 0x00223A1829A40C428DE7A22D486515A2020000005D7493FD02B0D93529402438D452CD15738E7FFF6A2583780F546C4FA1967321E88CCCCACFBC059B0E6715CC10AA756B)
INSERT [dbo].[Customer_data] ([Customer_id], [Customer_Name], [Credit_card_number], [Credit_card_number_encrypt]) VALUES (74114, N'MSSQLTips4', N'2147-8475-4574', 0x00223A1829A40C428DE7A22D486515A20200000098DA9C19577A13CE03AA4A5DD2159549877BB543A25B53E74712C813798604DED5664A6A201D21A6450A4CD163095090)
INSERT [dbo].[Customer_data] ([Customer_id], [Customer_Name], [Credit_card_number], [Credit_card_number_encrypt]) VALUES (74115, N'MSSQLTips5', N'2157-1544-8875', 0x00223A1829A40C428DE7A22D486515A2020000007B644CB184F19126B9B8609A3A016EDE04EEB747533382E708129BBA2ACB34A68E450EABC4CAEEDD32198C029460B6BE)
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([DepartmentId], [DepartmentName]) VALUES (1, N'ACCOUNTING')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName]) VALUES (2, N'RESEARCH')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName]) VALUES (3, N'SALES')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName]) VALUES (4, N'OPERATIONS')
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([Id], [Name], [Email], [Age], [Address], [DepartmentId]) VALUES (5, N'prash', N'prashant16gr@gmail.com', N'44', N'teerr', 1)
INSERT [dbo].[Employees] ([Id], [Name], [Email], [Age], [Address], [DepartmentId]) VALUES (6, N'test', N'prashant16gr@gmail.com', N'52', N'erwr', 1)
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Site_Asset] ON 

INSERT [dbo].[Site_Asset] ([Site], [Facility], [AssetType], [Model], [Asset], [AssetDesc], [AssetId]) VALUES (N'Die Prep', N'DEFAULT', N'Class', N'ZPST', N'ZPST', N'Bond Tester', 1)
INSERT [dbo].[Site_Asset] ([Site], [Facility], [AssetType], [Model], [Asset], [AssetDesc], [AssetId]) VALUES (N'Die Prep', N'DEFAULT', N'Class', N'ZRPT', N'ZRPT', N'Rapitran-II', 2)
INSERT [dbo].[Site_Asset] ([Site], [Facility], [AssetType], [Model], [Asset], [AssetDesc], [AssetId]) VALUES (N'Die Prep', N'DEFAULT', N'Class', N'ZWBD', N'ZWBD', N'Wirebonder', 3)
INSERT [dbo].[Site_Asset] ([Site], [Facility], [AssetType], [Model], [Asset], [AssetDesc], [AssetId]) VALUES (N'Die Prep', N'DEFAULT', N'Resource', N'COVN', N'COVN001', N'Hafo Curing Oven Oven#1 [ECBU / FOPD]', 4)
INSERT [dbo].[Site_Asset] ([Site], [Facility], [AssetType], [Model], [Asset], [AssetDesc], [AssetId]) VALUES (N'Die Prep', N'DEFAULT', N'Resource', N'DMNT', N'DMNT002', N'Mounter-2 Nitto Denko [FOPD]', 5)
INSERT [dbo].[Site_Asset] ([Site], [Facility], [AssetType], [Model], [Asset], [AssetDesc], [AssetId]) VALUES (N'Die Prep', N'DEFAULT', N'Resource', N'DMNT', N'DMNT003', N'Mounter-3 Air Mounter [ECBU]', 6)
INSERT [dbo].[Site_Asset] ([Site], [Facility], [AssetType], [Model], [Asset], [AssetDesc], [AssetId]) VALUES (N'Die Prep', N'DEFAULT', N'Resource', N'DSAW', N'DSAW002', N'Saw#1 DAD-341 Disco Hi-Tec [FOPD]', 7)
INSERT [dbo].[Site_Asset] ([Site], [Facility], [AssetType], [Model], [Asset], [AssetDesc], [AssetId]) VALUES (N'Die Prep', N'DEFAULT', N'Resource', N'DSAW', N'DSAW003', N'Saw#3 DAD-341 Disco Hi-Tec [IPD]', 8)
INSERT [dbo].[Site_Asset] ([Site], [Facility], [AssetType], [Model], [Asset], [AssetDesc], [AssetId]) VALUES (N'Die Prep', N'DEFAULT', N'Resource', N'DSAW', N'DSAW005', N'Saw#1 DFD-641 Disco Hi-Tec [FOPD]', 9)
INSERT [dbo].[Site_Asset] ([Site], [Facility], [AssetType], [Model], [Asset], [AssetDesc], [AssetId]) VALUES (N'Die Prep', N'DEFAULT', N'Resource', N'DSAW', N'DSAW006', N'DAD-3350 Disco Hi Tec [FOPD]', 10)
INSERT [dbo].[Site_Asset] ([Site], [Facility], [AssetType], [Model], [Asset], [AssetDesc], [AssetId]) VALUES (N'Die Prep', N'DEFAULT', N'Resource', N'DSCB', N'DSCB002', N'Scriber-2 LSD-100 Loomis[FOPD]', 11)
INSERT [dbo].[Site_Asset] ([Site], [Facility], [AssetType], [Model], [Asset], [AssetDesc], [AssetId]) VALUES (N'Die Prep', N'DEFAULT', N'Resource', N'DSCB', N'DSCB003', N'Scriber-3 LSD-100 Loomis [FOPD]', 12)
INSERT [dbo].[Site_Asset] ([Site], [Facility], [AssetType], [Model], [Asset], [AssetDesc], [AssetId]) VALUES (N'Die Prep', N'DEFAULT', N'Resource', N'DWCS', N'DWCS001', N'Washer-5 EDC [FOPD]', 13)
INSERT [dbo].[Site_Asset] ([Site], [Facility], [AssetType], [Model], [Asset], [AssetDesc], [AssetId]) VALUES (N'Die Prep', N'DEFAULT', N'Resource', N'HESD', N'HESD001', N'ESD Zapper-1 ThermoScientific [FOPD]', 14)
INSERT [dbo].[Site_Asset] ([Site], [Facility], [AssetType], [Model], [Asset], [AssetDesc], [AssetId]) VALUES (N'Die Prep', N'DEFAULT', N'Resource', N'HESD', N'HESD002', N'ESD Zapper-2 OEM[FOPD]', 15)
INSERT [dbo].[Site_Asset] ([Site], [Facility], [AssetType], [Model], [Asset], [AssetDesc], [AssetId]) VALUES (N'Die Prep', N'DEFAULT', N'Resource', N'HOLS', N'HOLS001', N'HTOL-1 Burnin Oven Despatch[FOPD]', 16)
INSERT [dbo].[Site_Asset] ([Site], [Facility], [AssetType], [Model], [Asset], [AssetDesc], [AssetId]) VALUES (N'Die Prep', N'DEFAULT', N'Resource', N'HOLS', N'HOLS002', N'HTOL-2 Burin Oven Despatch[FOPD]', 17)
INSERT [dbo].[Site_Asset] ([Site], [Facility], [AssetType], [Model], [Asset], [AssetDesc], [AssetId]) VALUES (N'Die Prep', N'DEFAULT', N'Resource', N'HOLS', N'HOLS004', N'HTOL-4 Burnin Oven Espec [IPD]', 18)
INSERT [dbo].[Site_Asset] ([Site], [Facility], [AssetType], [Model], [Asset], [AssetDesc], [AssetId]) VALUES (N'Die Prep', N'DEFAULT', N'Resource', N'HOLS', N'HOLS005', N'WHTOL-5 Burnin Oven Espec [FOPD]', 19)
INSERT [dbo].[Site_Asset] ([Site], [Facility], [AssetType], [Model], [Asset], [AssetDesc], [AssetId]) VALUES (N'Die Prep', N'DEFAULT', N'Resource', N'HOLS', N'HOLS007', N'HTOL-7 Burnin Oven Cobis 2[FOPD]', 20)
INSERT [dbo].[Site_Asset] ([Site], [Facility], [AssetType], [Model], [Asset], [AssetDesc], [AssetId]) VALUES (N'Die Prep', N'DEFAULT', N'Resource', N'HOLS', N'HOLS008', N'HTOL-8 Burnin Oven ESA[IPD]', 21)
INSERT [dbo].[Site_Asset] ([Site], [Facility], [AssetType], [Model], [Asset], [AssetDesc], [AssetId]) VALUES (N'Die Prep', N'DEFAULT', N'Resource', N'HOLS', N'HOLS010', N'HTOL-10 M4 Burnin System Reltech[FOPD]', 22)
INSERT [dbo].[Site_Asset] ([Site], [Facility], [AssetType], [Model], [Asset], [AssetDesc], [AssetId]) VALUES (N'Die Prep', N'DEFAULT', N'Resource', N'HOLS', N'HOLS012', N'HTOL-12 Burnin Oven Cobis 2[FOPD]', 23)
INSERT [dbo].[Site_Asset] ([Site], [Facility], [AssetType], [Model], [Asset], [AssetDesc], [AssetId]) VALUES (N'Die Prep', N'DEFAULT', N'Resource', N'HOLS', N'HOLS013', N'HTOL-13 Burnin Oven Cobis 2[FOPD]', 24)
INSERT [dbo].[Site_Asset] ([Site], [Facility], [AssetType], [Model], [Asset], [AssetDesc], [AssetId]) VALUES (N'Die Prep', N'DEFAULT', N'Resource', N'MCOB', N'MCOB001', N'Bubbler#2 CO2 Bubbler Destatic Megcon [FOPD]', 25)
INSERT [dbo].[Site_Asset] ([Site], [Facility], [AssetType], [Model], [Asset], [AssetDesc], [AssetId]) VALUES (N'Die Prep', N'DEFAULT', N'Resource', N'MCOB', N'MCOB003', N'Bubbler#4 CO2 Bubbler Destatic Megcon [FOPD]', 26)
INSERT [dbo].[Site_Asset] ([Site], [Facility], [AssetType], [Model], [Asset], [AssetDesc], [AssetId]) VALUES (N'Die Prep', N'DEFAULT', N'Resource', N'PPNP', N'PPNP001', N'Manual PNP-1 Royce[ECBU]', 27)
INSERT [dbo].[Site_Asset] ([Site], [Facility], [AssetType], [Model], [Asset], [AssetDesc], [AssetId]) VALUES (N'Die Prep', N'DEFAULT', N'Resource', N'PPNP', N'PPNP003', N'Magnum-1 Magnum[IPD]', 28)
INSERT [dbo].[Site_Asset] ([Site], [Facility], [AssetType], [Model], [Asset], [AssetDesc], [AssetId]) VALUES (N'Die Prep', N'DEFAULT', N'Resource', N'PPNP', N'PPNP004', N'PNP-4 MS899-DL ASM[FOPD]', 29)
INSERT [dbo].[Site_Asset] ([Site], [Facility], [AssetType], [Model], [Asset], [AssetDesc], [AssetId]) VALUES (N'Die Prep', N'DEFAULT', N'Resource', N'PPNP', N'PPNP005', N'PNP-5 MS899-DL ASM [FOPD]', 30)
INSERT [dbo].[Site_Asset] ([Site], [Facility], [AssetType], [Model], [Asset], [AssetDesc], [AssetId]) VALUES (N'Die Prep', N'DEFAULT', N'Resource', N'PPNP', N'PPNP006', N'PNP-6 MS899-DL ASM [FOPD]', 31)
SET IDENTITY_INSERT [dbo].[Site_Asset] OFF
GO
INSERT [dbo].[Tbl_AssestMaster] ([AssetNo], [AssetType], [AssignedDate], [WarrantyEndDate], [Status], [AssetTaggedUser], [Vendor], [Remarks]) VALUES (1, N'iPhone', CAST(N'2020-08-15' AS Date), CAST(N'2020-08-18' AS Date), N'Not working', N'aaaa', N'Samsung', N'asffs')
INSERT [dbo].[Tbl_AssestMaster] ([AssetNo], [AssetType], [AssignedDate], [WarrantyEndDate], [Status], [AssetTaggedUser], [Vendor], [Remarks]) VALUES (2, N'iPad', CAST(N'2020-08-12' AS Date), CAST(N'2020-08-18' AS Date), N'Returned', N'aaaa', N'Apple', N'asfasfasf')
GO
SET IDENTITY_INSERT [dbo].[Tbl_UserMaster] ON 

INSERT [dbo].[Tbl_UserMaster] ([UserID], [UserName], [UserAddress]) VALUES (1, N'aaaa', N'bbbb')
SET IDENTITY_INSERT [dbo].[Tbl_UserMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[UserDetail] ON 

INSERT [dbo].[UserDetail] ([UserId], [FirstName], [LastName], [Email], [Password]) VALUES (1, N'Prash', N'ee', N'prashant16gr@gmail.com', N'12345')
INSERT [dbo].[UserDetail] ([UserId], [FirstName], [LastName], [Email], [Password]) VALUES (2, N'aaaa', N'aaaaa', N'aaaa@gmail.com', N'111111')
SET IDENTITY_INSERT [dbo].[UserDetail] OFF
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([DepartmentId])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Department]
GO
/****** Object:  StoredProcedure [dbo].[USP_GetAssetDetails]    Script Date: 12/10/2020 3:04:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Prashant Rathod
-- Create date: 12/12/2019
-- Description:	 Get Asset detail 
-- EXEC [USP_GetAssetDetails]  
-- ============================/=================/

CREATE PROCEDURE [dbo].[USP_GetAssetDetails]
   --         @ShiftId int,
			--@OverrideTypeId int   
			--,@PlantId varchar(10)         
		   
AS

BEGIN

SELECT * FROM [AssestManagement].[dbo].[Tbl_AssestMaster] am
INNER JOIN   [AssestManagement].[dbo].[Tbl_UserMaster] um ON um.UserID = am.AssetTaggedUser 

END


GO
