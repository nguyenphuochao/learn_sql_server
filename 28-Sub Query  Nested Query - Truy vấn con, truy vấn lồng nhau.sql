SUB QUERY là gì
- Subquery (câu truy vấn con) trong SQL là một truy vấn SELECT được viết bên trong
một truy vấn SELECT,UPDATE,INSERT hoặc DELETE khác
- Subquery hoạt động như một bảng ảo tạm thời, nó được sử dụng để trích xuất thông tin từ các bảng hoặc
tập dữ liệu khác trong cùng một câu truy vấn

-- Liet ke ra toan bo san pham
select *
from Products

-- Tim gia trung binh cua cac san pham
select avg(UnitPrice) as AvgUnitPrice
from Products
-- Loc nhung san pham co gia > gia trung binh
select *
from Products
where UnitPrice > 28.6373
-- sub query
select *
from Products 
where UnitPrice > (
	select avg(UnitPrice) from Products
)

-- Loc ra nhung khach hang co so don hang > 10
select CustomerID, count(OrderID) as CountOrder
from Orders
group by CustomerID 
having count(OrderID) > 10
-- sub query
select *
from Customers
where CustomerID in (
			select CustomerID
			from Orders
			group by CustomerID
			having count(OrderID) > 10
)

-- Tinh tong tien cho tung don hang
select OrderID, sum(UnitPrice * Quantity) as Total
from [Order Details]
group by OrderID
-- sub query
select o.*, (
	select sum(od.UnitPrice * od.Quantity)
	from [Order Details] od
	where od.OrderID = o.OrderID
) as Total
from Orders o

-- Loc ra ten san pham va tong so don hang cua san pham
select p.ProductName, count(o.ProductID) as CountOrder
from [Order Details] o right outer join Products p
on o.ProductID = p.ProductID
group by p.ProductName
-- sub query
SELECT ProductName, TotalOrders
FROM 
	(SELECT p.ProductID, p.ProductName, (
				SELECT COUNT(*)
				FROM [dbo].[Order Details] od
				WHERE od.ProductID = p.ProductID
			) as [TotalOrders]
	FROM [dbo].[Products] p) AS Temp;

-- Hãy in ra mã đơn hàng , và số lượng sản phẩm của đơn hàng đó
select od.OrderID, count(od.ProductID) as CountOrder
from [Order Details] od
group by od.OrderID
-- sub query
select OrderID, (
	select count(od.ProductID)
	from [Order Details] od
	where od.OrderID = o.OrderID
) as Total
from Orders o