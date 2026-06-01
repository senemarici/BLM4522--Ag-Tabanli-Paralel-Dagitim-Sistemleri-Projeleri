USE AdventureWorks2019;
GO

SELECT TOP 5
    qs.execution_count AS [Çalýþtýrýlma Sayýsý],
    qs.total_worker_time / 1000 AS [Toplam CPU Zamaný (ms)],
    (qs.total_worker_time / qs.execution_count) / 1000 AS [Ortalama CPU Zamaný (ms)],
    SUBSTRING(st.text, (qs.statement_start_offset/2)+1,
        ((CASE qs.statement_end_offset
            WHEN -1 THEN DATALENGTH(st.text)
            ELSE qs.statement_end_offset
         END - qs.statement_start_offset)/2) + 1) AS [Sorgu Metni]
FROM sys.dm_exec_query_stats AS qs
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) AS st
ORDER BY qs.total_worker_time DESC;
GO