select * from tbl_customer

create proc proc_addemployee(@name varchar(100) ,@city varchar(100),@password varchar(100))
as
insert tbl_employees values(@name,@city,@password,getdate())
return @@identity

create proc proc_employeedetails(@id int)
as
select * from tbl_employees where EmployeeID=@id



create proc proc_showempployee(@city varchar(100))
as
select * from tbl_employees where EmployeeCity=@city



create proc proc_searchemployee(@key varchar(100))
as
select * from tbl_employees
where EmployeeID like '%'+@key+'%' or EmplyeeName like '%'+@key+'%'
or Employeecity like '%'+@key+'%';


create proc proc_updateemployee(@id int,@city varchar(100),@password varchar(100))
as
update tbl_employees set EmployeeCity=@city,EmployeePassword=@password
where EmployeeID=@id
return @@identity

create proc proc_deleteemployee(@id int)
as
delete tbl_employees where EmployeeID=@id
return @@rowcount

alter proc proc_login(@id int,@password varchar(100))
as
declare @count int
select @count=count(*) from tbl_employees 
where EmployeeID=@id and EmployeePassword=@password
return @count

select * from tbl_employees


select * from tbl_student














----------------------------------------------------

create proc proc_addcustomer(@name varchar(100) ,@password varchar(100),@city varchar(100),@address varchar(100),@phone varchar(100),@email varchar(100))
as
insert tbl_customer values(@name,@password,@city,@address,@phone,@email)
return @@identity

-------------------------------------
select * from tbl_customer

create proc proc_customerdetails(@id int)
as
select * from tbl_customer where cid=@id

--------------------------------------
select * from tbl_customer
create proc proc_showcustomer(@city varchar(100))
as
select * from tbl_customer where ccity=@city

--------------------------------------
select * from tbl_customer

create proc proc_searchcustomer(@key varchar(100))
as
select * from tbl_customer
where cid like '%'+@key+'%' or cname like '%'+@key+'%'
or ccity like '%'+@key+'%';

------------------------------------------
select * from tbl_customer

create proc proc_updatescustomer(@id int,@city varchar(100),@password varchar(100))
as
update tbl_customer set ccity=@city,cpass=@password
where cid=@id
return @@identity

------------------------------------------
select * from tbl_customer


create proc proc_deletecustomer(@id int)
as
delete tbl_customer where cid=@id
return @@rowcount

------------------------------------------

select * from tbl_customer
insert tbl_customer values('ganga','123','Tumkur','Karnataka','234434','g@gmail.com')

create proc proc_login(@id int,@password varchar(100))
as
declare @count int
select @count=count(*) from tbl_customer 
where cid=@id and cpass=@password
return @count
------------------------------------------