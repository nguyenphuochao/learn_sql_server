SELECT column1, column2, ...
FROM table_name
ORDER BY column1, column2, ... ASC|DESC;

-- Bạn hãy liệt kê tất cả các nhà cung cấp theo thứ tự tên đơn vị CompanyName
-- Từ A-Z
select *
from Suppliers order by CompanyName asc

-- Bạn hãy liệt kê tất cả các sản phẩm theo thứ tự giá giảm dần.
select *
from Products order by UnitPrice desc

-- Bạn hãy liệt kê tất cả các nhân viên theo thứ tự họ và tên đệm A-Z.
-- Không dùng ASC | DESC
select *
from Employees order by LastName,FirstName

-- Hãy lấy ra một sản phẩm có số lượng bán cao nhất từ bảng [Order Details].
-- Không được dùng MAX.
select top 1 *
from [Order Details] order by Quantity desc

-- Hãy liệt kê danh sách các đơn đặt hàng (OrderID) trong bảng Orders
-- theo thứ tự giảm dần của ngày đặt hàng (OrderDate)
select OrderID
from Orders order by OrderDate desc

-- Hãy liệt kê tên, đơn giá, số lượng trong kho(UnitsInStock) của tất cả các sảm phẩm 
-- trong bảng Products theo thứ tự giảm dần của UnitsInStock
select ProductName, UnitPrice, UnitsInStock
from Products order by UnitsInStock desc