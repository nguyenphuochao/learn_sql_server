
-- Tính số lượng đơn đặt hàng trong năm 1997 của từng khách hàng?
select CustomerID, OrderDate , count(*) as CountOrder
from Orders
where Year(OrderDate) = 1997
group by CustomerID,OrderDate

-- Hãy lọc ra các đơn hang được đặt hàng vào tháng 5 năm 1997.
select *
from Orders
where month(OrderDate) = 5 and year(OrderDate) = 1997

-- Lấy danh sách các đơn hàng được đặt vào ngày 4 tháng 9 năm 1996.
select *
from Orders
where OrderDate = '1996-09-04'

select *
from Orders
where day(OrderDate) = 4 and month(OrderDate) = 9 and year(OrderDate) = 1996
-- Lấy danh sách khách hàng đặt hàng trong năm 1998 
-- và số đơn hàng mỗi tháng, sắp xếp tháng tăng dần.
select CustomerID, month(OrderDate) as [Tháng],  count(*) as [Số đơn hàng]
from Orders
where year(OrderDate) = 1998
group by CustomerID, month(OrderDate)
order by month(OrderDate) asc

-- Hãy lọc ra các đơn đặt hàng đã dc giao vào tháng 5, và sắp xếp tăng dần theo năm
select *
from Orders
where month(ShippedDate) = 5 
order by year(ShippedDate) asc