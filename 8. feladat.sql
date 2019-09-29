USE tempdb
go
ALTER DATABASE [tempdb] ADD FILE ( NAME = N'temp5', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\temp5.ndf' , SIZE = 10GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [tempdb] ADD FILE ( NAME = N'temp6', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\temp6.ndf' , SIZE = 10GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [tempdb] ADD FILE ( NAME = N'temp7', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\temp7.ndf' , SIZE = 10GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [tempdb] ADD FILE ( NAME = N'temp8', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\temp8.ndf' , SIZE = 10GB , FILEGROWTH = 65536KB )
GO

DBCC SHRINKFILE (N'tempdev' , EMPTYFILE)
GO
DBCC SHRINKFILE (N'tempdev', 10240)
GO
DBCC SHRINKFILE (N'temp2' , EMPTYFILE)
GO
DBCC SHRINKFILE (N'temp2', 10240)
GO
DBCC SHRINKFILE (N'temp3' , EMPTYFILE)
GO
DBCC SHRINKFILE (N'temp3', 10240)
GO
DBCC SHRINKFILE (N'temp4' , EMPTYFILE)
GO
DBCC SHRINKFILE (N'temp4', 10240)
GO