USE AdventureWorks2019;
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ETL_Error_Log]') AND type in (N'U'))
BEGIN
    DROP TABLE [dbo].[ETL_Error_Log];
END
GO

CREATE TABLE [dbo].[ETL_Error_Log] (
    [ErrorID] INT IDENTITY(1,1) PRIMARY KEY,
    [BusinessEntityID] INT,
    [InvalidValue] NVARCHAR(50),
    [ErrorMessage] NVARCHAR(250),
    [LogDate] DATETIME DEFAULT GETDATE()
);
GO

INSERT INTO [dbo].[ETL_Error_Log] (BusinessEntityID, InvalidValue, ErrorMessage)
SELECT 
    BusinessEntityID,
    PhoneNumber,
    'Hata: Temizleme sonrasi telefon numarasý uzunlugu kritik seviyede yetersiz.'
FROM Person.PersonPhone
WHERE LEN(REPLACE(REPLACE(REPLACE(REPLACE(PhoneNumber, '-', ''), '(', ''), ')', ''), ' ', '')) < 10;
GO

SELECT * FROM [dbo].[ETL_Error_Log];
GO