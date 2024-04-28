-- VD1: Từ bảng Products và Categories, hãy in ra các thông tin: Mã thể loại, tên thể loại, Mã sản phẩm, tên sản phẩm:
select c.CategoryID, c.CategoryName, p.ProductID, p.ProductName
from Products as p, Categories as c
where c.CategoryID = p.CategoryID;

-- VD2: Từ bảng Employees và Orders, hãy in ra các thông tin sau đây: Mã nhân viên, tên nhân viên, SL đơn hàng mà nhân viên bán được:
select E.EmployeeID, E.LastName, E.FirstName, count(O.OrderID) as Total_order
from Employees as E, Orders as O
where E.EmployeeID = O.EmployeeID
group by E.EmployeeID, E.LastName, E.FirstName

-- VD3: Từ bảng Customer và Orders, hãy in ra các thông tin sau đây: MS khách hàng, tên công ty, tên liên hệ, số lượng đơn hàng đã mua,
-- với điều kiện quốc gia khách hàng là UK
select c.CustomerID, c.CompanyName, c.ContactName, c.Country, count(o.OrderID) as Total_order
from Customers as c, Orders as o
where c.CustomerID = o.CustomerID and c.Country = 'UK'
group by c.CustomerID, c.CompanyName, c.ContactName, c.Country

-- VD4: Từ bảng order và shipper, đưa ra các thông tin sau đây: Mã nhà vận chuyển, tên cty vận chuyển, tổng số tiền vc
-- điều kiện: sắp xếp tổng số tiền vc giảm dần:
select s.CompanyName, s.ShipperID, sum(Freight) as Sum_of_Freight
from Orders as o, Shippers as s
where s.ShipperID = o.ShipVia
group by s.CompanyName, s.ShipperID
order by Sum_of_Freight desc

-- VD5: Từ bảng products và Suppliers, in ra: mã ncc, tên cty, tổng số sp khác nhau đã cung cấp,
-- điều kiện: chỉ in ra màn hình duy nhất 1 nhà cung cấp có SL sp khác nhau nhiều nhất
select top 1 s.SupplierID, s.CompanyName, count(p.ProductID) as Various_Product --(thêm dòng top 1 vào trước mấy cái cột)
from Products as p, Suppliers as s
where s.SupplierID = p.SupplierID
group by s.SupplierID, s.CompanyName
order by Various_Product desc

-- VD6: Từ bảng Orders và Orders Detail, in ra tt: mã đơn hàng, tổng số tiền sp của đơn hàng đó.
select o.OrderID, sum(od.UnitPrice*od.Quantity) as Sum_of_Price
from Orders as o, [Order Details] as od
where o.OrderID = od.OrderID
group by o.OrderID
order by Sum_of_Price desc

-- VD7: Từ 3 bảng: Orders Detail, Employees, Orders in ra: mã đơn hàng, tên nhân viên, tổng số tiền sp của đơn hàng:
select o.OrderID, e.LastName, e.FirstName, sum(od.UnitPrice*od.Quantity) as Sum_of_Price
from Orders as o, [Order Details] as od, Employees as e
where e.EmployeeID = o.EmployeeID and o.OrderID = od.OrderID
group by o.OrderID, e.LastName, e.FirstName
order by Sum_of_Price desc