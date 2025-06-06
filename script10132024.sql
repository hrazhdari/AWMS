USE [master]
GO
/****** Object:  Database [AWMSdb]    Script Date: 10/13/2024 6:10:23 PM ******/
CREATE DATABASE [AWMSdb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AWMSdb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AWMSdb.mdf' , SIZE = 270336KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AWMSdb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AWMSdb_log.ldf' , SIZE = 532480KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AWMSdb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AWMSdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AWMSdb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AWMSdb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AWMSdb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AWMSdb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AWMSdb] SET ARITHABORT OFF 
GO
ALTER DATABASE [AWMSdb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AWMSdb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AWMSdb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AWMSdb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AWMSdb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AWMSdb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AWMSdb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AWMSdb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AWMSdb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AWMSdb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AWMSdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AWMSdb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AWMSdb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AWMSdb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AWMSdb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AWMSdb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [AWMSdb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AWMSdb] SET RECOVERY FULL 
GO
ALTER DATABASE [AWMSdb] SET  MULTI_USER 
GO
ALTER DATABASE [AWMSdb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AWMSdb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AWMSdb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AWMSdb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AWMSdb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AWMSdb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AWMSdb', N'ON'
GO
ALTER DATABASE [AWMSdb] SET QUERY_STORE = OFF
GO
USE [AWMSdb]
GO
/****** Object:  UserDefinedTableType [dbo].[ImportItemType]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  UserDefinedTableType [dbo].[IntItemIdList]    Script Date: 10/13/2024 6:10:23 PM ******/
CREATE TYPE [dbo].[IntItemIdList] AS TABLE(
	[Value] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[IntList]    Script Date: 10/13/2024 6:10:23 PM ******/
CREATE TYPE [dbo].[IntList] AS TABLE(
	[Value] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[IntLocItemsList]    Script Date: 10/13/2024 6:10:23 PM ******/
CREATE TYPE [dbo].[IntLocItemsList] AS TABLE(
	[Value] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ItemIDList]    Script Date: 10/13/2024 6:10:23 PM ******/
CREATE TYPE [dbo].[ItemIDList] AS TABLE(
	[ItemId] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ItemIDListType]    Script Date: 10/13/2024 6:10:23 PM ******/
CREATE TYPE [dbo].[ItemIDListType] AS TABLE(
	[ItemID] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ItemTableType]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  UserDefinedTableType [dbo].[LocItemIDListType]    Script Date: 10/13/2024 6:10:23 PM ******/
CREATE TYPE [dbo].[LocItemIDListType] AS TABLE(
	[LocItemID] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[NewMRVDtoType]    Script Date: 10/13/2024 6:10:23 PM ******/
CREATE TYPE [dbo].[NewMRVDtoType] AS TABLE(
	[ReqMrvQty] [decimal](18, 2) NULL,
	[DelMrvQty] [decimal](18, 2) NULL,
	[DelMrvRejQty] [decimal](18, 2) NULL,
	[LocItemID] [int] NULL,
	[Remark] [nvarchar](255) NULL,
	[SelectedLocation] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[NewRequestDtoType]    Script Date: 10/13/2024 6:10:23 PM ******/
CREATE TYPE [dbo].[NewRequestDtoType] AS TABLE(
	[ReqMivQty] [decimal](18, 2) NULL,
	[ReserveMivQty] [decimal](18, 2) NULL,
	[LocItemID] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[PackagePKIDDtoType]    Script Date: 10/13/2024 6:10:23 PM ******/
CREATE TYPE [dbo].[PackagePKIDDtoType] AS TABLE(
	[PKID] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[PackageType]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  UserDefinedTableType [dbo].[RequestDtoType]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  UserDefinedTableType [dbo].[RequestMivTableType]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  UserDefinedTableType [dbo].[UpdateLocItemLocationType]    Script Date: 10/13/2024 6:10:23 PM ******/
CREATE TYPE [dbo].[UpdateLocItemLocationType] AS TABLE(
	[LocItemID] [int] NULL,
	[LocationID] [int] NULL,
	[EditedBy] [nvarchar](100) NULL,
	[EditedDate] [datetime] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UpdateMivTableType]    Script Date: 10/13/2024 6:10:23 PM ******/
CREATE TYPE [dbo].[UpdateMivTableType] AS TABLE(
	[ReqLocItemID] [nvarchar](100) NULL,
	[DelMivQty] [decimal](18, 2) NULL
)
GO
/****** Object:  Table [dbo].[Packages]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  Table [dbo].[Items]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  View [dbo].[vw_ItemsWithPackages]    Script Date: 10/13/2024 6:10:23 PM ******/
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
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_vw_ItemsWithPackages]    Script Date: 10/13/2024 6:10:23 PM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_vw_ItemsWithPackages] ON [dbo].[vw_ItemsWithPackages]
(
	[ItemId] ASC,
	[PKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  Table [dbo].[ApplicationRole]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  Table [dbo].[ApplicationUser]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  Table [dbo].[AreaUnits]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  Table [dbo].[Companies]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  Table [dbo].[CompanyContracts]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  Table [dbo].[Desciplines]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  Table [dbo].[DescriptionForPks]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  Table [dbo].[Irns]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  Table [dbo].[Locations]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  Table [dbo].[LocItems]    Script Date: 10/13/2024 6:10:23 PM ******/
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
 CONSTRAINT [PK_LocItems] PRIMARY KEY CLUSTERED 
(
	[LocItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MIVNumbers]    Script Date: 10/13/2024 6:10:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MIVNumbers](
	[LastNumber] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mrs]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  Table [dbo].[PackingLists]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  Table [dbo].[Pos]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  Table [dbo].[Requests]    Script Date: 10/13/2024 6:10:23 PM ******/
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
 CONSTRAINT [PK_Requests] PRIMARY KEY CLUSTERED 
(
	[ReqLocItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequestTypes]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  Table [dbo].[Scopes]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  Table [dbo].[Shipments]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  Table [dbo].[Suppliers]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  Table [dbo].[UnitPrices]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  Table [dbo].[Units]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  Table [dbo].[Vendors]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  Index [IX_ApplicationUser_RoleID]    Script Date: 10/13/2024 6:10:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_ApplicationUser_RoleID] ON [dbo].[ApplicationUser]
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CompanyContracts_CompanyID]    Script Date: 10/13/2024 6:10:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_CompanyContracts_CompanyID] ON [dbo].[CompanyContracts]
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Item_PKID]    Script Date: 10/13/2024 6:10:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Item_PKID] ON [dbo].[Items]
(
	[PKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Item_ScopeID]    Script Date: 10/13/2024 6:10:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Item_ScopeID] ON [dbo].[Items]
(
	[ScopeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Item_UnitID]    Script Date: 10/13/2024 6:10:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Item_UnitID] ON [dbo].[Items]
(
	[UnitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Item_UnitPriceID]    Script Date: 10/13/2024 6:10:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Item_UnitPriceID] ON [dbo].[Items]
(
	[UnitPriceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Location_LocationName]    Script Date: 10/13/2024 6:10:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Location_LocationName] ON [dbo].[Locations]
(
	[LocationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_LocItem_ItemId]    Script Date: 10/13/2024 6:10:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_LocItem_ItemId] ON [dbo].[LocItems]
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_LocItem_LocationID]    Script Date: 10/13/2024 6:10:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_LocItem_LocationID] ON [dbo].[LocItems]
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Package_MSRNO]    Script Date: 10/13/2024 6:10:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Package_MSRNO] ON [dbo].[Packages]
(
	[MSRNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Package_PK]    Script Date: 10/13/2024 6:10:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Package_PK] ON [dbo].[Packages]
