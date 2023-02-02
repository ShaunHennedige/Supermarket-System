USE Supermarket
-- Create a new table called '[Customers]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Customers]', 'U') IS NOT NULL
DROP TABLE [dbo].[Customers]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Customers]
(
    [CustomerId] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [CustomerFirstName] nvarchar(255) NOT NULL,
    [CustomerLastName] nvarchar(255) NOT NULL,
    [CustomerEmail] nvarchar(255) NOT NULL,
    [CustomerAddress] nvarchar(255) NOT NULL,
    [CustomerPhone] nvarchar(255) NOT NULL
    -- Specify more columns here
);
GO
-- Create a new table called '[Orders]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Orders]', 'U') IS NOT NULL
DROP TABLE [dbo].[Orders]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Orders]
(
    [OrderId] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [CustomerID] INT FOREIGN KEY REFERENCES Customers(CustomerID),
    [OrderDate] date NOT NULL,
    [OrderTotal] decimal(10, 2) NOT NULL
    -- Specify more columns here
);
GO
-- Create a new table called '[OrderDetails]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[OrderDetails]', 'U') IS NOT NULL
DROP TABLE [dbo].[OrderDetails]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[OrderDetails]
(
    [OrderID] INT FOREIGN KEY REFERENCES Orders(OrderID),
    [ProductID] INT FOREIGN KEY REFERENCES Products(ProductID),
    [Quantity] INT NOT NULL,
    [Subtotal] decimal(10, 2) NOT NULL
    -- Specify more columns here
);
GO
-- Create a new table called '[ProductDiscounts]]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[ProductDiscounts]', 'U') IS NOT NULL
DROP TABLE [dbo].[ProductDiscounts]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[ProductDiscounts]
(
    [DiscountId] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [ProductID] INT FOREIGN KEY REFERENCES Products(ProductID),
    [DiscountType] NVARCHAR (255) NOT NULL,
    [DiscountValue] DECIMAL(10, 2) NOT NULL,
    [DiscountStartDate] DATE NOT NULL,
    [DiscountEndDate] DATE NOT NULL,
    -- Specify more columns here
);
GO
-- Create a new table called '[FinancialReport]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[FinancialReport]', 'U') IS NOT NULL
DROP TABLE [dbo].[FinancialReport]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[FinancialReport]
(
    [StartDate] DATE NOT NULL,
    [EndDate] DATE NOT NULL,
    [TotalRevenue] DECIMAL(10, 2) NOT NULL,
    [TotalCost] DECIMAL(10, 2) NOT NULL,
    [Profit] DECIMAL(10, 2) NOT NULL,
    -- Specify more columns here
);
GO
-- Create a new table called '[UserAccount]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[UserAccount]', 'U') IS NOT NULL
DROP TABLE [dbo].[UserAccount]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[UserAccount]
(
    [EmployeeId] INT NOT NULL PRIMARY KEY IDENTITY(1,1), -- Primary Key column
    [EmployeeName] VARCHAR(50) NOT NULL,
    [EmployeeEmail] VARCHAR(255) NOT NULL,
    [EmployeePassword] VARCHAR(255) NOT NULL,
    [EmployeeRole] VARCHAR(20) NOT NULL
    -- Specify more columns here
);
GO
-- Create a new table called '[UserRole]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[UserRole]', 'U') IS NOT NULL
DROP TABLE [dbo].[UserRole]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[UserRole]
(
    [EmployeeRole] VARCHAR(20) NOT NULL PRIMARY KEY, -- Primary Key column
    [RoleId] INT NOT NULL,
    [RoleDescription] VARCHAR(100) NOT NULL
    -- Specify more columns here
);
GO
-- Create a new table called '[UserLogin]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[UserLogin]', 'U') IS NOT NULL
DROP TABLE [dbo].[UserLogin]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[UserLogin]
(
    [EmployeeId] INT NOT NULL PRIMARY KEY IDENTITY(1,1), -- Primary Key column
    [EmployeePassword] VARCHAR(255) NOT NULL,
    [EmployeeRole] VARCHAR(20) FOREIGN KEY REFERENCES UserRole(EmployeeRole)
    -- Specify more columns here
);
GO
-- Drop a table called 'ProductDiscounts' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[ProductDiscounts]', 'U') IS NOT NULL
DROP TABLE [dbo].[ProductDiscounts]
GO
-- Drop a table called 'OrderDetails' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[OrderDetails]', 'U') IS NOT NULL
DROP TABLE [dbo].[OrderDetails]
GO
-- Drop a table called 'Products' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Products]', 'U') IS NOT NULL
DROP TABLE [dbo].[Products]
GO
-- Create a new table called '[Products]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Products]', 'U') IS NOT NULL
DROP TABLE [dbo].[Products]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Products]
(
    [ProductId] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [ProductName] NVARCHAR(50) NOT NULL,
    [ProductPrice] DECIMAL(10, 2) NOT NULL,
    [ProductQuantity] INT NOT NULL,
    [ProductCatagory] NVARCHAR(50) NOT NULL,
    [ExpirationDate] DATE NOT NULL
    -- Specify more columns here
);
GO
-- Create a new table called '[ProductDiscounts]]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[ProductDiscounts]', 'U') IS NOT NULL
DROP TABLE [dbo].[ProductDiscounts]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[ProductDiscounts]
(
    [DiscountId] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [ProductID] INT FOREIGN KEY REFERENCES Products(ProductID),
    [DiscountType] NVARCHAR (255) NOT NULL,
    [DiscountValue] DECIMAL(10, 2) NOT NULL,
    [DiscountStartDate] DATE NOT NULL,
    [DiscountEndDate] DATE NOT NULL,
    -- Specify more columns here
);
-- Create a new table called '[OrderDetails]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[OrderDetails]', 'U') IS NOT NULL
DROP TABLE [dbo].[OrderDetails]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[OrderDetails]
(
    [OrderID] INT FOREIGN KEY REFERENCES Orders(OrderID),
    [ProductID] INT FOREIGN KEY REFERENCES Products(ProductID),
    [Quantity] INT NOT NULL,
    [Subtotal] decimal(10, 2) NOT NULL
    -- Specify more columns here
);
INSERT INTO Products (ProductId, ProductName, ProductPrice, ProductQuantity, ProductCatagory, ExpirationDate)
VALUES (1, 'Product 1', 10.99, 50, 'Category A', '2022-02-01'),
(2, 'Product 2', 12.99, 40, 'Category B', '2022-03-01'),
(3, 'Product 3', 15.99, 30, 'Category A', '2022-04-01'),
(4, 'Product 4', 8.99, 60, 'Category C', '2022-05-01'),
(5, 'Product 5', 20.99, 20, 'Category B', '2022-06-01'),
(6, 'Product 6', 25.99, 10, 'Category A', '2022-07-01'),
(7, 'Product 7', 18.99, 50, 'Category C', '2022-08-01'),
(8, 'Product 8', 14.99, 40, 'Category B', '2022-09-01'),
(9, 'Product 9', 16.99, 30, 'Category A', '2022-10-01'),
(10, 'Product 10', 11.99, 60, 'Category C', '2022-11-01'),
(11, 'Product 11', 22.99, 20, 'Category B', '2022-12-01'),
(12, 'Product 12', 27.99, 10, 'Category A', '2023-01-01'),
(13, 'Product 13', 19.99, 50, 'Category C', '2023-02-01'),
(14, 'Product 14', 15.99, 40, 'Category B', '2023-03-01'),
(15, 'Product 15', 17.99, 30, 'Category A', '2023-04-01');
INSERT INTO Customers (CustomerId, CustomerFirstName, CustomerLastName, CustomerEmail, CustomerAddress, CustomerPhone)
VALUES (1, 'John', 'Smith', 'john.smith@email.com', '123 Main St', '555-555-5555'),
(2, 'Jane', 'Doe', 'jane.doe@email.com', '456 Park Ave', '555-555-5556'),
(3, 'Mike', 'Johnson', 'mike.johnson@email.com', '789 Elm St', '555-555-5557'),
(4, 'Emily', 'Williams', 'emily.williams@email.com', '321 Oak St', '555-555-5558'),
(5, 'David', 'Jones', 'david.jones@email.com', '654 Pine St', '555-555-5559'),
(6, 'Ashley', 'Miller', 'ashley.miller@email.com', '987 Cedar St', '555-555-5560'),
(7, 'Sarah', 'Davis', 'sarah.davis@email.com', '135 Birch St', '555-555-5561'),
(8, 'Michael', 'Garcia', 'michael.garcia@email.com', '246 Maple St', '555-555-5562'),
(9, 'Jessica', 'Rodriguez', 'jessica.rodriguez@email.com', '369 Cherry St', '555-555-5563'),
(10, 'Matthew', 'Martinez', 'matthew.martinez@email.com', '159 Willow St', '555-555-5564');
INSERT INTO Orders (OrderId, CustomerID, OrderDate, OrderTotal)
VALUES (1, 1, '2022-01-01', 250.00),
(2, 2, '2022-02-01', 150.00),
(3, 3, '2022-03-01', 100.00),
(4, 4, '2022-04-01', 200.00),
(5, 5, '2022-05-01', 75.00),
(6, 6, '2022-06-01', 125.00),
(7, 7, '2022-07-01', 50.00),
(8, 8, '2022-08-01', 75.00),
(9, 9, '2022-09-01', 100.00),
(10, 10, '2022-10-01', 150.00);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Subtotal)
VALUES (1, 1, 5, 100.00),
(2, 2, 3, 75.00),
(3, 3, 2, 50.00),
(4, 4, 4, 120.00),
(5, 5, 1, 25.00),
(6, 6, 6, 150.00),
(7, 7, 2, 50.00),
(8, 8, 1, 20.00),
(9, 9, 3, 60.00),
(10, 10, 4, 80.00);
INSERT INTO ProductDiscounts (DiscountId, ProductID, DiscountType, DiscountValue, DiscountStartDate, DiscountEndDate)
VALUES (1, 1, 'percentage', 10.00, '2022-01-01', '2022-01-31'),
(2, 2, 'fixed', 5.00, '2022-02-01', '2022-02-28'),
(3, 3, 'percentage', 15.00, '2022-03-01', '2022-03-31'),
(4, 4, 'fixed', 2.00, '2022-04-01', '2022-04-30'),
(5, 5, 'percentage', 20.00, '2022-05-01', '2022-05-31'),
(6, 6, 'fixed', 3.00, '2022-06-01', '2022-06-30');
INSERT INTO UserAccount (EmployeeName, EmployeeEmail, EmployeePassword, EmployeeRole)
VALUES ('John Doe', 'johndoe@example.com', 'password123', 'admin'),
('Jane Smith', 'janesmith@example.com', 'password456', 'user'),
('Bob Johnson', 'bobjohnson@example.com', 'password789', 'user'),
('Emma Williams', 'emmawilliams@example.com', 'password111', 'admin'),
('Michael Brown', 'michaelbrown@example.com', 'password222', 'user');
INSERT INTO UserRole (EmployeeRole, RoleId, RoleDescription)
VALUES ('admin', 1, 'Has full access to the system'),
('user', 2, 'Has limited access to the system'),
('guest_1', 3, 'Has no access to the system'),
('guest_2', 4, 'Has access to their own products');
-- Drop a table called 'UserLogin' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[UserLogin]', 'U') IS NOT NULL
DROP TABLE [dbo].[UserLogin]
GO
-- Create a new table called '[UserLogin]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[UserLogin]', 'U') IS NOT NULL
DROP TABLE [dbo].[UserLogin]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[UserLogin]
(
    [EmployeeId] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [EmployeePassword] VARCHAR(255) NOT NULL,
    [EmployeeRole] VARCHAR(20) FOREIGN KEY REFERENCES UserRole(EmployeeRole)
    -- Specify more columns here
);
INSERT INTO UserLogin (EmployeeId, EmployeePassword, EmployeeRole)
VALUES (1, 'password1', 'admin'),
(2, 'password2', 'user'),
(3, 'password3', 'guest_1'),
(4, 'password4', 'guest_2');
