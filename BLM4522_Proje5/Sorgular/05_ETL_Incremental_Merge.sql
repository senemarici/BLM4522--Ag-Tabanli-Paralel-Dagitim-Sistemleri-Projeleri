USE AdventureWorks2019;
GO

MERGE [dbo].[ETL_Clean_People] AS Target
USING (
    SELECT 
        p.BusinessEntityID,
        ISNULL(p.FirstName, '') + ' ' + ISNULL(p.MiddleName + ' ', '') + ISNULL(p.LastName, '') AS FullName,
        ph.PhoneNumber AS RawPhoneNumber,
        REPLACE(REPLACE(REPLACE(REPLACE(ph.PhoneNumber, '-', ''), '(', ''), ')', ''), ' ', '') AS CleanPhoneNumber
    FROM Person.Person p
    INNER JOIN Person.PersonPhone ph ON p.BusinessEntityID = ph.BusinessEntityID
    WHERE LEN(REPLACE(REPLACE(REPLACE(REPLACE(ph.PhoneNumber, '-', ''), '(', ''), ')', ''), ' ', '')) >= 10
) AS Source
ON (Target.BusinessEntityID = Source.BusinessEntityID)
WHEN MATCHED THEN
    UPDATE SET 
        Target.FullName = Source.FullName,
        Target.RawPhoneNumber = Source.RawPhoneNumber,
        Target.CleanPhoneNumber = Source.CleanPhoneNumber,
        Target.ExtractionDate = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (BusinessEntityID, FullName, RawPhoneNumber, CleanPhoneNumber, ExtractionDate)
    VALUES (Source.BusinessEntityID, Source.FullName, Source.RawPhoneNumber, Source.CleanPhoneNumber, GETDATE());
GO

SELECT 'Artimli Yukleme (MERGE ETL) basariyla icra edilmistir.' AS [ETL Durum Raporu];
GO