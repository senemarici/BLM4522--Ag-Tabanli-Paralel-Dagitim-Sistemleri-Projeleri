USE Kurumsal_Sistem_DB;
GO

IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'Stajyer_Giris')
BEGIN
    CREATE LOGIN Stajyer_Giris WITH PASSWORD = 'Sifre.12345!', CHECK_POLICY = OFF;
END
GO

CREATE USER Stajyer_User FOR LOGIN Stajyer_Giris;
GO

GRANT SELECT ON Personeller(Ad_Soyad, Eposta, DeptID) TO Stajyer_User;
GRANT SELECT ON Departmanlar TO Stajyer_User;