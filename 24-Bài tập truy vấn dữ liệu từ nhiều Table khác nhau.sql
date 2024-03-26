--Từ bảng Products và Categories, 
-- hãy tìm các sản phẩm thuộc danh mục ‘Seafood’ 
-- (Đồ hải sản) in ra các thông tin sau đây:
--Mã thể loại
--Tên thể loại
--Mã sản phẩm
--Tên sản phẩm
select c.CategoryID, c.CategoryName, p.ProductID, p.ProductName
from Products p, Categories c
where p.CategoryID = c.CategoryID
and c.CategoryName = 'Seafood'

--Từ bảng Products và Suppliers, 
-- hãy tìm các sản phẩm thuộc được cung cấp từ nước ‘Germany’ (Đức) :
--Mã nhà cung cấp
--Quốc gia
--Mã sản phẩm
--Tên sản phẩm
select s.SupplierID, s.Country, p.ProductID, p.ProductName
from Products p, Suppliers s
where p.SupplierID = s.SupplierID
and s.Country = 'Germany'

--Từ 3 bảng trong hình hãy in ra các thông tin sau đây:
--Mã đơn hàng
--Tên khách hàng
--Tên công ty vận chuyển
--Và chỉ in ra các đơn hàng của các khách hàng đến từ thành phố ‘London’
select o.OrderID, c.ContactName, s.CompanyName
from Orders o, Customers c, Shippers s
where o.CustomerID = c.CustomerID and o.ShipVia = s.ShipperID
and c.City = 'London'

--Từ 3 bảng trong hình hãy in ra các thông tin sau đây:
--Mã đơn hàng
--Tên khách hàng
--Tên công ty vận chuyển
--Ngày yêu cầu chuyển hàng
--Ngày giao hàng
--Và chỉ in ra các đơn hàng bị giao muộn hơn quy định.
--RequiredDate < ShippedDate
select o.OrderID, c.ContactName, s.CompanyName, o.RequiredDate, o.ShippedDate
from Orders o, Customers c, Shippers s
where o.CustomerID = c.CustomerID and o.ShipVia = s.ShipperID
and o.RequiredDate < o.ShippedDate

-- Give these shipcountries for which customres don't come from the United State
-- Select only this counties which is over than 100 orders
-- Display Shipcountry and Number of orders
select c.Country, count(o.OrderID) as Total
from Customers c, Orders o
where c.CustomerID = o.CustomerID
and c.Country != 'USA'
group by c.Country
having count(o.OrderID) > 100
