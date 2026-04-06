
USE master;
GO
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'Kurumsal_Sistem_DB')
    DROP DATABASE Kurumsal_Sistem_DB;
GO
CREATE DATABASE Kurumsal_Sistem_DB;
GO
USE Kurumsal_Sistem_DB;
GO

-- 2. Departmanlar
CREATE TABLE Departmanlar (
    DeptID INT PRIMARY KEY IDENTITY(1,1),
    DepartmanAd NVARCHAR(50)
);
INSERT INTO Departmanlar VALUES ('Yönetim'), ('Biliþim'), ('Muhasebe'), ('Satýþ'), ('IK'), ('Lojistik');

-- 3. Personeller 
CREATE TABLE Personeller (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Ad_Soyad NVARCHAR(100),
    TC_Kimlik CHAR(11),
    Maas DECIMAL(18,2),
    Eposta NVARCHAR(100),
    Sifre_Hash NVARCHAR(MAX),
    DeptID INT FOREIGN KEY REFERENCES Departmanlar(DeptID),
    Kayit_Tarihi DATETIME DEFAULT GETDATE()
);

SET NOCOUNT ON;
DECLARE @i INT = 1;
WHILE @i <= 100
BEGIN
    INSERT INTO Personeller (Ad_Soyad, TC_Kimlik, Maas, Eposta, Sifre_Hash, DeptID)
    VALUES (
        'Personel_' + CAST(@i AS NVARCHAR(10)),
        CAST(CAST(RAND()*10000000000 + 10000000000 AS BIGINT) AS CHAR(11)), -- Rastgele 11 haneli TC
        ROUND(RAND() * (50000 - 17002) + 17002, 2), -- Asgari ücret ile 50bin arasý maaþ
        'personel' + CAST(@i AS NVARCHAR(10)) + '@sirket.com',
        CONVERT(NVARCHAR(MAX), HASHBYTES('SHA2_256', CAST(@i AS NVARCHAR(10))), 2), -- Hashlenmiþ þifre görünümü
        (ABS(CHECKSUM(NEWID())) % 6) + 1 -- 1-6 arasý rastgele departman
    );
    SET @i = @i + 1;
END;