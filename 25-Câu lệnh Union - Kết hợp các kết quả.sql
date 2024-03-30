-- UNION
SELECT column_name(s) FROM table1
UNION
SELECT column_name(s) FROM table2;

=> 
- Được sử dụng để kết hợp tập kết quả của 2 hoặc nhiều câu lệnh
- Mỗi câu lệnh trong phải cùng số lượng cột
- Các cột cũng phải có kiểu dữ liệu tương tự
- Các cột trong mỗi câu lệnh cũng phải theo cùng thứ tự
=> Loại bỏ dữ liệu trùng lặp

-- UNION ALL 
SELECT column_name(s) FROM table1
UNION ALL
SELECT column_name(s) FROM table2;

=> Tương tự UNION
=> Cho phép dữ liệu trùng lặp

select Country from Customers
union all
select Country from Suppliers

select City, Country
from Customers where Country like 'U%'
union
select City, Country
from Suppliers where City = 'London'
union
select ShipCity, ShipCountry
from Orders where ShipCountry = 'USA'
=> Lấy ra thông tin của city và country
   và loại bỏ những kết quả trùng lặp