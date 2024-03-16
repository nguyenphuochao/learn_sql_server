-- Công thức
-- SELECT TOP number|percent column_name(s)
-- FROM table_name where condition

-- Viết câu lệnh SQL lấy ra 05 dòng đầu tiên 
-- trong bảng Customers.
select top 5 *
from Customers

-- Viết câu lệnh SQL lấy ra 30% nhân viên 
-- của công ty hiện tại.
select top 30 percent *
from Employees

--Viết câu lệnh SQL lấy ra các mã khách hàng trong bảng đơn hàng 
--với quy định là mã khách hàng không được trùng lặp, 
--chỉ lấy 5 dòng dữ liệu đầu tiên.
select distinct top 5 CustomerID
from Orders

-- Viết câu lệnh SQL lấy ra các sản phẩm có mã thể loại không trùng lặp và chỉ lấy ra 3 dòng đầu tiên
select distinct top 3 CategoryID
from Products