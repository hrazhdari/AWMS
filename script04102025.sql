USE [AWMSdb]
GO
/****** Object:  UserDefinedTableType [dbo].[AWMSPermissionType2]    Script Date: 4/10/2025 3:45:05 PM ******/
CREATE TYPE [dbo].[AWMSPermissionType2] AS TABLE(
	[RoleID] [int] NULL,
	[RibbonPageName] [nvarchar](50) NULL,
	[IsEnabled] [bit] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ImportItemType]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  UserDefinedTableType [dbo].[IntItemIdList]    Script Date: 4/10/2025 3:45:05 PM ******/
CREATE TYPE [dbo].[IntItemIdList] AS TABLE(
	[Value] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[IntList]    Script Date: 4/10/2025 3:45:05 PM ******/
CREATE TYPE [dbo].[IntList] AS TABLE(
	[Value] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[IntLocItemsList]    Script Date: 4/10/2025 3:45:05 PM ******/
CREATE TYPE [dbo].[IntLocItemsList] AS TABLE(
	[Value] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ItemIDList]    Script Date: 4/10/2025 3:45:05 PM ******/
CREATE TYPE [dbo].[ItemIDList] AS TABLE(
	[ItemId] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ItemIDListType]    Script Date: 4/10/2025 3:45:05 PM ******/
CREATE TYPE [dbo].[ItemIDListType] AS TABLE(
	[ItemID] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ItemTableType]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  UserDefinedTableType [dbo].[LocItemIDListType]    Script Date: 4/10/2025 3:45:05 PM ******/
CREATE TYPE [dbo].[LocItemIDListType] AS TABLE(
	[LocItemID] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[MrcImportTableType]    Script Date: 4/10/2025 3:45:05 PM ******/
CREATE TYPE [dbo].[MrcImportTableType] AS TABLE(
	[ToCompanyID] [int] NULL,
	[MrcName] [nvarchar](255) NULL,
	[MrcDescription] [nvarchar](255) NULL,
	[PK] [int] NULL,
	[ItemOfPk] [int] NULL,
	[Tag] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[UnitID] [nvarchar](100) NULL,
	[Qty] [decimal](18, 4) NULL,
	[Size1] [nvarchar](100) NULL,
	[Size2] [nvarchar](100) NULL,
	[BatchNo] [nvarchar](100) NULL,
	[DocNo] [nvarchar](100) NULL,
	[Remark] [nvarchar](max) NULL,
	[EnteredBy] [int] NULL,
	[EnteredDate] [datetime] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[NewHMVDtoType]    Script Date: 4/10/2025 3:45:05 PM ******/
CREATE TYPE [dbo].[NewHMVDtoType] AS TABLE(
	[HmvQty] [decimal](18, 2) NULL,
	[HmvDelQty] [decimal](18, 2) NULL,
	[HmvRejQty] [decimal](18, 2) NULL,
	[LocItemID] [int] NULL,
	[Remark] [nvarchar](300) NULL,
	[MRCNo] [nvarchar](50) NULL,
	[TypeName] [nvarchar](50) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[NewMRVDtoType]    Script Date: 4/10/2025 3:45:05 PM ******/
CREATE TYPE [dbo].[NewMRVDtoType] AS TABLE(
	[ReqMrvQty] [decimal](18, 2) NULL,
	[DelMrvQty] [decimal](18, 2) NULL,
	[DelMrvRejQty] [decimal](18, 2) NULL,
	[LocItemID] [int] NULL,
	[Remark] [nvarchar](255) NULL,
	[SelectedLocation] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[NewMRVDtoType3]    Script Date: 4/10/2025 3:45:05 PM ******/
CREATE TYPE [dbo].[NewMRVDtoType3] AS TABLE(
	[ReqMrvQty] [decimal](18, 0) NULL,
	[DelMrvQty] [decimal](18, 0) NULL,
	[DelMrvRejQty] [decimal](18, 0) NULL,
	[LocItemID] [int] NULL,
	[Remark] [nvarchar](255) NULL,
	[MRCNO] [nvarchar](50) NULL,
	[SelectedLocation] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[NewMRVDtoType4]    Script Date: 4/10/2025 3:45:05 PM ******/
CREATE TYPE [dbo].[NewMRVDtoType4] AS TABLE(
	[ReqMrvQty] [decimal](18, 0) NULL,
	[DelMrvQty] [decimal](18, 0) NULL,
	[DelMrvRejQty] [decimal](18, 0) NULL,
	[LocItemID] [int] NULL,
	[Remark] [nvarchar](255) NULL,
	[MRCNO] [nvarchar](50) NULL,
	[SelectedLocation] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[NewMRVDtoType5]    Script Date: 4/10/2025 3:45:05 PM ******/
CREATE TYPE [dbo].[NewMRVDtoType5] AS TABLE(
	[ReqMrvQty] [decimal](18, 2) NULL,
	[DelMrvQty] [decimal](18, 2) NULL,
	[DelMrvRejQty] [decimal](18, 2) NULL,
	[LocItemID] [int] NULL,
	[Remark] [nvarchar](255) NULL,
	[MRCNo] [nvarchar](50) NULL,
	[SelectedLocation] [int] NULL,
	[TypeName] [nvarchar](50) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[NewRequestDtoType]    Script Date: 4/10/2025 3:45:05 PM ******/
CREATE TYPE [dbo].[NewRequestDtoType] AS TABLE(
	[ReqMivQty] [decimal](18, 2) NULL,
	[ReserveMivQty] [decimal](18, 2) NULL,
	[LocItemID] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[PackagePKIDDtoType]    Script Date: 4/10/2025 3:45:05 PM ******/
CREATE TYPE [dbo].[PackagePKIDDtoType] AS TABLE(
	[PKID] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[PackageType]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  UserDefinedTableType [dbo].[RequestDtoType]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  UserDefinedTableType [dbo].[RequestMivTableType]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  UserDefinedTableType [dbo].[UpdateLocItemLocationType]    Script Date: 4/10/2025 3:45:05 PM ******/
CREATE TYPE [dbo].[UpdateLocItemLocationType] AS TABLE(
	[LocItemID] [int] NULL,
	[LocationID] [int] NULL,
	[EditedBy] [nvarchar](100) NULL,
	[EditedDate] [datetime] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UpdateLocItemRemarkMrvType]    Script Date: 4/10/2025 3:45:05 PM ******/
CREATE TYPE [dbo].[UpdateLocItemRemarkMrvType] AS TABLE(
	[LocItemID] [int] NULL,
	[RemarkLocitemID] [nvarchar](300) NULL,
	[EditedBy] [nvarchar](50) NULL,
	[EditedDate] [datetime] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UpdateMivTableType]    Script Date: 4/10/2025 3:45:05 PM ******/
CREATE TYPE [dbo].[UpdateMivTableType] AS TABLE(
	[ReqLocItemID] [nvarchar](100) NULL,
	[DelMivQty] [decimal](18, 2) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UpdateMrvQtType]    Script Date: 4/10/2025 3:45:05 PM ******/
CREATE TYPE [dbo].[UpdateMrvQtType] AS TABLE(
	[LocItemID] [int] NULL,
	[ReqLocItemID] [int] NULL,
	[PLocItemIDforMRV] [int] NULL,
	[ReqMrvQty] [decimal](18, 2) NULL,
	[DelMrvQty] [decimal](18, 2) NULL,
	[DelMrvRejQty] [decimal](18, 2) NULL,
	[MRVRequest] [nvarchar](255) NULL,
	[EditedBy] [nvarchar](50) NULL,
	[EditedDate] [datetime] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UpdateMrvRemarkType]    Script Date: 4/10/2025 3:45:05 PM ******/
CREATE TYPE [dbo].[UpdateMrvRemarkType] AS TABLE(
	[LocItemID] [int] NULL,
	[RemarkRequests] [nvarchar](255) NULL,
	[MRVRequest] [nvarchar](255) NULL,
	[EditedBy] [nvarchar](50) NULL,
	[EditedDate] [datetime] NULL
)
GO
/****** Object:  Table [dbo].[LocItems]    Script Date: 4/10/2025 3:45:05 PM ******/
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
	[ParentLocItemID] [int] NULL,
	[RemarkLocitemID] [nvarchar](300) NULL,
	[FlagMIVorHMV] [tinyint] NULL,
 CONSTRAINT [PK_LocItems] PRIMARY KEY CLUSTERED 
(
	[LocItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Packages]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  Table [dbo].[Items]    Script Date: 4/10/2025 3:45:05 PM ******/
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
	[ExpiredDate] [date] NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_AllItemSelectedPl]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_AllItemSelectedPl]
AS
SELECT 
    P.PKID, P.PLId, P.PK, LI.LocItemID, LI.LocationID, LI.Qty, LI.OverQty, LI.ShortageQty, LI.DamageQty, LI.RejectQty, LI.NISQty, 
    I.ItemId, I.ItemOfPk, I.Tag, I.Description, I.UnitID, I.Qty AS QtyPL, I.OverQty AS OverQtyPL, 
    I.ShortageQty AS ShortageQtyPL, I.DamageQty AS DamageQtyPL, I.IncorectQty, I.ScopeID, I.Remark, 
    I.Hold, I.NIS, I.HeatNo, I.BatchNo, I.StorageCode, P.ArrivalDate, P.MSRNO, P.MSRPDF, 
    I.NetW, I.GrossW
FROM 
    Packages P
INNER JOIN 
    Items I ON P.PKID = I.PKID
INNER JOIN 
    LocItems LI ON I.ItemId = LI.ItemId;
GO
/****** Object:  View [dbo].[vw_ItemsWithPackages]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  Table [dbo].[ApplicationPermissions]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationPermissions](
	[PermissionID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[RibbonPageName] [nvarchar](50) NOT NULL,
	[IsEnabled] [bit] NOT NULL,
 CONSTRAINT [PK_ApplicationPermissions] PRIMARY KEY CLUSTERED 
(
	[PermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationRole]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  Table [dbo].[ApplicationUser]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  Table [dbo].[AreaUnits]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  Table [dbo].[Companies]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  Table [dbo].[CompanyContracts]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  Table [dbo].[Desciplines]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  Table [dbo].[DescriptionForPks]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  Table [dbo].[Inspection]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inspection](
	[PLId] [int] NOT NULL,
	[IrnId] [int] NULL,
	[IRN_Conflict] [bit] NOT NULL,
	[IVR_NO] [nvarchar](100) NULL,
	[IVR_IFR] [nvarchar](100) NULL,
	[OrderStatus] [nvarchar](100) NULL,
	[ThirdParty] [bit] NOT NULL,
	[OPI] [bit] NOT NULL,
	[Description] [nvarchar](500) NULL,
	[IcNo] [nvarchar](50) NULL,
	[SubProject] [nvarchar](200) NULL,
	[Site] [bit] NOT NULL,
	[Laydown] [bit] NOT NULL,
	[Warehouse] [bit] NOT NULL,
	[OSBL] [bit] NOT NULL,
	[VisualInspection] [bit] NOT NULL,
	[QuantityCheck] [bit] NOT NULL,
	[Marking] [bit] NOT NULL,
	[Unloading] [bit] NOT NULL,
	[IVRPDF] [nvarchar](300) NULL,
	[IFRPDF] [nvarchar](300) NULL,
	[EnteredBy] [int] NULL,
	[EnteredDate] [datetime2](7) NULL,
	[EditedBy] [int] NULL,
	[EditedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Inspection] PRIMARY KEY CLUSTERED 
(
	[PLId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Irns]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  Table [dbo].[Locations]    Script Date: 4/10/2025 3:45:05 PM ******/
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
	[LocationWarehouse] [nvarchar](200) NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MIVNumbers]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MIVNumbers](
	[LastNumber] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mrcs]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mrcs](
	[MrcId] [int] IDENTITY(1,1) NOT NULL,
	[ToCompanyID] [int] NOT NULL,
	[MrcName] [nvarchar](200) NULL,
	[MrcDescription] [nvarchar](1000) NULL,
	[PK] [int] NULL,
	[ItemOfPk] [int] NULL,
	[Tag] [nvarchar](500) NULL,
	[Description] [nvarchar](500) NULL,
	[UnitID] [int] NOT NULL,
	[Qty] [decimal](18, 2) NULL,
	[Size1] [nvarchar](50) NULL,
	[Size2] [nvarchar](50) NULL,
	[BatchNo] [nvarchar](500) NULL,
	[DocNo] [nvarchar](500) NULL,
	[Remark] [nvarchar](500) NULL,
	[EnteredBy] [int] NULL,
	[EnteredDate] [date] NULL,
	[EditedBy] [int] NULL,
	[EditedDate] [date] NULL,
 CONSTRAINT [PK_Mrcs] PRIMARY KEY CLUSTERED 
(
	[MrcId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mrs]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  Table [dbo].[PackingLists]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  Table [dbo].[Pos]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  Table [dbo].[Requests]    Script Date: 4/10/2025 3:45:05 PM ******/
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
	[RequestNO] [varchar](100) NOT NULL,
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
	[PLocItemIDforMRV] [int] NULL,
 CONSTRAINT [PK_Requests] PRIMARY KEY CLUSTERED 
(
	[ReqLocItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequestTypes]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  Table [dbo].[Scopes]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  Table [dbo].[Shipments]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  Table [dbo].[Suppliers]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  Table [dbo].[UnitPrices]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  Table [dbo].[Units]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  Table [dbo].[Vendors]    Script Date: 4/10/2025 3:45:05 PM ******/
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
ALTER TABLE [dbo].[Inspection] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IRN_Conflict]
GO
ALTER TABLE [dbo].[Inspection] ADD  DEFAULT (CONVERT([bit],(0))) FOR [ThirdParty]
GO
ALTER TABLE [dbo].[Inspection] ADD  DEFAULT (CONVERT([bit],(0))) FOR [OPI]
GO
ALTER TABLE [dbo].[Inspection] ADD  DEFAULT (N'False') FOR [IcNo]
GO
ALTER TABLE [dbo].[Inspection] ADD  DEFAULT (CONVERT([bit],(0))) FOR [Site]
GO
ALTER TABLE [dbo].[Inspection] ADD  DEFAULT (CONVERT([bit],(0))) FOR [Laydown]
GO
ALTER TABLE [dbo].[Inspection] ADD  DEFAULT (CONVERT([bit],(0))) FOR [Warehouse]
GO
ALTER TABLE [dbo].[Inspection] ADD  DEFAULT (CONVERT([bit],(0))) FOR [OSBL]
GO
ALTER TABLE [dbo].[Inspection] ADD  DEFAULT (CONVERT([bit],(0))) FOR [VisualInspection]
GO
ALTER TABLE [dbo].[Inspection] ADD  DEFAULT (CONVERT([bit],(0))) FOR [QuantityCheck]
GO
ALTER TABLE [dbo].[Inspection] ADD  DEFAULT (CONVERT([bit],(0))) FOR [Marking]
GO
ALTER TABLE [dbo].[Inspection] ADD  DEFAULT (CONVERT([bit],(0))) FOR [Unloading]
GO
ALTER TABLE [dbo].[ApplicationPermissions]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationPermissions_ApplicationRole_RoleID] FOREIGN KEY([RoleID])
REFERENCES [dbo].[ApplicationRole] ([RoleID])
GO
ALTER TABLE [dbo].[ApplicationPermissions] CHECK CONSTRAINT [FK_ApplicationPermissions_ApplicationRole_RoleID]
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
ALTER TABLE [dbo].[Inspection]  WITH CHECK ADD  CONSTRAINT [FK_Inspection_PackingLists_PLId] FOREIGN KEY([PLId])
REFERENCES [dbo].[PackingLists] ([PLId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Inspection] CHECK CONSTRAINT [FK_Inspection_PackingLists_PLId]
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
ALTER TABLE [dbo].[Mrcs]  WITH CHECK ADD  CONSTRAINT [FK_Mrc_Company] FOREIGN KEY([ToCompanyID])
REFERENCES [dbo].[Companies] ([CompanyID])
GO
ALTER TABLE [dbo].[Mrcs] CHECK CONSTRAINT [FK_Mrc_Company]
GO
ALTER TABLE [dbo].[Mrcs]  WITH CHECK ADD  CONSTRAINT [FK_Mrc_Unit] FOREIGN KEY([UnitID])
REFERENCES [dbo].[Units] ([UnitID])
GO
ALTER TABLE [dbo].[Mrcs] CHECK CONSTRAINT [FK_Mrc_Unit]
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
/****** Object:  StoredProcedure [dbo].[AddItemsFromTempTable]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddItemsFromTempTable2]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddItemsFromTempTableWithoutTrigger]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddItemsFromTempTableWithoutTrigger]
    @Items dbo.ItemTableType READONLY, -- پارامتر نوع جدولی برای دریافت داده‌ها
    @PLId INT,
    @LocationID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- مرحله 1: ایجاد جدول موقت برای نگهداری داده‌ها
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
        BaseMaterial NVARCHAR(255),
		EnteredBy INT,
        EnteredDate DateTime
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
        ISNULL(i.BaseMaterial, '') AS BaseMaterial,
		ISNULL(i.EnteredBy, 1) AS EnteredBy,
        ISNULL(i.EnteredDate, getdate()) EnteredDate
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

    -- مرحله 3: تنظیم LocationID برای استفاده در عملیات
    EXEC sp_set_session_context @key = 'LocationID', @value = @LocationID;

    -- مرحله 4: درج داده‌ها به جدول Items و ثبت داده‌های جدید در جدول LocItems
    -- استفاده از OUTPUT برای دریافت آیتم‌های ثبت‌شده
    DECLARE @InsertedItems TABLE
    (
        ItemId INT,
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
        BaseMaterial NVARCHAR(255),
		EnteredBy INT,
        EnteredDate DateTime
    );

    INSERT INTO dbo.Items
    (
        PKID,
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
    OUTPUT
        INSERTED.ItemId,
        INSERTED.PKID,
        INSERTED.Tag,
        INSERTED.Description,
        INSERTED.UnitID,
        INSERTED.Qty,
        INSERTED.OverQty,
        INSERTED.ShortageQty,
        INSERTED.DamageQty,
        INSERTED.IncorectQty,
        INSERTED.ScopeID,
        INSERTED.HeatNo,
        INSERTED.BatchNo,
        INSERTED.Remark,
        INSERTED.Price,
        INSERTED.UnitPriceID,
        INSERTED.NetW,
        INSERTED.GrossW,
        INSERTED.BaseMaterial,
		INSERTED.EnteredBy,
        INSERTED.EnteredDate
    INTO @InsertedItems
    SELECT 
        PKID,
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

    -- مرحله 5: انتقال داده‌ها از @InsertedItems به LocItems
    INSERT INTO LocItems
    (
        ItemId,
        LocationID,
        Qty,
        OverQty,
        ShortageQty,
        DamageQty,
        RejectQty,
        NISQty,
        EnteredBy,
        EnteredDate
        --EditedBy,
        --EditedDate
    )
    SELECT
        ItemId,
        @LocationID,
        Qty,
        OverQty,
        ShortageQty,
        DamageQty,
        0, -- مقدار پیش‌فرض برای RejectQty
        0, -- مقدار پیش‌فرض برای NISQty
        EnteredBy, -- مقدار پیش‌فرض برای EnteredBy
        GETDATE() -- تاریخ فعلی به عنوان EnteredDate
        --EditedBy, -- مقدار پیش‌فرض برای EditedBy
        --GETDATE()  -- تاریخ فعلی به عنوان EditedDate
    FROM @InsertedItems;

    -- مرحله 6: پاکسازی جدول موقت
    DROP TABLE #TempItems;
END;
GO
/****** Object:  StoredProcedure [dbo].[AddLocItem]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddMrcsFromTempTableWithoutTrigger]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddMrcsFromTempTableWithoutTrigger] 
    @Items dbo.MrcImportTableType READONLY
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- درج داده‌ها از نوع Table Type به جدول اصلی
        INSERT INTO Mrcs
        (
            ToCompanyID,
            MrcName,
            MrcDescription,
            PK,
            ItemOfPk,
            Tag,
            Description,
            UnitID,
            Qty,
            Size1,
            Size2,
            BatchNo,
            DocNo,
            Remark,
            EnteredBy,
            EnteredDate
        )
        SELECT 
            i.ToCompanyID,
            i.MrcName,
            i.MrcDescription,
            i.PK,
            i.ItemOfPk,
            i.Tag,
            i.Description,
            COALESCE(u.UnitID, 1) AS UnitID, -- جایگزینی UnitID با مقدار متناظر از جدول Units
            i.Qty,
            i.Size1,
            i.Size2,
            i.BatchNo,
            i.DocNo,
            i.Remark,
            i.EnteredBy,
            i.EnteredDate
        FROM @Items i
        LEFT JOIN dbo.Units u 
            ON i.UnitID = u.UnitName; -- تطبیق UnitID در @Items با UnitName در جدول Units

    END TRY
    BEGIN CATCH
        -- در صورتی که خطایی رخ دهد، پیام خطا را نمایش بدهید
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        -- دریافت جزئیات خطا
        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        -- بازگشت پیام خطا به کاربر
        RAISERROR('خطا در درج داده‌ها: %s', @ErrorSeverity, @ErrorState, @ErrorMessage);
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[AddPackage]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddPackagesFromTempTable]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddPackingList]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ALLHmvinfo]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ALLHmvinfo]
    @RequestNO INT
AS
BEGIN
    SELECT TOP 1 
        Requests.RequestNO, 
        Requests.HMVNO, 
        Companies.CompanyName AS fromCompanyName, 
        Companies2.CompanyName AS toCompanyName
    FROM Requests 
    INNER JOIN Companies ON Requests.CompanyID = Companies.CompanyID
    INNER JOIN Companies AS Companies2 ON Requests.CompanyID2 = Companies2.CompanyID
    WHERE (Requests.TypeID = 3) AND (RequestNO = @RequestNO)
END
GO
/****** Object:  StoredProcedure [dbo].[ALLHmvs]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[ALLHmvs]
AS
BEGIN
SELECT DISTINCT RequestNO
FROM Requests
WHERE TypeID=3;
END
GO
/****** Object:  StoredProcedure [dbo].[AllItemSelectedPl]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AllItemSelectedPlNew2025]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AllItemSelectedPlNew2025]
    @PLId INT
AS
BEGIN
WITH PackageItemCTE AS
(
    SELECT 
        p.PKID, 
        p.PLId, 
        p.PK, 
        i.ItemId, 
        i.ItemOfPk, 
        i.Tag, 
        i.Description, 
        i.UnitID, 
        i.Qty AS QtyPL, 
        i.OverQty AS OverQtyPL, 
        i.ShortageQty AS ShortageQtyPL, 
        i.DamageQty AS DamageQtyPL, 
        i.IncorectQty, 
        i.ScopeID, 
        i.Remark, 
        i.Hold, 
        i.NIS, 
        i.HeatNo, 
        i.BatchNo, 
        i.StorageCode, 
        p.ArrivalDate, 
        p.MSRNO, 
        p.MSRPDF, 
        i.NetW, 
        i.GrossW
    FROM 
        Packages p
    INNER JOIN 
        Items i 
    ON 
        p.PKID = i.PKID
    WHERE 
        p.PLId = @PLId
)
SELECT 
    cte.PKID, 
    cte.PLId, 
    cte.PK, 
    li.LocItemID, 
    li.LocationID, 
    li.Qty, 
    li.OverQty, 
    li.ShortageQty, 
    li.DamageQty, 
    li.RejectQty, 
    li.NISQty, 
    cte.ItemId, 
    cte.ItemOfPk, 
    cte.Tag, 
    cte.Description, 
    cte.UnitID, 
    cte.QtyPL, 
    cte.OverQtyPL, 
    cte.ShortageQtyPL, 
    cte.DamageQtyPL, 
    cte.IncorectQty, 
    cte.ScopeID, 
    cte.Remark, 
    cte.Hold, 
    cte.NIS, 
    cte.HeatNo, 
    cte.BatchNo, 
    cte.StorageCode, 
    cte.ArrivalDate, 
    cte.MSRNO, 
    cte.MSRPDF, 
    cte.NetW, 
    cte.GrossW
FROM 
    PackageItemCTE cte
INNER JOIN 
    LocItems li 
ON 
    cte.ItemId = li.ItemId;
END

GO
/****** Object:  StoredProcedure [dbo].[AllItemSelectedPlWithView]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[AllItemSelectedPlWithView]
    @PLId INT
AS
BEGIN
    SELECT *
    FROM vw_AllItemSelectedPl
    WHERE PLId = @PLId;
END

GO
/****** Object:  StoredProcedure [dbo].[AllMaterialMrvable]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AllMaterialMrvable]
    @CompanyID INT
AS
BEGIN
     SET NOCOUNT ON;

        WITH FilteredRequests AS (
    SELECT 
        ReqLocItemID, 
        LocItemID, 
        CompanyID, 
        ContractId, 
        RequestNO, 
        ReqDate, 
        Item, 
        ReqMivQty, 
        ReserveMivQty, 
        DelMivQty, 
        ReqMivRejQty, 
        ReserveMivRejQty, 
        DelMivRejQty, 
        ReqMrvQty, 
        DelMrvQty, 
        DelMrvRejQty, 
        IssuedBy, 
        IssuedDate, 
        MRCNO, 
        MRVNO, 
        TypeID
    FROM Requests
    WHERE 
        ReserveMivQty = 0 
        AND DelMivQty > 0 
        AND CompanyID = @CompanyID 
        AND TypeID IN (1, 2)
)
SELECT 
    fr.ReqLocItemID, 
    li.LocItemID, 
    i.ItemId, 
    p.PK, 
    pl.PLName, 
    c.CompanyID, 
	i.Tag,
	i.Description,
    cc.ContractId, 
    cc.ContractNumber, 
    fr.RequestNO, 
    fr.ReqDate, 
    fr.Item, 
    fr.ReqMivQty, 
    fr.ReserveMivQty, 
    fr.DelMivQty, 
    fr.ReqMivRejQty, 
    fr.ReserveMivRejQty, 
    fr.DelMivRejQty, 
    fr.ReqMrvQty, 
    fr.DelMrvQty, 
    fr.DelMrvRejQty, 
    fr.IssuedBy, 
    fr.IssuedDate, 
    fr.MRCNO, 
    fr.MRVNO, 
    u.UnitName, 
    l.LocationName, 
    fr.TypeID
FROM     
    LocItems li
    INNER JOIN Items i ON li.ItemId = i.ItemId 
    INNER JOIN Locations l ON li.LocationID = l.LocationID 
    INNER JOIN FilteredRequests fr ON li.LocItemID = fr.LocItemID 
    INNER JOIN Units u ON i.UnitID = u.UnitID 
    INNER JOIN Packages p ON i.PKID = p.PKID 
    INNER JOIN PackingLists pl ON p.PLId = pl.PLId 
    INNER JOIN CompanyContracts cc ON fr.ContractId = cc.ContractId 
    INNER JOIN Companies c ON fr.CompanyID = c.CompanyID
GROUP BY 
    fr.ReqLocItemID, li.LocItemID, i.ItemId, p.PK, pl.PLName, c.CompanyID, 
    cc.ContractId, cc.ContractNumber, fr.RequestNO, fr.ReqDate, fr.Item, 
    fr.ReqMivQty, fr.ReserveMivQty, fr.DelMivQty, fr.ReqMivRejQty, 
    fr.ReserveMivRejQty, fr.DelMivRejQty, fr.ReqMrvQty, fr.DelMrvQty, 
    fr.DelMrvRejQty,fr.IssuedBy, fr.IssuedDate, fr.MRCNO, fr.MRVNO,
    u.UnitName, l.LocationName, fr.TypeID,	i.Tag,
	i.Description
HAVING 
    SUM(COALESCE(fr.DelMrvQty, 0))+SUM(COALESCE(fr.DelMrvRejQty, 0)) < SUM(COALESCE(fr.DelMivQty, 0))+SUM(COALESCE(fr.DelMivRejQty, 0));
END
GO
/****** Object:  StoredProcedure [dbo].[AllMaterialMrvable2]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AllMaterialMrvable2]
    @CompanyID INT
AS
BEGIN
     SET NOCOUNT ON;
SELECT 
    Requests.LocItemID, 
	Items.ItemId, 
    Items.Tag, 
    Items.Description, 
    Units.UnitName,
    SUM(COALESCE(Requests.ReqMivQty, 0)) AS TotalReqMivQty, 
    SUM(COALESCE(Requests.ReserveMivQty, 0)) AS TotalReserveMivQty, 
    SUM(COALESCE(Requests.DelMivQty, 0)) AS TotalDelMivQty, 
    SUM(COALESCE(Requests.ReqMivRejQty, 0)) AS TotalReqMivRejQty, 
    SUM(COALESCE(Requests.ReserveMivRejQty, 0)) AS TotalReserveMivRejQty, 
    SUM(COALESCE(Requests.DelMivRejQty, 0)) AS TotalDelMivRejQty, 
    (SUM(COALESCE(Requests.DelMivQty, 0)) + SUM(COALESCE(Requests.DelMivRejQty, 0))) - 
     (SUM(COALESCE(Requests.DelMrvQty, 0)) + SUM(COALESCE(Requests.DelMrvRejQty, 0))) AS MrvAvailableQty, 
    SUM(COALESCE(Requests.ReqMrvQty, 0)) AS TotalReqMrvQty, 
    SUM(COALESCE(Requests.DelMrvQty, 0)) AS TotalDelMrvQty, 
    SUM(COALESCE(Requests.DelMrvRejQty, 0)) AS TotalDelMrvRejQty
FROM 
    Requests 
INNER JOIN
    LocItems ON Requests.LocItemID = LocItems.LocItemID 
INNER JOIN
    Items ON LocItems.ItemId = Items.ItemId 
INNER JOIN
    Units ON Items.UnitID = Units.UnitID
WHERE  
    Requests.CompanyID = @CompanyID 
    AND (Requests.TypeID = 2 OR Requests.TypeID = 1)
GROUP BY 
    Requests.LocItemID, Items.ItemId, Items.Tag, Items.Description, Units.UnitName
HAVING 
    SUM(COALESCE(DelMivQty, 0)) > 0 OR SUM(COALESCE(DelMivRejQty, 0)) > 0; 
END
GO
/****** Object:  StoredProcedure [dbo].[AllMaterialMrvable3]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AllMaterialMrvable3]
    @CompanyID INT
AS
BEGIN
     SET NOCOUNT ON;
SELECT 
    Requests.LocItemID, 
	Requests.RequestNO,
	Items.ItemId, 
    Items.Tag, 
    Items.Description, 
    Units.UnitName,
    SUM(COALESCE(Requests.ReqMivQty, 0)) AS TotalReqMivQty, 
    SUM(COALESCE(Requests.ReserveMivQty, 0)) AS TotalReserveMivQty, 
    SUM(COALESCE(Requests.DelMivQty, 0)) AS TotalDelMivQty, 
    SUM(COALESCE(Requests.ReqMivRejQty, 0)) AS TotalReqMivRejQty, 
    SUM(COALESCE(Requests.ReserveMivRejQty, 0)) AS TotalReserveMivRejQty, 
    SUM(COALESCE(Requests.DelMivRejQty, 0)) AS TotalDelMivRejQty, 
    (SUM(COALESCE(Requests.DelMivQty, 0)) + SUM(COALESCE(Requests.DelMivRejQty, 0))) - 
     (SUM(COALESCE(Requests.DelMrvQty, 0)) + SUM(COALESCE(Requests.DelMrvRejQty, 0))) AS MrvAvailableQty, 
    SUM(COALESCE(Requests.ReqMrvQty, 0)) AS TotalReqMrvQty, 
    SUM(COALESCE(Requests.DelMrvQty, 0)) AS TotalDelMrvQty, 
    SUM(COALESCE(Requests.DelMrvRejQty, 0)) AS TotalDelMrvRejQty
FROM 
    Requests 
INNER JOIN
    LocItems ON Requests.LocItemID = LocItems.LocItemID 
INNER JOIN
    Items ON LocItems.ItemId = Items.ItemId 
INNER JOIN
    Units ON Items.UnitID = Units.UnitID
WHERE  
    Requests.CompanyID = @CompanyID 
    AND (Requests.TypeID = 2 OR Requests.TypeID = 1)
GROUP BY 
    Requests.LocItemID, Items.ItemId, Items.Tag, Items.Description, Units.UnitName,Requests.RequestNO
HAVING 
   SUM(COALESCE(DelMivQty, 0)) > 0 OR SUM(COALESCE(DelMivRejQty, 0)) > 0; 
END
GO
/****** Object:  StoredProcedure [dbo].[AllMaterialMrvable4]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AllMaterialMrvable4]
    @CompanyID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- برای گرفتن اطلاعات MIV (TypeID = 1) که DelQty آنها بیشتر از صفر است
    WITH MivData AS (
        SELECT 
            Requests.LocItemID, 
            Requests.RequestNO,
            Items.ItemId, 
            Items.Tag, 
            Items.Description, 
            Units.UnitName,
            SUM(COALESCE(Requests.DelMivQty, 0)) AS TotalDelMivQty, 
            SUM(COALESCE(Requests.DelMivRejQty, 0)) AS TotalDelMivRejQty,
		    SUM(COALESCE(Requests.DelMrvRejQty, 0)) AS TotalDelMrvRejQty
        FROM 
            Requests 
        INNER JOIN
            LocItems ON Requests.LocItemID = LocItems.LocItemID 
        INNER JOIN
            Items ON LocItems.ItemId = Items.ItemId 
        INNER JOIN
            Units ON Items.UnitID = Units.UnitID
        WHERE  
            Requests.CompanyID = @CompanyID 
            AND Requests.TypeID = 1  -- فقط MIV ها (TypeID = 1)
        GROUP BY 
            Requests.LocItemID, Items.ItemId, Items.Tag, Items.Description, Units.UnitName, Requests.RequestNO
        HAVING 
            SUM(COALESCE(Requests.DelMivQty, 0)) > 0  -- فقط مواردی که DelQty آنها بزرگتر از صفر است
    )

    -- برای گرفتن اطلاعات MRV (TypeID = 2)
    SELECT 
        m.LocItemID, 
        m.RequestNO,
        m.ItemId, 
        m.Tag, 
        m.Description, 
        m.UnitName,
        m.TotalDelMivQty, 
        m.TotalDelMivRejQty, 
        ((m.TotalDelMivQty + m.TotalDelMivRejQty) - (SUM(COALESCE(r.DelMrvQty, 0))+SUM(COALESCE(r.DelMrvRejQty, 0)))) AS MrvAvailableQty,  -- کم کردن MRV ها
        SUM(COALESCE(r.ReqMrvQty, 0)*-1) AS TotalReqMrvQty, 
        SUM(COALESCE(r.DelMrvQty, 0)*-1) AS TotalDelMrvQty,
		SUM(COALESCE(r.DelMrvRejQty, 0)*-1) AS TotalDelMrvRejQty
		--SUM(COALESCE(r.ReqMivQty, 0)) AS TotalReqMivQty, 
		--SUM(COALESCE(r.ReserveMivQty, 0)) AS TotalReserveMivQty, 
		--SUM(COALESCE(r.ReqMivRejQty, 0)) AS TotalReqMivRejQty, 
		--SUM(COALESCE(r.ReserveMivRejQty, 0)) AS TotalReserveMivRejQty
		FROM 
        MivData m
    LEFT JOIN 
        Requests r ON m.LocItemID = r.LocItemID 
                  AND m.RequestNO = r.MRCNO  -- بر اساس RequestNO و LocItemID همسان‌سازی می‌شود
                  AND r.TypeID = 2  -- فقط MRV ها (TypeID = 2)
    GROUP BY 
        m.LocItemID, m.RequestNO, m.ItemId, m.Tag, m.Description, m.UnitName, m.TotalDelMivQty,m.TotalDelMivRejQty
    --HAVING 
    --    (m.TotalDelMivQty + m.TotalDelMivRejQty) - 
    --    (SUM(COALESCE(r.DelMrvQty, 0))) > 0;  -- فقط مواردی که موجودی آنها بیشتر از صفر است

END;
GO
/****** Object:  StoredProcedure [dbo].[AllMaterialMrvHmvable]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AllMaterialMrvHmvable]
    @CompanyID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- CTE to calculate MIV data (TypeID = 1)
    WITH MivData AS (
        SELECT 
            Requests.CompanyID,
            Requests.LocItemID, 
            Requests.RequestNO,
            Items.ItemId, 
            Items.Tag, 
            Items.Description, 
            Units.UnitName,
            SUM(COALESCE(Requests.DelMivQty, 0)) AS TotalDelMivQty, 
            SUM(COALESCE(Requests.DelMivRejQty, 0)) AS TotalDelMivRejQty
        FROM 
            Requests 
        INNER JOIN
            LocItems ON Requests.LocItemID = LocItems.LocItemID 
        INNER JOIN
            Items ON LocItems.ItemId = Items.ItemId 
        INNER JOIN
            Units ON Items.UnitID = Units.UnitID
      --  INNER JOIN 
		    --RequestTypes ON Requests.TypeID=RequestTypes.TypeID
        WHERE  
            Requests.CompanyID = @CompanyID 
            AND Requests.TypeID = 1  -- Filter for MIV data (TypeID = 1)
        GROUP BY 
            Requests.CompanyID, 
            Requests.LocItemID, 
            Items.ItemId, 
            Items.Tag, 
            Items.Description, 
            Units.UnitName, 
            Requests.RequestNO
        HAVING 
            SUM(COALESCE(Requests.DelMivQty, 0)) > 0
    ),

    -- Separate CTE to calculate HMV data (TypeID = 3)
    HmvData AS (
        SELECT 
            HMVRequests.LocItemID,
            HMVRequests.MRCNO,
            SUM(COALESCE(HMVRequests.DelHmvQty, 0)) AS TotalGetHmvQty,
            SUM(COALESCE(HMVRequests.DelHmvRejQty, 0)) AS TotalGetHmvRejQty
        FROM 
            Requests AS HMVRequests
        WHERE 
            HMVRequests.TypeID = 3  -- Filter for HMV data (TypeID = 3)
            AND HMVRequests.CompanyID2 = @CompanyID
        GROUP BY 
            HMVRequests.LocItemID,
            HMVRequests.MRCNO
    )

    -- Main query joining MivData and HmvData CTEs
    SELECT 
        m.LocItemID, 
		h.LocItemID,
        m.RequestNO,
		
        m.ItemId, 
        m.Tag, 
        m.Description, 
        m.UnitName,
        m.TotalDelMivQty, 
        m.TotalDelMivRejQty, 
        ((m.TotalDelMivQty + m.TotalDelMivRejQty + COALESCE(h.TotalGetHmvQty, 0) + COALESCE(h.TotalGetHmvRejQty, 0))) 
            - (SUM(COALESCE(r.DelMrvQty, 0)) + SUM(COALESCE(r.DelMrvRejQty, 0)) + SUM(COALESCE(hmv.DelHmvQty, 0)) + SUM(COALESCE(hmv.DelHmvRejQty, 0))) AS MrvHmvAvailableQty,  
        SUM(COALESCE(r.ReqMrvQty, 0) * -1) AS TotalReqMrvQty, 
        SUM(COALESCE(r.DelMrvQty, 0) * -1) AS TotalDelMrvQty,
        SUM(COALESCE(r.DelMrvRejQty, 0) * -1) AS TotalDelMrvRejQty,
        SUM(COALESCE(hmv.DelHmvQty, 0) * -1) AS TotalDelHmvQty,
        SUM(COALESCE(hmv.DelHmvRejQty, 0) * -1) AS TotalDelHmvRejQty,
        COALESCE(h.TotalGetHmvQty, 0) AS TotalGetHmvQty,  
        COALESCE(h.TotalGetHmvRejQty, 0) AS TotalGetHmvRejQty  
    FROM 
        MivData m
    full JOIN 
        HmvData h ON m.LocItemID = h.LocItemID AND m.RequestNO = h.MRCNO
    LEFT JOIN 
        Requests r ON m.LocItemID = r.LocItemID
            AND m.RequestNO = r.MRCNO  
            AND m.CompanyID = @CompanyID
            AND r.TypeID = 2  -- MRV data (TypeID = 2)
    LEFT JOIN 
        Requests hmv ON m.LocItemID = hmv.LocItemID
            AND m.RequestNO = hmv.MRCNO  
            AND m.CompanyID = @CompanyID
            AND hmv.TypeID = 3  -- HMV data (TypeID = 3)
    GROUP BY 
        m.LocItemID,h.LocItemID, m.RequestNO, m.ItemId, m.Tag, m.Description, m.UnitName, 
        m.TotalDelMivQty, m.TotalDelMivRejQty, h.TotalGetHmvQty, h.TotalGetHmvRejQty
END
GO
/****** Object:  StoredProcedure [dbo].[AllMaterialMrvHmvable_old]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[AllMaterialMrvHmvable_old]
    @CompanyID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- ????? ??????? MIV (TypeID = 1) ? HMV (TypeID = 3) ?? DelQty ???? ????? ?? ??? ???
    WITH MivData AS (
        SELECT 
            Requests.CompanyID,
            Requests.LocItemID, 
            Requests.RequestNO,
            Items.ItemId, 
            Items.Tag, 
            Items.Description, 
            Units.UnitName,
            SUM(COALESCE(Requests.DelMivQty, 0)) AS TotalDelMivQty, 
            SUM(COALESCE(Requests.DelMivRejQty, 0)) AS TotalDelMivRejQty,
            --SUM(COALESCE(Requests.DelMrvRejQty, 0)) AS TotalDelMrvRejQty,
            SUM(COALESCE(HMVRequests.DelHmvQty, 0)) AS TotalGetHmvQty,  -- ????? ???? DelHmvQty
            SUM(COALESCE(HMVRequests.DelHmvRejQty, 0)) AS TotalGetHmvRejQty  -- ????? ???? DelHmvRejQty
        FROM 
            Requests 
        INNER JOIN
            LocItems ON Requests.LocItemID = LocItems.LocItemID 
        INNER JOIN
            Items ON LocItems.ItemId = Items.ItemId 
        INNER JOIN
            Units ON Items.UnitID = Units.UnitID
        full outer JOIN 
            Requests AS HMVRequests ON Requests.LocItemID = HMVRequests.LocItemID
                                  AND Requests.RequestNO = HMVRequests.MRCNO
                                   AND HMVRequests.TypeID = 3  -- ??? HMV ?? (TypeID = 3)
                                   AND HMVRequests.CompanyID2 = @CompanyID  -- ????????? ?? CompanyID2 ???? ????? ?? @CompanyID ???
        WHERE  
            Requests.CompanyID = @CompanyID 
            AND (Requests.TypeID = 1 or Requests.TypeID = 3) -- ??? MIV ?? (TypeID = 1)
        GROUP BY 
            Requests.CompanyID,  -- ????? ???? CompanyID ?? ?????????
            Requests.LocItemID, 
            Items.ItemId, 
            Items.Tag, 
            Items.Description, 
            Units.UnitName, 
            Requests.RequestNO
        HAVING 
            SUM(COALESCE(Requests.DelMivQty, 0)) > 0 or  SUM(COALESCE(HMVRequests.DelHmvQty, 0)) > 0 -- ??? ?????? ?? DelQty ???? ?????? ?? ??? ???
    )

    -- ????? ??????? MRV (TypeID = 2) ? HMV (TypeID = 3) ? ?????? ?????? ???? ?????
    SELECT 
        m.LocItemID, 
        m.RequestNO,
        m.ItemId, 
        m.Tag, 
        m.Description, 
        m.UnitName,
        m.TotalDelMivQty, 
        m.TotalDelMivRejQty, 
        ((m.TotalDelMivQty + m.TotalDelMivRejQty + COALESCE(m.TotalGetHmvQty, 0) + COALESCE(m.TotalGetHmvRejQty, 0))) 
		- (SUM(COALESCE(r.DelMrvQty, 0)) + SUM(COALESCE(r.DelMrvRejQty, 0))+ SUM(COALESCE(h.DelHmvQty, 0))+ SUM(COALESCE(h.DelHmvRejQty, 0))) AS MrvHmvAvailableQty,  -- ?? ???? MRV ? HMV
        SUM(COALESCE(r.ReqMrvQty, 0)*-1) AS TotalReqMrvQty, 
        SUM(COALESCE(r.DelMrvQty, 0)*-1) AS TotalDelMrvQty,
        SUM(COALESCE(r.DelMrvRejQty, 0)*-1) AS TotalDelMrvRejQty,
	    SUM(COALESCE(h.DelHmvQty, 0)*-1) AS TotalDelHmvQty,
		SUM(COALESCE(h.DelHmvRejQty, 0)*-1) AS TotalDelHmvRejQty,


        COALESCE(m.TotalGetHmvQty, 0) AS TotalGetHmvQty,  -- ????? HMV
        COALESCE(m.TotalGetHmvRejQty, 0) AS TotalGetlHmvRejQty  -- ????? HMV Rej
    FROM 
        MivData m
    LEFT JOIN 
        Requests r ON m.LocItemID = r.LocItemID
		          AND m.RequestNO = r.MRCNO  -- ?? ???? RequestNO ? LocItemID ?????????? ??????
                  AND m.CompanyID=@CompanyID
				  AND r.TypeID = 2  -- ??? MRV ?? (TypeID = 2)
    LEFT JOIN 
        Requests h ON m.LocItemID = h.LocItemID
                  AND m.RequestNO = h.MRCNO  -- ?? ???? RequestNO ? LocItemID ?????????? ??????
                  AND m.CompanyID=@CompanyID
				  AND h.TypeID = 3  -- ??? HMV ?? (TypeID = 3)
    GROUP BY 
        m.LocItemID, m.RequestNO, m.ItemId, m.Tag, m.Description, m.UnitName, m.TotalDelMivQty, m.TotalDelMivRejQty, m.TotalGetHmvQty, m.TotalGetHmvRejQty

END;
GO
/****** Object:  StoredProcedure [dbo].[AllMaterialMrvHmvable2]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AllMaterialMrvHmvable2]
    @CompanyID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- CTE to calculate MIV data (TypeID = 1)
    WITH MivData AS (
        SELECT 
            Requests.CompanyID,
            Requests.TypeID,
            Requests.LocItemID, 
            Requests.RequestNO,
            Items.ItemId, 
            Items.Tag, 
            Items.Description, 
            Units.UnitName,
            SUM(COALESCE(Requests.DelMivQty, 0)) AS TotalDelMivQty, 
            SUM(COALESCE(Requests.DelMivRejQty, 0)) AS TotalDelMivRejQty
        FROM 
            Requests 
        INNER JOIN
            LocItems ON Requests.LocItemID = LocItems.LocItemID 
        INNER JOIN
            Items ON LocItems.ItemId = Items.ItemId 
        INNER JOIN
            Units ON Items.UnitID = Units.UnitID
        WHERE  
            Requests.CompanyID = @CompanyID 
            AND Requests.TypeID = 1  -- Filter for MIV data (TypeID = 1)
        GROUP BY 
            Requests.CompanyID, 
            Requests.LocItemID, 
            Requests.TypeID,
            Items.ItemId, 
            Items.Tag, 
            Items.Description, 
            Units.UnitName, 
            Requests.RequestNO
        HAVING 
            SUM(COALESCE(Requests.DelMivQty, 0)) > 0
    )

    -- Main query joining MivData and HmvData with FULL JOIN to include all records from both
    SELECT 
        COALESCE(m.LocItemID, h.LocItemID) AS LocItemID, 
        --CASE 
        --    WHEN m.TypeID = 1 THEN 'MIV-' + CAST(m.RequestNO AS VARCHAR)
        --    WHEN h.TypeID = 3 THEN 'HMV-' + CAST(h.RequestNO AS VARCHAR)
        --    ELSE NULL
        --END AS RequestNO,
		COALESCE(m.RequestNO, h.RequestNO) AS RequestNO, 
        CASE 
            WHEN COALESCE(m.TypeID, h.TypeID) = 1 THEN 'MIV'
            WHEN COALESCE(m.TypeID, h.TypeID) = 3 THEN 'HMV'
            ELSE NULL
        END AS TypeName,
        COALESCE(m.ItemId, h.ItemId) AS ItemId, 
        COALESCE(m.Tag, h.Tag) AS Tag, 
        COALESCE(m.Description, h.Description) AS Description, 
        COALESCE(m.UnitName, h.UnitName) AS UnitName,
        COALESCE(m.TotalDelMivQty, h.TotalGetHmvQty, 0) AS TotalDelMivQty,  
        COALESCE(m.TotalDelMivRejQty, h.TotalGetHmvRejQty, 0) AS TotalDelMivRejQty, 
        ((COALESCE(m.TotalDelMivQty, 0) + COALESCE(m.TotalDelMivRejQty, 0) + COALESCE(h.TotalGetHmvQty, 0) + COALESCE(h.TotalGetHmvRejQty, 0))) 
            - (SUM(COALESCE(r.DelMrvQty, 0)) + SUM(COALESCE(r.DelMrvRejQty, 0)) + SUM(COALESCE(hmv.DelHmvQty, 0)) + SUM(COALESCE(hmv.DelHmvRejQty, 0))) AS MrvHmvAvailableQty,  
        SUM(COALESCE(r.ReqMrvQty, 0) * -1) AS TotalReqMrvQty, 
        SUM(COALESCE(r.DelMrvQty, 0) * -1) AS TotalDelMrvQty,
        SUM(COALESCE(r.DelMrvRejQty, 0) * -1) AS TotalDelMrvRejQty,
        SUM(COALESCE(hmv.DelHmvQty, 0) * -1) AS TotalDelHmvQty,
        SUM(COALESCE(hmv.DelHmvRejQty, 0) * -1) AS TotalDelHmvRejQty,
        COALESCE(h.TotalGetHmvQty, 0) AS TotalGetHmvQty,  
        COALESCE(h.TotalGetHmvRejQty, 0) AS TotalGetHmvRejQty  
    FROM 
        MivData m
    FULL JOIN 
        (SELECT 
            HMVRequests.LocItemID,
            HMVRequests.RequestNO,
            HMVRequests.TypeID,
            HMVRequests.MRCNO,
            Items.ItemId,
            Items.Tag,
            Items.Description,
            Units.UnitName,
            SUM(COALESCE(HMVRequests.DelHmvQty, 0)) AS TotalGetHmvQty,
            SUM(COALESCE(HMVRequests.DelHmvRejQty, 0)) AS TotalGetHmvRejQty
         FROM 
            Requests AS HMVRequests
         INNER JOIN 
            LocItems ON HMVRequests.LocItemID = LocItems.LocItemID
         INNER JOIN 
            Items ON LocItems.ItemId = Items.ItemId
         INNER JOIN 
            Units ON Items.UnitID = Units.UnitID
         WHERE 
            HMVRequests.TypeID = 3  
            AND HMVRequests.CompanyID2 = @CompanyID
         GROUP BY 
            HMVRequests.LocItemID,
            HMVRequests.MRCNO,
            HMVRequests.RequestNO,
            HMVRequests.TypeID,
            Items.ItemId,
            Items.Tag,
            Items.Description,
            Units.UnitName
        ) h ON m.LocItemID = h.LocItemID AND m.RequestNO = h.MRCNO
    LEFT JOIN 
        Requests r ON COALESCE(m.LocItemID, h.LocItemID) = r.LocItemID
            AND COALESCE(m.RequestNO, h.MRCNO) = r.MRCNO  
            AND r.CompanyID = @CompanyID
            AND r.TypeID = 2  -- MRV data (TypeID = 2)
    LEFT JOIN 
        Requests hmv ON COALESCE(m.LocItemID, h.LocItemID) = hmv.LocItemID
            AND COALESCE(m.RequestNO, h.MRCNO) = hmv.MRCNO  
            AND hmv.CompanyID = @CompanyID
            AND hmv.TypeID = 3  -- HMV data (TypeID = 3)
    GROUP BY 
        COALESCE(m.LocItemID, h.LocItemID), 
        --CASE 
        --    WHEN m.TypeID = 1 THEN 'MIV-' + CAST(m.RequestNO AS VARCHAR)
        --    WHEN h.TypeID = 3 THEN 'HMV-' + CAST(h.RequestNO AS VARCHAR)
        --    ELSE NULL
        --END,
		COALESCE(m.RequestNO, h.RequestNO),
        CASE 
            WHEN COALESCE(m.TypeID, h.TypeID) = 1 THEN 'MIV'
            WHEN COALESCE(m.TypeID, h.TypeID) = 3 THEN 'HMV'
            ELSE NULL
        END,
        COALESCE(m.ItemId, h.ItemId), 
        COALESCE(m.Tag, h.Tag), 
        COALESCE(m.Description, h.Description), 
        COALESCE(m.UnitName, h.UnitName), 
        m.TotalDelMivQty, 
        m.TotalDelMivRejQty, 
        h.TotalGetHmvQty, 
        h.TotalGetHmvRejQty
END
GO
/****** Object:  StoredProcedure [dbo].[AllMaterialMrvHmvable2025]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AllMaterialMrvHmvable2025]
    @CompanyID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- CTE to calculate MIV data (TypeID = 1)
    WITH MivData AS (
        SELECT 
            Requests.CompanyID,
            Requests.TypeID,
            Requests.LocItemID, 
            Requests.RequestNO,
            Items.ItemId, 
            Items.Tag, 
            Items.Description, 
            Units.UnitName,
            SUM(COALESCE(Requests.DelMivQty, 0)) AS TotalDelMivQty, 
            SUM(COALESCE(Requests.DelMivRejQty, 0)) AS TotalDelMivRejQty
        FROM 
            Requests 
        INNER JOIN
            LocItems ON Requests.LocItemID = LocItems.LocItemID 
        INNER JOIN
            Items ON LocItems.ItemId = Items.ItemId 
        INNER JOIN
            Units ON Items.UnitID = Units.UnitID
        WHERE  
            Requests.CompanyID = @CompanyID 
            AND Requests.TypeID = 1  -- Filter for MIV data (TypeID = 1)
        GROUP BY 
            Requests.CompanyID, 
            Requests.LocItemID, 
            Requests.TypeID,
            Items.ItemId, 
            Items.Tag, 
            Items.Description, 
            Units.UnitName, 
            Requests.RequestNO
        HAVING 
            SUM(COALESCE(Requests.DelMivQty, 0)) > 0
    )

    -- Main query joining MivData and HmvData with FULL JOIN to include all records from both
    SELECT 
        COALESCE(m.LocItemID, h.LocItemID) AS LocItemID, 
        --CASE 
        --    WHEN m.TypeID = 1 THEN 'MIV-' + CAST(m.RequestNO AS VARCHAR)
        --    WHEN h.TypeID = 3 THEN 'HMV-' + CAST(h.RequestNO AS VARCHAR)
        --    ELSE NULL
        --END AS RequestNO,
		COALESCE(m.RequestNO, h.RequestNO) AS RequestNO, 
        CASE 
            WHEN COALESCE(m.TypeID, h.TypeID) = 1 THEN 'MIV'
            WHEN COALESCE(m.TypeID, h.TypeID) = 3 THEN 'HMV'
            ELSE NULL
        END AS TypeName,
        COALESCE(m.ItemId, h.ItemId) AS ItemId, 
        COALESCE(m.Tag, h.Tag) AS Tag, 
        COALESCE(m.Description, h.Description) AS Description, 
        COALESCE(m.UnitName, h.UnitName) AS UnitName,
        COALESCE(m.TotalDelMivQty, h.TotalGetHmvQty, 0) AS TotalDelMivQty,  
        COALESCE(m.TotalDelMivRejQty, h.TotalGetHmvRejQty, 0) AS TotalDelMivRejQty, 
        ((COALESCE(m.TotalDelMivQty, 0) + COALESCE(m.TotalDelMivRejQty, 0) 
		+ COALESCE(h.TotalGetHmvQty, 0) + COALESCE(h.TotalGetHmvRejQty, 0))) 
        - (SUM(COALESCE(r.DelMrvQty, 0)) + SUM(COALESCE(r.DelMrvRejQty, 0)) 
		+ SUM(COALESCE(hmv.DelHmvQty, 0)) + SUM(COALESCE(hmv.DelHmvRejQty, 0)) 
		+ SUM(COALESCE(hmv2.DelMrvQty, 0)) + SUM(COALESCE(hmv2.DelMrvRejQty, 0))) AS MrvHmvAvailableQty, 
		--+ SUM(COALESCE(hmv2.DelHmvQty, 0)) + SUM(COALESCE(hmv2.DelHmvRejQty, 0))) AS MrvHmvAvailableQty,  
        SUM(COALESCE(r.ReqMrvQty, 0) * -1) AS TotalReqMrvQty, 
        SUM(COALESCE(r.DelMrvQty,hmv2.DelMrvQty, 0) * -1) AS TotalDelMrvQty,
        SUM(COALESCE(r.DelMrvRejQty,hmv2.DelMrvRejQty, 0) * -1) AS TotalDelMrvRejQty,
        SUM(COALESCE(hmv.DelHmvQty, 0) * -1) AS TotalDelHmvQty,
        SUM(COALESCE(hmv.DelHmvRejQty, 0) * -1) AS TotalDelHmvRejQty,
        COALESCE(h.TotalGetHmvQty, 0) AS TotalGetHmvQty,  
        COALESCE(h.TotalGetHmvRejQty, 0) AS TotalGetHmvRejQty  
    FROM 
        MivData m
    FULL JOIN 
        (SELECT 
            HMVRequests.LocItemID,
            HMVRequests.RequestNO,
            HMVRequests.TypeID,
            HMVRequests.MRCNO,
            Items.ItemId,
            Items.Tag,
            Items.Description,
            Units.UnitName,
            SUM(COALESCE(HMVRequests.DelHmvQty, 0)) AS TotalGetHmvQty,
            SUM(COALESCE(HMVRequests.DelHmvRejQty, 0)) AS TotalGetHmvRejQty
         FROM 
            Requests AS HMVRequests
         INNER JOIN 
            LocItems ON HMVRequests.LocItemID = LocItems.LocItemID
         INNER JOIN 
            Items ON LocItems.ItemId = Items.ItemId
         INNER JOIN 
            Units ON Items.UnitID = Units.UnitID
         WHERE 
            HMVRequests.TypeID = 3  
            AND HMVRequests.CompanyID2 = @CompanyID
         GROUP BY 
            HMVRequests.LocItemID,
            HMVRequests.MRCNO,
            HMVRequests.RequestNO,
            HMVRequests.TypeID,
            Items.ItemId,
            Items.Tag,
            Items.Description,
            Units.UnitName
        ) h ON m.LocItemID = h.LocItemID AND m.RequestNO = h.MRCNO
    LEFT JOIN 
        Requests r ON COALESCE(m.LocItemID, h.LocItemID) = r.PLocItemIDforMRV
            AND COALESCE(m.RequestNO, h.MRCNO) = r.MRCNO  
            AND r.CompanyID = @CompanyID
            AND r.TypeID = 2  -- MRV data (TypeID = 2)
	LEFT JOIN 
        Requests hmv2 ON h.LocItemID = hmv2.PLocItemIDforMRV
            AND h.RequestNO = hmv2.MRCNO  
            AND hmv2.CompanyID = @CompanyID
            AND hmv2.TypeID = 2  -- HMV data (TypeID = 3)
    LEFT JOIN 
        Requests hmv ON COALESCE(m.LocItemID, h.LocItemID) = hmv.LocItemID
            AND COALESCE(m.RequestNO, h.MRCNO) = hmv.MRCNO  
            AND hmv.CompanyID = @CompanyID
            AND hmv.TypeID = 3  -- HMV data (TypeID = 3)
    GROUP BY 
        COALESCE(m.LocItemID, h.LocItemID), 
        --CASE 
        --    WHEN m.TypeID = 1 THEN 'MIV-' + CAST(m.RequestNO AS VARCHAR)
        --    WHEN h.TypeID = 3 THEN 'HMV-' + CAST(h.RequestNO AS VARCHAR)
        --    ELSE NULL
        --END,
		COALESCE(m.RequestNO, h.RequestNO),
        CASE 
            WHEN COALESCE(m.TypeID, h.TypeID) = 1 THEN 'MIV'
            WHEN COALESCE(m.TypeID, h.TypeID) = 3 THEN 'HMV'
            ELSE NULL
        END,
        COALESCE(m.ItemId, h.ItemId), 
        COALESCE(m.Tag, h.Tag), 
        COALESCE(m.Description, h.Description), 
        COALESCE(m.UnitName, h.UnitName), 
        m.TotalDelMivQty, 
        m.TotalDelMivRejQty, 
        h.TotalGetHmvQty, 
        h.TotalGetHmvRejQty
END
GO
/****** Object:  StoredProcedure [dbo].[AllMaterialMrvHmvable3]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AllMaterialMrvHmvable3]
    @CompanyID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- CTE to calculate MIV data (TypeID = 1)
    WITH MivData AS (
        SELECT 
            Requests.CompanyID,
            Requests.TypeID,
            Requests.LocItemID, 
            Requests.RequestNO,
            Items.ItemId, 
            Items.Tag, 
            Items.Description, 
            Units.UnitName,
            SUM(COALESCE(Requests.DelMivQty, 0)) AS TotalDelMivQty, 
            SUM(COALESCE(Requests.DelMivRejQty, 0)) AS TotalDelMivRejQty
        FROM 
            Requests 
        INNER JOIN
            LocItems ON Requests.LocItemID = LocItems.LocItemID 
        INNER JOIN
            Items ON LocItems.ItemId = Items.ItemId 
        INNER JOIN
            Units ON Items.UnitID = Units.UnitID
        WHERE  
            Requests.CompanyID = @CompanyID 
            AND Requests.TypeID = 1  -- Filter for MIV data (TypeID = 1)
        GROUP BY 
            Requests.CompanyID, 
            Requests.LocItemID, 
            Requests.TypeID,
            Items.ItemId, 
            Items.Tag, 
            Items.Description, 
            Units.UnitName, 
            Requests.RequestNO
        HAVING 
            SUM(COALESCE(Requests.DelMivQty, 0)) > 0
    )

    -- Main query joining MivData and HmvData with FULL JOIN to include all records from both
    SELECT 
        COALESCE(m.LocItemID, h.LocItemID) AS LocItemID, 
        --CASE 
        --    WHEN m.TypeID = 1 THEN 'MIV-' + CAST(m.RequestNO AS VARCHAR)
        --    WHEN h.TypeID = 3 THEN 'HMV-' + CAST(h.RequestNO AS VARCHAR)
        --    ELSE NULL
        --END AS RequestNO,
		COALESCE(m.RequestNO, h.RequestNO) AS RequestNO, 
        CASE 
            WHEN COALESCE(m.TypeID, h.TypeID) = 1 THEN 'MIV'
            WHEN COALESCE(m.TypeID, h.TypeID) = 3 THEN 'HMV'
            ELSE NULL
        END AS TypeName,
        COALESCE(m.ItemId, h.ItemId) AS ItemId, 
        COALESCE(m.Tag, h.Tag) AS Tag, 
        COALESCE(m.Description, h.Description) AS Description, 
        COALESCE(m.UnitName, h.UnitName) AS UnitName,
        COALESCE(m.TotalDelMivQty, h.TotalGetHmvQty, 0) AS TotalDelMivQty,  
        COALESCE(m.TotalDelMivRejQty, h.TotalGetHmvRejQty, 0) AS TotalDelMivRejQty, 
        ((COALESCE(m.TotalDelMivQty, 0) + COALESCE(m.TotalDelMivRejQty, 0) 
		+ COALESCE(h.TotalGetHmvQty, 0) + COALESCE(h.TotalGetHmvRejQty, 0))) 
         - (SUM(COALESCE(r.DelMrvQty, 0)) + SUM(COALESCE(r.DelMrvRejQty, 0)) 
		 + SUM(COALESCE(hmv.DelHmvQty, 0)) + SUM(COALESCE(hmv.DelHmvRejQty, 0))++ SUM(COALESCE(hmv2.DelHmvQty, 0)) + SUM(COALESCE(hmv2.DelHmvRejQty, 0))) AS MrvHmvAvailableQty,  
        SUM(COALESCE(r.ReqMrvQty, 0) * -1) AS TotalReqMrvQty, 
        SUM(COALESCE(r.DelMrvQty, 0) * -1) AS TotalDelMrvQty,
        SUM(COALESCE(r.DelMrvRejQty, 0) * -1) AS TotalDelMrvRejQty,
        SUM(COALESCE(hmv.DelHmvQty,hmv2.DelHmvQty, 0) * -1) AS TotalDelHmvQty,
        SUM(COALESCE(hmv.DelHmvRejQty,hmv2.DelHmvRejQty, 0) * -1) AS TotalDelHmvRejQty,
        COALESCE(h.TotalGetHmvQty, 0) AS TotalGetHmvQty,  
        COALESCE(h.TotalGetHmvRejQty, 0) AS TotalGetHmvRejQty  
    FROM 
        MivData m
    FULL JOIN 
        (SELECT 
            HMVRequests.LocItemID,
            HMVRequests.RequestNO,
            HMVRequests.TypeID,
            HMVRequests.MRCNO,
            Items.ItemId,
            Items.Tag,
            Items.Description,
            Units.UnitName,
            SUM(COALESCE(HMVRequests.DelHmvQty, 0)) AS TotalGetHmvQty,
            SUM(COALESCE(HMVRequests.DelHmvRejQty, 0)) AS TotalGetHmvRejQty
         FROM 
            Requests AS HMVRequests
         INNER JOIN 
            LocItems ON HMVRequests.LocItemID = LocItems.LocItemID
         INNER JOIN 
            Items ON LocItems.ItemId = Items.ItemId
         INNER JOIN 
            Units ON Items.UnitID = Units.UnitID
         WHERE 
            HMVRequests.TypeID = 3  
            AND HMVRequests.CompanyID2 = @CompanyID
         GROUP BY 
            HMVRequests.LocItemID,
            HMVRequests.MRCNO,
            HMVRequests.RequestNO,
            HMVRequests.TypeID,
            Items.ItemId,
            Items.Tag,
            Items.Description,
            Units.UnitName
        ) h ON m.LocItemID = h.LocItemID AND m.RequestNO = h.MRCNO
    LEFT JOIN 
        Requests r ON COALESCE(m.LocItemID, h.LocItemID) = r.LocItemID
            AND COALESCE(m.RequestNO, h.MRCNO) = r.MRCNO  
            AND r.CompanyID = @CompanyID
            AND r.TypeID = 2  -- MRV data (TypeID = 2)
    LEFT JOIN 
        Requests hmv ON COALESCE(m.LocItemID, h.LocItemID) = hmv.LocItemID
            AND COALESCE(m.RequestNO, h.MRCNO) = hmv.MRCNO  
            AND hmv.CompanyID = @CompanyID
            AND hmv.TypeID = 3  -- HMV data (TypeID = 3)
	LEFT JOIN 
        Requests hmv2 ON COALESCE(m.LocItemID, h.LocItemID) = hmv2.LocItemID
            AND h.RequestNO = hmv2.MRCNO  
            AND hmv2.CompanyID = @CompanyID
            AND hmv2.TypeID = 3  -- HMV data (TypeID = 3)
    GROUP BY 
        COALESCE(m.LocItemID, h.LocItemID), 
        --CASE 
        --    WHEN m.TypeID = 1 THEN 'MIV-' + CAST(m.RequestNO AS VARCHAR)
        --    WHEN h.TypeID = 3 THEN 'HMV-' + CAST(h.RequestNO AS VARCHAR)
        --    ELSE NULL
        --END,
		COALESCE(m.RequestNO, h.RequestNO),
        CASE 
            WHEN COALESCE(m.TypeID, h.TypeID) = 1 THEN 'MIV'
            WHEN COALESCE(m.TypeID, h.TypeID) = 3 THEN 'HMV'
            ELSE NULL
        END,
        COALESCE(m.ItemId, h.ItemId), 
        COALESCE(m.Tag, h.Tag), 
        COALESCE(m.Description, h.Description), 
        COALESCE(m.UnitName, h.UnitName), 
        m.TotalDelMivQty, 
        m.TotalDelMivRejQty, 
        h.TotalGetHmvQty, 
        h.TotalGetHmvRejQty
END
GO
/****** Object:  StoredProcedure [dbo].[ALLmivNOTapproved]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ALLmivNOTapproved]
AS
BEGIN
SELECT DISTINCT RequestNO
FROM Requests
WHERE ReserveMivQty != 0;
END
GO
/****** Object:  StoredProcedure [dbo].[AllMRCAsync]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[AllMRCAsync]
AS
BEGIN
    -- Set NOCOUNT to ON to prevent extra result sets
    SET NOCOUNT ON;

    SELECT 
        m.MrcId,
        c.CompanyName AS ToCompany, -- Replace 'CompanyName' with the actual column for company name
        m.MrcName,
        m.MrcDescription,
        m.PK,
        m.ItemOfPk,
        m.Tag,
        m.Description,
        u.UnitName AS Unit, -- Replace 'UnitName' with the actual column for unit name
        m.Qty,
        m.Size1,
        m.Size2,
        m.BatchNo,
        m.DocNo,
        m.Remark,
        e1.UserName AS EnteredBy, -- Replace 'UserName' with the actual column for user name
        m.EnteredDate,
        e2.UserName AS EditedBy, -- Replace 'UserName' with the actual column for user name
        m.EditedDate
    FROM 
        Mrcs m
    LEFT JOIN 
        Companies c ON m.ToCompanyID = c.CompanyID -- Replace 'CompanyID' with the actual column for the company's ID
    LEFT JOIN 
        Units u ON m.UnitID = u.UnitID -- Replace 'UnitID' with the actual column for the unit's ID
    LEFT JOIN 
        ApplicationUser e1 ON m.EnteredBy = e1.UserID -- Replace 'UserID' with the actual column for the user ID
    LEFT JOIN 
        ApplicationUser e2 ON m.EditedBy = e2.UserID -- Replace 'UserID' with the actual column for the user ID
END
GO
/****** Object:  StoredProcedure [dbo].[AllMRCnameAsync]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AllMRCnameAsync]
AS
BEGIN
    -- Set NOCOUNT to ON to prevent extra result sets
    SET NOCOUNT ON;

    SELECT DISTINCT 
        m.MrcName
    FROM 
        Mrcs m
END

GO
/****** Object:  StoredProcedure [dbo].[ALLMrvinfo]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[ALLMrvinfo]
    @RequestNO INT
AS
BEGIN
SELECT TOP 1 Requests.RequestNO, Requests.MRVNO, Companies.CompanyName
FROM     Requests INNER JOIN
                  Companies ON Requests.CompanyID = Companies.CompanyID
WHERE  (Requests.TypeID = 2) AND (RequestNO=@RequestNO)
END
GO
/****** Object:  StoredProcedure [dbo].[ALLMrvs]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ALLMrvs]
AS
BEGIN
SELECT DISTINCT RequestNO
FROM Requests
WHERE TypeID=2;
END
GO
/****** Object:  StoredProcedure [dbo].[APPROVEmiv]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[APPROVEmiv]
    @RequestNO NVARCHAR(100)
AS
BEGIN
SELECT 
    Companies.CompanyName, 
    CompanyContracts.ContractNumber, 
    Requests.ReqLocItemID, 
	SubQuery.ItemId,
	SubQuery.LocItemID,
	Requests.RequestNO, 
    SubQuery.PLName, 
    SubQuery.PK, 
    SubQuery.ItemOfPk, 
    SubQuery.Tag, 
    SubQuery.Description, 
    SubQuery.UnitName, 
    Requests.ReqMivQty, 
    Requests.ReserveMivQty, 
    Requests.DelMivQty, 
    Requests.ReqDate, 
    Requests.MRCNO, 
    Requests.IssuedBy, 
    Requests.IssuedDate, 
    Requests.ApprovedBy, 
    Requests.ApprovedDate, 
    SubQuery.LocationName, 
    SubQuery.ScopeName
FROM Requests
LEFT OUTER JOIN (
    SELECT 
        LocItems.LocItemID,
        Items.ItemId,
        Packages.PK,
        Items.ItemOfPk,
        Items.Tag,
        Items.Description,
        Units.UnitName,
        PackingLists.PLName,
        Locations.LocationName,
        Scopes.ScopeName
    FROM LocItems
    INNER JOIN Items ON LocItems.ItemId = Items.ItemId
    INNER JOIN Packages ON Items.PKID = Packages.PKID
    INNER JOIN PackingLists ON Packages.PLId = PackingLists.PLId
    INNER JOIN Units ON Items.UnitID = Units.UnitID
    INNER JOIN Scopes ON Items.ScopeID = Scopes.ScopeID
    INNER JOIN Locations ON LocItems.LocationID = Locations.LocationID
) AS SubQuery ON Requests.LocItemID = SubQuery.LocItemID
INNER JOIN Companies ON Requests.CompanyID = Companies.CompanyID
INNER JOIN CompanyContracts ON Requests.ContractId = CompanyContracts.ContractId
WHERE Requests.RequestNO = @RequestNO;
END
GO
/****** Object:  StoredProcedure [dbo].[ChangePKidOfItemid]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ChangePKidOfItemid]
    @pkid int,
	@itemid int
AS
BEGIN
UPDATE Items
SET PKID = @pkid
WHERE ItemId = @itemid
END
GO
/****** Object:  StoredProcedure [dbo].[CheckHmvNameCondition]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CheckHmvNameCondition]
    @CompanyID INT,
    @HmvNo NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    
    -- بررسی وجود رکورد با CompanyID و HmvNo مشخص
    SELECT 
        CASE 
            WHEN EXISTS (
                SELECT 1 
                FROM Requests
                WHERE CompanyID = @CompanyID 
                  AND HMVNO = @HmvNo
            ) 
            THEN 1 
            ELSE 0 
        END AS ConditionCheck;
END;
GO
/****** Object:  StoredProcedure [dbo].[CheckMrcDuplicate]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckMrcDuplicate]
    @CompanyID INT,
    @MRCNO NVARCHAR(50),
    @IsDuplicate BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    -- بررسی وجود رکورد با CompanyID و MRCNO
    IF EXISTS (
        SELECT 1
        FROM Requests
        WHERE CompanyID = @CompanyID AND MRCNO = @MRCNO
    )
    BEGIN
        SET @IsDuplicate = 1;  -- رکورد تکراری وجود دارد
    END
    ELSE
    BEGIN
        SET @IsDuplicate = 0;  -- رکورد تکراری وجود ندارد
    END
END
GO
/****** Object:  StoredProcedure [dbo].[CheckMrvCondition]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckMrvCondition]
    @LocItemID INT,
    @CompanyID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- محاسبه مجموع DelMivQty و DelMrvQty برای locItemID و companyID خاص
    SELECT 
        CASE 
            WHEN SUM(COALESCE(DelMrvQty, 0)) < SUM(COALESCE(DelMivQty, 0)) 
            THEN 1 
            ELSE 0 
        END AS IsConditionMet
    FROM Requests
    WHERE LocItemID = @LocItemID AND CompanyID = @CompanyID;
END
GO
/****** Object:  StoredProcedure [dbo].[CheckMrvCondition2]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[CheckMrvCondition2]
    @LocItemID INT,
    @CompanyID INT,
	@RequestNO NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    -- محاسبه مجموع DelMivQty و DelMrvQty برای locItemID و companyID خاص
    SELECT 
        CASE 
            WHEN SUM(COALESCE(DelMrvQty, 0)) < SUM(COALESCE(DelMivQty, 0)) 
            THEN 1 
            ELSE 0 
        END AS IsConditionMet
    FROM Requests
    WHERE LocItemID = @LocItemID AND CompanyID = @CompanyID AND RequestNO=@RequestNO;
END
GO
/****** Object:  StoredProcedure [dbo].[CheckMrvHmvCondition]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CheckMrvHmvCondition]
    @LocItemID INT,
    @CompanyID INT,
    @RequestNO NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    -- Define CTEs
    WITH CTE_RequestMivs AS (
        SELECT 
            SUM(COALESCE(DelMivQty, 0)) + SUM(COALESCE(DelMivRejQty, 0)) AS TotalDelMivQty
        FROM Requests
        WHERE LocItemID = @LocItemID 
            AND RequestNO = RIGHT('000000' + @RequestNO, 6)
            AND CompanyID = @CompanyID 
            AND TypeID = 1
    ),
    CTE_RequestMivs2 AS (
        SELECT 
            SUM(COALESCE(DelHmvQty, 0)) + SUM(COALESCE(DelHmvRejQty, 0)) AS TotalDelMivQty2
        FROM Requests
        WHERE LocItemID = @LocItemID 
            AND RequestNO = RIGHT('000000' + @RequestNO, 6)
            AND CompanyID2 = @CompanyID 
            AND TypeID = 3
    ),
    CTE_RequestMrvs AS (
        SELECT 
            SUM(COALESCE(DelMrvQty, 0)) + SUM(COALESCE(DelMrvRejQty, 0)) AS TotalDelMrvQty
        FROM Requests
        WHERE PLocItemIDforMRV = @LocItemID 
            AND MRCNO = RIGHT('000000' + @RequestNO, 6)
            AND CompanyID = @CompanyID 
            AND TypeID = 2
    ),
    CTE_RequestHmvs AS (
        SELECT 
            SUM(COALESCE(DelHmvQty, 0)) + SUM(COALESCE(DelHmvRejQty, 0)) AS TotalDelHmvQty
        FROM Requests
        WHERE LocItemID = @LocItemID 
            AND MRCNO = RIGHT('000000' + @RequestNO, 6)
            AND CompanyID = @CompanyID 
            AND TypeID = 3
    ),
    CTE_HMV2 AS (
        SELECT 
            SUM(COALESCE(h.DelMrvQty, 0)) + SUM(COALESCE(h.DelMrvRejQty, 0)) AS TotalDelHmvQty2
        FROM Requests h
        JOIN Requests hmv2 ON h.LocItemID = hmv2.PLocItemIDforMRV
            AND h.RequestNO = hmv2.MRCNO
            AND hmv2.CompanyID = @CompanyID
            AND hmv2.TypeID = 2
        WHERE h.TypeID = 3
    )

    -- Final SELECT with JOIN to include CTE_HMV2
    SELECT 
        CASE 
            WHEN (ISNULL(CTE_RequestMivs.TotalDelMivQty, 0) 
                + ISNULL(CTE_RequestMivs2.TotalDelMivQty2, 0)) 
                > (ISNULL(CTE_RequestMrvs.TotalDelMrvQty, 0) 
                + ISNULL(CTE_RequestHmvs.TotalDelHmvQty, 0) 
                + ISNULL(CTE_HMV2.TotalDelHmvQty2, 0))
            THEN 1 
            ELSE 0
        END AS ConditionCheck
    FROM CTE_RequestMivs
    CROSS JOIN CTE_RequestMivs2
    CROSS JOIN CTE_RequestMrvs
    CROSS JOIN CTE_RequestHmvs
    CROSS JOIN CTE_HMV2;
END;
GO
/****** Object:  StoredProcedure [dbo].[CheckMrvNameCondition]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[CheckMrvNameCondition]
    @CompanyID INT,
    @MrvNo NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    
    -- بررسی وجود رکورد با CompanyID و MrvNo مشخص
    SELECT 
        CASE 
            WHEN EXISTS (
                SELECT 1 
                FROM Requests
                WHERE CompanyID = @CompanyID 
                  AND MRVNO = @MrvNo
            ) 
            THEN 1 
            ELSE 0 
        END AS ConditionCheck;
END;
GO
/****** Object:  StoredProcedure [dbo].[CheckPackageByName]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CheckPackageExistence]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ClearMsrData]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ClearMsrData]
    @PLId INT
AS
BEGIN
    --SET NOCOUNT ON;

    -- پاک کردن مقادیر مرتبط با MSR
    UPDATE Packages
    SET 
        MSRNO = NULL,
        MSRDate = NULL,
        MSREnteredBy = NULL,
        MSRRev = NULL,
        MSRRevDate = NULL,
        MSRRevEnteredBy = NULL,
        MSRStatus = NULL
    WHERE PLId = @PLId;

    -- در صورت موفقیت
    SELECT 'MSR data cleared successfully' AS Message;
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteHMVByHMVNO]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteHMVByHMVNO]
    @RequestNO NVARCHAR(50)
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY
    
        -- حذف تمام ردیف‌های مرتبط با RequestNO
        DELETE FROM Requests
        WHERE RequestNO = @RequestNO AND TypeID = 3;

        -- تکمیل تراکنش
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- مدیریت خطا و بازگرداندن تراکنش
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteHmvRow]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteHmvRow]
    @ReqLocItemID INT,
    @RequestNO NVARCHAR(50)
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY


     
            -- حذف ردیف از جدول بر اساس ReqLocItemID و RequestNO با TypeID = 2
            DELETE FROM Requests
            WHERE ReqLocItemID = @ReqLocItemID AND RequestNO = @RequestNO AND TypeID = 3;

            -- تکمیل تراکنش
            COMMIT TRANSACTION;
       
    END TRY
    BEGIN CATCH
        -- در صورت خطا تراکنش به حالت اول بازگردانده می‌شود
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteItems]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteItems]
    @ItemIDList dbo.ItemIDListType READONLY
AS
BEGIN
    SET NOCOUNT ON;

    -- بررسی اینکه آیا locitemid مرتبط با itemid وجود دارد
    IF EXISTS (
        SELECT 1 
        FROM LocItems 
        WHERE ItemId IN (SELECT ItemID FROM @ItemIDList)
          AND LocItemID IN (SELECT ReqLocItemID FROM Requests)
    )
    BEGIN
        -- اگر locitemid در جدول Requests موجود بود، پیام خطا ارسال شود
        RAISERROR ('آیتم‌های انتخابی قابل حذف نیستند زیرا با درخواست‌های موجود مرتبط هستند.', 16, 1);
        RETURN;
    END

    -- حذف از جدول Items تنها در صورتی که locitemid در Requests نباشد
    DELETE FROM Items
    WHERE ItemId IN (SELECT ItemID FROM @ItemIDList);

    -- حذف locitemid های مرتبط از جدول LocItems
    DELETE FROM LocItems
    WHERE ItemId IN (SELECT ItemID FROM @ItemIDList);

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteLocItem]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteMrcById]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
    -- Set NOCOUNT to ON to prevent extra result sets
CREATE PROCEDURE [dbo].[DeleteMrcById]
    @MrcId INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM Mrcs
    WHERE MrcId = @MrcId;
END


GO
/****** Object:  StoredProcedure [dbo].[DeleteMrcsByMrcName]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteMrcsByMrcName]
    @MrcName NVARCHAR(255) -- Parameter for MrcName
AS
BEGIN
    -- Set NOCOUNT to ON to prevent extra result sets
    SET NOCOUNT ON;

    -- Delete rows where MrcName matches the input parameter
    DELETE FROM Mrcs
    WHERE MrcName = @MrcName;
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteMRVByMRVNO]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteMRVByMRVNO]
    @RequestNO NVARCHAR(50)
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY
        -- استخراج LocItemIDهای مرتبط با RequestNO
        DECLARE @UsedLocItems TABLE (LocItemID INT);

        INSERT INTO @UsedLocItems (LocItemID)
        SELECT DISTINCT LocItemID
        FROM Requests
        WHERE RequestNO = @RequestNO AND TypeID = 2;

        -- بررسی استفاده‌شدن LocItemIDها با TypeID = 1
        IF EXISTS (
            SELECT 1
            FROM Requests
            WHERE LocItemID IN (SELECT LocItemID FROM @UsedLocItems) AND TypeID = 1
        )
        BEGIN
            -- ایجاد لیستی از LocItemIDهایی که استفاده شده‌اند
            DECLARE @UsedLocItemIDs NVARCHAR(MAX);

            SELECT @UsedLocItemIDs = STRING_AGG(CAST(LocItemID AS NVARCHAR), ', ')
            FROM Requests
            WHERE LocItemID IN (SELECT LocItemID FROM @UsedLocItems) AND TypeID = 1;

            -- پیام خطا را آماده کنید
            DECLARE @ErrorMessage NVARCHAR(MAX);
            SET @ErrorMessage = 'Cannot delete. The following LocItemIDs are referenced with TypeID = 1: ' + @UsedLocItemIDs;

            -- تراکنش را بازگردانده و خطا را ثبت کنید
            ROLLBACK TRANSACTION;
            THROW 50003, @ErrorMessage, 1;
        END

        -- حذف تمام ردیف‌های مرتبط با RequestNO
        DELETE FROM Requests
        WHERE RequestNO = @RequestNO AND TypeID = 2;

        -- تکمیل تراکنش
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- مدیریت خطا و بازگرداندن تراکنش
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteMrvRow]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteMrvRow]
    @ReqLocItemID INT,
    @RequestNO NVARCHAR(50)
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY
        -- استخراج LocItemID مرتبط با ReqLocItemID
        DECLARE @LocItemID INT;

        SELECT @LocItemID = LocItemID
        FROM Requests
        WHERE ReqLocItemID = @ReqLocItemID;

        -- بررسی اینکه LocItemID با TypeID = 1 جایی استفاده نشده باشد
        IF NOT EXISTS (
            SELECT 1
            FROM Requests
            WHERE LocItemID = @LocItemID AND TypeID = 1
        )
        BEGIN
            -- حذف ردیف از جدول بر اساس ReqLocItemID و RequestNO با TypeID = 2
            DELETE FROM Requests
            WHERE ReqLocItemID = @ReqLocItemID AND RequestNO = @RequestNO AND TypeID = 2;

            -- تکمیل تراکنش
            COMMIT TRANSACTION;
        END
        ELSE
        BEGIN
            -- در صورتی که شرط وجود دارد
            ROLLBACK TRANSACTION;
            THROW 50002, 'Cannot delete. LocItemID is referenced with TypeID = 1.', 1;
        END
    END TRY
    BEGIN CATCH
        -- در صورت خطا تراکنش به حالت اول بازگردانده می‌شود
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteMultipleLocItems]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteMultipleLocItems]
    @LocItemIDList dbo.LocItemIDListType READONLY
AS
BEGIN
    SET NOCOUNT ON;

    -- مرحله 1: بررسی وجود LocItemID در جدول Requests
    IF EXISTS (SELECT 1 
               FROM Requests 
               WHERE LocItemID IN (SELECT LocItemID FROM @LocItemIDList))
    BEGIN
        -- اگر LocItemID در Requests وجود داشت، عملیات حذف را متوقف می‌کنیم
        RAISERROR ('Some LocItemIDs are in use in the Requests table and cannot be deleted.', 16, 1);
        RETURN;
    END

    -- مرحله 2: قبل از حذف، ذخیره ItemID های مرتبط با LocItemID هایی که قرار است حذف شوند
    DECLARE @ItemIDToDelete TABLE (ItemID INT);

    -- اضافه کردن ItemID ها به جدول موقت برای حذف
    INSERT INTO @ItemIDToDelete (ItemID)
    SELECT DISTINCT ItemID
    FROM LocItems
    WHERE LocItemID IN (SELECT LocItemID FROM @LocItemIDList);

    -- مرحله 3: حذف LocItemID ها در صورتی که در جدول Requests نباشند
    DELETE FROM LocItems
    WHERE LocItemID IN (SELECT LocItemID FROM @LocItemIDList);

    -- مرحله 4: حذف ItemIDهایی که دیگر هیچ LocItemID مرتبطی ندارند
	 DELETE FROM Items
	WHERE ItemId IN (
		SELECT ItemID 
		FROM @ItemIDToDelete AS T
		WHERE NOT EXISTS (
			SELECT 1
			FROM LocItems LI
			WHERE LI.ItemID = T.ItemID
		)
	);

END

GO
/****** Object:  StoredProcedure [dbo].[DeletePackage]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeletePackages]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeletePackingList]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ExistsPackingListByOpiNumber]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ExistsPackingListByPlName]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ExistsPackingListByPlNo]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllLocItems]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllMsrNo]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllMsrNo]
AS
BEGIN
 SET NOCOUNT ON;
WITH RankedPackages AS
(
    SELECT 
        PLId, 
        MSRNO,
        MSRDate,
        ROW_NUMBER() OVER (PARTITION BY PLId ORDER BY MSRDate DESC) AS RowNum
    FROM 
        Packages
    WHERE 
        MSRNO IS NOT NULL -- حذف ردیف‌هایی که MSRNO برابر NULL هستند
)
SELECT 
    PLId, 
    MSRNO
    --MSRDate
FROM 
    RankedPackages
WHERE 
    RowNum = 1 -- فقط آخرین ردیف برای هر PLId
ORDER BY 
    MSRDate DESC;
END



GO
/****** Object:  StoredProcedure [dbo].[GetAllPackages]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllPackingListNames]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllPackingListNames]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        PLId,
        PLName
    FROM 
        PackingLists
    WHERE 
        PLName IS NOT NULL
    ORDER BY 
        EnteredDate  desc;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetAllPackingLists]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllPackingListsNames]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetContractorMaterialSummary]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetContractorMaterialSummary]
    @ContractorID INT -- شناسه پیمانکار
AS
BEGIN
    SET NOCOUNT ON;

    -- گرفتن مواد دریافتی (MIV) برای پیمانکار مشخص به همراه مقادیر برگشتی (MRV)
    WITH MivData AS (
        SELECT 
            Requests.LocItemID, 
            Requests.RequestNO,
            Items.ItemId, 
            Items.Tag, 
            Items.Description, 
            Units.UnitName,
            SUM(COALESCE(Requests.DelMivQty, 0)) AS TotalDelMivQty, -- کل مقدار دریافت شده MIV
            SUM(COALESCE(Requests.ReserveMivQty, 0)) AS TotalReserveQty -- مقدار رزرو شده
        FROM 
            Requests 
        INNER JOIN
            LocItems ON Requests.LocItemID = LocItems.LocItemID 
        INNER JOIN
            Items ON LocItems.ItemId = Items.ItemId 
        INNER JOIN
            Units ON Items.UnitID = Units.UnitID
        WHERE  
            Requests.CompanyID = @ContractorID 
            AND Requests.TypeID = 1 -- فقط MIV ها (TypeID = 1)
        GROUP BY 
            Requests.LocItemID, Items.ItemId, Items.Tag, Items.Description, Units.UnitName, Requests.RequestNO
    )

    SELECT 
        m.LocItemID, 
        m.RequestNO,
        m.ItemId, 
        m.Tag, 
        m.Description, 
        m.UnitName,
        m.TotalDelMivQty, -- کل دریافتی MIV
        m.TotalReserveQty, -- مقدار رزرو شده
        SUM(COALESCE(r.DelMrvQty, 0)) AS TotalDelMrvQty, -- کل MRV های برگشتی
        (m.TotalDelMivQty - SUM(COALESCE(r.DelMrvQty, 0))) AS FinalQty  -- مقدار نهایی پس از کسر MRV
    FROM 
        MivData m
    LEFT JOIN 
        Requests r ON m.LocItemID = r.LocItemID 
                  AND m.RequestNO = r.MRCNO -- بر اساس RequestNO و LocItemID همسان‌سازی می‌شود
                  AND r.TypeID = 2  -- فقط MRV ها (TypeID = 2)
    GROUP BY 
        m.LocItemID, m.RequestNO, m.ItemId, m.Tag, m.Description, m.UnitName, m.TotalDelMivQty, m.TotalReserveQty
    --HAVING 
    --    (m.TotalDelMivQty > 0); -- فقط مواردی که دریافتی MIV دارند

END;
GO
/****** Object:  StoredProcedure [dbo].[GetInfoHmv]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetInfoHmv]
    @RequestNO varchar(100)
AS
BEGIN
    -- فعال کردن نمایش خطاها
    SET NOCOUNT ON;

    SELECT 
        ROW_NUMBER() OVER (ORDER BY Requests.RequestNO ASC) AS RowNumber, -- اضافه کردن ستون شماره ردیف
        RIGHT('000000' + Requests.RequestNO, 6) AS RequestNO, 
        Requests.HMVNO, 
		Requests.ReqLocItemID,
        Companies.CompanyName AS fromCompanyName, 
        Companies2.CompanyName AS toCompanyName,
        Items.ItemId, 
        LocItems.LocItemID, 
        PackingLists.PLName, 
        Packages.PK, 
        Items.ItemOfPk, 
        Items.Tag, 
        Items.Description, 
        Units.UnitName, 
        Requests.ReqHmvQty, 
        Requests.DelHmvQty, 
        Requests.DelHmvRejQty, 
        Scopes.ScopeName, 
        Requests.Remark AS RemarkRequests, 
        Requests.MRCNO, 
        Requests.DelDate
    FROM     
        Requests 
    INNER JOIN Companies ON Requests.CompanyID = Companies.CompanyID
    INNER JOIN Companies AS Companies2 ON Requests.CompanyID2 = Companies2.CompanyID
    INNER JOIN LocItems ON Requests.LocItemID = LocItems.LocItemID 
    INNER JOIN Items ON LocItems.ItemId = Items.ItemId 
    INNER JOIN Packages ON Items.PKID = Packages.PKID 
    INNER JOIN PackingLists ON Packages.PLId = PackingLists.PLId 
    INNER JOIN Scopes ON Items.ScopeID = Scopes.ScopeID 
    INNER JOIN Units ON Items.UnitID = Units.UnitID
    WHERE  
        (Requests.TypeID = 3) AND (Requests.RequestNO = @RequestNO)
END
GO
/****** Object:  StoredProcedure [dbo].[GetInfoMrv]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetInfoMrv]
    @RequestNO varchar(100)
AS
BEGIN
    -- فعال کردن نمایش خطاها
    SET NOCOUNT ON;

    SELECT 
        ROW_NUMBER() OVER (ORDER BY Requests.RequestNO ASC) AS RowNumber, -- اضافه کردن ستون شماره ردیف
        RIGHT('000000' + Requests.RequestNO, 6) AS RequestNO, 
        Requests.MRVNO, 
		Requests.ReqLocItemID,
        Companies.CompanyName, 
        Items.ItemId, 
        LocItems.LocItemID, 
        PackingLists.PLName, 
        Packages.PK, 
        Items.ItemOfPk, 
        Items.Tag, 
        Items.Description, 
        Units.UnitName, 
        Requests.ReqMrvQty, 
        Requests.DelMrvQty, 
        Requests.DelMrvRejQty, 
        Locations.LocationName AS LocationName, 
		LocItems.LocationID,
        Scopes.ScopeName, 
        LocItems.RemarkLocitemID, 
        Requests.Remark AS RemarkRequests, 
        Requests.PLocItemIDforMRV, 
        Requests.MRCNO, 
        Requests.DelDate, 
        LocItems.ParentLocItemID
    FROM     
        Requests 
    INNER JOIN Companies ON Requests.CompanyID = Companies.CompanyID 
    INNER JOIN LocItems ON Requests.LocItemID = LocItems.LocItemID 
    INNER JOIN Items ON LocItems.ItemId = Items.ItemId 
    INNER JOIN Locations ON LocItems.LocationID = Locations.LocationID 
    INNER JOIN Packages ON Items.PKID = Packages.PKID 
    INNER JOIN PackingLists ON Packages.PLId = PackingLists.PLId 
    INNER JOIN Scopes ON Items.ScopeID = Scopes.ScopeID 
    INNER JOIN Units ON Items.UnitID = Units.UnitID
    WHERE  
        (Requests.TypeID = 2) AND (Requests.RequestNO = @RequestNO)
END
GO
/****** Object:  StoredProcedure [dbo].[GetInspectionDetails]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetInspectionDetails]
AS
BEGIN
    SELECT 
        pl.PLId,
        pl.PLName, -- نام مرتبط از جدول PackingList
        pl.IrnId,
        irn.IRNName, -- نام مرتبط از جدول IRN
        ISNULL(i.IRN_Conflict, 0) AS IRN_Conflict, -- مقدار پیش‌فرض 0 برای NULL
        i.IVR_NO,
        i.IVR_IFR,
        i.OrderStatus,
        ISNULL(i.ThirdParty, 0) AS ThirdParty,
        ISNULL(i.OPI, 0) AS OPI,
        i.Description,
        i.IcNo,
        i.SubProject,
        ISNULL(i.Site, 0) AS Site,
        ISNULL(i.Laydown, 0) AS Laydown,
        ISNULL(i.Warehouse, 0) AS Warehouse,
        ISNULL(i.OSBL, 0) AS OSBL,
        ISNULL(i.VisualInspection, 0) AS VisualInspection,
        ISNULL(i.QuantityCheck, 0) AS QuantityCheck,
        ISNULL(i.Marking, 0) AS Marking,
        ISNULL(i.Unloading, 0) AS Unloading,
        i.IVRPDF,
        i.IFRPDF,
        i.EnteredBy,
        i.EnteredDate,
        i.EditedBy,
        i.EditedDate
    FROM 
        PackingLists pl
    LEFT JOIN 
        Inspection i ON i.PLId = pl.PLId -- اتصال به جدول Inspection (LEFT JOIN)
    LEFT JOIN 
        Irns irn ON pl.IrnId = irn.IrnId -- اتصال به جدول IRN
END

GO
/****** Object:  StoredProcedure [dbo].[GetInspectionWithEmptyMSRNO]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetInspectionWithEmptyMSRNO] 
AS
BEGIN
    SET NOCOUNT ON;

SELECT 
    PackingLists.PLId,
	PackingLists.PLName, 
    Pos.PoName, 
    Irns.IrnName,  
    PackingLists.OPINO, 
    PackingLists.Project, 
    Vendors.VendorName, 
    Suppliers.SupplierName, 
    PackingLists.NetW, 
    PackingLists.GrossW, 
    Inspection.IVR_NO, 
    Inspection.IVR_IFR, 
    Desciplines.DesciplineName, 
    Packages.MSRNO, 
    Packages.MSRDate
FROM 
    Inspection  
LEFT JOIN 
    PackingLists ON Inspection.PLId = PackingLists.PLId 
LEFT JOIN 
    Irns ON PackingLists.IrnId = Irns.IrnId
LEFT JOIN 
    Pos ON PackingLists.PoId = Pos.PoId
LEFT JOIN 
    Vendors ON PackingLists.VendorId = Vendors.VendorID
LEFT JOIN 
    Suppliers ON PackingLists.SupplierId = Suppliers.SupplierId
LEFT JOIN 
    Desciplines ON PackingLists.DesciplineId = Desciplines.DesciplineId
LEFT JOIN 
    Packages ON PackingLists.PLId = Packages.PLId
WHERE 
    -- فقط رکوردهایی که ستون‌های IVR_NO و IVR_IFR پر هستند
    Inspection.IVR_NO IS NOT NULL 
    AND Inspection.IVR_NO <> ''
    AND Inspection.IVR_IFR IS NOT NULL 
    AND Inspection.IVR_IFR <> ''
    -- و ستون MSRNO خالی است
    AND (Packages.MSRNO IS NULL OR Packages.MSRNO = '')
GROUP BY 
    Pos.PoName, 
    Irns.IrnName, 
    PackingLists.PLId, 
    PackingLists.PLName, 
    PackingLists.OPINO, 
    PackingLists.Project, 
    Vendors.VendorName, 
    Suppliers.SupplierName, 
    PackingLists.NetW, 
    PackingLists.GrossW, 
    Inspection.IVR_NO, 
    Inspection.IVR_IFR, 
    Desciplines.DesciplineName, 
    Packages.MSRNO, 
    Packages.MSRDate;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetInspectionWithEmptyMSRNO2025]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetInspectionWithEmptyMSRNO2025] 
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        PackingLists.PLId,
        PackingLists.PLName, 
        Pos.PoName, 
        Irns.IrnName,  
        PackingLists.OPINO, 
        PackingLists.Project, 
        Vendors.VendorName, 
        Suppliers.SupplierName, 
        PackingLists.NetW, 
        PackingLists.GrossW, 
        Inspection.IVR_NO, 
        Inspection.IVR_IFR, 
        Desciplines.DesciplineName, 
        Packages.MSRNO, 
        Packages.MSRDate
    FROM 
        Inspection  
    LEFT JOIN 
        PackingLists ON Inspection.PLId = PackingLists.PLId 
    LEFT JOIN 
        Irns ON PackingLists.IrnId = Irns.IrnId
    LEFT JOIN 
        Pos ON PackingLists.PoId = Pos.PoId
    LEFT JOIN 
        Vendors ON PackingLists.VendorId = Vendors.VendorID
    LEFT JOIN 
        Suppliers ON PackingLists.SupplierId = Suppliers.SupplierId
    LEFT JOIN 
        Desciplines ON PackingLists.DesciplineId = Desciplines.DesciplineId
    LEFT JOIN 
        Packages ON PackingLists.PLId = Packages.PLId
    WHERE 
        -- فقط رکوردهایی که ستون‌های IVR_NO و IVR_IFR پر هستند
        Inspection.IVR_NO IS NOT NULL 
        AND Inspection.IVR_NO <> ''
        AND Inspection.IVR_IFR IS NOT NULL 
        AND Inspection.IVR_IFR <> ''
        -- و هیچ‌کدام از رکوردهای مرتبط با PLId در جدول Packages MSRNO نداشته باشند
        AND NOT EXISTS (
            SELECT 1 
            FROM Packages p
            WHERE p.PLId = PackingLists.PLId
              AND p.MSRNO IS NOT NULL 
              AND p.MSRNO <> ''
        )
    GROUP BY 
        Pos.PoName, 
        Irns.IrnName, 
        PackingLists.PLId, 
        PackingLists.PLName, 
        PackingLists.OPINO, 
        PackingLists.Project, 
        Vendors.VendorName, 
        Suppliers.SupplierName, 
        PackingLists.NetW, 
        PackingLists.GrossW, 
        Inspection.IVR_NO, 
        Inspection.IVR_IFR, 
        Desciplines.DesciplineName, 
        Packages.MSRNO, 
        Packages.MSRDate;
END;

GO
/****** Object:  StoredProcedure [dbo].[GetInspectionWithMSRNO2025]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetInspectionWithMSRNO2025] 
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        PackingLists.PLId,
        PackingLists.PLName, 
        Pos.PoName, 
        Irns.IrnName,  
        PackingLists.OPINO, 
        PackingLists.Project, 
        Vendors.VendorName, 
        Suppliers.SupplierName, 
        PackingLists.NetW, 
        PackingLists.GrossW, 
        Inspection.IVR_NO, 
        Inspection.IVR_IFR, 
        Desciplines.DesciplineName, 
        Packages.MSRNO, 
        Packages.MSRDate,
		Packages.MSREnteredBy,
		Packages.MSRRev,
		Packages.MSRRevDate,
		Packages.MSRRevEnteredBy,
		Packages.MSRStatus
    FROM 
        Inspection  
    LEFT JOIN 
        PackingLists ON Inspection.PLId = PackingLists.PLId 
    LEFT JOIN 
        Irns ON PackingLists.IrnId = Irns.IrnId
    LEFT JOIN 
        Pos ON PackingLists.PoId = Pos.PoId
    LEFT JOIN 
        Vendors ON PackingLists.VendorId = Vendors.VendorID
    LEFT JOIN 
        Suppliers ON PackingLists.SupplierId = Suppliers.SupplierId
    LEFT JOIN 
        Desciplines ON PackingLists.DesciplineId = Desciplines.DesciplineId
    LEFT JOIN 
        Packages ON PackingLists.PLId = Packages.PLId
    WHERE 
        -- فقط رکوردهایی که ستون‌های IVR_NO و IVR_IFR پر هستند
        Inspection.IVR_NO IS NOT NULL 
        AND Inspection.IVR_NO <> ''
        AND Inspection.IVR_IFR IS NOT NULL 
        AND Inspection.IVR_IFR <> ''
        -- و فقط رکوردهایی که حداقل یکی از MSRNO ها پر هستند (یعنی در جدول Packages MSRNO وجود دارد)
        AND EXISTS (
            SELECT 1 
            FROM Packages p
            WHERE p.PLId = PackingLists.PLId
              AND p.MSRNO IS NOT NULL 
              AND p.MSRNO <> ''
        )
    GROUP BY 
        Pos.PoName, 
        Irns.IrnName, 
        PackingLists.PLId, 
        PackingLists.PLName, 
        PackingLists.OPINO, 
        PackingLists.Project, 
        Vendors.VendorName, 
        Suppliers.SupplierName, 
        PackingLists.NetW, 
        PackingLists.GrossW, 
        Inspection.IVR_NO, 
        Inspection.IVR_IFR, 
        Desciplines.DesciplineName, 
        Packages.MSRNO, 
        Packages.MSRDate,
		Packages.MSREnteredBy,
		Packages.MSRRev,
		Packages.MSRRevDate,
		Packages.MSRRevEnteredBy,
		Packages.MSRStatus
END;
GO
/****** Object:  StoredProcedure [dbo].[GetLastArchiveNo]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetLastPackage]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetLastPKID]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetLatestRequestNoByTypeId]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetLocItemById]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetLocItemOFSelectedItemID_FOR_ISSUE_VOUCHER]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetLocItemOFSelectedItemID_FOR_ISSUE_VOUCHER]
    @ItemIds VARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    -- Filter LocItemID related to selected ItemId only
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
        WHERE li.ItemId IN (SELECT value FROM STRING_SPLIT(@ItemIds, ','))
        GROUP BY 
            li.LocItemID
    )
    SELECT 
        Items.ItemId,
        li.LocItemID,
        Items.Tag,
        Items.Description,
        li.Qty AS QtyInLoc,  -- Each LocItemID will have its own QtyInLoc
        li.Qty 
            - ISNULL(rd.TotalReserveMivQty, 0) 
            - ISNULL(rd.TotalDelMivQty, 0) 
            - ISNULL(li.NISQty, 0) 
            - ISNULL(li.RejectQty, 0) 
            + ISNULL(rd.TotalReturnAcceptQty, 0) AS Balance, -- Calculate Balance per LocItemID
        pl.PLName AS PL,          -- Add PL field
        pl.Project as Project,
		p.PK AS PK,              -- Add PK field
        --pl.DesciplineId AS Discipline, -- Add Discipline field
        d.DesciplineName AS Discipline, -- Add DesciplineName from Disciplines table
        Items.BatchNo AS BatchNo,   -- Add BatchNo field from Items
        Items.HeatNo AS HeatNo,     -- Add HeatNo field from Items
		Items.Remark AS Remark,
        loc.LocationName AS Location, -- Add Location field
        Units.UnitName AS Units,        -- Add Unit field from Items
        --Items.ScopeID AS Scope,      -- Add Scope field from Items
        sc.ScopeName AS Scope,   -- Add ScopeName from Scope table
        po.PoName AS Po         -- Add PoName field from Po table
    FROM 
        LocItems AS li
    INNER JOIN Items ON li.ItemId = Items.ItemId
	INNER JOIN Units ON Items.UnitID = Units.UnitID
    LEFT JOIN CTE_RequestData AS rd ON li.LocItemID = rd.LocItemID
    INNER JOIN Packages AS p ON p.PKID = Items.PKID
    INNER JOIN PackingLists AS pl ON p.PLId = pl.PLId
    INNER JOIN Locations AS loc ON li.LocationID = loc.LocationID
    LEFT JOIN Pos AS po ON pl.PoId = po.PoId  -- Join with Po table based on PoId
    LEFT JOIN Desciplines AS d ON pl.DesciplineId = d.DesciplineId  -- Join with Disciplines table
    LEFT JOIN Scopes AS sc ON Items.ScopeID = sc.ScopeID  -- Join with Scope table based on ScopeID
    WHERE Items.ItemId IN (SELECT value FROM STRING_SPLIT(@ItemIds, ','))
    AND (li.Qty - ISNULL(rd.TotalReserveMivQty, 0) 
                  - ISNULL(rd.TotalDelMivQty, 0) 
                  - ISNULL(li.NISQty, 0) 
                  - ISNULL(li.RejectQty, 0) 
                  + ISNULL(rd.TotalReturnAcceptQty, 0)) > 0
    ORDER BY Items.ItemId, li.LocItemID;
END

GO
/****** Object:  StoredProcedure [dbo].[GetLocItemOFSelectedItemID_FOR_ISSUE_VOUCHER2]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLocItemOFSelectedItemID_FOR_ISSUE_VOUCHER2]
    @ItemIds VARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    -- Filter LocItemID related to selected ItemId only
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
        WHERE li.ItemId IN (SELECT value FROM STRING_SPLIT(@ItemIds, ','))
        GROUP BY 
            li.LocItemID
    )
    SELECT 
        Items.ItemId,
        li.LocItemID,
        Items.Tag,
        Items.Description,
        li.Qty AS QtyInLoc,  -- Each LocItemID will have its own QtyInLoc
        li.Qty 
            - ISNULL(rd.TotalReserveMivQty, 0) 
            - ISNULL(rd.TotalDelMivQty, 0) 
            - ISNULL(li.NISQty, 0) 
            - ISNULL(li.RejectQty, 0) 
            - ISNULL(rd.TotalReturnAcceptQty, 0) AS Balance, -- Calculate Balance per LocItemID
        pl.PLName AS PL,          -- Add PL field
        pl.Project as Project,
		p.PK AS PK,              -- Add PK field
        --pl.DesciplineId AS Discipline, -- Add Discipline field
        d.DesciplineName AS Discipline, -- Add DesciplineName from Disciplines table
        Items.BatchNo AS BatchNo,   -- Add BatchNo field from Items
        Items.HeatNo AS HeatNo,     -- Add HeatNo field from Items
		Items.Remark AS Remark,
        loc.LocationName AS Location, -- Add Location field
        Units.UnitName AS Units,        -- Add Unit field from Items
        --Items.ScopeID AS Scope,      -- Add Scope field from Items
        sc.ScopeName AS Scope,   -- Add ScopeName from Scope table
        po.PoName AS Po         -- Add PoName field from Po table
    FROM 
        LocItems AS li
    INNER JOIN Items ON li.ItemId = Items.ItemId
	INNER JOIN Units ON Items.UnitID = Units.UnitID
    LEFT JOIN CTE_RequestData AS rd ON li.LocItemID = rd.LocItemID
    INNER JOIN Packages AS p ON p.PKID = Items.PKID
    INNER JOIN PackingLists AS pl ON p.PLId = pl.PLId
    INNER JOIN Locations AS loc ON li.LocationID = loc.LocationID
    LEFT JOIN Pos AS po ON pl.PoId = po.PoId  -- Join with Po table based on PoId
    LEFT JOIN Desciplines AS d ON pl.DesciplineId = d.DesciplineId  -- Join with Disciplines table
    LEFT JOIN Scopes AS sc ON Items.ScopeID = sc.ScopeID  -- Join with Scope table based on ScopeID
    WHERE Items.ItemId IN (SELECT value FROM STRING_SPLIT(@ItemIds, ','))
    AND (li.Qty   - ISNULL(rd.TotalReserveMivQty, 0) 
                  - ISNULL(rd.TotalDelMivQty, 0) 
                  - ISNULL(li.NISQty, 0) 
                  - ISNULL(li.RejectQty, 0) 
                  - ISNULL(rd.TotalReturnAcceptQty, 0)) > 0
    ORDER BY Items.ItemId, li.LocItemID;
END

GO
/****** Object:  StoredProcedure [dbo].[GetLocItemsByItemId]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetMivDataByRequestNO]    Script Date: 4/10/2025 3:45:05 PM ******/
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
	    items.ItemId,
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
/****** Object:  StoredProcedure [dbo].[GetMivDataByRequestNO_REAR]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetMivDataByRequestNO_REAR]
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
        -- جمع کردن ReqMivQty برای هر LocItemID که مربوط به یک ItemID است
        SUM(Requests.ReqMivQty) AS ReqMivQty,
		SUM(Requests.ReserveMivQty) AS ReserveMivQty,
        Items.Remark,
		Locations.LocationName,
		USERS.Username
    FROM 
        LocItems 
        INNER JOIN Items ON LocItems.ItemId = Items.ItemId 
        INNER JOIN Packages ON Items.PKID = Packages.PKID 
        INNER JOIN PackingLists ON Packages.PLId = PackingLists.PLId 
        INNER JOIN Requests ON LocItems.LocItemID = Requests.LocItemID 
        INNER JOIN Units ON Items.UnitID = Units.UnitID 
        INNER JOIN Companies ON Requests.CompanyID = Companies.CompanyID
		INNER JOIN Locations ON Locations.LocationID=LocItems.LocationID
		INNER JOIN ApplicationUser AS USERS ON USERS.UserID = Requests.IssuedBy
    WHERE 
        Requests.TypeID = 1 
        AND Requests.RequestNO = @MivNumber
    GROUP BY 
	    items.ItemId,
		LocItems.LocItemID,
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
        Items.Remark,
	    USERS.Username,
	    Locations.LocationName
END

GO
/****** Object:  StoredProcedure [dbo].[GetMRCDetailDetails]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetMRCDetailDetails]
    @MrcName NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;
	   SELECT 
        m.MrcId,
        c.CompanyName AS ToCompany, -- Replace 'CompanyName' with the actual column for company name
        m.MrcName,
        m.MrcDescription,
        m.PK,
        m.ItemOfPk,
        m.Tag,
        m.Description,
        u.UnitName AS Unit, -- Replace 'UnitName' with the actual column for unit name
        m.Qty,
        m.Size1,
        m.Size2,
        m.BatchNo,
        m.DocNo,
        m.Remark,
        e1.UserName AS EnteredBy, -- Replace 'UserName' with the actual column for user name
        m.EnteredDate,
        e2.UserName AS EditedBy, -- Replace 'UserName' with the actual column for user name
        m.EditedDate
    FROM 
        Mrcs m
    LEFT JOIN 
        Companies c ON m.ToCompanyID = c.CompanyID -- Replace 'CompanyID' with the actual column for the company's ID
    LEFT JOIN 
        Units u ON m.UnitID = u.UnitID -- Replace 'UnitID' with the actual column for the unit's ID
    LEFT JOIN 
        ApplicationUser e1 ON m.EnteredBy = e1.UserID -- Replace 'UserID' with the actual column for the user ID
    LEFT JOIN 
        ApplicationUser e2 ON m.EditedBy = e2.UserID -- Replace 'UserID' with the actual column for the user ID
    WHERE 
        m.MrcName = @MrcName;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetMRCReqCompany]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetMRCReqCompany]
    @MrcName NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT DISTINCT
        c.CompanyName
    FROM 
        Mrcs m
    INNER JOIN 
        Companies c ON m.ToCompanyID = c.CompanyID
    WHERE 
        m.MrcName = @MrcName;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetMsrDetailDetailsByPLId]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetMsrDetailDetailsByPLId]
    @PLId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        PackingLists.PLId, 
        Packages.PK, 
        Items.ItemOfPk, 
        Items.Tag, 
        ISNULL(Items.Description, '') AS Description, 
        Units.UnitName, 
        SUM(ISNULL(Items.Qty, 0.0)) AS Qty, 
        SUM(ISNULL(Items.Qty, 0.0) + ISNULL(Items.OverQty, 0.0) - ISNULL(Items.ShortageQty, 0.0)) AS QtyRec, 
        SUM(ISNULL(Items.OverQty, 0.0)) AS OverQty, 
        SUM(ISNULL(Items.ShortageQty, 0.0)) AS ShortageQty, 
        SUM(ISNULL(Items.DamageQty, 0.0)) AS DamageQty, 
        SUM(ISNULL(LocItems.RejectQty, 0.0)) AS RejectQty, 
        SUM(ISNULL(Items.NetW, 0.0)) AS NetW, 
        SUM(ISNULL(Items.GrossW, 0.0)) AS GrossW, 
        Locations.LocationName, 
        ISNULL(Items.Remark, '') AS Remark, 
        Scopes.ScopeName
    FROM 
        PackingLists
        LEFT OUTER JOIN Packages ON PackingLists.PLId = Packages.PLId
        LEFT OUTER JOIN Items ON Items.PKID = Packages.PKID
        LEFT OUTER JOIN LocItems ON Items.ItemId = LocItems.ItemId
        LEFT OUTER JOIN Locations ON LocItems.LocationID = Locations.LocationID
        LEFT OUTER JOIN Units ON Items.UnitID = Units.UnitID
        LEFT OUTER JOIN Scopes ON Items.ScopeID = Scopes.ScopeID
    WHERE  
        PackingLists.PLId = @PLId
    GROUP BY 
        PackingLists.PLId, 
        Packages.PK, 
        Items.ItemOfPk, 
        Items.Tag, 
        Items.Description, 
        Units.UnitName, 
        Locations.LocationName, 
        Items.Remark, 
        Scopes.ScopeName
    ORDER BY 
        Items.ItemOfPk;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetMsrHeaderDetailsByPLId]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetMsrHeaderDetailsByPLId]
    @PLId INT
AS
BEGIN
    SET NOCOUNT ON;

    WITH CTE_Packages AS
    (
        SELECT 
            Packages.PKID,
			Packages.PLId,
            Packages.MSRNO, 
            Packages.MSRDate, 
            Packages.MSRRev,
            ROW_NUMBER() OVER (PARTITION BY Packages.PLId ORDER BY Packages.MSRDate DESC) AS RowNum
        FROM 
            Packages
    )
    SELECT 
        PackingLists.PLId, 
        PackingLists.PLName, 
        PackingLists.MARDate, 
        Vendors.VendorName, 
        Irns.IrnName, 
        Suppliers.SupplierName, 
        Pos.PoName, 
        Inspection.IVR_NO, 
        CTE_Packages.MSRNO, 
        CTE_Packages.MSRDate, 
        CTE_Packages.MSRRev
    FROM 
        PackingLists
        LEFT JOIN Inspection 
            ON PackingLists.PLId = Inspection.PLId
        LEFT JOIN CTE_Packages 
            ON PackingLists.PLId = CTE_Packages.PLId AND CTE_Packages.RowNum = 1
        LEFT JOIN Pos 
            ON Pos.PoId = PackingLists.PoId
        LEFT JOIN Suppliers 
            ON PackingLists.SupplierId = Suppliers.SupplierId
        LEFT JOIN Vendors 
            ON PackingLists.VendorId = Vendors.VendorID
        LEFT JOIN Irns 
            ON PackingLists.IrnId = Irns.IrnId
    WHERE 
        PackingLists.PLId = @PLId;
END;

GO
/****** Object:  StoredProcedure [dbo].[GetPackageById]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetPackageByPK]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetPackageCount]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetPackageId]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetPackagePKByPKID]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetPackagesByPLId]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetPackingListById]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetPackingListByPlName]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetPackingListDetailDetailsByPLId]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetPackingListDetailDetailsByPLId]
    @PLId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        ISNULL(Packages.PK, 0) AS PK,
        ISNULL(Items.ItemOfPk, 0) AS ItemOfPk,
        ISNULL( Items.Tag, '') AS Tag,
		ISNULL( Items.Description, '') AS Description,
        ISNULL(Units.UnitName, '') AS UnitName,
        ISNULL(Items.Qty, 0) AS Qty,
        ISNULL(Items.OverQty, 0) AS OverQty,
        ISNULL(Items.ShortageQty, 0) AS ShortageQty,
        ISNULL(Items.Qty, 0) - ISNULL(Items.OverQty, 0) - ISNULL(Items.ShortageQty, 0) AS MaterialRec,
        ISNULL(Items.DamageQty, 0) AS DamageQty,
        ISNULL(Scopes.ScopeName, '') AS ScopeName,
        Items.BatchNo,
        ISNULL(Items.NetW, 0) AS ItemNetW,
        ISNULL(Items.GrossW, 0) AS ItemGrossW,
        ISNULL(Items.Price, 0) AS Price,
        ISNULL(Items.BaseMaterial, '') AS BaseMaterial,
        ISNULL(Locations.LocationName, '') AS LocationName
    FROM 
        PackingLists 
    LEFT JOIN 
        Packages ON PackingLists.PLId = Packages.PLId 
    LEFT JOIN 
        Items ON Packages.PKID = Items.PKID 
    LEFT JOIN 
        LocItems ON Items.ItemId = LocItems.ItemId 
    LEFT JOIN 
        Locations ON LocItems.LocationID = Locations.LocationID 
    LEFT JOIN 
        Scopes ON Items.ScopeID = Scopes.ScopeID 
    LEFT JOIN 
        Units ON Items.UnitID = Units.UnitID 
    WHERE 
        PackingLists.PLId = @PLId;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetPackingListDetails]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPackingListDetails]
    @PLId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        --Packages.PLId, 
        --LocItems.LocItemID, 
        Items.ItemId, 
        Items.Tag, 
        Items.Description, 
        Units.UnitName
    FROM 
        Packages
        inner JOIN Items ON Items.PKID = Packages.PKID
        --inner JOIN LocItems ON Items.ItemId = LocItems.ItemId
        inner JOIN Units ON Items.UnitID = Units.UnitID
    WHERE 
        Packages.PLId = @PLId;
END;

GO
/****** Object:  StoredProcedure [dbo].[GetPackingListDetailsByPLId]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPackingListDetailsByPLId]
    @PLId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        PackingLists.PLId,
        PackingLists.PLName,
        PackingLists.ArchiveNO,
        PackingLists.OPINO,
        PackingLists.NetW,
        PackingLists.GrossW,
        PackingLists.MARDate,
        Desciplines.DesciplineName,
        ApplicationUser.Username,
        Packages.PK,
        Items.ItemOfPk,
        Items.Tag,
        Items.Description,
        Units.UnitName,
        Items.Qty,
        Items.OverQty,
        Items.ShortageQty,
        Items.DamageQty,
        Scopes.ScopeName,
        Items.BatchNo,
        Items.NetW AS ItemNetW,
        Items.GrossW AS ItemGrossW,
        Items.Price,
        Items.BaseMaterial,
        Mrs.MrName,
        Vendors.VendorName,
        AreaUnits.AreaUnitName,
        Irns.IrnName,
        Suppliers.SupplierName,
        Locations.LocationName
    FROM 
        PackingLists 
    LEFT JOIN 
        Packages ON PackingLists.PLId = Packages.PLId 
    LEFT JOIN 
        Items ON Packages.PKID = Items.PKID 
    LEFT JOIN 
        LocItems ON Items.ItemId = LocItems.ItemId 
    LEFT JOIN 
        Locations ON LocItems.LocationID = Locations.LocationID 
	left JOIN 
        Desciplines ON PackingLists.DesciplineId = Desciplines.DesciplineId 
    left JOIN 
        Mrs ON PackingLists.MrId = Mrs.MrId 
    left JOIN 
        Pos ON PackingLists.PoId = Pos.PoId AND Mrs.MrId = Pos.MrId 
    left JOIN 
        Scopes ON Items.ScopeID = Scopes.ScopeID 
    left JOIN 
        Suppliers ON PackingLists.SupplierId = Suppliers.SupplierId 
    left JOIN 
        Units ON Items.UnitID = Units.UnitID 
    left JOIN 
        Vendors ON PackingLists.VendorId = Vendors.VendorID 
    left JOIN 
        Irns ON PackingLists.IrnId = Irns.IrnId 
    left JOIN 
        AreaUnits ON PackingLists.AreaUnitID = AreaUnits.AreaUnitID 
    left JOIN 
        ApplicationUser ON PackingLists.EnteredBy = ApplicationUser.UserID 
    WHERE 
        PackingLists.PLId = @PLId;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetPackingListDetailsByPLId2]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPackingListDetailsByPLId2]
    @PLId INT
AS
BEGIN
    SET NOCOUNT ON;
	Print @PLId
    ---- جدول موقت برای PackingLists
    --CREATE TABLE #TempPackingLists (
    --    PLId INT,
    --    PLName NVARCHAR(255),
    --    ArchiveNO NVARCHAR(255),
    --    OPINO NVARCHAR(255),
    --    NetW FLOAT,
    --    GrossW FLOAT,
    --    EnteredBy INT,
    --    MARDate DATETIME,
    --    DesciplineId INT,
    --    VendorId INT,
    --    SupplierId INT,
    --    AreaUnitID INT
    --);

    ---- وارد کردن داده به جدول موقت PackingLists
    --INSERT INTO #TempPackingLists
    --SELECT 
    --    PLId,
    --    PLName,
    --    ArchiveNO,
    --    OPINO,
    --    NetW,
    --    GrossW,
    --    EnteredBy,
    --    MARDate,
    --    DesciplineId,
    --    VendorId,
    --    SupplierId,
    --    AreaUnitID
    --FROM 
    --    PackingLists
    --WHERE 
    --    PLId = @PLId;

    ---- جدول موقت برای Desciplines
    --CREATE TABLE #TempDesciplines (
    --    PLId INT,
    --    PLName NVARCHAR(255),
    --    DesciplineName NVARCHAR(255)
    --);

    ---- وارد کردن داده به جدول موقت Desciplines
    --INSERT INTO #TempDesciplines
    --SELECT 
    --    TPL.PLId,
    --    TPL.PLName,
    --    D.DesciplineName
    --FROM 
    --    #TempPackingLists TPL
    --INNER JOIN 
    --    Desciplines D ON TPL.DesciplineId = D.DesciplineId;

    ---- جدول موقت برای Items
    --CREATE TABLE #TempItems (
    --    PLId INT,
    --    PLName NVARCHAR(255),
    --    DesciplineName NVARCHAR(255),
    --    VendorName NVARCHAR(255),
    --    ItemOfPk NVARCHAR(255),
    --    Tag NVARCHAR(255),
    --    Description NVARCHAR(255),
    --    UnitName NVARCHAR(255),
    --    Qty FLOAT,
    --    OverQty FLOAT,
    --    ShortageQty FLOAT,
    --    DamageQty FLOAT,
    --    BatchNo NVARCHAR(255),
    --    ItemNetW FLOAT,
    --    ItemGrossW FLOAT,
    --    Price FLOAT,
    --    BaseMaterial NVARCHAR(255),
    --    ScopeName NVARCHAR(255),
    --    LocationName NVARCHAR(255)
    --);

    ---- وارد کردن داده به جدول موقت Items
    --INSERT INTO #TempItems
    --SELECT 
    --    TD.PLId,
    --    TD.PLName,
    --    TD.DesciplineName,
    --    V.VendorName,
    --    I.ItemOfPk,
    --    I.Tag,
    --    I.Description,
    --    U.UnitName,
    --    I.Qty,
    --    I.OverQty,
    --    I.ShortageQty,
    --    I.DamageQty,
    --    I.BatchNo,
    --    I.NetW AS ItemNetW,
    --    I.GrossW AS ItemGrossW,
    --    I.Price,
    --    I.BaseMaterial,
    --    S.ScopeName,
    --    L.LocationName
    --FROM 
    --    #TempDesciplines TD
    --INNER JOIN 
    --    Vendors V ON TD.PLId = V.VendorID
    --INNER JOIN 
    --    Packages P ON TD.PLId = P.PLId
    --INNER JOIN 
    --    Items I ON P.PKID = I.PKID
    --INNER JOIN 
    --    LocItems LI ON I.ItemId = LI.ItemId
    --INNER JOIN 
    --    Locations L ON LI.LocationID = L.LocationID
    --INNER JOIN 
    --    Scopes S ON I.ScopeID = S.ScopeID
    --INNER JOIN 
    --    Units U ON I.UnitID = U.UnitID;

    ---- استخراج نتایج نهایی
    --SELECT 
    --    *
    --FROM 
    --    #TempItems;

    ---- حذف جداول موقت
    --DROP TABLE #TempPackingLists;
    --DROP TABLE #TempDesciplines;
    --DROP TABLE #TempItems;
END;

GO
/****** Object:  StoredProcedure [dbo].[GetPackingListHeaderDetailsByPLId]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPackingListHeaderDetailsByPLId]
    @PLId INT
AS
BEGIN
    SET NOCOUNT ON;

  SELECT 
    PackingLists.PLId,
    PackingLists.PLName,
    PackingLists.ArchiveNO,
    PackingLists.OPINO,
    PackingLists.NetW,
    PackingLists.GrossW,
    PackingLists.MARDate,
    Desciplines.DesciplineName,
    ApplicationUser.Username,
    Mrs.MrName,
    Vendors.VendorName,
    AreaUnits.AreaUnitName,
    Irns.IrnName,
    Suppliers.SupplierName,
    Pos.PoName
FROM 
    PackingLists 
LEFT JOIN 
    Packages ON PackingLists.PLId = Packages.PLId 
LEFT JOIN 
    Items ON Packages.PKID = Items.PKID 
LEFT JOIN 
    LocItems ON Items.ItemId = LocItems.ItemId 
LEFT JOIN 
    Locations ON LocItems.LocationID = Locations.LocationID 
LEFT JOIN 
    Desciplines ON PackingLists.DesciplineId = Desciplines.DesciplineId 
LEFT JOIN 
    Mrs ON PackingLists.MrId = Mrs.MrId 
LEFT JOIN 
    Pos ON PackingLists.PoId = Pos.PoId AND Mrs.MrId = Pos.MrId 
LEFT JOIN 
    Scopes ON Items.ScopeID = Scopes.ScopeID 
LEFT JOIN 
    Suppliers ON PackingLists.SupplierId = Suppliers.SupplierId 
LEFT JOIN 
    Units ON Items.UnitID = Units.UnitID 
LEFT JOIN 
    Vendors ON PackingLists.VendorId = Vendors.VendorID 
LEFT JOIN 
    Irns ON PackingLists.IrnId = Irns.IrnId 
LEFT JOIN 
    AreaUnits ON PackingLists.AreaUnitID = AreaUnits.AreaUnitID 
LEFT JOIN 
    ApplicationUser ON PackingLists.EnteredBy = ApplicationUser.UserID 
WHERE 
    PackingLists.PLId = @PLId
GROUP BY
    PackingLists.PLId,
    PackingLists.PLName,
    PackingLists.ArchiveNO,
    PackingLists.OPINO,
    PackingLists.NetW,
    PackingLists.GrossW,
    PackingLists.MARDate,
    Desciplines.DesciplineName,
    ApplicationUser.Username,
    Mrs.MrName,
    Vendors.VendorName,
    AreaUnits.AreaUnitName,
    Irns.IrnName,
    Suppliers.SupplierName,
    Pos.PoName;

END;
GO
/****** Object:  StoredProcedure [dbo].[GetPackingListsWithoutPackages]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetTotalIssueRecordCount]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetTotalItemsRecordCount]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertMRVBatch]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertMRVBatch]
    @CompanyID INT,
    @ContractId INT,
    @MRVNO NVARCHAR(50),
    @AreaUnitID INT,
    @IssuedBy INT,
    @DelDate DATETIME,
    @RequestMrvs dbo.NewMRVDtoType READONLY
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Check for duplicate MRVNO and CompanyID
    IF EXISTS (SELECT 1 FROM Requests WHERE MRVNO = @MRVNO AND CompanyID = @CompanyID)
    BEGIN
        -- Return error message if duplicate
        RAISERROR('Duplicate MRV number for the specified company.', 16, 1);
        RETURN;
    END

    DECLARE @NextMRVNumber INT;

    BEGIN TRANSACTION;

    -- Get the last MRV number and start from 1 if no MRV exists
    SELECT TOP 1 @NextMRVNumber = TRY_CAST(RequestNo AS INT) + 1
    FROM Requests
    WHERE TypeId = 2 AND TRY_CAST(RequestNo AS INT) IS NOT NULL
    ORDER BY TRY_CAST(RequestNo AS INT) DESC;

    -- If NULL, start from 1
    IF @NextMRVNumber IS NULL
        SET @NextMRVNumber = 1;

    -- Insert requests with TypeId = 2 and increment MRV numbers
    INSERT INTO Requests (CompanyID, ContractId, MRVNO, AreaUnitID, ReqMrvQty, DelMrvQty, LocItemID,DelMrvRejQty,Remark,RequestNO, TypeId, IssuedBy, DelDate)
    SELECT 
        @CompanyID,
        @ContractId,
        @MRVNO,
        @AreaUnitID,
        ReqMrvQty,
        DelMrvQty,
        LocItemID,
		DelMrvRejQty,
		Remark,
        FORMAT(@NextMRVNumber, 'D6'),
        2,  -- Set TypeId to 2
        @IssuedBy,
        @DelDate
    FROM @RequestMrvs;

    COMMIT TRANSACTION;

    -- Return the new MRV numbers
    SELECT DISTINCT FORMAT(@NextMRVNumber, 'D6') AS NewMRVNumber
    FROM @RequestMrvs;

END
GO
/****** Object:  StoredProcedure [dbo].[InsertMRVBatch2]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertMRVBatch2]
    @CompanyID INT,
    @ContractId INT,
    @MRVNO NVARCHAR(50),
    @AreaUnitID INT,
    @IssuedBy INT,
    @DelDate DATETIME,
    @RequestMrvs dbo.NewMRVDtoType READONLY
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Check for duplicate MRVNO and CompanyID
    IF EXISTS (SELECT 1 FROM Requests WHERE MRVNO = @MRVNO AND CompanyID = @CompanyID)
    BEGIN
        -- Return error message if duplicate
        RAISERROR('Duplicate MRV number for the specified company.', 16, 1);
        RETURN;
    END

    DECLARE @NextMRVNumber INT;
    DECLARE @LocItemTVP dbo.IntLocItemsList;  -- TVP برای LocItemIDs
    DECLARE @LocItemID INT;
    DECLARE @NewLocationId INT;

    BEGIN TRANSACTION;

    -- Get the last MRV number and start from 1 if no MRV exists
    SELECT TOP 1 @NextMRVNumber = TRY_CAST(RequestNo AS INT) + 1
    FROM Requests
    WHERE TypeId = 2 AND TRY_CAST(RequestNo AS INT) IS NOT NULL
    ORDER BY TRY_CAST(RequestNo AS INT) DESC;

    -- If NULL, start from 1
    IF @NextMRVNumber IS NULL
        SET @NextMRVNumber = 1;

    -- Insert requests with TypeId = 2 and increment MRV numbers
    INSERT INTO Requests (CompanyID, ContractId, MRVNO, AreaUnitID, ReqMrvQty, DelMrvQty, LocItemID, DelMrvRejQty, Remark, RequestNO, TypeId, IssuedBy, DelDate)
    SELECT 
        @CompanyID,
        @ContractId,
        @MRVNO,
        @AreaUnitID,
        ReqMrvQty,
        DelMrvQty,
        LocItemID,
        DelMrvRejQty,
        Remark,
        FORMAT(@NextMRVNumber, 'D6'),
        2,  -- Set TypeId to 2
        @IssuedBy,
        @DelDate
    FROM @RequestMrvs;

    -- Iterate through the rows in @RequestMrvs and update locations
    DECLARE cur CURSOR FOR 
    SELECT LocItemID, ISNULL(SelectedLocation, 0) AS SelectedLocation
    FROM @RequestMrvs;

    OPEN cur;

    FETCH NEXT FROM cur INTO @LocItemID, @NewLocationId;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        IF @NewLocationId != 0
        BEGIN
            -- Clear the TVP table variable before inserting
            DELETE FROM @LocItemTVP;
            
            -- Insert the LocItemID into the TVP
            INSERT INTO @LocItemTVP (Value)
            VALUES (@LocItemID);
            
            -- Call the spUpdateLocItemsLocation procedure
            EXEC dbo.spUpdateLocItemsLocation @LocItemIds = @LocItemTVP, @NewLocationId = @NewLocationId;
        END
        FETCH NEXT FROM cur INTO @LocItemID, @NewLocationId;
    END

    CLOSE cur;
    DEALLOCATE cur;

    COMMIT TRANSACTION;

    -- Return the new MRV numbers
    SELECT DISTINCT FORMAT(@NextMRVNumber, 'D6') AS NewMRVNumber
    FROM @RequestMrvs;

END;
GO
/****** Object:  StoredProcedure [dbo].[InsertMRVBatch3]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertMRVBatch3]
    @CompanyID INT,
    @ContractId INT,
    @MRVNO NVARCHAR(50),
    @AreaUnitID INT,
    @IssuedBy INT,
    @DelDate DATETIME,
    @RequestMrvs dbo.NewMRVDtoType READONLY
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Check for duplicate MRVNO and CompanyID
    IF EXISTS (SELECT 1 FROM Requests WHERE MRVNO = @MRVNO AND CompanyID = @CompanyID)
    BEGIN
        RAISERROR('Duplicate MRV number for the specified company.', 16, 1);
        RETURN;
    END

    DECLARE @NextMRVNumber INT;
    DECLARE @LocItemID INT;
    DECLARE @SelectedLocation INT;
    DECLARE @Qty DECIMAL(18, 2);
    DECLARE @CurrentBalance DECIMAL(18, 2);
    DECLARE @ItemId INT; -- Added to store ItemId

    BEGIN TRANSACTION;

    -- Get the last MRV number and start from 1 if no MRV exists
    SELECT TOP 1 @NextMRVNumber = TRY_CAST(RequestNo AS INT) + 1
    FROM Requests
    WHERE TypeId = 2 AND TRY_CAST(RequestNo AS INT) IS NOT NULL
    ORDER BY TRY_CAST(RequestNo AS INT) DESC;

    -- If NULL, start from 1
    IF @NextMRVNumber IS NULL
        SET @NextMRVNumber = 1;

    -- Insert requests with TypeId = 2 and increment MRV numbers
    INSERT INTO Requests (CompanyID, ContractId, MRVNO, AreaUnitID, ReqMrvQty, DelMrvQty, LocItemID, DelMrvRejQty, Remark, RequestNO, TypeId, IssuedBy, DelDate)
    SELECT 
        @CompanyID,
        @ContractId,
        @MRVNO,
        @AreaUnitID,
        ReqMrvQty,
        DelMrvQty,
        LocItemID,
        DelMrvRejQty,
        Remark,
        FORMAT(@NextMRVNumber, 'D6'),
        2,
        @IssuedBy,
        @DelDate
    FROM @RequestMrvs;

    -- Iterate through the rows in @RequestMrvs
    DECLARE cur CURSOR FOR 
    SELECT LocItemID, ISNULL(SelectedLocation, 0) AS SelectedLocation, DelMrvQty 
    FROM @RequestMrvs;

    OPEN cur;

    FETCH NEXT FROM cur INTO @LocItemID, @SelectedLocation, @Qty;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Check current balance for the LocItemID
        SELECT @CurrentBalance = Qty FROM LocItems WHERE LocItemID = @LocItemID;

        -- Fetch ItemId from LocItems
        SELECT @ItemId = ItemId FROM LocItems WHERE LocItemID = @LocItemID;

        IF @SelectedLocation != 0
        BEGIN
            -- Call the spUpdateBalanceAndInsertLocItem2 procedure to handle updates and insertions
            EXEC dbo.spUpdateBalanceAndInsertLocItem3
                @ItemId = @ItemId,
                @LocItemID = @LocItemID,
                @Qty = @Qty,
                @LocationID = @SelectedLocation,
                @CurrentBalance = @CurrentBalance,
                @EnteredBy = @IssuedBy;
        END

        FETCH NEXT FROM cur INTO @LocItemID, @SelectedLocation, @Qty;
    END

    CLOSE cur;
    DEALLOCATE cur;

    COMMIT TRANSACTION;

    -- Return the new MRV numbers
    SELECT DISTINCT FORMAT(@NextMRVNumber, 'D6') AS NewMRVNumber
    FROM @RequestMrvs;

END;
GO
/****** Object:  StoredProcedure [dbo].[InsertMRVBatch4]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[InsertMRVBatch4]
    @CompanyID INT,
    @ContractId INT,
    @MRVNO NVARCHAR(50),
    @AreaUnitID INT,
    @IssuedBy INT,
    @DelDate DATETIME,
    @RequestMrvs dbo.NewMRVDtoType READONLY
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Check for duplicate MRVNO and CompanyID
    IF EXISTS (SELECT 1 FROM Requests WHERE MRVNO = @MRVNO AND CompanyID = @CompanyID)
    BEGIN
        RAISERROR('Duplicate MRV number for the specified company.', 16, 1);
        RETURN;
    END

    DECLARE @NextMRVNumber INT;
    DECLARE @LocItemID INT;
    DECLARE @SelectedLocation INT;
    DECLARE @DelMrvQty DECIMAL(18, 2);
    DECLARE @DelMrvRejQty DECIMAL(18, 2); -- اضافه شد
    DECLARE @CurrentBalance DECIMAL(18, 2);
    DECLARE @ItemId INT;

    BEGIN TRANSACTION;

    -- Get the last MRV number and start from 1 if no MRV exists
    SELECT TOP 1 @NextMRVNumber = TRY_CAST(RequestNo AS INT) + 1
    FROM Requests
    WHERE TypeId = 2 AND TRY_CAST(RequestNo AS INT) IS NOT NULL
    ORDER BY TRY_CAST(RequestNo AS INT) DESC;

    IF @NextMRVNumber IS NULL
        SET @NextMRVNumber = 1;

    -- Insert requests with TypeId = 2 and increment MRV numbers
    INSERT INTO Requests (CompanyID, ContractId, MRVNO, AreaUnitID, ReqMrvQty, DelMrvQty, LocItemID, DelMrvRejQty, Remark, RequestNO, TypeId, IssuedBy, DelDate)
    SELECT 
        @CompanyID,
        @ContractId,
        @MRVNO,
        @AreaUnitID,
        ReqMrvQty,
        DelMrvQty,
        LocItemID,
        DelMrvRejQty,
        Remark,
        FORMAT(@NextMRVNumber, 'D6'),
        2,
        @IssuedBy,
        @DelDate
    FROM @RequestMrvs;

    -- Iterate through the rows in @RequestMrvs
    DECLARE cur CURSOR FOR 
    SELECT LocItemID, ISNULL(SelectedLocation, 0) AS SelectedLocation, DelMrvQty, DelMrvRejQty -- اضافه شد
    FROM @RequestMrvs;

    OPEN cur;

    FETCH NEXT FROM cur INTO @LocItemID, @SelectedLocation, @DelMrvQty, @DelMrvRejQty; -- اضافه شد

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Check current balance for the LocItemID
        SELECT @CurrentBalance = Qty FROM LocItems WHERE LocItemID = @LocItemID;

        -- Fetch ItemId from LocItems
        SELECT @ItemId = ItemId FROM LocItems WHERE LocItemID = @LocItemID;

        IF @SelectedLocation != 0
        BEGIN
            -- Call the spUpdateBalanceAndInsertLocItem3 procedure to handle updates and insertions
            EXEC dbo.spUpdateBalanceAndInsertLocItem4
                @ItemId = @ItemId,
                @LocItemID = @LocItemID,
                @DelMrvQty = @DelMrvQty, -- ارسال DelMrvQty
                @DelMrvRejQty = @DelMrvRejQty, -- ارسال DelMrvRejQty
                @LocationID = @SelectedLocation,
                @CurrentBalance = @CurrentBalance,
                @EnteredBy = @IssuedBy;
        END

        FETCH NEXT FROM cur INTO @LocItemID, @SelectedLocation, @DelMrvQty, @DelMrvRejQty;
    END

    CLOSE cur;
    DEALLOCATE cur;

    COMMIT TRANSACTION;

    -- Return the new MRV numbers
    SELECT DISTINCT FORMAT(@NextMRVNumber, 'D6') AS NewMRVNumber
    FROM @RequestMrvs;

END;
GO
/****** Object:  StoredProcedure [dbo].[InsertMRVBatch5]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertMRVBatch5]
    @CompanyID INT,
    @ContractId INT,
    @MRVNO NVARCHAR(50),
    @AreaUnitID INT,
    @IssuedBy INT,
    @DelDate DATETIME,
    @RequestMrvs dbo.NewMRVDtoType4 READONLY
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @NextMRVNumber INT;
    DECLARE @LocItemID INT;
    DECLARE @SelectedLocation INT;
    DECLARE @DelMrvQty DECIMAL(18, 2);
    DECLARE @DelMrvRejQty DECIMAL(18, 2);
    DECLARE @CurrentBalance DECIMAL(18, 2);
    DECLARE @ItemId INT;
    DECLARE @Remark NVARCHAR(300);
    DECLARE @Status NVARCHAR(50);  -- ??????? ???? ?????? ?????

    BEGIN TRANSACTION;

    -- Get the last MRV number and start from 1 if no MRV exists
    SELECT TOP 1 @NextMRVNumber = TRY_CAST(RequestNo AS INT) + 1
    FROM Requests
    WHERE TypeId = 2 AND TRY_CAST(RequestNo AS INT) IS NOT NULL
    ORDER BY TRY_CAST(RequestNo AS INT) DESC;

    IF @NextMRVNumber IS NULL
        SET @NextMRVNumber = 1;

    INSERT INTO Requests (CompanyID, ContractId, MRVNO, AreaUnitID, ReqMrvQty, DelMrvQty, LocItemID, DelMrvRejQty, Remark, RequestNO,MRCNO, TypeId, IssuedBy, DelDate)
    SELECT 
        @CompanyID,
        @ContractId,
        @MRVNO,
        @AreaUnitID,
        ReqMrvQty,
        DelMrvQty,
        LocItemID,
        DelMrvRejQty,
        Remark,
        FORMAT(@NextMRVNumber, 'D6'),
		MRCNO,
        2,
        @IssuedBy,
        @DelDate
    FROM @RequestMrvs;

    DECLARE cur CURSOR FOR 
    SELECT LocItemID, ISNULL(SelectedLocation, 0) AS SelectedLocation, DelMrvQty, DelMrvRejQty, Remark
    FROM @RequestMrvs;

    OPEN cur;

    FETCH NEXT FROM cur INTO @LocItemID, @SelectedLocation, @DelMrvQty, @DelMrvRejQty, @Remark;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SELECT @CurrentBalance = Qty FROM LocItems WHERE LocItemID = @LocItemID;
        SELECT @ItemId = ItemId FROM LocItems WHERE LocItemID = @LocItemID;

        IF @SelectedLocation != 0
        BEGIN
            -- Call spUpdateBalanceAndInsertLocItem5 procedure
            EXEC dbo.spUpdateBalanceAndInsertLocItem5
                @ItemId = @ItemId,
                @LocItemID = @LocItemID,
                @DelMrvQty = @DelMrvQty,
                @DelMrvRejQty = @DelMrvRejQty,
                @LocationID = @SelectedLocation,
                @CurrentBalance = @CurrentBalance,
                @EnteredBy = @IssuedBy,
                @Remark = @Remark,
                @Status = @Status OUTPUT;  -- ?????? ?????
        END

        FETCH NEXT FROM cur INTO @LocItemID, @SelectedLocation, @DelMrvQty, @DelMrvRejQty, @Remark;
    END

    CLOSE cur;
    DEALLOCATE cur;

    COMMIT TRANSACTION;

    -- Return the new MRV number
    SELECT FORMAT(@NextMRVNumber, 'D6') AS NewMRVNumber, @Status AS Status;  -- ????????? ????? MRV ? ?????
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertMRVBatch55]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertMRVBatch55]
    @CompanyID INT,--id مربوط به پیمانکار
    @ContractId INT, -- id مربوط به شماره قراداد پیمانکار
    @MRVNO NVARCHAR(50),-- نام mrv
    @AreaUnitID INT,-- مربوط به کدام unitدر سایت پالایشگاه هست
    @IssuedBy INT,-- توسط چه کسی
    @DelDate DATETIME, -- در چه تاریخی
    @RequestMrvs dbo.NewMRVDtoType4 READONLY -- شامل ReqMrvQty - تعداد درخواست , DelMrvQty -تعدادی که واقعا گرفته شده , DelMrvRejQty -تعدادی که گرفته شده ولی مشکل دارد , LocitemID , Remark , MRCNO -داخل این من شماره miv رو ذخیره کردم, SelectedLocation - مربوط به لوکیشن
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @NextMRVNumber INT;
    DECLARE @LocItemID INT;
    DECLARE @SelectedLocation INT;
    DECLARE @DelMrvQty DECIMAL(18, 2);
    DECLARE @DelMrvRejQty DECIMAL(18, 2);
    DECLARE @CurrentBalance DECIMAL(18, 2);
    DECLARE @ItemId INT;
    DECLARE @Remark NVARCHAR(300);
    DECLARE @MRCNO NVARCHAR(50);  
    DECLARE @Status NVARCHAR(50);  
    DECLARE @FormattedMRVNumber NVARCHAR(50); -- برای نگهداری فرمت‌شده MRVNumber

    BEGIN TRANSACTION;

    -- دریافت شماره MRV بعدی
    SELECT TOP 1 @NextMRVNumber = TRY_CAST(RequestNo AS INT) + 1
    FROM Requests
    WHERE TypeId = 2 AND TRY_CAST(RequestNo AS INT) IS NOT NULL
    ORDER BY TRY_CAST(RequestNo AS INT) DESC;

    IF @NextMRVNumber IS NULL
        SET @NextMRVNumber = 1;

    -- وارد کردن اطلاعات به Requests
    INSERT INTO Requests (CompanyID, ContractId, MRVNO, AreaUnitID, ReqMrvQty, DelMrvQty, LocItemID, DelMrvRejQty, Remark, RequestNO, MRCNO, TypeId, IssuedBy, DelDate)
    SELECT 
        @CompanyID,
        @ContractId,
        @MRVNO,
        @AreaUnitID,
        ReqMrvQty,
        DelMrvQty,
        LocItemID,
        DelMrvRejQty,
        Remark,
        FORMAT(@NextMRVNumber, 'D6'),
        MRCNO,
        2,
        @IssuedBy,
        @DelDate
    FROM @RequestMrvs;

    -- پیمایش داده‌ها در CURSOR
    DECLARE cur CURSOR FOR 
    SELECT LocItemID, ISNULL(SelectedLocation, 0) AS SelectedLocation, DelMrvQty, DelMrvRejQty, Remark, MRCNO
    FROM @RequestMrvs;

    OPEN cur;

    FETCH NEXT FROM cur INTO @LocItemID, @SelectedLocation, @DelMrvQty, @DelMrvRejQty, @Remark, @MRCNO;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- دریافت موجودی فعلی و ItemId برای LocItemID
        SELECT @CurrentBalance = Qty FROM LocItems WHERE LocItemID = @LocItemID;
        SELECT @ItemId = ItemId FROM LocItems WHERE LocItemID = @LocItemID;

        -- فرمت کردن MRVNumber برای هر LocItemID
        SET @FormattedMRVNumber = FORMAT(@NextMRVNumber, 'D6');

        IF @SelectedLocation != 0
        BEGIN
            -- فراخوانی پروسیجر spUpdateBalanceAndInsertLocItem55 با پارامترهای مورد نیاز
            EXEC dbo.spUpdateBalanceAndInsertLocItem55
                @COMPANYID = @CompanyID,
                @ItemId = @ItemId,
                @LocItemID = @LocItemID,
                @DelMrvQty = @DelMrvQty,
                @DelMrvRejQty = @DelMrvRejQty,
                @LocationID = @SelectedLocation,
                @CurrentBalance = @CurrentBalance,
                @EnteredBy = @IssuedBy,
                @Remark = @Remark,
                @REQUESTNOO = @MRCNO,
                @MRVNumber = @FormattedMRVNumber,  -- ارسال MRVNumber فرمت‌شده
                @Status = @Status OUTPUT;
        END

        -- افزایش مقدار @NextMRVNumber برای LocItemID بعدی
        SET @NextMRVNumber = @NextMRVNumber + 1;

        FETCH NEXT FROM cur INTO @LocItemID, @SelectedLocation, @DelMrvQty, @DelMrvRejQty, @Remark, @MRCNO;
    END

    CLOSE cur;
    DEALLOCATE cur;

    COMMIT TRANSACTION;

    -- بازگرداندن شماره جدید MRV و وضعیت
    SELECT FORMAT(@NextMRVNumber - 1, 'D6') AS NewMRVNumber, @Status AS Status;  
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertMRVBatch6]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertMRVBatch6]
    @CompanyID INT,
    @ContractId INT,
    @MRVNO NVARCHAR(50),
    @AreaUnitID INT,
    @IssuedBy INT,
    @DelDate DATETIME,
    @RequestMrvs dbo.NewMRVDtoType4 READONLY
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @NextMRVNumber INT;
    DECLARE @LocItemID INT;
    DECLARE @SelectedLocation INT;
    DECLARE @DelMrvQty DECIMAL(18, 2);
    DECLARE @DelMrvRejQty DECIMAL(18, 2);
    DECLARE @CurrentBalance DECIMAL(18, 2);
    DECLARE @ItemId INT;
    DECLARE @Remark NVARCHAR(300);
    DECLARE @NewLocItemID INT;  -- LocItemID جدید که برای لوکیشن جدید ایجاد می‌شود
    DECLARE @Status NVARCHAR(50);

    BEGIN TRANSACTION;

    -- دریافت آخرین شماره MRV
    SELECT TOP 1 @NextMRVNumber = TRY_CAST(RequestNo AS INT) + 1
    FROM Requests
    WHERE TypeId = 2 AND TRY_CAST(RequestNo AS INT) IS NOT NULL
    ORDER BY TRY_CAST(RequestNo AS INT) DESC;

    IF @NextMRVNumber IS NULL
        SET @NextMRVNumber = 1;

    -- درج رکوردهای جدید در Requests
    INSERT INTO Requests (CompanyID, ContractId, MRVNO, AreaUnitID, ReqMrvQty, DelMrvQty, LocItemID, DelMrvRejQty, Remark, RequestNO, MRCNO, TypeId, IssuedBy, DelDate)
    SELECT 
        @CompanyID,
        @ContractId,
        @MRVNO,
        @AreaUnitID,
        ReqMrvQty,
        DelMrvQty,
        LocItemID,
        DelMrvRejQty,
        Remark,
        FORMAT(@NextMRVNumber, 'D6'),
        MRCNO,
        2,
        @IssuedBy,
        @DelDate
    FROM @RequestMrvs;

    -- ایجاد cursor برای پردازش مقادیر هر رکورد
    DECLARE cur CURSOR FOR 
    SELECT LocItemID, ISNULL(SelectedLocation, 0) AS SelectedLocation, DelMrvQty, DelMrvRejQty, Remark
    FROM @RequestMrvs;

    OPEN cur;

    FETCH NEXT FROM cur INTO @LocItemID, @SelectedLocation, @DelMrvQty, @DelMrvRejQty, @Remark;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- دریافت بالانس فعلی
        SELECT @CurrentBalance = Qty FROM LocItems WHERE LocItemID = @LocItemID;
        SELECT @ItemId = ItemId FROM LocItems WHERE LocItemID = @LocItemID;

        -- اگر لوکیشن جدید انتخاب شده است
        IF @SelectedLocation != 0
        BEGIN
            -- ایجاد LocItem جدید برای لوکیشن جدید
            INSERT INTO LocItems (ItemId, LocationID, Qty, ParentLocItemID, RemarkLocitemID)
            VALUES (@ItemId, @SelectedLocation, 0, @LocItemID, @Remark);

            -- دریافت LocItemID جدید
            SET @NewLocItemID = SCOPE_IDENTITY();

            -- کاهش مقدار DelMrvQty از LocItemID اصلی
            UPDATE LocItems
            SET Qty = Qty - @DelMrvQty
            WHERE LocItemID = @LocItemID;

            -- کسر مقدار برگشتی (DelMrvRejQty) از LocItemID اصلی
            IF @DelMrvRejQty > 0
            BEGIN
                UPDATE LocItems
                SET Qty = Qty - @DelMrvRejQty
                WHERE LocItemID = @LocItemID;

                -- درج رکورد برای LocItemID جدید با مقدار برگشتی
                INSERT INTO Requests (CompanyID, ContractId, MRVNO, AreaUnitID, ReqMrvQty, DelMrvQty, LocItemID, DelMrvRejQty, Remark, RequestNO, MRCNO, TypeId, IssuedBy, DelDate)
                VALUES (@CompanyID, @ContractId, @MRVNO, @AreaUnitID, 0, 0, @NewLocItemID, @DelMrvRejQty, @Remark, FORMAT(@NextMRVNumber, 'D6'), NULL, 2, @IssuedBy, @DelDate);
            END

            -- درج رکورد برای LocItemID جدید با مقدار تحویلی
            INSERT INTO Requests (CompanyID, ContractId, MRVNO, AreaUnitID, ReqMrvQty, DelMrvQty, LocItemID, DelMrvRejQty, Remark, RequestNO, MRCNO, TypeId, IssuedBy, DelDate)
            VALUES (@CompanyID, @ContractId, @MRVNO, @AreaUnitID, 0, @DelMrvQty, @NewLocItemID, 0, @Remark, FORMAT(@NextMRVNumber, 'D6'), NULL, 2, @IssuedBy, @DelDate);
        END
        ELSE
        BEGIN
            -- اگر لوکیشن تغییر نکرده است، فقط مقدار برگشتی را در LocItemID اصلی ثبت کن
            IF @DelMrvRejQty > 0
            BEGIN
                UPDATE LocItems
                SET Qty = Qty - @DelMrvRejQty
                WHERE LocItemID = @LocItemID;

                -- ثبت مقدار برگشتی در Requests
                INSERT INTO Requests (CompanyID, ContractId, MRVNO, AreaUnitID, ReqMrvQty, DelMrvQty, LocItemID, DelMrvRejQty, Remark, RequestNO, MRCNO, TypeId, IssuedBy, DelDate)
                VALUES (@CompanyID, @ContractId, @MRVNO, @AreaUnitID, 0, 0, @LocItemID, @DelMrvRejQty, @Remark, FORMAT(@NextMRVNumber, 'D6'), NULL, 2, @IssuedBy, @DelDate);
            END

            -- ثبت مقدار تحویلی در همان LocItemID
            UPDATE LocItems
            SET Qty = Qty - @DelMrvQty
            WHERE LocItemID = @LocItemID;

            -- ثبت مقدار تحویلی در Requests
            INSERT INTO Requests (CompanyID, ContractId, MRVNO, AreaUnitID, ReqMrvQty, DelMrvQty, LocItemID, DelMrvRejQty, Remark, RequestNO, MRCNO, TypeId, IssuedBy, DelDate)
            VALUES (@CompanyID, @ContractId, @MRVNO, @AreaUnitID, 0, @DelMrvQty, @LocItemID, 0, @Remark, FORMAT(@NextMRVNumber, 'D6'), NULL, 2, @IssuedBy, @DelDate);
        END

        FETCH NEXT FROM cur INTO @LocItemID, @SelectedLocation, @DelMrvQty, @DelMrvRejQty, @Remark;
    END

    CLOSE cur;
    DEALLOCATE cur;

    COMMIT TRANSACTION;

    -- بازگرداندن شماره MRV جدید
    SELECT FORMAT(@NextMRVNumber, 'D6') AS NewMRVNumber, @Status AS Status;
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertRequestBatch]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertRequestMivsBatch]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[IsLocationUsedByItem]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[PDFSsectionIRN]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PDFSsectionIRN]
AS
BEGIN
SELECT DISTINCT IrnName, IrnPdf AS DPF, EnteredDate
FROM     Irns
END
GO
/****** Object:  StoredProcedure [dbo].[PDFSsectionMIV]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[PDFSsectionMIV]
AS
BEGIN
SELECT DISTINCT 
    Requests.RequestNO, 
    Requests.RequestPDF as DPF, 
    Requests.MRCNO, 
    Requests.MRVNO, 
    Requests.HMVNO, 
    IssuedByUser.Username AS IssuedBy,
	Requests.IssuedDate, 
    ApprovedByUser.Username AS ApprovedBy,
    Requests.ApprovedDate
FROM Requests
LEFT JOIN ApplicationUser AS IssuedByUser 
    ON Requests.IssuedBy = IssuedByUser.UserID
LEFT JOIN ApplicationUser AS ApprovedByUser 
    ON Requests.ApprovedBy = ApprovedByUser.UserID

END
GO
/****** Object:  StoredProcedure [dbo].[PDFSsectionPL]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PDFSsectionPL]
AS
BEGIN
SELECT DISTINCT PackingLists.PLName, PackingLists.PLDPF AS DPF, ApplicationUser.Username as EnteredBy, PackingLists.EnteredDate
FROM     PackingLists left JOIN
                  ApplicationUser ON PackingLists.EnteredBy = ApplicationUser.UserID
END
GO
/****** Object:  StoredProcedure [dbo].[RegisterMSR]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[RegisterMSR]
    @PLId INT,
	@userID INT,
    @NewMSRNo NVARCHAR(10) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @LastMSRNo NVARCHAR(10);
    DECLARE @NextMSRNo NVARCHAR(10);

    -- دریافت آخرین شماره MSR از جدول Packages
    SELECT TOP 1 @LastMSRNo = MSRNO
    FROM Packages
    WHERE MSRNO IS NOT NULL
    ORDER BY CAST(MSRNO AS INT) DESC;

    -- تولید شماره جدید (افزایش به عدد 6 رقمی)
    IF @LastMSRNo IS NOT NULL
        SET @NextMSRNo = RIGHT('000000' + CAST(CAST(@LastMSRNo AS INT) + 1 AS NVARCHAR), 6);
    ELSE
        SET @NextMSRNo = '000001'; -- اولین شماره در صورت نبود مقدار

    -- به‌روزرسانی ستون MSRNO و MSRDate برای PLId مشخص‌شده
    UPDATE Packages
    SET 
        MSRNO = @NextMSRNo,
        MSRDate = GETDATE(),
	    MSREnteredBy=@userID
    WHERE PLId = @PLId;

    -- بازگشت شماره جدید
    SET @NewMSRNo = @NextMSRNo;
END;


GO
/****** Object:  StoredProcedure [dbo].[Search_ChangeLocitem]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Search_ChangeLocitem]
AS
BEGIN
    BEGIN TRY
        SET NOCOUNT ON;

        ;WITH CTE_RequestData AS
        (
            SELECT 
                li.LocItemID,
                li.LocationID, -- Add LocationID
                SUM(req.ReserveMivQty) AS TotalReserveMivQty,
                SUM(req.DelMivQty) AS TotalDelMivQty,
                SUM(li.NISQty) AS NISQty,
				SUM(li.OverQty) AS OverQty,
				SUM(li.ShortageQty) AS ShortageQty,
				SUM(li.DamageQty) AS DamageQty,
                SUM(li.RejectQty) AS RejectQty,
                SUM(req.DelMrvQty * -1) AS TotalReturnAcceptQty, 
                SUM(req.ReqMivQty) AS TotalReqMivQty
            FROM 
                LocItems AS li
            LEFT OUTER JOIN Requests AS req ON li.LocItemID = req.LocItemID
            GROUP BY 
                li.LocItemID,
                li.LocationID -- Add LocationID to group by
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
				Items.ExpiredDate,
                li.LocItemID, -- Add LocItemID
                li.LocationID, -- Add LocationID
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
                    + ISNULL(SUM(rd.TotalReturnAcceptQty), 0) AS Inventory,
                SUM(rd.TotalReturnAcceptQty) AS TotalReturnAcceptQty,
                SUM(rd.TotalReqMivQty) AS ReqMivQty,
                SUM(rd.TotalDelMivQty) AS DelMivQty,
                SUM(rd.TotalReserveMivQty) AS ReserveMivQty,
                SUM(li.NISQty) AS NISQty,
                SUM(li.RejectQty) AS RejectQty
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
                Items.Hold,
				Items.ExpiredDate,
                li.LocItemID, -- Group by LocItemID
                li.LocationID -- Group by LocationID
        )
        SELECT 
            p.ArrivalDate,
			pl.ArchiveNO,
			pl.MARDate,
			pl.OPINO,
			pl.PLNO,
            pl.Project,
            po.PoName,
            v.VendorName AS Vendor,
            fi.ItemId,
            pl.PLName,
            p.PK,
            Items.ItemOfPk,
			Items.ExpiredDate,
            fi.Tag,
            fi.Description,
            u.UnitName,
            ISNULL(SUM(Items.Qty), 0) AS QtyPL,
            MAX(fi.Qty) AS QtyInLoc, 
            MAX(fi.Balance) AS Balance,
            MAX(fi.Inventory) AS Inventory,
            d.DesciplineName AS Discipline,
            sc.ScopeName AS Scope,
            fi.HeatNo,
            fi.BatchNo,
            fi.Remark,
            fi.Hold,
			MAX(fi.TotalReturnAcceptQty) AS TotalReturnAcceptQty,
            MAX(fi.ReqMivQty) AS ReqMivQty,
            MAX(fi.DelMivQty) AS DelMivQty,
            MAX(fi.ReserveMivQty) AS ReserveMivQty,
			ISNULL(SUM(fi.NISQty), 0) AS NISQty, 
			ISNULL(SUM(fi.RejectQty), 0) AS RejectQty, 
			ISNULL(SUM(li.OverQty), 0) AS OverQty, 
			ISNULL(SUM(li.ShortageQty), 0) AS ShortageQty, 
			ISNULL(SUM(li.DamageQty), 0) AS DamageQty, 
            s.SupplierName AS Supplier, -- Adding SupplierName from Supplier table
            fi.LocItemID, -- Add LocItemID to final select
            loc.LocationName, -- Add LocationName from Location table
			loc.LocationID
        FROM 
            CTE_FilteredItems AS fi
        INNER JOIN Items ON fi.ItemId = Items.ItemId
        LEFT OUTER JOIN LocItems AS li ON fi.LocItemID = li.LocItemID -- Join LocItems for LocItemID
        LEFT OUTER JOIN Locations AS loc ON li.LocationID = loc.LocationID -- Join Locations for LocationName
        LEFT OUTER JOIN Packages AS p ON Items.PKID = p.PKID
        LEFT OUTER JOIN PackingLists AS pl ON p.PLId = pl.PLId
        LEFT OUTER JOIN Pos AS po ON pl.PoId = po.PoId
        LEFT OUTER JOIN Units AS u ON Items.UnitID = u.UnitID
        LEFT OUTER JOIN Vendors AS v ON pl.VendorId = v.VendorID
        LEFT OUTER JOIN Desciplines AS d ON pl.DesciplineId = d.DesciplineId
        LEFT OUTER JOIN Scopes AS sc ON Items.ScopeID = sc.ScopeID
        LEFT OUTER JOIN Suppliers AS s ON pl.SupplierId = s.SupplierId -- Joining Supplier table
        GROUP BY 
            p.ArrivalDate,
		    pl.ArchiveNO,
			pl.MARDate,
			pl.OPINO,
            pl.PLNO,
            pl.Project,
            po.PoName,
            v.VendorName,
            fi.ItemId,
            pl.PLName,
            p.PK,
            Items.ItemOfPk,
			Items.ExpiredDate,
            fi.Tag,
            fi.Description,
            u.UnitName,
            sc.ScopeName,
            d.DesciplineName,
            fi.HeatNo,
            fi.BatchNo,
            fi.Remark,
            fi.Hold,
            pl.DesciplineId,
            s.SupplierName, -- Adding Group By for SupplierName
            fi.LocItemID, -- Group by LocItemID
            loc.LocationName, -- Group by LocationName
            loc.LocationID
		--ORDER BY fi.ItemId
    END TRY
    BEGIN CATCH
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
/****** Object:  StoredProcedure [dbo].[Search_ChangeLocitem2]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Search_ChangeLocitem2]
AS
BEGIN
    BEGIN TRY
        SET NOCOUNT ON;

        ;WITH CTE_RequestData AS
        (
            SELECT 
                li.LocItemID,
                --li.LocationID, -- Add LocationID
                SUM(req.ReserveMivQty) AS TotalReserveMivQty,
                SUM(req.DelMivQty) AS TotalDelMivQty,
                SUM(li.NISQty) AS NISQty,
				SUM(li.OverQty) AS OverQty,
				SUM(li.ShortageQty) AS ShortageQty,
				SUM(li.DamageQty) AS DamageQty,
                SUM(li.RejectQty) AS RejectQty,
                SUM(req.DelMrvQty * -1) AS TotalReturnAcceptQty, 
                SUM(req.ReqMivQty) AS TotalReqMivQty
            FROM 
                LocItems AS li
            LEFT OUTER JOIN Requests AS req ON li.LocItemID = req.LocItemID
            GROUP BY 
                li.LocItemID--,
                --li.LocationID -- Add LocationID to group by
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
				Items.ExpiredDate,
                li.LocItemID, -- Add LocItemID
                li.LocationID, -- Add LocationID
                ISNULL(SUM(li.Qty), 0) AS Qty, 
                ISNULL(SUM(li.Qty), 0) 
                    - ISNULL(SUM(rd.TotalReserveMivQty), 0) 
                    - ISNULL(SUM(rd.TotalDelMivQty), 0) 
                    - ISNULL(SUM(li.NISQty), 0) 
                    - ISNULL(SUM(li.RejectQty), 0) 
                    - ISNULL(SUM(rd.TotalReturnAcceptQty), 0) AS Balance,
                ISNULL(SUM(li.Qty), 0) 
                    - ISNULL(SUM(rd.TotalDelMivQty), 0) 
                    - ISNULL(SUM(li.NISQty), 0) 
                    - ISNULL(SUM(li.RejectQty), 0) 
                    - ISNULL(SUM(rd.TotalReturnAcceptQty), 0) AS Inventory,
                SUM(rd.TotalReturnAcceptQty) AS TotalReturnAcceptQty,
                SUM(rd.TotalReqMivQty) AS ReqMivQty,
                SUM(rd.TotalDelMivQty) AS DelMivQty,
                SUM(rd.TotalReserveMivQty) AS ReserveMivQty,
                SUM(li.NISQty) AS NISQty,
                SUM(li.RejectQty) AS RejectQty
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
                Items.Hold,
				Items.ExpiredDate,
                li.LocItemID, -- Group by LocItemID
                li.LocationID -- Group by LocationID
        )
        SELECT 
            p.ArrivalDate,
			pl.ArchiveNO,
			pl.MARDate,
			pl.OPINO,
			pl.PLNO,
            pl.Project,
            po.PoName,
            v.VendorName AS Vendor,
            fi.ItemId,
            pl.PLName,
            p.PK,
            Items.ItemOfPk,
			Items.ExpiredDate,
            fi.Tag,
            fi.Description,
            u.UnitName,
            ISNULL(SUM(Items.Qty), 0) AS QtyPL,
            ISNULL(SUM(fi.Qty),0) AS QtyInLoc, 
            ISNULL(SUM(fi.Balance),0) AS Balance,
            ISNULL(SUM(fi.Inventory),0) AS Inventory,
            d.DesciplineName AS Discipline,
            sc.ScopeName AS Scope,
            fi.HeatNo,
            fi.BatchNo,
            fi.Remark,
            fi.Hold,
			ISNULL(SUM(fi.TotalReturnAcceptQty),0) AS TotalReturnAcceptQty,
            ISNULL(SUM(fi.ReqMivQty),0) AS ReqMivQty,
            ISNULL(SUM(fi.DelMivQty),0) AS DelMivQty,
            ISNULL(SUM(fi.ReserveMivQty),0) AS ReserveMivQty,
			ISNULL(SUM(fi.NISQty), 0) AS NISQty, 
			ISNULL(SUM(fi.RejectQty), 0) AS RejectQty, 
			ISNULL(SUM(li.OverQty), 0) AS OverQty, 
			ISNULL(SUM(li.ShortageQty), 0) AS ShortageQty, 
			ISNULL(SUM(li.DamageQty), 0) AS DamageQty, 
            s.SupplierName AS Supplier, -- Adding SupplierName from Supplier table
            fi.LocItemID, -- Add LocItemID to final select
            loc.LocationName, -- Add LocationName from Location table
			loc.LocationID
        FROM 
            CTE_FilteredItems AS fi
        INNER JOIN Items ON fi.ItemId = Items.ItemId
        LEFT OUTER JOIN LocItems AS li ON fi.LocItemID = li.LocItemID -- Join LocItems for LocItemID
        LEFT OUTER JOIN Locations AS loc ON li.LocationID = loc.LocationID -- Join Locations for LocationName
        LEFT OUTER JOIN Packages AS p ON Items.PKID = p.PKID
        LEFT OUTER JOIN PackingLists AS pl ON p.PLId = pl.PLId
        LEFT OUTER JOIN Pos AS po ON pl.PoId = po.PoId
        LEFT OUTER JOIN Units AS u ON Items.UnitID = u.UnitID
        LEFT OUTER JOIN Vendors AS v ON pl.VendorId = v.VendorID
        LEFT OUTER JOIN Desciplines AS d ON pl.DesciplineId = d.DesciplineId
        LEFT OUTER JOIN Scopes AS sc ON Items.ScopeID = sc.ScopeID
        LEFT OUTER JOIN Suppliers AS s ON pl.SupplierId = s.SupplierId -- Joining Supplier table
        GROUP BY 
            p.ArrivalDate,
		    pl.ArchiveNO,
			pl.MARDate,
			pl.OPINO,
            pl.PLNO,
            pl.Project,
            po.PoName,
            v.VendorName,
            fi.ItemId,
            pl.PLName,
            p.PK,
            Items.ItemOfPk,
			Items.ExpiredDate,
            fi.Tag,
            fi.Description,
            u.UnitName,
            sc.ScopeName,
            d.DesciplineName,
            fi.HeatNo,
            fi.BatchNo,
            fi.Remark,
            fi.Hold,
            pl.DesciplineId,
            s.SupplierName, -- Adding Group By for SupplierName
            fi.LocItemID, -- Group by LocItemID
            loc.LocationName, -- Group by LocationName
            loc.LocationID
		--ORDER BY fi.ItemId
    END TRY
    BEGIN CATCH
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
/****** Object:  StoredProcedure [dbo].[Search_ChangeLocitem3]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Search_ChangeLocitem3]
AS
BEGIN
    BEGIN TRY
        SET NOCOUNT ON;

        ;WITH CTE_RequestData AS
        (
            SELECT 
                li.LocItemID,
                --li.LocationID, -- Add LocationID
                SUM(req.ReserveMivQty) AS TotalReserveMivQty,
                SUM(req.DelMivQty) AS TotalDelMivQty,
				SUM(req.DelMivRejQty) AS TotalDelMivRejQty,
                SUM(li.NISQty) AS NISQty,
				SUM(li.OverQty) AS OverQty,
				SUM(li.ShortageQty) AS ShortageQty,
				SUM(li.DamageQty) AS DamageQty,
                SUM(li.RejectQty) AS RejectQty,
                SUM(req.DelMrvQty * -1) AS TotalReturnAcceptQty,
				SUM(req.DelMrvRejQty * -1) AS TotalDelMrvRejQty,
                SUM(req.ReqMivQty) AS TotalReqMivQty
            FROM 
                LocItems AS li
            LEFT OUTER JOIN Requests AS req ON li.LocItemID = req.LocItemID
            GROUP BY 
                li.LocItemID--,
                --li.LocationID -- Add LocationID to group by
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
				Items.ExpiredDate,
                li.LocItemID, -- Add LocItemID
                li.LocationID, -- Add LocationID
                ISNULL(SUM(li.Qty), 0) AS Qty, 
				ISNULL(SUM(li.Qty), 0) 
                    - ISNULL(SUM(rd.TotalReserveMivQty), 0) 
                    - ISNULL(SUM(rd.TotalDelMivQty), 0) 
                    - ISNULL(SUM(rd.TotalReturnAcceptQty), 0)
					- ISNULL(SUM(rd.TotalDelMivRejQty),0)
				    - ISNULL(SUM(rd.TotalDelMrvRejQty),0) AS BalanceWithRejectAndNIS,
                ISNULL(SUM(li.Qty), 0) 
                    - ISNULL(SUM(rd.TotalReserveMivQty), 0) 
                    - ISNULL(SUM(rd.TotalDelMivQty), 0) 
                    - ISNULL(SUM(li.NISQty), 0) 
                    - ISNULL(SUM(rd.TotalReturnAcceptQty), 0)
					- ISNULL(SUM(rd.TotalDelMivRejQty),0)
				    - ISNULL(SUM(rd.TotalDelMrvRejQty),0) AS BalanceWithReject,
			    ISNULL(SUM(li.Qty), 0) 
                    - ISNULL(SUM(rd.TotalReserveMivQty), 0) 
                    - ISNULL(SUM(rd.TotalDelMivQty), 0) 
                    - ISNULL(SUM(li.NISQty), 0) 
                    - ISNULL(SUM(li.RejectQty), 0) 
                    - ISNULL(SUM(rd.TotalReturnAcceptQty), 0) AS Balance,
                ISNULL(SUM(li.Qty), 0) 
                    - ISNULL(SUM(rd.TotalDelMivQty), 0) 
                    - ISNULL(SUM(li.NISQty), 0) 
                    - ISNULL(SUM(li.RejectQty), 0) 
                    - ISNULL(SUM(rd.TotalReturnAcceptQty), 0) AS Inventory,
                SUM(rd.TotalReturnAcceptQty) AS TotalReturnAcceptQty,
                SUM(rd.TotalReqMivQty) AS ReqMivQty,
                SUM(rd.TotalDelMivQty) AS DelMivQty,
                SUM(rd.TotalReserveMivQty) AS ReserveMivQty,
				SUM(rd.TotalDelMivRejQty) AS TotalDelMivRejQty,
				SUM(rd.TotalDelMrvRejQty) AS TotalDelMrvRejQty,
                SUM(li.NISQty) AS NISQty,
                SUM(li.RejectQty) AS RejectQty
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
                Items.Hold,
				Items.ExpiredDate,
                li.LocItemID, -- Group by LocItemID
                li.LocationID -- Group by LocationID
        )
        SELECT 
            p.ArrivalDate,
			pl.ArchiveNO,
			pl.MARDate,
			pl.OPINO,
			pl.PLNO,
            pl.Project,
            po.PoName,
            v.VendorName AS Vendor,
            fi.ItemId,
            pl.PLName,
            p.PK,
            Items.ItemOfPk,
			Items.ExpiredDate,
            fi.Tag,
            fi.Description,
            u.UnitName,
            ISNULL(SUM(Items.Qty), 0) AS QtyPL,
            ISNULL(SUM(fi.Qty),0) AS QtyInLoc, 
            ISNULL(SUM(fi.BalanceWithRejectAndNIS),0) AS BalanceWithRejectAndNIS,
			ISNULL(SUM(fi.BalanceWithReject),0) AS BalanceWithReject,
            ISNULL(SUM(fi.Balance),0) AS Balance,
            ISNULL(SUM(fi.Inventory),0) AS Inventory,
            d.DesciplineName AS Discipline,
            sc.ScopeName AS Scope,
            fi.HeatNo,
            fi.BatchNo,
            fi.Remark,
            fi.Hold,
			ISNULL(SUM(fi.TotalReturnAcceptQty),0) AS ReturnQty,
            ISNULL(SUM(fi.ReqMivQty),0) AS ReqMivQty,
            ISNULL(SUM(fi.DelMivQty),0) AS DelMivQty,
            ISNULL(SUM(fi.ReserveMivQty),0) AS ReserveMivQty,
			ISNULL(SUM(fi.NISQty), 0) AS NISQty, 
			ISNULL(SUM(fi.RejectQty), 0) AS RejectQty, 
			ISNULL(SUM(fi.TotalDelMivRejQty), 0) AS DelMivRejQty, 
			ISNULL(SUM(fi.TotalDelMrvRejQty), 0) AS DelMrvRejQty, 
			ISNULL(SUM(li.OverQty), 0) AS OverQty, 
			ISNULL(SUM(li.ShortageQty), 0) AS ShortageQty, 
			ISNULL(SUM(li.DamageQty), 0) AS DamageQty, 
            s.SupplierName AS Supplier, -- Adding SupplierName from Supplier table
            fi.LocItemID, -- Add LocItemID to final select
            loc.LocationName, -- Add LocationName from Location table
			loc.LocationID
        FROM 
            CTE_FilteredItems AS fi
        INNER JOIN Items ON fi.ItemId = Items.ItemId
        LEFT OUTER JOIN LocItems AS li ON fi.LocItemID = li.LocItemID -- Join LocItems for LocItemID
        LEFT OUTER JOIN Locations AS loc ON li.LocationID = loc.LocationID -- Join Locations for LocationName
        LEFT OUTER JOIN Packages AS p ON Items.PKID = p.PKID
        LEFT OUTER JOIN PackingLists AS pl ON p.PLId = pl.PLId
        LEFT OUTER JOIN Pos AS po ON pl.PoId = po.PoId
        LEFT OUTER JOIN Units AS u ON Items.UnitID = u.UnitID
        LEFT OUTER JOIN Vendors AS v ON pl.VendorId = v.VendorID
        LEFT OUTER JOIN Desciplines AS d ON pl.DesciplineId = d.DesciplineId
        LEFT OUTER JOIN Scopes AS sc ON Items.ScopeID = sc.ScopeID
        LEFT OUTER JOIN Suppliers AS s ON pl.SupplierId = s.SupplierId -- Joining Supplier table
        GROUP BY 
            p.ArrivalDate,
		    pl.ArchiveNO,
			pl.MARDate,
			pl.OPINO,
            pl.PLNO,
            pl.Project,
            po.PoName,
            v.VendorName,
            fi.ItemId,
            pl.PLName,
            p.PK,
            Items.ItemOfPk,
			Items.ExpiredDate,
            fi.Tag,
            fi.Description,
            u.UnitName,
            sc.ScopeName,
            d.DesciplineName,
            fi.HeatNo,
            fi.BatchNo,
            fi.Remark,
            fi.Hold,
            pl.DesciplineId,
            s.SupplierName, -- Adding Group By for SupplierName
            fi.LocItemID, -- Group by LocItemID
            loc.LocationName, -- Group by LocationName
            loc.LocationID
		--ORDER BY fi.ItemId
    END TRY
    BEGIN CATCH
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
/****** Object:  StoredProcedure [dbo].[Search_ChangeLocitem4]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Search_ChangeLocitem4]
AS
BEGIN
    BEGIN TRY
        SET NOCOUNT ON;

        ;WITH CTE_RequestData AS
        (
            SELECT 
                li.LocItemID,
                --li.LocationID, -- Add LocationID
                SUM(req.ReserveMivQty) AS TotalReserveMivQty,
                SUM(req.DelMivQty) AS TotalDelMivQty,
				SUM(req.DelMivRejQty) AS TotalDelMivRejQty,
                SUM(li.NISQty) AS NISQty,
				SUM(li.OverQty) AS OverQty,
				SUM(li.ShortageQty) AS ShortageQty,
				SUM(li.DamageQty) AS DamageQty,
                SUM(li.RejectQty) AS RejectQty,
                SUM(req.DelMrvQty * -1) AS TotalReturnAcceptQty,
				SUM(req.DelMrvRejQty * -1) AS TotalDelMrvRejQty,
                SUM(req.ReqMivQty) AS TotalReqMivQty
            FROM 
                LocItems AS li
            LEFT OUTER JOIN Requests AS req ON li.LocItemID = req.LocItemID
            GROUP BY 
                li.LocItemID--,
                --li.LocationID -- Add LocationID to group by
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
				Items.ExpiredDate,
                li.LocItemID, -- Add LocItemID
                li.LocationID, -- Add LocationID
                ISNULL(SUM(li.Qty), 0) AS Qty, 
				ISNULL(SUM(li.Qty), 0) 
                    - ISNULL(SUM(rd.TotalReserveMivQty), 0) 
                    - ISNULL(SUM(rd.TotalDelMivQty), 0) 
                    - ISNULL(SUM(rd.TotalReturnAcceptQty), 0)
					- ISNULL(SUM(rd.TotalDelMivRejQty),0)
				    - ISNULL(SUM(rd.TotalDelMrvRejQty),0) AS BalanceWithRejectAndNIS,
                ISNULL(SUM(li.Qty), 0) 
                    - ISNULL(SUM(rd.TotalReserveMivQty), 0) 
                    - ISNULL(SUM(rd.TotalDelMivQty), 0) 
                    - ISNULL(SUM(li.NISQty), 0) 
                    - ISNULL(SUM(rd.TotalReturnAcceptQty), 0)
					- ISNULL(SUM(rd.TotalDelMivRejQty),0)
				    - ISNULL(SUM(rd.TotalDelMrvRejQty),0) AS BalanceWithReject,
			    ISNULL(SUM(li.Qty), 0) 
                    - ISNULL(SUM(rd.TotalReserveMivQty), 0) 
                    - ISNULL(SUM(rd.TotalDelMivQty), 0) 
                    - ISNULL(SUM(li.NISQty), 0) 
                    - ISNULL(SUM(li.RejectQty), 0) 
                    - ISNULL(SUM(rd.TotalReturnAcceptQty), 0) AS Balance,
                ISNULL(SUM(li.Qty), 0) 
                    - ISNULL(SUM(rd.TotalDelMivQty), 0) 
                    - ISNULL(SUM(li.NISQty), 0) 
                    - ISNULL(SUM(li.RejectQty), 0) 
                    - ISNULL(SUM(rd.TotalReturnAcceptQty), 0) AS Inventory,
                SUM(rd.TotalReturnAcceptQty) AS TotalReturnAcceptQty,
                SUM(rd.TotalReqMivQty) AS ReqMivQty,
                SUM(rd.TotalDelMivQty) AS DelMivQty,
                SUM(rd.TotalReserveMivQty) AS ReserveMivQty,
				SUM(rd.TotalDelMivRejQty) AS TotalDelMivRejQty,
				SUM(rd.TotalDelMrvRejQty) AS TotalDelMrvRejQty,
                SUM(li.NISQty) AS NISQty,
                SUM(li.RejectQty) AS RejectQty
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
                Items.Hold,
				Items.ExpiredDate,
                li.LocItemID, -- Group by LocItemID
                li.LocationID -- Group by LocationID
        )
        SELECT 
            p.ArrivalDate,
			pl.ArchiveNO,
			pl.MARDate,
			pl.OPINO,
			pl.PLNO,
            pl.Project,
            po.PoName,
            v.VendorName AS Vendor,
            fi.ItemId,
			li.ParentLocItemID,
            pl.PLName,
            p.PK,
            Items.ItemOfPk,
			Items.ExpiredDate,
            fi.Tag,
            fi.Description,
            u.UnitName,
            ISNULL(SUM(Items.Qty), 0) AS QtyPL,
            ISNULL(SUM(fi.Qty),0) AS QtyInLoc, 
            ISNULL(SUM(fi.BalanceWithRejectAndNIS),0) AS BalanceWithRejectAndNIS,
			ISNULL(SUM(fi.BalanceWithReject),0) AS BalanceWithReject,
            ISNULL(SUM(fi.Balance),0) AS Balance,
            ISNULL(SUM(fi.Inventory),0) AS Inventory,
            d.DesciplineName AS Discipline,
            sc.ScopeName AS Scope,
            fi.HeatNo,
            fi.BatchNo,
            fi.Remark,
            fi.Hold,
			ISNULL(SUM(fi.TotalReturnAcceptQty),0) AS ReturnQty,
            ISNULL(SUM(fi.ReqMivQty),0) AS ReqMivQty,
            ISNULL(SUM(fi.DelMivQty),0) AS DelMivQty,
            ISNULL(SUM(fi.ReserveMivQty),0) AS ReserveMivQty,
			ISNULL(SUM(fi.NISQty), 0) AS NISQty, 
			ISNULL(SUM(fi.RejectQty), 0) AS RejectQty, 
			ISNULL(SUM(fi.TotalDelMivRejQty), 0) AS DelMivRejQty, 
			ISNULL(SUM(fi.TotalDelMrvRejQty), 0) AS DelMrvRejQty, 
			ISNULL(SUM(li.OverQty), 0) AS OverQty, 
			ISNULL(SUM(li.ShortageQty), 0) AS ShortageQty, 
			ISNULL(SUM(li.DamageQty), 0) AS DamageQty, 
            s.SupplierName AS Supplier, -- Adding SupplierName from Supplier table
            fi.LocItemID, -- Add LocItemID to final select
            loc.LocationName, -- Add LocationName from Location table
			loc.LocationID
        FROM 
            CTE_FilteredItems AS fi
        INNER JOIN Items ON fi.ItemId = Items.ItemId
        LEFT OUTER JOIN LocItems AS li ON fi.LocItemID = li.LocItemID -- Join LocItems for LocItemID
        LEFT OUTER JOIN Locations AS loc ON li.LocationID = loc.LocationID -- Join Locations for LocationName
        LEFT OUTER JOIN Packages AS p ON Items.PKID = p.PKID
        LEFT OUTER JOIN PackingLists AS pl ON p.PLId = pl.PLId
        LEFT OUTER JOIN Pos AS po ON pl.PoId = po.PoId
        LEFT OUTER JOIN Units AS u ON Items.UnitID = u.UnitID
        LEFT OUTER JOIN Vendors AS v ON pl.VendorId = v.VendorID
        LEFT OUTER JOIN Desciplines AS d ON pl.DesciplineId = d.DesciplineId
        LEFT OUTER JOIN Scopes AS sc ON Items.ScopeID = sc.ScopeID
        LEFT OUTER JOIN Suppliers AS s ON pl.SupplierId = s.SupplierId -- Joining Supplier table
        GROUP BY 
            p.ArrivalDate,
		    pl.ArchiveNO,
			pl.MARDate,
			pl.OPINO,
            pl.PLNO,
            pl.Project,
            po.PoName,
            v.VendorName,
            fi.ItemId,
			li.ParentLocItemID,
            pl.PLName,
            p.PK,
            Items.ItemOfPk,
			Items.ExpiredDate,
            fi.Tag,
            fi.Description,
            u.UnitName,
            sc.ScopeName,
            d.DesciplineName,
            fi.HeatNo,
            fi.BatchNo,
            fi.Remark,
            fi.Hold,
            pl.DesciplineId,
            s.SupplierName, -- Adding Group By for SupplierName
            fi.LocItemID, -- Group by LocItemID
            loc.LocationName, -- Group by LocationName
            loc.LocationID
		--ORDER BY fi.ItemId
    END TRY
    BEGIN CATCH
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
/****** Object:  StoredProcedure [dbo].[Search_ChangeLocitem5]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Search_ChangeLocitem5]
AS
BEGIN
    BEGIN TRY
        SET NOCOUNT ON;

        ;WITH CTE_RequestData AS
        (
            SELECT 
                li.LocItemID,
                --li.LocationID, -- Add LocationID
                SUM(req.ReserveMivQty) AS TotalReserveMivQty,
                SUM(req.DelMivQty) AS TotalDelMivQty,
				SUM(req.DelMivRejQty) AS TotalDelMivRejQty,
                SUM(li.NISQty) AS NISQty,
				SUM(li.OverQty) AS OverQty,
				SUM(li.ShortageQty) AS ShortageQty,
				SUM(li.DamageQty) AS DamageQty,
                SUM(li.RejectQty) AS RejectQty,
                SUM(req.DelMrvQty * -1) AS TotalReturnAcceptQty,
				SUM(req.DelMrvRejQty * -1) AS TotalDelMrvRejQty,
                SUM(req.ReqMivQty) AS TotalReqMivQty
            FROM 
                LocItems AS li
            LEFT OUTER JOIN Requests AS req ON li.LocItemID = req.LocItemID
            GROUP BY 
                li.LocItemID--,
                --li.LocationID -- Add LocationID to group by
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
				Items.ExpiredDate,
                li.LocItemID, -- Add LocItemID
                li.LocationID, -- Add LocationID
                ISNULL(SUM(li.Qty), 0) AS Qty, 
				ISNULL(SUM(li.Qty), 0) 
                    - ISNULL(SUM(rd.TotalReserveMivQty), 0) 
                    - ISNULL(SUM(rd.TotalDelMivQty), 0) 
                    - ISNULL(SUM(rd.TotalReturnAcceptQty), 0)
					- ISNULL(SUM(rd.TotalDelMivRejQty),0)
					- ISNULL(SUM(rd.TotalDelMrvRejQty),0) AS BalanceWithRejectAndNIS,
                ISNULL(SUM(li.Qty), 0) 
                    - ISNULL(SUM(rd.TotalReserveMivQty), 0) 
                    - ISNULL(SUM(rd.TotalDelMivQty), 0) 
                    - ISNULL(SUM(li.NISQty), 0) 
                    - ISNULL(SUM(rd.TotalReturnAcceptQty), 0)
					- ISNULL(SUM(rd.TotalDelMivRejQty),0)
					- ISNULL(SUM(rd.TotalDelMrvRejQty),0) AS BalanceWithReject,
			    ISNULL(SUM(li.Qty), 0) 
                    - ISNULL(SUM(rd.TotalReserveMivQty), 0) 
                    - ISNULL(SUM(rd.TotalDelMivQty), 0) 
                    - ISNULL(SUM(li.NISQty), 0) 
                    - ISNULL(SUM(li.RejectQty), 0) 
                    - ISNULL(SUM(rd.TotalReturnAcceptQty), 0) AS Balance,
                ISNULL(SUM(li.Qty), 0) 
                    - ISNULL(SUM(rd.TotalDelMivQty), 0) 
                    - ISNULL(SUM(li.NISQty), 0) 
                    - ISNULL(SUM(li.RejectQty), 0) 
                    - ISNULL(SUM(rd.TotalReturnAcceptQty), 0) AS Inventory,
                SUM(rd.TotalReturnAcceptQty) AS TotalReturnAcceptQty,
                SUM(rd.TotalReqMivQty) AS ReqMivQty,
                SUM(rd.TotalDelMivQty) AS DelMivQty,
                SUM(rd.TotalReserveMivQty) AS ReserveMivQty,
				SUM(rd.TotalDelMivRejQty) AS TotalDelMivRejQty,
				SUM(rd.TotalDelMrvRejQty) AS TotalDelMrvRejQty,
                SUM(li.NISQty) AS NISQty,
                SUM(li.RejectQty) AS RejectQty
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
                Items.Hold,
				Items.ExpiredDate,
                li.LocItemID, -- Group by LocItemID
                li.LocationID -- Group by LocationID
        )
        SELECT 
            p.ArrivalDate,
			pl.ArchiveNO,
			pl.MARDate,
			pl.OPINO,
			pl.PLNO,
            pl.Project,
            po.PoName,
            v.VendorName AS Vendor,
            fi.ItemId,
			li.ParentLocItemID,
			li.RemarkLocitemID,
            pl.PLName,
            p.PK,
            Items.ItemOfPk,
			Items.ExpiredDate,
            fi.Tag,
            fi.Description,
            u.UnitName,
            ISNULL(SUM(Items.Qty), 0) AS QtyPL,
            ISNULL(SUM(fi.Qty),0) AS QtyInLoc, 
            ISNULL(SUM(fi.BalanceWithRejectAndNIS),0) AS BalanceWithRejectAndNIS,
			ISNULL(SUM(fi.BalanceWithReject),0) AS BalanceWithReject,
            ISNULL(SUM(fi.Balance),0) AS Balance,
            ISNULL(SUM(fi.Inventory),0) AS Inventory,
            d.DesciplineName AS Discipline,
            sc.ScopeName AS Scope,
            fi.HeatNo,
            fi.BatchNo,
            fi.Remark,
            fi.Hold,
			ISNULL(SUM(fi.TotalReturnAcceptQty),0) AS ReturnQty,
            ISNULL(SUM(fi.ReqMivQty),0) AS ReqMivQty,
            ISNULL(SUM(fi.DelMivQty),0) AS DelMivQty,
            ISNULL(SUM(fi.ReserveMivQty),0) AS ReserveMivQty,
			ISNULL(SUM(fi.NISQty), 0) AS NISQty, 
			ISNULL(SUM(fi.RejectQty), 0) AS RejectQty, 
			ISNULL(SUM(fi.TotalDelMivRejQty), 0) AS DelMivRejQty, 
			ISNULL(SUM(fi.TotalDelMrvRejQty), 0) AS DelMrvRejQty, 
			ISNULL(SUM(li.OverQty), 0) AS OverQty, 
			ISNULL(SUM(li.ShortageQty), 0) AS ShortageQty, 
			ISNULL(SUM(li.DamageQty), 0) AS DamageQty, 
            s.SupplierName AS Supplier, -- Adding SupplierName from Supplier table
            fi.LocItemID, -- Add LocItemID to final select
            loc.LocationName, -- Add LocationName from Location table
			loc.LocationID
        FROM 
            CTE_FilteredItems AS fi
        INNER JOIN Items ON fi.ItemId = Items.ItemId
        LEFT OUTER JOIN LocItems AS li ON fi.LocItemID = li.LocItemID -- Join LocItems for LocItemID
        LEFT OUTER JOIN Locations AS loc ON li.LocationID = loc.LocationID -- Join Locations for LocationName
        LEFT OUTER JOIN Packages AS p ON Items.PKID = p.PKID
        LEFT OUTER JOIN PackingLists AS pl ON p.PLId = pl.PLId
        LEFT OUTER JOIN Pos AS po ON pl.PoId = po.PoId
        LEFT OUTER JOIN Units AS u ON Items.UnitID = u.UnitID
        LEFT OUTER JOIN Vendors AS v ON pl.VendorId = v.VendorID
        LEFT OUTER JOIN Desciplines AS d ON pl.DesciplineId = d.DesciplineId
        LEFT OUTER JOIN Scopes AS sc ON Items.ScopeID = sc.ScopeID
        LEFT OUTER JOIN Suppliers AS s ON pl.SupplierId = s.SupplierId -- Joining Supplier table
        GROUP BY 
            p.ArrivalDate,
		    pl.ArchiveNO,
			pl.MARDate,
			pl.OPINO,
            pl.PLNO,
            pl.Project,
            po.PoName,
            v.VendorName,
            fi.ItemId,
			li.ParentLocItemID,
			li.RemarkLocitemID,
            pl.PLName,
            p.PK,
            Items.ItemOfPk,
			Items.ExpiredDate,
            fi.Tag,
            fi.Description,
            u.UnitName,
            sc.ScopeName,
            d.DesciplineName,
            fi.HeatNo,
            fi.BatchNo,
            fi.Remark,
            fi.Hold,
            pl.DesciplineId,
            s.SupplierName, -- Adding Group By for SupplierName
            fi.LocItemID, -- Group by LocItemID
            loc.LocationName, -- Group by LocationName
            loc.LocationID
		--ORDER BY fi.ItemId
    END TRY
    BEGIN CATCH
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
/****** Object:  StoredProcedure [dbo].[Search_Item]    Script Date: 4/10/2025 3:45:05 PM ******/
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
                SUM(req.DelMrvQty * -1) AS TotalReturnAcceptQty, 
                SUM(req.ReqMivQty) AS TotalReqMivQty
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
                    + ISNULL(SUM(rd.TotalReturnAcceptQty), 0) AS Inventory,
                SUM(rd.TotalReturnAcceptQty) AS TotalReturnAcceptQty,
                SUM(rd.TotalReqMivQty) AS ReqMivQty,
                SUM(rd.TotalDelMivQty) AS DelMivQty,
                SUM(rd.TotalReserveMivQty) AS ReserveMivQty,
                SUM(li.NISQty) AS NISQty,
                SUM(li.RejectQty) AS RejectQty
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
			pl.ArchiveNO,
			pl.MARDate,
			pl.OPINO,
			pl.PLNO,
            pl.Project,
            po.PoName,
            v.VendorName AS Vendor,
            fi.ItemId,
            pl.PLName,
            p.PK,
            Items.ItemOfPk,
            fi.Tag,
            fi.Description,
            u.UnitName,
            ISNULL(SUM(Items.Qty), 0) AS QtyPL,
            MAX(fi.Qty) AS QtyInLoc, 
            MAX(fi.Balance) AS Balance,
            MAX(fi.Inventory) AS Inventory,
            d.DesciplineName AS DisciplineName,
            sc.ScopeName AS ScopeName,
            fi.HeatNo,
            fi.BatchNo,
            fi.Remark,
            fi.Hold,
			MAX(fi.TotalReturnAcceptQty) AS TotalReturnAcceptQty,
            MAX(fi.ReqMivQty) AS ReqMivQty,
            MAX(fi.DelMivQty) AS DelMivQty,
            MAX(fi.ReserveMivQty) AS ReserveMivQty,
            MAX(fi.NISQty) AS NISQty,
            MAX(fi.RejectQty) AS RejectQty,
            s.SupplierName -- Adding SupplierName from Supplier table
        FROM 
            CTE_FilteredItems AS fi
        INNER JOIN Items ON fi.ItemId = Items.ItemId
        LEFT OUTER JOIN Packages AS p ON Items.PKID = p.PKID
        LEFT OUTER JOIN PackingLists AS pl ON p.PLId = pl.PLId
        LEFT OUTER JOIN Pos AS po ON pl.PoId = po.PoId
        LEFT OUTER JOIN Units AS u ON Items.UnitID = u.UnitID
        LEFT OUTER JOIN Vendors AS v ON pl.VendorId = v.VendorID
        LEFT OUTER JOIN Desciplines AS d ON pl.DesciplineId = d.DesciplineId
        LEFT OUTER JOIN Scopes AS sc ON Items.ScopeID = sc.ScopeID
        LEFT OUTER JOIN Suppliers AS s ON pl.SupplierId = s.SupplierId -- Joining Supplier table
        GROUP BY 
            p.ArrivalDate,
		    pl.ArchiveNO,
			pl.MARDate,
			pl.OPINO,
            pl.PLNO,
            pl.Project,
            po.PoName,
            v.VendorName,
            fi.ItemId,
            pl.PLName,
            p.PK,
            Items.ItemOfPk,
            fi.Tag,
            fi.Description,
            u.UnitName,
            sc.ScopeName,
            d.DesciplineName,
            fi.HeatNo,
            fi.BatchNo,
            fi.Remark,
            fi.Hold,
            pl.DesciplineId,
            s.SupplierName -- Adding Group By for SupplierName
        ORDER BY fi.ItemId
        OFFSET @PageSize * (@PageNumber - 1) ROWS
        FETCH NEXT @PageSize ROWS ONLY;
    END TRY
    BEGIN CATCH
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
/****** Object:  StoredProcedure [dbo].[Search_Item2]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Search_Item2]
AS
BEGIN
    BEGIN TRY
        SET NOCOUNT ON;

        ;WITH CTE_RequestData AS
        (
            SELECT 
                li.LocItemID,
				SUM(req.ReqMivQty) AS TotalReqMivQty,
                SUM(req.ReserveMivQty) AS TotalReserveMivQty,
                SUM(req.DelMivQty) AS TotalDelMivQty,
                SUM(li.NISQty) AS NISQty,
                SUM(li.RejectQty) AS RejectQty,
                SUM(req.DelMrvQty) AS TotalReturnAcceptQty
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
                --Items.Tag,
                --Items.Description,
                --Items.HeatNo,
                --Items.BatchNo,
                --Items.Remark,
                --Items.Hold,
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
                    + ISNULL(SUM(rd.TotalReturnAcceptQty), 0) AS Inventory,
                SUM(rd.TotalReqMivQty) AS ReqMivQty,
                SUM(rd.TotalDelMivQty) AS DelMivQty,
                SUM(rd.TotalReserveMivQty) AS ReserveMivQty,
				SUM(rd.TotalReturnAcceptQty) AS TotalReturnAcceptQty,
                SUM(li.NISQty) AS NISQty,
                SUM(li.RejectQty) AS RejectQty
            FROM 
                Items
            LEFT OUTER JOIN LocItems AS li ON Items.ItemId = li.ItemId
            LEFT OUTER JOIN CTE_RequestData AS rd ON li.LocItemID = rd.LocItemID
            GROUP BY 
                Items.ItemId
                --Items.Tag,
                --Items.Description,
                --Items.HeatNo,
                --Items.BatchNo,
                --Items.Remark,
                --Items.Hold
        )
        SELECT 
            MAX(p.ArrivalDate) AS ArrivalDate,
			MAX(pl.ArchiveNO) AS ArchiveNO,
			--MAX(pl.MARDate) AS MARDate,
			--MAX(pl.OPINO) AS OPINO,
			--MAX(pl.PLNO) AS PLNO,
            MAX(pl.Project) AS Project,
            MAX(po.PoName) AS PoName,
            MAX(v.VendorName) AS Vendor,
			MAX(d.DesciplineName)AS Discipline,
            MAX(sc.ScopeName) AS Scope,
			MAX(pl.PLName) AS PLName,
            fi.ItemId AS ItemId,
            MAX(p.PK) AS PK,
            MAX(Items.ItemOfPk) AS ItemOfPk,
            MAX(Items.Tag) AS Tag,
            MAX(Items.Description) AS Description,
            MAX(u.UnitName) AS UnitName,
            ISNULL(SUM(Items.Qty), 0) AS QtyPL,
            ISNULL(SUM(fi.Qty), 0) AS QtyInLoc, 
            ISNULL(SUM(fi.Balance), 0) AS Balance,
            ISNULL(SUM(fi.Inventory), 0) AS Inventory,
            MAX(Items.HeatNo) AS HeatNo,
            MAX(Items.BatchNo) AS BatchNo,
            MAX(Items.Remark) AS Remark,
            --MAX(Items.Hold) AS Hold,
			MAX(CAST(Items.Hold AS INT)) AS Hold,
			ISNULL(SUM(fi.TotalReturnAcceptQty), 0) AS TotalReturnAcceptQty,
            ISNULL(SUM(fi.ReqMivQty), 0) AS ReqMivQty,
            ISNULL(SUM(fi.DelMivQty), 0) AS DelMivQty,
            ISNULL(SUM(fi.ReserveMivQty), 0) AS ReserveMivQty,
            ISNULL(SUM(fi.NISQty), 0) AS NISQty,
            ISNULL(SUM(fi.RejectQty), 0) AS RejectQty,
            MAX(s.SupplierName) AS Supplier 
        FROM 
            CTE_FilteredItems AS fi
        INNER JOIN Items ON fi.ItemId = Items.ItemId
        LEFT OUTER JOIN Packages AS p ON Items.PKID = p.PKID
        LEFT OUTER JOIN PackingLists AS pl ON p.PLId = pl.PLId
        LEFT OUTER JOIN Pos AS po ON pl.PoId = po.PoId
        LEFT OUTER JOIN Units AS u ON Items.UnitID = u.UnitID
        LEFT OUTER JOIN Vendors AS v ON pl.VendorId = v.VendorID
        LEFT OUTER JOIN Desciplines AS d ON pl.DesciplineId = d.DesciplineId
        LEFT OUTER JOIN Scopes AS sc ON Items.ScopeID = sc.ScopeID
        LEFT OUTER JOIN Suppliers AS s ON pl.SupplierId = s.SupplierId -- Joining Supplier table
        GROUP BY 
            --p.ArrivalDate,
		    --pl.ArchiveNO,
			--pl.MARDate,
			--pl.OPINO,
            --pl.PLNO,
            --pl.Project,
            --po.PoName,
            --v.VendorName,
            fi.ItemId
            --pl.PLName,
            --p.PK,
            --Items.ItemOfPk,
            --fi.Tag,
            --fi.Description,
            --u.UnitName,
            --sc.ScopeName,
            --d.DesciplineName,
            --Items.HeatNo,
            --Items.BatchNo,
            --Items.Remark,
            --Items.Hold
            --pl.DesciplineId,
            --s.SupplierName -- Adding Group By for SupplierName
        --ORDER BY fi.ItemId
    END TRY
    BEGIN CATCH
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
/****** Object:  StoredProcedure [dbo].[Search_Item3]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Search_Item3]
AS
BEGIN
    BEGIN TRY
        SET NOCOUNT ON;

        ;WITH CTE_RequestData AS
        (
            SELECT 
                li.LocItemID,
                SUM(req.ReqMivQty) AS TotalReqMivQty,
                SUM(req.ReserveMivQty) AS TotalReserveMivQty,
                SUM(req.DelMivQty) AS TotalDelMivQty,
                SUM(li.NISQty) AS NISQty,
                SUM(li.RejectQty) AS RejectQty,
                SUM(req.DelMrvQty) AS TotalReturnAcceptQty
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
                Items.ItemId
        ),
        CTE_AggregatedData AS
        (
            SELECT 
                fi.ItemId,
                SUM(fi.Qty) AS QtyInLoc,
                SUM(fi.Balance) AS TotalBalance,
                SUM(fi.Inventory) AS TotalInventory
            FROM 
                CTE_FilteredItems AS fi
            GROUP BY 
                fi.ItemId
        )
        SELECT 
            MAX(p.ArrivalDate) AS ArrivalDate,
            MAX(pl.ArchiveNO) AS ArchiveNO,
            MAX(pl.MARDate) AS MARDate,
            MAX(pl.OPINO) AS OPINO,
            MAX(pl.PLNO) AS PLNO,
            MAX(pl.Project) AS Project,
            MAX(po.PoName) AS PoName,
            MAX(v.VendorName) AS Vendor,
            MAX(d.DesciplineName) AS Discipline,
            MAX(sc.ScopeName) AS Scope,
            MAX(pl.PLName) AS PLName,
            ag.ItemId AS ItemId,
            MAX(p.PK) AS PK,
            MAX(Items.ItemOfPk) AS ItemOfPk,
            MAX(Items.Tag) AS Tag,
            MAX(Items.Description) AS Description,
            MAX(u.UnitName) AS UnitName,
            ISNULL(SUM(Items.Qty), 0) AS QtyPL,
            ag.QtyInLoc,
            ag.TotalBalance AS Balance,
            ag.TotalInventory AS Inventory,
            MAX(Items.HeatNo) AS HeatNo,
            MAX(Items.BatchNo) AS BatchNo,
            MAX(Items.Remark) AS Remark,
            MAX(CAST(Items.Hold AS INT)) AS Hold,
            MAX(s.SupplierName) AS Supplier
        FROM 
            CTE_AggregatedData AS ag
        INNER JOIN Items ON ag.ItemId = Items.ItemId
        LEFT OUTER JOIN Packages AS p ON Items.PKID = p.PKID
        LEFT OUTER JOIN PackingLists AS pl ON p.PLId = pl.PLId
        LEFT OUTER JOIN Pos AS po ON pl.PoId = po.PoId
        LEFT OUTER JOIN Units AS u ON Items.UnitID = u.UnitID
        LEFT OUTER JOIN Vendors AS v ON pl.VendorId = v.VendorID
        LEFT OUTER JOIN Desciplines AS d ON pl.DesciplineId = d.DesciplineId
        LEFT OUTER JOIN Scopes AS sc ON Items.ScopeID = sc.ScopeID
        LEFT OUTER JOIN Suppliers AS s ON pl.SupplierId = s.SupplierId
        GROUP BY 
		    ag.QtyInLoc,
            ag.TotalBalance,
            ag.TotalInventory,
            ag.ItemId;
    END TRY
    BEGIN CATCH
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
/****** Object:  StoredProcedure [dbo].[Search_LocItem]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Search_LocItem]
AS
BEGIN
    BEGIN TRY
        SET NOCOUNT ON;

        ;WITH CTE_RequestData AS
        (
            SELECT 
                li.LocItemID,
                li.LocationID, -- Add LocationID
                SUM(req.ReserveMivQty) AS TotalReserveMivQty,
                SUM(req.DelMivQty) AS TotalDelMivQty,
                SUM(li.NISQty) AS NISQty,
                SUM(li.RejectQty) AS RejectQty,
                SUM(req.DelMrvQty) AS TotalReturnAcceptQty, 
                SUM(req.ReqMivQty) AS TotalReqMivQty
            FROM 
                LocItems AS li
            LEFT OUTER JOIN Requests AS req ON li.LocItemID = req.LocItemID
            GROUP BY 
                li.LocItemID,
                li.LocationID -- Add LocationID to group by
        ),
        CTE_FilteredItems AS
        (
            SELECT 
                Items.ItemId,
                --Items.ScopeID,
                --Items.UnitID,
                --Items.PKID,
                --Items.Tag,
                --Items.Description,
                --Items.HeatNo,
                --Items.BatchNo,
                --Items.Remark,
                --Items.Hold,
                li.LocItemID, -- Add LocItemID
                li.LocationID, -- Add LocationID
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
                    + ISNULL(SUM(rd.TotalReturnAcceptQty), 0) AS Inventory,
                SUM(rd.TotalReturnAcceptQty) AS TotalReturnAcceptQty,
                SUM(rd.TotalReqMivQty) AS ReqMivQty,
                SUM(rd.TotalDelMivQty) AS DelMivQty,
                SUM(rd.TotalReserveMivQty) AS ReserveMivQty,
                SUM(li.NISQty) AS NISQty,
                SUM(li.RejectQty) AS RejectQty
            FROM 
                Items
            LEFT OUTER JOIN LocItems AS li ON Items.ItemId = li.ItemId
            LEFT OUTER JOIN CTE_RequestData AS rd ON li.LocItemID = rd.LocItemID
            GROUP BY 
                Items.ItemId,
                --Items.ScopeID,
                --Items.UnitID,
                --Items.PKID,
                --Items.Tag,
                --Items.Description,
                --Items.HeatNo,
                --Items.BatchNo,
                --Items.Remark,
                --Items.Hold,
                li.LocItemID, -- Group by LocItemID
                li.LocationID -- Group by LocationID
        )
        SELECT 
            p.ArrivalDate,
			pl.ArchiveNO,
			pl.EnteredDate,
			pl.MARDate,
			p.MSRNO,
			pl.OPINO,
			pl.PLNO,
            pl.Project,
            po.PoName,
            v.VendorName AS Vendor,
            fi.ItemId,
            pl.PLName,
            p.PK,
            Items.ItemOfPk,
            Items.Tag,
            Items.Description,
            u.UnitName,
            ISNULL(SUM(Items.Qty), 0) AS QtyPL,
            ISNULL(SUM(fi.Qty),0) AS QtyInLoc, 
            ISNULL(SUM(fi.Balance),0) AS Balance,
            ISNULL(SUM(fi.Inventory),0) AS Inventory,
            d.DesciplineName AS Discipline,
            sc.ScopeName AS Scope,
            Items.HeatNo,
            Items.BatchNo,
            Items.Remark,
            Items.Hold,
			ISNULL(SUM(fi.TotalReturnAcceptQty),0) AS TotalReturnAcceptQty,
            ISNULL(SUM(fi.ReqMivQty),0) AS ReqMivQty,
            ISNULL(SUM(fi.DelMivQty),0) AS DelMivQty,
            ISNULL(SUM(fi.ReserveMivQty),0) AS ReserveMivQty,
            ISNULL(SUM(fi.NISQty),0) AS NISQty,
            ISNULL(SUM(fi.RejectQty),0) AS RejectQty,
            s.SupplierName AS Supplier, -- Adding SupplierName from Supplier table
            fi.LocItemID, -- Add LocItemID to final select
            loc.LocationName, -- Add LocationName from Location table
            irr.IrnName as IRN,
			mrr.MrName as Mr
	   FROM 
            CTE_FilteredItems AS fi
        INNER JOIN Items ON fi.ItemId = Items.ItemId
        LEFT OUTER JOIN LocItems AS li ON fi.LocItemID = li.LocItemID -- Join LocItems for LocItemID
        LEFT OUTER JOIN Locations AS loc ON fi.LocationID = loc.LocationID -- Join Locations for LocationName
        LEFT OUTER JOIN Packages AS p ON Items.PKID = p.PKID
        LEFT OUTER JOIN PackingLists AS pl ON p.PLId = pl.PLId
		left outer join Irns as irr on irr.IrnId=pl.IrnId
        LEFT OUTER JOIN Pos AS po ON pl.PoId = po.PoId
        LEFT OUTER JOIN Units AS u ON Items.UnitID = u.UnitID
        LEFT OUTER JOIN Vendors AS v ON pl.VendorId = v.VendorID
        LEFT OUTER JOIN Desciplines AS d ON pl.DesciplineId = d.DesciplineId
        LEFT OUTER JOIN Scopes AS sc ON Items.ScopeID = sc.ScopeID
        LEFT OUTER JOIN Suppliers AS s ON pl.SupplierId = s.SupplierId -- Joining Supplier table
        left outer join Mrs as mrr on mrr.MrId=pl.MrId
		GROUP BY 
            p.ArrivalDate,
			pl.EnteredDate,
			mrr.MrName,
		    pl.ArchiveNO,
			irr.IrnName,
			pl.MARDate,
			p.MSRNO,
			pl.OPINO,
            pl.PLNO,
            pl.Project,
            po.PoName,
            v.VendorName,
            fi.ItemId,
            pl.PLName,
            p.PK,
            Items.ItemOfPk,
            Items.Tag,
            Items.Description,
            u.UnitName,
            sc.ScopeName,
            d.DesciplineName,
            Items.HeatNo,
            Items.BatchNo,
            Items.Remark,
            Items.Hold,
            pl.DesciplineId,
            s.SupplierName, -- Adding Group By for SupplierName
            fi.LocItemID, -- Group by LocItemID
            loc.LocationName -- Group by LocationName
        --ORDER BY fi.ItemId
    END TRY
    BEGIN CATCH
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
/****** Object:  StoredProcedure [dbo].[Search_Material_Issue_Voucher]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Search_Material_Issue_Voucher_NOLOCK]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Search_Material_Issue_Voucher_NOLOCK2]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Search_Material_Issue_Voucher2]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Search_Material_Issue_Voucher2025]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Search_Material_Issue_Voucher2025]
AS
BEGIN
    BEGIN TRY
        SET NOCOUNT ON;

        -- ایجاد RequestData با SELECT INTO و فیلتر مناسب
        SELECT 
            li.LocItemID,
            SUM(req.ReserveMivQty) AS TotalReserveMivQty,
            SUM(req.DelMivQty) AS TotalDelMivQty,
            SUM(req.DelMivRejQty) AS TotalDelMivRejQty,
            SUM(li.NISQty) AS NISQty,
            SUM(li.OverQty) AS OverQty,
            SUM(li.ShortageQty) AS ShortageQty,
            SUM(li.DamageQty) AS DamageQty,
            SUM(li.RejectQty) AS RejectQty,
            SUM(req.DelMrvQty * -1) AS TotalReturnAcceptQty,
            SUM(req.DelMrvRejQty * -1) AS TotalDelMrvRejQty
        INTO #RequestData
        FROM 
            LocItems AS li WITH (NOLOCK)
        LEFT OUTER JOIN Requests AS req WITH (NOLOCK) ON li.LocItemID = req.LocItemID
        GROUP BY li.LocItemID;

        -- ایجاد ایندکس برای RequestData
        CREATE NONCLUSTERED INDEX IX_LocItemID ON #RequestData (LocItemID);

        -- ایجاد FilteredItems با SELECT INTO
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
            ISNULL(SUM(rd.TotalReturnAcceptQty), 0) AS mrrv,
            ISNULL(SUM(rd.TotalDelMivQty), 0) AS dell,
            ISNULL(SUM(rd.TotalReserveMivQty), 0) AS ress,
            ISNULL(SUM(li.Qty), 0) AS Qty,
            ISNULL(SUM(li.Qty), 0) 
                - ISNULL(SUM(rd.TotalReserveMivQty), 0) 
                - ISNULL(SUM(rd.TotalDelMivQty), 0) 
                - ISNULL(SUM(li.NISQty), 0) 
                - ISNULL(SUM(li.RejectQty), 0) 
                - ISNULL(SUM(rd.TotalReturnAcceptQty), 0) AS Balance,
            ISNULL(SUM(li.Qty), 0) 
                - ISNULL(SUM(rd.TotalDelMivQty), 0) 
                - ISNULL(SUM(li.NISQty), 0) 
                - ISNULL(SUM(li.RejectQty), 0) 
                - ISNULL(SUM(rd.TotalReturnAcceptQty), 0) AS Inventory
        INTO #FilteredItems
        FROM 
            Items WITH (NOLOCK)
        INNER JOIN LocItems AS li WITH (NOLOCK) ON Items.ItemId = li.ItemId
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
            Items.Hold;

        -- ایجاد ایندکس برای FilteredItems
        CREATE NONCLUSTERED INDEX IX_ItemId ON #FilteredItems (ItemId);

        -- اجرای SELECT نهایی
        SELECT 
            p.ArrivalDate,
            pl.Project,
            pos.PoName AS Po,
            pl.VendorId AS Vendor,
            fi.ItemId,
            pl.PLName,
            p.PK,
            Items.ItemOfPk,
            fi.Tag,
            fi.Description,
            units.UnitName AS Unit,
            ISNULL(SUM(Items.Qty), 0) AS QtyPL,
            ISNULL(SUM(fi.Qty), 0) AS QtyInLoc, 
            ISNULL(SUM(fi.Balance), 0) AS Balance,
            ISNULL(SUM(fi.Inventory), 0) AS Inventory,
            ISNULL(SUM(fi.mrrv), 0) AS TotalMrv,
            ISNULL(SUM(fi.dell), 0) AS TotalMiv,
            ISNULL(SUM(fi.ress), 0) AS TotalReserve,
            desciplines.DesciplineName AS Discipline,
            scopes.ScopeName AS Scope,
            fi.HeatNo,
            fi.BatchNo,
            fi.Remark,
            fi.Hold
        FROM 
            #FilteredItems AS fi
        INNER JOIN Items ON fi.ItemId = Items.ItemId
        LEFT OUTER JOIN Packages AS p ON Items.PKID = p.PKID
        LEFT OUTER JOIN PackingLists AS pl ON p.PLId = pl.PLId
        LEFT OUTER JOIN Pos AS pos ON pos.PoId = pl.PoId
        LEFT OUTER JOIN Units AS units ON units.UnitID = Items.UnitID
        LEFT OUTER JOIN Scopes AS scopes ON scopes.ScopeID = Items.ScopeID
        LEFT OUTER JOIN Desciplines AS desciplines ON desciplines.DesciplineId = pl.DesciplineId
        WHERE
            fi.Balance > 0
        GROUP BY 
            p.ArrivalDate,
            pl.Project,
            pos.PoName,
            pl.VendorId,
            fi.ItemId,
            pl.PLName,
            p.PK,
            Items.ItemOfPk,
            fi.Tag,
            fi.Description,
            units.UnitName,
            scopes.ScopeName,
            fi.HeatNo,
            fi.BatchNo,
            fi.Remark,
            fi.Hold,
            desciplines.DesciplineName
        ORDER BY fi.ItemId;

        -- حذف جدول‌های موقت
        DROP TABLE #RequestData;
        DROP TABLE #FilteredItems;

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
/****** Object:  StoredProcedure [dbo].[Search_Material_Issue_Voucher3]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Search_Material_Issue_Voucher4]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Search_Material_Issue_Voucher5]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Search_Material_Issue_Voucher5]
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
            pos.PoName AS Po,
            pl.VendorId AS Vendor,
            fi.ItemId,
            pl.PLName,
            p.PK,
            Items.ItemOfPk,
            fi.Tag,
            fi.Description,
            units.UnitName AS Unit,
            ISNULL(SUM(Items.Qty), 0) AS QtyPL,
            MAX(fi.Qty) AS QtyInLoc, 
            MAX(fi.Balance) AS Balance,
            MAX(fi.Inventory) AS Inventory,
            desciplines.DesciplineName AS Discipline,
            scopes.ScopeName AS Scope,
            fi.HeatNo,
            fi.BatchNo,
            fi.Remark,
            fi.Hold
        FROM 
            CTE_FilteredItems AS fi
        INNER JOIN Items ON fi.ItemId = Items.ItemId
        LEFT OUTER JOIN Packages AS p ON Items.PKID = p.PKID
        LEFT OUTER JOIN PackingLists AS pl ON p.PLId = pl.PLId
		LEFT OUTER JOIN Pos AS pos ON pos.PoId = pl.PoId
	    LEFT OUTER JOIN Units AS units ON units.UnitID = Items.UnitID
		LEFT OUTER JOIN Scopes AS scopes ON scopes.ScopeID = Items.ScopeID
		LEFT OUTER JOIN Desciplines AS desciplines ON desciplines.DesciplineId = pl.DesciplineId
        GROUP BY 
            p.ArrivalDate,
            pl.Project,
            pos.PoName ,
			pl.VendorId,
            fi.ItemId,
            pl.PLName,
            p.PK,
            Items.ItemOfPk,
            fi.Tag,
            fi.Description,
            units.UnitName,
            scopes.ScopeName,
            fi.HeatNo,
            fi.BatchNo,
            fi.Remark,
            fi.Hold,
            desciplines.DesciplineName
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
/****** Object:  StoredProcedure [dbo].[Search_Material_Issue_Voucher6]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Search_Material_Issue_Voucher6]
--    @PageNumber INT = 1,
--    @PageSize INT = 100
AS
BEGIN
    BEGIN TRY
        SET NOCOUNT ON;


        ;WITH CTE_RequestData AS
        ( SELECT 
                li.LocItemID,
                SUM(req.ReserveMivQty) AS TotalReserveMivQty,
                SUM(req.DelMivQty) AS TotalDelMivQty,
				SUM(req.DelMivRejQty) AS TotalDelMivRejQty,
                SUM(li.NISQty) AS NISQty,
				SUM(li.OverQty) AS OverQty,
				SUM(li.ShortageQty) AS ShortageQty,
				SUM(li.DamageQty) AS DamageQty,
                SUM(li.RejectQty) AS RejectQty,
                SUM(req.DelMrvQty * -1) AS TotalReturnAcceptQty,
				SUM(req.DelMrvRejQty * -1) AS TotalDelMrvRejQty
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
				ISNULL(SUM(rd.TotalReturnAcceptQty),0) as mrrv,
				ISNULL(SUM(rd.TotalDelMivQty), 0) as dell,
				ISNULL(SUM(rd.TotalReserveMivQty),0) as ress,
                ISNULL(SUM(li.Qty), 0) AS Qty, 
                ISNULL(SUM(li.Qty), 0) 
                    - ISNULL(SUM(rd.TotalReserveMivQty), 0) 
                    - ISNULL(SUM(rd.TotalDelMivQty), 0) 
                    - ISNULL(SUM(li.NISQty), 0) 
                    - ISNULL(SUM(li.RejectQty), 0) 
                    - ISNULL(SUM(rd.TotalReturnAcceptQty), 0) AS Balance,
                ISNULL(SUM(li.Qty), 0) 
                    - ISNULL(SUM(rd.TotalDelMivQty), 0) 
                    - ISNULL(SUM(li.NISQty), 0) 
                    - ISNULL(SUM(li.RejectQty), 0) 
                    - ISNULL(SUM(rd.TotalReturnAcceptQty), 0) AS Inventory
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
            pos.PoName AS Po,
            pl.VendorId AS Vendor,
            fi.ItemId,
            pl.PLName,
            p.PK,
            Items.ItemOfPk,
            fi.Tag,
            fi.Description,
            units.UnitName AS Unit,
            ISNULL(SUM(Items.Qty), 0) AS QtyPL,
            ISNULL(SUM(fi.Qty),0) AS QtyInLoc, 
            ISNULL(SUM(fi.Balance),0) AS Balance,
            ISNULL(SUM(fi.Inventory),0) AS Inventory,
			ISNULL(SUM(fi.mrrv),0) AS TotalMrv,
			ISNULL(SUM(fi.dell),0) AS TotalMiv,
			ISNULL(SUM(fi.ress),0) AS TotalReserve,
            desciplines.DesciplineName AS Discipline,
            scopes.ScopeName AS Scope,
            fi.HeatNo,
            fi.BatchNo,
            fi.Remark,
            fi.Hold
        FROM 
            CTE_FilteredItems AS fi
        INNER JOIN Items ON fi.ItemId = Items.ItemId
        LEFT OUTER JOIN Packages AS p ON Items.PKID = p.PKID
        LEFT OUTER JOIN PackingLists AS pl ON p.PLId = pl.PLId
		LEFT OUTER JOIN Pos AS pos ON pos.PoId = pl.PoId
	    LEFT OUTER JOIN Units AS units ON units.UnitID = Items.UnitID
		LEFT OUTER JOIN Scopes AS scopes ON scopes.ScopeID = Items.ScopeID
		LEFT OUTER JOIN Desciplines AS desciplines ON desciplines.DesciplineId = pl.DesciplineId
        GROUP BY 
            p.ArrivalDate,
            pl.Project,
            pos.PoName ,
			pl.VendorId,
            fi.ItemId,
            pl.PLName,
            p.PK,
            Items.ItemOfPk,
            fi.Tag,
            fi.Description,
            units.UnitName,
            scopes.ScopeName,
            fi.HeatNo,
            fi.BatchNo,
            fi.Remark,
            fi.Hold,
            desciplines.DesciplineName
        HAVING 
            MAX(fi.Balance) > 0 --and 
			--fi.ItemId = 526024
        ORDER BY fi.ItemId
        --OFFSET @PageSize * (@PageNumber - 1) ROWS
        --FETCH NEXT @PageSize ROWS ONLY;
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
/****** Object:  StoredProcedure [dbo].[Search_Material_Issue_Voucher7]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Search_Material_Issue_Voucher7]
AS
BEGIN
    BEGIN TRY
        SET NOCOUNT ON;

        -- ایجاد جدول موقت برای CTE_RequestData
        CREATE TABLE #RequestData
        (
            LocItemID INT,
            TotalReserveMivQty DECIMAL(18, 2),
            TotalDelMivQty DECIMAL(18, 2),
            TotalDelMivRejQty DECIMAL(18, 2),
            NISQty DECIMAL(18, 2),
            OverQty DECIMAL(18, 2),
            ShortageQty DECIMAL(18, 2),
            DamageQty DECIMAL(18, 2),
            RejectQty DECIMAL(18, 2),
            TotalReturnAcceptQty DECIMAL(18, 2),
            TotalDelMrvRejQty DECIMAL(18, 2)
        )

        INSERT INTO #RequestData
        SELECT 
            li.LocItemID,
            SUM(req.ReserveMivQty) AS TotalReserveMivQty,
            SUM(req.DelMivQty) AS TotalDelMivQty,
            SUM(req.DelMivRejQty) AS TotalDelMivRejQty,
            SUM(li.NISQty) AS NISQty,
            SUM(li.OverQty) AS OverQty,
            SUM(li.ShortageQty) AS ShortageQty,
            SUM(li.DamageQty) AS DamageQty,
            SUM(li.RejectQty) AS RejectQty,
            SUM(req.DelMrvQty * -1) AS TotalReturnAcceptQty,
            SUM(req.DelMrvRejQty * -1) AS TotalDelMrvRejQty
        FROM 
            LocItems AS li
        LEFT OUTER JOIN Requests AS req ON li.LocItemID = req.LocItemID
        GROUP BY 
            li.LocItemID;

        -- ایجاد جدول موقت برای CTE_FilteredItems
        CREATE TABLE #FilteredItems
        (
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
            mrrv DECIMAL(18, 2),
            dell DECIMAL(18, 2),
            ress DECIMAL(18, 2),
            Qty DECIMAL(18, 2),
            Balance DECIMAL(18, 2),
            Inventory DECIMAL(18, 2)
        )

        INSERT INTO #FilteredItems
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
            ISNULL(SUM(rd.TotalReturnAcceptQty), 0) AS mrrv,
            ISNULL(SUM(rd.TotalDelMivQty), 0) AS dell,
            ISNULL(SUM(rd.TotalReserveMivQty), 0) AS ress,
            ISNULL(SUM(li.Qty), 0) AS Qty,
            ISNULL(SUM(li.Qty), 0) 
                - ISNULL(SUM(rd.TotalReserveMivQty), 0) 
                - ISNULL(SUM(rd.TotalDelMivQty), 0) 
                - ISNULL(SUM(li.NISQty), 0) 
                - ISNULL(SUM(li.RejectQty), 0) 
                - ISNULL(SUM(rd.TotalReturnAcceptQty), 0) AS Balance,
            ISNULL(SUM(li.Qty), 0) 
                - ISNULL(SUM(rd.TotalDelMivQty), 0) 
                - ISNULL(SUM(li.NISQty), 0) 
                - ISNULL(SUM(li.RejectQty), 0) 
                - ISNULL(SUM(rd.TotalReturnAcceptQty), 0) AS Inventory
        FROM 
            Items
        LEFT OUTER JOIN LocItems AS li ON Items.ItemId = li.ItemId
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
            Items.Hold;

        -- اجرای SELECT نهایی بدون HAVING و استفاده از شرط WHERE
        SELECT 
            p.ArrivalDate,
            pl.Project,
            pos.PoName AS Po,
            pl.VendorId AS Vendor,
            fi.ItemId,
            pl.PLName,
            p.PK,
            Items.ItemOfPk,
            fi.Tag,
            fi.Description,
            units.UnitName AS Unit,
            ISNULL(SUM(Items.Qty), 0) AS QtyPL,
            ISNULL(SUM(fi.Qty), 0) AS QtyInLoc, 
            ISNULL(SUM(fi.Balance), 0) AS Balance,
            ISNULL(SUM(fi.Inventory), 0) AS Inventory,
            ISNULL(SUM(fi.mrrv), 0) AS TotalMrv,
            ISNULL(SUM(fi.dell), 0) AS TotalMiv,
            ISNULL(SUM(fi.ress), 0) AS TotalReserve,
            desciplines.DesciplineName AS Discipline,
            scopes.ScopeName AS Scope,
            fi.HeatNo,
            fi.BatchNo,
            fi.Remark,
            fi.Hold
        FROM 
            #FilteredItems AS fi
        INNER JOIN Items ON fi.ItemId = Items.ItemId
        LEFT OUTER JOIN Packages AS p ON Items.PKID = p.PKID
        LEFT OUTER JOIN PackingLists AS pl ON p.PLId = pl.PLId
        LEFT OUTER JOIN Pos AS pos ON pos.PoId = pl.PoId
        LEFT OUTER JOIN Units AS units ON units.UnitID = Items.UnitID
        LEFT OUTER JOIN Scopes AS scopes ON scopes.ScopeID = Items.ScopeID
        LEFT OUTER JOIN Desciplines AS desciplines ON desciplines.DesciplineId = pl.DesciplineId
        WHERE
            fi.Balance > 0 -- شرط جدید
        GROUP BY 
            p.ArrivalDate,
            pl.Project,
            pos.PoName,
            pl.VendorId,
            fi.ItemId,
            pl.PLName,
            p.PK,
            Items.ItemOfPk,
            fi.Tag,
            fi.Description,
            units.UnitName,
            scopes.ScopeName,
            fi.HeatNo,
            fi.BatchNo,
            fi.Remark,
            fi.Hold,
            desciplines.DesciplineName
        ORDER BY fi.ItemId;

        -- حذف جدول‌های موقت
        DROP TABLE #RequestData;
        DROP TABLE #FilteredItems;

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
/****** Object:  StoredProcedure [dbo].[Search_Miv]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Search_Miv]
AS
BEGIN
    BEGIN TRY
        SET NOCOUNT ON;
WITH CTE_LocItems AS (
    SELECT LocItems.LocItemID, LocItems.ItemId, LocItems.LocationID, 
           ISNULL(SUM(LocItems.Qty), 0) AS Qty, 
           ISNULL(SUM(LocItems.Qty), 0) 
               - ISNULL(SUM(req.ReserveMivQty), 0) 
               - ISNULL(SUM(req.DelMivQty), 0) 
               - ISNULL(SUM(LocItems.NISQty), 0) 
               - ISNULL(SUM(LocItems.RejectQty), 0) 
               + ISNULL(SUM(req.DelMrvQty *-1), 0) AS Balance,
           ISNULL(SUM(LocItems.Qty), 0) 
               - ISNULL(SUM(req.DelMivQty), 0) 
               - ISNULL(SUM(LocItems.NISQty), 0) 
               - ISNULL(SUM(LocItems.RejectQty), 0) 
               + ISNULL(SUM(req.DelMrvQty*-1), 0) AS Inventory
    FROM LocItems
    LEFT JOIN Requests req ON LocItems.LocItemID = req.LocItemID
    GROUP BY LocItems.LocItemID, LocItems.ItemId, LocItems.LocationID, LocItems.Qty
),
CTE_Items AS (
    SELECT Items.ItemId, Items.Tag, Items.Description, Items.UnitID, Items.ScopeID, Items.PKID , Items.Qty
    FROM Items
),
CTE_Packages AS (
    SELECT Packages.PKID,Packages.PK, Packages.ArrivalDate, Packages.MSRNO
    FROM Packages
),
CTE_PackingLists AS (
    SELECT PackingLists.PLId, PackingLists.PLName,PackingLists.PoId, PackingLists.Project, PackingLists.SupplierId, PackingLists.VendorId, PackingLists.IrnId, PackingLists.DesciplineId
    FROM PackingLists
),
CTE_Summary AS (
    SELECT 
	    Pos.PoName,
        Requests.RequestNO,
        RequestTypes.TypeName, 
        Requests.ReqDate, 
        Requests.ReqLocItemID, 
        CTE_LocItems.LocItemID, 
        CTE_Items.ItemId, 
        Requests.MRCNO, 
        Requests.Item, 
        CTE_Items.Tag, 
        CTE_Items.Description, 
        Units.UnitName, 
		CTE_Items.Qty as QtyPl,
        CTE_LocItems.Qty as QtyInLoc, 
        Requests.ReqMivQty, 
        Requests.ReserveMivQty, 
        ISNULL(Requests.DelMivQty, 0) AS DelMivQty, 
		--ISNULL(Requests.ReqHmvQty, 0) AS ReqHmvQty, 
		--ISNULL(Requests.DelHmvQty, 0) AS DelHmvQty, 
  --      ISNULL(Requests.DelHmvRejQty, 0) AS DelHmvRejQty, 
  --      Requests.HMVNO, 
  --      ISNULL(Requests.ReqMrvQty, 0) AS ReqMrvQty, 
  --      ISNULL(Requests.DelMrvQty, 0) AS DelMrvQty, 
  --      ISNULL(Requests.DelMrvRejQty, 0) AS DelMrvRejQty, 
		--Requests.MRVNO, 
        Locations.LocationName, 
        ApplicationUser.Username as IssuedBy, 
        Companies.CompanyName, 
        CompanyContracts.ContractNumber, 
        Scopes.ScopeName as Scope, 
        CTE_Packages.PK, 
        CTE_Packages.ArrivalDate, 
        CTE_Packages.MSRNO, 
        CTE_PackingLists.PLName as PLName, 
        CTE_PackingLists.Project, 
        Suppliers.SupplierName as Supplier, 
        Vendors.VendorName as Vendor, 
        Irns.IrnName as IRN, 
        Desciplines.DesciplineName as Discipline,
        CTE_LocItems.Balance, -- Adding Balance
        CTE_LocItems.Inventory -- Adding Inventory
    FROM Requests 
    LEFT JOIN RequestTypes ON Requests.TypeID = RequestTypes.TypeID
    LEFT JOIN CTE_LocItems ON Requests.LocItemID = CTE_LocItems.LocItemID
    LEFT JOIN CTE_Items ON CTE_LocItems.ItemId = CTE_Items.ItemId
	LEFT JOIN Scopes ON Scopes.ScopeID = CTE_Items.ScopeID
    LEFT JOIN Locations ON CTE_LocItems.LocationID = Locations.LocationID
    LEFT JOIN Units ON CTE_Items.UnitID = Units.UnitID
    LEFT JOIN Companies ON Requests.CompanyID = Companies.CompanyID
    LEFT JOIN CompanyContracts ON Requests.ContractId = CompanyContracts.ContractId
    LEFT JOIN CTE_Packages ON CTE_Items.PKID = CTE_Packages.PKID
    LEFT JOIN CTE_PackingLists ON CTE_Packages.PKID = CTE_PackingLists.PLId
	LEFT JOIN Desciplines ON Desciplines.DesciplineId = CTE_PackingLists.DesciplineId
    LEFT JOIN Pos ON Pos.PoId = CTE_PackingLists.PoId
	LEFT JOIN Suppliers ON CTE_PackingLists.SupplierId = Suppliers.SupplierId
    LEFT JOIN Vendors ON CTE_PackingLists.VendorId = Vendors.VendorID
    LEFT JOIN Irns ON CTE_PackingLists.IrnId = Irns.IrnId
	LEFT JOIN ApplicationUser ON Requests.IssuedBy=ApplicationUser.UserID
)
SELECT *
FROM CTE_Summary
--ORDER BY RequestNO;
    END TRY
    BEGIN CATCH
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
/****** Object:  StoredProcedure [dbo].[Search_Miv2025]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Search_Miv2025]
AS
BEGIN
    BEGIN TRY
        SET NOCOUNT ON;
WITH CTE_LocItems AS (
    SELECT LocItems.LocItemID, LocItems.ItemId, LocItems.LocationID, 
           ISNULL(SUM(LocItems.Qty), 0) AS Qty, 
           ISNULL(SUM(LocItems.Qty), 0) 
               - ISNULL(SUM(req.ReserveMivQty), 0) 
               - ISNULL(SUM(req.DelMivQty), 0) 
               - ISNULL(SUM(LocItems.NISQty), 0) 
               - ISNULL(SUM(LocItems.RejectQty), 0) 
               + ISNULL(SUM(req.DelMrvQty * -1), 0) AS Balance,
           ISNULL(SUM(LocItems.Qty), 0) 
               - ISNULL(SUM(req.DelMivQty), 0) 
               - ISNULL(SUM(LocItems.NISQty), 0) 
               - ISNULL(SUM(LocItems.RejectQty), 0) 
               + ISNULL(SUM(req.DelMrvQty * -1), 0) AS Inventory
    FROM LocItems
    LEFT JOIN Requests req ON LocItems.LocItemID = req.LocItemID
    GROUP BY LocItems.LocItemID, LocItems.ItemId, LocItems.LocationID, LocItems.Qty
),
CTE_Items AS (
    SELECT Items.ItemId, Items.Tag, Items.Description, Items.UnitID, Items.ScopeID, Items.PKID , Items.Qty
    FROM Items
),
CTE_Packages AS (
    SELECT Packages.PKID,Packages.PK, Packages.ArrivalDate, Packages.MSRNO
    FROM Packages
),
CTE_PackingLists AS (
    SELECT PackingLists.PLId, PackingLists.PLName,PackingLists.PoId, PackingLists.Project, PackingLists.SupplierId, PackingLists.VendorId, PackingLists.IrnId, PackingLists.DesciplineId
    FROM PackingLists
),
CTE_Summary AS (
    SELECT 
	    Pos.PoName,
        Requests.RequestNO,
        RequestTypes.TypeName, 
        Requests.ReqDate, 
        Requests.ReqLocItemID, 
        CTE_LocItems.LocItemID, 
        CTE_Items.ItemId, 
        Requests.MRCNO, 
        Requests.Item, 
        CTE_Items.Tag, 
        CTE_Items.Description, 
        Units.UnitName, 
		CTE_Items.Qty as QtyPl,
        CTE_LocItems.Qty as QtyInLoc, 
        Requests.ReqMivQty, 
        Requests.ReserveMivQty, 
        ISNULL(Requests.DelMivQty, 0) AS DelMivQty, 
		--ISNULL(Requests.ReqHmvQty, 0) AS ReqHmvQty, 
		--ISNULL(Requests.DelHmvQty, 0) AS DelHmvQty, 
  --      ISNULL(Requests.DelHmvRejQty, 0) AS DelHmvRejQty, 
  --      Requests.HMVNO, 
  --      ISNULL(Requests.ReqMrvQty, 0) AS ReqMrvQty, 
  --      ISNULL(Requests.DelMrvQty, 0) AS DelMrvQty, 
  --      ISNULL(Requests.DelMrvRejQty, 0) AS DelMrvRejQty, 
		--Requests.MRVNO, 
        Locations.LocationName, 
        ApplicationUser.Username as IssuedBy, 
        Companies.CompanyName, 
        CompanyContracts.ContractNumber, 
        Scopes.ScopeName as Scope, 
        CTE_Packages.PK, 
        CTE_Packages.ArrivalDate, 
        CTE_Packages.MSRNO, 
        CTE_PackingLists.PLName as PLName, 
        CTE_PackingLists.Project, 
        Suppliers.SupplierName as Supplier, 
        Vendors.VendorName as Vendor, 
        Irns.IrnName as IRN, 
        Desciplines.DesciplineName as Discipline,
        CTE_LocItems.Balance, -- Adding Balance
        CTE_LocItems.Inventory -- Adding Inventory
    FROM Requests 
    LEFT JOIN RequestTypes ON Requests.TypeID = RequestTypes.TypeID
    LEFT JOIN CTE_LocItems ON Requests.LocItemID = CTE_LocItems.LocItemID
    LEFT JOIN CTE_Items ON CTE_LocItems.ItemId = CTE_Items.ItemId
	LEFT JOIN Scopes ON Scopes.ScopeID = CTE_Items.ScopeID
    LEFT JOIN Locations ON CTE_LocItems.LocationID = Locations.LocationID
    LEFT JOIN Units ON CTE_Items.UnitID = Units.UnitID
    LEFT JOIN Companies ON Requests.CompanyID = Companies.CompanyID
    LEFT JOIN CompanyContracts ON Requests.ContractId = CompanyContracts.ContractId
    LEFT JOIN CTE_Packages ON CTE_Items.PKID = CTE_Packages.PKID
    LEFT JOIN CTE_PackingLists ON CTE_Packages.PKID = CTE_PackingLists.PLId
	LEFT JOIN Desciplines ON Desciplines.DesciplineId = CTE_PackingLists.DesciplineId
    LEFT JOIN Pos ON Pos.PoId = CTE_PackingLists.PoId
	LEFT JOIN Suppliers ON CTE_PackingLists.SupplierId = Suppliers.SupplierId
    LEFT JOIN Vendors ON CTE_PackingLists.VendorId = Vendors.VendorID
    LEFT JOIN Irns ON CTE_PackingLists.IrnId = Irns.IrnId
	LEFT JOIN ApplicationUser ON Requests.IssuedBy=ApplicationUser.UserID
)
SELECT *
FROM CTE_Summary
--ORDER BY RequestNO;
    END TRY
    BEGIN CATCH
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
/****** Object:  StoredProcedure [dbo].[sp_AddItem]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AddItemWithAddLocitemWithTrigger]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AddUser2025]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AddUser2025]
    @Username NVARCHAR(255),
    @PasswordHash NVARCHAR(255),
    @RoleID INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO ApplicationUser (Username, PasswordHash, RoleID)
    VALUES (@Username, @PasswordHash, @RoleID);

    -- برگرداندن ID تولیدشده
    SELECT CAST(SCOPE_IDENTITY() AS INT) AS UserID;
END




GO
/****** Object:  StoredProcedure [dbo].[sp_AllItemSelectedPl]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_DeleteItem]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_DeleteUser]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetAllCompanyNames]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetAllCompanyNames]
AS
BEGIN
   SELECT * FROM Companies;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllItems]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetAllRoles]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_GetAllRoles]
AS
BEGIN
    SELECT RoleID,RoleName
    FROM ApplicationRole;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllUsers]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetItemById]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetItemsByPlIdOptimized]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetItemsByPlIdOptimized2]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetItemsByPlIdOptimized3]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetItemsByPlIdWITH_IndexedView]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetItemsByPlIdWithCTE]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetItemsByPlIdWithLoopAndMergeJoin]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetItemsByPlIdWithLoopAndMergeJoin_WITH_IndexedView]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetItemsByPlIdWithTempTable]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetItemsByPlIdWithTempTableAndSubQuery]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetPermissionsByRoleId]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_GetPermissionsByRoleId]
    @RoleID INT
AS
BEGIN
    SET NOCOUNT ON;
SELECT [PermissionID], [RoleID], [RibbonPageName], [IsEnabled]
FROM [ApplicationPermissions]
WHERE [RoleID] = @RoleID;
END




GO
/****** Object:  StoredProcedure [dbo].[sp_GetUserById]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetUserByUsername]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateItem]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateRolePermissions]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateRolePermissions]
    @RoleID INT,
    @Permissions AWMSPermissionType2 READONLY -- Table-Valued Parameter
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;
    BEGIN TRY
        -- حذف مجوزهای موجود برای RoleID
        DELETE FROM ApplicationPermissions
        WHERE RoleID = @RoleID;

        -- اضافه کردن مجوزهای جدید
        INSERT INTO ApplicationPermissions (RoleID, RibbonPageName, IsEnabled)
        SELECT RoleID, RibbonPageName, IsEnabled
        FROM @Permissions;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;

        -- بازگرداندن خطا
        THROW;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateRolePermissionsJson]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateRolePermissionsJson]
    @RoleID INT,
    @PermissionsJson NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;
    BEGIN TRY
        -- حذف مجوزهای قدیمی برای RoleID
        DELETE FROM ApplicationPermissions WHERE RoleID = @RoleID;

        -- اضافه کردن مجوزهای جدید از JSON
        INSERT INTO ApplicationPermissions (RoleID, RibbonPageName, IsEnabled)
        SELECT
            @RoleID AS RoleID,
            JSON_VALUE(Value, '$.RibbonPageName') AS RibbonPageName,
            JSON_VALUE(Value, '$.IsEnabled') AS IsEnabled
        FROM OPENJSON(@PermissionsJson);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateUser]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateUserPasswordAd]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateUserPasswordAd]
    @UserID INT,
    @PasswordHash NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    -- به‌روزرسانی پسورد کاربر
    UPDATE ApplicationUser
    SET PasswordHash = @PasswordHash
    WHERE UserID = @UserID;
END

GO
/****** Object:  StoredProcedure [dbo].[spDeleteLocation]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spDeleteScope]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spDeleteUnit]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spGetAllLocationChanges]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spGetAllLocationChanges]
AS
BEGIN
    -- Select locations where LocationId is not 1 and order by LocationName
    SELECT LocationId, LocationName 
    FROM Locations
    WHERE LocationId <> 1
    ORDER BY LocationName;
END
GO
/****** Object:  StoredProcedure [dbo].[spGetAllLocations]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spGetAllLocationsJustLocationName]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spGetAllLocationsJustLocationName]
AS
BEGIN
    SELECT LocationName FROM Locations;
END
GO
/****** Object:  StoredProcedure [dbo].[spGetAllScopes]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spGetAllUnits]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spGetLocationById]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spGetRequestsByLocItemId]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetRequestsByLocItemId]
    @LocItemId INT
AS
BEGIN
SELECT ROW_NUMBER() OVER (ORDER BY Requests.ReqLocItemID) AS RowNumber,Requests.ReqLocItemID, Requests.LocItemID, Requests.CompanyID, Requests.CompanyID2, Requests.ContractId, Requests.ContractId2, Requests.AreaUnitID, Requests.VendorID, Requests.TypeID, Requests.RequestNO, 
                  Requests.ReqDate, Requests.Item, Requests.ReqMivQty, Requests.ReserveMivQty, Requests.DelMivQty, Requests.ReqMivRejQty, Requests.ReserveMivRejQty, Requests.DelMivRejQty, Requests.ReqMrvQty, Requests.DelMrvQty, 
                  Requests.DelMrvRejQty, Requests.ReqHmvQty, Requests.DelHmvQty, Requests.DelHmvRejQty, ApplicationUser.Username as IssuedBy, Requests.IssuedDate, Requests.ApprovedBy, Requests.ApprovedDate, Requests.DelDate, Requests.Remark, 
                  Requests.MRCNO, Requests.MRVNO, Requests.HMVNO, Requests.RequestPDF, Requests.RequestTypeTypeID, Units.UnitName, Items.ItemId, Companies.CompanyName, CompanyContracts.ContractNumber
FROM     Requests left JOIN
                  Companies ON Requests.CompanyID = Companies.CompanyID left JOIN
                  CompanyContracts ON Requests.ContractId = CompanyContracts.ContractId left JOIN
                  LocItems ON Requests.LocItemID = LocItems.LocItemID left JOIN
                  Items ON LocItems.ItemId = Items.ItemId left JOIN
                  Units ON Items.UnitID = Units.UnitID left JOIN
                  ApplicationUser ON Requests.IssuedBy = ApplicationUser.UserID
    WHERE Requests.LocItemID = @LocItemId;
END
GO
/****** Object:  StoredProcedure [dbo].[spGetRequestsByLocItemIds]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spGetRequestsByLocItemIds]
    @LocItemId INT
AS
BEGIN
    -- Step 1: Retrieve the ItemId associated with the given LocItemID
    DECLARE @ItemId INT;
    SELECT @ItemId = ItemId
    FROM LocItems
    WHERE LocItemID = @LocItemId;

    -- Step 2: Retrieve all LocItemIDs associated with the retrieved ItemId
    SELECT 
        ROW_NUMBER() OVER (ORDER BY Requests.ReqLocItemID) AS RowNumber,
        Requests.ReqLocItemID, 
        Requests.LocItemID, 
        Requests.CompanyID, 
        Requests.CompanyID2, 
        Requests.ContractId, 
        Requests.ContractId2, 
        Requests.AreaUnitID, 
        Requests.VendorID, 
        Requests.TypeID, 
        Requests.RequestNO, 
        Requests.ReqDate, 
        Requests.Item, 
        Requests.ReqMivQty, 
        Requests.ReserveMivQty, 
        Requests.DelMivQty, 
        Requests.ReqMivRejQty, 
        Requests.ReserveMivRejQty, 
        Requests.DelMivRejQty, 
        Requests.ReqMrvQty, 
        Requests.DelMrvQty, 
        Requests.DelMrvRejQty, 
        Requests.ReqHmvQty, 
        Requests.DelHmvQty, 
        Requests.DelHmvRejQty, 
        ApplicationUser.Username as IssuedBy, 
        Requests.IssuedDate, 
        Requests.ApprovedBy, 
        Requests.ApprovedDate, 
        Requests.DelDate, 
        Requests.Remark, 
        Requests.MRCNO, 
        Requests.MRVNO, 
        Requests.HMVNO, 
        Requests.RequestPDF, 
        Requests.RequestTypeTypeID, 
        Units.UnitName, 
        Items.ItemId, 
        Companies.CompanyName, 
        CompanyContracts.ContractNumber
    FROM Requests 
    LEFT JOIN Companies ON Requests.CompanyID = Companies.CompanyID 
    LEFT JOIN CompanyContracts ON Requests.ContractId = CompanyContracts.ContractId 
    LEFT JOIN LocItems ON Requests.LocItemID = LocItems.LocItemID 
    LEFT JOIN Items ON LocItems.ItemId = Items.ItemId 
    LEFT JOIN Units ON Items.UnitID = Units.UnitID 
    LEFT JOIN ApplicationUser ON Requests.IssuedBy = ApplicationUser.UserID
    WHERE Requests.LocItemID IN (SELECT LocItemID FROM LocItems WHERE ItemId = @ItemId);
END;
GO
/****** Object:  StoredProcedure [dbo].[spGetScopeById]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spGetUnitById]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spInsertHmv2024]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertHmv2024]
    @CompanyID INT,
	@CompanyID2 INT,
    @ContractId INT,
	@ContractId2 INT,
    @HMVNO NVARCHAR(MAX),
    @AreaUnitID INT,
    @IssuedBy INT,
    @DelDate DATE,
    @RequestHmvs dbo.NewHMVDtoType READONLY
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;  -- شروع تراکنش
    BEGIN TRY
        DECLARE @NextHMVNumber INT,
                @Status NVARCHAR(50),
                @ItemId INT,
                @TotalQty DECIMAL(18, 2),
                @EnteredBy INT;

        DECLARE @LocItemID INT,
                @ReqHmvQty DECIMAL(18, 2),
                @DelHmvQty DECIMAL(18, 2),
                @DelHmvRejQty DECIMAL(18, 2),
                @Remark NVARCHAR(255),
                @MRCNO NVARCHAR(50),
				@CurrentBalance DECIMAL(18, 2),
                @RequestNo NVARCHAR(50);

        -- دریافت شماره HMV بعدی
        SELECT TOP 1 @NextHMVNumber = TRY_CAST(RequestNo AS INT) + 1
        FROM Requests
        WHERE TypeId = 3 AND TRY_CAST(RequestNo AS INT) IS NOT NULL
        ORDER BY TRY_CAST(RequestNo AS INT) DESC;

        IF @NextHMVNumber IS NULL
            SET @NextHMVNumber = 1;

        DECLARE cursor_Hmv CURSOR FOR
        SELECT LocItemID, HmvQty, HmvDelQty, HmvRejQty, Remark, MRCNO
        FROM @RequestHmvs;

        OPEN cursor_Hmv;
        FETCH NEXT FROM cursor_Hmv INTO @LocItemID, @ReqHmvQty, @DelHmvQty, @DelHmvRejQty, @Remark, @MRCNO;

        WHILE @@FETCH_STATUS = 0
        BEGIN
            SET @RequestNo = @MRCNO;
            SET @TotalQty = @DelHmvQty + @DelHmvRejQty;

            IF EXISTS (SELECT 1 FROM Requests WHERE LocItemID = @LocItemID AND RequestNO = @RequestNo AND CompanyID = @CompanyID AND TypeID = 1) 
            BEGIN
                           
            SELECT @CurrentBalance = DelMivQty, @ItemId = ItemId 
            FROM Requests R
            JOIN LocItems L ON L.LocItemID = R.LocItemID
            WHERE R.LocItemID = @LocItemID AND R.RequestNo = @RequestNo AND R.CompanyID = @CompanyID AND R.TypeID = 1;

                IF @CurrentBalance >= @TotalQty
                BEGIN

                    -- ثبت MRV با LocitemID جدید در سیستم
                    INSERT INTO Requests (CompanyID,CompanyID2, ContractId,ContractId2, HMVNO, AreaUnitID, ReqHmvQty, DelHmvQty, 
                    LocItemID, DelHmvRejQty, Remark, RequestNO, MRCNO, TypeId, IssuedBy, DelDate)
                    VALUES 
                    ( 
                        @CompanyID,
						@CompanyID2,
                        @ContractId,
                        @ContractId2,
						@HMVNO,
                        @AreaUnitID,
                        @ReqHmvQty,
                        @DelHmvQty,
                        @LocItemID,
                        @DelHmvRejQty,
                        @Remark,
                        FORMAT(@NextHMVNumber, 'D6'),
                        @RequestNo,
                        3,
                        @IssuedBy,
                        @DelDate
                    );
                END
                ELSE
                BEGIN
                    SET @Status = 'Error: Total quantity exceeds current balance';
                    RAISERROR (@Status, 16, 1);
                    ROLLBACK TRANSACTION;
                    RETURN;
                END
            END
            ELSE
            BEGIN
                SET @Status = 'Error: Record not found';
                RAISERROR (@Status, 16, 1);
                ROLLBACK TRANSACTION;
                RETURN;
            END

            FETCH NEXT FROM cursor_Hmv INTO @LocItemID, @ReqHmvQty, @DelHmvQty, @DelHmvRejQty, @Remark, @MRCNO;
        END

        CLOSE cursor_Hmv;
        DEALLOCATE cursor_Hmv;

        COMMIT TRANSACTION;

        -- بازگرداندن شماره HMV
        --SELECT FORMAT(@NextHMVNumber - 1, 'D6') AS NewHMVNumber;
		SELECT 
			CASE 
				WHEN @NextHMVNumber = 1 THEN '000001'  -- اگر مقدار 1 باشد، آن را به 000001 تبدیل کن
				ELSE FORMAT(@NextHMVNumber, 'D6') -- در غیر این صورت فرمت‌دهی استاندارد را اعمال کن
			END AS NewHMVNumber;

    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR (@ErrorMessage, 16, 1);
    END CATCH
END;







GO
/****** Object:  StoredProcedure [dbo].[spInsertHmv2025]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spInsertHmv2025]
    @CompanyID INT,
    @CompanyID2 INT,
    @ContractId INT,
    @ContractId2 INT,
    @HMVNO NVARCHAR(MAX),
    @AreaUnitID INT,
    @IssuedBy INT,
    @DelDate DATE,
    @RequestHmvs dbo.NewHMVDtoType READONLY
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRANSACTION;  -- شروع تراکنش
    BEGIN TRY
        DECLARE @NextHMVNumber INT,
                @Status NVARCHAR(50),
                @ItemId INT,
                @TotalQty DECIMAL(18, 2),
                @EnteredBy INT;

        DECLARE @LocItemID INT,
                @ReqHmvQty DECIMAL(18, 2),
                @DelHmvQty DECIMAL(18, 2),
                @DelHmvRejQty DECIMAL(18, 2),
                @Remark NVARCHAR(255),
                @MRCNO NVARCHAR(50),
                @CurrentBalance DECIMAL(18, 2),
                @RequestNo NVARCHAR(50),
                @TypeName NVARCHAR(50);

        -- دریافت شماره HMV بعدی
        SELECT TOP 1 @NextHMVNumber = TRY_CAST(RequestNo AS INT) + 1
        FROM Requests
        WHERE TypeId = 3 AND TRY_CAST(RequestNo AS INT) IS NOT NULL
        ORDER BY TRY_CAST(RequestNo AS INT) DESC;

        IF @NextHMVNumber IS NULL
            SET @NextHMVNumber = 1;

        DECLARE cursor_Hmv CURSOR FOR
        SELECT LocItemID, HmvQty, HmvDelQty, HmvRejQty, Remark, MRCNO, TypeName
        FROM @RequestHmvs;

        OPEN cursor_Hmv;
        FETCH NEXT FROM cursor_Hmv INTO @LocItemID, @ReqHmvQty, @DelHmvQty, @DelHmvRejQty, @Remark, @MRCNO, @TypeName;

        WHILE @@FETCH_STATUS = 0
        BEGIN
            IF @TypeName = 'MIV'
            BEGIN
                SET @RequestNo = @MRCNO;
                SET @TotalQty = @DelHmvQty + @DelHmvRejQty;

                IF EXISTS (SELECT 1 FROM Requests WHERE LocItemID = @LocItemID AND RequestNO = @RequestNo AND CompanyID = @CompanyID AND TypeID = 1) 
                BEGIN
                    SELECT @CurrentBalance = DelMivQty, @ItemId = ItemId 
                    FROM Requests R
                    JOIN LocItems L ON L.LocItemID = R.LocItemID
                    WHERE R.LocItemID = @LocItemID AND R.RequestNo = @RequestNo AND R.CompanyID = @CompanyID AND R.TypeID = 1;

                    IF @CurrentBalance >= @TotalQty
                    BEGIN
                        -- ثبت MRV با LocitemID جدید در سیستم
                        INSERT INTO Requests (CompanyID, CompanyID2, ContractId, ContractId2, HMVNO, AreaUnitID, ReqHmvQty, DelHmvQty, 
                                              LocItemID, DelHmvRejQty, Remark, RequestNO, MRCNO, TypeId, IssuedBy, DelDate)
                        VALUES 
                        ( 
                            @CompanyID,
                            @CompanyID2,
                            @ContractId,
                            @ContractId2,
                            @HMVNO,
                            @AreaUnitID,
                            @ReqHmvQty,
                            @DelHmvQty,
                            @LocItemID,
                            @DelHmvRejQty,
                            @Remark,
                            --CONCAT('MIV-',FORMAT(@NextHMVNumber, 'D6')),
							FORMAT(@NextHMVNumber, 'D6'),
                            --CONCAT('MIV-',@RequestNo),
							@RequestNo,
                            3,
                            @IssuedBy,
                            @DelDate
                        );
                    END
                    ELSE
                    BEGIN
                        SET @Status = 'Error: Total quantity exceeds current balance';
                        RAISERROR (@Status, 16, 1);
                        ROLLBACK TRANSACTION;
                        RETURN;
                    END
                END
                ELSE
                BEGIN
                    SET @Status = 'Error: Record not found In Miv';
                    RAISERROR (@Status, 16, 1);
                    ROLLBACK TRANSACTION;
                    RETURN;
                END
            END
            ELSE IF @TypeName = 'HMV'
            BEGIN
                -- در این قسمت عملیات مرتبط با 'HMV' را اضافه کنید
                -- مثال: اینجا می‌توانید عملیات مختلف یا درج‌های دیگری را انجام دهید
				SET @RequestNo = @MRCNO;
                SET @TotalQty = @DelHmvQty + @DelHmvRejQty;
				    IF EXISTS (SELECT 1 FROM Requests WHERE LocItemID = @LocItemID AND RequestNO = @RequestNo AND CompanyID2 = @CompanyID AND TypeID = 3) 
                BEGIN
                    SELECT @CurrentBalance =  DelHmvQty, @ItemId = ItemId 
                    FROM Requests R
                    JOIN LocItems L ON L.LocItemID = R.LocItemID
                    WHERE R.LocItemID = @LocItemID AND R.RequestNo = @RequestNo AND R.CompanyID2 = @CompanyID AND R.TypeID = 3;

                    IF @CurrentBalance >= @TotalQty
                    BEGIN
                        -- ثبت MRV با LocitemID جدید در سیستم
                        INSERT INTO Requests (CompanyID, CompanyID2, ContractId, ContractId2, HMVNO, AreaUnitID, ReqHmvQty, DelHmvQty, 
                                              LocItemID, DelHmvRejQty, Remark, RequestNO, MRCNO, TypeId, IssuedBy, DelDate)
                        VALUES 
                        ( 
                            @CompanyID,
                            @CompanyID2,
                            @ContractId,
                            @ContractId2,
                            @HMVNO,
                            @AreaUnitID,
                            @ReqHmvQty,
                            @DelHmvQty,
                            @LocItemID,
                            @DelHmvRejQty,
                            @Remark,
                            --CONCAT('HMV-',FORMAT(@NextHMVNumber, 'D6')),
							FORMAT(@NextHMVNumber, 'D6'),
                            --CONCAT('HMV-',@RequestNo),
                            @RequestNo,
							3,
                            @IssuedBy,
                            @DelDate
                        );
                    END
                    ELSE
                    BEGIN
                        SET @Status = 'Error: Total quantity exceeds current balance';
                        RAISERROR (@Status, 16, 1);
                        ROLLBACK TRANSACTION;
                        RETURN;
                    END
                END
                ELSE
                BEGIN
                    SET @Status = 'Error: Record not found In Hmv';
                    RAISERROR (@Status, 16, 1);
                    ROLLBACK TRANSACTION;
                    RETURN;
                END
            END

            FETCH NEXT FROM cursor_Hmv INTO @LocItemID, @ReqHmvQty, @DelHmvQty, @DelHmvRejQty, @Remark, @MRCNO, @TypeName;
        END

        CLOSE cursor_Hmv;
        DEALLOCATE cursor_Hmv;

        COMMIT TRANSACTION;

        -- بازگرداندن شماره HMV
        SELECT 
            CASE 
                WHEN @NextHMVNumber = 1 THEN '000001'  -- اگر مقدار 1 باشد، آن را به 000001 تبدیل کن
                ELSE FORMAT(@NextHMVNumber, 'D6') -- در غیر این صورت فرمت‌دهی استاندارد را اعمال کن
            END AS NewHMVNumber;

    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR (@ErrorMessage, 16, 1);
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[spInsertLocation]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertLocation]
    @LocationName NVARCHAR(100),
    @LocationWarehouse NVARCHAR(200),
    @EnteredBy int,
    @EnteredDate Datetime
AS
BEGIN
    -- Check if the LocationName already exists
    IF EXISTS (SELECT 1 FROM Locations WHERE LocationName = @LocationName)
    BEGIN
        -- Return an error message if LocationName is duplicated
        RAISERROR('The LocationName already exists. Please choose a different LocationName.', 16, 1);
        RETURN;
    END

    -- Insert new location if no duplicates are found
    INSERT INTO Locations (LocationName, EnteredBy, EnteredDate, LocationWarehouse)
    VALUES (@LocationName, @EnteredBy, @EnteredDate, @LocationWarehouse);
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertMrv2024]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertMrv2024]
    @CompanyID INT,
    @ContractId INT,
    @MRVNO NVARCHAR(MAX),
    @AreaUnitID INT,
    @IssuedBy INT,
    @DelDate DATE,
    @RequestMrvs dbo.NewMRVDtoType4 READONLY
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;  -- شروع تراکنش
    BEGIN TRY
        DECLARE @NextMRVNumber INT,
                @Status NVARCHAR(50),
                @ItemId INT,
                @TotalQty DECIMAL(18, 2),
                @NewLocItemID INT,  -- متغیر برای ذخیره LocItemID جدید
                @EnteredBy INT;

        DECLARE @LocItemID INT,
                @ReqMrvQty DECIMAL(18, 2),
                @DelMrvQty DECIMAL(18, 2),
                @DelMrvRejQty DECIMAL(18, 2),
                @Remark NVARCHAR(255),
                @MRCNO NVARCHAR(50),
                @SelectedLocation INT,
                @CurrentBalance DECIMAL(18, 2),
                @RequestNo NVARCHAR(50);

        -- دریافت شماره MRV بعدی
        SELECT TOP 1 @NextMRVNumber = TRY_CAST(RequestNo AS INT) + 1
        FROM Requests
        WHERE TypeId = 2 AND TRY_CAST(RequestNo AS INT) IS NOT NULL
        ORDER BY TRY_CAST(RequestNo AS INT) DESC;

        IF @NextMRVNumber IS NULL
            SET @NextMRVNumber = 1;

        DECLARE cursor_Mrv CURSOR FOR
        SELECT LocItemID, ReqMrvQty, DelMrvQty, DelMrvRejQty, Remark, MRCNO, SelectedLocation
        FROM @RequestMrvs;

        OPEN cursor_Mrv;
        FETCH NEXT FROM cursor_Mrv INTO @LocItemID, @ReqMrvQty, @DelMrvQty, @DelMrvRejQty, @Remark, @MRCNO, @SelectedLocation;

        WHILE @@FETCH_STATUS = 0
        BEGIN
            SET @RequestNo = @MRCNO;
            SET @TotalQty = @DelMrvQty + @DelMrvRejQty;

            IF EXISTS (SELECT 1 FROM Requests WHERE LocItemID = @LocItemID AND RequestNO = @RequestNo AND CompanyID = @CompanyID AND TypeID = 1)
            BEGIN
                           
            SELECT @CurrentBalance = DelMivQty, @ItemId = ItemId 
            FROM Requests R
            JOIN LocItems L ON L.LocItemID = R.LocItemID
            WHERE R.LocItemID = @LocItemID AND R.RequestNo = @RequestNo AND R.CompanyID = @CompanyID AND R.TypeID = 1;

                IF @CurrentBalance >= @TotalQty
                BEGIN
                    UPDATE LocItems
                    SET Qty = Qty - @TotalQty
                    WHERE LocItemID = @LocItemID;

                    SET @EnteredBy = @IssuedBy;

                    -- درج رکورد جدید در LocItems برای مکان جدید
                    INSERT INTO LocItems 
                    (ItemId, Qty, OverQty, ShortageQty, DamageQty, NISQty, RejectQty, LocationID, EnteredBy, EnteredDate, ParentLocItemID, RemarkLocitemID)
                    VALUES 
                    (@ItemId, @TotalQty, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, @SelectedLocation, @EnteredBy, GETDATE(), @LocItemID, @Remark);

                    SET @NewLocItemID = SCOPE_IDENTITY();

                    -- ثبت MIV با NewLocItemID
                    INSERT INTO Requests (CompanyID, ContractId, MRCNO, AreaUnitID, ReqMivQty, ReserveMivQty, 
                    DelMivQty, LocItemID, RequestNO, IssuedBy, IssuedDate, TypeId, ApprovedBy, ApprovedDate, ReqDate, RequestPDF, VendorID)
                    SELECT 
                        CompanyID, 
                        ContractId, 
                        MRCNO, 
                        AreaUnitID, 
                        ReqMivQty, 
                        ReserveMivQty, 
                        @TotalQty, 
                        @NewLocItemID, 
                        RequestNO, 
                        IssuedBy, 
                        IssuedDate, 
                        1, 
                        ApprovedBy, 
                        ApprovedDate, 
                        ReqDate, 
                        RequestPDF, 
                        VendorID
                    FROM Requests 
                    WHERE LocItemID = @LocItemID AND RequestNO = @RequestNo AND CompanyID=@CompanyID AND TypeId=1;

                    -- کسر مقادیر از LocItemID اولیه در جدول Requests
                    WITH CTE_Requests AS (
                        SELECT TOP 1 *
                        FROM Requests
                        WHERE LocItemID = @LocItemID AND RequestNO = @RequestNo AND CompanyID=@CompanyID AND TypeID=1
                        ORDER BY ReqLocItemID 
                    )
                    UPDATE CTE_Requests
                    SET DelMivQty = ISNULL(DelMivQty, 0) - @TotalQty;

                    -- ثبت MRV با LocitemID جدید در سیستم
                    INSERT INTO Requests (CompanyID, ContractId, MRVNO, AreaUnitID, ReqMrvQty, DelMrvQty, 
                    LocItemID, DelMrvRejQty, Remark, RequestNO, MRCNO, TypeId, IssuedBy, DelDate)
                    VALUES 
                    ( 
                        @CompanyID,
                        @ContractId,
                        @MRVNO,
                        @AreaUnitID,
                        @ReqMrvQty,
                        @DelMrvQty,
                        @NewLocItemID,
                        @DelMrvRejQty,
                        @Remark,
                        FORMAT(@NextMRVNumber, 'D6'),
                        @RequestNo,
                        2,
                        @IssuedBy,
                        @DelDate
                    );
                END
                ELSE
                BEGIN
                    SET @Status = 'Error: Total quantity exceeds current balance';
                    RAISERROR (@Status, 16, 1);
                    ROLLBACK TRANSACTION;
                    RETURN;
                END
            END
            ELSE
            BEGIN
                SET @Status = 'Error: Record not found';
                RAISERROR (@Status, 16, 1);
                ROLLBACK TRANSACTION;
                RETURN;
            END

            FETCH NEXT FROM cursor_Mrv INTO @LocItemID, @ReqMrvQty, @DelMrvQty, @DelMrvRejQty, @Remark, @MRCNO, @SelectedLocation;
        END

        CLOSE cursor_Mrv;
        DEALLOCATE cursor_Mrv;

        COMMIT TRANSACTION;

        -- بازگرداندن شماره MRV
      SELECT FORMAT(@NextMRVNumber - 1, 'D6') AS NewMRVNumber;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR (@ErrorMessage, 16, 1);
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[spInsertMrv2025]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertMrv2025]
    @CompanyID INT,
    @ContractId INT,
    @MRVNO NVARCHAR(MAX),
    @AreaUnitID INT,
    @IssuedBy INT,
    @DelDate DATE,
    @RequestMrvs dbo.NewMRVDtoType5 READONLY
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;
    BEGIN TRY
        DECLARE @NextMRVNumber INT,
                @Status NVARCHAR(50),
                @ItemId INT,
                @TotalQty DECIMAL(18, 2),
                @NewLocItemID INT,
                @EnteredBy INT;

        DECLARE @LocItemID INT,
                @ReqMrvQty DECIMAL(18, 2),
                @DelMrvQty DECIMAL(18, 2),
                @DelMrvRejQty DECIMAL(18, 2),
                @Remark NVARCHAR(255),
                @MRCNO NVARCHAR(50),
                @SelectedLocation INT,
                @CurrentBalance DECIMAL(18, 2),
                @RequestNo NVARCHAR(50),
                @TypeName NVARCHAR(50);

        SELECT TOP 1 @NextMRVNumber = TRY_CAST(RequestNo AS INT) + 1
        FROM Requests
        WHERE TypeId = 2 AND TRY_CAST(RequestNo AS INT) IS NOT NULL
        ORDER BY TRY_CAST(RequestNo AS INT) DESC;

        IF @NextMRVNumber IS NULL
            SET @NextMRVNumber = 1;

        DECLARE cursor_Mrv CURSOR FOR
        SELECT LocItemID, ReqMrvQty, DelMrvQty, DelMrvRejQty, Remark, MRCNO, SelectedLocation, TypeName
        FROM @RequestMrvs;

        OPEN cursor_Mrv;
        FETCH NEXT FROM cursor_Mrv INTO @LocItemID, @ReqMrvQty, @DelMrvQty, @DelMrvRejQty, @Remark, @MRCNO, @SelectedLocation, @TypeName;

        WHILE @@FETCH_STATUS = 0
        BEGIN
            SET @RequestNo = @MRCNO; 
			SET @TotalQty = @DelMrvQty + @DelMrvRejQty;
           

            IF @TypeName = 'MIV'
            BEGIN
                IF EXISTS (SELECT 1 FROM Requests WHERE LocItemID = @LocItemID AND RequestNO = @RequestNo AND CompanyID = @CompanyID AND TypeID = 1)
                BEGIN
                    SELECT @CurrentBalance = DelMivQty, @ItemId = ItemId 
                    FROM Requests R
                    JOIN LocItems L ON L.LocItemID = R.LocItemID
                    WHERE R.LocItemID = @LocItemID AND R.RequestNo = @RequestNo AND R.CompanyID = @CompanyID AND R.TypeID = 1;

                    IF @CurrentBalance >= @TotalQty
                    BEGIN
                        --UPDATE LocItems
                        --SET Qty = Qty - @TotalQty
                        --WHERE LocItemID = @LocItemID;

                        SET @EnteredBy = @IssuedBy;

                        INSERT INTO LocItems 
                        (ItemId, Qty, OverQty, ShortageQty, DamageQty, NISQty, RejectQty, LocationID, EnteredBy, EnteredDate, ParentLocItemID, RemarkLocitemID,FlagMIVorHMV)
                        VALUES 
                        (@ItemId, 0, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, @SelectedLocation, @EnteredBy, GETDATE(), @LocItemID, @Remark,1);

                        SET @NewLocItemID = SCOPE_IDENTITY();

                        --INSERT INTO Requests (CompanyID, ContractId, MRCNO, AreaUnitID, ReqMivQty, ReserveMivQty, 
                        --DelMivQty, LocItemID, RequestNO, IssuedBy, IssuedDate, TypeId, ApprovedBy, ApprovedDate, ReqDate, RequestPDF, VendorID)
                        --SELECT 
                        --    CompanyID, 
                        --    ContractId, 
                        --    MRCNO, 
                        --    AreaUnitID, 
                        --    ReqMivQty, 
                        --    ReserveMivQty, 
                        --    @TotalQty, 
                        --    @NewLocItemID, 
                        --    RequestNO, 
                        --    IssuedBy, 
                        --    IssuedDate, 
                        --    1, 
                        --    ApprovedBy, 
                        --    ApprovedDate, 
                        --    ReqDate, 
                        --    RequestPDF, 
                        --    VendorID
                        --FROM Requests 
                        --WHERE LocItemID = @LocItemID AND RequestNO = @RequestNo AND CompanyID=@CompanyID AND TypeId=1;

                        --WITH CTE_Requests AS (
                        --    SELECT TOP 1 *
                        --    FROM Requests
                        --    WHERE LocItemID = @LocItemID AND RequestNO = @RequestNo AND CompanyID=@CompanyID AND TypeID=1
                        --    ORDER BY ReqLocItemID 
                        --)
                        --UPDATE CTE_Requests
                        --SET DelMivQty = ISNULL(DelMivQty, 0) - @TotalQty;

                        INSERT INTO Requests (CompanyID, ContractId, MRVNO, AreaUnitID, ReqMrvQty, DelMrvQty, 
                        LocItemID, DelMrvRejQty, Remark, RequestNO, MRCNO, TypeId, IssuedBy, DelDate,PLocItemIDforMRV)
                        VALUES 
                        ( 
                            @CompanyID,
                            @ContractId,
                            @MRVNO,
                            @AreaUnitID,
                            @ReqMrvQty,
                            @DelMrvQty,
                            @NewLocItemID,
                            @DelMrvRejQty,
                            @Remark,
                            FORMAT(@NextMRVNumber, 'D6'),
                            @RequestNo,
                            2,
                            @IssuedBy,
                            @DelDate,
							@LocItemID
                        );
                    END
                    ELSE
                    BEGIN
                        SET @Status = 'Error: Total quantity exceeds current balance-MIV';
                        RAISERROR (@Status, 16, 1);
                        ROLLBACK TRANSACTION;
                        RETURN;
                    END
                END
                ELSE
                BEGIN
                    SET @Status = 'Error: Record not found';
                    RAISERROR (@Status, 16, 1);
                    ROLLBACK TRANSACTION;
                    RETURN;
                END
            END
            ELSE IF @TypeName = 'HMV'
            BEGIN
			    IF EXISTS (SELECT 1 FROM Requests WHERE LocItemID = @LocItemID AND RequestNO = @RequestNo AND CompanyID2 = @CompanyID AND TypeID = 3)
                BEGIN
                    SELECT @CurrentBalance = DelHmvQty, @ItemId = ItemId 
                    FROM Requests R
                    JOIN LocItems L ON L.LocItemID = R.LocItemID
                    WHERE R.LocItemID = @LocItemID AND R.RequestNo = @RequestNo AND R.CompanyID2 = @CompanyID AND R.TypeID = 3;

                    IF @CurrentBalance >= @TotalQty
                    BEGIN
                        --UPDATE LocItems
                        --SET Qty = Qty - @TotalQty
                        --WHERE LocItemID = @LocItemID;

                        SET @EnteredBy = @IssuedBy;

                        INSERT INTO LocItems 
                        (ItemId, Qty, OverQty, ShortageQty, DamageQty, NISQty, RejectQty, LocationID, EnteredBy, EnteredDate, ParentLocItemID, RemarkLocitemID,FlagMIVorHMV)
                        VALUES 
                        (@ItemId, 0, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, @SelectedLocation, @EnteredBy, GETDATE(), @LocItemID, @Remark,2);

                        SET @NewLocItemID = SCOPE_IDENTITY();

                        --INSERT INTO Requests (CompanyID, ContractId, MRCNO, AreaUnitID, ReqMivQty, ReserveMivQty, 
                        --DelMivQty, LocItemID, RequestNO, IssuedBy, IssuedDate, TypeId, ApprovedBy, ApprovedDate, ReqDate, RequestPDF, VendorID)
                        --SELECT 
                        --    CompanyID, 
                        --    ContractId, 
                        --    MRCNO, 
                        --    AreaUnitID, 
                        --    ReqMivQty, 
                        --    ReserveMivQty, 
                        --    @TotalQty, 
                        --    @NewLocItemID, 
                        --    RequestNO, 
                        --    IssuedBy, 
                        --    IssuedDate, 
                        --    1, 
                        --    ApprovedBy, 
                        --    ApprovedDate, 
                        --    ReqDate, 
                        --    RequestPDF, 
                        --    VendorID
                        --FROM Requests 
                        --WHERE LocItemID = @LocItemID AND RequestNO = @RequestNo AND CompanyID=@CompanyID AND TypeId=1;

                        --WITH CTE_Requests AS (
                        --    SELECT TOP 1 *
                        --    FROM Requests
                        --    WHERE LocItemID = @LocItemID AND RequestNO = @RequestNo AND CompanyID=@CompanyID AND TypeID=1
                        --    ORDER BY ReqLocItemID 
                        --)
                        --UPDATE CTE_Requests
                        --SET DelMivQty = ISNULL(DelMivQty, 0) - @TotalQty;

                        INSERT INTO Requests (CompanyID, ContractId, MRVNO, AreaUnitID, ReqMrvQty, DelMrvQty, 
                        LocItemID, DelMrvRejQty, Remark, RequestNO, MRCNO, TypeId, IssuedBy, DelDate,PLocItemIDforMRV)
                        VALUES 
                        ( 
                            @CompanyID,
                            @ContractId,
                            @MRVNO,
                            @AreaUnitID,
                            @ReqMrvQty,
                            @DelMrvQty,
                            @NewLocItemID,
                            @DelMrvRejQty,
                            @Remark,
                            FORMAT(@NextMRVNumber, 'D6'),
                            @RequestNo,
                            2,
                            @IssuedBy,
                            @DelDate,
							@LocItemID
                        );
                    END
                    ELSE
                    BEGIN
                        SET @Status = 'Error: Total quantity exceeds current balance-HMV';
                        RAISERROR (@Status, 16, 1);
                        ROLLBACK TRANSACTION;
                        RETURN;
                    END
                END
                ELSE
                BEGIN
                    SET @Status = 'Error: Record not found';
                    RAISERROR (@Status, 16, 1);
                    ROLLBACK TRANSACTION;
                    RETURN;
                END
  
            END

            FETCH NEXT FROM cursor_Mrv INTO @LocItemID, @ReqMrvQty, @DelMrvQty, @DelMrvRejQty, @Remark, @MRCNO, @SelectedLocation, @TypeName;
        END

        CLOSE cursor_Mrv;
        DEALLOCATE cursor_Mrv;

        COMMIT TRANSACTION;

        SELECT FORMAT(@NextMRVNumber - 1, 'D6') AS NewMRVNumber;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR (@ErrorMessage, 16, 1);
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[spInsertScope]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spInsertUnit]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spUpdateBalanceAndInsertLocItem]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateBalanceAndInsertLocItem]
    @ItemId INT,
    @LocItemID INT,
    @Qty DECIMAL(18, 2),
    @LocationID INT,
    @CurrentBalance DECIMAL(18, 2),  
    @EnteredBy INT
AS
BEGIN
    -- Check if the balance is greater than 0 and if Qty is valid
    IF @CurrentBalance > 0 AND @Qty <= @CurrentBalance
    BEGIN
        -- Update the existing LocItem balance by reducing the Qty
        UPDATE LocItems
        SET Qty = Qty - @Qty
        WHERE LocItemID = @LocItemID;

        -- Check if the Qty of the updated row has reached zero, if so, delete the row
        DELETE FROM LocItems
        WHERE LocItemID = @LocItemID AND Qty = 0;

        -- Check if the LocationID already exists for the same ItemId
        IF EXISTS (SELECT 1 FROM LocItems WHERE ItemId = @ItemId AND LocationID = @LocationID)
        BEGIN
            -- Update only one row's Qty for the matching LocationID and ItemId
            WITH CTE_LimitedUpdate AS (
                SELECT TOP 1 *
                FROM LocItems
                WHERE ItemId = @ItemId AND LocationID = @LocationID
                ORDER BY LocItemID -- Assuming LocItemID is unique or identifies a specific row
            )
            UPDATE CTE_LimitedUpdate
            SET Qty = Qty + @Qty;
        END
        ELSE
        BEGIN
            -- Insert new record for the new LocationID
            INSERT INTO LocItems (ItemId, Qty, OverQty, ShortageQty, DamageQty, NISQty, RejectQty, LocationID, EnteredBy, EnteredDate)
            VALUES (@ItemId, @Qty, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, @LocationID, @EnteredBy, GETDATE());
        END

        -- Return success
        SELECT 'Success' AS Status;
    END
    ELSE
    BEGIN
        -- Return an error if the balance is insufficient or the Qty is invalid
        SELECT 'Error: Insufficient balance or invalid quantity' AS Status;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[spUpdateBalanceAndInsertLocItem2]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateBalanceAndInsertLocItem2]
    @ItemId INT,
    @LocItemID INT,
    @Qty DECIMAL(18, 2),
    @LocationID INT,
    @CurrentBalance DECIMAL(18, 2),  -- تغییر نوع داده به decimal
    @EnteredBy INT
AS
BEGIN
    -- Check if the balance is greater than 0 and if Qty is valid
    IF @CurrentBalance > 0 AND @Qty <= @CurrentBalance
    BEGIN
        -- Update the existing LocItem balance by reducing the Qty
        UPDATE LocItems
        SET Qty = Qty - @Qty
        WHERE LocItemID = @LocItemID;
		
        -- Check if the Qty of the updated row has reached zero, if so, delete the row
        DELETE FROM LocItems
        WHERE LocItemID = @LocItemID AND Qty = 0;

        -- Check if the LocationID already exists for the same ItemId
        IF EXISTS (SELECT 1 FROM LocItems WHERE ItemId = @ItemId AND LocationID = @LocationID)
        BEGIN
            -- If it exists, update the existing record's Qty
		-- Use a CTE to limit the update to only one row
		WITH CTE_LimitedUpdate AS (
			SELECT TOP 1 *
			FROM LocItems
			WHERE ItemId = @ItemId AND LocationID = @LocationID
			ORDER BY LocItemID -- Assuming LocItemID is the primary key or an identifier for uniqueness
		)
		UPDATE CTE_LimitedUpdate
		SET Qty = Qty + @Qty;

        END
        ELSE
        BEGIN
            -- If it doesn't exist, insert a new record for the new LocationID
            INSERT INTO LocItems (ItemId, Qty, OverQty, ShortageQty, DamageQty, NISQty, RejectQty, LocationID, EnteredBy, EnteredDate)
            VALUES (@ItemId, @Qty, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, @LocationID, @EnteredBy, GETDATE());
        END

        -- Return success
        SELECT 'Success' AS Status;
    END
    ELSE
    BEGIN
        -- Return an error if the balance is insufficient or the Qty is invalid
        SELECT 'Error: Insufficient balance or invalid quantity' AS Status;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[spUpdateBalanceAndInsertLocItem2025]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateBalanceAndInsertLocItem2025]
    @ItemId INT,
    @LocItemID INT,
    @Qty DECIMAL(18, 2),
    @LocationID INT,
    @EnteredBy INT,
    @MrvOrNot DECIMAL(18, 2)
AS
BEGIN
    SET NOCOUNT ON;
	DECLARE @CurrentBalance DECIMAL(18, 2);
	DECLARE @NewLocItemID INT;
	--DECLARE @PPPLocItemID INT;

    -- بررسی مقدار MrvOrNot
    IF @MrvOrNot = 0
    BEGIN
        -- روال متفاوت در صورت برابر بودن MrvOrNot با 0
		-- محاسبه CurrentBalance برای LocItemID مشخص
		SELECT 
			@CurrentBalance = 
				(ISNULL(SUM(Requests.ReserveMivQty), 0) - 
				 ISNULL(SUM(Requests.DelMivQty), 0) - 
				 ISNULL(SUM(Requests.ReserveMivRejQty), 0) -
				 ISNULL(SUM(Requests.DelMivRejQty), 0) +
				 ISNULL(SUM(Requests.DelMrvQty), 0)+ 
				 ISNULL(SUM(Requests.DelMrvRejQty), 0))
		FROM 
		Requests
		WHERE 
			Requests.LocItemID = @LocItemID
			
        -- بررسی توازن و اعتبار Qty
        IF @CurrentBalance > 0 AND @Qty <= @CurrentBalance
        BEGIN
            BEGIN TRY
                -- بروزرسانی موجودی LocItem با کاهش Qty
                UPDATE Requests
                SET DelMrvQty = DelMrvQty - @Qty
                WHERE LocItemID = @LocItemID AND TypeID=2;
				--SELECT @PPPLocItemID=PLocItemIDforMRV FROM Requests WHERE  LocItemID=@LocItemID AND TypeID=2
                -- در صورت عدم وجود، اضافه کردن رکورد جدید برای LocationID
                INSERT INTO LocItems (ItemId, Qty, OverQty, ShortageQty, DamageQty, NISQty, RejectQty, LocationID, EnteredBy, EnteredDate, EditedBy, EditedDate, ParentLocItemID,RemarkLocitemID)
                SELECT ItemId, 0, 0, 0, 0, 0, 0, @LocationID, @EnteredBy, GETDATE(), @EnteredBy, GETDATE(), ParentLocItemID,RemarkLocitemID FROM LocItems WHERE LocItemID = @LocItemID;
				SET @NewLocItemID = SCOPE_IDENTITY();     
				
				INSERT INTO Requests (CompanyID, ContractId, MRCNO,MRVNO, AreaUnitID, 
                ReqMrvQty,DelMrvQty,DelMrvRejQty, LocItemID, RequestNO, IssuedBy, IssuedDate, TypeId, ApprovedBy, ApprovedDate, ReqDate, RequestPDF, VendorID,PLocItemIDforMRV,Remark,DelDate)
                SELECT 
                    CompanyID, 
                    ContractId, 
                    MRCNO, 
					MRVNO,
                    AreaUnitID, 
					ReqMrvQty,
                    @Qty, 
					DelMrvRejQty,
                    @NewLocItemID, 
                    RequestNO, 
                    IssuedBy, 
                    IssuedDate, 
                    2, 
                    ApprovedBy, 
                    ApprovedDate, 
                    ReqDate, 
                    RequestPDF, 
                    VendorID,
					PLocItemIDforMRV,
					Remark,
					DelDate
                FROM Requests 
                WHERE LocItemID = @LocItemID and TypeId=2;

  
			  -- حذف رکورد در صورت رسیدن Qty به صفر و نبودن در Requests
                DELETE FROM LocItems
                WHERE LocItemID = @LocItemID 
                  AND Qty = 0
                  AND NOT EXISTS (SELECT 1 FROM Requests WHERE LocItemID = @LocItemID);

               

                -- بازگشت موفقیت
                SELECT 'Success' AS Status;
            END TRY
            BEGIN CATCH
                -- مدیریت خطا در صورت بروز
                SELECT ERROR_MESSAGE() AS ErrorMessage, 'Error' AS Status;
            END CATCH
        END
        ELSE
        BEGIN
            -- بازگشت خطا در صورت عدم توازن کافی یا اعتبار Qty
            SELECT 'Error: Insufficient balance or invalid quantity' AS Status;
        END
        -- در اینجا فقط یک پیام موفقیت برای نمونه برمی‌گردانیم. شما می‌توانید کد روال مورد نظر را اضافه کنید.
        SELECT CONCAT( 'Alternative routine for MrvOrNot = 0 executed successfully',@CurrentBalance) AS Status;
    END
    ELSE
    BEGIN
        -- اجرای روال اصلی اگر MrvOrNot بزرگتر از 0 باشد

        -- محاسبه CurrentBalance برای LocItemID مشخص
-- محاسبه CurrentBalance برای LocItemID مشخص
		SELECT 
			@CurrentBalance = LocItems.Qty - 
				(ISNULL(LocItems.RejectQty, 0) + ISNULL(LocItems.NISQty, 0) + 
				 ISNULL(SUM(Requests.ReserveMivQty), 0) + 
				 ISNULL(SUM(Requests.DelMivQty), 0) + 
				 ISNULL(SUM(Requests.ReserveMivRejQty), 0) + 
				 ISNULL(SUM(Requests.DelMivRejQty), 0) -
				 ISNULL(SUM(Requests.DelMrvQty), 0) - 
				 ISNULL(SUM(Requests.DelMrvRejQty), 0))
		FROM 
			LocItems
		LEFT JOIN 
			Requests ON LocItems.LocItemID = Requests.LocItemID
		WHERE 
			LocItems.LocItemID = @LocItemID
		GROUP BY 
			LocItems.Qty, LocItems.RejectQty, LocItems.NISQty;


        -- بررسی توازن و اعتبار Qty
        IF @CurrentBalance > 0 AND @Qty <= @CurrentBalance
        BEGIN
            BEGIN TRY
                -- بروزرسانی موجودی LocItem با کاهش Qty
                UPDATE LocItems
                SET Qty = Qty - @Qty
                WHERE LocItemID = @LocItemID;

                -- حذف رکورد در صورت رسیدن Qty به صفر و نبودن در Requests
                DELETE FROM LocItems
                WHERE LocItemID = @LocItemID 
                  AND Qty = 0
                  AND NOT EXISTS (SELECT 1 FROM Requests WHERE LocItemID = @LocItemID);

				-- بررسی اگر رکوردی با LocItemID در Requests با TypeID = 2 موجود است
				DECLARE @ExistingLocItemID INT;
    
				SELECT TOP 1 @ExistingLocItemID = LocItemID
				FROM LocItems
				WHERE ItemId = @ItemId AND LocationID = @LocationID
				ORDER BY LocItemID;
						
				-- اگر رکوردی با این LocItemID در Requests با TypeID = 2 موجود نبود، سپس بروزرسانی را انجام دهد
				IF NOT EXISTS (SELECT 1 FROM Requests WHERE LocItemID = ISNULL(@ExistingLocItemID,0) AND TypeID = 2) 
				BEGIN
					-- استفاده از CTE برای بروزرسانی فقط یک رکورد
					WITH CTE_LimitedUpdate AS (
						SELECT TOP 1 *
						FROM LocItems
						WHERE ItemId = @ItemId AND LocationID = @LocationID 
						ORDER BY LocItemID
					)
					UPDATE CTE_LimitedUpdate
					SET Qty = Qty + @Qty;
				END  
                ELSE
                BEGIN
                    -- در صورت عدم وجود، اضافه کردن رکورد جدید برای LocationID
                    INSERT INTO LocItems (ItemId, Qty, OverQty, ShortageQty, DamageQty, NISQty, RejectQty, LocationID, EnteredBy, EnteredDate, EditedBy, EditedDate, ParentLocItemID)
                    VALUES (@ItemId, @Qty, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, @LocationID, @EnteredBy, GETDATE(), @EnteredBy, GETDATE(), @LocItemID);
                END

                -- بازگشت موفقیت
                SELECT 'Success' AS Status;
            END TRY
            BEGIN CATCH
                -- مدیریت خطا در صورت بروز
                SELECT ERROR_MESSAGE() AS ErrorMessage, 'Error' AS Status;
            END CATCH
        END
        ELSE
        BEGIN
            -- بازگشت خطا در صورت عدم توازن کافی یا اعتبار Qty
            SELECT 'Error: Insufficient balance or invalid quantity' AS Status;
        END
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[spUpdateBalanceAndInsertLocItem3]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateBalanceAndInsertLocItem3]
    @ItemId INT,
    @LocItemID INT,
    @Qty DECIMAL(18, 2),
    @LocationID INT,
    @CurrentBalance DECIMAL(18, 2),  -- تغییر نوع داده به decimal
    @EnteredBy INT
AS
BEGIN
    -- Check if the balance is greater than 0 and if Qty is valid
    IF @CurrentBalance > 0 AND @Qty <= @CurrentBalance
    BEGIN
        -- Update the existing LocItem balance by reducing the Qty
        UPDATE LocItems
        SET Qty = Qty - @Qty
        WHERE LocItemID = @LocItemID;
		
		 -- Check if the Qty of the updated row has reached zero, if so, delete the row unless it is used in the Requests table
		DELETE FROM LocItems
		WHERE LocItemID = @LocItemID 
		AND Qty = 0
		AND NOT EXISTS (SELECT 1 FROM Requests WHERE LocItemID = @LocItemID);


        -- Check if the LocationID already exists for the same ItemId
        IF EXISTS (SELECT 1 FROM LocItems WHERE ItemId = @ItemId AND LocationID = @LocationID)
        BEGIN
            -- If it exists, update the existing record's Qty
		-- Use a CTE to limit the update to only one row
		WITH CTE_LimitedUpdate AS (
			SELECT TOP 1 *
			FROM LocItems
			WHERE ItemId = @ItemId AND LocationID = @LocationID
			ORDER BY LocItemID -- Assuming LocItemID is the primary key or an identifier for uniqueness
		)
		UPDATE CTE_LimitedUpdate
		SET Qty = Qty + @Qty;

        END
        ELSE
        BEGIN
            -- If it doesn't exist, insert a new record for the new LocationID
            INSERT INTO LocItems (ItemId, Qty, OverQty, ShortageQty, DamageQty, NISQty, RejectQty, LocationID, EnteredBy, EnteredDate,ParentLocItemID)
            VALUES (@ItemId, @Qty, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, @LocationID, @EnteredBy, GETDATE(),@LocItemID);
        END

        -- Return success
        SELECT 'Success' AS Status;
    END
    ELSE
    BEGIN
        -- Return an error if the balance is insufficient or the Qty is invalid
        SELECT 'Error: Insufficient balance or invalid quantity' AS Status;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[spUpdateBalanceAndInsertLocItem4]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spUpdateBalanceAndInsertLocItem4]
    @ItemId INT,
    @LocItemID INT,
    @DelMrvQty DECIMAL(18, 2),
    @DelMrvRejQty DECIMAL(18, 2), -- اضافه شد
    @LocationID INT,
    @CurrentBalance DECIMAL(18, 2),
    @EnteredBy INT
AS
BEGIN
    DECLARE @TotalQty DECIMAL(18, 2);
    
    -- محاسبه کل مقدار بر اساس DelMrvQty و DelMrvRejQty
    SET @TotalQty = @DelMrvQty + @DelMrvRejQty;
    
    -- Check if the total Qty is valid and CurrentBalance is sufficient
    IF @CurrentBalance > 0 AND @TotalQty <= @CurrentBalance
    BEGIN
        -- Update the existing LocItem balance by reducing the total Qty
        UPDATE LocItems
        SET Qty = Qty - @TotalQty
        WHERE LocItemID = @LocItemID;
		
        -- Check if the Qty of the updated row has reached zero, if so, delete the row unless it is used in the Requests table
        DELETE FROM LocItems
        WHERE LocItemID = @LocItemID 
        AND Qty = 0
        AND NOT EXISTS (SELECT 1 FROM Requests WHERE LocItemID = @LocItemID);

        -- Check if the LocationID already exists for the same ItemId
        IF EXISTS (SELECT 1 FROM LocItems WHERE ItemId = @ItemId AND LocationID = @LocationID)
        BEGIN
            -- If it exists, update the existing record's Qty
            WITH CTE_LimitedUpdate AS (
                SELECT TOP 1 *
                FROM LocItems
                WHERE ItemId = @ItemId AND LocationID = @LocationID
                ORDER BY LocItemID
            )
            UPDATE CTE_LimitedUpdate
            SET Qty = Qty + @TotalQty;
        END
        ELSE
        BEGIN
            -- If it doesn't exist, insert a new record for the new LocationID
            INSERT INTO LocItems (ItemId, Qty, OverQty, ShortageQty, DamageQty, NISQty, RejectQty, LocationID, EnteredBy, EnteredDate, ParentLocItemID)
            VALUES (@ItemId, @TotalQty, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, @LocationID, @EnteredBy, GETDATE(), @LocItemID);
        END

        -- Return success
        SELECT 'Success' AS Status;
    END
    ELSE
    BEGIN
        -- Return an error if the balance is insufficient or the Qty is invalid
        SELECT 'Error: Insufficient balance or invalid quantity' AS Status;
    END
END;

GO
/****** Object:  StoredProcedure [dbo].[spUpdateBalanceAndInsertLocItem5]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateBalanceAndInsertLocItem5]
    @ItemId INT,
    @LocItemID INT,
    @DelMrvQty DECIMAL(18, 2),
    @DelMrvRejQty DECIMAL(18, 2),
    @LocationID INT,
    @CurrentBalance DECIMAL(18, 2),
    @EnteredBy INT,
    @Remark NVARCHAR(300),
    @Status NVARCHAR(50) OUTPUT  -- پارامتر خروجی برای وضعیت
AS
BEGIN
    DECLARE @TotalQty DECIMAL(18, 2);
    
    SET @TotalQty = @DelMrvQty + @DelMrvRejQty;
    
    IF @CurrentBalance > 0 AND @TotalQty <= @CurrentBalance
    BEGIN
        UPDATE LocItems
        SET Qty = Qty - @TotalQty
        WHERE LocItemID = @LocItemID;

        IF EXISTS (SELECT 1 FROM LocItems WHERE ItemId = @ItemId AND LocationID = @LocationID)
        BEGIN
            WITH CTE_LimitedUpdate AS (
                SELECT TOP 1 *
                FROM LocItems
                WHERE ItemId = @ItemId AND LocationID = @LocationID
                ORDER BY LocItemID
            )
            UPDATE CTE_LimitedUpdate
            SET Qty = Qty + @TotalQty;
        END
        ELSE
        BEGIN
            INSERT INTO LocItems 
            (ItemId, Qty, OverQty, ShortageQty, DamageQty, NISQty, RejectQty, LocationID, EnteredBy, EnteredDate, ParentLocItemID, RemarkLocitemID)
            VALUES 
            (@ItemId, @TotalQty, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, @LocationID, @EnteredBy, GETDATE(), @LocItemID, @Remark);
        END

        SET @Status = 'Success';  -- تنظیم وضعیت به موفقیت
    END
    ELSE
    BEGIN
        SET @Status = 'Error: Insufficient balance or invalid quantity';  -- تنظیم وضعیت به خطا
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[spUpdateBalanceAndInsertLocItem55]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateBalanceAndInsertLocItem55]
    @COMPANYID INT,
    @ItemId INT,
    @LocItemID INT,
    @DelMrvQty DECIMAL(18, 2),
    @DelMrvRejQty DECIMAL(18, 2),
    @LocationID INT,
    @CurrentBalance DECIMAL(18, 2),
    @EnteredBy INT,
    @Remark NVARCHAR(300),
	@REQUESTNOO NVARCHAR(50),
	@MRVNumber NVARCHAR(50),
    @Status NVARCHAR(50) OUTPUT  -- پارامتر خروجی برای وضعیت
AS
BEGIN
    DECLARE @TotalQty DECIMAL(18, 2);
    DECLARE @NewLocItemID INT;  -- متغیر برای ذخیره LocItemID جدید
    DECLARE @Message NVARCHAR(100);

	--SET @MRVNumber = FORMAT(@MRVNumber, 'D6');
	--SET @REQUESTNOO = FORMAT(@REQUESTNOO, 'D6');    
	SET @TotalQty = @DelMrvQty + @DelMrvRejQty;
    
    -- بررسی اینکه آیا موجودی کافی برای کسر وجود دارد یا نه
    IF @CurrentBalance > 0 AND @TotalQty <= @CurrentBalance
    BEGIN
        -- به‌روزرسانی LocItemID اولیه: کسر مقدار DelMrvQty و DelMrvRejQty از موجودی فعلی
        UPDATE LocItems
        SET Qty = Qty - @TotalQty
        WHERE LocItemID = @LocItemID;

        -- بررسی اینکه آیا LocItemID برای مکان جدید وجود دارد یا خیر
        IF EXISTS (SELECT 1 FROM LocItems WHERE ItemId = @ItemId AND LocationID = @LocationID AND LocItemID = @LocItemID)
        BEGIN
            -- به‌روزرسانی موجودی برای مکان جدید
            WITH CTE_LimitedUpdate AS (
                SELECT TOP 1 *
                FROM LocItems
                WHERE ItemId = @ItemId AND LocationID = @LocationID --AND LocItemID = @LocItemID
                ORDER BY LocItemID DESC
            )
            UPDATE CTE_LimitedUpdate
            SET Qty = Qty + @TotalQty;
        END
        ELSE
	    --IF EXISTS (SELECT 1 FROM LocItems WHERE ItemId = @ItemId AND LocationID = @LocationID)
     --   BEGIN
     --       -- به‌روزرسانی موجودی برای مکان جدید
     --       WITH CTE_LimitedUpdate AS (
     --           SELECT TOP 1 *
     --           FROM LocItems
     --           WHERE ItemId = @ItemId AND LocationID = @LocationID AND LocItemID = @LocItemID
     --           ORDER BY LocItemID DESC
     --       )
     --       UPDATE CTE_LimitedUpdate
     --       SET Qty = Qty + @TotalQty;
     --   END
     --   ELSE
        BEGIN
            -- درج یک رکورد جدید در LocItems برای مکان جدید
            INSERT INTO LocItems 
            (ItemId, Qty, OverQty, ShortageQty, DamageQty, NISQty, RejectQty, LocationID, EnteredBy, EnteredDate, ParentLocItemID, RemarkLocitemID)
            VALUES 
            (@ItemId, @TotalQty, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, @LocationID, @EnteredBy, GETDATE(), @LocItemID, @Remark);
            
            -- دریافت LocItemID جدید
            SET @NewLocItemID = SCOPE_IDENTITY();
        END
        
        -- اگر LocItemID جدید ساخته شد
        IF @NewLocItemID IS NOT NULL
        BEGIN
       --SET @NewLocItemID = SCOPE_IDENTITY();

		---- نمایش پیغام اول که می‌گوید LocItemID جدید ساخته شده است
		--RAISERROR('LocItemID جدید ساخته شد', 16, 1) WITH NOWAIT;

		---- ساخت پیغام که LocItemID جدید را نمایش می‌دهد
		--SET @Message = 'LocItemID جدید: ' + CAST(@NewLocItemID AS NVARCHAR(10));

		---- نمایش LocItemID جدید
		--RAISERROR(@Message, 16, 1) WITH NOWAIT;

		-- کسر مقادیر از LocItemID اولیه در جدول Requests
			   WITH CTE_Requests AS (
				SELECT TOP 1 *
				FROM Requests
				WHERE LocItemID = @LocItemID AND RequestNO = @RequestNOO AND CompanyID=@COMPANYID and TypeID=1
				ORDER BY ReqLocItemID  -- ترتیب بر اساس شناسه‌ای که ترتیب را مشخص کند (می‌توانید بر اساس نیاز تغییر دهید)
			)
			UPDATE CTE_Requests
			SET DelMivQty = ISNULL(DelMivQty, 0) - (@DelMrvQty+@DelMrvRejQty);

			
		   WITH CTE_Requests2forMRV AS (
			SELECT TOP 1 *
			FROM Requests
			WHERE LocItemID = @LocItemID AND RequestNO = @MRVNumber AND CompanyID=@COMPANYID and TypeID=2
			ORDER BY ReqLocItemID-- ترتیب بر اساس شناسه‌ای که ترتیب را مشخص کند (می‌توانید بر اساس نیاز تغییر دهید)
		)
		UPDATE CTE_Requests2forMRV
		SET DelMrvQty = ISNULL(DelMrvQty, 0) - @DelMrvQty,
			DelMrvRejQty = ISNULL(DelMrvRejQty, 0) - @DelMrvRejQty;


					    -- درج رکورد جدید در Requests برای LocItemID جدید
					   -- اولین INSERT
			INSERT INTO Requests (CompanyID, ContractId, MRVNO, AreaUnitID, ReqMrvQty, DelMrvQty, LocItemID, 
			DelMrvRejQty, Remark, RequestNO, TypeId, IssuedBy, DelDate,MRCNO)
			SELECT 
				CompanyID,
				ContractId,
				MRVNO,
				AreaUnitID,
				ReqMrvQty,
				@DelMrvQty,
				@NewLocItemID,
				@DelMrvRejQty,
				Remark,
				@MRVNumber,
				2,
				IssuedBy,
				DelDate,
				@REQUESTNOO
			FROM Requests
			WHERE LocItemID = @LocItemID AND RequestNO = @MRVNumber AND CompanyID=@COMPANYID AND TypeId=2;

			---- بررسی تعداد ردیف‌های درج شده
			--IF @@ROWCOUNT > 0
			--BEGIN
			--	RAISERROR('اولین INSERT با موفقیت انجام شد.', 16, 1) WITH NOWAIT;
			--END
			--ELSE
			--BEGIN
			--	RAISERROR('خطا در اولین INSERT: هیچ ردیفی درج نشد.', 16, 1);
			--END

			-- دومین INSERT
			INSERT INTO Requests (CompanyID, ContractId, MRCNO, AreaUnitID, ReqMivQty, ReserveMivQty, 
			DelMivQty, LocItemID, RequestNO, IssuedBy, IssuedDate, TypeId, ApprovedBy, ApprovedDate, ReqDate, RequestPDF, VendorID)
			SELECT 
				CompanyID, 
				ContractId, 
				MRCNO, 
				AreaUnitID, 
				ReqMivQty, 
				ReserveMivQty, 
				@TotalQty, 
				@NewLocItemID, 
				RequestNO, 
				IssuedBy, 
				IssuedDate, 
				1, 
				ApprovedBy, 
				ApprovedDate, 
				ReqDate, 
				RequestPDF, 
				VendorID
			FROM Requests 
			WHERE LocItemID = @LocItemID AND RequestNO = @RequestNOO AND CompanyID=@COMPANYID AND TypeId=1;

			---- بررسی تعداد ردیف‌های درج شده
			--IF @@ROWCOUNT > 0
			--BEGIN
			--	RAISERROR('دومین INSERT با موفقیت انجام شد.', 16, 1) WITH NOWAIT;
			--END
			--ELSE
			--BEGIN
			--	RAISERROR('خطا در دومین INSERT: هیچ ردیفی درج نشد.', 16, 1);
			--END

        
		   END


        SET @Status = 'Success';  -- تنظیم وضعیت به موفقیت
    END
    ELSE
    BEGIN
        SET @Status = 'Error: Insufficient balance or invalid quantity';  -- تنظیم وضعیت به خطا
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[spUpdateBalanceAndInsertLocItem6]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateBalanceAndInsertLocItem6]
    @ItemId INT,
    @LocItemID INT,
    @DelMrvQty DECIMAL(18, 2),
    @DelMrvRejQty DECIMAL(18, 2),
    @LocationID INT,
    @CurrentBalance DECIMAL(18, 2),
    @EnteredBy INT,
    @Remark NVARCHAR(300),
    @Status NVARCHAR(50) OUTPUT
AS
BEGIN
    DECLARE @TotalQty DECIMAL(18, 2);

    -- محاسبه مقدار کل
    SET @TotalQty = @DelMrvQty + @DelMrvRejQty;

    -- بررسی بالانس و مقدار
    IF @CurrentBalance > 0 AND @TotalQty <= @CurrentBalance
    BEGIN
        -- کسر مقدار از LocItemID اولیه
        UPDATE LocItems
        SET Qty = Qty - @TotalQty
        WHERE LocItemID = @LocItemID;

        -- اگر LocItemID جدیدی در آن LocationID وجود داشته باشد، مقدار را به آن اضافه کنید
        IF EXISTS (SELECT 1 FROM LocItems WHERE ItemId = @ItemId AND LocationID = @LocationID)
        BEGIN
            UPDATE LocItems
            SET Qty = Qty + @TotalQty
            WHERE ItemId = @ItemId AND LocationID = @LocationID;
        END
        ELSE
        BEGIN
            -- ایجاد رکورد جدید برای LocItemID جدید
            INSERT INTO LocItems 
            (ItemId, Qty, OverQty, ShortageQty, DamageQty, NISQty, RejectQty, LocationID, EnteredBy, EnteredDate, ParentLocItemID, RemarkLocitemID)
            VALUES 
            (@ItemId, @TotalQty, DEFAULT, DEFAULT, DEFAULT, DEFAULT, @DelMrvRejQty, @LocationID, @EnteredBy, GETDATE(), @LocItemID, @Remark);
        END

        SET @Status = 'Success';
    END
    ELSE
    BEGIN
        SET @Status = 'Error: Insufficient balance or invalid quantity';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[spUpdateExpireDate]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateExpireDate]
    @ItemIds dbo.IntItemIdList READONLY, -- لیستی از آیتم‌ها به‌صورت TVP
    @ExpireDate DATE
AS
BEGIN
    UPDATE Items
    SET ExpiredDate = @ExpireDate
    WHERE ItemId IN (SELECT Value FROM @ItemIds)
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateLocation]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spUpdateLocItemsLocation]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateLocItemsLocation]
    @LocItemIds dbo.IntLocItemsList READONLY,  -- TVP برای ارسال لیست LocItemID ها
    @NewLocationId INT
AS
BEGIN
    -- متغیر برای نگهداری تعداد مواردی که یک ItemId بیش از یک LocItemID دارد
    DECLARE @InvalidItemCount INT;

    -- بررسی اینکه هر ItemId مرتبط با LocItemID انتخاب شده فقط یک LocItemID داشته باشد
    SELECT @InvalidItemCount = COUNT(*)
    FROM LocItems LI
    WHERE EXISTS (
        SELECT 1 
        FROM LocItems LI2
        WHERE LI.ItemId = LI2.ItemId
        GROUP BY LI2.ItemId
        HAVING COUNT(LI2.LocItemID) > 1
    )
    AND LI.LocItemID IN (SELECT Value FROM @LocItemIds);

    -- اگر تعداد آیتم‌هایی که بیش از یک LocItemID دارند بیشتر از صفر بود، پیام خطا برگردان
    IF @InvalidItemCount > 0
    BEGIN
        SELECT 'Error: Some LocItems are part of an ItemID that has more than one LocItem. Each ItemID must have only one LocItem.' AS Status;
        RETURN;
    END

    -- ادامه به‌روزرسانی مکان (Location) در صورتی که شرط معتبر باشد
    UPDATE LocItems
    SET LocationId = @NewLocationId
    WHERE LocItemID IN (SELECT Value FROM @LocItemIds);

    -- بازگشت پیام موفقیت
    SELECT 'Success: Location updated successfully.' AS Status;
END;
GO
/****** Object:  StoredProcedure [dbo].[spUpdateLocItemsLocation2025]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateLocItemsLocation2025]
    @LocItemIds dbo.IntLocItemsList READONLY,  -- TVP برای ارسال لیست LocItemID ها
    @NewLocationId INT,
	@userID INT
AS
BEGIN
    ---- متغیر برای نگهداری تعداد مواردی که یک ItemId بیش از یک LocItemID دارد
    --DECLARE @InvalidItemCount INT;

    ---- بررسی اینکه هر ItemId مرتبط با LocItemID انتخاب شده فقط یک LocItemID داشته باشد
    --SELECT @InvalidItemCount = COUNT(*)
    --FROM LocItems LI
    --WHERE EXISTS (
    --    SELECT 1 
    --    FROM LocItems LI2
    --    WHERE LI.ItemId = LI2.ItemId
    --    GROUP BY LI2.ItemId
    --    HAVING COUNT(LI2.LocItemID) > 1
    --)
    --AND LI.LocItemID IN (SELECT Value FROM @LocItemIds);

    ---- اگر تعداد آیتم‌هایی که بیش از یک LocItemID دارند بیشتر از صفر بود، پیام خطا برگردان
    --IF @InvalidItemCount > 0
    --BEGIN
    --    SELECT 'Error: Some LocItems are part of an ItemID that has more than one LocItem. Each ItemID must have only one LocItem.' AS Status;
    --    RETURN;
    --END

    -- ادامه به‌روزرسانی مکان (Location) در صورتی که شرط معتبر باشد
    UPDATE LocItems
    SET LocationId = @NewLocationId,EditedBy=@userID
    WHERE LocItemID IN (SELECT Value FROM @LocItemIds);

    -- بازگشت پیام موفقیت
    SELECT 'Success: Location updated successfully.' AS Status;
END;
GO
/****** Object:  StoredProcedure [dbo].[spUpdateNISQty]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateNISQty]
    @LocItemID INT,
    @NisQty DECIMAL(18, 2),
    @Balance DECIMAL(18, 2)
AS
BEGIN
    -- چک کردن اینکه آیا مقدار NIS از Balance بیشتر است یا خیر
    IF @NisQty > @Balance
    BEGIN
        -- اگر NIS بیشتر از Balance باشد، عملیات متوقف شود
        RAISERROR('NIS quantity cannot be greater than the available balance.', 16, 1);
        RETURN;
    END

    -- به‌روزرسانی مقدار NISQty و Balance
    UPDATE LocItems
    SET NISQty = @NisQty
    WHERE LocItemID = @LocItemID;
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateRemarkLocItemID2025]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateRemarkLocItemID2025]
    @ItemId INT,
    @LocItemID INT,
    @RemarkLocitemID NVARCHAR(MAX),
    @EnteredBy INT
AS
BEGIN
    SET NOCOUNT ON;

    -- چک کردن اینکه آیا آیتم مورد نظر وجود دارد یا خیر
    IF EXISTS (SELECT 1 FROM LocItems WHERE ItemId = @ItemId AND LocItemID = @LocItemID)
    BEGIN
        -- بروزرسانی فیلد Remark برای آیتم و لوکیشن مشخص
        UPDATE LocItems
        SET RemarkLocitemID = @RemarkLocitemID,
            EditedBy = @EnteredBy,
            EditedDate = GETDATE()
        WHERE ItemId = @ItemId AND LocItemID = @LocItemID;

        -- در صورت موفقیت آمیز بودن عملیات، پیام "Success" برمی‌گردد
        SELECT 'Success' AS Result;
    END
    ELSE
    BEGIN
        -- در صورتی که آیتم مورد نظر وجود نداشته باشد، پیام خطا برمی‌گردد
        SELECT 'Error: Item or LocItemID not found' AS Result;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateScope]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spUpdateUnit]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[updateHmvCompany]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[updateHmvCompany]
    @RequestNO NVARCHAR(100),
    @HmvCompany int,
    @Success BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    SET @Success = 0;

    BEGIN TRANSACTION;
    BEGIN TRY
        UPDATE Requests 
        SET CompanyID2 = @HmvCompany 
        WHERE TypeID = 3 AND RequestNO = @RequestNO;

        -- Check if the update affected any rows
        IF @@ROWCOUNT > 0
        BEGIN
            SET @Success = 1;
        END

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR (@ErrorMessage, 16, 1);
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[updateHmvName]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateHmvName]
    @RequestNO NVARCHAR(100),
    @HmvNo NVARCHAR(MAX),
    @Success BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    SET @Success = 0;

    BEGIN TRANSACTION;
    BEGIN TRY
        UPDATE Requests 
        SET HMVNO = @HmvNo 
        WHERE TypeID = 3 AND RequestNO = @RequestNO;

        -- Check if the update affected any rows
        IF @@ROWCOUNT > 0
        BEGIN
            SET @Success = 1;
        END

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR (@ErrorMessage, 16, 1);
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateHMVQty2025]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateHMVQty2025]
    @UpdateMrvQtyTVP dbo.UpdateMrvQtType READONLY
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY
        -- استخراج CompanyID مربوط به MRVRequest و TypeID = 2
        DECLARE @CompanyID INT;
		DECLARE @DelHMVQtyLast decimal(18,2);
		DECLARE @DelHMVRejQtyLast decimal(18,2);

        SELECT TOP 1 @CompanyID = Requests.CompanyID , @DelHMVQtyLast=Requests.DelHmvQty,@DelHMVRejQtyLast=Requests.DelHmvRejQty
        FROM Requests
        WHERE Requests.RequestNO IN (SELECT MRVRequest FROM @UpdateMrvQtyTVP)
          AND TypeID = 3;

        IF @CompanyID IS NULL
        BEGIN
            THROW 50000, 'CompanyID not found for the provided MRVRequest.', 1;
        END

						-- تعریف جدول موقت
			DECLARE @AvailableData TABLE (
				LocItemID INT,                          -- شناسه موقعیت مکانی آیتم
				RequestNO NVARCHAR(50),                 -- شماره درخواست
				TypeName NVARCHAR(50),                  -- نوع درخواست (MIV یا HMV)
				ItemId INT,                             -- شناسه آیتم
				Tag NVARCHAR(50),                       -- برچسب آیتم
				Description NVARCHAR(MAX),              -- توضیحات آیتم
				UnitName NVARCHAR(50),                  -- نام واحد اندازه‌گیری
				TotalDelMivQty INT,                     -- مقدار کل تحویلی در MIV
				TotalDelMivRejQty INT,                  -- مقدار کل رد شده در MIV
				MrvHmvAvailableQty INT,                 -- مقدار قابل دسترس برای MRV و HMV
				TotalReqMrvQty INT,                     -- مجموع مقادیر درخواست شده در MRV (با علامت منفی)
				TotalDelMrvQty INT,                     -- مجموع مقادیر تحویل داده شده در MRV (با علامت منفی)
				TotalDelMrvRejQty INT,                  -- مجموع مقادیر رد شده در MRV (با علامت منفی)
				TotalDelHmvQty INT,                     -- مجموع مقادیر تحویل داده شده در HMV (با علامت منفی)
				TotalDelHmvRejQty INT,                  -- مجموع مقادیر رد شده در HMV (با علامت منفی)
				TotalGetHmvQty INT,                     -- مجموع مقادیر دریافت‌شده در HMV
				TotalGetHmvRejQty INT                   -- مجموع مقادیر رد شده در HMV
			);

			-- درج داده‌ها از پروسجر
			INSERT INTO @AvailableData (
				LocItemID,
				RequestNO,
				TypeName,
				ItemId,
				Tag,
				Description,
				UnitName,
				TotalDelMivQty,
				TotalDelMivRejQty,
				MrvHmvAvailableQty,
				TotalReqMrvQty,
				TotalDelMrvQty,
				TotalDelMrvRejQty,
				TotalDelHmvQty,
				TotalDelHmvRejQty,
				TotalGetHmvQty,
				TotalGetHmvRejQty
			)
			EXEC dbo.AllMaterialMrvHmvable2025 @CompanyID;


        -- بررسی موجودی مجاز بازگشتی برای PLocItemIDforMRV
        DECLARE @ValidationErrors NVARCHAR(MAX);

        SELECT 
            @ValidationErrors = STRING_AGG('LocItemID ' + CAST(tvp.LocItemID AS NVARCHAR) + ' exceeds the available quantity.', CHAR(13))
        FROM @UpdateMrvQtyTVP tvp
        LEFT JOIN @AvailableData AS AvailableData
            ON tvp.LocItemID = AvailableData.LocItemID
        WHERE tvp.DelMrvQty + tvp.DelMrvRejQty > AvailableData.MrvHmvAvailableQty+@DelHMVQtyLast+@DelHMVRejQtyLast;

        IF @ValidationErrors IS NOT NULL
        BEGIN
            ROLLBACK TRANSACTION;
            THROW 50001, @ValidationErrors, 1;
        END

        -- به‌روزرسانی مقادیر مورد نظر در جدول هدف
        UPDATE Requests
        SET 
            ReqHmvQty = tvp.ReqMrvQty,
            DelHmvQty = tvp.DelMrvQty,
            DelHmvRejQty = tvp.DelMrvRejQty,
            IssuedBy = tvp.EditedBy,
            IssuedDate = tvp.EditedDate
        FROM @UpdateMrvQtyTVP tvp
        WHERE Requests.LocItemID = tvp.LocItemID
          AND Requests.ReqLocItemID = tvp.ReqLocItemID
          AND Requests.RequestNO = tvp.MRVRequest
          AND TypeID = 3;



		  						-- تعریف جدول موقت
			DECLARE @AvailableData2 TABLE (
				LocItemID INT,                          -- شناسه موقعیت مکانی آیتم
				RequestNO NVARCHAR(50),                 -- شماره درخواست
				TypeName NVARCHAR(50),                  -- نوع درخواست (MIV یا HMV)
				ItemId INT,                             -- شناسه آیتم
				Tag NVARCHAR(50),                       -- برچسب آیتم
				Description NVARCHAR(MAX),              -- توضیحات آیتم
				UnitName NVARCHAR(50),                  -- نام واحد اندازه‌گیری
				TotalDelMivQty INT,                     -- مقدار کل تحویلی در MIV
				TotalDelMivRejQty INT,                  -- مقدار کل رد شده در MIV
				MrvHmvAvailableQty INT,                 -- مقدار قابل دسترس برای MRV و HMV
				TotalReqMrvQty INT,                     -- مجموع مقادیر درخواست شده در MRV (با علامت منفی)
				TotalDelMrvQty INT,                     -- مجموع مقادیر تحویل داده شده در MRV (با علامت منفی)
				TotalDelMrvRejQty INT,                  -- مجموع مقادیر رد شده در MRV (با علامت منفی)
				TotalDelHmvQty INT,                     -- مجموع مقادیر تحویل داده شده در HMV (با علامت منفی)
				TotalDelHmvRejQty INT,                  -- مجموع مقادیر رد شده در HMV (با علامت منفی)
				TotalGetHmvQty INT,                     -- مجموع مقادیر دریافت‌شده در HMV
				TotalGetHmvRejQty INT                   -- مجموع مقادیر رد شده در HMV
			);

			-- درج داده‌ها از پروسجر
			INSERT INTO @AvailableData2 (
				LocItemID,
				RequestNO,
				TypeName,
				ItemId,
				Tag,
				Description,
				UnitName,
				TotalDelMivQty,
				TotalDelMivRejQty,
				MrvHmvAvailableQty,
				TotalReqMrvQty,
				TotalDelMrvQty,
				TotalDelMrvRejQty,
				TotalDelHmvQty,
				TotalDelHmvRejQty,
				TotalGetHmvQty,
				TotalGetHmvRejQty
			)
			EXEC dbo.AllMaterialMrvHmvable2025 @CompanyID;



	
             -- بررسی موجودی مجاز بازگشتی برای PLocItemIDforMRV
        DECLARE @ValidationErrors2 NVARCHAR(MAX);

        SELECT 
            @ValidationErrors2 = STRING_AGG('MrvHmvAvailableQty cannot be negative after update. LocItemID ' + CAST(tvp.LocItemID AS NVARCHAR) + ' exceeds the available quantity.', CHAR(13))
        FROM @UpdateMrvQtyTVP tvp
        LEFT JOIN @AvailableData2 AS AvailableData2
            ON tvp.LocItemID = AvailableData2.LocItemID
        WHERE AvailableData2.MrvHmvAvailableQty<0;

     IF @ValidationErrors2 IS NOT NULL
		BEGIN
			ROLLBACK TRANSACTION;
			THROW 50002, @ValidationErrors2, 1;
		END;




        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;

GO
/****** Object:  StoredProcedure [dbo].[UpdateHMVRemark]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateHMVRemark]
    @UpdateMrvRemarkTVP dbo.UpdateMrvRemarkType READONLY
AS
BEGIN
    UPDATE Requests
    SET 
        Remark = tvp.RemarkRequests,
        IssuedBy = tvp.EditedBy,
        IssuedDate = tvp.EditedDate
    FROM @UpdateMrvRemarkTVP tvp
    WHERE Requests.LocItemID = tvp.LocItemID and RequestNO = tvp.MRVRequest and TypeID=3;
END



--CREATE PROCEDURE UpdateMRVRemark
--    @UpdateMrvRemarkMrvTVP dbo.UpdateMrvRemarkType READONLY
--AS
--BEGIN
--    -- مثال از نحوه به‌روزرسانی اطلاعات
--    UPDATE MRVTable
--    SET 
--        RemarkRequests = tvp.RemarkRequests,
--        MRVRequest = tvp.MRVRequest,
--        EditedBy = tvp.EditedBy,
--        EditedDate = tvp.EditedDate
--    FROM @UpdateMrvRemarkMrvTVP tvp
--    WHERE MRVTable.LocItemID = tvp.LocItemID;
--END;
--CREATE TYPE dbo.UpdateMrvRemarkType AS TABLE
--(
--    LocItemID INT,
--    RemarkRequests NVARCHAR(255),
--    MRVRequest NVARCHAR(255),
--    EditedBy NVARCHAR(50),
--    EditedDate DATETIME
--);
GO
/****** Object:  StoredProcedure [dbo].[UpdateInspectionDetails]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateInspectionDetails]
    @PLId INT,
    @IrnId INT,
    @IRN_Conflict BIT,
    @IVR_NO NVARCHAR(50),
    @IVR_IFR NVARCHAR(50),
    @OrderStatus NVARCHAR(100),
    @ThirdParty BIT,
    @OPI BIT,
    @Description NVARCHAR(MAX),
    @IcNo NVARCHAR(50),
    @SubProject NVARCHAR(100),
    @Site BIT,
    @Laydown BIT,
    @Warehouse BIT,
    @OSBL BIT,
    @VisualInspection BIT,
    @QuantityCheck BIT,
    @Marking BIT,
    @Unloading BIT,
    @EditedBy INT,
    @EditedDate DATETIME
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM Inspection WHERE PLId = @PLId)
    BEGIN
        -- به‌روزرسانی رکورد
        UPDATE Inspection
        SET 
            IRN_Conflict = @IRN_Conflict,
            IVR_NO = @IVR_NO,
            IVR_IFR = @IVR_IFR,
            OrderStatus = @OrderStatus,
            ThirdParty = @ThirdParty,
            OPI = @OPI,
            Description = @Description,
            IcNo = @IcNo,
            SubProject = @SubProject,
            Site = @Site,
            Laydown = @Laydown,
            Warehouse = @Warehouse,
            OSBL = @OSBL,
            VisualInspection = @VisualInspection,
            QuantityCheck = @QuantityCheck,
            Marking = @Marking,
            Unloading = @Unloading,
            EditedBy = @EditedBy,
            EditedDate = @EditedDate
        WHERE PLId = @PLId;
    END
    ELSE
    BEGIN
        -- درج رکورد جدید
        INSERT INTO Inspection
        (
            PLId,
            IrnId,
            IRN_Conflict,
            IVR_NO,
            IVR_IFR,
            OrderStatus,
            ThirdParty,
            OPI,
            Description,
            IcNo,
            SubProject,
            Site,
            Laydown,
            Warehouse,
            OSBL,
            VisualInspection,
            QuantityCheck,
            Marking,
            Unloading,
            EditedBy,
            EditedDate
        )
        VALUES
        (
            @PLId,
            @IrnId,
            @IRN_Conflict,
            @IVR_NO,
            @IVR_IFR,
            @OrderStatus,
            @ThirdParty,
            @OPI,
            @Description,
            @IcNo,
            @SubProject,
            @Site,
            @Laydown,
            @Warehouse,
            @OSBL,
            @VisualInspection,
            @QuantityCheck,
            @Marking,
            @Unloading,
            @EditedBy,
            @EditedDate
        );
    END
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateIRNPDF]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateIRNPDF]
    @IRNName NVARCHAR(255),
    @IRNPDF NVARCHAR(255)
AS
BEGIN
    UPDATE Irns
    SET IrnPdf = @IRNPDF
    WHERE IrnName = @IRNName;

	 -- Return the number of affected rows
    RETURN @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateLocItem]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateLocItemLocation]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateLocItemRemarkinMrv]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[UpdateLocItemRemarkinMrv]
    @UpdateLocItemRemarkMrvTVP dbo.UpdateLocItemRemarkMrvType READONLY
AS
BEGIN
    UPDATE LocItems
    SET 
        RemarkLocitemID = tvp.RemarkLocitemID,
        EditedBy = tvp.EditedBy,
        EditedDate = tvp.EditedDate
    FROM @UpdateLocItemRemarkMrvTVP tvp
    WHERE LocItems.LocItemID = tvp.LocItemID;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateMivRequestsBulk]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateMivRequestsBulk]
@UpdateData dbo.UpdateMivTableType READONLY
AS
BEGIN
    UPDATE Requests
    SET DelMivQty = u.DelMivQty,
        ReserveMivQty = 0
    FROM Requests r
    INNER JOIN @UpdateData u ON r.ReqLocItemID = u.ReqLocItemID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateMivRequestsBulk2]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[UpdateMivRequestsBulk2]
@UpdateData dbo.UpdateMivTableType READONLY,
@userid int
AS
BEGIN
    UPDATE Requests
    SET DelMivQty = u.DelMivQty,
        ReserveMivQty = 0,
		ApprovedBy = @userid,
		ApprovedDate =GETDATE()
    FROM Requests r
    INNER JOIN @UpdateData u ON r.ReqLocItemID = u.ReqLocItemID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateMrcField]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateMrcField]
    @MrcId INT,
    @ColumnName NVARCHAR(50),
    @NewValue NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    -- Construct dynamic SQL query to update the field
    DECLARE @SQL NVARCHAR(MAX);

    SET @SQL = 'UPDATE Mrcs SET ' + @ColumnName + ' = @NewValue WHERE MrcId = @MrcId';

    -- Execute the dynamic SQL query
    EXEC sp_executesql @SQL, N'@MrcId INT, @NewValue NVARCHAR(MAX)', @MrcId, @NewValue;
END
GO
/****** Object:  StoredProcedure [dbo].[updateMrvCompany]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[updateMrvCompany]
    @RequestNO NVARCHAR(100),
    @MrvCompany int,
    @Success BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    SET @Success = 0;

    BEGIN TRANSACTION;
    BEGIN TRY
        UPDATE Requests 
        SET CompanyID = @MrvCompany 
        WHERE TypeID = 2 AND RequestNO = @RequestNO;

        -- Check if the update affected any rows
        IF @@ROWCOUNT > 0
        BEGIN
            SET @Success = 1;
        END

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR (@ErrorMessage, 16, 1);
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[updateMrvName]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateMrvName]
    @RequestNO NVARCHAR(100),
    @MrvNo NVARCHAR(MAX),
    @Success BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    SET @Success = 0;

    BEGIN TRANSACTION;
    BEGIN TRY
        UPDATE Requests 
        SET MRVNO = @MrvNo 
        WHERE TypeID = 2 AND RequestNO = @RequestNO;

        -- Check if the update affected any rows
        IF @@ROWCOUNT > 0
        BEGIN
            SET @Success = 1;
        END

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR (@ErrorMessage, 16, 1);
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateMRVQty]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateMRVQty]
    @UpdateMrvQtyTVP dbo.UpdateMrvQtType READONLY
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY
        -- استخراج CompanyID مربوط به MRVRequest و TypeID = 2
        DECLARE @CompanyID INT;
        SELECT TOP 1 @CompanyID = Requests.CompanyID
        FROM Requests
        WHERE Requests.RequestNO IN (SELECT MRVRequest FROM @UpdateMrvQtyTVP)
          AND TypeID = 2;

        IF @CompanyID IS NULL
        BEGIN
            THROW 50000, 'CompanyID not found for the provided MRVRequest.', 1;
        END

			DECLARE @AvailableData TABLE (
				PLocItemIDforMRV INT,
				RequestNO NVARCHAR(50),
				TypeName NVARCHAR(50),
				ItemId INT,
				Tag NVARCHAR(50),
				Description NVARCHAR(255),
				UnitName NVARCHAR(50),
				MrvHmvAvailableQty DECIMAL(18, 2)
			);

			-- اطمینان حاصل کنید که تعداد و نوع ستون‌ها همخوانی دارند
			INSERT INTO @AvailableData (PLocItemIDforMRV, RequestNO, TypeName, ItemId, Tag, Description, UnitName, MrvHmvAvailableQty)
			EXEC dbo.AllMaterialMrvHmvable2025 @CompanyID;

        -- بررسی موجودی مجاز بازگشتی برای PLocItemIDforMRV
        DECLARE @ValidationErrors NVARCHAR(MAX);

        SELECT 
            @ValidationErrors = STRING_AGG('PLocItemIDforMRV ' + CAST(tvp.PLocItemIDforMRV AS NVARCHAR) + ' exceeds the available quantity.', CHAR(13))
        FROM @UpdateMrvQtyTVP tvp
        LEFT JOIN @AvailableData AS AvailableData
            ON tvp.PLocItemIDforMRV = AvailableData.PLocItemIDforMRV
        WHERE tvp.DelMrvQty + tvp.DelMrvRejQty > AvailableData.MrvHmvAvailableQty;

        IF @ValidationErrors IS NOT NULL
        BEGIN
            ROLLBACK TRANSACTION;
            THROW 50001, @ValidationErrors, 1;
        END

        -- به‌روزرسانی مقادیر مورد نظر در جدول هدف
        UPDATE Requests
        SET 
            ReqMrvQty = tvp.ReqMrvQty,
            DelMrvQty = tvp.DelMrvQty,
            DelMrvRejQty = tvp.DelMrvRejQty,
            IssuedBy = tvp.EditedBy,
            IssuedDate = tvp.EditedDate
        FROM @UpdateMrvQtyTVP tvp
        WHERE Requests.LocItemID = tvp.LocItemID
          AND Requests.ReqLocItemID = tvp.ReqLocItemID
          AND Requests.RequestNO = tvp.MRVRequest
          AND TypeID = 2;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;

GO
/****** Object:  StoredProcedure [dbo].[UpdateMRVQty2025]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateMRVQty2025]
    @UpdateMrvQtyTVP dbo.UpdateMrvQtType READONLY
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY
        -- استخراج CompanyID مربوط به MRVRequest و TypeID = 2
        DECLARE @CompanyID INT;
		DECLARE @DelMrvQtyLast decimal(18,2);
		DECLARE @DelMrvRejQtyLast decimal(18,2);
        SELECT TOP 1 @CompanyID = Requests.CompanyID , @DelMrvQtyLast=Requests.DelMrvQty,@DelMrvRejQtyLast=Requests.DelMrvRejQty
        FROM Requests
        WHERE Requests.RequestNO IN (SELECT MRVRequest FROM @UpdateMrvQtyTVP)
          AND TypeID = 2;

        IF @CompanyID IS NULL
        BEGIN
            THROW 50000, 'CompanyID not found for the provided MRVRequest.', 1;
        END

						-- تعریف جدول موقت
			DECLARE @AvailableData TABLE (
				LocItemID INT,                          -- شناسه موقعیت مکانی آیتم
				RequestNO NVARCHAR(50),                 -- شماره درخواست
				TypeName NVARCHAR(50),                  -- نوع درخواست (MIV یا HMV)
				ItemId INT,                             -- شناسه آیتم
				Tag NVARCHAR(50),                       -- برچسب آیتم
				Description NVARCHAR(MAX),              -- توضیحات آیتم
				UnitName NVARCHAR(50),                  -- نام واحد اندازه‌گیری
				TotalDelMivQty INT,                     -- مقدار کل تحویلی در MIV
				TotalDelMivRejQty INT,                  -- مقدار کل رد شده در MIV
				MrvHmvAvailableQty INT,                 -- مقدار قابل دسترس برای MRV و HMV
				TotalReqMrvQty INT,                     -- مجموع مقادیر درخواست شده در MRV (با علامت منفی)
				TotalDelMrvQty INT,                     -- مجموع مقادیر تحویل داده شده در MRV (با علامت منفی)
				TotalDelMrvRejQty INT,                  -- مجموع مقادیر رد شده در MRV (با علامت منفی)
				TotalDelHmvQty INT,                     -- مجموع مقادیر تحویل داده شده در HMV (با علامت منفی)
				TotalDelHmvRejQty INT,                  -- مجموع مقادیر رد شده در HMV (با علامت منفی)
				TotalGetHmvQty INT,                     -- مجموع مقادیر دریافت‌شده در HMV
				TotalGetHmvRejQty INT                   -- مجموع مقادیر رد شده در HMV
			);

			-- درج داده‌ها از پروسجر
			INSERT INTO @AvailableData (
				LocItemID,
				RequestNO,
				TypeName,
				ItemId,
				Tag,
				Description,
				UnitName,
				TotalDelMivQty,
				TotalDelMivRejQty,
				MrvHmvAvailableQty,
				TotalReqMrvQty,
				TotalDelMrvQty,
				TotalDelMrvRejQty,
				TotalDelHmvQty,
				TotalDelHmvRejQty,
				TotalGetHmvQty,
				TotalGetHmvRejQty
			)
			EXEC dbo.AllMaterialMrvHmvable2025 @CompanyID;


        -- بررسی موجودی مجاز بازگشتی برای PLocItemIDforMRV
        DECLARE @ValidationErrors NVARCHAR(MAX);

        SELECT 
            @ValidationErrors = STRING_AGG('PLocItemIDforMRV ' + CAST(tvp.PLocItemIDforMRV AS NVARCHAR) + ' exceeds the available quantity.', CHAR(13))
        FROM @UpdateMrvQtyTVP tvp
        LEFT JOIN @AvailableData AS AvailableData
            ON tvp.PLocItemIDforMRV = AvailableData.LocItemID
        WHERE tvp.DelMrvQty + tvp.DelMrvRejQty > AvailableData.MrvHmvAvailableQty+@DelMrvQtyLast+@DelMrvRejQtyLast;

        IF @ValidationErrors IS NOT NULL
        BEGIN
            ROLLBACK TRANSACTION;
            THROW 50001, @ValidationErrors, 1;
        END

        -- به‌روزرسانی مقادیر مورد نظر در جدول هدف
        UPDATE Requests
        SET 
            ReqMrvQty = tvp.ReqMrvQty,
            DelMrvQty = tvp.DelMrvQty,
            DelMrvRejQty = tvp.DelMrvRejQty,
            IssuedBy = tvp.EditedBy,
            IssuedDate = tvp.EditedDate
        FROM @UpdateMrvQtyTVP tvp
        WHERE Requests.LocItemID = tvp.LocItemID
          AND Requests.ReqLocItemID = tvp.ReqLocItemID
          AND Requests.RequestNO = tvp.MRVRequest
          AND TypeID = 2;



		  						-- تعریف جدول موقت
			DECLARE @AvailableData2 TABLE (
				LocItemID INT,                          -- شناسه موقعیت مکانی آیتم
				RequestNO NVARCHAR(50),                 -- شماره درخواست
				TypeName NVARCHAR(50),                  -- نوع درخواست (MIV یا HMV)
				ItemId INT,                             -- شناسه آیتم
				Tag NVARCHAR(50),                       -- برچسب آیتم
				Description NVARCHAR(MAX),              -- توضیحات آیتم
				UnitName NVARCHAR(50),                  -- نام واحد اندازه‌گیری
				TotalDelMivQty INT,                     -- مقدار کل تحویلی در MIV
				TotalDelMivRejQty INT,                  -- مقدار کل رد شده در MIV
				MrvHmvAvailableQty INT,                 -- مقدار قابل دسترس برای MRV و HMV
				TotalReqMrvQty INT,                     -- مجموع مقادیر درخواست شده در MRV (با علامت منفی)
				TotalDelMrvQty INT,                     -- مجموع مقادیر تحویل داده شده در MRV (با علامت منفی)
				TotalDelMrvRejQty INT,                  -- مجموع مقادیر رد شده در MRV (با علامت منفی)
				TotalDelHmvQty INT,                     -- مجموع مقادیر تحویل داده شده در HMV (با علامت منفی)
				TotalDelHmvRejQty INT,                  -- مجموع مقادیر رد شده در HMV (با علامت منفی)
				TotalGetHmvQty INT,                     -- مجموع مقادیر دریافت‌شده در HMV
				TotalGetHmvRejQty INT                   -- مجموع مقادیر رد شده در HMV
			);

			-- درج داده‌ها از پروسجر
			INSERT INTO @AvailableData2 (
				LocItemID,
				RequestNO,
				TypeName,
				ItemId,
				Tag,
				Description,
				UnitName,
				TotalDelMivQty,
				TotalDelMivRejQty,
				MrvHmvAvailableQty,
				TotalReqMrvQty,
				TotalDelMrvQty,
				TotalDelMrvRejQty,
				TotalDelHmvQty,
				TotalDelHmvRejQty,
				TotalGetHmvQty,
				TotalGetHmvRejQty
			)
			EXEC dbo.AllMaterialMrvHmvable2025 @CompanyID;



	
             -- بررسی موجودی مجاز بازگشتی برای PLocItemIDforMRV
        DECLARE @ValidationErrors2 NVARCHAR(MAX);

        SELECT 
            @ValidationErrors2 = STRING_AGG('MrvHmvAvailableQty cannot be negative after update. PLocItemIDforMRV ' + CAST(tvp.PLocItemIDforMRV AS NVARCHAR) + ' exceeds the available quantity.', CHAR(13))
        FROM @UpdateMrvQtyTVP tvp
        LEFT JOIN @AvailableData2 AS AvailableData2
            ON tvp.PLocItemIDforMRV = AvailableData2.LocItemID
        WHERE AvailableData2.MrvHmvAvailableQty<0;

     IF @ValidationErrors2 IS NOT NULL
		BEGIN
			ROLLBACK TRANSACTION;
			THROW 50002, @ValidationErrors2, 1;
		END;




        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;

GO
/****** Object:  StoredProcedure [dbo].[UpdateMRVRemark]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[UpdateMRVRemark]
    @UpdateMrvRemarkTVP dbo.UpdateMrvRemarkType READONLY
AS
BEGIN
    UPDATE Requests
    SET 
        Remark = tvp.RemarkRequests,
        IssuedBy = tvp.EditedBy,
        IssuedDate = tvp.EditedDate
    FROM @UpdateMrvRemarkTVP tvp
    WHERE Requests.LocItemID = tvp.LocItemID and RequestNO = tvp.MRVRequest and TypeID=2;
END



--CREATE PROCEDURE UpdateMRVRemark
--    @UpdateMrvRemarkMrvTVP dbo.UpdateMrvRemarkType READONLY
--AS
--BEGIN
--    -- مثال از نحوه به‌روزرسانی اطلاعات
--    UPDATE MRVTable
--    SET 
--        RemarkRequests = tvp.RemarkRequests,
--        MRVRequest = tvp.MRVRequest,
--        EditedBy = tvp.EditedBy,
--        EditedDate = tvp.EditedDate
--    FROM @UpdateMrvRemarkMrvTVP tvp
--    WHERE MRVTable.LocItemID = tvp.LocItemID;
--END;
--CREATE TYPE dbo.UpdateMrvRemarkType AS TABLE
--(
--    LocItemID INT,
--    RemarkRequests NVARCHAR(255),
--    MRVRequest NVARCHAR(255),
--    EditedBy NVARCHAR(50),
--    EditedDate DATETIME
--);
GO
/****** Object:  StoredProcedure [dbo].[UpdateMsrRev2025]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateMsrRev2025]
    @PLId INT,
    @MSRRev INT,
    @UserID INT,
    @NewMsrNo NVARCHAR(50) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- دریافت MSRNO مرتبط با PLId
        DECLARE @CurrentMsrNo NVARCHAR(50);
        SELECT TOP 1 @CurrentMsrNo = MSRNO
        FROM Packages
        WHERE PLId = @PLId;

        -- اگر MSRNO خالی بود، یک خطا برگردانید
        IF @CurrentMsrNo IS NULL
        BEGIN
            RAISERROR ('No MSRNO found for the provided PLId.', 16, 1);
            RETURN;
        END

        -- به‌روزرسانی MSRRev و تاریخ
        UPDATE Packages
        SET 
            MSRRev = @MSRRev,
            MSRRevDate = GETDATE(),
            MSRRevEnteredBy = @UserID
        WHERE PLId = @PLId;

        -- مقدار خروجی را تنظیم کنید
        SET @NewMsrNo = @CurrentMsrNo;

    END TRY
    BEGIN CATCH
        -- مدیریت خطاها
        THROW;
    END CATCH
END;

GO
/****** Object:  StoredProcedure [dbo].[UpdatePackage]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdatePackage2025Pluse]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdatePackage2025Pluse]
    @PKID INT,
    @PLId INT,
    @NetW DECIMAL(18,2),
    @GrossW DECIMAL(18,2),
    @Dimension VARCHAR(100),
    @Volume VARCHAR(100),
    @ArrivalDate DATETIME,
    @Desciption NVARCHAR(500),
    @Remark NVARCHAR(500),
    @EditedBy INT
AS
BEGIN
    BEGIN TRY
        UPDATE Packages
        SET 
            NetW = @NetW,
            GrossW = @GrossW,
            Dimension = @Dimension,
            Volume = @Volume,
            ArrivalDate = @ArrivalDate,
            Desciption = @Desciption,
            Remark = @Remark,
            EditedBy = @EditedBy,
            EditedDate = GETDATE()
        WHERE PKID = @PKID AND PLId = @PLId;

        SELECT 'Update successful' AS ResultMessage;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage, ERROR_LINE() AS ErrorLine;
    END CATCH;
END;

GO
/****** Object:  StoredProcedure [dbo].[UpdatePackageINPackingList]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdatePackingList]    Script Date: 4/10/2025 3:45:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdatePackingListPLDPF]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdatePackingListPLDPF]
    @PLName NVARCHAR(255),
    @PLDPF NVARCHAR(255)
AS
BEGIN
    UPDATE PackingLists
    SET PLDPF = @PLDPF
    WHERE PLName = @PLName;

    -- Return the number of affected rows
    RETURN @@ROWCOUNT;
END

GO
/****** Object:  StoredProcedure [dbo].[UpdatePKMSRPDF]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdatePKMSRPDF]
    @MSRNO NVARCHAR(255),
    @MSRPDF NVARCHAR(255)
AS
BEGIN
    UPDATE Packages
    SET MSRPDF = @MSRPDF
    WHERE MSRNO = @MSRNO;

	 -- Return the number of affected rows
    RETURN @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateRequestMIVPDF]    Script Date: 4/10/2025 3:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateRequestMIVPDF]
    @RequestNo NVARCHAR(255),
    @RequestPDF NVARCHAR(255)
AS
BEGIN
    UPDATE Requests
    SET RequestPDF = @RequestPDF
    WHERE RequestNO = @RequestNo;

	 -- Return the number of affected rows
    RETURN @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateStorageCodes]    Script Date: 4/10/2025 3:45:05 PM ******/
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Flag for MIV or HMV status' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LocItems', @level2type=N'COLUMN',@level2name=N'FlagMIVorHMV'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Parent LocItemID for MRV process' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Requests', @level2type=N'COLUMN',@level2name=N'PLocItemIDforMRV'
GO
