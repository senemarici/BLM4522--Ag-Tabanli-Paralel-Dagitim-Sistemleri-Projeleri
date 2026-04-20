USE Kurumsal_Sistem_DB;
GO

IF EXISTS (SELECT * FROM sys.symmetric_keys WHERE name = 'Veri_Sifreleme_Anahtari')
    DROP SYMMETRIC KEY Veri_Sifreleme_Anahtari;
IF EXISTS (SELECT * FROM sys.certificates WHERE name = 'Proje_Sertifikasi')
    DROP CERTIFICATE Proje_Sertifikasi;
GO

CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'GucluSifre.2026!';
GO

CREATE CERTIFICATE Proje_Sertifikasi WITH SUBJECT = 'Personel Veri Koruma';
GO

CREATE SYMMETRIC KEY Veri_Sifreleme_Anahtari
WITH ALGORITHM = AES_256
ENCRYPTION BY CERTIFICATE Proje_Sertifikasi;
GO