
-- A

BACKUP LOG SQL_Projekt_Feladat 
TO DISK = N'<Elérési Út>\tail_log.bak' 
	WITH 
		NORECOVERY, 
		NO_TRUNCATE
RESTORE DATABASE SQL_Projekt_Feladat  
FROM  DISK = N'<Elérési Út>\last_full.bak' 
   WITH NORECOVERY;  

RESTORE  DATABASE SQL_Projekt_Feladat 
FROM  DISK = N'<Elérési Út>\last_diff.bak' 
	WITH NORECOVERY;  
	
RESTORE LOG SQL_Projekt_Feladat 
FROM DISK = N'<Elérési Út>\log<NÉV>.bak' 
   WITH NORECOVERY;  

RESTORE LOG SQL_Projekt_Feladat
FROM DISK = N'<Elérési Út>\tail_log.bak' 
   WITH NORECOVERY;  

RESTORE DATABASE SQL_Projekt_Feladat   
   WITH RECOVERY;


-- B
go

RESTORE FILELISTONLY FROM DISK=N'<Elérési Út>\database.bak'

RESTORE DATABASE DatabaseCopy FROM DISK=N'<Elérési Út>\database.bak'
   WITH NORECOVERY, 
   MOVE 'DataBaseFile1' TO '<Elérési Út>\databaseCopy.mdf',  
   MOVE 'DataBaseLog' TO '<Elérési Út>\databaseCopy_Log.ldf';  

MERGE Database.target_table target
USING DatabaseCopy.source_table source
ON source.primary_key = target.primary_key
WHEN MATCHED
    THEN UPDATE SET 
		target.col1 = source.col1,
		target.col2 = source.col2
WHEN NOT MATCHED
    THEN INSERT (col1,col2) VALUES (val1,val2)
WHEN NOT MATCHED BY SOURCE
    THEN DELETE;