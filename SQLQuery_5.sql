USE Supermarket
GO
CREATE TRIGGER tr_UpdateStockOnPurchase
ON Products
AFTER INSERT
AS
BEGIN
UPDATE Products
SET ProductQuantity = Products.ProductQuantity + OrderDetails.Quantity
FROM Products
JOIN OrderDetails
ON Products.ProductID = OrderDetails.ProductID
END

USE Supermarket
GO
CREATE TRIGGER tr_UpdateStockOnOrder
ON OrderDetails
AFTER INSERT
AS
BEGIN
UPDATE Products
SET ProductQuantity = ProductQuantity - OrderDetails.Quantity
FROM Products
JOIN OrderDetails
ON Products.ProductID = OrderDetails.ProductID
END

