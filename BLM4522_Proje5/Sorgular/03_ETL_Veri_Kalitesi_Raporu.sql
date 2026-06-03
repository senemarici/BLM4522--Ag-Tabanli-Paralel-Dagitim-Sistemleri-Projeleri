USE AdventureWorks2019;
GO

DECLARE @SourceCount INT;
DECLARE @TargetCount INT;

SELECT @SourceCount = COUNT(*) FROM Person.PersonPhone;
SELECT @TargetCount = COUNT(*) FROM [dbo].[ETL_Clean_People];

SELECT 
    @SourceCount AS [Kaynak Toplam Satir],
    @TargetCount AS [Hedef Temizlenen Satir],
    (@SourceCount - @TargetCount) AS [Kayip/Elenen Veri Sayisi],
    CAST((CAST(@TargetCount AS FLOAT) / CAST(@SourceCount AS FLOAT)) * 100 AS DECIMAL(5,2)) AS [ETL Basari Orani (%)];
GO