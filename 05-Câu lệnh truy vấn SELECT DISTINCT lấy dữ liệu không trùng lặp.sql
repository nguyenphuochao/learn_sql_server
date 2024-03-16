-- Viết câu lệnh SQL lấy ra tên các quốc gia (Country) khác nhau
-- từ bảng khách hàng - Customers
select DISTINCT Country
from Customers

-- Viết câu lệnh SQL lấy ra tên các mã số bưu điện (PostalCode) khác nhau 
-- từ bảng Nhà cung cấp - Suppliers
select DISTINCT PostalCode
from Suppliers

-- Viết câu lệnh SQL lấy ra các dữ liệu khác nhau về họ của nhân viên (LastName) 
-- và cách gọi danh hiệu lịch sự (TitleOfCourtesy) của nhân viên từ bảng Employees
select DISTINCT LastName,TitleOfCourtesy
from Employees

-- Viết câu lệnh SQL lấy ra mã đơn vị vận chuyển (ShipVia) khác nhau của các đơn hàng - Orders
select distinct ShipVia
from Orders

-- Viết câu lệnh SQL lấy ra tên công ty và quốc gia khác nhau từ bảng Customers
select DISTINCT [CompanyName],[Country]
from Customers