SELECT column_name(s)
FROM table_name
WHERE column_name (NOT) IN (value1, value2, ...);

--Hãy lọc ra tất cả các đơn hàng với điều kiện:
--a, Đơn hàng được giao đến Germany, UK, Brazil
select * 
from Orders
where ShipCountry in ('Germany','UK','Brazil')

--b,  Đơn hàng được giao đến các quốc gia khác Germany, UK, Brazil
select * 
from Orders
where ShipCountry not in ('Germany','UK','Brazil')

--Lấy ra các sản phẩm có mã thể loại khác với 2, 3 và 4.
select *
from Products
where CategoryID not in (2,3,4)

-- Hãy liệt kê các nhân viên không phải là nữ từ bảng nhân viên.
select *
from Employees
where TitleOfCourtesy not in ('Ms.','Mrs.')

-- Hãy liệt kê các nhân viên là nữ từ bảng nhân viên.
select *
from Employees
where TitleOfCourtesy in ('Ms.','Mrs.')

-- Hãy lấy ra tất cả các khách hàng đến từ các thành phố 
-- Berlin , London , Warszawa
select CustomerID, City
from Customers
where City in ('Berlin','London','Warszawa')
