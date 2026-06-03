USE AdventureWorks2019;
GO

TRUNCATE TABLE [dbo].[ETL_Clean_People];
GO

INSERT INTO [dbo].[ETL_Clean_People] (BusinessEntityID, FullName, RawPhoneNumber, CleanPhoneNumber)
SELECT 
    p.BusinessEntityID,
    ISNULL(p.FirstName, '') + ' ' + ISNULL(p.MiddleName + ' ', '') + ISNULL(p.LastName, '') AS FullName,
    ph.PhoneNumber AS RawPhoneNumber,
    REPLACE(REPLACE(REPLACE(REPLACE(ph.PhoneNumber, '-', ''), '(', ''), ')', ''), ' ', '') AS CleanPhoneNumber
FROM Person.Person p
INNER JOIN Person.PersonPhone ph ON p.BusinessEntityID = ph.BusinessEntityID;
GO

SELECT TOP 5 BusinessEntityID, FullName, RawPhoneNumber, CleanPhoneNumber 
FROM [dbo].[ETL_Clean_People];
GO

SELECT COUNT(*) AS [Yuklenen Temiz Satir Sayisi] 
FROM [dbo].[ETL_Clean_People];
GO