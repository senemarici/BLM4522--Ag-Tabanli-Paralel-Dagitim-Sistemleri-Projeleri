USE Kurumsal_Sistem_DB;
GO

DECLARE @ZafiyetliInput NVARCHAR(100) = ''' OR 1=1 --'; 

EXEC('SELECT * FROM Personeller WHERE Eposta = ' + @ZafiyetliInput);

GO

DECLARE @SafeInput NVARCHAR(100) = ''' OR 1=1 --';

SELECT * FROM Personeller 
WHERE Eposta = @SafeInput; 
