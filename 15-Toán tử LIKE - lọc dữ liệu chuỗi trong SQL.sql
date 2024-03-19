SELECT column1, column2, ...
FROM table_name
WHERE columnN LIKE pattern;

-- Hãy lọc ra tất cả các khách hàng đến từ các quốc gia (Country)
-- bắt đầu bằng chữ ‘A’
select *
from Customers
where Country like 'A%'

-- Lấy danh sách các đơn đặt được gửi đến các thành phố có chứa chữ ‘a’.
select *
from Orders
where ShipCity like '%a%'

-- Hãy lọc ra tất cả các đơn hàng với điều kiện:
-- ShipCountry  LIKE ‘U_’
-- ShipCountry LIKE ‘U%’
select *
from Orders
where ShipCountry like 'U_'

select *
from Orders
where ShipCountry like 'U%'

-- Lấy ra tất cả các nhà cung cấp hàng có chữ 'b' trong tên của công ty
select *
from Suppliers
where CompanyName like '%b%'