USE Supermarket
GO
CREATE PROCEDURE AddCustomer
@CustomerFirstName nvarchar(255),
@CustomerLastName nvarchar(255),
@CustomerEmail nvarchar(255),
@CustomerAddress nvarchar(255),
@CustomerPhone nvarchar(255),
@CustomerID INT OUTPUT
AS
BEGIN
INSERT INTO Customers (CustomerFirstName, CustomerLastName,
CustomerEmail, CustomerAddress, CustomerPhone)
VALUES (@CustomerFirstName, @CustomerLastName, @CustomerEmail,
@CustomerAddress, @CustomerPhone);
SET @CustomerID = SCOPE_IDENTITY();
END


USE Supermarket
GO
CREATE PROCEDURE AddProduct
    @ProductName nvarchar(255),
    @ProductPrice decimal(10, 2),
    @ProductQuantity int,
    @ProductCategory nvarchar(255),
    @ExpirationDate date,
    @ProductID INT OUTPUT
AS
BEGIN
INSERT INTO Products (ProductName, ProductPrice, ProductQuantity,ProductCatagory,ExpirationDate)
VALUES (@ProductName, @ProductPrice, @ProductQuantity,
@ProductCategory,@ExpirationDate)
SET @ProductID = SCOPE_IDENTITY();
RETURN @ProductID;
END

USE Supermarket
GO
CREATE PROCEDURE UpdateProductPrice
@ProductID int, 
@NewPrice decimal(10,2),
@RowsAffected INT OUTPUT
AS
BEGIN
UPDATE Products
SET ProductPrice = @NewPrice
WHERE ProductID = @ProductID;
SET @RowsAffected = @@ROWCOUNT;
END

USE Supermarket
GO
CREATE PROCEDURE CustomerPurchaseHistory
@CustomerID INT
AS
BEGIN
SELECT ProductName, Quantity, ProductPrice, OrderDate
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE Customers.CustomerID = @CustomerID
END

USE Supermarket
GO
CREATE PROCEDURE BillOrder(@OrderID INT)
AS
BEGIN
DECLARE @TotalCost DECIMAL(10, 2);
SET @TotalCost = 0;

-- Update stock levels
UPDATE Products
SET ProductQuantity = ProductQuantity - OrderDetails.Quantity
FROM Products
JOIN OrderDetails
ON Products.ProductID = OrderDetails.ProductID
WHERE OrderDetails.OrderID = @OrderID

-- Calculate total cost
SELECT @TotalCost = SUM(Quantity * ProductPrice)
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE OrderDetails.OrderID = @OrderID

-- Update total cost in the Orders table
UPDATE Orders
SET @TotalCost = @TotalCost
WHERE @OrderID = @OrderID
END

USE Supermarket
GO
CREATE PROCEDURE Top10MostSoldProducts
AS
BEGIN
SELECT TOP 10 ProductName, SUM(Quantity) AS TotalSold
FROM Products
JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
GROUP BY ProductName
ORDER BY TotalSold DESC
END

USE Supermarket
GO
CREATE PROCEDURE GenerateFinancialReport(@StartDate DATE, @EndDate
DATE)
AS
BEGIN
DECLARE @TotalRevenue DECIMAL(10, 2);
DECLARE @TotalCost DECIMAL(10, 2);
DECLARE @Profit DECIMAL(10, 2);
-- Calculate total revenue, total cost, and profit
SELECT @TotalRevenue = SUM(Quantity * ProductPrice * (100 - OrderDetails.Discount) /
100), @TotalCost = SUM(Quantity * Products.CostPrice)
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
WHERE OrderDate BETWEEN @StartDate AND @EndDate
SET @Profit = @TotalRevenue - @TotalCost
-- Insert results into a table
INSERT INTO FinancialReport (StartDate, EndDate, TotalRevenue, TotalCost,
Profit)
VALUES (@StartDate, @EndDate, @TotalRevenue, @TotalCost, @Profit)
END

USE Supermarket
GO
CREATE PROCEDURE TotalSalesByCategory
AS
BEGIN
SELECT ProductCatagory, SUM(Quantity * ProductPrice) AS TotalSales
FROM Products
JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
GROUP BY ProductCatagory
END