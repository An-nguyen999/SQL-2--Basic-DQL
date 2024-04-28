
-- 1/ DAY-MONTH-YEAR

-- Tính số đơn đặt hàng trong năm 1997 của từng khách hàng
select *
from Orders

select  CustomerID, count(OrderID), 
		year(OrderDate) as Year
from Orders
where year(OrderDate) = '1997'
group by CustomerID, year(OrderDate)

-- Lọc ra các đơn hàng được đặt vào tháng 5/1997
select *
from Orders
where Month(OrderDate) = 5 and Year(OrderDate) = 1997

select count(*)
from Orders
where Month(OrderDate) = 5 and Year(OrderDate) = 1997

-- Lấy danh sách các đơn hàng được đặt vào 4-9-1997:
select *
from Orders
where Month(OrderDate) = 9 and Year(OrderDate) = 1996 and Day(OrderDate) =4

select *
from Orders
where OrderDate = '1996-09-04'

-- Lấy danh sách khách hàng đặt hàng trong năm 1998 và số đơn hàng mỗi tháng, sắp xếp tăng dần:
select *
from Orders

select year(OrderDate) as [Year], month(OrderDate) as [Month], CustomerID, count(*)
from Orders
where year(Orderdate) = 1998
group by CustomerID, year(OrderDate), month(OrderDate)
order by month(OrderDate) asc

-- Lọc ra các đơn hàng đã được giao vào tháng 5, và sếp theo thứ tự tăng dần theo năm:
select *
from Orders
where month(ShippedDate) = 5
order by month(ShippedDate) asc

--2/ HAVING:

-- Khách hàng nào đã đặt nhiều hơn 20 đơn hàng, sắp xếp theo thứ tự tổng đơn hàng giảm dần:
select CustomerID, count(*) as Number_of_Orders
from Orders
group by CustomerID
Having count(*) >= 5
Order by count(*) desc

-- Lọc ra những sản phẩm có tổng số lượng hàng trong kho (Unitsinstock) lớn hơn 30 và có giá trung bình (unitprice) dưới 50:
select ProductName, sum(UnitsInStock) as Total_quantity, Avg(UnitPrice) as Avg_Price
from Products
group by ProductName
having sum(UnitsInStock) > 30 and Avg(UnitPrice) <50
order by ProductName asc

select *
from Orders

-- Hãy cho biết tổng tiền vận chuyển từng tháng, trong nửa năm sau năm 1996, sắp xếp theo tháng tăng dần, tổng tiền vận chuyển > 1000:
select year(ShippedDate) as [Year], month(ShippedDate) as [Month], sum(Freight) as Total_Freight
from Orders
where ShippedDate between '1996-06-01' and '1996-12-31'
--where year(ShippedDate) = 1996 and month(ShippedDate) between 6 and 12
group by year(ShippedDate), month(ShippedDate)
having sum(Freight) > 1000
order by Total_Freight desc