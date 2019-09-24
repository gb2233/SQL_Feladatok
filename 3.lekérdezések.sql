USE SQL_Projekt_Feladat
GO

SELECT b.CCountry Country,
	ISNULL(SUM(case when DATEPART(m,b.[Date]) = 4 THEN b.Price END),0) '2019-04',
	ISNULL(SUM(case when DATEPART(m,b.[Date]) = 5 THEN b.Price END),0) '2019-05',
	ISNULL(SUM(case when DATEPART(m,b.[Date]) = 6 THEN b.Price END),0) '2019-06'
FROM Bookings b
WHERE b.DepartureStation = 'Luton' AND DATEPART(q,b.[Date]) = 2
GROUP BY b.CCountry