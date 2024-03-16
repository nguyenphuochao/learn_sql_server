-- Công thức
-- SELECT column_name AS alias_name
-- FROM table_name as 

-- Viết câu lệnh SQL lấy “CompanyName” và đặt tên thay thế là “Công ty”; 
-- “PostalCode” và đặt tên thay thế là “Mã bưu điện”
select [CompanyName] as [Công ty] , [PostalCode] as [Mã bưu điện]
from [dbo].[Suppliers]

-- Viết câu lệnh ra “LastName” và đặt tên thay thế là “Họ”; 
-- “FirstName” và đặt tên thay thế là “Tên”.
select [LastName] as [Họ] , [FirstName] as [Tên]
from [dbo].[Employees]

-- Viết câu lệnh SQL lấy ra 15 dòng đầu tiên tất 
-- cả các cột trong bảng Orders, đặt tên thay thế 
-- cho bảng Orders là “o”.
select top 15 o.*
from Orders as o

-- Viết câu lệnh SQL lấy ra các cột và đặt tên thay thế như sau
-- ProductName -> Tên sản phẩm
-- SupplierID -> Mã nhà cung cấp
-- CategoryID -> Mã thể loại
-- Và đặt tên thay thế bảng Products là "p", sử dụng tên thay thế khi truy vấn các cột bên trên
-- Và chỉ lấy ra  5 sản phẩm đầu tiên trong bảng
select top 5 p.ProductName as [Tên sản phẩm] , 
		p.CategoryID as [Mã thể loại],
		p.SupplierID as [Mã nhà cung cấp]
from Products as p