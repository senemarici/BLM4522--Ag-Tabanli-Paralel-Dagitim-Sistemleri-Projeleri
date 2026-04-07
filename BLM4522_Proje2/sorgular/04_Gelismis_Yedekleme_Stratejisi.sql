USE Northwind;
GO

BACKUP DATABASE [Northwind] 
TO DISK = N'C:\Users\senem\Desktop\BLM4522\BLM4522_Proje2\Northwind_Final_Full.bak' 
WITH INIT, STATS = 10;
GO

BACKUP DATABASE [Northwind] 
TO DISK = N'C:\Users\senem\Desktop\BLM4522\BLM4522_Proje2\Northwind_Final_Diff.bak' 
WITH DIFFERENTIAL, STATS = 10;
GO