USE SQL_Projekt_Feladat

SELECT OBJECT_NAME(object_id), avg_fragmentation_in_percent Fragmentation, page_count 'page cnt', page_count * 8 'Size in KB'
FROM sys.dm_db_index_physical_stats(DB_ID(),OBJECT_ID('Bookings'),NULL,NULL,'Detailed')
WHERE index_level = 0

SELECT
OBJECT_NAME(i.OBJECT_ID) AS TableName,
i.name AS IndexName,
i.index_id AS IndexID,
8 * SUM(a.used_pages) AS 'Indexsize(KB)'
FROM sys.indexes AS i
JOIN sys.partitions AS p ON p.OBJECT_ID = i.OBJECT_ID AND p.index_id = i.index_id
JOIN sys.allocation_units AS a ON a.container_id = p.partition_id
WHERE OBJECT_NAME(i.OBJECT_ID) = 'Bookings'
GROUP BY i.OBJECT_ID,i.index_id,i.name
ORDER BY OBJECT_NAME(i.OBJECT_ID),i.index_id
