ORDER      CLAUSE     FUNCTION
1          from       choose and join table to get base date
2          where      filters the base data
3          group by   aggregate the base data
4          having     filters the aggregated data
5          select     returns the final data
6          order by   sorts the final data
7          limit      limits the returned data to a row count
=>
    SELECT DISTINCT 9 TOP 11 , , 8
    FROM 1
    full/L/R 4 outer JOIN 2 ON 3
    WHERE 5
    GROUP BY 6
    HAVING 7
    ORDER BY 10

select p.ProductID, p.ProductName --2 
from Products p --1

select p.ProductID, p.ProductName --3
from Products p --1
where p.CategoryID = 1 --2

select p.CategoryID, count(p.ProductID) as CountProduct --4
from Products p --1
where p.CategoryID in (1,2,3) --2
group by p.CategoryID --3

select p.CategoryID, count(p.ProductID) as CountProduct --5
from Products p --1
where p.CategoryID in (1,2,3) --2
group by p.CategoryID --3 CountProduct chưa tồn tại
having count(p.ProductID) <= 14 --4 CountProduct chưa tồn tại

select p.CategoryID, count(p.ProductID) as CountProduct --5
from Products p --1
where p.CategoryID in (1,2,3) --2
group by p.CategoryID --3 CountProduct chưa tồn tại
having count(p.ProductID) <= 14 --4 CountProduct chưa tồn tại
order by CountProduct DESC --6  CountProduct đã tồn tại

select top 3 --8 p.ProductID,od.Discount,o.ShipCountry --6
from Products p --1
inner join --4 [Order Details] od --2
on p.ProductID = od.ProductID --3
inner join Orders o
on o.OrderID = od.OrderID
where od.Discount = 0.25 and o.ShipCountry = 'Germany' --5
order by p.ProductID desc --7

