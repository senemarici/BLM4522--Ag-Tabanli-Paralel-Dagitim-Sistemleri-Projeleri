USE master;
GO

CREATE PROCEDURE sp_DatabaseLoadBalancer
    @QueryType NVARCHAR(10),
    @SQLQuery NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;
    IF @QueryType = 'READ'
    BEGIN
        EXEC('USE AdventureWorks2019_Replica; ' + @SQLQuery);
        SELECT 'Sorgu REPLICA sunucusuna yonlendirildi.' AS [Yuk Dengeleme Raporu];
    END
    ELSE
    BEGIN
        EXEC('USE AdventureWorks2019; ' + @SQLQuery);
        SELECT 'Sorgu MAIN sunucusuna yonlendirildi.' AS [Yuk Dengeleme Raporu];
    END
END;
GO

EXEC sp_DatabaseLoadBalancer @QueryType = 'READ', @SQLQuery = 'SELECT TOP 5 * FROM SalesOrderDetail_Replica';
GO