-- Tạo ra bảng mới với các sản phẩm có giá >50;
SELECT *
INTO HighValueProducts
FROM Products
WHERE [UnitPrice]>50;

-- Tạo ra bảng mới với các đơn hàng được giao đến USA
SELECT *
INTO USAOrders
FROM [dbo].[Orders]
WHERE [ShipCountry] LIKE 'USA';

-- Tạo 1 table tạm thời 'CustomerInLonDon' từ table Customers trong csdl chứa thông tin khách hàng có địa chỉ 
-- ở LonDon
SELECT *
INTO CustomerInLonDon
FROM Customers WHERE City = 'London'

-- Tạo 1 table tạm thời 'HighValueOrders' chứa thông tin về đơn hàng có tổng giá trị đặt hàng
-- > $1000
select OrderID, sum(UnitPrice * Quantity) as Total
into HighValueOrders
from [Order Details]
group by OrderID
having sum(UnitPrice * Quantity) > 1000