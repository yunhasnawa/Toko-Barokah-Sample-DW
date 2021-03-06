USE master;
GO


-- Restore database dengan menyalin file-filenya ke C:\sql
RESTORE DATABASE [TokoBarokah] 
FILE = N'TokoBarokah' 
FROM DISK = N'C:\sql\TokoBarokah.bak' 
	WITH 
		FILE = 1,
		MOVE N'TokoBarokah_log' TO  N'C:\sql\TokoBarokah.ldf',
		MOVE N'TokoBarokah' TO  N'C:\sql\TokoBarokah.mdf',
		NOUNLOAD,  STATS = 10
GO

-- Mengganti kepemilikan menjadi local user administrator
USE TokoBarokah;
GO

EXECUTE sp_changedbowner 'sa';
GO
