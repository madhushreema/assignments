create table tbl_customerinfo
(
customerid int identity(100,1) primary key,
customername varchar(100),
customercity varchar(100),
customeraddress varchar(100),
customerPhone varchar(100) unique,
PAN varchar(100) unique,
customerpassword varchar(100)
)


create table tbl_accountinfo
(
accountid int identity(200,1) primary key,
customerid int not null foreign key references tbl_customerinfo(customerid),
accounttype varchar(100),
balance int ,

accountopendate dateTime,
transactionstatus varchar(100)
)


create table tbl_transactioninfo
(
transactionid int identity(300,1) primary key,
accountid int not null foreign key references tbl_accountinfo(accountid),
transactiontype varchar(100),
ammount int check (ammount>0),
transactiondate DateTime
)

insert tbl_customerinfo values('fathima','tumkur','5th','265864548','147','123')

insert tbl_customerinfo values('geetha','Karvar','8th','864548','14758','369')

insert tbl_customerinfo values('Jaanu','Sagar','9th','64548','18569','856')

insert tbl_customerinfo values('thara','yao','8th','5864548','1447','1263')

insert tbl_customerinfo values('okdt','tumkur','19th','45458','874147','152003')



select * from tbl_customerinfo


insert tbl_accountinfo values(100,'Deposite','5000','9-8-2000','Open')



insert tbl_accountinfo values(101,'Deposite','9000','9-3-2011','Blocked')



insert tbl_accountinfo values(105,'Withdrw','1000','11-11-2014','blocked')
select * from tbl_transactioninfo

update tbl_transactioninfo
set transactiontype='withdraw'
where transactionid=304

insert tbl_accountinfo values(102,'Creadit','30000','10-8-2001','closed')


insert tbl_accountinfo values(102,'Deposite','500','9-10-2000','Blocked')

select * from tbl_accountinfo



insert tbl_transactioninfo values(200,'online','50000','9-3-2010')

insert tbl_transactioninfo values(200,'Deposite','5000','6-12-2013')

insert tbl_transactioninfo values(201,'Credit','500','10-3-2011')

insert tbl_transactioninfo values(203,'online','80000','8-8-2011')

insert tbl_transactioninfo values(201,'cash','49000','11-11-2010')


select * from tbl_transactioninfo



select * from tbl_transactioninfo where transactionid in(

select top 5 with ties transactionid from tbl_transactioninfo order by transactiondate desc)

select top 5 * from tbl_transactioninfo where accountid=200

select * from tbl_accountinfo




select * from tbl_transactioninfo t ,tbl_accountinfo a where 
 accountopendate
between '5-4-1990' and GETDATE()


select * from tbl_accountinfo
where customerid=102


select c.customerid,c.customername,c.customercity,c.customeraddress,c.customerphone,a.accountid,a.balance
from tbl_customerinfo c,tbl_accountinfo a


select a.accountid,a.balance,t.transactionid,t.ammount,t.transactiontype
from tbl_accountinfo a left outer join tbl_transactioninfo t
on a.accountid=t.accountid



select c.customerid,c.customername,c.customeraddress,c.customerphone,a.accountid,a.balance,t.transactionid,t.ammount,t.transactiontype
from tbl_customerinfo c join tbl_accountinfo a
on c.customerid=a.accountid join tbl_transactioninfo t
on c.customerid=t.transactionid






select customername from tbl_customerinfo where customerid  in(
select customerid from tbl_accountinfo)


select customername from tbl_customerinfo where customerid not in(
select customerid from tbl_accountinfo)

select accountid from tbl_accountinfo where accountid in(
select accountid from tbl_transactioninfo)

select accountid from tbl_accountinfo where accountid not in(
select accountid from tbl_transactioninfo)


select * from Employees
where DATEPART(YYYY,EmployeeDOJ)=2009