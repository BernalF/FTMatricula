SELECT 	DISTINCT
		b.name,	
		a.row_count
FROM sys.dm_db_partition_stats a INNER JOIN sysobjects b
	ON a.object_id = b.id
WHERE b.xtype = 'U' AND a.row_count > 0