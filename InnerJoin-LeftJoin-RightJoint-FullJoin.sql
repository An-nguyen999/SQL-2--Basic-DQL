-- 1/ JOIN/INNER JOIN:
-- From table Products and Categories, get the following output: Mã thể loại, tên thể loại, mã sản phẩm, tên sản phẩm
select c.CategoryID, c.CategoryName, p.ProductID, p.ProductName
from Categories c
inner join Products p
on c.CategoryID = p.CategoryID;

-- From table Products and Categories, get the following output: Mã thể loại, tên thể loại, số lượng sản phẩm:
select c.CategoryID, c.CategoryName, COUNT(p.ProductID) as Quantity_of_Product
from Categories c
inner join Products p
on c.CategoryID = p.CategoryID
Group by c.CategoryID, c.CategoryName;

-- Hãy in ra các thông tin:mã đơn hàng, tên tt khách hàng:
select o.OrderID, c.ContactName
from Customers c
inner join Orders o
on c.CustomerID = o.CustomerID
--where o.OrderID is null

--2/ LEFT JOIN = LEFT OUTER JOIN:
select *
from Categories;


select c.CategoryID, c.CategoryName, p.ProductID, p.ProductName
from Categories c
left join Products p
on c.CategoryID = p.CategoryID
order by c.CategoryID

select c.CategoryID, c.CategoryName, COUNT(p.ProductID) as Quantity_of_Product
from Categories c
left join Products p
on c.CategoryID = p.CategoryID
Group by c.CategoryID, c.CategoryName
order by c.CategoryID

--3/ RIGHT JOIN:
-- VD1: Mã đơn hàng, tên công ty khách hàng:
select o.OrderID, c.ContactName
from Orders o
right join Customers c
on c.CustomerID = o.CustomerID
where o.OrderDate is null
-- 2 đoạn code này sẽ giống nhau:
select o.OrderID, c.ContactName
from Customers c
left join Orders o
on c.CustomerID = o.CustomerID
where o.OrderDate is null

--4/ FULL JOIN:
-- Inner Join:
select c.CategoryID, c.CategoryName, COUNT(p.ProductID) as Quantity_of_Product
from Categories c
join Products p
on c.CategoryID = p.CategoryID
Group by c.CategoryID, c.CategoryName;
-- Left join:
select c.CategoryID, c.CategoryName, COUNT(p.ProductID) as Quantity_of_Product
from Categories c
Left join Products p
on c.CategoryID = p.CategoryID
Group by c.CategoryID, c.CategoryName;
-- Right join:
select c.CategoryID, c.CategoryName, COUNT(p.ProductID) as Quantity_of_Product
from Categories c
Right join Products p
on c.CategoryID = p.CategoryID
Group by c.CategoryID, c.CategoryName;
-- Full join:
select c.CategoryID, c.CategoryName, COUNT(p.ProductID) as Quantity_of_Product
from Categories c
Full join Products p
on c.CategoryID = p.CategoryID
Group by c.CategoryID, c.CategoryName;