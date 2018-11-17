select * from Employees
where DATEPART(MM,EmployeeDOJ)=DATEPART(mm,GETDATE()) AND DATEPART(YYYY,EmployeeDOJ)=DATEPART(YYYY,GETDATE())

insert Employees values(1011,'s','Kira','Tumkur','3-7-1996',54000,'Working','Test','9-11-2018')