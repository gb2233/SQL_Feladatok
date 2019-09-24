USE SQL_Projekt_Feladat
GO

SELECT cntQry.CCountry Country, 
	COUNT(case when cntQry.buyCnt = 1 THEN 1 ELSE null END) [1], 
	COUNT(case when cntQry.buyCnt = 2 THEN 1 ELSE null END) [2], 
	COUNT(case when cntQry.buyCnt = 3 THEN 1 ELSE null END) [3], 
	COUNT(case when cntQry.buyCnt IN (4,10) THEN 1 ELSE null END) [4-10], 
	COUNT(case when cntQry.buyCnt IN (10,100) THEN 1 ELSE null END) [10-100]
FROM (SELECT COUNT(b.BookingID) buyCnt, b.CustomerID, b.CCountry FROM Bookings b GROUP BY b.CustomerID,b.CCountry) cntQry
GROUP BY cntQry.CCountry

SELECT COUNT(b.BookingID) buyCnt, b.CustomerID, b.CCountry FROM Bookings b GROUP BY b.CustomerID,b.CCountry
SELECT * FROM Bookings WHERE CustomerID = 104830