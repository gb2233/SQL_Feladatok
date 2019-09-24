USE SQL_Projekt_Feladat
GO

SELECT b.CustomerID, b.CCountry , SUM(b.Price) 'Total Amount'
FROM Bookings b
WHERE DATEPART(m,b.[Date]) = 5
GROUP BY b.CustomerID,b.CCountry
ORDER BY SUM(b.Price) DESC
