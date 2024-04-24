
-- hàm count: đếm số dữ liệu khác NULL trong cột cần đếm
select count([CustomerID]) as number_of_customer
from Customers 

-- hoặc là như này:
select count(*) as number_of_customer
from Customers

-- sum:
select sum([Freight]) as sum_of_freight
from Orders

--hàm average: AVG
select *
from [Order Details]

select avg(Quantity) as average_of_quantity
from [Order Details]

--
select *
from Products

select Count(*) as Number_of_products,
		Sum([UnitsInStock]) as Total_unitInStock,
		avg([UnitPrice]) as	Avg_UnitPrice
from Products

select *
from Orders

select count(*)
from Orders

select count(OrderID)
from Orders