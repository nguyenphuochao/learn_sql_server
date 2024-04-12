-- Thêm một khách hàng mới
INSERT INTO [dbo].[Customers]([CustomerID], [CompanyName], [ContactName], [Phone])
VALUES ('KH123', 'TITV.VN', 'Le Nhat Tung', '0123456789');

-- Thêm một khách hàng mới đầy đủ các cột
INSERT INTO [dbo].[Customers]
VALUES ('KH456', 'TITV.VN', 'Le Nhat Tung', '0123456789', '-', null, null, null, null, null, null);

-- Thêm nhiều khách hàng mới cùng lúc
INSERT INTO [dbo].[Customers]([CustomerID], [CompanyName], [ContactName], [Phone])
VALUES 
('KH124', 'TITV.VN', 'Le Nhat Tung', '0123456789'),
('KH125', 'TITV.VN', 'Le Nhat Tung', '0123456789'),
('KH126', 'TITV.VN', 'Le Nhat Tung', '0123456789'),
('KH127', 'TITV.VN', 'Le Nhat Tung', '0123456789');

-- Thêm một sản phẩm mới
INSERT INTO Products (ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock) 
VALUES ('New Product', 1, 2, '24 bottles', 10.99, 100);

-- Bài tập 1
INSERT INTO Suppliers([CompanyName],[ContactName],[ContactTitle])
VALUES ('Long an','Long an 1','Long an 2');
-- Bài tập 2
INSERT INTO Orders ([CustomerID],[EmployeeID],[OrderDate],[ShipVia])
VALUES ('WWWW',1,GETDATE(),1);