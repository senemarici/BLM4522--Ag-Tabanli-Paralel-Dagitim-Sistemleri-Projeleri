USE AdventureWorks2019;
GO

CREATE NONCLUSTERED INDEX IX_SalesOrderDetail_LineTotal_ModifiedDate 
ON [Sales].[SalesOrderDetail] ([LineTotal], [ModifiedDate]) 
INCLUDE ([CarrierTrackingNumber], [OrderQty], [UnitPrice]);
GO