(
	[PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Package_PLId]    Script Date: 10/13/2024 6:10:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Package_PLId] ON [dbo].[Packages]
(
	[PLId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PackingList_ArchiveNO]    Script Date: 10/13/2024 6:10:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_PackingList_ArchiveNO] ON [dbo].[PackingLists]
(
	[ArchiveNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PackingList_AreaUnitID]    Script Date: 10/13/2024 6:10:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_PackingList_AreaUnitID] ON [dbo].[PackingLists]
(
	[AreaUnitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PackingList_DesciplineId]    Script Date: 10/13/2024 6:10:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_PackingList_DesciplineId] ON [dbo].[PackingLists]
(
	[DesciplineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PackingList_DescriptionForPkId]    Script Date: 10/13/2024 6:10:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_PackingList_DescriptionForPkId] ON [dbo].[PackingLists]
(
	[DescriptionForPkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PackingList_IrnId]    Script Date: 10/13/2024 6:10:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_PackingList_IrnId] ON [dbo].[PackingLists]
(
	[IrnId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PackingList_MrId]    Script Date: 10/13/2024 6:10:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_PackingList_MrId] ON [dbo].[PackingLists]
(
	[MrId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PackingList_OPINO]    Script Date: 10/13/2024 6:10:23 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_PackingList_OPINO] ON [dbo].[PackingLists]
(
	[OPINO] ASC
)
WHERE ([OPINO] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PackingList_PLNO]    Script Date: 10/13/2024 6:10:23 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_PackingList_PLNO] ON [dbo].[PackingLists]
(
	[PLNO] ASC
)
WHERE ([PLNO] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PackingList_PoId]    Script Date: 10/13/2024 6:10:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_PackingList_PoId] ON [dbo].[PackingLists]
(
	[PoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PackingList_ShId]    Script Date: 10/13/2024 6:10:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_PackingList_ShId] ON [dbo].[PackingLists]
