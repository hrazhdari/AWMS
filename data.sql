USE [AWMSdb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 8/5/2024 4:51:56 PM ******/
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
/****** Object:  Table [dbo].[ApplicationRole]    Script Date: 8/5/2024 4:51:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationRole](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ApplicationRole] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationUser]    Script Date: 8/5/2024 4:51:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationUser](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](255) NOT NULL,
	[PasswordHash] [nvarchar](255) NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_ApplicationUser] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AreaUnits]    Script Date: 8/5/2024 4:51:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AreaUnits](
	[AreaUnitID] [int] IDENTITY(1,1) NOT NULL,
	[AreaUnitName] [nvarchar](200) NOT NULL,
	[AreaUnitDescription] [nvarchar](500) NULL,
	[AreaUnitTrain] [nvarchar](max) NULL,
	[EnteredDate] [datetime2](7) NULL,
	[Remark] [nvarchar](max) NULL,
 CONSTRAINT [PK_AreaUnits] PRIMARY KEY CLUSTERED 
(
	[AreaUnitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 8/5/2024 4:51:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](max) NOT NULL,
	[Abbreviation] [nvarchar](max) NULL,
	[CompanyLogo] [nvarchar](max) NULL,
	[EnteredDate] [datetime2](7) NOT NULL,
	[Local_Foreign] [int] NULL,
	[Remark] [nvarchar](max) NULL,
 CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyContracts]    Script Date: 8/5/2024 4:51:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyContracts](
	[ContractId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NULL,
	[ContractNumber] [nvarchar](max) NOT NULL,
	[ContractDescription] [nvarchar](max) NOT NULL,
	[ContractRemark] [nvarchar](max) NOT NULL,
	[EnteredDate] [datetime2](7) NULL,
 CONSTRAINT [PK_CompanyContracts] PRIMARY KEY CLUSTERED 
(
	[ContractId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Desciplines]    Script Date: 8/5/2024 4:51:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Desciplines](
	[DesciplineId] [int] IDENTITY(1,1) NOT NULL,
	[DesciplineName] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Desciplines] PRIMARY KEY CLUSTERED 
(
	[DesciplineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DescriptionForPks]    Script Date: 8/5/2024 4:51:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DescriptionForPks](
	[DescriptionForPkId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_DescriptionForPks] PRIMARY KEY CLUSTERED 
(
	[DescriptionForPkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Irns]    Script Date: 8/5/2024 4:51:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Irns](
	[IrnId] [int] IDENTITY(1,1) NOT NULL,
	[IrnName] [nvarchar](200) NOT NULL,
	[IrnDescription] [nvarchar](500) NULL,
	[IrnPdf] [nvarchar](max) NULL,
	[EnteredDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Irns] PRIMARY KEY CLUSTERED 
(
	[IrnId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Items]    Script Date: 8/5/2024 4:51:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
	[PKID] [int] NOT NULL,
	[ItemOfPk] [int] NULL,
	[Tag] [nvarchar](500) NULL,
	[Description] [nvarchar](500) NULL,
	[UnitID] [int] NULL,
	[Qty] [decimal](18, 2) NULL,
	[OverQty] [decimal](18, 2) NULL,
	[ShortageQty] [decimal](18, 2) NULL,
	[DamageQty] [decimal](18, 2) NULL,
	[IncorectQty] [decimal](18, 2) NULL,
	[ScopeID] [int] NULL,
	[HeatNo] [nvarchar](500) NULL,
	[BatchNo] [nvarchar](500) NULL,
	[Remark] [nvarchar](500) NULL,
	[MTRNo] [nvarchar](200) NULL,
	[ColorCode] [nvarchar](50) NULL,
	[LabelNo] [nvarchar](50) NULL,
	[EnteredBy] [int] NULL,
	[EnteredDate] [date] NULL,
	[EditedBy] [int] NULL,
	[EditedDate] [date] NULL,
	[Price] [decimal](18, 2) NULL,
	[UnitPriceID] [int] NULL,
	[NetW] [decimal](18, 2) NULL,
	[GrossW] [decimal](18, 2) NULL,
	[ItemCodeId] [int] NULL,
	[BaseMaterial] [nvarchar](max) NULL,
	[Hold] [bit] NULL,
	[NIS] [decimal](18, 2) NULL,
	[StorageCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 8/5/2024 4:51:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[LocationName] [nvarchar](200) NOT NULL,
	[EnteredBy] [int] NULL,
	[EnteredDate] [datetime2](7) NULL,
	[EditedBy] [int] NULL,
	[EditedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LocItems]    Script Date: 8/5/2024 4:51:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocItems](
	[LocItemID] [int] IDENTITY(1,1) NOT NULL,
	[LocationID] [int] NOT NULL,
	[ItemId] [int] NOT NULL,
	[Qty] [decimal](18, 2) NULL,
	[OverQty] [decimal](18, 2) NULL,
	[ShortageQty] [decimal](18, 2) NULL,
	[DamageQty] [decimal](18, 2) NULL,
	[RejectQty] [decimal](18, 2) NULL,
	[NISQty] [decimal](18, 2) NULL,
	[EnteredBy] [int] NULL,
	[EnteredDate] [date] NULL,
	[EditedBy] [int] NULL,
	[EditedDate] [date] NULL,
 CONSTRAINT [PK_LocItems] PRIMARY KEY CLUSTERED 
(
	[LocItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mrs]    Script Date: 8/5/2024 4:51:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mrs](
	[MrId] [int] IDENTITY(1,1) NOT NULL,
	[MrName] [nvarchar](100) NOT NULL,
	[MrDescription] [nvarchar](500) NULL,
	[EnteredDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Mrs] PRIMARY KEY CLUSTERED 
(
	[MrId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Packages]    Script Date: 8/5/2024 4:51:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Packages](
	[PKID] [int] IDENTITY(1,1) NOT NULL,
	[PLId] [int] NOT NULL,
	[PK] [int] NOT NULL,
	[NetW] [decimal](18, 2) NULL,
	[GrossW] [decimal](18, 2) NULL,
	[Dimension] [nvarchar](100) NULL,
	[Volume] [nvarchar](100) NULL,
	[ArrivalDate] [date] NULL,
	[Desciption] [nvarchar](500) NULL,
	[Remark] [nvarchar](500) NULL,
	[EnteredBy] [int] NULL,
	[EnteredDate] [date] NULL,
	[EditedBy] [int] NULL,
	[EditedDate] [date] NULL,
	[MSRNO] [nvarchar](100) NULL,
	[MSRPDF] [nvarchar](100) NULL,
	[MSRDate] [date] NULL,
	[MSREnteredBy] [int] NULL,
	[MSRStatus] [bit] NULL,
	[MSRRev] [int] NULL,
	[MSRRevEnteredBy] [int] NULL,
	[MSRRevDate] [date] NULL,
 CONSTRAINT [PK_Packages] PRIMARY KEY CLUSTERED 
(
	[PKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PackingLists]    Script Date: 8/5/2024 4:51:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PackingLists](
	[PLId] [int] IDENTITY(1,1) NOT NULL,
	[ShId] [int] NULL,
	[MrId] [int] NULL,
	[PoId] [int] NULL,
	[IrnId] [int] NULL,
	[PLName] [nvarchar](300) NOT NULL,
	[ArchiveNO] [nvarchar](50) NULL,
	[PLNO] [nvarchar](50) NULL,
	[OPINO] [nvarchar](50) NULL,
	[Project] [nvarchar](50) NULL,
	[AreaUnitID] [int] NULL,
	[SupplierId] [int] NULL,
	[DesciplineId] [int] NULL,
	[VendorId] [int] NULL,
	[DescriptionForPkId] [int] NULL,
	[NetW] [decimal](18, 2) NULL,
	[GrossW] [decimal](18, 2) NULL,
	[Volume] [nvarchar](max) NULL,
	[Vessel] [nvarchar](max) NULL,
	[EnteredBy] [int] NULL,
	[EnteredDate] [datetime2](7) NULL,
	[MARDate] [datetime2](7) NULL,
	[Remark] [nvarchar](max) NULL,
	[LocalForeign] [int] NULL,
	[RTINO] [nvarchar](max) NULL,
	[InvoiceNO] [nvarchar](max) NULL,
	[IRCNO] [nvarchar](max) NULL,
	[LCNO] [nvarchar](max) NULL,
	[BLNO] [nvarchar](max) NULL,
	[Remarkcustoms] [nvarchar](max) NULL,
	[EditedBy] [int] NULL,
	[EditedDate] [datetime2](7) NULL,
	[PLDPF] [nvarchar](max) NULL,
	[Balance] [bit] NULL,
	[Attachment] [bit] NULL,
	[SitePL] [bit] NULL,
 CONSTRAINT [PK_PackingLists] PRIMARY KEY CLUSTERED 
(
	[PLId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pos]    Script Date: 8/5/2024 4:51:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pos](
	[PoId] [int] IDENTITY(1,1) NOT NULL,
	[MrId] [int] NULL,
	[PoName] [nvarchar](150) NOT NULL,
	[PoDescription] [nvarchar](500) NULL,
	[EnteredDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Pos] PRIMARY KEY CLUSTERED 
(
	[PoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Scopes]    Script Date: 8/5/2024 4:51:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Scopes](
	[ScopeID] [int] IDENTITY(1,1) NOT NULL,
	[ScopeName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Scopes] PRIMARY KEY CLUSTERED 
(
	[ScopeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipments]    Script Date: 8/5/2024 4:51:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipments](
	[ShipmentId] [int] IDENTITY(1,1) NOT NULL,
	[PoId] [int] NULL,
	[ShipmentName] [nvarchar](150) NOT NULL,
	[ShipmentDescription] [nvarchar](500) NULL,
	[EnteredDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Shipments] PRIMARY KEY CLUSTERED 
(
	[ShipmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 8/5/2024 4:51:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierId] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [nvarchar](200) NOT NULL,
	[SupplierRemark] [nvarchar](500) NULL,
	[EnteredDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnitPrices]    Script Date: 8/5/2024 4:51:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnitPrices](
	[UnitPriceID] [int] IDENTITY(1,1) NOT NULL,
	[UnitPriceName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_UnitPrices] PRIMARY KEY CLUSTERED 
(
	[UnitPriceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Units]    Script Date: 8/5/2024 4:51:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Units](
	[UnitID] [int] IDENTITY(1,1) NOT NULL,
	[UnitName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Units] PRIMARY KEY CLUSTERED 
(
	[UnitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendors]    Script Date: 8/5/2024 4:51:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendors](
	[VendorID] [int] IDENTITY(1,1) NOT NULL,
	[VendorName] [nvarchar](200) NOT NULL,
	[VendorContractNO] [nvarchar](500) NULL,
	[VendorContractDescription] [nvarchar](500) NULL,
	[VendorAbbreviation] [nvarchar](500) NULL,
	[EnteredDate] [datetime2](7) NULL,
	[Local_Foreign] [int] NULL,
	[Remark] [nvarchar](max) NULL,
 CONSTRAINT [PK_Vendors] PRIMARY KEY CLUSTERED 
(
	[VendorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ApplicationUser]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationUser_ApplicationRole_RoleID] FOREIGN KEY([RoleID])
REFERENCES [dbo].[ApplicationRole] ([RoleID])
GO
ALTER TABLE [dbo].[ApplicationUser] CHECK CONSTRAINT [FK_ApplicationUser_ApplicationRole_RoleID]
GO
ALTER TABLE [dbo].[CompanyContracts]  WITH CHECK ADD  CONSTRAINT [FK_CompanyContracts_Companies_CompanyID] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Companies] ([CompanyID])
GO
ALTER TABLE [dbo].[CompanyContracts] CHECK CONSTRAINT [FK_CompanyContracts_Companies_CompanyID]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_Packages_PKID] FOREIGN KEY([PKID])
REFERENCES [dbo].[Packages] ([PKID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_Packages_PKID]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_Scopes_ScopeID] FOREIGN KEY([ScopeID])
REFERENCES [dbo].[Scopes] ([ScopeID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_Scopes_ScopeID]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_UnitPrices_UnitPriceID] FOREIGN KEY([UnitPriceID])
REFERENCES [dbo].[UnitPrices] ([UnitPriceID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_UnitPrices_UnitPriceID]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_Units_UnitID] FOREIGN KEY([UnitID])
REFERENCES [dbo].[Units] ([UnitID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_Units_UnitID]
GO
ALTER TABLE [dbo].[LocItems]  WITH CHECK ADD  CONSTRAINT [FK_LocItems_Items_ItemId] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Items] ([ItemId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LocItems] CHECK CONSTRAINT [FK_LocItems_Items_ItemId]
GO
ALTER TABLE [dbo].[LocItems]  WITH CHECK ADD  CONSTRAINT [FK_LocItems_Locations_LocationID] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Locations] ([LocationID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LocItems] CHECK CONSTRAINT [FK_LocItems_Locations_LocationID]
GO
ALTER TABLE [dbo].[Packages]  WITH CHECK ADD  CONSTRAINT [FK_Packages_PackingLists_PLId] FOREIGN KEY([PLId])
REFERENCES [dbo].[PackingLists] ([PLId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Packages] CHECK CONSTRAINT [FK_Packages_PackingLists_PLId]
GO
ALTER TABLE [dbo].[PackingLists]  WITH CHECK ADD  CONSTRAINT [FK_PackingLists_AreaUnits_AreaUnitID] FOREIGN KEY([AreaUnitID])
REFERENCES [dbo].[AreaUnits] ([AreaUnitID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[PackingLists] CHECK CONSTRAINT [FK_PackingLists_AreaUnits_AreaUnitID]
GO
ALTER TABLE [dbo].[PackingLists]  WITH CHECK ADD  CONSTRAINT [FK_PackingLists_Desciplines_DesciplineId] FOREIGN KEY([DesciplineId])
REFERENCES [dbo].[Desciplines] ([DesciplineId])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[PackingLists] CHECK CONSTRAINT [FK_PackingLists_Desciplines_DesciplineId]
GO
ALTER TABLE [dbo].[PackingLists]  WITH CHECK ADD  CONSTRAINT [FK_PackingLists_DescriptionForPks_DescriptionForPkId] FOREIGN KEY([DescriptionForPkId])
REFERENCES [dbo].[DescriptionForPks] ([DescriptionForPkId])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[PackingLists] CHECK CONSTRAINT [FK_PackingLists_DescriptionForPks_DescriptionForPkId]
GO
ALTER TABLE [dbo].[PackingLists]  WITH CHECK ADD  CONSTRAINT [FK_PackingLists_Irns_IrnId] FOREIGN KEY([IrnId])
REFERENCES [dbo].[Irns] ([IrnId])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[PackingLists] CHECK CONSTRAINT [FK_PackingLists_Irns_IrnId]
GO
ALTER TABLE [dbo].[PackingLists]  WITH CHECK ADD  CONSTRAINT [FK_PackingLists_Mrs_MrId] FOREIGN KEY([MrId])
REFERENCES [dbo].[Mrs] ([MrId])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[PackingLists] CHECK CONSTRAINT [FK_PackingLists_Mrs_MrId]
GO
ALTER TABLE [dbo].[PackingLists]  WITH CHECK ADD  CONSTRAINT [FK_PackingLists_Pos_PoId] FOREIGN KEY([PoId])
REFERENCES [dbo].[Pos] ([PoId])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[PackingLists] CHECK CONSTRAINT [FK_PackingLists_Pos_PoId]
GO
ALTER TABLE [dbo].[PackingLists]  WITH CHECK ADD  CONSTRAINT [FK_PackingLists_Shipments_ShId] FOREIGN KEY([ShId])
REFERENCES [dbo].[Shipments] ([ShipmentId])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[PackingLists] CHECK CONSTRAINT [FK_PackingLists_Shipments_ShId]
GO
ALTER TABLE [dbo].[PackingLists]  WITH CHECK ADD  CONSTRAINT [FK_PackingLists_Suppliers_SupplierId] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Suppliers] ([SupplierId])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[PackingLists] CHECK CONSTRAINT [FK_PackingLists_Suppliers_SupplierId]
GO
ALTER TABLE [dbo].[PackingLists]  WITH CHECK ADD  CONSTRAINT [FK_PackingLists_Vendors_VendorId] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendors] ([VendorID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[PackingLists] CHECK CONSTRAINT [FK_PackingLists_Vendors_VendorId]
GO
ALTER TABLE [dbo].[Pos]  WITH CHECK ADD  CONSTRAINT [FK_Pos_Mrs_MrId] FOREIGN KEY([MrId])
REFERENCES [dbo].[Mrs] ([MrId])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Pos] CHECK CONSTRAINT [FK_Pos_Mrs_MrId]
GO
ALTER TABLE [dbo].[Shipments]  WITH CHECK ADD  CONSTRAINT [FK_Shipments_Pos_PoId] FOREIGN KEY([PoId])
REFERENCES [dbo].[Pos] ([PoId])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Shipments] CHECK CONSTRAINT [FK_Shipments_Pos_PoId]
GO
