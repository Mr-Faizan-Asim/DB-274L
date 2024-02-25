
--Question 1
	Select Customers.CustomerID,Orders.OrderID,Orders.OrderDate from Customers left join Orders on Orders.CustomerID = Customers.CustomerID;

--Question 2
	Select Customers.CustomerID,Orders.OrderID,Orders.OrderDate from Customers left join orders on Orders.CustomerID = Customers.CustomerID where Orders.OrderID is null

-- Question 3
	Select Customers.CustomerID,Orders.OrderID,Orders.OrderDate from Customers join Orders on Customers.CustomerID = Orders.CustomerID where Orders.OrderID is not null and month(Orders.OrderDate) = 7 and year(Orders.OrderDate) = 1997;

--Question 4
	Select Orders.CustomerID , count(Orders.OrderID) from Orders  group by Orders.CustomerID  

 --Question 5
	SELECT e.EmployeeID,e.FirstName,e.LastName FROM Employees e CROSS JOIN (SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) AS numbers ORDER BY e.EmployeeID;

 --Question 6
	Select * from Products where Products.UnitPrice > (Select avg(UnitPrice) from Products)
 
 --Question 7
	Select Max(UnitPrice) from Products where UnitPrice < (select max(UnitPrice) from Products) 
 
 -- Question 8
	--Nahi hoa
 
 --Question 9
	Select Customers.CustomerID,count(Orders.OrderID),sum([Order Details].Quantity) from Customers join orders on Orders.CustomerID = Customers.CustomerID join [Order Details] on Orders.OrderID = [Order Details].OrderID where Customers.Country = 'USA'	Group by Customers.CustomerID;

-- Question 10
	Select Customers.CustomerID,Customers.CompanyName,Orders.OrderID,Orders.OrderDate from Customers left join Orders on Orders.CustomerID = Customers.CustomerID where day(Orders.OrderDate) = 4 and month(Orders.OrderDate) = 7 and year(Orders.OrderDate) = 1997;  

-- Question 11
	Select * from Employees join Employees x on Employees.ReportsTo = x.EmployeeID where Employees.BirthDate < x.BirthDate; 

-- Question 12
	Select concat(Employees.FirstName,Employees.LastName) as EmployeeName,DateDiff(Year,Employees.BirthDate,GETDATE()) as Age, DateDiff(Year,m.BirthDate,GETDATE()) as ManagerAge from Employees join Employees m on Employees.ReportsTo = m.EmployeeID where Employees.BirthDate < m.BirthDate;

--Question 13
	Select Products.ProductName,Orders.OrderDate  from Products join [Order Details] on [Order Details].ProductID = Products.ProductID	join Orders on [Order Details].OrderID = Orders.OrderID	where Orders.OrderDate = '1997-08-08';
		
-- Question 14
	SELECT     Orders.ShipAddress AS Address,    Orders.ShipCity AS City,    Orders.ShipCountry AS Country FROM     Orders JOIN     Employees ON Orders.EmployeeID = Employees.EmployeeID WHERE      Employees.FirstName = 'Anne'     AND Orders.ShippedDate > Orders.RequiredDate;
 
 -- Question 15 
	SELECT DISTINCT Orders.ShipCountry AS Country FROM Orders JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID JOIN Products ON [Order Details].ProductID = Products.ProductID JOIN Categories ON Products.CategoryID = Categories.CategoryID WHERE Categories.CategoryName = 'Beverages';
