USE [AWMSdb]
GO
/****** Object:  UserDefinedTableType [dbo].[ImportItemType]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  UserDefinedTableType [dbo].[ItemIDList]    Script Date: 8/4/2024 10:21:47 PM ******/
CREATE TYPE [dbo].[ItemIDList] AS TABLE(
	[ItemId] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ItemIDListType]    Script Date: 8/4/2024 10:21:47 PM ******/
CREATE TYPE [dbo].[ItemIDListType] AS TABLE(
	[ItemID] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ItemTableType]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  UserDefinedTableType [dbo].[LocItemIDListType]    Script Date: 8/4/2024 10:21:47 PM ******/
CREATE TYPE [dbo].[LocItemIDListType] AS TABLE(
	[LocItemID] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[PackagePKIDDtoType]    Script Date: 8/4/2024 10:21:47 PM ******/
CREATE TYPE [dbo].[PackagePKIDDtoType] AS TABLE(
	[PKID] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[PackageType]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  UserDefinedTableType [dbo].[UpdateLocItemLocationType]    Script Date: 8/4/2024 10:21:47 PM ******/
CREATE TYPE [dbo].[UpdateLocItemLocationType] AS TABLE(
	[LocItemID] [int] NULL,
	[LocationID] [int] NULL,
	[EditedBy] [nvarchar](100) NULL,
	[EditedDate] [datetime] NULL
)
GO
/****** Object:  View [dbo].[vw_ItemsWithPackages]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddItemsFromTempTable]    Script Date: 8/4/2024 10:21:47 PM ******/
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
    ISNULL(u.UnitID, 0) AS UnitID,
    ISNULL(i.Qty, 0) AS Qty,
    ISNULL(i.OverQty, 0) AS OverQty,
    ISNULL(i.ShortageQty, 0) AS ShortageQty,
    ISNULL(i.DamageQty, 0) AS DamageQty,
    ISNULL(i.IncorectQty, 0) AS IncorectQty,
    ISNULL(s.ScopeID, 0) AS ScopeID,
    ISNULL(i.HeatNo, '') AS HeatNo,
    ISNULL(i.BatchNo, '') AS BatchNo,
    ISNULL(i.Remark, '') AS Remark,
    ISNULL(i.Price, 0) AS Price,
    ISNULL(up.UnitPriceID, 0) AS UnitPriceID,
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
        BaseMaterial
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
        UnitPriceID,  -- اضافه کردن UnitPriceID
        NetW,
        GrossW,
        BaseMaterial
    FROM #TempItems;

    -- بدست آوردن آیتم جدید ItemId
    SET @NewItemId = SCOPE_IDENTITY();

    -- مرحله چهارم: پاکسازی جدول موقت
    DROP TABLE #TempItems;
END
GO
/****** Object:  StoredProcedure [dbo].[AddLocItem]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddPackage]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddPackagesFromTempTable]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddPackingList]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AllItemSelectedPl]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CheckPackageByName]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CheckPackageExistence]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteItems]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteLocItem]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteMultipleLocItems]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeletePackage]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeletePackages]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeletePackingList]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ExistsPackingListByOpiNumber]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ExistsPackingListByPlName]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ExistsPackingListByPlNo]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllLocItems]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllPackages]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllPackingLists]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllPackingListsNames]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetLastArchiveNo]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetLastPackage]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetLastPKID]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetLocItemById]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetLocItemsByItemId]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetPackageById]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetPackageByPK]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetPackageCount]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetPackageId]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetPackagePKByPKID]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetPackagesByPLId]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetPackingListById]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetPackingListByPlName]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetPackingListsWithoutPackages]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[IsLocationUsedByItem]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AddItem]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AddItemWithAddLocitemWithTrigger]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AddUser]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AllItemSelectedPl]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_DeleteItem]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_DeleteUser]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetAllItems]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetAllUsers]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetItemById]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetItemsByPlIdOptimized]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetItemsByPlIdOptimized2]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetItemsByPlIdOptimized3]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetItemsByPlIdWITH_IndexedView]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetItemsByPlIdWithCTE]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetItemsByPlIdWithLoopAndMergeJoin]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetItemsByPlIdWithLoopAndMergeJoin_WITH_IndexedView]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetItemsByPlIdWithTempTable]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetItemsByPlIdWithTempTableAndSubQuery]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetUserById]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetUserByUsername]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateItem]    Script Date: 8/4/2024 10:21:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateItem]
    @ItemId INT,
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
        MTRNo = @MTRNo,
        ColorCode = @ColorCode,
        LabelNo = @LabelNo,
        EnteredBy = @EnteredBy,
        EnteredDate = @EnteredDate,
        EditedBy = @EditedBy,
        EditedDate = @EditedDate,
        Price = @Price,
        UnitPriceID = @UnitPriceID,
        NetW = @NetW,
        GrossW = @GrossW,
        ItemCodeId = @ItemCodeId,
        BaseMaterial = @BaseMaterial,
        Hold = @Hold,
        NIS = @NIS
    WHERE ItemId = @ItemId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateUser]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spDeleteLocation]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spDeleteScope]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spDeleteUnit]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spGetAllLocations]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spGetAllScopes]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spGetAllUnits]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spGetLocationById]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spGetScopeById]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spGetUnitById]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spInsertLocation]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spInsertScope]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spInsertUnit]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spUpdateLocation]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spUpdateScope]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spUpdateUnit]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateLocItem]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateLocItemLocation]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdatePackage]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdatePackageINPackingList]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdatePackingList]    Script Date: 8/4/2024 10:21:47 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateStorageCodes]    Script Date: 8/4/2024 10:21:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateStorageCodes]
    @ItemIds dbo.ItemIDList READONLY,
    @NewStorageCode NVARCHAR(50)
AS
BEGIN
    UPDATE Items
    SET StorageCode = @NewStorageCode
    WHERE ItemId IN (SELECT ItemId FROM @ItemIds)
END
GO
