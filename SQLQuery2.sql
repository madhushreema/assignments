declare @count int =0;

set @count=100;

select @count;


select @count=count(*) from Employees
if (@count>0)

begin
 --insert
 end 
 else
 begin
 ---update
 end
 select @count;

 declare @count int=0
 while (@count<10)
 begin
 select @count;
 set @count=@count +1;
 end

 ---Stored Procedure

 alter proc sp_employeess
 as
 select * from tbl_Employees order by Employeesalary desc

 ---Execute

 exec sp_employeess

 ----Stored Procedure using param

 create proc sp_employees_city @city varchar(100)
 as
 select * from tbl_Employees where EmployeeCity=@city

 exec sp_employees_city 'Chennai'

 select * from tbl_accounts

 -----------------------------------------------------------------------
 create proc sp_add_account(@name varchar(100),@balance int)
 as
 if(@balance>=1000)
 begin
 insert tbl_accounts values(@name,@balance)
 return @@identity
 end
 else
 begin
 return 0
 end

 declare @r int
 exec @r=sp_add_account 'LOK',2000
 select @r
 --------------------------------------------------------------------------


 create proc sp_account_balance(@AccountID int)
 as
 declare @balance int
 select @balance=AccountBalance from tbl_accounts where Accountid=@AccountID;
 return @balance

 --------------------------------------------------------------------------
 select * from tbl_accounts

 ---------------------------------------------------------------------------










 ------------------------------------------------------------
 select * from tbl_customerinfo


 create proc sp_login(@id int ,@password varchar(100))
 as
 declare @count int
 select @count=count(*) from tbl_customerinfo
 where customerid=@id and customerpassword=@password
 return @count




 declare @c int
 exec @c=sp_login 100,'123'
 select @c


 --------------------------------------------------------------















 select * from tbl_accounts