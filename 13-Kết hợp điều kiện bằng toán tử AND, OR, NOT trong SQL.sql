SELECT column1, column2, ...
FROM table_name
WHERE condition1 AND condition2 AND condition3 ...;
=> Trả về 1 bản ghi nếu thõa mãn tất cả điều kiện AND là TRUE

SELECT column1, column2, ...
FROM table_name
WHERE condition1 OR condition2 OR condition3 ...;
=>Trả về 1 bản ghi nếu thõa mãn 1 điều kiện OR là TRUE

SELECT column1, column2, ...
FROM table_name
WHERE NOT condition;
=>Trả về 1 bản ghi nếu không thõa mãn điều kiện là FALSE

-- Bạn hãy liệt kê tất cả các sản phẩm có số lượng trong kho (UnitsInStock)
-- nhỏ hơn 50 hoặc lớn hơn 100.
select *
from Products
where UnitsInStock < 50 or UnitsInStock > 100

-- Bạn hãy liệt kê tất các đơn hàng được giao đến Brazil, đã bị giao muộn, 
-- biết rằng ngày cần phải giao hàng là RequiredDate, ngày giao hàng thực tế là ShippedDate.
select *
from Orders
where ShipCountry = 'Brazil' and RequiredDate < ShippedDate

-- Lấy ra tất cả các sản phẩm có giá dưới 100$ và mã thể loại khác 1.
-- Lưu ý: dùng NOT
select *
from Products
where UnitPrice < 100 and CategoryID != 1

select *
from Products where not (UnitPrice > 100 or CategoryID = 1)

-- Hãy liệt kê tất cả các đơn hàng có giá vận chuyển Freight trong khoảng [50,100] đô la
select *
from Orders
where Freight >=50 and Freight <=100

-- Hãy liệt kê các sản phẩm có số lượng hàng trong kho (UnitsInStock) lớn hơn 20
-- và số lượng hàng trong đơn hàng (UnitsOnOrder) nhỏ hơn 20
select *
from Products 
where UnitsInStock > 20 and UnitsOnOrder < 20
