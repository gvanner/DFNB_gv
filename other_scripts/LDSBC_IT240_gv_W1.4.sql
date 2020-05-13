USE AdventureWorks2017;
GO

SELECT TOP 5 DATEPART(yy, soh.OrderDate) AS Year
           , p.ProductID AS "Product ID"
           , p.Name AS "Product Name"
           , p.ProductNumber AS "Product Number"
           , p.Color AS "Product Color"
           , s.SalesOrderDetailID AS "Sales Order Count"
           , SUM(s.OrderQty) AS "Order Quantity"
           , SUM(s.LineTotal) AS "Sales Order Line Total"
  FROM Production.Product AS p
       JOIN
       Sales.SalesOrderDetail AS s ON p.ProductID = s.ProductID
       JOIN
       Sales.SalesOrderHeader AS soh ON soh.SalesOrderID = s.SalesOrderID
 WHERE DATEPART(year, soh.OrderDate) = 2014
 GROUP BY DATEPART(year, soh.OrderDate)
        , p.ProductID
        , p.ProductNumber
        , p.Name
        , p.Color
        , p.SellStartDate
        , s.SalesOrderDetailID
        , s.OrderQty
 ORDER BY SUM(s.OrderQty) DESC;

--Q2

USE AdventureWorks2017;
GO

SELECT DISTINCT TOP 7 BusinessEntityID AS "Business Entity ID"
                    , CONCAT(FirstName, +' ' + MiddleName, +' ' + LastName) AS "Full Name"
                    , LEN(CONCAT(FirstName, +' ' + MiddleName, +' ' + LastName)) AS "Full Name Length"
                    , FirstName AS "First Name"
                    , LEN(FirstName) AS "First Name Length"
                    , MiddleName AS "Middle Name"
                    , LastName AS "Last Name"
                    , LEN(LastName) AS "Last Name Length"
  FROM Person.Person
 ORDER BY [Full Name Length] DESC
        , [Last Name Length] DESC
        , [First Name Length] DESC;

--Q3

USE AdventureWorks2017;
GO

WITH s1
     AS (SELECT edh.DepartmentID
              , hre.Gender
              , hrd.Name
              , hre.SalariedFlag
              , CASE
                    WHEN hre.SalariedFlag = 1
                    THEN rate * 1000
                    WHEN hre.SalariedFlag = 0
                    THEN rate * 2080
                    ELSE 0
                END AS YearlyPay
              , COUNT(hre.BusinessEntityID) AS BusinessEntityIDCount
              , CASE
                    WHEN hre.SalariedFlag = 1
                    THEN rate * 1000
                    WHEN hre.SalariedFlag = 0
                    THEN rate * 2080
                    ELSE 0
                END * COUNT(hre.BusinessEntityID) AS TotalYearlyPay
           FROM HumanResources.Employee AS hre
                JOIN
                HumanResources.EmployeeDepartmentHistory AS edh ON hre.BusinessEntityID = edh.BusinessEntityID
                JOIN
                HumanResources.Department AS hrd ON edh.DepartmentID = hrd.DepartmentID
                JOIN
                HumanResources.EmployeePayHistory AS eph ON hre.BusinessEntityID = eph.BusinessEntityID
          WHERE hre.Gender = 'F'
          GROUP BY hre.Gender
                 , edh.DepartmentID
                 , hrd.Name
                 , eph.Rate
                 , eph.payfrequency
                 , hre.SalariedFlag
                 , CASE
                       WHEN hre.SalariedFlag = 1
                       THEN rate * 1000
                       WHEN hre.SalariedFlag = 0
                       THEN rate * 2080
                       ELSE 0
                   END)
     SELECT TOP 10 s1.DepartmentID
                 , s1.Name
                 , s1.Gender
                 , SUM(s1.TotalYearlyPay) AS TotalYearlyPay
                 , SUM(s1.BusinessEntityIDCount) AS BusinessEntityIDCount
                 , SUM(s1.TotalYearlyPay) / SUM(s1.BusinessEntityIDCount) AS AverageYearlyPay
       FROM s1
      GROUP BY s1.DepartmentID
             , s1.name
             , s1.gender
      ORDER BY 6 DESC;