SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
ORDER BY column_name(s);

The GROUP BY statement is often used with aggregate 
functions (COUNT(), MAX(), MIN(), SUM(), AVG()) to group the result-set by one or more columns.

-- Hãy cho biết mỗi khách hàng đã đặt bao nhiêu đơn hàng?
select CustomerID , count(*) as CountOrder
from Orders 
group by CustomerID

-- Hãy tính giá trị đơn giá trung bình theo mỗi nhà cung cấp sản phẩm.
select SupplierID, avg(UnitPrice) as AvgUnitPrice
from Products
group by SupplierID

-- Hãy cho biết mỗi thể loại có tổng số bao nhiêu sản phẩm trong kho (UnitsInStock)?
select CategoryID, sum(UnitsInStock) as SumUnitsInStock
from Products
group by CategoryID

-- Hãy cho biết giá vận chuyển thấp nhất và lớn nhất 
-- của các đơn hàng theo từng thành phố và quốc gia khác nhau.
select ShipCity,ShipCountry , min(Freight) as MinFreight , max(Freight) as MaxFreight
from Orders 
group by ShipCity, ShipCountry 

-- Thống kê số lượng nhân viên theo từng quốc gia khác nhau
select Country , count(*) as CountEmployee
from Employees
group by Country