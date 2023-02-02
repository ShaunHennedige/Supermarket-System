CREATE VIEW vw_TotalSalesByCatagory
AS
SELECT ProductCatagory, SUM(Quantity*ProductPrice) AS TotalSales
FROM Products
JOIN OrderDetails ON Products.ProductId = OrderDetails.ProductID
GROUP BY ProductCatagory

CREATE VIEW vw_Top10MostSoldProducts
AS
SELECT TOP 10 Products.ProductName, SUM(Quantity) AS TotalSold
FROM Products
JOIN OrderDetails ON Products.ProductId = OrderDetails.ProductID
GROUP BY ProductName
ORDER BY TotalSold DESC

CREATE VIEW vw_RemainingStock
AS
SELECT Products.ProductId, ProductName,ProductQuantity - SUM(Quantity)AS
RemainingStock
FROM Products
LEFT JOIN OrderDetails on Products.ProductId = OrderDetails.ProductID
Group BY Products.ProductId,ProductName,ProductQuantity

CREATE VIEW vw_CustomerPurchaseHistory
AS
SELECT Customers.CustomerID, Customers.CustomerFirstname, Customers.CustomerLastName, ProductName, Quantity, ProductPrice, OrderDate
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN Products ON OrderDetails.ProductID = Products.ProductID

