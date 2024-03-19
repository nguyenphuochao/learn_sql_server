SQL Wildcard Characters

-- Hãy lọc ra tất cả các khách hàng có tên liên hệ bắt đầu bằng chữ ‘A’
select *
from Customers
where ContactName like 'A%'

-- Hãy lọc ra tất cả các khách hàng có tên liên hệ bắt đầu bằng chữ ‘H’
-- , và có chữ thứ 2 là bất kỳ ký tự nào.
select *
from Customers 
where ContactName like 'H_%'
-- Hãy lọc ra tất cả các đơn hàng được gửi đến thành phố 
-- có chữ cái bắt đầu là L, chữ cái thứ hai là u hoặc o.

select *
from Orders
where ShipCity like 'L[u,o]%'

-- Hãy lọc ra tất cả các đơn hàng được gửi đến thành phố 
-- có chữ cái bắt đầu là L, chữ cái thứ hai khong là u hoặc o.
select *
from Orders
where ShipCity like 'L[^u,o]%'

-- Hãy lọc ra tất cả các đơn hang được gửi đến thành phố có 
-- chữ cái bắt đầu là L, chữ cái thứ hai là các ký tự từ a đến e.
select *
from Orders
where ShipCity like 'L[a-e]%'

-- Hãy lấy ra tất cả các nhà cung cấp hàng có tên công ty bắt đầu bằng chữ A và không chứa kí tự b
select *
from Suppliers
where CompanyName like 'A%' and CompanyName not like '%b%'