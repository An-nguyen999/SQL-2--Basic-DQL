--1/ UNION - KẾT HỢP CÁC KẾT QUẢ:
-- câu lệnh 1: (22 dòng)
select od.OrderID
from [Order Details] as od
where od.UnitPrice between 100 and 200
-- câu lệnh 2: (433 dòng)
select od.OrderID
from [Order Details] as od
where od.Quantity in (10,20)

-- câu lệnh 3- and 2 điều kiện trên: lấy 2 cái truy vấn ở trên: (7 dòng)
select od.OrderID
from [Order Details] as od
where od.UnitPrice between 100 and 200 and od.Quantity in (10,20)
-- câu lệnh 4 - or 2 điều kiện trên: lấy 2 cái truy vấn ở trên: (448 dòng)
select od.OrderID
from [Order Details] as od
where od.UnitPrice between 100 and 200 or od.Quantity in (10,20)

-- câu lệnh 5: distinct
select distinct od.OrderID
from [Order Details] as od
where od.UnitPrice between 100 and 200 or od.Quantity in (10,20)

-- Sử dụng UNION: (360 dòng)
select od.OrderID from [Order Details] as od where od.UnitPrice between 100 and 200
union
select od.OrderID from [Order Details] as od where od.Quantity in (10,20)

-- Sử dụng UNION ALL: (360 dòng)
select od.OrderID from [Order Details] as od where od.UnitPrice between 100 and 200
union
select od.OrderID from [Order Details] as od where od.Quantity in (10,20)

--2/ BÀI TẬP ĐỂ HIỂU RÕ HƠN:
-- Lấy Country từ 2 bảng Suppliers và Customers:
select distinct Country
from Suppliers
union
select distinct Country
from Customers

select distinct Country
from Suppliers
union all
select distinct Country
from Customers

-- Lấy dữ liệu từ 3 bảng:
select City, Country -- Mục tiêu: 20 dòng, lấy ra khách hàng đến từ quốc gia có chữ U nằm đầu tiêg
from Customers
where Country like 'U%'
UNION
select City, Country --> Mục tiêu: 1 dòng, lấy ra thành phố london trong quốc gia của nhà cung cấp
from Suppliers
where City = 'London'
UNION
select ShipCity, ShipCountry --> Mục tiêu: 122 dòng, lấy ra quốc gia Mỹ trong cái đơn hàng
from Orders
where ShipCountry = 'USA'

-- Kết quả: 14 hàng
