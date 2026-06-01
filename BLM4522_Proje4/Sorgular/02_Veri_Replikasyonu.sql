USE master;
GO

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'AdventureWorks2019_Replica')
BEGIN
    CREATE DATABASE AdventureWorks2019_Replica;
END
GO

USE AdventureWorks2019_Replica;
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SalesOrderDetail_Replica]') AND type in (N'U'))
BEGIN
    DROP TABLE [dbo].[SalesOrderDetail_Replica];
END
GO

SELECT * INTO AdventureWorks2019_Replica.dbo.SalesOrderDetail_Replica
FROM AdventureWorks2019.Sales.SalesOrderDetail;
GO

SELECT COUNT(*) AS [Toplam Kopyalanan Satir] 
FROM AdventureWorks2019_Replica.dbo.SalesOrderDetail_Replica;
GO