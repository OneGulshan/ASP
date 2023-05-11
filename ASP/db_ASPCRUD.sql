create database db_ASPCRUD
use db_ASPCRUD

create table tbl_Emp
(
id int primary key identity,
name varchar(50),
mobno bigint,
gender int,
jp int,
skl nvarchar(50),
prof varchar(50)
)

create table tbl_JP
(
jpid int primary key identity,
jpname varchar(50)
)
insert into tbl_JP(jpname)values('.Net Developer'), ('Php Developer'), ('Python Developer'), ('React Developer')

create proc sp_JP
@jpid int=0,
@jpname varchar(50)=null
as
begin
select * from tbl_JP
end

create table tbl_Skl
(
sid int primary key identity,
jpid int,
sname varchar(150)
)
insert into tbl_Skl(jpid, sname)values(1, 'Html'), (1, 'C#'), (1, 'Sql'), (1, '.Net'), (1, '.Net Core'), (1, '.Net Core Mvc'),
(2, 'Html'), (2, 'Css'), (2, 'Php'), (2, 'Laravel'), (2, 'WordPress'), (2, 'Sql'),
(3, 'Python'), (3, 'Machine Learning and AI'), (3, 'Deep Learning'), (3, 'Data Science'), (3, 'Core Python'), (3, 'Analytical skills'),
(4, 'Html + Css'), (4, 'JavaScript Fundamentals + ES6'),  (4, 'JSX'), (4, 'Git'), (4, 'Node + npm'), (4, 'Redux')

create proc sp_Skl
@jpid int=0,
@jpname varchar(50)=null
as
begin
select * from tbl_Skl where jpid=@jpid
end

create proc sp_Emp
@mode int=0,
@id int=0,
@name varchar(50)=null,
@mobno bigint=0,
@gender int=0,
@jp int=0,
@skl nvarchar(150)=0,
@prof varchar(50)=0
as
begin
if(@mode=1)
begin
insert into tbl_Emp(name, mobno, gender, jp, skl, prof)values(@name, @mobno, @gender, @jp, @skl, @prof)
end
if(@mode=2)
begin
select * from tbl_Emp join tbl_JP on tbl_Emp.id = tbl_JP.jpid
end
if(@mode=3)
begin
delete from tbl_Emp where id=@id
end
if(@mode=4)
begin
select * from tbl_Emp where id=@id
end
if(@mode=5)
begin
update tbl_Emp set name=@name, mobno=@mobno, gender=@gender, jp=@jp, skl=@skl, prof=@prof where id=@id
end
end
