
--1/ ORDER BY:

-- sắp xếp các nhà cung cấp theo giá trị tăng dần/giảm dần
select *
from Suppliers
order by [CompanyName] asc

select *
from Products
order by [UnitPrice] desc

-- sắp xếp nhưng không dùng ASC hoặc DESC
select *
from [dbo].[Employees]
order by [LastName],[FirstName] -- mặc định là tăng dần

-- lấy sản phẩm có số lượng bán cao nhất
select top 1*
from [dbo].[Order Details]
order by [Quantity] desc

--2/ WHERE:
-- where:
select *
from [dbo].[Employees]
where [City] = 'London'
--where + order by:
select *
from [dbo].[Employees]
where [City] = 'London'
order by LastName desc

-- liệt kê các đơn hàng muộn:
select *
from Orders
where ShippedDate > RequiredDate
order by ShippedDate - RequiredDate desc

-- đếm số lượng đơn hàng bị trễ ngày giao:
select count(*) as [Số đơn giao hàng muộn]
from Orders
where ShippedDate > RequiredDate


-- 3/ AND OR NOT:
-- where và And/or/not:
select *
from Products
where UnitsInStock > 50 and UnitsInStock <100

-- đơn hàng giao tới brazil bị giao muộn:
select *
from Orders
where  ShippedDate > RequiredDate and ShipCountry= 'Brazil'

-- giá dưới 100 đô và mã thể loại khác 1:
select *
from Products
where not (UnitPrice > = 100 or CategoryID = 1) -- not là phải dùng or

select *
from Products
where not (UnitPrice > = 100) and not(CategoryID = 1) -- not là phải dùng or


-- 4/ BETWEEN:
--between đơn giản:
select *
from Products
where  UnitPrice between 10 and 20

-- lấy danh sách đặt hàng trong tháng 7/1996:
select *
from Orders
where  OrderDate between '1996-07-01' and '1996-07-31'

-- tính tổng số tiền vận chuyển trong tháng 7: kết hợp hàm SUM
select sum(Freight) as [Tổng số tiền vận chuyển]
from Orders
where  OrderDate between '1996-07-01' and '1996-07-31'

-- đặt trong ngày đó và vận chuyển bằng tàu thủy shipvia = 3
select *
from Orders
where  OrderDate between '1997-01-01' and '1997-12-31' and ShipVia = 3