create database miniproject

use miniproject


create table tbl_Customer
(
 CustomerID int  identity(100,1) primary key,
 CustomerName varchar(100),
 CustomerEmail varchar(100),
 CustomerPhone varchar(100),
 CustomerGender varchar(100),
 CustomerPassword varchar(100)
 )

 select * from tbl_Customer


 create table tbl_Accounts1
 (
 AccountID int identity(200,1) primary key,
  CustomerID int not null foreign key references tbl_Customer(CustomerID),
  AccountBalance int,
  AccountType varchar(100),
  AccountOpenDate dateTime
  )
  select * from tbl_Accounts1

  create table tbl_Transactions1
  (
  TransactionID int identity(300,1) primary key,
  AccountID int not null foreign key references tbl_Accounts1(AccountID),
  Ammount int,
  TransactionType varchar(100),
  TransactionDate dateTime
  )
  select * from tbl_Transactions1
  insert tbl_Transactions1 values(201,300,"withdra")


  create proc proc_addCustomer(@name varchar(100),@email varchar(100),@phone varchar(100),@gender varchar(100),@password varchar(100))
  as
  insert tbl_Customer values(@name,@email,@phone,@gender,@password)
  return @@identity


  create proc proc_login(@id int,@password varchar(100))
  as
  declare @count int

  select @count=count(*) from tbl_Customer where CustomerID=@id and CustomerPassword=@password
  return @count 
  insert tbl_Customer values('ABC','A@gmail.com','2344','Female','123')
  select * from tbl_Customer


  create proc proc_showA(@id int)
  as
  select * from tbl_Customer
  where CustomerID=@id
  select * from tbl_Accounts

alter trigger trg_account1
 on tbl_Transactions1
 for insert
as
begin
declare @id int
declare @amt int
declare @type varchar(100)
select @id=AccountID, @amt=Ammount,@type=TransactionType from inserted

if(@type='withdra')
begin

update tbl_Accounts1 set AccountBalance=AccountBalance-@amt where AccountID=@id
end

update tbl_Accounts1 set AccountBalance=AccountBalance+@amt where AccountID=@id
end



alter proc proc_bal1(@id int)
as
declare @bal int
select  AccountBalance=@bal from tbl_Accounts1 
where AccountID=@id
return @bal


create trigger t
on tbl_Accounts1
for insert
as
begin
declare @bal int

select @bal=t.AccountBalance from tbl_Accounts1 t
where t.CustomerID=@id
return @bal















create proc proc_addAccount(@CustomerID int,@CustomerBalance int ,@type varchar(100),@date datetime)
  as
  insert tbl_Accounts1 values(@CustomerID,@CustomerBalance,@type,@date)
  return @@identity

  select * from tbl_Transactions1



  alter proc proc_addTrasaction(@AccountID int,@Ammount int ,@type varchar(100))
  as
  insert tbl_Transactions1 values(@AccountID,@Ammount,@type,GETDATE())
  return @@identity

  alter proc proc_showAccount(@id int)
  as
  select * from tbl_Accounts1
  where CustomerID=@id


  create proc proc_showTransaction(@id int)
  as
  select * from tbl_Transactions1
  where AccountID=@id










  select * from tbl_Accounts


  create database MiniProjectBook

  use MiniProjectBook

  create table tbl_Student
  (
  StudentID int identity(100,1) primary key,
  StudentName varchar(100) not null,
  StudentEmailID varchar(100) not null,
  StudentPassword varchar(100) not null,
  StudentImageAddress varchar(100) not null
  )

  create table tbl_Books
  (
  BookID int identity(200,1) primary key,
  BookName varchar(100) not null,
  AuthorName varchar(100) not null,
  BookImage varchar(100) not null
  )
  drop table  tbl_IssueBooks

  create table tbl_IssueBooks
  (
  IssueID int identity(300,1) primary key,
  BookID int not null foreign key references tbl_Books(BookID),
  
  StudentID int not null foreign key references tbl_Student(StudentID),
  IssueStatus varchar(100) not null,
  IssueDate DateTime not null,
  )
  select * from tbl_IssueBooks
  drop table tbl_IssueBooks

  create proc proc_AddStudent(@name varchar(100),@email varchar(100),@password varchar(100),@image varchar(100))
  as
  insert tbl_Student values(@name,@email,@password,@image)
  return @@identity

  create proc proc_AddBooks(@BookName varchar(100),@AuthorName varchar(100),@BookImage varchar(100))
  as
  insert tbl_Books values(@BookName,@AuthorName,@BoonImage)
  return @@identity

  create proc proc_AddIssue(@BookID int,@StudentID int,@IssueStatus varchar(100))
  as
  insert tbl_IssueBooks values(@BookID,@StudentID,@IssueStatus,GETDATE())
  return @@identity


  create proc proc_login(@id int,@password varchar(100))
  as
  declare @count int

  select @count=count(*) from tbl_Student where StudentID=@id and StudentPassword=@password
  return @count 


  
  create proc proc_searchstudent(@key varchar(100))
as
select * from tbl_Student
where StudentID like '%'+@key+'%' or StudentName like '%'+@key+'%';


create proc proc_searchBook(@key varchar(100))
as
select * from tbl_Books where BookName like '%'+@key+'%'
or AuthorName like '%'+@key+'%';

create proc proc_searchIssuebook(@key varchar(100))
as
select * from tbl_IssueBooks where BookID like '%'+@key+'%';


create proc proc_showStudent(@id int)
  as
  select * from tbl_Student
  where StudentID=@id


  create proc proc_showBook(@id int)
  as
  select * from tbl_Books
  where BookID=@id


  create proc proc_showIssue(@id int)
  as
  select * from tbl_IssueBooks
  where BookID=@id

