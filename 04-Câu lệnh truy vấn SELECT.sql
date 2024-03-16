-- Công thức
-- SELECT column_name
-- FROM table_name

-- Viết câu lệnh SQL lấy ra tên của tất cả các sản phẩm
select [ProductName]
from [dbo].[Products]

-- Viết câu lệnh SQL lấy ra tên sản phẩm, giá bán trên mỗi đơn vị, số lượng sản phẩm trên đơn vị
select [ProductName],[UnitPrice],[QuantityPerUnit]
from [dbo].[Products]

-- Viết câu lệnh SQL lấy ra tên công ty của khách hàng 
-- và quốc gia của các khách hàng đó
select [CompanyName],[Country]
from [dbo].[Customers]

-- Viết câu lệnh SQL lấy ra tất cả dữ liệu từ bảng Products
select *from Products

-- Viết câu lệnh SQL lấy ra tất cả dữ liệu từ bảng khách hàng  - Customers
select * from Customers

-- Viết câu lệnh SQL lấy ra tên và số điện thoại của tất cả các nhà cung cấp hàng
select CompanyName,Phone
from Suppliers

--Viết câu lệnh SQL lấy ra tất cả dữ liệu từ bảng nhà cung cấp
select *
from dbo.Suppliers

