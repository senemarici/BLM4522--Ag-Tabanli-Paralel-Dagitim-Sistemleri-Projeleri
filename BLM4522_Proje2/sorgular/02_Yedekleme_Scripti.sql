BACKUP DATABASE [Northwind] 
TO DISK = N'C:\Users\senem\Desktop\BLM4522\Northwind_Otomatik.bak' 
WITH NOFORMAT, NOINIT, 
NAME = N'Northwind-Tam Yedek', 
SKIP, NOREWIND, NOUNLOAD, STATS = 10;