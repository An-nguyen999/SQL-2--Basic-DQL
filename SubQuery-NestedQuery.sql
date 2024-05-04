--1/ SUB QUERY:
-- lấy ra toàn bộ sp:
select ProductID, ProductName, UnitPrice
from Products

-- Lấy giá trung bình các sản phẩm:
select avg(UnitPrice) as avg_Price
from Products

-- VD1: Lọc những sản phẩm có giá > giá trung bình:
select ProductID, ProductName, UnitPrice
from Products
where UnitPrice > (
		select avg(UnitPrice) as avg_Price
		from Products)

-- VD2: Lọc khách hàng nào có số đơn hàng > = 10
-- Cách 1: Không cần Sub query
select c.CustomerID, c.CompanyName, count(o.OrderID) as Order_quantity
from Customers c
left join Orders o
on c.CustomerID = o.CustomerID
group by c.CustomerID, c.CompanyName
having count(o.OrderID) >= 10
order by Order_quantity desc
-- Cách 2: Dùng sub query
select CustomerID, CompanyName
from Customers
where CustomerID in (
						select CustomerID
						from Orders
						group by CustomerID
						having count(OrderID) >= 10  )

-- VD3: Tính tổng tiền cho từng đơn hàng:
-- Cách này mình tự làm nhưng không xuất hiện đầy đủ thông tin đơn hàng
select OrderID, sum([UnitPrice]*[Quantity]) as TotalCost_Of_Order
from [dbo].[Order Details]
group by OrderID
order by TotalCost_Of_Order
-- Cách 2: được dạy:
select o.*, (
			select sum(od.[UnitPrice]*od.[Quantity])
			from [dbo].[Order Details] od
			where o.OrderID = od.OrderID) as TotalCost
from Orders o	

-- VD4: Lọc ra tên sản phẩm và tổng số đơn hàng của sản phẩm
select p.ProductID, p.ProductName, (
						select count(od.OrderID) 
						from [dbo].[Order Details] od
						where p.ProductID = od.ProductID
						group by od.ProductID ) as TotalOrders
from Products p
