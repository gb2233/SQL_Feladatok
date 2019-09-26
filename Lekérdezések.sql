USE SQL_Projekt_Feladat

--2.
SELECT b.CustomerID, b.CCountry , SUM(b.Price) 'Total Amount'
FROM Bookings b
WHERE DATEPART(m,b.[Date]) = 5
GROUP BY b.CustomerID,b.CCountry
ORDER BY 'Total Amount' DESC

--3.
SELECT b.CCountry Country,
	ISNULL(SUM(case when DATEPART(m,b.[Date]) = 4 THEN b.Price END),0) '2019-04',
	ISNULL(SUM(case when DATEPART(m,b.[Date]) = 5 THEN b.Price END),0) '2019-05',
	ISNULL(SUM(case when DATEPART(m,b.[Date]) = 6 THEN b.Price END),0) '2019-06'
FROM Bookings b
WHERE b.DepartureStation = 'Luton' AND DATEPART(q,b.[Date]) = 2
GROUP BY b.CCountry
ORDER BY SUM(b.Price) DESC

--PIVOTTAL

SELECT * FROM 
(SELECT b.CCountry Country, FORMAT(b.[Date],'yyyy-MM') dpart, b.Price
	FROM Bookings b
	WHERE b.DepartureStation = 'Luton' AND DATEPART(q,b.[Date]) = 2) x
PIVOT (
SUM(x.Price)
FOR dpart IN ([2019-04],[2019-05],[2019-06])
) PivotTable;


--4.
SELECT cntQry.CCountry Country, 
	COUNT(case when cntQry.buyCnt = 1 THEN 1 ELSE null END) [1], 
	COUNT(case when cntQry.buyCnt = 2 THEN 1 ELSE null END) [2], 
	COUNT(case when cntQry.buyCnt = 3 THEN 1 ELSE null END) [3], 
	COUNT(case when cntQry.buyCnt BETWEEN 4 AND 10 THEN 1 ELSE null END) [4-10], 
	COUNT(case when cntQry.buyCnt BETWEEN 11 AND 100 THEN 1 ELSE null END) [10-100]
FROM (SELECT COUNT(b.BookingID) buyCnt, b.CustomerID, b.CCountry FROM Bookings b GROUP BY b.CustomerID,b.CCountry) cntQry
GROUP BY cntQry.CCountry
ORDER BY SUM(cntQry.buyCnt)
