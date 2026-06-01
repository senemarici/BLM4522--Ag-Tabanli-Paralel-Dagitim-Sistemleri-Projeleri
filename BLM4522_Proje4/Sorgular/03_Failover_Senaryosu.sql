USE master;
GO

ALTER DATABASE AdventureWorks2019 SET OFFLINE WITH ROLLBACK IMMEDIATE;
GO

SELECT TOP 5 SalesOrderID, LineTotal 
FROM AdventureWorks2019_Replica.dbo.SalesOrderDetail_Replica 
ORDER BY LineTotal DESC;
GO

ALTER DATABASE AdventureWorks2019 SET ONLINE;
GO