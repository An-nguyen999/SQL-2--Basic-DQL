--1/ NULL:

-- Lấy ra tất cả đơn hàng chưa được giao hàng:
select *
from Orders
where ShippedDate is null;

select count(*)
from Orders
where ShippedDate is null;

-- Lấy các khách hàng có khu vực không bị Null:
select *
from Customers
where Region is not null;

-- Lấy danh sách các khách hàng không có tên công ty:
select *
from Customers
where CompanyName is null;

-- Lấy ra tất cả đơn hàng chưa được giao hàng và có khu vực giao hàng không bị NULL:
select *
from Orders
where ShippedDate is null and ShipRegion is not null;

-- 2/ GROUP BY:

-- Hãy cho biết mỗi khách hàng đã đặt bao nhiêu đơn hàng
select CustomerID, COUNT(CustomerID) as NumberOfOrder
from Orders
group by CustomerID
order by NumberOfOrder desc

-- Hãy tính giá trung bình theo mỗi nhà cung cấp sản phẩm:
select *
from Products

select SupplierID , sum(UnitPrice) as Avg_Price_of_Supplier
from Products
group by SupplierID
order by Avg_Price_of_Supplier desc

-- Hãy cho biết mỗi thể loại có bao nhiêu sản phẩm trong kho:
select CategoryID , sum(UnitsInStock) as Sum_of_Product_Stock
from Products
group by CategoryID
order by Sum_of_Product_Stock desc

-- Trong bảng order: cho biết giá vân chuyển thấp nhất và cao nhất - theo từng thành phố + quốc gia khác nhau:
select *
from Orders

select  ShipCountry, ShipCity, 
	    min(Freight) as Min_Freight, max(Freight) as Max_Freight
from Orders
group by ShipCountry, ShipCity
order by ShipCountry ASC, ShipCity asc

-- Thống kê số lượng nhân viên theo từng quốc gia khác nhau:
select *
from Employees

select  Country, 
	    count(EmployeeID)as Count_of_Employees
from Employees
group by Country
order by Count_of_Employees asc