(
	[ShId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PackingList_SupplierId]    Script Date: 10/13/2024 6:10:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_PackingList_SupplierId] ON [dbo].[PackingLists]
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PackingList_VendorId]    Script Date: 10/13/2024 6:10:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_PackingList_VendorId] ON [dbo].[PackingLists]
(
	[VendorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Pos_MrId]    Script Date: 10/13/2024 6:10:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Pos_MrId] ON [dbo].[Pos]
(
	[MrId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Request_CompanyID]    Script Date: 10/13/2024 6:10:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Request_CompanyID] ON [dbo].[Requests]
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Request_LocItemID]    Script Date: 10/13/2024 6:10:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Request_LocItemID] ON [dbo].[Requests]
(
	[LocItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Request_TypeID]    Script Date: 10/13/2024 6:10:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Request_TypeID] ON [dbo].[Requests]
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RequestType_TypeName]    Script Date: 10/13/2024 6:10:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_RequestType_TypeName] ON [dbo].[RequestTypes]
(
	[TypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Scope_ScopeName]    Script Date: 10/13/2024 6:10:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Scope_ScopeName] ON [dbo].[Scopes]
(
	[ScopeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Shipments_PoId]    Script Date: 10/13/2024 6:10:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Shipments_PoId] ON [dbo].[Shipments]
(
	[PoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UnitPrice_UnitPriceName]    Script Date: 10/13/2024 6:10:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_UnitPrice_UnitPriceName] ON [dbo].[UnitPrices]
(
	[UnitPriceName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Unit_UnitName]    Script Date: 10/13/2024 6:10:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Unit_UnitName] ON [dbo].[Units]
