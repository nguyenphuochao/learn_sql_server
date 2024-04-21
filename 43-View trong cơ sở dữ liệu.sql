CREATE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition

CREATE VIEW MothlySales AS
SELECT 
  YEAR([OrderDate]) as "Năm",
  MONTH([OrderDate]) as "Tháng",
  COUNT([OrderID]) as "Số lượng đơn hàng"
FROM
  [dbo].[Orders]
GROUP BY YEAR([OrderDate]), MONTH([OrderDate]);

-- Tạo 1 view có tên 'HightValueProduct' để hiển thị danh sách các sản phẩm có giá
-- trị cao hơn $50
create view HightValueProduct as
select *
from Products where UnitPrice > 50;

-- Tạo 1 view có tên 'CustomerOrder' để hiển thị thông tin
-- về khách hàng và số lượng hàng của họ
create view CustomerOrder as
select Customers.CustomerID,
       sum([Order Details].Quantity) as Total
from [Order Details]
join Orders on Orders.OrderID = [Order Details].OrderID
join Customers on Customers.CustomerID = Orders.CustomerID
group by Customers.CustomerID;

-- Tạo 1 view có tên 'EmployeeSalesByYear' để hiển thị tổng doanh số bán hàng
-- của từng nhân viên theo năm
create view EmployeeSalesByYear as 
select Orders.EmployeeID,
       year(Orders.OrderDate) as Year,
	   sum([Order Details].Quantity * [Order Details].UnitPrice) as Total
from Orders join [Order Details]
on Orders.OrderID = [Order Details].OrderID
group by Orders.EmployeeID,year(Orders.OrderDate)

-- Tạo 1 view có tên 'CategoryProductCounts' để hiển thị số lượng sản phẩm trong mỗi 
-- danh mục sản phẩm
create view CategoryProductCounts as
select CategoryID,
       count(ProductID) as Total
from Products
group by CategoryID;

-- Tạo 1 view có tên 'CustomerOrderSummary' để hiển thị tổng giá trị đặt hàng
-- của mỗi khách hàng
create view CustomerOrderSummary as
select o.CustomerID,
       sum(od.Quantity * od.UnitPrice) as Total
from Orders o join [Order Details] od
on o.OrderID = od.OrderID
group by o.CustomerID
-- gọi view 
select * from CustomerOrderSummary