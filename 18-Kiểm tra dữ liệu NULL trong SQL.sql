SELECT column_names
FROM table_name
WHERE column_name IS NULL;

SELECT column_names
FROM table_name
WHERE column_name IS NOT NULL;

-- Lấy ra tất cả các đơn hàng chưa được giao hàng.
-- (ShippedDate => NULL)
select *
from Orders where ShippedDate is null

-- Lấy danh sách các khách hàng có khu vực (Region) không bị NULL
select *
from Customers where Region is not null

-- Lấy danh sách các khách hàng không có tên công ty (CompanyName).
select *
from Customers where CompanyName is null

-- Hãy lấy ra tất cả các đơn hàng chưa dc giao hàng và có khu vực giao hàng (ShipRegion)
-- không bị NULL
select *
from Orders
where ShippedDate is null and ShipRegion is not null