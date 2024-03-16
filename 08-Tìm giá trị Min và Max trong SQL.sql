
-- Viết câu lệnh SQL tìm giá thấp nhất của các sẩn phẩm trong bảng Products.
select MIN(UnitPrice) as MinPrice
from Products

-- Viết câu lệnh lấy ra ngày đặt hàng gần đây nhất 
-- từ bảng Orders.
select MAX(OrderDate) as MaxOrderDate
from Orders

-- Viết câu lệnh SQL tìm số lượng hàng trong kho (UnitsInStock)
-- lớn nhất.
select MAX(UnitsInStock) as MaxUnitsInStock
from Products

-- Hãy cho biết ngày sinh của nhân viên có tuổi đời lớn nhất công ty
select MIN(BirthDate) as MinBirthDateEmployee
from Employees