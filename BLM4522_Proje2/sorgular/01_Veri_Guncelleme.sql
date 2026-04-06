USE Northwind;
GO
UPDATE Customers 
SET ContactName = 'Senem Arici (Test)' 
WHERE CustomerID = 'ALFKI';
-- Kontrol için:
SELECT CustomerID, CompanyName, ContactName FROM Customers WHERE CustomerID = 'ALFKI';