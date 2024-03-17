SELECT column1, column2, ...
FROM table_name
WHERE condition;

-- Bạn hãy liệt kê tất cả các nhân viên đến từ thành phố London.
select *
from Employees
where City = 'London'

-- Bạn hãy liệt kê tất cả các nhân viên đến từ thành phố London.
-- Sap xep ket qua theo LastName A->Z
select *
from Employees
where City = 'London'
order by LastName asc

-- Bạn hãy liệt kê tất các đơn hàng bị giao muộn, 
-- biết rằng ngày cần phải giao hàng là RequiredDate, ngày giao hàng thực tế là ShippedDate.
select *
from Orders
where RequiredDate < ShippedDate

-- Lấy ra tất cả các đơn hàng chi tiết được giảm giá nhiều hơn 10%.
-- (Discount > 0.1)
select *
from [Order Details]
where Discount > 0.1

-- Lấy ra tất cả đơn hàng chi tiết giảm giá từ 10 đến 20%
select *
from [Order Details]
where Discount >= 0.1 and Discount <= 0.2

-- Hãy liệt kê tất cả các đơn hàng dc gởi đến quốc gia là "France"
select *
from Orders
where ShipCountry = 'France'

-- Hãy liệt kê sản phẩm có số lượng hàng trong kho (UnitsInStock) lớn hơn 20
select *
from Products
where UnitsInStock > 20