USE SQL_Projekt_Feladat

SET STATISTICS TIME ON;  
--2.
SELECT b.CustomerID, b.CCountry , SUM(b.Price) 'Total Amount'
FROM Bookings b
WHERE b.[Date] >= '2019-05-01' AND b.[Date] < '2019-06-01'
GROUP BY b.CustomerID,b.CCountry
ORDER BY 'Total Amount' DESC

--3.
SELECT b.CCountry Country,
	ISNULL(SUM(case when DATEPART(m,b.[Date]) = 4 THEN b.Price END),0) '2019-04',
	ISNULL(SUM(case when DATEPART(m,b.[Date]) = 5 THEN b.Price END),0) '2019-05',
	ISNULL(SUM(case when DATEPART(m,b.[Date]) = 6 THEN b.Price END),0) '2019-06'
FROM Bookings b
WHERE b.DepartureStation = 'Luton' AND b.[Date] >= '2019-04-01' AND b.[Date] < '2019-07-01'
GROUP BY b.CCountry
ORDER BY SUM(b.Price) DESC

--4.
SELECT cntQry.CCountry Country, 
	COUNT(case when cntQry.buyCnt = 1 THEN 1 ELSE null END) [1], 
	COUNT(case when cntQry.buyCnt = 2 THEN 1 ELSE null END) [2], 
	COUNT(case when cntQry.buyCnt = 3 THEN 1 ELSE null END) [3], 
	COUNT(case when cntQry.buyCnt BETWEEN 4 AND 9 THEN 1 ELSE null END) [4-10], 
	COUNT(case when cntQry.buyCnt BETWEEN 10 AND 100 THEN 1 ELSE null END) [10-100]
FROM (SELECT COUNT(b.BookingID) buyCnt, b.CustomerID, b.CCountry FROM Bookings b GROUP BY b.CustomerID,b.CCountry) cntQry
GROUP BY cntQry.CCountry
ORDER BY SUM(cntQry.buyCnt)

SET STATISTICS TIME OFF;  

--73MS
GO

CREATE NONCLUSTERED INDEX NC_Bookings_countryCid ON [dbo].[Bookings]
(
	[CCountry] ASC,
	[CustomerID] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]

CREATE NONCLUSTERED INDEX NC_Bookings_countryCidDate ON [dbo].[Bookings]
(
	[Date] ASC,
	[CCountry] ASC,
	[CustomerID] ASC
)
INCLUDE([Price]) 
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]

CREATE NONCLUSTERED INDEX NC_Bookings_countryDateStation ON [dbo].[Bookings]
(
	[DepartureStation] ASC,
	[Date] ASC,
	[CCountry] ASC
)
INCLUDE([Price])
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO

SET STATISTICS TIME ON;  

--2.
SELECT b.CustomerID, b.CCountry , SUM(b.Price) 'Total Amount'
FROM Bookings b
WHERE b.[Date] >= '2019-05-01' AND b.[Date] < '2019-06-01'
GROUP BY b.CustomerID,b.CCountry
ORDER BY 'Total Amount' DESC

--3.
SELECT b.CCountry Country,
	ISNULL(SUM(case when DATEPART(m,b.[Date]) = 4 THEN b.Price END),0) '2019-04',
	ISNULL(SUM(case when DATEPART(m,b.[Date]) = 5 THEN b.Price END),0) '2019-05',
	ISNULL(SUM(case when DATEPART(m,b.[Date]) = 6 THEN b.Price END),0) '2019-06'
FROM Bookings b
WHERE b.DepartureStation = 'Luton' AND b.[Date] >= '2019-04-01' AND b.[Date] < '2019-07-01'
GROUP BY b.CCountry
ORDER BY SUM(b.Price) DESC

--4.
SELECT cntQry.CCountry Country, 
	COUNT(case when cntQry.buyCnt = 1 THEN 1 ELSE null END) [1], 
	COUNT(case when cntQry.buyCnt = 2 THEN 1 ELSE null END) [2], 
	COUNT(case when cntQry.buyCnt = 3 THEN 1 ELSE null END) [3], 
	COUNT(case when cntQry.buyCnt BETWEEN 4 AND 9 THEN 1 ELSE null END) [4-10], 
	COUNT(case when cntQry.buyCnt BETWEEN 10 AND 100 THEN 1 ELSE null END) [10-100]
FROM (SELECT COUNT(b.BookingID) buyCnt, b.CustomerID, b.CCountry FROM Bookings b GROUP BY b.CustomerID,b.CCountry) cntQry
GROUP BY cntQry.CCountry
ORDER BY SUM(cntQry.buyCnt)

SET STATISTICS TIME OFF;  

--24MS