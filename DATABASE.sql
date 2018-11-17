create database ASPStudentWeb

use ASPStudentWeb

create table tbl_Student
(
StudentID int identity(100,1) primary key,
StudentName varchar(100) not null,
StudentCity varchar(100) not null,

StudentImageAddress varchar(100) not null
) 

create proc proc_Addstudent1(@name varchar(100),@city varchar(100),@address varchar(100))
as
insert tbl_Student values(@name,@city,@address)
return @@identity

select * from tbl_Student

create proc proc_search(@key varchar(100))
as
select * from tbl_Student where StudentID like'%' +@key+'%'
or StudentName like'%'+@key+'%'
or StudentCity like'%'+@key+'%'



create proc proc_details(@id int)
as
select * from tbl_Student where StudentID=@id










create table tbl_books1
(
BookID int identity(100,1) primary key,
BookName varchar(100) not null,
AuthorName varchar(100)not null,
BookImage varchar(100)not null
)
drop table tbl_books



create proc proc_addBook1(@Bname varchar(100),@Aname varchar(100),@Bimage varchar(100))
as
insert tbl_books1 values(@Bname,@Aname,@Bimage)
return @@identity


select * from tbl_books1
create proc proc_search1(@key varchar(100))
as
select * from tbl_books1 where BookName  like'%' +@key+'%'
or AuthorName like'%'+@key+'%'


