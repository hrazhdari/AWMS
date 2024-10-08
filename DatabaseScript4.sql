USE [AWMSdb]
GO
/****** Object:  UserDefinedTableType [dbo].[ImportItemType]    Script Date: 9/4/2024 7:56:34 AM ******/
CREATE TYPE [dbo].[ImportItemType] AS TABLE(
	[PK] [int] NULL,
	[Tag] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[UnitID] [nvarchar](255) NULL,
	[Qty] [decimal](18, 2) NULL,
	[OverQty] [decimal](18, 2) NULL,
	[ShortageQty] [decimal](18, 2) NULL,
	[DamageQty] [decimal](18, 2) NULL,
	[IncorectQty] [decimal](18, 2) NULL,
	[ScopeID] [nvarchar](255) NULL,
	[HeatNo] [nvarchar](255) NULL,
	[BatchNo] [nvarchar](255) NULL,
	[Remark] [nvarchar](255) NULL,
	[Price] [decimal](18, 2) NULL,
	[UnitPriceID] [nvarchar](255) NULL,
	[NetW] [decimal](18, 2) NULL,
	[GrossW] [decimal](18, 2) NULL,
	[BaseMaterial] [nvarchar](255) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ItemIDList]    Script Date: 9/4/2024 7:56:34 AM ******/
CREATE TYPE [dbo].[ItemIDList] AS TABLE(
	[ItemId] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ItemIDListType]    Script Date: 9/4/2024 7:56:34 AM ******/
CREATE TYPE [dbo].[ItemIDListType] AS TABLE(
	[ItemID] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ItemTableType]    Script Date: 9/4/2024 7:56:34 AM ******/
