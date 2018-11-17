create database assignment2


use assignment2

create table tbl_Restaurants
(
restID int identity(100,1) primary key,
restName varchar(100) not null,
restaddress  varchar(100) not null,
restCity varchar(100) not null,
contactno int
)



create table tbl_RMenuItems1
(
menuID int identity(200,1) primary key,
restID int not null foreign key references tbl_Restaurants(restID),
menuName varchar(100),
menuType varchar(100),
menu_category varchar(100),
menuPrice int ,
menuDesc varchar(100)
)


create table tbl_Customers
(
customerID varchar(100) primary key,
customerName varchar(100),
customerCity varchar(100),
customerDOB dateTime,
customerGender varchar(100),
customerPassword varchar(100)
)


create table tbl_Orders
(
orderID int identity(300,1) primary key,
customerID varchar(100) not null foreign key references tbl_Customers(customerID),
order_date dateTime,
orderStatus varchar(100)
) 


create table tbl_OrderMenus
(
orderID int not null foreign key references tbl_Orders(orderID),
menuID int not null foreign key references tbl_RMenuItems1(menuID),
menuQty int check(menuQty>0),
menuPrice int check(menuPrice>0),
primary key(orderID,menuID)

)




insert tbl_Restaurants values('Geetha','Karnataka','Banglore','575655')


insert tbl_Restaurants values('GTM','Karnataka','5th','57541655')


insert tbl_Restaurants values('LIK','Andra','7th','57525655')

select * from tbl_Restaurants

insert tbl_RMenuItems1 values(100,'hu','REg','VEG',12000,'Spicy')


insert tbl_RMenuItems1 values(101,'ty','Special','NonVEG',22000,'Spicy')


insert tbl_RMenuItems1 values(102,'LOI','Special','NonVEG',22900,'NonSpicy')


select * from tbl_RMenuItems1


insert tbl_Customers values('M@gmail.com','Madhavi','Tumkur','4-8-2018','Female','mtum')

insert tbl_Customers values('J@gmail.com','John','Hasan','2-11-2018','male','jhas')

insert tbl_Customers values('H@gmail.com','Hasini','Kodagu','11-11-2018','female','hkod')

select * from tbl_Customers

insert tbl_Orders values('M@gmail.com','12-12-2017','NI')


insert tbl_Orders values('J@gmail.com','1-9-2018','I')



insert tbl_Orders values('H@gmail.com','1-9-2018','NI')


select * from tbl_OrderMenus

insert tbl_OrderMenus values(300,200,5,30)

insert tbl_OrderMenus values(301,201,10,300)


insert tbl_OrderMenus values(303,202,8,560)




select restName from tbl_Restaurants
where restCity='Banglore'


select r.restID,r.restName,m.menuId,m.menuName,m.menuPrice 
from tbl_Restaurants r   join tbl_RMenuItems1 m
on r.restID=m.restID


select r.restID,r.restName,m.menuId,m.menuName,m.menuPrice 
from tbl_Restaurants r   join tbl_RMenuItems1 m
on r.restID=m.restID
where r.restCity='Banglore'


select * from tbl_Orders
where customerID='M@gmail.com'


select o.orderID,c.customerid,o.order_date,m.menuID,m.menuQty,m.menuPrice
from tbl_Orders o join tbl_Customers c
on c.customerid=o.customerid join tbl_OrderMenus m
on
o.orderid=m.orderid


select top 5 * from tbl_Orders

where customerID='M@gmail.com'

order by customerID desc


select menuPrice from tbl_OrderMenus

order by menuPrice asc


select restCity, count(*) from tbl_Restaurants  
group by restCity


select customerName from tbl_Customers where  customerid  not in(
select customerid from tbl_Orders) 


select top 1 * from tbl_RMenuItems1
  order by menuPrice desc

  
  select top 1 * from tbl_RMenuItems1 where menuID in

  
  (select top 2 with ties menuID from tbl_RMenuItems1 order by menuPrice desc)
order by menuPrice asc


