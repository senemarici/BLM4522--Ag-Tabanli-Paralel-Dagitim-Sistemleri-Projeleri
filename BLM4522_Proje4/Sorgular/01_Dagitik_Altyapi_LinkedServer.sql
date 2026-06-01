USE master;
GO

EXEC sp_addlinkedserver 
    @server = N'DAX_REPLICA_SERVER', 
    @srvproduct = N'SQL Server';
GO

EXEC sp_addlinkedsrvlogin 
    @rmtsrvname = N'DAX_REPLICA_SERVER', 
    @useself = N'True';
GO

SELECT name AS [Sunucu Adi], provider AS [Saglayici], is_linked AS [Baglanti Durumu]
FROM sys.servers 
WHERE is_linked = 1;
GO