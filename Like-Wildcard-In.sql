-- 1/ LIKE:

-- Lọc các quốc gia có bắt đầu bằng chữ A:
select *
from Customers
where Country like 'A%'
-- Lấy tên các đơn đặt hàng được gửi đến thành phố có chữ A:
select *
from Orders
where ShipCity like '%a%'
order by ShipCity asc

select *
from Customers
where Country like '_S_'

--2/ THỰC HÀNH VỚI WILDCARD:

-- Lọc ra tất cả khách hàng có tên liên hệ bắt đầu bằng chữ A:
select *
from Customers
where ContactName like 'A%'

-- Tên khách hàng có tên bắt đầu bằng chữ H nhưng có ký tự thứ 2
select *
from Customers
where ContactName like 'H_%'

-- Lọc ra thành phố bắt đầu L, chữ cái thứ 2 là u hoặc o:
select OrderID, ShipCity
from Orders
where ShipCity like 'L[u,o]%'

-- Lọc ra các thành phố: bắt đầu bằng chữ L, từ thứ hai khác U hoặc O:
select OrderID, ShipCity
from Orders
where ShipCity like 'L[^u,o]%'

-- Lọc ra csc thành phố bắt đầu từ A->C trong bảng chứ cái Alphabet:
select OrderID, ShipCity
from Orders
where ShipCity like '[A-C]%'


--3/ IN:

-- Đơn hàng được giao đến quốc gia: Germany, UK, Brazil
select ShipCountry, OrderID
from Orders
where ShipCountry in('Germany', 'UK', 'Brazil')

-- Đơn hàng KHÔNG được giao đến quốc gia: Germany, UK, Brazil
select ShipCountry, OrderID
from Orders
where ShipCountry NOT IN('Germany', 'UK', 'Brazil')
