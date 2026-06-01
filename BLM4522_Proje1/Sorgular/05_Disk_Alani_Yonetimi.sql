USE AdventureWorks2019;
GO

SELECT 
    name AS [Dosya Adi],
    type_desc AS [Dosya Turu],
    size * 8 / 1024 AS [Toplam Boyut (MB)],
    FILEPROPERTY(name, 'SpaceUsed') * 8 / 1024 AS [Kullanilan Alan (MB)],
    (size - FILEPROPERTY(name, 'SpaceUsed')) * 8 / 1024 AS [Bos Alan (MB)]
FROM sys.database_files;
GO