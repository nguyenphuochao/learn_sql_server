-- fibo
with fibo(prev_n, n) as (
	-- Khởi tạo
	select
		0 as prev_n,
		1 as n
	union all
	-- đệ qui
	select 
		n as prev_n,
		prev_n + n as n
	from fibo
)
select * from fibo
option (maxrecursion 5);
-- Sn=S(n-1) + S(n-2)
-- 0 1 1 2 3 5 8

-- Giai thừa
with giaiThua(stt,giaiThuaX) as (
	-- khởi tạo
	select 
		1 as stt,
		1 as giaiThuaX
	union all
	-- đệ qui
	select 
		stt + 1 as stt,
		(stt + 1)* giaiThuaX as giaiThuaX
	from giaiThua
)
select * from giaiThua
option (maxrecursion 5);

-- Sử dụng truy vấn đệ qui để tạo 1 cây cấu trúc quản lý của nhân viên trong table Employee
-- trong đó "ReportsTo" chính là mã của người quản lí
declare @EmployeeId int
set @EmployeeId = 2;
with e_cte as (
	-- khởi tạo
	select e.EmployeeID, 
		   e.FirstName+''+e.LastName as Name,
		   e.ReportsTo as ManagerId,
		   0 as Level
	from Employees e
	where e.EmployeeID = @EmployeeId
	union all
	-- đệ qui
	select e1.EmployeeID, 
		   e1.FirstName+''+e1.LastName as Name,
		   e1.ReportsTo as ManagerId,
		   Level + 1 as Level
	from Employees e1
	join e_cte on e1.ReportsTo = e_cte.EmployeeID
)
select * from e_cte
option (maxrecursion 500);