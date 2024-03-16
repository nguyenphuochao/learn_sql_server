-- Hãy đếm số lượng khách hàng có trong bảng  (Customers).
select count(*)
from Customers

-- Tính tổng số tiền vận chuyển (Freight) 
-- của tất cả các đơn đặt hàng.
select sum(Freight) as TotalFreight
from Orders

-- Tính trung bình số lượng đặt hàng (Quantity) 
-- của tất cả các sản phẩm trong bảng [Order Details]
select avg(Quantity) as AvgQuantity
from [Order Details]

-- Đếm số lượng, tính tổng số lượng hàng trong kho 
-- và trung bình giá của các sản phẩm có trong bảng Product
select count(*) as "Số lượng",
		sum([UnitsInStock]) as "Tổng hàng trong kho",
		avg([UnitPrice]) as "Trung bình giá bán"
from Products

-- Hãy đếm số lượng đơn hàng từ bảng (Orders)
select count(*) as CountOrder
from Orders

select count(OrderID) as CountOrder
from Orders

-- Từ bảng OrderDetails hãy tính trung bình cột UnitPrice và tính tổng cho cột Quantity
select  avg(UnitPrice) as AvgUnitPrice ,
		sum(Quantity) as SumQty
from [Order Details]