CREATE FUNCTION CalculateOrderTotalCost (@OrderID INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @TotalCost DECIMAL(10,2);
    SET @TotalCost = (SELECT SUM(Quantity * ProductPrice)
                     FROM OrderDetails
                     JOIN Products ON OrderDetails.ProductID = Products.ProductID
                     WHERE OrderDetails.OrderID = @OrderID);
    RETURN @TotalCost;
END;