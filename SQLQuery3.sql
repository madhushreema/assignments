select * from tbl_Employees



alter proc sp_employeedetails(@id int,@name varchar(100) output ,@city varchar(100) output)
as
select @name=employeename ,@city=employeecity from tbl_Employees where EmployeeID=@id

declare @ename varchar(100)
declare @ecity varchar(100)
exec sp_employeedetails 100,@ename output ,@ecity output
select @ename,@ecity

-------------------------------------------------------------------------------------

----Assignment----PATHFRONTDB
-------------------------------------------------------------------------------------

select * from tbl_Customer1

create proc sp_customer(@cname varchar(100),@ccity varchar(100),@cemail varchar(100),@cphone varchar(100))
as
begin

insert tbl_Customer1 values(@cname,@ccity,@cemail,@cphone)
return @@identity
 end
 

 declare @u varchar(100)
 exec @u=sp_customer 'hghhgh','hgh','lkl@gmail.com','45455'
 select @u


 -------------------------------------------------------------------------------


 create proc sp_customer4
 as
 update tbl_Customer1 
 set 
 customerName='Ganga'

 where CustomerID='100'
 exec sp_customer4

 select * from tbl_Customer1

 ----------------------------------------------------------------------------
 ---PATHFRONT DB2
 --------------------------------------------------------------------------
 

 alter proc sp_customer3(@cid int,@cphone varchar(100),@cpass varchar(100))
 as
 update tbl_customerinfo 
 set customerPhone=@cphone
 where customerid=@cid and customerpassword=@cpass


 
 exec  sp_customer3 100,'2345658','123'
 
 select * from tbl_customerinfo



 -------------------------------------------
 create proc sp_cutomer10(@cid int)
 as
 select c.customerid,c.customername,a.accountid,a.balance
 from tbl_accountinfo a join tbl_customerinfo c
 on c.customerid=@cid

 exec sp_cutomer10 100


 select * from tbl_customerinfo


 ------------------------------------------------

 select * from tbl_accountinfo
 select * from tbl_transactioninfo



 alter trigger trg_account
 on tbl_transactioninfo
 for insert
as
begin
declare @type int
declare @amt int
declare @tp varchar(100)
select @type=accountid, @amt=ammount,@tp=transactiontype from inserted
if(@tp='withdra')
begin

update tbl_accountinfo set balance=balance-@amt where accountid=@type
end

update tbl_accountinfo set balance=balance+@amt where accountid=@type
end

 insert tbl_transactioninfo values (200,'withdra',45000,'4-5-2010')

 select * from tbl_accountinfo
 --------------------------------------------
 create view v_customer
as
select  c.customerid , c.customername,a.accountid,a.balance
from  tbl_customerinfo c join tbl_accountinfo a 
on c.customerid=a.customerid

select * from  v_customer


-----------------------------------------------






alter view v_Customer1

with encryption
as
select * from tbl_accountinfo where accountid=200
with check option

select * from v_Customer1

select * from tbl_accountinfo




























































create table tbl_Student
(
studentId int,
studentname varchar(100),
studentcity varchar(100)
)

alter trigger trg_add_student
on tbl_Student
for insert
as
begin 
select * from inserted
select 'Trigger Fired'
end


insert tbl_Student values(3,'hyt','Pune')



select * from tbl_Student






create database trigger1

use trigger1




create table tbl_Order3
(
orderID int identity(100,1) primary key,
itemID int not null foreign  key  references tbl_stock2(itemID),
itemQty int ,
itemPrice int
)



create table tbl_stock2
(
itemID int primary key,

itmqty int 
)

























insert tbl_stock2 values(5,22)

insert tbl_Order3 values(5,33,29)

create Trigger trg_update_stock2
on tbl_Order3
for insert
as
begin
declare @itemid int
declare @qty int
select @itemid=itemID , @qty=itemQty from inserted
update tbl_stock2 set itmqty=itmqty-@qty where itemID=@itemid
end

insert tbl_order3 values(4,5,200)


select * from tbl_order3

sp_help_text


select * from tbl_employees


create view v_Employee_BGL
as
select * from tbl_Employees where EmployeeCity='BGL'

select * from v_Employee_BGL

insert v_Employee_BGL values(123,'dgg','BGL',2534534)

insert v_Employee_BGL values(115,'dgg','K',2534534)



alter view v_Employee_BGL
as
select * from tbl_Employees where EmployeeCity='BGL'
with check option





-----------------------
alter view v_Employee_BGL

with encryption
as
select * from tbl_Employees where EmployeeCity='BGL'
with check option


sp_helptext v_Employee_BGL

--------------------------------

alter view v_Employee_BGL

with encryption ,schemabinding
as
select EmployeeID,EmployeeName,Employeesalary,EmployeeCity from dbo.tbl_Employees where EmployeeCity='BGL'
with check option


drop table tbl_Employees










create table t1
(
code int,
name varchar(100)
)


create table t2
(
code int,
city varchar(100)
)

insert t1 values(1,'A')

insert t2 values(2,'B')
insert t2 values(1,'k')
select * from t1

select * from t2

create view v_data
as
select t1.code ,t1.name ,t2.city from t1 join t2 on t1.code=t2.code

select * from v_data

insert v_data values(2,'dfg','Pune')

create trigger trg_view
on v_data
instead of  insert
as
begin
declare @code int
declare @name varchar(100)
declare @city varchar(100)
select @code=code ,@name =name,@city =city from inserted
insert t1 values(@code,@name)
insert t2 values(@code,@name)
end






create table tbl_employeeinfo
(
EmployeeID int identity(100,1),
EmployeeName varchar(100),
EmployeeCity varchar(100)
)

declare @c int=0;
while(@c<50000)
begin
insert tbl_employeeinfo values('Thanu','HYD')
set @c=@c1;
end

select * from tbl_employeeinfo where EmployeeID=883433



create clustered index idx
on tbl_employeeinfo(employeeid)
















select * from tbl_Employees
-------------------------------------------

begin tran tr1

insert tbl_Employees values(1007,'ABC','BGL',23000)

select * from tbl_Employees

rollback tran
commit tran





