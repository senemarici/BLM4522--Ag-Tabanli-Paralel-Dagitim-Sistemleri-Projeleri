USE master;
GO

CREATE LOGIN DenetleyiciLogin WITH PASSWORD = 'PerformansRaporu2026!';
GO

USE AdventureWorks2019;
GO

CREATE USER DenetleyiciUser FOR LOGIN DenetleyiciLogin;
GO

ALTER ROLE db_datareader ADD MEMBER DenetleyiciUser;
GO