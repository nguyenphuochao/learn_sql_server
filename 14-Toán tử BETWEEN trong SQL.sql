SELECT column_name(s)
FROM table_name
WHERE column_name BETWEEN value1 AND value2;

-- Lấy danh sách các sản phẩm có giá bán trong khoảng từ 10 đến 20 đô la.
select *
from Products
where UnitPrice between 10 and 20

-- Lấy danh sách các đơn đặt hàng được đặt trong khoảng thời gian 
-- từ ngày 1996-07-01 đến ngày 1996-07-31:
select *
from Orders
where OrderDate between '1996-07-01' and '1996-07-31'

-- Tính tổng số tiền vận chuyển (Freight) của các
-- đơn đặt hàng được đặt trong khoảng thời gian từ ngày 1996-07-01 
-- đến ngày 1996-07-31:
select sum(Freight) as ToltalFreightJunly
from Orders
where OrderDate between '1996-07-01' and '1996-07-31'

-- Lấy danh sách các đơn đặt hàng có ngày đặt hàng trong khoảng từ 1/1/1997 đến 31/12/1997 và
-- dc vận chuyển bằng đường tàu thủy (ShipVia = 3)
select *
from Orders
where OrderDate between '1997-01-01' and '1997-12-31'
and ShipVia = 3