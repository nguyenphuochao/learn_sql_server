-- (INNER JOIN) Hãy liệt kê tên nhân viên và tên khách hàng của các đơn hàng trong bảng Orders
select e.FirstName,e.LastName,c.ContactName
from Orders o inner join Customers c on o.CustomerID = o.CustomerID
inner join Employees e on e.EmployeeID = o.EmployeeID

-- (LEFT JOIN) Hãy liệt kê tên nhà cung cấp và tên sản phẩm của các sản phẩm trong bảng Products
-- bao gồm cả các sản phẩm không có nhà cung cấp
select s.CompanyName, p.ProductName
from Products p left join Suppliers s on p.SupplierID = s.SupplierID

-- (RIGHT JOINN) Hãy liệt kê tên khách hàng và tên đơn hàng của các đơn hàng trong bảng Orders 
-- bao gồm cả khách hàng không có đơn hàng
select c.ContactName, o.OrderID
from Orders o right join Customers c on c.CustomerID = o.CustomerID

-- (FULL JOIN) Hãy liệt kê tên danh mục và tên nhà cung cấp của các sản phẩm trong bảng Products
-- bao gồm cả các danh mục và nhà cung cấp không có sản phẩm 
select c.CategoryName, s.ContactName
from Categories c full join Products p on c.CategoryID = p.CategoryID
full join Suppliers s on s.SupplierID = p.SupplierID