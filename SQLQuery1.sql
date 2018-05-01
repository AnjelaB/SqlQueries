/*Return all rows and only a subset of the columns 
(Name, ProductNumber, ListPrice) from the Product table. 
Change ListPrice column heading to ‘Price’.*/
Select [Name],ProductNumber,ListPrice as Price
FROM  Production.Product

/*Find all the employees from HumanResources.
Employee table who were hired after '2009-01-01'*/
Select *
From HumanResources.Employee
Where HireDate>'2009-01-01'

/*Return only the rows for Product from Production.Product table 
that have a product line of ‘S’ and 
that have days to manufacture that is less than 5. Sort by ascending order.*/
Select *
From Production.Product
Where ProductLine='S' and DaysToManufacture<5
Order By DaysToManufacture


/*Retrieve employees job titles from HumanResources.Employeetable without duplicates.*/
Select Distinct JobTitle 
From HumanResources.Employee

/*Find the total q order quantity of each sales order 
from Sales.SalesOrderDetail table.*/
Select OrderQty 
From Sales.SalesOrderDetail

/*Put the results into groups after retrieving only 
the rows with list prices greater than $900.*/
Select ProductModelID
FROM Production.Product
Where ListPrice>900
Group By ProductModelID

/*By using HAVING clause group the rows in the Sales.SalesOrderDetail table 
by productID and eliminate products 
whose average order quantities are more than 4.*/
Select ProductID,AVG(OrderQty) as AVGOrderQty
From Sales.SalesOrderDetail
Group By ProductID
Having AVG(OrderQty)<=4

