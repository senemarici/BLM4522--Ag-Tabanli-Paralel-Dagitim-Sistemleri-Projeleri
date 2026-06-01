USE master;
GO

CREATE PROCEDURE sp_AutomaticFailoverMonitor
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @DbStatus NVARCHAR(50);
    SELECT @DbStatus = state_desc FROM sys.databases WHERE name = 'AdventureWorks2019';
    IF @DbStatus <> 'ONLINE' OR @DbStatus IS NULL
    BEGIN
        SELECT 'TEHLIKE: Ana sunucu cokmus! Trafik otomatik olarak REPLICA sunucusuna kaydiriliyor.' AS [Failover Durumu];
        EXEC sp_DatabaseLoadBalancer @QueryType = 'READ', @SQLQuery = 'SELECT TOP 5 * FROM SalesOrderDetail_Replica';
    END
    ELSE
    BEGIN
        SELECT 'Sistem Saglikli: Ana sunucu aktif durumda.' AS [Failover Durumu];
    END
END;
GO

EXEC sp_AutomaticFailoverMonitor;
GO