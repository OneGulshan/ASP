create table tbl_Employee
(
id int primary key identity,
name varchar(50),
address varchar(50),
age int,
country int,
state int
)

create table tbl_Country
(
countyid int primary key identity,
countryname varchar(50)
)

create table tbl_State
(
stateid int primary key identity,
countyid int,
statename varchar(50)
)

--sp_rename 'tbl_Country.cname','countryname'