USE AdventureWorks2019;
GO

SELECT SalesOrderID, CarrierTrackingNumber, OrderQty, UnitPrice, LineTotal    
FROM Sales.SalesOrderDetail    
WHERE LineTotal > 3000 AND ModifiedDate BETWEEN '2011-01-01' AND '2013-12-31'    
ORDER BY LineTotal DESC;