CREATE TYPE [dbo].[ItemTableType] AS TABLE(
	[PK] [int] NULL,
	[Tag] [nvarchar](50) NULL,
	[Description] [nvarchar](255) NULL,
	[UnitID] [nvarchar](50) NULL,
	[Qty] [decimal](18, 2) NULL,
	[OverQty] [decimal](18, 2) NULL,
	[ShortageQty] [decimal](18, 2) NULL,
	[DamageQty] [decimal](18, 2) NULL,
	[IncorectQty] [decimal](18, 2) NULL,
	[ScopeID] [nvarchar](50) NULL,
	[HeatNo] [nvarchar](50) NULL,
	[BatchNo] [nvarchar](50) NULL,
	[Remark] [nvarchar](255) NULL,
	[Price] [decimal](18, 2) NULL,
	[UnitPriceID] [nvarchar](50) NULL,
	[NetW] [decimal](18, 2) NULL,
	[GrossW] [decimal](18, 2) NULL,
	[BaseMaterial] [nvarchar](50) NULL,
	[EnteredBy] [int] NULL,
	[EnteredDate] [datetime] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[LocItemIDListType]    Script Date: 9/4/2024 7:56:34 AM ******/
CREATE TYPE [dbo].[LocItemIDListType] AS TABLE(
	[LocItemID] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[NewRequestDtoType]    Script Date: 9/4/2024 7:56:34 AM ******/
CREATE TYPE [dbo].[NewRequestDtoType] AS TABLE(
	[ReqMivQty] [decimal](18, 2) NULL,
	[ReserveMivQty] [decimal](18, 2) NULL,
	[LocItemID] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[PackagePKIDDtoType]    Script Date: 9/4/2024 7:56:34 AM ******/
CREATE TYPE [dbo].[PackagePKIDDtoType] AS TABLE(
	[PKID] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[PackageType]    Script Date: 9/4/2024 7:56:34 AM ******/
CREATE TYPE [dbo].[PackageType] AS TABLE(
	[PK] [int] NULL,
	[NetW] [decimal](18, 2) NULL,
	[GrossW] [decimal](18, 2) NULL,
	[Dimension] [nvarchar](100) NULL,
	[Volume] [nvarchar](100) NULL,
	[ArrivalDate] [date] NULL,
	[Desciption] [nvarchar](500) NULL,
	[Remark] [nvarchar](500) NULL,
	[PLId] [int] NULL,
	[EnteredBy] [int] NULL,
	[EnteredDate] [date] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[RequestDtoType]    Script Date: 9/4/2024 7:56:34 AM ******/
CREATE TYPE [dbo].[RequestDtoType] AS TABLE(
	[CompanyID] [int] NULL,
	[ContractId] [int] NULL,
	[MRCNO] [nvarchar](50) NULL,
	[AreaUnitID] [int] NULL,
	[ReqMivQty] [decimal](18, 2) NULL,
	[ReserveMivQty] [decimal](18, 2) NULL,
	[LocItemID] [int] NULL,
	[RequestNO] [nvarchar](6) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[RequestMivTableType]    Script Date: 9/4/2024 7:56:34 AM ******/
CREATE TYPE [dbo].[RequestMivTableType] AS TABLE(
	[CompanyID] [int] NULL,
	[ContractId] [int] NULL,
	[MRCNO] [nvarchar](50) NULL,
	[AreaUnitID] [int] NULL,
	[ReqMivQty] [decimal](18, 2) NULL,
	[ReserveMivQty] [decimal](18, 2) NULL,
	[LocItemID] [int] NULL,
	[RequestNO] [nvarchar](50) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UpdateLocItemLocationType]    Script Date: 9/4/2024 7:56:34 AM ******/
CREATE TYPE [dbo].[UpdateLocItemLocationType] AS TABLE(
	[LocItemID] [int] NULL,
	[LocationID] [int] NULL,
	[EditedBy] [nvarchar](100) NULL,
	[EditedDate] [datetime] NULL
)
GO
/****** Object:  Table [dbo].[Packages]    Script Date: 9/4/2024 7:56:34 AM ******/
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
/****** Object:  Table [dbo].[Items]    Script Date: 9/4/2024 7:56:34 AM ******/
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
/****** Object:  View [dbo].[vw_ItemsWithPackages]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_ItemsWithPackages]
WITH SCHEMABINDING
AS
SELECT 
    i.ItemId,
    i.PKID,
    i.ItemOfPk,
    i.Tag,
    i.Description,
    i.UnitID,
    i.Qty,
    i.OverQty,
    i.ShortageQty,
    i.DamageQty,
    i.IncorectQty,
    i.ScopeID,
    i.HeatNo,
    i.BatchNo,
    i.Remark,
    i.MTRNo,
    i.ColorCode,
    i.LabelNo,
    i.EnteredBy,
    i.EnteredDate,
    i.EditedBy,
    i.EditedDate,
    i.Price,
    i.UnitPriceID,
    i.NetW,
    i.GrossW,
    i.ItemCodeId,
    i.BaseMaterial,
    i.Hold,
    i.NIS,
    i.StorageCode,
    p.PLId
FROM dbo.Items i
INNER JOIN dbo.Packages p ON i.PKID = p.PKID;
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 9/4/2024 7:56:34 AM ******/
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
/****** Object:  Table [dbo].[ApplicationRole]    Script Date: 9/4/2024 7:56:34 AM ******/
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
/****** Object:  Table [dbo].[ApplicationUser]    Script Date: 9/4/2024 7:56:34 AM ******/
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
/****** Object:  Table [dbo].[AreaUnits]    Script Date: 9/4/2024 7:56:34 AM ******/
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
/****** Object:  Table [dbo].[Companies]    Script Date: 9/4/2024 7:56:34 AM ******/
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
/****** Object:  Table [dbo].[CompanyContracts]    Script Date: 9/4/2024 7:56:34 AM ******/
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
	[EditedBy] [int] NULL,
	[EditedDate] [datetime2](7) NULL,
	[EnteredBy] [int] NULL,
 CONSTRAINT [PK_CompanyContracts] PRIMARY KEY CLUSTERED 
(
	[ContractId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Desciplines]    Script Date: 9/4/2024 7:56:34 AM ******/
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
/****** Object:  Table [dbo].[DescriptionForPks]    Script Date: 9/4/2024 7:56:34 AM ******/
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
/****** Object:  Table [dbo].[Irns]    Script Date: 9/4/2024 7:56:34 AM ******/
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
/****** Object:  Table [dbo].[Locations]    Script Date: 9/4/2024 7:56:34 AM ******/
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
/****** Object:  Table [dbo].[LocItems]    Script Date: 9/4/2024 7:56:34 AM ******/
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
/****** Object:  Table [dbo].[MIVNumbers]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MIVNumbers](
	[LastNumber] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mrs]    Script Date: 9/4/2024 7:56:34 AM ******/
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
/****** Object:  Table [dbo].[PackingLists]    Script Date: 9/4/2024 7:56:34 AM ******/
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
/****** Object:  Table [dbo].[Pos]    Script Date: 9/4/2024 7:56:34 AM ******/
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
/****** Object:  Table [dbo].[Requests]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requests](
	[ReqLocItemID] [int] IDENTITY(1,1) NOT NULL,
	[LocItemID] [int] NOT NULL,
	[CompanyID] [int] NULL,
	[CompanyID2] [int] NULL,
	[ContractId] [int] NULL,
	[ContractId2] [int] NULL,
	[AreaUnitID] [int] NULL,
	[VendorID] [int] NULL,
	[TypeID] [int] NULL,
	[RequestNO] [nvarchar](max) NOT NULL,
	[ReqDate] [date] NULL,
	[Item] [int] NULL,
	[ReqMivQty] [decimal](18, 2) NULL,
	[ReserveMivQty] [decimal](18, 2) NULL,
	[DelMivQty] [decimal](18, 2) NULL,
	[ReqMivRejQty] [decimal](18, 2) NULL,
	[ReserveMivRejQty] [decimal](18, 2) NULL,
	[DelMivRejQty] [decimal](18, 2) NULL,
	[ReqMrvQty] [decimal](18, 2) NULL,
	[DelMrvQty] [decimal](18, 2) NULL,
	[DelMrvRejQty] [decimal](18, 2) NULL,
	[ReqHmvQty] [decimal](18, 2) NULL,
	[DelHmvQty] [decimal](18, 2) NULL,
	[DelHmvRejQty] [decimal](18, 2) NULL,
	[IssuedBy] [int] NULL,
	[IssuedDate] [date] NULL,
	[ApprovedBy] [int] NULL,
	[ApprovedDate] [date] NULL,
	[DelDate] [date] NULL,
	[Remark] [nvarchar](max) NULL,
	[MRCNO] [nvarchar](max) NULL,
	[MRVNO] [nvarchar](max) NULL,
	[HMVNO] [nvarchar](max) NULL,
	[RequestPDF] [nvarchar](max) NULL,
	[RequestTypeTypeID] [int] NULL,
 CONSTRAINT [PK_Requests] PRIMARY KEY CLUSTERED 
(
	[ReqLocItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequestTypes]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestTypes](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_RequestTypes] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Scopes]    Script Date: 9/4/2024 7:56:34 AM ******/
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
/****** Object:  Table [dbo].[Shipments]    Script Date: 9/4/2024 7:56:34 AM ******/
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
/****** Object:  Table [dbo].[Suppliers]    Script Date: 9/4/2024 7:56:34 AM ******/
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
/****** Object:  Table [dbo].[UnitPrices]    Script Date: 9/4/2024 7:56:34 AM ******/
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
/****** Object:  Table [dbo].[Units]    Script Date: 9/4/2024 7:56:34 AM ******/
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
/****** Object:  Table [dbo].[Vendors]    Script Date: 9/4/2024 7:56:34 AM ******/
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
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_LocItems_LocItemID] FOREIGN KEY([LocItemID])
REFERENCES [dbo].[LocItems] ([LocItemID])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_LocItems_LocItemID]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_RequestTypes_RequestTypeTypeID] FOREIGN KEY([RequestTypeTypeID])
REFERENCES [dbo].[RequestTypes] ([TypeID])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_RequestTypes_RequestTypeTypeID]
GO
ALTER TABLE [dbo].[Shipments]  WITH CHECK ADD  CONSTRAINT [FK_Shipments_Pos_PoId] FOREIGN KEY([PoId])
REFERENCES [dbo].[Pos] ([PoId])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Shipments] CHECK CONSTRAINT [FK_Shipments_Pos_PoId]
GO
/****** Object:  StoredProcedure [dbo].[AddItemsFromTempTable]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddItemsFromTempTable]
    @Items dbo.ItemTableType READONLY,
    @PLId INT,
    @LocationID INT,
    @NewItemId INT OUTPUT -- Output parameter for new ItemId
AS
BEGIN
    SET NOCOUNT ON;

    -- مرحله اول: ایجاد یک جدول موقت برای ذخیره داده‌ها با IDهای منحصر به فرد
    CREATE TABLE #TempItems
    (
        PKID INT,
        Tag NVARCHAR(255),
        Description NVARCHAR(255),
        UnitID INT,
        Qty DECIMAL(18, 2),
        OverQty DECIMAL(18, 2),
        ShortageQty DECIMAL(18, 2),
        DamageQty DECIMAL(18, 2),
        IncorectQty DECIMAL(18, 2),
        ScopeID INT,
        HeatNo NVARCHAR(255),
        BatchNo NVARCHAR(255),
        Remark NVARCHAR(255),
        Price DECIMAL(18, 2),
        UnitPriceID INT,
        NetW DECIMAL(18, 2),
        GrossW DECIMAL(18, 2),
        BaseMaterial NVARCHAR(255)
    );

    -- مرحله دوم: درج داده‌ها به جدول موقت با استفاده از IDهای منحصر به فرد
    INSERT INTO #TempItems
    SELECT
        ISNULL(p.PKID, 0) AS PKID,
        ISNULL(i.Tag, '') AS Tag,
        ISNULL(i.Description, '') AS Description,
        ISNULL(u.UnitID, 1) AS UnitID, -- مقدار پیش‌فرض 1 برای UnitID
        ISNULL(i.Qty, 0) AS Qty,
        ISNULL(i.OverQty, 0) AS OverQty,
        ISNULL(i.ShortageQty, 0) AS ShortageQty,
        ISNULL(i.DamageQty, 0) AS DamageQty,
        ISNULL(i.IncorectQty, 0) AS IncorectQty,
        ISNULL(s.ScopeID, 1) AS ScopeID, -- مقدار پیش‌فرض 1 برای ScopeID
        ISNULL(i.HeatNo, '') AS HeatNo,
        ISNULL(i.BatchNo, '') AS BatchNo,
        ISNULL(i.Remark, '') AS Remark,
        ISNULL(i.Price, 0) AS Price,
        ISNULL(up.UnitPriceID, 1) AS UnitPriceID, -- مقدار پیش‌فرض 1 برای UnitPriceID
        ISNULL(i.NetW, 0) AS NetW,
        ISNULL(i.GrossW, 0) AS GrossW,
        ISNULL(i.BaseMaterial, '') AS BaseMaterial
    FROM @Items i
    JOIN dbo.Packages p ON i.PK = p.PK AND p.PLId = @PLId
    LEFT JOIN dbo.Units u ON i.UnitID = u.UnitName
    LEFT JOIN dbo.Scopes s ON i.ScopeID = s.ScopeName
    LEFT JOIN dbo.UnitPrices up ON i.UnitPriceID = up.UnitPriceName
    WHERE EXISTS (
        SELECT 1
        FROM dbo.Packages p
        WHERE i.PK = p.PK AND p.PLId = @PLId
    );

    -- تنظیم LocationID برای استفاده در تریگر
    EXEC sp_set_session_context @key = 'LocationID', @value = @LocationID;

    -- مرحله سوم: درج داده‌ها به جدول مقصد
    INSERT INTO dbo.Items
    (
        PKID,
        ItemOfPk,
        Tag,
        Description,
        UnitID,
        Qty,
        OverQty,
        ShortageQty,
        DamageQty,
        IncorectQty,
        ScopeID,
        HeatNo,
        BatchNo,
        Remark,
        Price,
        UnitPriceID,
        NetW,
        GrossW,
        BaseMaterial,
        Hold
    )
    SELECT
        PKID,
        ROW_NUMBER() OVER (PARTITION BY PKID ORDER BY PKID) AS ItemOfPk,
        Tag,
        Description,
        UnitID,
        Qty,
        OverQty,
        ShortageQty,
        DamageQty,
        IncorectQty,
        ScopeID,
        HeatNo,
        BatchNo,
        Remark,
        Price,
        UnitPriceID,
        NetW,
        GrossW,
        BaseMaterial,
        0 -- مقدار پیش‌فرض برای Hold
    FROM #TempItems;

    -- بدست آوردن آیتم جدید ItemId
    SET @NewItemId = SCOPE_IDENTITY();

    -- مرحله چهارم: پاکسازی جدول موقت
    DROP TABLE #TempItems;
END
GO
/****** Object:  StoredProcedure [dbo].[AddItemsFromTempTable2]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[AddItemsFromTempTable2]
    @Items dbo.ItemTableType READONLY,
    @PLId INT,
    @LocationID INT,
    @NewItemId INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    -- تنظیم LocationID برای استفاده در تریگر
    EXEC sp_set_session_context @key = 'LocationID', @value = @LocationID;

    -- درج داده‌ها به جدول مقصد
    INSERT INTO dbo.Items
    (
        PKID,
        ItemOfPk,
        Tag,
        Description,
        UnitID,
        Qty,
        OverQty,
        ShortageQty,
        DamageQty,
        IncorectQty,
        ScopeID,
        HeatNo,
        BatchNo,
        Remark,
        Price,
        UnitPriceID,
        NetW,
        GrossW,
        BaseMaterial,
        Hold
    )
    SELECT
        ISNULL(p.PKID, 0) AS PKID,
        ROW_NUMBER() OVER (PARTITION BY p.PKID ORDER BY p.PKID) AS ItemOfPk,
        ISNULL(i.Tag, '') AS Tag,
        ISNULL(i.Description, '') AS Description,
        ISNULL(u.UnitID, 1) AS UnitID, -- مقدار پیش‌فرض 1 برای UnitID
        ISNULL(i.Qty, 0) AS Qty,
        ISNULL(i.OverQty, 0) AS OverQty,
        ISNULL(i.ShortageQty, 0) AS ShortageQty,
        ISNULL(i.DamageQty, 0) AS DamageQty,
        ISNULL(i.IncorectQty, 0) AS IncorectQty,
        ISNULL(s.ScopeID, 1) AS ScopeID, -- مقدار پیش‌فرض 1 برای ScopeID
        ISNULL(i.HeatNo, '') AS HeatNo,
        ISNULL(i.BatchNo, '') AS BatchNo,
        ISNULL(i.Remark, '') AS Remark,
        ISNULL(i.Price, 0) AS Price,
        ISNULL(up.UnitPriceID, 1) AS UnitPriceID, -- مقدار پیش‌فرض 1 برای UnitPriceID
        ISNULL(i.NetW, 0) AS NetW,
        ISNULL(i.GrossW, 0) AS GrossW,
        ISNULL(i.BaseMaterial, '') AS BaseMaterial,
        0 -- مقدار پیش‌فرض برای Hold
    FROM @Items i
    JOIN dbo.Packages p ON i.PK = p.PK AND p.PLId = @PLId
    LEFT JOIN dbo.Units u ON i.UnitID = u.UnitName
    LEFT JOIN dbo.Scopes s ON i.ScopeID = s.ScopeName
    LEFT JOIN dbo.UnitPrices up ON i.UnitPriceID = up.UnitPriceName
    WHERE EXISTS (
        SELECT 1
        FROM dbo.Packages p
        WHERE i.PK = p.PK AND p.PLId = @PLId
    );

    -- بدست آوردن آیتم جدید ItemId
    SET @NewItemId = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[AddLocItem]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddLocItem]
    @LocationID INT,
    @ItemId INT,
    @Qty DECIMAL(18, 2),
    @OverQty DECIMAL(18, 2),
    @ShortageQty DECIMAL(18, 2),
    @DamageQty DECIMAL(18, 2),
    @RejectQty DECIMAL(18, 2),
    @NISQty DECIMAL(18, 2),
    @EnteredBy INT,
    @EnteredDate DATETIME
AS
BEGIN
    INSERT INTO LocItems (LocationID, ItemId, Qty, OverQty, ShortageQty, DamageQty, RejectQty, NISQty, EnteredBy, EnteredDate)
    VALUES (@LocationID, @ItemId, @Qty, @OverQty, @ShortageQty, @DamageQty, @RejectQty, @NISQty, @EnteredBy, @EnteredDate)
END
GO
/****** Object:  StoredProcedure [dbo].[AddPackage]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddPackage]
    @PLId INT,
    @PK INT,
    @NetW DECIMAL(18,2),
    @GrossW DECIMAL(18,2),
    @Dimension VARCHAR(50),
    @Volume DECIMAL(18,2),
    @ArrivalDate DATETIME,
    @Desciption NVARCHAR(MAX),
    @Remark NVARCHAR(MAX),
    @EnteredBy NVARCHAR(50),
    @EnteredDate DATETIME,
    @EditedBy NVARCHAR(50),
    @EditedDate DATETIME,
    @MSRNO NVARCHAR(50),
    @MSRPDF NVARCHAR(50),
    @MSRDate DATETIME,
    @MSREnteredBy NVARCHAR(50),
    @MSRStatus NVARCHAR(50),
    @MSRRev INT,
    @MSRRevEnteredBy NVARCHAR(50),
    @MSRRevDate DATETIME
AS
BEGIN
    INSERT INTO Packages (PLId, PK, NetW, GrossW, Dimension, Volume, ArrivalDate, Desciption, Remark, EnteredBy, EnteredDate, EditedBy, EditedDate, MSRNO, MSRPDF, MSRDate, MSREnteredBy, MSRStatus, MSRRev, MSRRevEnteredBy, MSRRevDate)
    VALUES (@PLId, @PK, @NetW, @GrossW, @Dimension, @Volume, @ArrivalDate, @Desciption, @Remark, @EnteredBy, @EnteredDate, @EditedBy, @EditedDate, @MSRNO, @MSRPDF, @MSRDate, @MSREnteredBy, @MSRStatus, @MSRRev, @MSRRevEnteredBy, @MSRRevDate);
END
GO
/****** Object:  StoredProcedure [dbo].[AddPackagesFromTempTable]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[AddPackagesFromTempTable]
    @Packages dbo.PackageType READONLY
AS
BEGIN
    -- افزودن بسته‌ها به جدول اصلی packages در صورتی که از قبل وجود نداشته باشند
    INSERT INTO packages (PK, NetW, GrossW, Dimension, Volume, ArrivalDate, Desciption, Remark, PLId, EnteredBy, EnteredDate)
    SELECT pk.PK, pk.NetW, pk.GrossW, pk.Dimension, pk.Volume, pk.ArrivalDate, pk.Desciption, pk.Remark, pk.PLId, pk.EnteredBy, pk.EnteredDate
    FROM @Packages pk
    LEFT JOIN packages p ON pk.PK = p.PK AND pk.PLId = p.PLId
    WHERE p.PK IS NULL AND EXISTS (
        SELECT 1
        FROM packinglists pl
        WHERE pk.PLId = pl.PLId
    );
END;
GO
/****** Object:  StoredProcedure [dbo].[AddPackingList]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddPackingList]
    @ShId INT = NULL,
    @MrId INT = NULL,
    @PoId INT = NULL,
    @IrnId INT = NULL,
    @PLName NVARCHAR(200),
    @ArchiveNO NVARCHAR(255) = NULL,
    @PLNO NVARCHAR(255) = NULL,
    @OPINO NVARCHAR(255) = NULL,
    @Project NVARCHAR(255) = NULL,
    @AreaUnitID INT = NULL,
    @SupplierId INT = NULL,
    @DesciplineId INT = NULL,
    @VendorId INT = NULL,
    @DescriptionForPkId INT = NULL,
    @NetW DECIMAL(18, 2) = NULL,
    @GrossW DECIMAL(18, 2) = NULL,
    @Volume NVARCHAR(255) = NULL,
    @Vessel NVARCHAR(255) = NULL,
    @EnteredBy INT = NULL,
    @EnteredDate DATETIME = NULL,
    @MARDate DATETIME = NULL,
    @Remark NVARCHAR(255) = NULL,
    @LocalForeign INT = NULL,
    @RTINO NVARCHAR(255) = NULL,
    @InvoiceNO NVARCHAR(255) = NULL,
    @IRCNO NVARCHAR(255) = NULL,
    @LCNO NVARCHAR(255) = NULL,
    @BLNO NVARCHAR(255) = NULL,
    @Remarkcustoms NVARCHAR(255) = NULL,
    @EditedBy INT = NULL,
    @EditedDate DATETIME = NULL,
    @PLDPF NVARCHAR(255) = NULL,
    @Balance BIT = NULL,
    @Attachment BIT = NULL,
    @SitePL BIT = NULL
AS
BEGIN
    INSERT INTO PackingLists (
        ShId, MrId, PoId, IrnId, PLName, ArchiveNO, PLNO, OPINO, Project,
        AreaUnitID, SupplierId, DesciplineId, VendorId, DescriptionForPkId, NetW,
        GrossW, Volume, Vessel, EnteredBy, EnteredDate, MARDate, Remark, LocalForeign,
        RTINO, InvoiceNO, IRCNO, LCNO, BLNO, Remarkcustoms, EditedBy, EditedDate,
        PLDPF, Balance, Attachment, SitePL
    ) VALUES (
        @ShId, @MrId, @PoId, @IrnId, @PLName, @ArchiveNO, @PLNO, @OPINO, @Project,
        @AreaUnitID, @SupplierId, @DesciplineId, @VendorId, @DescriptionForPkId, @NetW,
        @GrossW, @Volume, @Vessel, @EnteredBy, @EnteredDate, @MARDate, @Remark, @LocalForeign,
        @RTINO, @InvoiceNO, @IRCNO, @LCNO, @BLNO, @Remarkcustoms, @EditedBy, @EditedDate,
        @PLDPF, @Balance, @Attachment, @SitePL
    );
END
GO
/****** Object:  StoredProcedure [dbo].[AllItemSelectedPl]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AllItemSelectedPl]
    @PLId INT
AS
BEGIN
    -- انتخاب فیلدهای ضروری از جداول مربوطه
SELECT Packages.PKID, Packages.PLId, Packages.PK, LocItems.LocItemID, LocItems.LocationID, LocItems.Qty, LocItems.OverQty, LocItems.ShortageQty, LocItems.DamageQty, LocItems.RejectQty, LocItems.NISQty, Items.ItemId, Items.ItemOfPk, 
                  Items.Tag, Items.Description, Items.UnitID, Items.Qty AS QtyPL, Items.OverQty AS OverQtyPL, Items.ShortageQty AS ShortageQtyPL, Items.DamageQty AS DamageQtyPL, Items.IncorectQty, Items.ScopeID, Items.Remark, Items.Hold, 
                  Items.NIS, Items.HeatNo, Items.BatchNo, Items.StorageCode, Packages.ArrivalDate, Packages.MSRNO, Packages.MSRPDF, Items.NetW, Items.GrossW
FROM     Packages INNER JOIN
                  Items ON Packages.PKID = Items.PKID INNER JOIN
                  LocItems ON Items.ItemId = LocItems.ItemId
    WHERE 
        Packages.PLId = @PLId
END
GO
/****** Object:  StoredProcedure [dbo].[CheckPackageByName]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckPackageByName]
    @PackageName NVARCHAR(MAX)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Packages WHERE Desciption = @PackageName)
        SELECT 1;
    ELSE
        SELECT 0;
END
GO
/****** Object:  StoredProcedure [dbo].[CheckPackageExistence]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckPackageExistence]
    @PLId INT,
    @PK INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Packages WHERE PLId = @PLId AND PK = @PK)
        SELECT 1;
    ELSE
        SELECT 0;
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteItems]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteItems]
    @ItemIDList dbo.ItemIDListType READONLY
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM Items
    WHERE ItemId IN (SELECT ItemID FROM @ItemIDList);
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteLocItem]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteLocItem]
    @LocItemID INT
AS
BEGIN
    DELETE FROM LocItems
    WHERE LocItemID = @LocItemID
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteMultipleLocItems]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteMultipleLocItems]
    @LocItemIDList dbo.LocItemIDListType READONLY
AS
BEGIN
    DELETE FROM LocItems
    WHERE LocItemID IN (SELECT LocItemID FROM @LocItemIDList)
END
GO
/****** Object:  StoredProcedure [dbo].[DeletePackage]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeletePackage]
    @PackageId INT
AS
BEGIN
    DELETE FROM Packages WHERE PKID = @PackageId;
END
GO
/****** Object:  StoredProcedure [dbo].[DeletePackages]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeletePackages]
(
    @PKIDList dbo.PackagePKIDDtoType READONLY
)
AS
BEGIN
    DELETE FROM Packages
    WHERE PKID IN (SELECT PKID FROM @PKIDList);
END
GO
/****** Object:  StoredProcedure [dbo].[DeletePackingList]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeletePackingList]
    @PlId INT
AS
BEGIN
    DELETE FROM PackingLists WHERE PlId = @PlId;
END
GO
/****** Object:  StoredProcedure [dbo].[ExistsPackingListByOpiNumber]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ExistsPackingListByOpiNumber]
    @OpiNumber NVARCHAR(255)
AS
BEGIN
    SELECT CASE WHEN EXISTS (SELECT 1 FROM PackingLists WHERE OPINO = @OpiNumber) THEN 1 ELSE 0 END
END
GO
/****** Object:  StoredProcedure [dbo].[ExistsPackingListByPlName]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ExistsPackingListByPlName]
    @PlName NVARCHAR(255)
AS
BEGIN
    SELECT CASE WHEN EXISTS (SELECT 1 FROM PackingLists WHERE PLName = @PlName) THEN CAST(1 AS BIT) ELSE CAST(0 AS BIT) END;
END
GO
/****** Object:  StoredProcedure [dbo].[ExistsPackingListByPlNo]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ExistsPackingListByPlNo]
    @PlNo NVARCHAR(255)
AS
BEGIN
    SELECT * FROM PackingLists WHERE PLNO = @PlNo;
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllLocItems]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllLocItems]
AS
BEGIN
    SELECT * FROM LocItems
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllPackages]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllPackages]
AS
BEGIN
    SELECT * FROM Packages;
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllPackingLists]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllPackingLists]
AS
BEGIN
    SET NOCOUNT ON;  -- Improve performance by stopping the message that shows the count of affected rows

    -- Selecting specific columns instead of *
    SELECT 
        PLId,
        ShId,
        MrId,
        PoId,
        IrnId,
        PLName,
        ArchiveNO,
        PLNO,
        OPINO,
        Project,
        AreaUnitID,
        SupplierId,
        DesciplineId,
        VendorId,
        DescriptionForPkId,
        NetW,
        GrossW,
        Volume,
        Vessel,
        EnteredBy,
        EnteredDate,
        MARDate,
        Remark,
        LocalForeign,
        RTINO,
        InvoiceNO,
        IRCNO,
        LCNO,
        BLNO,
        Remarkcustoms,
        EditedBy,
        EditedDate,
        PLDPF,
        Balance,
        Attachment,
        SitePL
    FROM PackingLists;
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllPackingListsNames]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[GetAllPackingListsNames]
AS
BEGIN
    SELECT PLId,PLName,PLNO FROM PackingLists;
END
GO
/****** Object:  StoredProcedure [dbo].[GetLastArchiveNo]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLastArchiveNo]
AS
BEGIN
    SELECT TOP 1 ArchiveNO
    FROM PackingLists
    ORDER BY ArchiveNO DESC
END
GO
/****** Object:  StoredProcedure [dbo].[GetLastPackage]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLastPackage]
    @PLId INT
AS
BEGIN
    SELECT ISNULL(MAX(PK), 0) FROM Packages WHERE PLId = @PLId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetLastPKID]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLastPKID]
    @PLId INT
AS
BEGIN
    DECLARE @MaxPK INT;

    -- ابتدا بزرگترین مقدار PK را پیدا کنید
    SELECT @MaxPK = MAX(PK) 
    FROM Packages 
    WHERE PLId = @PLId;

    -- بررسی مقدار @MaxPK
    IF @MaxPK IS NULL
    BEGIN
        SELECT 'No PK found for the given PLId', @PLId;
        RETURN;
    END

    -- سپس PKID مربوط به آن PK را برگردانید
    SELECT PKID
    FROM Packages
    WHERE PLId = @PLId AND PK = @MaxPK;
END
GO
/****** Object:  StoredProcedure [dbo].[GetLatestRequestNoByTypeId]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLatestRequestNoByTypeId]
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @latestRequestNo INT;

    SELECT @latestRequestNo = ISNULL(MAX(CAST(RequestNo AS INT)), 0)
    FROM Requests
    WHERE TypeId = 1;

    SELECT @latestRequestNo + 1 AS NextRequestNo;
END
GO
/****** Object:  StoredProcedure [dbo].[GetLocItemById]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLocItemById]
    @LocItemID INT
AS
BEGIN
    SELECT * FROM LocItems
    WHERE LocItemID = @LocItemID
END
GO
/****** Object:  StoredProcedure [dbo].[GetLocItemOFSelectedItemID_FOR_ISSUE_VOUCHER]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLocItemOFSelectedItemID_FOR_ISSUE_VOUCHER]
    @ItemIds VARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    ;WITH CTE_RequestData AS
    (
        SELECT 
            li.LocItemID,
            SUM(req.ReserveMivQty) AS TotalReserveMivQty,
            SUM(req.DelMivQty) AS TotalDelMivQty,
            SUM(li.NISQty) AS NISQty,
            SUM(li.RejectQty) AS RejectQty,
            SUM(req.DelMrvQty * -1) AS TotalReturnAcceptQty
        FROM 
            LocItems AS li
        LEFT OUTER JOIN Requests AS req ON li.LocItemID = req.LocItemID
        GROUP BY 
            li.LocItemID
    ),
    CTE_FilteredItems AS
    (
        SELECT 
            Items.ItemId,
            Items.Tag,
            Items.Description,
            ISNULL(SUM(li.Qty), 0) AS Qty, 
            ISNULL(SUM(li.Qty), 0) 
                - ISNULL(SUM(rd.TotalReserveMivQty), 0) 
                - ISNULL(SUM(rd.TotalDelMivQty), 0) 
                - ISNULL(SUM(li.NISQty), 0) 
                - ISNULL(SUM(li.RejectQty), 0) 
                + ISNULL(SUM(rd.TotalReturnAcceptQty), 0) AS Balance
        FROM 
            Items
        LEFT OUTER JOIN LocItems AS li ON Items.ItemId = li.ItemId
        LEFT OUTER JOIN CTE_RequestData AS rd ON li.LocItemID = rd.LocItemID
        WHERE Items.ItemId IN (SELECT value FROM STRING_SPLIT(@ItemIds, ','))
        GROUP BY 
            Items.ItemId,
            Items.Tag,
            Items.Description
    )
    SELECT 
        fi.ItemId,
        li.LocItemID,
        fi.Tag,
        fi.Description,
        fi.Balance,
        pl.PLName AS PL,          -- Add PL field
        pl.PoId AS PO,            -- Add PO field
        p.PK AS PK,              -- Add PK field
        pl.DesciplineId AS Discipline, -- Add Descipline field
        i.BatchNo AS BatchNo,   -- Add BatchNo field
        i.HeatNo AS HeatNo,     -- Add HeatNo field
        loc.LocationID AS Location, -- Add Location field
        fi.Qty AS QtyInLoc,      -- Add QtyInLoc field
        i.UnitID AS Units,        -- Add Unit field
        i.ScopeID AS Scope       -- Add Scope field
    FROM 
        CTE_FilteredItems AS fi
    INNER JOIN LocItems AS li ON fi.ItemId = li.ItemId
	INNER JOIN Items AS i ON fi.ItemId = i.ItemId
    INNER JOIN Packages AS p ON p.PKID = i.PKID -- Assuming the relationship
    INNER JOIN PackingLists AS pl ON p.PLId = pl.PLId
    INNER JOIN Locations AS loc ON li.LocationID = loc.LocationID -- Assuming the relationship
    WHERE fi.Balance > 0
    ORDER BY fi.ItemId, li.LocItemID;
END
GO
/****** Object:  StoredProcedure [dbo].[GetLocItemsByItemId]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLocItemsByItemId]
    @ItemId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        LocItemID,
        LocationID,
        ItemId,
        Qty,
        OverQty,
        ShortageQty,
        DamageQty,
        RejectQty,
        NISQty,
        EnteredBy,
        EnteredDate,
        EditedBy,
        EditedDate
    FROM LocItems
    WHERE ItemId = @ItemId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetMivDataByRequestNO]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetMivDataByRequestNO]
    @MivNumber NVARCHAR(50)
AS
BEGIN
    -- جلوگیری از ارسال تعداد ردیف‌های متاثر شده به کلاینت
    SET NOCOUNT ON;

    SELECT 
        Items.Tag, 
        Items.Description, 
        Requests.TypeID, 
        Requests.RequestNO, 
        Requests.ReqDate, 
        Requests.MRCNO, 
        Packages.PK, 
        PackingLists.PLName, 
        Items.ItemOfPk, 
        Units.UnitName,
        Companies.CompanyName,
        Requests.ReqDate,
        -- جمع کردن ReqMivQty برای هر LocItemID که مربوط به یک ItemID است
        SUM(Requests.ReqMivQty) AS ReqMivQty,
        Items.Remark
    FROM 
        LocItems 
        INNER JOIN Items ON LocItems.ItemId = Items.ItemId 
        INNER JOIN Packages ON Items.PKID = Packages.PKID 
        INNER JOIN PackingLists ON Packages.PLId = PackingLists.PLId 
        INNER JOIN Requests ON LocItems.LocItemID = Requests.LocItemID 
        INNER JOIN Units ON Items.UnitID = Units.UnitID 
        INNER JOIN Companies ON Requests.CompanyID = Companies.CompanyID
    WHERE 
        Requests.TypeID = 1 
        AND Requests.RequestNO = @MivNumber
    GROUP BY 
        Items.Tag, 
        Items.Description, 
        Requests.TypeID, 
        Requests.RequestNO, 
        Requests.ReqDate, 
        Requests.MRCNO, 
        Packages.PK, 
        PackingLists.PLName, 
        Items.ItemOfPk, 
        Units.UnitName,
        Companies.CompanyName,
        Requests.ReqDate,
        Items.Remark
END
GO
/****** Object:  StoredProcedure [dbo].[GetPackageById]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPackageById]
    @PackageId INT
WITH RECOMPILE
AS
BEGIN
    SELECT PKID, PLId, PK, NetW, GrossW, Dimension, Volume, ArrivalDate, Desciption, Remark, EnteredBy, EnteredDate, EditedBy, EditedDate, MSRNO, MSRPDF, MSRDate, MSREnteredBy, MSRStatus, MSRRev, MSRRevEnteredBy, MSRRevDate
    FROM Packages WHERE PKID = @PackageId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetPackageByPK]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPackageByPK]
    @PK INT
WITH RECOMPILE
AS
BEGIN
    SELECT PKID, PLId, PK, NetW, GrossW, Dimension, Volume, ArrivalDate, Desciption, Remark, EnteredBy, EnteredDate, EditedBy, EditedDate, MSRNO, MSRPDF, MSRDate, MSREnteredBy, MSRStatus, MSRRev, MSRRevEnteredBy, MSRRevDate
    FROM Packages
    WHERE PK = @PK;
END
GO
/****** Object:  StoredProcedure [dbo].[GetPackageCount]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPackageCount]
    @PLId INT
AS
BEGIN
    SELECT COUNT(1) FROM Packages WHERE PLId = @PLId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetPackageId]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPackageId]
    @PLId INT,
    @PK INT
AS
BEGIN
    SELECT PKID FROM Packages WHERE PLId = @PLId AND PK = @PK;
END
GO
/****** Object:  StoredProcedure [dbo].[GetPackagePKByPKID]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPackagePKByPKID]
    @PackageId INT
AS
BEGIN
    SELECT PK FROM Packages WHERE PKID = @PackageId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetPackagesByPLId]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPackagesByPLId]
    @PLId INT
AS
BEGIN
    SELECT PKID, PLId, PK, NetW, GrossW, Dimension, Volume, ArrivalDate, Desciption, Remark, EnteredBy, EnteredDate, EditedBy, EditedDate, MSRNO, MSRPDF, MSRDate, MSREnteredBy, MSRStatus, MSRRev, MSRRevEnteredBy, MSRRevDate
    FROM Packages WHERE PLId = @PLId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetPackingListById]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetPackingListById]
    @PlId INT
AS
BEGIN
    SELECT * FROM PackingLists WHERE PlId = @PlId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetPackingListByPlName]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetPackingListByPlName]
    @PlName NVARCHAR(255)
AS
BEGIN
    SELECT * FROM PackingLists WHERE PLName = @PlName;
END
GO
/****** Object:  StoredProcedure [dbo].[GetPackingListsWithoutPackages]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPackingListsWithoutPackages]
AS
BEGIN
    SELECT 
        PL.PLId, 
        PL.PLName
    FROM 
        PackingLists PL
    LEFT JOIN 
        Packages PKG ON PL.PLId = PKG.PLId
    WHERE 
        PKG.PLId IS NULL
END
GO
/****** Object:  StoredProcedure [dbo].[GetTotalIssueRecordCount]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTotalIssueRecordCount]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT COUNT(*)
    FROM 
    (
        -- اجرای query مشابهی که در Stored Procedure اصلی استفاده می‌شود
        SELECT 
            ISNULL(SUM(li.Qty), 0) 
                - ISNULL(SUM(rd.TotalReserveMivQty), 0) 
                - ISNULL(SUM(rd.TotalDelMivQty), 0) 
                - ISNULL(SUM(li.NISQty), 0) 
                - ISNULL(SUM(li.RejectQty), 0) 
                + ISNULL(SUM(rd.TotalReturnAcceptQty), 0) AS Balance
        FROM 
            Items
        LEFT OUTER JOIN LocItems AS li ON Items.ItemId = li.ItemId
        LEFT OUTER JOIN 
        (
            SELECT 
                li.LocItemID,
                SUM(req.ReserveMivQty) AS TotalReserveMivQty,
                SUM(req.DelMivQty) AS TotalDelMivQty,
                SUM(li.NISQty) AS NISQty,
                SUM(li.RejectQty) AS RejectQty,
                SUM(req.DelMrvQty * -1) AS TotalReturnAcceptQty
            FROM 
                LocItems AS li
            LEFT OUTER JOIN Requests AS req ON li.LocItemID = req.LocItemID
            GROUP BY 
                li.LocItemID
        ) AS rd ON li.LocItemID = rd.LocItemID
        GROUP BY 
            Items.ItemId,
            Items.ScopeID,
            Items.UnitID,
            Items.PKID,
            Items.Tag,
            Items.Description,
            Items.HeatNo,
            Items.BatchNo,
            Items.Remark,
            Items.Hold
        HAVING 
            ISNULL(SUM(li.Qty), 0) 
                - ISNULL(SUM(rd.TotalReserveMivQty), 0) 
                - ISNULL(SUM(rd.TotalDelMivQty), 0) 
                - ISNULL(SUM(li.NISQty), 0) 
                - ISNULL(SUM(li.RejectQty), 0) 
                + ISNULL(SUM(rd.TotalReturnAcceptQty), 0) > 0
    ) AS CountedItems;
END
GO
/****** Object:  StoredProcedure [dbo].[GetTotalItemsRecordCount]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[GetTotalItemsRecordCount]
AS
BEGIN
    SET NOCOUNT ON;

    -- تعداد ردیف‌های جدول Items را برمی‌گرداند
    SELECT COUNT(*)
    FROM Items;
END
GO
/****** Object:  StoredProcedure [dbo].[InsertRequestBatch]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertRequestBatch]
    @CompanyID INT,
    @ContractId INT,
    @MRCNO NVARCHAR(50),
    @AreaUnitID INT,
    @IssuedBy INT,  -- اضافه کردن IssuedBy
    @RequestMivs NewRequestDtoType READONLY
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @NextMIVNumber INT;

    BEGIN TRANSACTION;

    -- گرفتن آخرین شماره MIV و شروع از 1 اگر MIV وجود نداشت
    SELECT TOP 1 @NextMIVNumber = TRY_CAST(RequestNo AS INT) + 1
    FROM Requests
    WHERE TypeId = 1 AND TRY_CAST(RequestNo AS INT) IS NOT NULL
    ORDER BY TRY_CAST(RequestNo AS INT) DESC;

    -- اگر مقدار NULL است از 1 شروع کن
    IF @NextMIVNumber IS NULL
        SET @NextMIVNumber = 1;

    -- وارد کردن درخواست‌ها با TypeId = 1 و شماره‌های MIV که 15 تا 15 تا افزایش می‌یابند
    INSERT INTO Requests (CompanyID, ContractId, MRCNO, AreaUnitID, ReqMivQty, ReserveMivQty, LocItemID, RequestNO, TypeId, IssuedBy,IssuedDate,ReqDate)
    SELECT 
        @CompanyID,
        @ContractId,
        @MRCNO,
        @AreaUnitID,
        ReqMivQty,
        ReserveMivQty,
        LocItemID,
        FORMAT(@NextMIVNumber + ((ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) - 1) / 15), 'D6'),
        1,  -- مقدار TypeId را به 1 تنظیم می‌کنیم
        @IssuedBy,
		GETDATE(),
		GETDATE()
    FROM @RequestMivs;

    COMMIT TRANSACTION;

    -- بازگرداندن شماره‌های جدید MIV
    SELECT DISTINCT FORMAT(@NextMIVNumber + ((ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) - 1) / 15), 'D6') AS NewMIVNumber
    FROM @RequestMivs;
END
GO
/****** Object:  StoredProcedure [dbo].[InsertRequestMivsBatch]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertRequestMivsBatch]
    @RequestMivs RequestDtoType READONLY
AS
BEGIN
    INSERT INTO Requests (CompanyID, ContractId, MRCNO, AreaUnitID, ReqMivQty, ReserveMivQty, LocItemID, RequestNO)
    SELECT CompanyID, ContractId, MRCNO, AreaUnitID, ReqMivQty, ReserveMivQty, LocItemID, RequestNO
    FROM @RequestMivs;
END
GO
/****** Object:  StoredProcedure [dbo].[IsLocationUsedByItem]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IsLocationUsedByItem]
    @LocationID INT,
    @ItemId INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if the locationID is used by any LocItem of the specified ItemId
    IF EXISTS (
        SELECT 1
        FROM LocItems
        WHERE LocationID = @LocationID
          AND ItemId = @ItemId
    )
    BEGIN
        -- Location is used by at least one LocItem of the specified ItemId
        SELECT 1 AS IsUsed;
    END
    ELSE
    BEGIN
        -- Location is not used by any LocItem of the specified ItemId
        SELECT 0 AS IsUsed;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[Search_Item]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Search_Item]
    @PageNumber INT = 1,
    @PageSize INT = 100
AS
BEGIN
    BEGIN TRY
        SET NOCOUNT ON;

        ;WITH CTE_RequestData AS
        (
            SELECT 
                li.LocItemID,
                SUM(req.ReserveMivQty) AS TotalReserveMivQty,
                SUM(req.DelMivQty) AS TotalDelMivQty,
                SUM(li.NISQty) AS NISQty,
                SUM(li.RejectQty) AS RejectQty,
                SUM(req.DelMrvQty * -1) AS TotalReturnAcceptQty
            FROM 
                LocItems AS li
            LEFT OUTER JOIN Requests AS req ON li.LocItemID = req.LocItemID
            GROUP BY 
                li.LocItemID
        ),
        CTE_FilteredItems AS
        (
            SELECT 
                Items.ItemId,
                Items.ScopeID,
                Items.UnitID,
                Items.PKID,
                Items.Tag,
                Items.Description,
                Items.HeatNo,
                Items.BatchNo,
                Items.Remark,
                Items.Hold,
                ISNULL(SUM(li.Qty), 0) AS Qty, 
                ISNULL(SUM(li.Qty), 0) 
                    - ISNULL(SUM(rd.TotalReserveMivQty), 0) 
                    - ISNULL(SUM(rd.TotalDelMivQty), 0) 
                    - ISNULL(SUM(li.NISQty), 0) 
                    - ISNULL(SUM(li.RejectQty), 0) 
                    + ISNULL(SUM(rd.TotalReturnAcceptQty), 0) AS Balance,
                ISNULL(SUM(li.Qty), 0) 
                    - ISNULL(SUM(rd.TotalDelMivQty), 0) 
                    - ISNULL(SUM(li.NISQty), 0) 
                    - ISNULL(SUM(li.RejectQty), 0) 
                    + ISNULL(SUM(rd.TotalReturnAcceptQty), 0) AS Inventory
            FROM 
                Items
            LEFT OUTER JOIN LocItems AS li ON Items.ItemId = li.ItemId
            LEFT OUTER JOIN CTE_RequestData AS rd ON li.LocItemID = rd.LocItemID
            GROUP BY 
                Items.ItemId,
                Items.ScopeID,
                Items.UnitID,
                Items.PKID,
                Items.Tag,
                Items.Description,
                Items.HeatNo,
                Items.BatchNo,
                Items.Remark,
                Items.Hold
        )
        SELECT 
            p.ArrivalDate,
            pl.Project,
            pl.PoId AS PoId,
            pl.VendorId AS Vendor,
            fi.ItemId,
            pl.PLName,
            p.PK,
            Items.ItemOfPk,
            fi.Tag,
            fi.Description,
            Items.UnitID AS Unit,
            ISNULL(SUM(Items.Qty), 0) AS QtyPL,
            MAX(fi.Qty) AS QtyInLoc, 
            MAX(fi.Balance) AS Balance,
            MAX(fi.Inventory) AS Inventory,
            pl.DesciplineId AS Discipline,
            Items.ScopeID AS Scope,
            fi.HeatNo,
            fi.BatchNo,
            fi.Remark,
            fi.Hold
        FROM 
            CTE_FilteredItems AS fi
        INNER JOIN Items ON fi.ItemId = Items.ItemId
        LEFT OUTER JOIN Packages AS p ON Items.PKID = p.PKID
        LEFT OUTER JOIN PackingLists AS pl ON p.PLId = pl.PLId
        GROUP BY 
            p.ArrivalDate,
            pl.Project,
            pl.PoId,
            pl.VendorId,
            fi.ItemId,
            pl.PLName,
            p.PK,
            Items.ItemOfPk,
            fi.Tag,
            fi.Description,
            Items.UnitID,
            Items.ScopeID,
            fi.HeatNo,
            fi.BatchNo,
            fi.Remark,
            fi.Hold,
            pl.DesciplineId
        ORDER BY fi.ItemId
        OFFSET @PageSize * (@PageNumber - 1) ROWS
        FETCH NEXT @PageSize ROWS ONLY;
    END TRY
    BEGIN CATCH
        -- مدیریت خطا
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[Search_Material_Issue_Voucher]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Search_Material_Issue_Voucher]
AS
WITH RequestData AS (
    SELECT 
        li.LocItemID,
        SUM(req.ReserveMivQty) AS TotalReserveMivQty,
        SUM(req.DelMivQty) AS TotalDelMivQty,
        SUM(li.NISQty) AS NISQty,
        SUM(li.RejectQty) AS RejectQty,
        SUM(req.ReserveMrvQty * -1) AS TotalReturnAcceptQty
    FROM 
        LocItems AS li
    LEFT OUTER JOIN Requests AS req ON li.LocItemID = req.LocItemID
    GROUP BY 
        li.LocItemID
),
FilteredItems AS (
    SELECT 
        Items.ItemId,
        Items.ScopeID,
        Items.UnitID,
        Items.PKID,
        Items.Tag,
        Items.Description,
        Items.HeatNo,
        Items.BatchNo,
        Items.Remark,
        Items.Hold,
        ISNULL(SUM(li.Qty), 0) - ISNULL(SUM(rd.TotalReserveMivQty), 0) - ISNULL(SUM(rd.TotalDelMivQty), 0) - ISNULL(SUM(li.NISQty), 0) - ISNULL(SUM(li.RejectQty), 0) + ISNULL(SUM(rd.TotalReturnAcceptQty), 0) AS Balance,
        ISNULL(SUM(li.Qty), 0) - ISNULL(SUM(rd.TotalDelMivQty), 0) - ISNULL(SUM(li.NISQty), 0) - ISNULL(SUM(li.RejectQty), 0) + ISNULL(SUM(rd.TotalReturnAcceptQty), 0) AS Inventory
    FROM 
        Items
    LEFT OUTER JOIN LocItems AS li ON Items.ItemId = li.ItemId
    LEFT OUTER JOIN RequestData AS rd ON li.LocItemID = rd.LocItemID
    GROUP BY 
        Items.ItemId,
        Items.ScopeID,
        Items.UnitID,
        Items.PKID,
        Items.Tag,
        Items.Description,
        Items.HeatNo,
        Items.BatchNo,
        Items.Remark,
        Items.Hold
    HAVING 
        ISNULL(SUM(li.Qty), 0) - ISNULL(SUM(rd.TotalReserveMivQty), 0) - ISNULL(SUM(rd.TotalDelMivQty), 0) - ISNULL(SUM(li.NISQty), 0) - ISNULL(SUM(li.RejectQty), 0) + ISNULL(SUM(rd.TotalReturnAcceptQty), 0) > 0
)
SELECT 
    p.ArrivalDate,
    pl.Project,
    po.PoName AS Po,
    v.VendorName AS Vendor,
    Items.ItemId,
    pl.PLName,
    p.PK,
    Items.ItemOfPk,
    Items.Tag,
    Items.Description,
    Units.UnitName AS Unit,
    ISNULL(SUM(Items.Qty), 0) AS QtyPL,
    MAX(fi.Balance) AS Balance,
    MAX(fi.Inventory) AS Inventory,
    d.DesciplineName AS Discipline,
    Scopes.ScopeName AS Scope,
    Items.HeatNo,
    Items.BatchNo,
    Items.Remark,
    Items.Hold
FROM 
    FilteredItems AS fi
INNER JOIN Items ON fi.ItemId = Items.ItemId
INNER JOIN Scopes ON Items.ScopeID = Scopes.ScopeID
INNER JOIN Units ON Items.UnitID = Units.UnitID
LEFT OUTER JOIN Packages AS p ON Items.PKID = p.PKID
LEFT OUTER JOIN PackingLists AS pl ON p.PLId = pl.PLId
LEFT OUTER JOIN Desciplines AS d ON pl.DesciplineId = d.DesciplineId
LEFT OUTER JOIN Pos AS po ON pl.PoId = po.PoId
LEFT OUTER JOIN Vendors AS v ON pl.VendorId = v.VendorID
GROUP BY 
    p.ArrivalDate,
    pl.Project,
    po.PoName,
    v.VendorName,
    Items.ItemId,
    pl.PLName,
    p.PK,
    Items.ItemOfPk,
    Items.Tag,
    Items.Description,
    Units.UnitName,
    Scopes.ScopeName,
    Items.HeatNo,
    Items.BatchNo,
    Items.Remark,
    Items.Hold,
    d.DesciplineName;
GO
/****** Object:  StoredProcedure [dbo].[Search_Material_Issue_Voucher_NOLOCK]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Search_Material_Issue_Voucher_NOLOCK]
AS
WITH RequestData AS (
    SELECT 
        li.LocItemID,
        SUM(req.ReserveMivQty) AS TotalReserveMivQty,
        SUM(req.DelMivQty) AS TotalDelMivQty,
        SUM(li.NISQty) AS NISQty,
        SUM(li.RejectQty) AS RejectQty,
        SUM(req.DelMrvQty * -1) AS TotalReturnAcceptQty
    FROM 
        LocItems AS li WITH (NOLOCK)
    LEFT OUTER JOIN Requests AS req WITH (NOLOCK) ON li.LocItemID = req.LocItemID
    GROUP BY 
        li.LocItemID
),
FilteredItems AS (
    SELECT 
        Items.ItemId,
        Items.ScopeID,
        Items.UnitID,
        Items.PKID,
        Items.Tag,
        Items.Description,
        Items.HeatNo,
        Items.BatchNo,
        Items.Remark,
        Items.Hold,
        ISNULL(SUM(li.Qty), 0) 
            - ISNULL(SUM(rd.TotalReserveMivQty), 0) 
            - ISNULL(SUM(rd.TotalDelMivQty), 0) 
            - ISNULL(SUM(li.NISQty), 0) 
            - ISNULL(SUM(li.RejectQty), 0) 
            + ISNULL(SUM(rd.TotalReturnAcceptQty), 0) AS Balance,
        ISNULL(SUM(li.Qty), 0) 
            - ISNULL(SUM(rd.TotalDelMivQty), 0) 
            - ISNULL(SUM(li.NISQty), 0) 
            - ISNULL(SUM(li.RejectQty), 0) 
            + ISNULL(SUM(rd.TotalReturnAcceptQty), 0) AS Inventory
    FROM 
        Items WITH (NOLOCK)
    LEFT OUTER JOIN LocItems AS li WITH (NOLOCK) ON Items.ItemId = li.ItemId
    LEFT OUTER JOIN RequestData AS rd ON li.LocItemID = rd.LocItemID
    GROUP BY 
        Items.ItemId,
        Items.ScopeID,
        Items.UnitID,
        Items.PKID,
        Items.Tag,
        Items.Description,
        Items.HeatNo,
        Items.BatchNo,
        Items.Remark,
        Items.Hold
)
SELECT 
    p.ArrivalDate,
    pl.Project,
    po.PoName AS Po,
    v.VendorName AS Vendor,
    Items.ItemId,
    pl.PLName,
    p.PK,
    Items.ItemOfPk,
    Items.Tag,
    Items.Description,
    Units.UnitName AS Unit,
    ISNULL(SUM(Items.Qty), 0) AS QtyPL,
    MAX(fi.Balance) AS Balance,
    MAX(fi.Inventory) AS Inventory,
    d.DesciplineName AS Discipline,
    Scopes.ScopeName AS Scope,
    Items.HeatNo,
    Items.BatchNo,
    Items.Remark,
    Items.Hold
FROM 
    FilteredItems AS fi
INNER JOIN Items WITH (NOLOCK) ON fi.ItemId = Items.ItemId
INNER JOIN Scopes WITH (NOLOCK) ON Items.ScopeID = Scopes.ScopeID
INNER JOIN Units WITH (NOLOCK) ON Items.UnitID = Units.UnitID
LEFT OUTER JOIN Packages AS p WITH (NOLOCK) ON Items.PKID = p.PKID
LEFT OUTER JOIN PackingLists AS pl WITH (NOLOCK) ON p.PLId = pl.PLId
LEFT OUTER JOIN Desciplines AS d WITH (NOLOCK) ON pl.DesciplineId = d.DesciplineId
LEFT OUTER JOIN Pos AS po WITH (NOLOCK) ON pl.PoId = po.PoId
LEFT OUTER JOIN Vendors AS v WITH (NOLOCK) ON pl.VendorId = v.VendorID
GROUP BY 
    p.ArrivalDate,
    pl.Project,
    po.PoName,
    v.VendorName,
    Items.ItemId,
    pl.PLName,
    p.PK,
    Items.ItemOfPk,
    Items.Tag,
    Items.Description,
    Units.UnitName,
    Scopes.ScopeName,
    Items.HeatNo,
    Items.BatchNo,
    Items.Remark,
    Items.Hold,
    d.DesciplineName
HAVING 
    MAX(fi.Balance) > 0;
GO
/****** Object:  StoredProcedure [dbo].[Search_Material_Issue_Voucher_NOLOCK2]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Search_Material_Issue_Voucher_NOLOCK2]
AS
BEGIN
    -- ایجاد temp table برای ذخیره‌سازی داده‌های تجمیع‌شده از LocItems و Requests
    CREATE TABLE #RequestData (
        LocItemID INT,
        TotalReserveMivQty DECIMAL(18, 2),
        TotalDelMivQty DECIMAL(18, 2),
        NISQty DECIMAL(18, 2),
        RejectQty DECIMAL(18, 2),
        TotalReturnAcceptQty DECIMAL(18, 2)
    )

    -- پر کردن temp table با استفاده از subquery
    INSERT INTO #RequestData (LocItemID, TotalReserveMivQty, TotalDelMivQty, NISQty, RejectQty, TotalReturnAcceptQty)
    SELECT 
        li.LocItemID,
        SUM(req.ReserveMivQty) AS TotalReserveMivQty,
        SUM(req.DelMivQty) AS TotalDelMivQty,
        SUM(li.NISQty) AS NISQty,
        SUM(li.RejectQty) AS RejectQty,
        SUM(req.DelMrvQty * -1) AS TotalReturnAcceptQty
    FROM 
        LocItems AS li WITH (NOLOCK)
    LEFT OUTER JOIN Requests AS req WITH (NOLOCK) ON li.LocItemID = req.LocItemID
    GROUP BY 
        li.LocItemID

    -- ایجاد temp table برای ذخیره‌سازی داده‌های تجمیع‌شده از Items و #RequestData
    CREATE TABLE #FilteredItems (
        ItemId INT,
        ScopeID INT,
        UnitID INT,
        PKID INT,
        Tag NVARCHAR(50),
        Description NVARCHAR(255),
        HeatNo NVARCHAR(50),
        BatchNo NVARCHAR(50),
        Remark NVARCHAR(255),
        Hold BIT,
        Balance DECIMAL(18, 2),
        Inventory DECIMAL(18, 2)
    )

    -- پر کردن temp table با استفاده از subquery
    INSERT INTO #FilteredItems (ItemId, ScopeID, UnitID, PKID, Tag, Description, HeatNo, BatchNo, Remark, Hold, Balance, Inventory)
    SELECT 
        Items.ItemId,
        Items.ScopeID,
        Items.UnitID,
        Items.PKID,
        Items.Tag,
        Items.Description,
        Items.HeatNo,
        Items.BatchNo,
        Items.Remark,
        Items.Hold,
        ISNULL(SUM(li.Qty), 0) 
            - ISNULL(SUM(rd.TotalReserveMivQty), 0) 
            - ISNULL(SUM(rd.TotalDelMivQty), 0) 
            - ISNULL(SUM(li.NISQty), 0) 
            - ISNULL(SUM(li.RejectQty), 0) 
            + ISNULL(SUM(rd.TotalReturnAcceptQty), 0) AS Balance,
        ISNULL(SUM(li.Qty), 0) 
            - ISNULL(SUM(rd.TotalDelMivQty), 0) 
            - ISNULL(SUM(li.NISQty), 0) 
            - ISNULL(SUM(li.RejectQty), 0) 
            + ISNULL(SUM(rd.TotalReturnAcceptQty), 0) AS Inventory
    FROM 
        Items WITH (NOLOCK)
    LEFT OUTER JOIN LocItems AS li WITH (NOLOCK) ON Items.ItemId = li.ItemId
    LEFT OUTER JOIN #RequestData AS rd ON li.LocItemID = rd.LocItemID
    GROUP BY 
        Items.ItemId,
        Items.ScopeID,
        Items.UnitID,
        Items.PKID,
        Items.Tag,
        Items.Description,
        Items.HeatNo,
        Items.BatchNo,
        Items.Remark,
        Items.Hold

    -- اجرای query نهایی با استفاده از temp table ها
    SELECT 
        p.ArrivalDate,
        pl.Project,
        po.PoName AS Po,
        v.VendorName AS Vendor,
        fi.ItemId,
        pl.PLName,
        p.PK,
        Items.ItemOfPk,
        fi.Tag,
        fi.Description,
        Units.UnitName AS Unit,
        ISNULL(SUM(Items.Qty), 0) AS QtyPL,
        MAX(fi.Balance) AS Balance,
        MAX(fi.Inventory) AS Inventory,
        d.DesciplineName AS Discipline,
        Scopes.ScopeName AS Scope,
        fi.HeatNo,
        fi.BatchNo,
        fi.Remark,
        fi.Hold
    FROM 
        #FilteredItems AS fi
    INNER JOIN Items WITH (NOLOCK) ON fi.ItemId = Items.ItemId
    INNER JOIN Scopes WITH (NOLOCK) ON Items.ScopeID = Scopes.ScopeID
    INNER JOIN Units WITH (NOLOCK) ON Items.UnitID = Units.UnitID
    LEFT OUTER JOIN Packages AS p WITH (NOLOCK) ON Items.PKID = p.PKID
    LEFT OUTER JOIN PackingLists AS pl WITH (NOLOCK) ON p.PLId = pl.PLId
    LEFT OUTER JOIN Desciplines AS d WITH (NOLOCK) ON pl.DesciplineId = d.DesciplineId
    LEFT OUTER JOIN Pos AS po WITH (NOLOCK) ON pl.PoId = po.PoId
    LEFT OUTER JOIN Vendors AS v WITH (NOLOCK) ON pl.VendorId = v.VendorID
    GROUP BY 
        p.ArrivalDate,
        pl.Project,
        po.PoName,
        v.VendorName,
        fi.ItemId,
        pl.PLName,
        p.PK,
        Items.ItemOfPk,
        fi.Tag,
        fi.Description,
        Units.UnitName,
        Scopes.ScopeName,
        fi.HeatNo,
        fi.BatchNo,
        fi.Remark,
        fi.Hold,
        d.DesciplineName
    HAVING 
        MAX(fi.Balance) > 0;

    -- حذف temp table ها برای آزادسازی حافظه
    DROP TABLE #RequestData;
    DROP TABLE #FilteredItems;
END
GO
/****** Object:  StoredProcedure [dbo].[Search_Material_Issue_Voucher2]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[Search_Material_Issue_Voucher2]
AS
BEGIN
    BEGIN TRY
        SET NOCOUNT ON;

        -- استفاده از CTE به جای جدول موقتی #RequestData
        ;WITH CTE_RequestData AS
        (
            SELECT 
                li.LocItemID,
                SUM(req.ReserveMivQty) AS TotalReserveMivQty,
                SUM(req.DelMivQty) AS TotalDelMivQty,
                SUM(li.NISQty) AS NISQty,
                SUM(li.RejectQty) AS RejectQty,
                SUM(req.DelMrvQty * -1) AS TotalReturnAcceptQty
            FROM 
                LocItems AS li
            LEFT OUTER JOIN Requests AS req ON li.LocItemID = req.LocItemID
            GROUP BY 
                li.LocItemID
        ),

        -- استفاده از CTE به جای جدول موقتی #FilteredItems
        CTE_FilteredItems AS
        (
            SELECT 
                Items.ItemId,
                Items.ScopeID,
                Items.UnitID,
                Items.PKID,
                Items.Tag,
                Items.Description,
                Items.HeatNo,
                Items.BatchNo,
                Items.Remark,
                Items.Hold,
                ISNULL(SUM(li.Qty), 0) 
                    - ISNULL(SUM(rd.TotalReserveMivQty), 0) 
                    - ISNULL(SUM(rd.TotalDelMivQty), 0) 
                    - ISNULL(SUM(li.NISQty), 0) 
                    - ISNULL(SUM(li.RejectQty), 0) 
                    + ISNULL(SUM(rd.TotalReturnAcceptQty), 0) AS Balance,
                ISNULL(SUM(li.Qty), 0) 
                    - ISNULL(SUM(rd.TotalDelMivQty), 0) 
                    - ISNULL(SUM(li.NISQty), 0) 
                    - ISNULL(SUM(li.RejectQty), 0) 
                    + ISNULL(SUM(rd.TotalReturnAcceptQty), 0) AS Inventory
            FROM 
                Items
            LEFT OUTER JOIN LocItems AS li ON Items.ItemId = li.ItemId
            LEFT OUTER JOIN CTE_RequestData AS rd ON li.LocItemID = rd.LocItemID
            GROUP BY 
                Items.ItemId,
                Items.ScopeID,
                Items.UnitID,
                Items.PKID,
                Items.Tag,
                Items.Description,
                Items.HeatNo,
                Items.BatchNo,
                Items.Remark,
                Items.Hold
        )

        -- اجرای query نهایی با استفاده از CTE ها
        SELECT 
            p.ArrivalDate,
            pl.Project,
            po.PoName AS Po,
            v.VendorName AS Vendor,
            fi.ItemId,
            pl.PLName,
            p.PK,
            Items.ItemOfPk,
            fi.Tag,
            fi.Description,
            Units.UnitName AS Unit,
            ISNULL(SUM(Items.Qty), 0) AS QtyPL,
            MAX(fi.Balance) AS Balance,
            MAX(fi.Inventory) AS Inventory,
            d.DesciplineName AS Discipline,
            Scopes.ScopeName AS Scope,
            fi.HeatNo,
            fi.BatchNo,
            fi.Remark,
            fi.Hold
        FROM 
            CTE_FilteredItems AS fi
        INNER JOIN Items ON fi.ItemId = Items.ItemId
        INNER JOIN Scopes ON Items.ScopeID = Scopes.ScopeID
        INNER JOIN Units ON Items.UnitID = Units.UnitID
        LEFT OUTER JOIN Packages AS p ON Items.PKID = p.PKID
        LEFT OUTER JOIN PackingLists AS pl ON p.PLId = pl.PLId
        LEFT OUTER JOIN Desciplines AS d ON pl.DesciplineId = d.DesciplineId
        LEFT OUTER JOIN Pos AS po ON pl.PoId = po.PoId
        LEFT OUTER JOIN Vendors AS v ON pl.VendorId = v.VendorID
        GROUP BY 
            p.ArrivalDate,
            pl.Project,
            po.PoName,
            v.VendorName,
            fi.ItemId,
            pl.PLName,
            p.PK,
            Items.ItemOfPk,
            fi.Tag,
            fi.Description,
            Units.UnitName,
            Scopes.ScopeName,
            fi.HeatNo,
            fi.BatchNo,
            fi.Remark,
            fi.Hold,
            d.DesciplineName
        HAVING 
            MAX(fi.Balance) > 0;
    END TRY

    BEGIN CATCH
        -- مدیریت خطا
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[Search_Material_Issue_Voucher3]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Search_Material_Issue_Voucher3]
AS
BEGIN
    BEGIN TRY
        SET NOCOUNT ON;

        -- استفاده از CTE به جای جدول موقتی #RequestData
        ;WITH CTE_RequestData AS
        (
            SELECT 
                li.LocItemID,
                SUM(req.ReserveMivQty) AS TotalReserveMivQty,
                SUM(req.DelMivQty) AS TotalDelMivQty,
                SUM(li.NISQty) AS NISQty,
                SUM(li.RejectQty) AS RejectQty,
                SUM(req.DelMrvQty * -1) AS TotalReturnAcceptQty
            FROM 
                LocItems AS li
            LEFT OUTER JOIN Requests AS req ON li.LocItemID = req.LocItemID
            GROUP BY 
                li.LocItemID
        ),

        -- استفاده از CTE به جای جدول موقتی #FilteredItems
        CTE_FilteredItems AS
        (
            SELECT 
                Items.ItemId,
                Items.ScopeID,
                Items.UnitID,
                Items.PKID,
                Items.Tag,
                Items.Description,
                Items.HeatNo,
                Items.BatchNo,
                Items.Remark,
                Items.Hold,
                ISNULL(SUM(li.Qty), 0) 
                    - ISNULL(SUM(rd.TotalReserveMivQty), 0) 
                    - ISNULL(SUM(rd.TotalDelMivQty), 0) 
                    - ISNULL(SUM(li.NISQty), 0) 
                    - ISNULL(SUM(li.RejectQty), 0) 
                    + ISNULL(SUM(rd.TotalReturnAcceptQty), 0) AS Balance,
                ISNULL(SUM(li.Qty), 0) 
                    - ISNULL(SUM(rd.TotalDelMivQty), 0) 
                    - ISNULL(SUM(li.NISQty), 0) 
                    - ISNULL(SUM(li.RejectQty), 0) 
                    + ISNULL(SUM(rd.TotalReturnAcceptQty), 0) AS Inventory
            FROM 
                Items
            LEFT OUTER JOIN LocItems AS li ON Items.ItemId = li.ItemId
            LEFT OUTER JOIN CTE_RequestData AS rd ON li.LocItemID = rd.LocItemID
            GROUP BY 
                Items.ItemId,
                Items.ScopeID,
                Items.UnitID,
                Items.PKID,
                Items.Tag,
                Items.Description,
                Items.HeatNo,
                Items.BatchNo,
                Items.Remark,
                Items.Hold
        )

        -- اجرای query نهایی با استفاده از CTE ها
        SELECT 
            p.ArrivalDate,
            pl.Project,
            pl.PoId AS Po,
            pl.VendorId AS Vendor,
            fi.ItemId,
            pl.PLName,
            p.PK,
            Items.ItemOfPk,
            fi.Tag,
            fi.Description,
            Items.UnitID AS Unit,
            ISNULL(SUM(Items.Qty), 0) AS QtyinLoc,
            MAX(fi.Balance) AS Balance,
            MAX(fi.Inventory) AS Inventory,
            pl.DesciplineId AS Discipline,
            Items.ScopeID AS Scope,
            fi.HeatNo,
            fi.BatchNo,
            fi.Remark,
            fi.Hold
        FROM 
            CTE_FilteredItems AS fi
        INNER JOIN Items ON fi.ItemId = Items.ItemId
        --INNER JOIN Scopes ON Items.ScopeID = Scopes.ScopeID
        --INNER JOIN Units ON Items.UnitID = Units.UnitID
        LEFT OUTER JOIN Packages AS p ON Items.PKID = p.PKID
        LEFT OUTER JOIN PackingLists AS pl ON p.PLId = pl.PLId
        --LEFT OUTER JOIN Desciplines AS d ON pl.DesciplineId = d.DesciplineId
        --LEFT OUTER JOIN Pos AS po ON pl.PoId = po.PoId
        --LEFT OUTER JOIN Vendors AS v ON pl.VendorId = v.VendorID
        GROUP BY 
            p.ArrivalDate,
            pl.Project,
            pl.PoId,
            pl.VendorId,
            fi.ItemId,
            pl.PLName,
            p.PK,
            Items.ItemOfPk,
            fi.Tag,
            fi.Description,
            Items.UnitID,
            Items.ScopeID,
            fi.HeatNo,
            fi.BatchNo,
            fi.Remark,
            fi.Hold,
            pl.DesciplineId
        HAVING 
            MAX(fi.Balance) > 0;
    END TRY

    BEGIN CATCH
        -- مدیریت خطا
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[Search_Material_Issue_Voucher4]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Search_Material_Issue_Voucher4]
AS
BEGIN
    BEGIN TRY
        SET NOCOUNT ON;

        -- استفاده از CTE به جای جدول موقتی #RequestData
        ;WITH CTE_RequestData AS
        (
            SELECT 
                li.LocItemID,
                SUM(req.ReserveMivQty) AS TotalReserveMivQty,
                SUM(req.DelMivQty) AS TotalDelMivQty,
                SUM(li.NISQty) AS NISQty,
                SUM(li.RejectQty) AS RejectQty,
                SUM(req.DelMrvQty * -1) AS TotalReturnAcceptQty
            FROM 
                LocItems AS li
            LEFT OUTER JOIN Requests AS req ON li.LocItemID = req.LocItemID
            GROUP BY 
                li.LocItemID
        ),

        -- استفاده از CTE به جای جدول موقتی #FilteredItems
        CTE_FilteredItems AS
        (
            SELECT 
                Items.ItemId,
                Items.ScopeID,
                Items.UnitID,
                Items.PKID,
                Items.Tag,
                Items.Description,
                Items.HeatNo,
                Items.BatchNo,
                Items.Remark,
                Items.Hold,
                ISNULL(SUM(li.Qty), 0) AS Qty, -- برگرداندن ستون Qty
                ISNULL(SUM(li.Qty), 0) 
                    - ISNULL(SUM(rd.TotalReserveMivQty), 0) 
                    - ISNULL(SUM(rd.TotalDelMivQty), 0) 
                    - ISNULL(SUM(li.NISQty), 0) 
                    - ISNULL(SUM(li.RejectQty), 0) 
                    + ISNULL(SUM(rd.TotalReturnAcceptQty), 0) AS Balance,
                ISNULL(SUM(li.Qty), 0) 
                    - ISNULL(SUM(rd.TotalDelMivQty), 0) 
                    - ISNULL(SUM(li.NISQty), 0) 
                    - ISNULL(SUM(li.RejectQty), 0) 
                    + ISNULL(SUM(rd.TotalReturnAcceptQty), 0) AS Inventory
            FROM 
                Items
            LEFT OUTER JOIN LocItems AS li ON Items.ItemId = li.ItemId
            LEFT OUTER JOIN CTE_RequestData AS rd ON li.LocItemID = rd.LocItemID
            GROUP BY 
                Items.ItemId,
                Items.ScopeID,
                Items.UnitID,
                Items.PKID,
                Items.Tag,
                Items.Description,
                Items.HeatNo,
                Items.BatchNo,
                Items.Remark,
                Items.Hold
        )

        -- اجرای query نهایی با استفاده از CTE ها
        SELECT 
            p.ArrivalDate,
            pl.Project,
            pl.PoId AS Po,
            pl.VendorId AS Vendor,
            fi.ItemId,
            pl.PLName,
            p.PK,
            Items.ItemOfPk,
            fi.Tag,
            fi.Description,
            Items.UnitID AS Unit,
            ISNULL(SUM(Items.Qty), 0) AS QtyPL,
            MAX(fi.Qty) AS QtyInLoc, -- اضافه کردن ستون Qty
            MAX(fi.Balance) AS Balance,
            MAX(fi.Inventory) AS Inventory,
            pl.DesciplineId AS Discipline,
            Items.ScopeID AS Scope,
            fi.HeatNo,
            fi.BatchNo,
            fi.Remark,
            fi.Hold
        FROM 
            CTE_FilteredItems AS fi
        INNER JOIN Items ON fi.ItemId = Items.ItemId
        LEFT OUTER JOIN Packages AS p ON Items.PKID = p.PKID
        LEFT OUTER JOIN PackingLists AS pl ON p.PLId = pl.PLId
        GROUP BY 
            p.ArrivalDate,
            pl.Project,
            pl.PoId,
            pl.VendorId,
            fi.ItemId,
            pl.PLName,
            p.PK,
            Items.ItemOfPk,
            fi.Tag,
            fi.Description,
            Items.UnitID,
            Items.ScopeID,
            fi.HeatNo,
            fi.BatchNo,
            fi.Remark,
            fi.Hold,
            pl.DesciplineId
        HAVING 
            MAX(fi.Balance) > 0;
    END TRY

    BEGIN CATCH
        -- مدیریت خطا
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[Search_Material_Issue_Voucher5]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Search_Material_Issue_Voucher5]
    @PageNumber INT = 1,
    @PageSize INT = 100
AS
BEGIN
    BEGIN TRY
        SET NOCOUNT ON;

        ;WITH CTE_RequestData AS
        (
            SELECT 
                li.LocItemID,
                SUM(req.ReserveMivQty) AS TotalReserveMivQty,
                SUM(req.DelMivQty) AS TotalDelMivQty,
                SUM(li.NISQty) AS NISQty,
                SUM(li.RejectQty) AS RejectQty,
                SUM(req.DelMrvQty * -1) AS TotalReturnAcceptQty
            FROM 
                LocItems AS li
            LEFT OUTER JOIN Requests AS req ON li.LocItemID = req.LocItemID
            GROUP BY 
                li.LocItemID
        ),
        CTE_FilteredItems AS
        (
            SELECT 
                Items.ItemId,
                Items.ScopeID,
                Items.UnitID,
                Items.PKID,
                Items.Tag,
                Items.Description,
                Items.HeatNo,
                Items.BatchNo,
                Items.Remark,
                Items.Hold,
                ISNULL(SUM(li.Qty), 0) AS Qty, 
                ISNULL(SUM(li.Qty), 0) 
                    - ISNULL(SUM(rd.TotalReserveMivQty), 0) 
                    - ISNULL(SUM(rd.TotalDelMivQty), 0) 
                    - ISNULL(SUM(li.NISQty), 0) 
                    - ISNULL(SUM(li.RejectQty), 0) 
                    + ISNULL(SUM(rd.TotalReturnAcceptQty), 0) AS Balance,
                ISNULL(SUM(li.Qty), 0) 
                    - ISNULL(SUM(rd.TotalDelMivQty), 0) 
                    - ISNULL(SUM(li.NISQty), 0) 
                    - ISNULL(SUM(li.RejectQty), 0) 
                    + ISNULL(SUM(rd.TotalReturnAcceptQty), 0) AS Inventory
            FROM 
                Items
            LEFT OUTER JOIN LocItems AS li ON Items.ItemId = li.ItemId
            LEFT OUTER JOIN CTE_RequestData AS rd ON li.LocItemID = rd.LocItemID
            GROUP BY 
                Items.ItemId,
                Items.ScopeID,
                Items.UnitID,
                Items.PKID,
                Items.Tag,
                Items.Description,
                Items.HeatNo,
                Items.BatchNo,
                Items.Remark,
                Items.Hold
        )
        SELECT 
            p.ArrivalDate,
            pl.Project,
            pl.PoId AS Po,
            pl.VendorId AS Vendor,
            fi.ItemId,
            pl.PLName,
            p.PK,
            Items.ItemOfPk,
            fi.Tag,
            fi.Description,
            Items.UnitID AS Unit,
            ISNULL(SUM(Items.Qty), 0) AS QtyPL,
            MAX(fi.Qty) AS QtyInLoc, 
            MAX(fi.Balance) AS Balance,
            MAX(fi.Inventory) AS Inventory,
            pl.DesciplineId AS Discipline,
            Items.ScopeID AS Scope,
            fi.HeatNo,
            fi.BatchNo,
            fi.Remark,
            fi.Hold
        FROM 
            CTE_FilteredItems AS fi
        INNER JOIN Items ON fi.ItemId = Items.ItemId
        LEFT OUTER JOIN Packages AS p ON Items.PKID = p.PKID
        LEFT OUTER JOIN PackingLists AS pl ON p.PLId = pl.PLId
        GROUP BY 
            p.ArrivalDate,
            pl.Project,
            pl.PoId,
            pl.VendorId,
            fi.ItemId,
            pl.PLName,
            p.PK,
            Items.ItemOfPk,
            fi.Tag,
            fi.Description,
            Items.UnitID,
            Items.ScopeID,
            fi.HeatNo,
            fi.BatchNo,
            fi.Remark,
            fi.Hold,
            pl.DesciplineId
        HAVING 
            MAX(fi.Balance) > 0
        ORDER BY fi.ItemId
        OFFSET @PageSize * (@PageNumber - 1) ROWS
        FETCH NEXT @PageSize ROWS ONLY;
    END TRY
    BEGIN CATCH
        -- مدیریت خطا
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AddItem]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AddItem]
    @PKID INT,
    @ItemOfPk INT,
    @Tag NVARCHAR(255),
    @Description NVARCHAR(max),
    @UnitID INT,
    @Qty DECIMAL(18, 2),
    @OverQty DECIMAL(18, 2),
    @ShortageQty DECIMAL(18, 2),
    @DamageQty DECIMAL(18, 2),
    @IncorectQty DECIMAL(18, 2),
    @ScopeID INT,
    @HeatNo NVARCHAR(255),
    @BatchNo NVARCHAR(255),
    @Remark NVARCHAR(255),
    @MTRNo NVARCHAR(255),
    @ColorCode NVARCHAR(255),
    @LabelNo NVARCHAR(255),
    @EnteredBy INT,
    @EnteredDate DATETIME,
    @EditedBy INT,
    @EditedDate DATETIME,
    @Price DECIMAL(18, 2),
    @UnitPriceID INT,
    @NetW DECIMAL(18, 2),
    @GrossW DECIMAL(18, 2),
    @ItemCodeId INT,
    @BaseMaterial NVARCHAR(50),
    @Hold BIT,
    @NIS DECIMAL(18, 2)
AS
BEGIN
    INSERT INTO Items (PKID, ItemOfPk, Tag, Description, UnitID, Qty, OverQty, ShortageQty, DamageQty, IncorectQty, ScopeID, HeatNo, BatchNo, Remark, MTRNo, ColorCode, LabelNo, EnteredBy, EnteredDate, EditedBy, EditedDate, Price, UnitPriceID, NetW, GrossW, ItemCodeId, BaseMaterial, Hold, NIS)
    VALUES (@PKID, @ItemOfPk, @Tag, @Description, @UnitID, @Qty, @OverQty, @ShortageQty, @DamageQty, @IncorectQty, @ScopeID, @HeatNo, @BatchNo, @Remark, @MTRNo, @ColorCode, @LabelNo, @EnteredBy, @EnteredDate, @EditedBy, @EditedDate, @Price, @UnitPriceID, @NetW, @GrossW, @ItemCodeId, @BaseMaterial, @Hold, @NIS)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AddItemWithAddLocitemWithTrigger]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AddItemWithAddLocitemWithTrigger]
    @PKID INT,
    @ItemOfPk INT,
    @Tag NVARCHAR(50),
    @Description NVARCHAR(250),
    @UnitID INT,
    @Qty DECIMAL(18, 2),
    @OverQty DECIMAL(18, 2),
    @ShortageQty DECIMAL(18, 2),
    @DamageQty DECIMAL(18, 2),
    @IncorectQty DECIMAL(18, 2),
    @ScopeID INT,
    @HeatNo NVARCHAR(50),
    @BatchNo NVARCHAR(50),
    @Remark NVARCHAR(250),
    @MTRNo NVARCHAR(50),
    @ColorCode NVARCHAR(50),
    @LabelNo NVARCHAR(50),
    @EnteredBy INT,
    @EnteredDate DATETIME,
    @EditedBy INT,
    @EditedDate DATETIME,
    @Price DECIMAL(18, 2),
    @UnitPriceID INT,
    @NetW DECIMAL(18, 2),
    @GrossW DECIMAL(18, 2),
    @ItemCodeId NVARCHAR(50),
    @BaseMaterial NVARCHAR(50),
    @Hold BIT,
    @NIS BIT,
    @LocationID INT, -- New parameter
    @NewItemId INT OUTPUT -- Output parameter for new ItemId
AS
BEGIN
    SET NOCOUNT ON;
	
    -- Pass LocationID to the trigger context
    -- Set session context
    EXEC sp_set_session_context @key = 'LocationID', @value = @LocationID;

    -- Insert into Item table
    INSERT INTO Items (PKID, ItemOfPk, Tag, Description, UnitID, Qty, OverQty, ShortageQty, DamageQty, IncorectQty, ScopeID, HeatNo, BatchNo, Remark, MTRNo, ColorCode, LabelNo, EnteredBy, EnteredDate, EditedBy, EditedDate, Price, UnitPriceID, NetW, GrossW, ItemCodeId, BaseMaterial, Hold, NIS)
    VALUES (@PKID, @ItemOfPk, @Tag, @Description, @UnitID, @Qty, @OverQty, @ShortageQty, @DamageQty, @IncorectQty, @ScopeID, @HeatNo, @BatchNo, @Remark, @MTRNo, @ColorCode, @LabelNo, @EnteredBy, @EnteredDate, @EditedBy, @EditedDate, @Price, @UnitPriceID, @NetW, @GrossW, @ItemCodeId, @BaseMaterial, @Hold, @NIS);

    -- Get the new ItemId
    SET @NewItemId = SCOPE_IDENTITY();
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_AddUser]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AddUser]
    @Username NVARCHAR(50),
    @PasswordHash NVARCHAR(255),
    @RoleID INT,
    @UserID INT OUTPUT
AS
BEGIN
    INSERT INTO ApplicationUser (Username, PasswordHash, RoleID)
    VALUES (@Username, @PasswordHash, @RoleID);
    
    SET @UserID = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AllItemSelectedPl]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AllItemSelectedPl]
AS
BEGIN
    SELECT 
        Packages.PKID, 
        Packages.PLId, 
        Packages.PK, 
        LocItems.LocItemID, 
        LocItems.LocationID, 
        LocItems.Qty, 
        LocItems.OverQty, 
        LocItems.ShortageQty, 
        LocItems.DamageQty, 
        LocItems.RejectQty, 
        LocItems.NISQty, 
        Items.ItemId, 
        Items.ItemOfPk, 
        Items.Tag, 
        Items.Description, 
        Items.UnitID, 
        Items.Qty AS Expr1, 
        Items.OverQty AS Expr2, 
        Items.ShortageQty AS Expr3, 
        Items.DamageQty AS Expr4, 
        Items.IncorectQty, 
        Items.ScopeID, 
        Items.Remark, 
        Items.Hold, 
        Items.NIS, 
        Items.HeatNo, 
        Items.BatchNo, 
        Items.StorageCode, 
        Packages.ArrivalDate, 
        Packages.MSRNO, 
        Packages.MSRPDF
    FROM 
        Items 
    INNER JOIN
        LocItems ON Items.ItemId = LocItems.ItemId 
    INNER JOIN
        Packages ON Items.PKID = Packages.PKID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteItem]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteItem]
    @ItemId INT
AS
BEGIN
    DELETE FROM Items WHERE ItemId = @ItemId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteUser]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteUser]
    @UserID INT
AS
BEGIN
    DELETE FROM ApplicationUser WHERE UserID = @UserID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllItems]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetAllItems]
AS
BEGIN
    SELECT * FROM Items
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllUsers]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetAllUsers]
AS
BEGIN
    SELECT UserID, Username, PasswordHash, RoleID
    FROM ApplicationUser;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetItemById]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetItemById]
    @ItemId INT
AS
BEGIN
    SELECT * FROM Items WHERE ItemId = @ItemId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetItemsByPlIdOptimized]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetItemsByPlIdOptimized]
    @PlId INT
AS
BEGIN
    SET NOCOUNT ON;

    -- مرحله 1: استخراج PKIDها
    CREATE TABLE #TempPKIDs (
        PKID INT PRIMARY KEY
    );
    INSERT INTO #TempPKIDs (PKID)
    SELECT DISTINCT PKID
    FROM Packages
    WHERE PLId = @PlId;
    CREATE NONCLUSTERED INDEX IX_TempPKIDs_PKID ON #TempPKIDs (PKID);

    -- مرحله 2: استخراج ItemIDها
    CREATE TABLE #TempItemIDs (
        ItemId INT PRIMARY KEY
    );
    INSERT INTO #TempItemIDs (ItemId)
    SELECT DISTINCT i.ItemId
    FROM Items i
    INNER JOIN #TempPKIDs t ON i.PKID = t.PKID;
    CREATE NONCLUSTERED INDEX IX_TempItemIDs_ItemId ON #TempItemIDs (ItemId);

    -- مرحله 3: برگرداندن اطلاعات کامل
    SELECT  i.ItemId,
			   i.PKID,
			   i.ItemOfPk,
			   i.Tag,
			   i.Description,
			   i.UnitID,
			   i.Qty,
			   i.OverQty,
			   i.ShortageQty,
			   i.DamageQty,
			   i.IncorectQty,
			   i.ScopeID,
			   i.HeatNo,
			   i.BatchNo,
			   i.Remark,
			   i.MTRNo,
			   i.ColorCode,
			   i.LabelNo,
			   i.EnteredBy,
			   i.EnteredDate,
			   i.EditedBy,
			   i.EditedDate,
			   i.Price,
			   i.UnitPriceID,
			   i.NetW,
			   i.GrossW,
			   i.ItemCodeId,
			   i.BaseMaterial,
			   i.Hold,
			   i.NIS,
			   i.StorageCode
    FROM Items i
    INNER JOIN #TempItemIDs t ON i.ItemId = t.ItemId;

    -- مرحله 4: پاک‌سازي جداول موقتي
    DROP TABLE #TempPKIDs;
    DROP TABLE #TempItemIDs;

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetItemsByPlIdOptimized2]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetItemsByPlIdOptimized2]
    @PlId INT
AS
BEGIN
    SET NOCOUNT ON;

    -- مرحله 1: استخراج PKIDها
    CREATE TABLE #TempPKIDs (
        PKID INT PRIMARY KEY
    );
    INSERT INTO #TempPKIDs (PKID)
    SELECT DISTINCT PKID
    FROM Packages
    WHERE PLId = @PlId;

    -- مرحله 2: ایجاد ایندکس روی جدول موقتی (اختیاری)
    CREATE NONCLUSTERED INDEX IX_TempPKIDs_PKID ON #TempPKIDs (PKID);

    -- مرحله 3: استخراج ItemIDها
    CREATE TABLE #TempItemIDs (
        ItemId INT PRIMARY KEY
    );
    INSERT INTO #TempItemIDs (ItemId)
    SELECT DISTINCT ItemId
    FROM Items
    WHERE PKID IN (SELECT PKID FROM #TempPKIDs);

    -- مرحله 4: ایجاد ایندکس روی جدول موقتی (اختیاری)
    CREATE NONCLUSTERED INDEX IX_TempItemIDs_ItemId ON #TempItemIDs (ItemId);

    -- مرحله 5: برگرداندن اطلاعات کامل
    SELECT *
    FROM Items
    WHERE ItemId IN (SELECT ItemId FROM #TempItemIDs);

    -- مرحله 6: پاک‌سازی جداول موقتی
    DROP TABLE #TempPKIDs;
    DROP TABLE #TempItemIDs;

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetItemsByPlIdOptimized3]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetItemsByPlIdOptimized3]
    @PlId INT
AS
BEGIN
    SET NOCOUNT ON;

    -- مرحله 1: استخراج PKIDها
    CREATE TABLE #TempPKIDs (
        PKID INT PRIMARY KEY
    );
    INSERT INTO #TempPKIDs (PKID)
    SELECT DISTINCT PKID
    FROM Packages
    WHERE PLId = @PlId;

    -- مرحله 2: استخراج ItemIdها
    CREATE TABLE #TempItemIDs (
        ItemId INT PRIMARY KEY
    );
    INSERT INTO #TempItemIDs (ItemId)
    SELECT ItemId
    FROM Items
    WHERE PKID IN (SELECT PKID FROM #TempPKIDs);

    -- مرحله 3: برگرداندن اطلاعات کامل
    SELECT *
    FROM Items
    WHERE ItemId IN (SELECT ItemId FROM #TempItemIDs);

    -- مرحله 4: پاک‌سازی جداول موقتی
    DROP TABLE #TempPKIDs;
    DROP TABLE #TempItemIDs;

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetItemsByPlIdWITH_IndexedView]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetItemsByPlIdWITH_IndexedView]
    @PlId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        ItemId,
        PKID,
        ItemOfPk,
        Tag,
        Description,
        UnitID,
        Qty,
        OverQty,
        ShortageQty,
        DamageQty,
        IncorectQty,
        ScopeID,
        HeatNo,
        BatchNo,
        Remark,
        MTRNo,
        ColorCode,
        LabelNo,
        EnteredBy,
        EnteredDate,
        EditedBy,
        EditedDate,
        Price,
        UnitPriceID,
        NetW,
        GrossW,
        ItemCodeId,
        BaseMaterial,
        Hold,
        NIS,
        StorageCode
    FROM dbo.vw_ItemsWithPackages
    WHERE PLId = @PlId
    OPTION (RECOMPILE);

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetItemsByPlIdWithCTE]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetItemsByPlIdWithCTE]
        @PlId INT
AS
BEGIN
    -- تنظیم NOCOUNT برای جلوگیری از پیام‌های غیرضروری	
	SET NOCOUNT ON;
    ;WITH TempPKs AS (
        SELECT PKID
        FROM Packages
        WHERE PLId = @PlId
    )
    SELECT i.*
    FROM Items i
    INNER JOIN TempPKs t ON i.PKID = t.PKID
	-- بازگرداندن NOCOUNT به حالت قبلی
    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetItemsByPlIdWithLoopAndMergeJoin]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetItemsByPlIdWithLoopAndMergeJoin]
    @PlId INT
AS
BEGIN
 -- تنظیم NOCOUNT برای جلوگیری از پیام‌های غیرضروری	
	SET NOCOUNT ON;
	--	SELECT *
		--FROM Items i
		--INNER JOIN Packages p ON i.PKID = p.PKID
		--WHERE p.PLId = @PlId
		--OPTION (MERGE JOIN);
		SELECT i.ItemId,
			   i.PKID,
			   i.ItemOfPk,
			   i.Tag,
			   i.Description,
			   i.UnitID,
			   i.Qty,
			   i.OverQty,
			   i.ShortageQty,
			   i.DamageQty,
			   i.IncorectQty,
			   i.ScopeID,
			   i.HeatNo,
			   i.BatchNo,
			   i.Remark,
			   i.MTRNo,
			   i.ColorCode,
			   i.LabelNo,
			   i.EnteredBy,
			   i.EnteredDate,
			   i.EditedBy,
			   i.EditedDate,
			   i.Price,
			   i.UnitPriceID,
			   i.NetW,
			   i.GrossW,
			   i.ItemCodeId,
			   i.BaseMaterial,
			   i.Hold,
			   i.NIS,
			   i.StorageCode
		FROM Items i
		INNER JOIN Packages p ON i.PKID = p.PKID
		WHERE p.PLId = @PlId
		OPTION (LOOP JOIN);
	-- بازگرداندن NOCOUNT به حالت قبلی
    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetItemsByPlIdWithLoopAndMergeJoin_WITH_IndexedView]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetItemsByPlIdWithLoopAndMergeJoin_WITH_IndexedView]
    @PlId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        ItemId,
        PKID,
        ItemOfPk,
        Tag,
        Description,
        UnitID,
        Qty,
        OverQty,
        ShortageQty,
        DamageQty,
        IncorectQty,
        ScopeID,
        HeatNo,
        BatchNo,
        Remark,
        MTRNo,
        ColorCode,
        LabelNo,
        EnteredBy,
        EnteredDate,
        EditedBy,
        EditedDate,
        Price,
        UnitPriceID,
        NetW,
        GrossW,
        ItemCodeId,
        BaseMaterial,
        Hold,
        NIS,
        StorageCode
    FROM dbo.vw_ItemsWithPackages
    WHERE PLId = @PlId;
    
    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetItemsByPlIdWithTempTable]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetItemsByPlIdWithTempTable]
    @PlId INT
AS
BEGIN
    ---- ایجاد جدول موقت برای نگهداری PKID ها
    CREATE TABLE #TempPKs (PKID INT PRIMARY KEY)

    -- قرار دادن PKID ها در جدول موقت و ایجاد ایندکس
    INSERT INTO #TempPKs (PKID)
    SELECT PKID FROM Packages WHERE PLId = @PlId

    -- استخراج Item ها بر اساس PKID ها از جدول موقت
    SELECT     i.ItemId,
			   i.PKID,
			   i.ItemOfPk,
			   i.Tag,
			   i.Description,
			   i.UnitID,
			   i.Qty,
			   i.OverQty,
			   i.ShortageQty,
			   i.DamageQty,
			   i.IncorectQty,
			   i.ScopeID,
			   i.HeatNo,
			   i.BatchNo,
			   i.Remark,
			   i.MTRNo,
			   i.ColorCode,
			   i.LabelNo,
			   i.EnteredBy,
			   i.EnteredDate,
			   i.EditedBy,
			   i.EditedDate,
			   i.Price,
			   i.UnitPriceID,
			   i.NetW,
			   i.GrossW,
			   i.ItemCodeId,
			   i.BaseMaterial,
			   i.Hold,
			   i.NIS,
			   i.StorageCode
    FROM Items i
    INNER JOIN #TempPKs t ON i.PKID = t.PKID

    -- حذف جدول موقت
    DROP TABLE #TempPKs
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetItemsByPlIdWithTempTableAndSubQuery]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetItemsByPlIdWithTempTableAndSubQuery]
    @PlId INT
AS
BEGIN
    -- تنظیم NOCOUNT برای جلوگیری از پیام‌های غیرضروری
    SET NOCOUNT ON;

    -- ایجاد جدول موقت برای نگهداری PKID ها
    CREATE TABLE #TempPKs (PKID INT PRIMARY KEY);

    -- قرار دادن PKID ها در جدول موقت
    INSERT INTO #TempPKs (PKID)
    SELECT PKID FROM Packages WHERE PLId = @PlId;

    -- ایجاد ایندکس بر روی جدول موقت برای بهبود عملکرد
    CREATE INDEX IX_TempPKs_PKID ON #TempPKs(PKID);

    -- استخراج Item ها بر اساس PKID ها از جدول موقت
    SELECT i.*
    FROM Items i
    WHERE i.PKID IN (SELECT PKID FROM #TempPKs);

    -- حذف جدول موقت
    DROP TABLE #TempPKs;

    -- بازگرداندن NOCOUNT به حالت قبلی
    SET NOCOUNT OFF;
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetUserById]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetUserById]
    @UserID INT
AS
BEGIN
    SELECT UserID, Username, PasswordHash, RoleID
    FROM ApplicationUser
    WHERE UserID = @UserID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUserByUsername]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetUserByUsername]
    @Username NVARCHAR(50)
AS
BEGIN
    SELECT UserID, Username, PasswordHash, RoleID
    FROM ApplicationUser
    WHERE Username = @Username;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateItem]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateItem]
    @ItemId INT,
    @PKID INT,
    @ItemOfPk INT,
    @Tag NVARCHAR(500),
    @Description NVARCHAR(500),
    @UnitID INT,
    @Qty DECIMAL(18, 2),
    @OverQty DECIMAL(18, 2),
    @ShortageQty DECIMAL(18, 2),
    @DamageQty DECIMAL(18, 2),
    @IncorectQty DECIMAL(18, 2),
    @ScopeID INT,
    @HeatNo NVARCHAR(500),
    @BatchNo NVARCHAR(500),
    @Remark NVARCHAR(500),
    @MTRNo NVARCHAR(200),
    @ColorCode NVARCHAR(50),
    @LabelNo NVARCHAR(50),
    @EnteredBy INT,
    @EnteredDate DATETIME,
    @EditedBy INT,
    @EditedDate DATETIME,
    @Price DECIMAL(18, 2),
    @UnitPriceID INT,
    @NetW DECIMAL(18, 2),
    @GrossW DECIMAL(18, 2),
    @ItemCodeId INT,
    @BaseMaterial NVARCHAR(MAX),
    @Hold BIT,
    @NIS DECIMAL(18, 2)
AS
BEGIN
    UPDATE Items
    SET
        PKID = @PKID,
        ItemOfPk = @ItemOfPk,
        Tag = @Tag,
        Description = @Description,
        UnitID = @UnitID,
        Qty = @Qty,
        OverQty = @OverQty,
        ShortageQty = @ShortageQty,
        DamageQty = @DamageQty,
        IncorectQty = @IncorectQty,
        ScopeID = @ScopeID,
        HeatNo = @HeatNo,
        BatchNo = @BatchNo,
        Remark = @Remark,
        EditedBy = @EditedBy,
        EditedDate = @EditedDate,
        Price = @Price,
        UnitPriceID = @UnitPriceID,
        NetW = @NetW,
        GrossW = @GrossW,
        Hold = @Hold,
        NIS = @NIS
    WHERE ItemId = @ItemId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateUser]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateUser]
    @UserID INT,
    @Username NVARCHAR(50),
    @PasswordHash NVARCHAR(255),
    @RoleID INT
AS
BEGIN
    UPDATE ApplicationUser
    SET Username = @Username,
        PasswordHash = @PasswordHash,
        RoleID = @RoleID
    WHERE UserID = @UserID;
END
GO
/****** Object:  StoredProcedure [dbo].[spDeleteLocation]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDeleteLocation]
    @LocationID INT
AS
BEGIN
    DELETE FROM Locations
    WHERE LocationID = @LocationID;
END
GO
/****** Object:  StoredProcedure [dbo].[spDeleteScope]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDeleteScope]
    @ScopeID INT
AS
BEGIN
    DELETE FROM Scopes
    WHERE ScopeID = @ScopeID
END
GO
/****** Object:  StoredProcedure [dbo].[spDeleteUnit]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDeleteUnit]
    @UnitID INT
AS
BEGIN
    DELETE FROM Units
    WHERE UnitID = @UnitID
END
GO
/****** Object:  StoredProcedure [dbo].[spGetAllLocations]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetAllLocations]
AS
BEGIN
    SELECT LocationId,LocationName FROM Locations;
END
GO
/****** Object:  StoredProcedure [dbo].[spGetAllScopes]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetAllScopes]
AS
BEGIN
    SELECT ScopeID, ScopeName FROM Scopes
END
GO
/****** Object:  StoredProcedure [dbo].[spGetAllUnits]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetAllUnits]
AS
BEGIN
    SELECT UnitID, UnitName FROM Units
END
GO
/****** Object:  StoredProcedure [dbo].[spGetLocationById]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetLocationById]
    @LocationID INT
AS
BEGIN
    SELECT * FROM Locations
    WHERE LocationID = @LocationID;
END
GO
/****** Object:  StoredProcedure [dbo].[spGetScopeById]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetScopeById]
    @ScopeID INT
AS
BEGIN
    SELECT ScopeID, ScopeName FROM Scopes
    WHERE ScopeID = @ScopeID
END
GO
/****** Object:  StoredProcedure [dbo].[spGetUnitById]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetUnitById]
    @UnitID INT
AS
BEGIN
    SELECT UnitID, UnitName FROM Units
    WHERE UnitID = @UnitID
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertLocation]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertLocation]
    @LocationName NVARCHAR(100)
AS
BEGIN
    INSERT INTO Locations (LocationName)
    VALUES (@LocationName);
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertScope]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertScope]
    @ScopeName NVARCHAR(100)
AS
BEGIN
    INSERT INTO Scopes (ScopeName)
    VALUES (@ScopeName)
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertUnit]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertUnit]
    @UnitName NVARCHAR(100)
AS
BEGIN
    INSERT INTO Units (UnitName)
    VALUES (@UnitName)
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateLocation]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateLocation]
    @LocationID INT,
    @LocationName NVARCHAR(100)
AS
BEGIN
    UPDATE Locations
    SET LocationName = @LocationName
    WHERE LocationID = @LocationID;
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateScope]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateScope]
    @ScopeID INT,
    @ScopeName NVARCHAR(100)
AS
BEGIN
    UPDATE Scopes
    SET ScopeName = @ScopeName
    WHERE ScopeID = @ScopeID
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateUnit]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateUnit]
    @UnitID INT,
    @UnitName NVARCHAR(100)
AS
BEGIN
    UPDATE Units
    SET UnitName = @UnitName
    WHERE UnitID = @UnitID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateLocItem]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateLocItem]
    @LocItemID INT,
    @LocationID INT,
    @Qty DECIMAL(18, 2),
    @OverQty DECIMAL(18, 2),
    @ShortageQty DECIMAL(18, 2),
    @DamageQty DECIMAL(18, 2),
    @RejectQty DECIMAL(18, 2),
    @NISQty DECIMAL(18, 2),
    @EditedBy INT,
    @EditedDate DATETIME
AS
BEGIN
    UPDATE LocItems
    SET LocationID = @LocationID,
        Qty = @Qty,
        OverQty = @OverQty,
        ShortageQty = @ShortageQty,
        DamageQty = @DamageQty,
        RejectQty = @RejectQty,
        NISQty = @NISQty,
        EditedBy = @EditedBy,
        EditedDate = @EditedDate
    WHERE LocItemID = @LocItemID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateLocItemLocation]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateLocItemLocation]
    @UpdateLocItemLocationTVP dbo.UpdateLocItemLocationType READONLY
AS
BEGIN
    UPDATE LocItems
    SET 
        LocationID = tvp.LocationID,
        EditedBy = tvp.EditedBy,
        EditedDate = tvp.EditedDate
    FROM @UpdateLocItemLocationTVP tvp
    WHERE LocItems.LocItemID = tvp.LocItemID;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdatePackage]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdatePackage]
    @PKID INT,
    @PLId INT,
    @PK INT,
    @NetW DECIMAL(18,2),
    @GrossW DECIMAL(18,2),
    @Dimension VARCHAR(100),
    @Volume VARCHAR(100), -- تغییر به VARCHAR
    @ArrivalDate DATETIME,
    @Desciption NVARCHAR(500),
    @Remark NVARCHAR(500),
    @EnteredBy INT, -- تغییر به INT
    @EnteredDate DATETIME,
    @EditedBy INT, -- تغییر به INT
    @EditedDate DATETIME,
    @MSRNO NVARCHAR(100),
    @MSRPDF NVARCHAR(100),
    @MSRDate DATETIME,
    @MSREnteredBy INT, -- تغییر به INT
    @MSRStatus BIT, -- تغییر به BIT
    @MSRRev INT,
    @MSRRevEnteredBy INT, -- تغییر به INT
    @MSRRevDate DATETIME
AS
BEGIN
    UPDATE Packages
    SET PLId = @PLId,
        PK = @PK,
        NetW = @NetW,
        GrossW = @GrossW,
        Dimension = @Dimension,
        Volume = @Volume,
        ArrivalDate = @ArrivalDate,
        Desciption = @Desciption,
        Remark = @Remark,
        EnteredBy = @EnteredBy,
        EnteredDate = @EnteredDate,
        EditedBy = @EditedBy,
        EditedDate = @EditedDate,
        MSRNO = @MSRNO,
        MSRPDF = @MSRPDF,
        MSRDate = @MSRDate,
        MSREnteredBy = @MSREnteredBy,
        MSRStatus = @MSRStatus,
        MSRRev = @MSRRev,
        MSRRevEnteredBy = @MSRRevEnteredBy,
        MSRRevDate = @MSRRevDate
    WHERE PKID = @PKID;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdatePackageINPackingList]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[UpdatePackageINPackingList]
    @PKID INT,
    @ArrivalDate DATETIME,
    @MSRNO NVARCHAR(50),
    @MSRPDF NVARCHAR(50),
    @EditedBy NVARCHAR(50),
    @EditedDate DATETIME
AS
BEGIN
    UPDATE Packages
    SET ArrivalDate = @ArrivalDate,
        MSRNO = @MSRNO,
        MSRPDF = @MSRPDF,
        EditedBy = @EditedBy,
        EditedDate = @EditedDate
    WHERE PKID = @PKID;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdatePackingList]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdatePackingList]
    @PLId INT,
    @ShId INT,
    @MrId INT,
    @PoId INT,
    @IrnId INT,
    @PLName NVARCHAR(300), -- 300 instead of 255
    @ArchiveNO NVARCHAR(50), -- 50 instead of 255
    @PLNO NVARCHAR(50), -- 50 instead of 255
    @OPINO NVARCHAR(50), -- 50 instead of 255
    @Project NVARCHAR(50), -- 50 instead of 255
    @AreaUnitID INT,
    @SupplierId INT,
    @DesciplineId INT,
    @VendorId INT,
    @DescriptionForPkId INT,
    @NetW DECIMAL(18, 2),
    @GrossW DECIMAL(18, 2),
    @Volume NVARCHAR(MAX), -- changed to NVARCHAR(MAX) instead of DECIMAL(18, 2)
    @Vessel NVARCHAR(MAX),
    @EnteredBy INT,
    @EnteredDate DATETIME,
    @MARDate DATETIME,
    @Remark NVARCHAR(MAX),
    @LocalForeign INT,
    @RTINO NVARCHAR(MAX),
    @InvoiceNO NVARCHAR(MAX),
    @IRCNO NVARCHAR(MAX),
    @LCNO NVARCHAR(MAX),
    @BLNO NVARCHAR(MAX),
    @Remarkcustoms NVARCHAR(MAX),
    @EditedBy INT,
    @EditedDate DATETIME,
    @PLDPF NVARCHAR(MAX),
    @Balance BIT,
    @Attachment BIT,
    @SitePL BIT,
    @Success BIT OUTPUT,
    @ErrorMessage NVARCHAR(255) OUTPUT
AS
BEGIN
    BEGIN TRY
        UPDATE PackingLists SET 
            ShId = @ShId,
            MrId = @MrId,
            PoId = @PoId,
            IrnId = @IrnId,
            PLName = @PLName,
            ArchiveNO = @ArchiveNO,
            PLNO = @PLNO,
            OPINO = @OPINO,
            Project = @Project,
            AreaUnitID = @AreaUnitID,
            SupplierId = @SupplierId,
            DesciplineId = @DesciplineId,
            VendorId = @VendorId,
            DescriptionForPkId = @DescriptionForPkId,
            NetW = @NetW,
            GrossW = @GrossW,
            Volume = @Volume,
            Vessel = @Vessel,
            EnteredBy = @EnteredBy,
            EnteredDate = @EnteredDate,
            MARDate = @MARDate,
            Remark = @Remark,
            LocalForeign = @LocalForeign,
            RTINO = @RTINO,
            InvoiceNO = @InvoiceNO,
            IRCNO = @IRCNO,
            LCNO = @LCNO,
            BLNO = @BLNO,
            Remarkcustoms = @Remarkcustoms,
            EditedBy = @EditedBy,
            EditedDate = @EditedDate,
            PLDPF = @PLDPF,
            Balance = @Balance,
            Attachment = @Attachment,
            SitePL = @SitePL
        WHERE PLId = @PLId;

        SET @Success = 1;
        SET @ErrorMessage = NULL;
    END TRY
    BEGIN CATCH
        SET @Success = 0;
        SET @ErrorMessage = ERROR_MESSAGE();
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateStorageCodes]    Script Date: 9/4/2024 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateStorageCodes]
    @ItemIds dbo.ItemIDList READONLY,
    @NewStorageCode NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Items
    SET StorageCode = @NewStorageCode
    WHERE ItemId IN (SELECT ItemID FROM @ItemIds);
END
GO
