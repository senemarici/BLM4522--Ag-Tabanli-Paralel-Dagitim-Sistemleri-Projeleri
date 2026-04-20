USE Kurumsal_Sistem_DB;
SELECT TOP 5 * FROM Personeller;
GO

SELECT 
    event_time AS [Islem_Zamani],
    session_server_principal_name AS [Kullanici_Adi],
    statement AS [Calistirilan_Sorgu]
FROM sys.fn_get_audit_file(NULL, NULL, NULL)
ORDER BY event_time DESC;