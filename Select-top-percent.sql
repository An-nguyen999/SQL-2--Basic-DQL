select top 5*
from Customers

-- lấy ra 30% nhân viên của công ty hiện tại
select top 30 percent * -- * là lấy hết các cột
from Employees

select top 30 percent FirstName, LastName, Title -- * là lấy hết các cột
from Employees

-- lấy giá trị khác nhau và chỉ 5 dòng đầu tiên
select distinct top 5 CustomerID
from Orders