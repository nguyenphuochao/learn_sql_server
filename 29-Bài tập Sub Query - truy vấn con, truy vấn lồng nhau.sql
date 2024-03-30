-- Liệt kê các đơn hàng có ngày đặt hàng gần đây nhất
select *
from Orders
where OrderDate = (
	select max(OrderDate)
	from Orders
)
-- Liệt kê tất cả các sản phẩm (ProductName) mà không có đơn đặt hàng nào mua chúng
select *
from Products 
where ProductID not in (
	select ProductID
	from [Order Details]
)
-- Lấy thông tin về các đơn hàng, và tên các sản phẩm thuộc các đơn hàng chưa dc giao cho khách
select o.OrderID, p.ProductName
from [Order Details] od inner join Products p
on od.ProductID = p.ProductID
inner join Orders o on o.OrderID = od.OrderID
where o.OrderID in (
	select OrderID
	from Orders
	where ShippedDate is null
)
-- Lấy ra thông tin về các sản phẩm có số lượng tồn kho ít hơn số lượng tồn kho trung bình 
-- của tất cả các sản phẩm
select ProductID, ProductName, UnitsInStock
from Products
where UnitsInStock < (
		select avg(UnitsInStock)
		from Products
)
-- Lấy ra thông tin về các khách hàng có tổng trị giá đơn hàng lớn nhất
select c.CustomerID,c.ContactName
from Orders o inner join Customers c
on o.CustomerID = c.CustomerID
where o.OrderID = (
		select top 1 OrderID
		from [Order Details]
		group by OrderID
		order by sum(UnitPrice * Quantity) desc
)