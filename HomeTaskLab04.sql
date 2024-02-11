-- Question 1

SELECT *
FROM [Northwind].[dbo].[Products]
WHERE UnitPrice > (
    SELECT AVG(UnitPrice)
    FROM [Northwind].[dbo].[Products]
);

 -- Question 2
SELECT ShippedDate, COUNT(*) AS NumberOfOrders
FROM Orders
Group by ShippedDate
order  by ShippedDate

-- Question 3

Select Country from Suppliers Group by Country having COUNT(*) >= 2



-- Question 4
SELECT Month(ShippedDate) as MonthNumber, COUNT(*) AS OrderDelayed
FROM Orders
where ShippedDate is not null 
and ShippedDate >  RequiredDate
Group by Month(ShippedDate)
order  by Month(ShippedDate)


-- Question 5
SELECT OrderID, SUM(Discount) AS TotalDiscount
FROM [Order Details]
GROUP BY OrderID
HAVING SUM(Discount) > 0;

-- Question 6
SELECT ShipCity, COUNT(*) AS NumberOfOrders
FROM Orders
WHERE ShipCountry = 'USA'
    AND YEAR(ShippedDate) = 1997
GROUP BY ShipCity;


-- Question 7
SELECT ShipCountry AS Country, COUNT(*) AS OrdersDelayed
FROM Orders
WHERE ShippedDate IS NOT NULL
    AND ShippedDate > RequiredDate
GROUP BY ShipCountry;

-- Question 8
SELECT 
    OrderID, 
    SUM(Discount) AS TotalDiscount, 
    SUM(UnitPrice * Quantity * (1 - Discount)) AS TotalPrice
FROM [Order Details]
GROUP BY OrderID
HAVING SUM(Discount) > 0;

-- Question 9
SELECT ShipRegion, ShipCity, COUNT(*) AS NumberOfOrders
FROM Orders
WHERE YEAR(ShippedDate) = 1997 and ShipRegion is not null
GROUP BY ShipRegion, ShipCity;