(
	[UnitName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
/****** Object:  StoredProcedure [dbo].[AddItemsFromTempTable]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddItemsFromTempTable2]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddLocItem]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddPackage]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddPackagesFromTempTable]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddPackingList]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AllItemSelectedPl]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AllMaterialMrvable]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AllMaterialMrvable2]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ALLmivNOTapproved]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[APPROVEmiv]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CheckMrcDuplicate]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CheckMrvCondition]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CheckPackageByName]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CheckPackageExistence]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteItems]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteLocItem]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteMultipleLocItems]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeletePackage]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeletePackages]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeletePackingList]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ExistsPackingListByOpiNumber]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ExistsPackingListByPlName]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ExistsPackingListByPlNo]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllLocItems]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllPackages]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllPackingLists]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllPackingListsNames]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetLastArchiveNo]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetLastPackage]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetLastPKID]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetLatestRequestNoByTypeId]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetLocItemById]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetLocItemOFSelectedItemID_FOR_ISSUE_VOUCHER]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetLocItemOFSelectedItemID_FOR_ISSUE_VOUCHER2]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetLocItemsByItemId]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetMivDataByRequestNO]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetMivDataByRequestNO_REAR]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetPackageById]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetPackageByPK]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetPackageCount]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetPackageId]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetPackagePKByPKID]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetPackagesByPLId]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetPackingListById]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetPackingListByPlName]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetPackingListsWithoutPackages]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetTotalIssueRecordCount]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetTotalItemsRecordCount]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertMRVBatch]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertMRVBatch2]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertMRVBatch3]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertMRVBatch4]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertMRVBatch5]    Script Date: 10/13/2024 6:10:23 PM ******/
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
    @RequestMrvs dbo.NewMRVDtoType READONLY
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
    DECLARE @Status NVARCHAR(50);  -- پارامتر برای دریافت وضعیت

    BEGIN TRANSACTION;

    -- Get the last MRV number and start from 1 if no MRV exists
    SELECT TOP 1 @NextMRVNumber = TRY_CAST(RequestNo AS INT) + 1
    FROM Requests
    WHERE TypeId = 2 AND TRY_CAST(RequestNo AS INT) IS NOT NULL
    ORDER BY TRY_CAST(RequestNo AS INT) DESC;

    IF @NextMRVNumber IS NULL
        SET @NextMRVNumber = 1;

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
                @Status = @Status OUTPUT;  -- دریافت وضعیت
        END

        FETCH NEXT FROM cur INTO @LocItemID, @SelectedLocation, @DelMrvQty, @DelMrvRejQty, @Remark;
    END

    CLOSE cur;
    DEALLOCATE cur;

    COMMIT TRANSACTION;

    -- Return the new MRV number
    SELECT FORMAT(@NextMRVNumber, 'D6') AS NewMRVNumber, @Status AS Status;  -- برگرداندن شماره MRV و وضعیت
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertRequestBatch]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertRequestMivsBatch]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[IsLocationUsedByItem]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[PDFSsectionIRN]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[PDFSsectionMIV]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[PDFSsectionPL]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Search_ChangeLocitem]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Search_ChangeLocitem2]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Search_ChangeLocitem3]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Search_ChangeLocitem4]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Search_ChangeLocitem5]    Script Date: 10/13/2024 6:10:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Search_ChangeLocitem5]
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
				--SUM(req.DelMrvRejQty * -1) AS TotalDelMrvRejQty,
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
					- ISNULL(SUM(rd.TotalDelMivRejQty),0) AS BalanceWithRejectAndNIS,
					--- ISNULL(SUM(rd.TotalDelMrvRejQty),0) AS BalanceWithRejectAndNIS,
                ISNULL(SUM(li.Qty), 0) 
                    - ISNULL(SUM(rd.TotalReserveMivQty), 0) 
                    - ISNULL(SUM(rd.TotalDelMivQty), 0) 
                    - ISNULL(SUM(li.NISQty), 0) 
                    - ISNULL(SUM(rd.TotalReturnAcceptQty), 0)
					- ISNULL(SUM(rd.TotalDelMivRejQty),0) AS BalanceWithReject,
					--- ISNULL(SUM(rd.TotalDelMrvRejQty),0) AS BalanceWithReject,
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
				--SUM(rd.TotalDelMrvRejQty) AS TotalDelMrvRejQty,
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
			--ISNULL(SUM(fi.TotalDelMrvRejQty), 0) AS DelMrvRejQty, 
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
/****** Object:  StoredProcedure [dbo].[Search_Item]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Search_Item2]    Script Date: 10/13/2024 6:10:23 PM ******/
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
            MAX(fi.NISQty) AS NISQty,
            MAX(fi.RejectQty) AS RejectQty,
            s.SupplierName AS Supplier -- Adding SupplierName from Supplier table
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
/****** Object:  StoredProcedure [dbo].[Search_LocItem]    Script Date: 10/13/2024 6:10:23 PM ******/
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
            MAX(fi.NISQty) AS NISQty,
            MAX(fi.RejectQty) AS RejectQty,
            s.SupplierName AS Supplier, -- Adding SupplierName from Supplier table
            fi.LocItemID, -- Add LocItemID to final select
            loc.LocationName -- Add LocationName from Location table
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
/****** Object:  StoredProcedure [dbo].[Search_Material_Issue_Voucher]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Search_Material_Issue_Voucher_NOLOCK]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Search_Material_Issue_Voucher_NOLOCK2]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Search_Material_Issue_Voucher2]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Search_Material_Issue_Voucher3]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Search_Material_Issue_Voucher4]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Search_Material_Issue_Voucher5]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Search_Material_Issue_Voucher6]    Script Date: 10/13/2024 6:10:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Search_Material_Issue_Voucher6]
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
/****** Object:  StoredProcedure [dbo].[Search_Miv]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AddItem]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AddItemWithAddLocitemWithTrigger]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AddUser]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AllItemSelectedPl]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_DeleteItem]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_DeleteUser]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetAllCompanyNames]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetAllItems]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetAllUsers]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetItemById]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetItemsByPlIdOptimized]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetItemsByPlIdOptimized2]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetItemsByPlIdOptimized3]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetItemsByPlIdWITH_IndexedView]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetItemsByPlIdWithCTE]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetItemsByPlIdWithLoopAndMergeJoin]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetItemsByPlIdWithLoopAndMergeJoin_WITH_IndexedView]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetItemsByPlIdWithTempTable]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetItemsByPlIdWithTempTableAndSubQuery]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetUserById]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetUserByUsername]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateItem]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateUser]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spDeleteLocation]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spDeleteScope]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spDeleteUnit]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spGetAllLocationChanges]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spGetAllLocations]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spGetAllScopes]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spGetAllUnits]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spGetLocationById]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spGetRequestsByLocItemId]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spGetRequestsByLocItemIds]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spGetScopeById]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spGetUnitById]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spInsertLocation]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spInsertScope]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spInsertUnit]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spUpdateBalanceAndInsertLocItem]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spUpdateBalanceAndInsertLocItem2]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spUpdateBalanceAndInsertLocItem3]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spUpdateBalanceAndInsertLocItem4]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spUpdateBalanceAndInsertLocItem5]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spUpdateExpireDate]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spUpdateLocation]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spUpdateLocItemsLocation]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spUpdateNISQty]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spUpdateScope]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spUpdateUnit]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateIRNPDF]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateLocItem]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateLocItemLocation]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateMivRequestsBulk]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateMivRequestsBulk2]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdatePackage]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdatePackageINPackingList]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdatePackingList]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdatePackingListPLDPF]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdatePKMSRPDF]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateRequestMIVPDF]    Script Date: 10/13/2024 6:10:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateStorageCodes]    Script Date: 10/13/2024 6:10:23 PM ******/
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
USE [master]
GO
ALTER DATABASE [AWMSdb] SET  READ_WRITE 
GO
