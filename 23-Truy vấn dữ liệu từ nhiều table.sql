SELECT * | Column
FROM table_1, table_2
WHERE table_1.ID1 = table_2.ID1

--Từ bảng Products và Categories, hãy in ra các thông tin sau đây:
--Mã thể loại
--Tên thể loại
--Mã sản phẩm
--Tên sản phẩm
select c.CategoryID, c.CategoryName, p.ProductID , p.ProductName
from Products as p , Categories as c
where p.CategoryID = c.CategoryID

--Từ bảng Employees và Orders, hãy in ra các thông tin sau đây:
--Mã nhân viên
--Tên nhân viên
--Số lượng đơn hàng mà nhân viên đã bán được
select e.EmployeeID, e.FirstName, e.LastName, count(o.OrderID) as TotalOrder
from Employees as e, Orders as o
where e.EmployeeID = o.EmployeeID
group by e.EmployeeID, e.FirstName, e.LastName

--Từ bảng Customers và Orders, hãy in ra các thông tin sau đây:
--Mã số khách hàng
--Tên công ty
--Tên liên hệ
--Số lượng đơn hàng đã mua
--Với điều kiện: quốc gia của khách hàng là UK
select c.CustomerID, c.ContactName, count(o.OrderID) as TotalOrder
from Customers as c, Orders as o
where c.CustomerID = o.CustomerID and c.Country = 'UK'
group by c.CustomerID, c.ContactName

--Từ bảng Orders và Shippers, hãy in ra các thông tin sau đây:
--Mã nhà vận chuyển
--Tên công ty vận chuyển
--Tổng số tiền được vận chuyển (Sum Frieght)
--Và in ra màn hình theo thứ tự sắp xếp tổng số tiền vận chuyển giảm dần.
select s.ShipperID, s.CompanyName, sum(o.Freight) as SumFreight
from Orders as o, Shippers as s
where o.ShipVia = s.ShipperID
group by s.ShipperID, s.CompanyName
order by sum(o.Freight) desc

--Từ bảng Products và Suppliers, hãy in ra các thông tin sau đây:
--Mã nhà cung cấp
--Tên công ty
--Tổng số các sản phẩm khác nhau đã cung cấp
--Và chỉ in ra màn hình duy nhất 1 nhà cung cấp có số lượng sản phẩm khác nhau nhiều nhất.
select top 1 s.SupplierID, s.CompanyName, count(p.ProductID) as CountProduct
from Products as p, Suppliers as s
where p.SupplierID = s.SupplierID
group by s.SupplierID, s.CompanyName
order by count(p.ProductID) desc

--Từ bảng Orders và Orders Details, hãy in ra các thông tin sau đây:
--Mã đơn hàng
--Tổng số tiền sản phẩm của đơn hàng đó
select o.OrderID, sum(od.Quantity * od.UnitPrice) as Total
from Orders as o, [Order Details] as od
where o.OrderID = od.OrderID
group by o.OrderID

--Từ 3 bảng trong hình hãy in ra các thông tin sau đây:
--Mã đơn hàng
--Tên nhân viên
--Tổng số tiền sản phẩm của đơn hàng
select o.OrderID, e.FirstName, e.LastName, sum(od.Quantity * od.UnitPrice) as Total
from Orders as o, [Order Details] as od, Employees as e
where o.OrderID = od.OrderID and o.EmployeeID = e.EmployeeID
group by  o.OrderID, e.FirstName, e.LastName

-- Từ 3 bảng hãy in ra thông tin sau:
-- Mã đơn hàng
-- Tên khách hàng
-- Tên công ty vận chuyển
-- Và in ra các đơn hàng dc giao đến 'UK' trong năm 1997
select o.OrderID, c.ContactName, s.CompanyName
from Customers as c,Shippers as s,Orders as o
where c.CustomerID = o.CustomerID and s.ShipperID = o.ShipVia
                                  and o.ShipCountry = 'UK'
								  and year(o.ShippedDate) = 1997