SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
HAVING condition
ORDER BY column_name(s);
=> Lọc dữ liệu sau GROUP BY

-- Hãy cho biết những khách hàng nào đã đặt nhiều hơn 20 đơn hàng, 
-- sắp xếp theo thứ tự tổng số đơn hàng giảm dần.
select CustomerID, count(*) as TotalOrder
from Orders
group by CustomerID
having count(*) > 20
order by count(*) desc

-- Hãy lọc ra những nhà cung cấp sản phẩm có tổng số lượng 
-- hàng trong kho (UnitsInStock) lớn hơn 30, và có trung bình 
-- đơn giá (UnitPrice) có giá trị dưới 50.
select SupplierID , sum(UnitsInStock) as SumUnitsInStock, avg(UnitPrice) as AvgUnitPrice
from Products
group by SupplierID 
having sum(UnitsInStock) > 30 and  avg(UnitPrice) < 50

-- Hãy cho biết tổng số tiền vận chuyển của từng tháng, 
-- trong nửa năm sau của năm 1996, sắp xếp theo tháng tăng dần.
select month(ShippedDate) as Month , sum(Freight) as SumFreight
from Orders
where ShippedDate between '1996-07-01' and '1996-12-31'
group by month(ShippedDate)
order by month(ShippedDate) asc

-- Hãy cho biết tổng số tiền vận chuyển của từng tháng, 
-- trong nửa năm sau của năm 1996, sắp xếp theo tháng tăng dần.
-- Tong tien van chuyen lon hon 1000$
select ShippedDate , sum(Freight) as SumFreight
from Orders
where ShippedDate between '1996-07-01' and '1996-12-31'
group by ShippedDate
having sum(Freight) > 1000
order by month(ShippedDate) asc

-- Hãy lọc ra những thành phố có số lượng đơn hàng > 16 và sắp xếp theo tổng số lượng giảm dần
select ShipCity , count(*) as TotalOrder
from Orders
group by ShipCity
having count(*) > 16