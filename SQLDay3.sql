create database pathfrontdb2

use PathfrontDB

create table tbl_Customer1
(
CustomerID int identity(1000,1) primary key,
customerName varchar(100) not null,

CustomerCity varchar(100) not null ,
CustomerEmail varchar(100) not null unique ,
CustomerMobileNo varchar(15) not null unique
)


create table tbl_items1
(
ItemID int identity(1,1) primary key,
ItemName varchar(100) not null,
ItemPrice int check(itemPrice >0)
)



Create table tbl_invoices1
(
InvoiceID int identity(10000,1)primary key,
CustomerID int not null foreign key references tbl_Customer1(CustomerID),
InvoiceCity varchar(100) not null,
InvoiceDate DateTime not null,
InvoiceAddress varchar(100)
)

create Table tbl_invoiceitems1
(
InvoiceID int not null foreign key references tbl_invoices1(InvoiceID),
ItemID int not null foreign key references tbl_items1(ItemID),
Itemqty int check(Itemqty>0),
ItemPrice int check(ItemPrice>0),
primary key (invoiceid,itemid)
)


insert tbl_Customer1 values('Ara','Tumkuru','a@gmail.com',25836974)
select * from tbl_Customer1
insert tbl_Customer1 values('Geetha','Banglore','g@gmail.com',5896245)

insert tbl_Customer1 values('Fathima','Andra','f@gmail.com',255876974)

insert tbl_Customer1 values('Lallu','Andra','l@gmail.com',99836974)

insert tbl_Customer1 values('Kala','chennai','k@gmail.com',2694584)


insert tbl_items1 values('Pen',74)

insert tbl_items1 values('HeadPhone',1000)


insert tbl_items1 values('Laptop',50000)


insert tbl_items1 values('Bag',56000)


insert tbl_items1 values('Desktop',34000)


insert tbl_items1 values(14,'Pen',74)

insert tbl_items1 values('Printer',23000)

select * from tbl_items1

insert tbl_invoices1 values(1000,'Andra','3-2-2018','Karnataka')

insert tbl_invoices1 values(1001,'Banglore',GETDATE(),'Pune')

insert tbl_invoices1 values(1002,'Pune',GETDATE(),'Banglore')


insert tbl_invoices1 values(1001,'Andra',GETDATE(),'Pune')

insert tbl_invoices1 values(1003,'Hyd',GETDATE(),'JP Nagar')


select * from tbl_invoices1

insert tbl_invoiceitems1 values(10000,1,2,64)


insert tbl_invoiceitems1 values(10001,1,3,6400)


insert tbl_invoiceitems1 values(10000,2,5,6524)


insert tbl_invoiceitems1 values(10002,5,11,0)

select * from tbl_invoiceitems1

select * from tbl_Customer1 where CustomerID in(
select CustomerID from tbl_invoices1)


select * from tbl_Customer1 where CustomerID not in(
select CustomerID from tbl_invoices1)

select * from tbl_items1 where ItemID in(
select ItemID from tbl_invoiceitems1)

select * from tbl_items1 where ItemID not in(
select ItemID from tbl_invoiceitems1)


select * from tbl_Customer1 where CustomerID in(
--select CustomerID from tbl_invoices1) InvoiceDate in(
select top 1 with ties customerid from tbl_invoices1 order by InvoiceDate desc)



create table tbl_employees1
(
EmpID int identity(1,1) primary key,
EmployeeName varchar(100) not null,
EmployeeSalary int not null,
EmployeeDpt varchar(100),
ManagerID int foreign key references tbl_employees1(EmpID)
)


insert tbl_employees1 values('Kala',67860,'IT',3)


select * from tbl_employees1

select * from tbl_employees1 e1 where e1.Employeesalary>
(select AVG(e2.EmployeeSalary) from tbl_employees1 e2
where e2.EmployeeDpt=e1.EmployeeDpt)



select top 1 * from tbl_employees1 where EmpID in(
select top 2 with ties EmpID from tbl_employees1 order by EmployeeSalary desc)
order by EmployeeSalary asc

select  * from  tbl_employees1



--select  *from  self join tbl_invoices1

select * from tbl_invoices1

select tbl_Customer1.CustomerID,tbl_Customer1.customerName,tbl_invoices1.InvoiceID,tbl_invoices1.InvoiceDate from tbl_Customer1 full outer join tbl_invoices1
on
tbl_Customer1.CustomerID=tbl_invoices1.CustomerID


select tbl_invoices1.InvoiceID,tbl_invoices1.CustomerID,tbl_invoices1.InvoiceCity,tbl_invoiceitems1.ItemID,tbl_invoiceitems1.Itemqty,tbl_items1.ItemName from 
tbl_invoices1 join tbl_invoiceitems1
 on
tbl_Invoices1.InvoiceID=tbl_InvoiceItems1.InvoiceID
join tbl_items1
on
tbl_invoiceitems1.InvoiceID=tbl_items1.ItemID

select e.EmpID,e.EmployeeName,e.EmployeeSalary,m.Managerid,m.employeename
from tbl_employees1 e left outer join tbl_employees1 m
on
 e.EmpID=m.ManagerID

