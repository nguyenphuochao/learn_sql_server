WITH tên_CTE(cot_1,cot_2,...) AS (
    -- truy vấn để định nghĩa CTE
)
Được sử dụng để tạo bảng tạm thời và sử dụng nó trong câu truy vấn sau đó
Giúp làm cho câu truy vấn trở nên dễ đọc và dễ quản lý hơn
=> kiểu như nó tạo table tạm thời

-- Lấy danh sách products bằng CTE
with table_tamp as (
	select ProductID, ProductName, UnitsInStock
	from Products
)
select * from table_tamp;

-- Lấy thông tin về các sản phẩm(Products) cùng thể loại vs 1 sản phẩm cụ thể
with table_tamp as (
	select CategoryID
	from Products
	where ProductName = 'Chai'
)
select *
from Products p, table_tamp tp
where p.CategoryID = tp.CategoryID

-- Lấy thông tin về đơn hàng (Orders) cùng vs tổng giá trị đơn hàng và
-- tỉ lệ giữa tổng giá trị và phí giao hàng
-- sub query
select o.OrderID,
	(
	select sum(od.UnitPrice * od.Quantity)
	from [Order Details] od
	where od.OrderID = o.OrderID
	) as TotalOrder,
	(select sum(od.UnitPrice * od.Quantity)
	from [Order Details] od
	where od.OrderID = o.OrderID
	) / o.ShipVia as ratio
from Orders o;
-- CTE
with table_tamp as (
	select OrderID,sum(od.Quantity * od.UnitPrice) as TotalOrder
	from [Order Details] od
	group by OrderID
) -- đã tính toán rồi lấy ra sài thôi
select o.OrderID,tp.TotalOrder,TotalOrder/o.ShipVia as ratio 
from Orders o join table_tamp tp
on o.OrderID = tp.OrderID;

-- 1.Sử dụng CTE để tính tổng doanh số bán hàng cho từng sản phẩm từ hai bảng "Order Details" và "Products"
with table_tamp as (
	select ProductID, sum(Quantity * UnitPrice) as Total
	from [Order Details]
	group by ProductID
)
select p.ProductID, p.ProductName, tp.Total
from Products p inner join table_tamp tp 
on p.ProductID = tp.ProductID;
-- 2. Sử dụng CTE để tính toán tổng doanh số bán hàng theo từng khách hàng và sau đó sắp xếp
-- danh sách khách hàng theo tổng doanh số giảm dần
with table_tamp as (
	select OrderID, sum(Quantity * UnitPrice) as Total
	from [Order Details] 
	group by OrderID
)
select c.CustomerID, c.ContactName, tp.Total
from Customers c join Orders o on c.CustomerID = o.CustomerID
join table_tamp tp on tp.OrderID = o.OrderID;
-- 3. Sử dụng CTE tính tổng doanh số bán hàng theo năm từ bảng "Order Details"
with table_tamp as (
	select OrderID, sum(Quantity * UnitPrice) as Total
	from [Order Details]
	group by OrderID
)
select year(o.OrderDate) as Year, sum(tp.Total) as Total
from Orders o join table_tamp tp
on tp.OrderID = o.OrderID
group by year(o.OrderDate)
