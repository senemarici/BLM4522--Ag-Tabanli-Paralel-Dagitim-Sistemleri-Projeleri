USE AdventureWorks2019;
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ETL_Clean_People]') AND type in (N'U'))
BEGIN
    DROP TABLE [dbo].[ETL_Clean_People];
END
GO

CREATE TABLE [dbo].[ETL_Clean_People] (
    [BusinessEntityID] INT PRIMARY KEY,
    [FullName] NVARCHAR(200),
    [RawPhoneNumber] NVARCHAR(50),
    [CleanPhoneNumber] NVARCHAR(50),
    [ExtractionDate] DATETIME DEFAULT GETDATE()
);
GO

SELECT 
    COUNT(*) AS [Toplam Telefon Kaydi],
    SUM(CASE WHEN PhoneNumber LIKE '%-%' THEN 1 ELSE 0 END) AS [Tire Iceren Kayit Sayisi],
    SUM(CASE WHEN PhoneNumber LIKE '%(%' OR PhoneNumber LIKE '%)%' THEN 1 ELSE 0 END) AS [Parantez Iceren Kayit Sayisi],
    SUM(CASE WHEN PhoneNumber LIKE '% %' THEN 1 ELSE 0 END) AS [Bosluk Iceren Kayit Sayisi]
FROM Person.PersonPhone;
GO