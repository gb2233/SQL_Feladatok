
USE SQL_Projekt_Feladat
GO

IF OBJECT_ID('dbo.Countries') IS NOT NULL
	BEGIN drop table Countries END
IF OBJECT_ID('dbo.Iso2Codes') IS NOT NULL
	BEGIN drop table Iso2Codes END

GO


CREATE TABLE Countries(
[asciiname] VARCHAR(255) NOT NULL PRIMARY KEY,
[country] VARCHAR(255) NOT NULL,
[population] int NOT NULL
)

BULK INSERT Countries
FROM 'C:\anyag\!Project\Solutions\SQL_Feladatok\countries.csv'
WITH (FORMAT='CSV',
	FIRSTROW=2,
	FIELDTERMINATOR = '|',
	ROWTERMINATOR = '0x0a')

CREATE TABLE Iso2Codes(
[Code] VARCHAR(2) NOT NULL,
[Name] VARCHAR(255) NOT NULL PRIMARY KEY
)

BULK INSERT Iso2Codes
FROM 'C:\anyag\!Project\Solutions\SQL_Feladatok\iso2.csv'
WITH (FORMAT='CSV',
	FIRSTROW=2,
	FIELDTERMINATOR = '|',
	ROWTERMINATOR = '0x0a')

GO
