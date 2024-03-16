SQL Operators

-- Tính số lượng sản phẩm còn lại trong kho (UnitsInStock) 
-- sau khi bán hết các sản phẩm đã được đặt hàng (UnitsOnOrder) .
-- StockRemaining = UnitsInStock - UnitsOnOrder
select  [ProductID],
		[ProductName],
		([UnitsInStock] - [UnitsOnOrder]) as StockRemaining
from Products

-- Tính giá trị đơn hàng chi tiết cho tất cả các sản phẩm trong bảng OrderDetails
-- OrderDetailValue = UnitPrice x Quantity
select *,
       (UnitPrice * Quantity) as OrderDetailValue
from [Order Details]

-- Tính tỷ lệ giá vận chuyển đơn đặt hàng (Freight) trung bình
-- của các đơn hàng trong bảng Orders so với giá trị vận chuyển của đơn hàng lớn nhất (MaxFreight)
-- FreightRatio = AVG(Freight)/ MAX(Freight) 
select AVG(Freight)/ MAX(Freight) as FreightRatio
from Orders

-- Hãy liệt kê danh sách các sản phẩm và giá (UnitPrice) của từng sản phẩm
-- sẽ dc giảm đi 10%
-- Cách 1: Dùng phép nhân + phép chia
-- Cách 2: Chỉ dc dùng phép nhân
select * , 
	   (UnitPrice * (100 - 10) / 100 ) as SalePrice
from Products

select *,
	   (UnitPrice * 0.9) as SalePrice
from Products
