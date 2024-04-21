Stored procedure là gì?
- Stored procedure là tập hợp 1 hoặc nhiều câu lệnh T-SQL thành 1 nhóm đơn vị xử lý logic và dc lưu trữ
trên Database Server
- Khi 1 câu lệnh  gọi chạy stored procedure lần đầu tiên thì SQL Server sẽ chạy nó và lưu trữ vào bộ nhớ đệm,
gọi là plan cache, những lần tiếp theo SQL Server sẽ sử dụng lại plan cache nên cho tốc độ xử lý tôi ưu
- Stored procedure rất tiện lợi cho người quản trị database(DBA), nó giúp DBA tạo ra những nhóm câu lệnh và gửi đến 1 
bộ phận khác mà họ sẽ không cần quan tâm đến nội dung bên trong stored procedure có gì, họ chỉ quan tâm đến tham số đầu vào,
đầu ra
* Syntax
CREATE PROCEDURE [database_name].[schema_name].[procedure_name]
(
    [parameter_1] [datatype] [,parameter_2] [datatype] ...
)
AS 
BEGIN
  [statements]
END

-- Tạo 1 stored procedure lấy thông tin 
-- về sản phẩm dựa trên tên sản phẩm dc cung cấp.
CREATE PROCEDURE GetProductByName
	@ProductName NVARCHAR(100)
AS
BEGIN
	SELECT * FROM [dbo].[Products] P
	WHERE P.ProductName = @ProductName
END;

-- Sử dụng:
EXEC GetProductByName @ProductName='Chai';
EXEC GetProductByName @ProductName='Chang';
EXEC GetProductByName @ProductName='Ikura';

-- Tạo 1 stored procedure để tính tổng doanh số bán hàng
-- của một nhân viên dựa trên EmployeeID.
CREATE PROCEDURE GetEmployeeSalesTotal
	@EmployeeId INT
AS
BEGIN
	SELECT SUM([UnitPrice]*[Quantity]) TotalSales
	FROM [dbo].[Orders] o
	JOIN [dbo].[Order Details] od ON o.OrderID = od.OrderID
	WHERE o.EmployeeID=@EmployeeId
END

-- Sử dụng
EXEC GetEmployeeSalesTotal @EmployeeId=1;
EXEC GetEmployeeSalesTotal @EmployeeId=2;
EXEC GetEmployeeSalesTotal @EmployeeId=3;

-- Tạo 1 stored procedure để thêm mới khách hàng vào bảng Customers.
CREATE PROCEDURE AddCustomer
	@CustomerID NVARCHAR(5),
	@CompanyName NVARCHAR(40),
	@ContactName NVARCHAR(30),
	@ContactTitle NVARCHAR(30)
AS
BEGIN
	INSERT INTO [dbo].[Customers]([CustomerID],[CompanyName],[ContactName],[ContactTitle])
	VALUES (@CustomerID, UPPER(@CompanyName), @ContactName, @ContactTitle)
END
-- sử dụng
EXEC AddCustomer @CustomerID='NEWN', @CompanyName='titv.vn', @ContactName='Tung Le',@ContactTitle='Mr.' 


-- Tạo 1 stored procedure để cập nhật giá của tất cả
-- cho một sản phẩm cụ thể
CREATE PROCEDURE IncreasePrice
	@ProductId INT,
	@PriceIncrease DECIMAL(10,2)
AS
BEGIN
	UPDATE [dbo].[Products]
	SET UnitPrice = UnitPrice + @PriceIncrease
	WHERE [ProductID] = @ProductId
END

EXEC IncreasePrice @ProductId=1, @PriceIncrease=100;
-- BÀI TẬP
-- 1. Viết 1 stored procedure để truy xuất danh sách các đơn đặt hàng cho 1 khách hàng dựa trên tên khách hàng.
-- Tham số đầu vào là tên khách hàng, và stored procedure sẽ trả về danh sách các đơn đặt hàng liên quan
CREATE PROCEDURE getListOrderByCustomer
    @CustomerName NVARCHAR(30)
AS
BEGIN
   select o.*,c.ContactName
   from Orders o join Customers c
   on o.CustomerID = c.CustomerID
   where c.ContactName = @CustomerName
END
-- sử dụng
EXEC getListOrder @CustomerName = 'Zbyszek Piestrzeniewicz';

-- 2. Viết 1 stored procedure để cập nhật số lượng hàng tồn kho cho 1 sản phẩm cụ thể dựa trên ID sản phẩm và số lượng mới.
-- Store Procedure này sẽ nhận vào ID sản phẩm và số lượng mới, sau đó cập nhật số lượng tồn kho trong bảng Products.
CREATE PROCEDURE updateUnitInStock 
   @ProductID INT,
   @UnitInStock Smallint
AS
BEGIN
  update Products set UnitsInStock = @UnitInStock
  where ProductID = @ProductID
END
-- sử dụng
EXEC updateUnitInStock @ProductID = 1, @UnitInStock = 100;
EXEC updateUnitInStock @ProductID = 2, @UnitInStock = 100;

-- 3. Viết 1 stored procedure để truy xuất danh sách các sản phẩm thuộc 1 danh mục cụ thể và 
-- giới hạn số lượng sản phẩm trả về.Tham số đầu vào bao gồm ID danh mục và số lượng sản phẩm cần
-- trả về
CREATE PROCEDURE getListProductLimitByCate
   @Limit INT,
   @CategoryID INT
AS
BEGIN
   select top (@Limit) * from Products
   where CategoryID = @CategoryID
END
-- sử dụng
EXEC getListProductLimitByCate @CategoryID = 1, @Limit = 5
-- 4.Viết 1 Stored Procedure để truy xuất danh sách khách hàng dựa trên khu vực địa lí (Region) hoặc
-- quốc gia (Country) của họ. Tham số đầu vào sẽ là khu vực địa lý hoặc quốc gia và Stored Procedure sẽ trả về
-- danh sách các khách hàng trong khu vực đó
CREATE PROCEDURE getListCustomerByRegionOrCountry
    @Region NVARCHAR(30),
	@Country NVARCHAR(30)
AS
BEGIN
    select *
	from Customers
	where Country = @Country or Region  = @Region
END
-- sử dụng
EXEC getListCustomerByRegionOrCountry @Region = 'SP', @Country = '';

