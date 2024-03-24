-- Hãy cho biết những khách hàng nào đã đặt nhiều hơn 20 đơn hàng,
-- sắp xếp theo thứ tự tổng số đơn hàng giảm dần.
select CustomerID, count(*) as TotalOrder
from Orders
group by CustomerID
having count(*) > 20
order by count(*) desc

-- Hãy lọc ra các nhân viên (EmployeeID) có tổng số đơn hàng 
-- lớn hơn hoặc bằng 100, sắp xếp theo tổng số đơn hàng giảm dần. 
select EmployeeID, count(*) as TotalOrder
from Orders
group by EmployeeID
having count(*) >= 100
order by count(*) desc

-- Hãy cho biết những thể loại nào (CategoryID) có số sản phẩm 
-- khác nhau lớn hớn 11.
select CategoryID, count(*) as TotalProduct
from Products
group by CategoryID
having count(*) > 11

-- Hãy cho biết những thể loại nào (CategoryID) 
-- có số tổng số lượng sản phẩm trong kho (UnitsInStock) lớn hơn 350.
select CategoryID, sum(UnitsInStock) as SumUnitsInStock
from Products
group by CategoryID
having sum(UnitsInStock) > 350

-- Hãy cho biết những quốc gia nào có nhiều hơn 7 don hang.
select ShipCountry, count(*) as TotalOrder
from Orders
group by ShipCountry
having count(*) > 7

-- Hãy cho biết những ngày nào có nhiều hơn 5 đơn hàng được giao, 
-- sắp xếp tăng dần theo ngày giao hàng.
select ShippedDate, count(*) as TotalOrder
from Orders
where ShippedDate is not null
group by ShippedDate
having count(*) > 5
order by ShippedDate asc

-- Hãy cho biết những quốc gia bắt đầu bằng chữ ‘A’ hoặc ‘G’ 
-- và có số lương đơn hàng lớn hơn 29.
select ShipCountry , count(*) as TotalOrder
from Orders
where ShipCountry like 'A%' or ShipCountry like 'G%'
group by ShipCountry
having count(*) > 29

-- Hãy cho biết những thành phố  nào có số lượng đơn hàng dc giao là khác 1 và 2
-- ngày đặt hàng từ ngày '1997-04-01' đến ngày '1997-08-31'
select ShipCity, OrderDate ,count(ShippedDate) as TotalShippedDate
from Orders
where OrderDate between '1997-04-01' and '1997-08-31'
group by ShipCity,OrderDate
having count(ShippedDate) != 1 and count(ShippedDate) != 2

-- Hãy lọc ra các đơn hàng được giao đến LonDon bị trễ và có số lượng lớn hơn 100;sắp xếp theo ngày giao hàng  
select ShipCity,ShippedDate, RequiredDate , count(*) as TotalOrder
from Orders
where ShipCity = 'LonDon' and ShippedDate > RequiredDate
group by ShipCity,ShippedDate, RequiredDate
having count(*) > 100
order by ShippedDate asc