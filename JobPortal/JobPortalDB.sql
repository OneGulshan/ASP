﻿USE [JobPortalDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Admin]    Script Date: 5/3/2023 2:23:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_Admin]
@mode int=0,
@aid int=0,
@email varchar(20)=null,
@password varchar(20)=null,
@newpwd varchar(20)=null
as
begin
if(@mode=1)
begin
update tbl_Admin set password=@newpwd where aid=@aid and password=@password
end
if(@mode=2)
begin
select * from tbl_Admin where email=@email and password=@password
end
end

GO
/****** Object:  StoredProcedure [dbo].[sp_Employee]    Script Date: 5/3/2023 2:23:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_Employee]
@mode int=0,
@id int=0,
@jpid int=0,
@cntid int=0,
@sttid int=0,
@name varchar(50)=null,
@gender varchar(50)=null,
@age int=0,
@mobno bigint=0,
@email varchar(50)=null,
@password varchar(50)=null,
@newpwd varchar(50)=null,
@jobprofile varchar(50)=null,
@country varchar(50)=null,
@state varchar(50)=null,
@city varchar(50)=null,
@photo varchar(50)=null,
@skills varchar(50)=null,
@comment varchar(50)=null,
@search varchar(50)=null
as
begin
if(@mode=1)
begin
insert into tbl_Employee(name,gender,age,mobno,email,password,jobprofile,country,state,city,photo,skills,comment)values(@name,@gender,@age,@mobno,@email,@password,@jobprofile,@country,@state,@city,@photo,@skills,@comment)
end
if(@mode=2)
begin
select * from tbl_Employee join tbl_JobProfile on tbl_Employee.jobprofile=tbl_JobProfile.jpid join tbl_Country on tbl_Employee.country=tbl_Country.cntid join tbl_State on tbl_Employee.state=tbl_State.sttid join tbl_City on tbl_Employee.city=tbl_City.ctyid
end
else if(@mode=3)
begin
delete from tbl_Employee where id=@id
end
if(@mode=4)
begin
select * from tbl_Employee where id=@id
end
else if(@mode=5)
begin
update tbl_Employee set name=@name,gender=@gender,age=@age,mobno=@mobno,email=@email,password=@password,jobprofile=@jobprofile,country=@country,state=@state,comment=@comment where id=@id
end
if(@mode=6)
begin
select * from tbl_JobProfile
end
if(@mode=7)
begin
select * from tbl_Country
end
if(@mode=8)
begin
select * from tbl_State where cntid=@cntid
end
if(@mode=9)
begin
select * from tbl_City where sttid=@sttid
end
if(@mode=10)
begin
select * from tbl_Skills where jpid=@jpid
end
if(@mode=11)
begin
select * from tbl_Employee join tbl_JobProfile
on tbl_Employee.jobprofile=tbl_JobProfile.jpid join tbl_Country
on tbl_Employee.country=tbl_Country.cntid join tbl_State
on tbl_Employee.state=tbl_State.sttid join tbl_City
on tbl_Employee.city=tbl_City.ctyid 
where name like '%'+@search+'%' or gender like '%'+@search+'%' or age like '%'+@search+'%'  -- search var liya hai search text box search ki value se sql table ke columns ki values ko match karane ke liye taaki search karne par records show ho jaein
or mobno like '%'+@search+'%' or email like '%'+@search+'%' or jpname like '%'+@search+'%'  -- har taraf se record search ho jae iske liya dono side %(means like) laga liya.
or sttname like '%'+@search+'%' or cntname like '%'+@search+'%' or ctyname like '%'+@search+'%' 
or photo like '%'+@search+'%' or skills like '%'+@search+'%' or password like '%'+@search+'%' 
or comment like '%'+@search+'%'
end
if(@mode=12)
begin
select * from tbl_Employee where email=@email and password=@password and status=1
end
if(@mode=13)
begin
update tbl_Employee set password=@newpwd where id=@id and password=@password
end
if(@mode=14)
begin
update tbl_Employee set status=1 where id=@id
end
end

GO
/****** Object:  StoredProcedure [dbo].[sp_JobPost]    Script Date: 5/3/2023 2:23:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_JobPost]
@mode int=0,
@rid int=0,
@jobprofile int=0,
@minexp int=0,
@maxexp int=0,
@minsal int=0,
@maxsal int=0,
@noofvac int=0,
@notper int=0,
@comment varchar(1000)=null,
@search varchar(50)=null
as
begin
if(@mode=1)
begin
insert into tbl_JobPost(jobprofile,minexp,maxexp,minsal,maxsal,noofvac,notper,comment,inserted_date,companyid)
values(@jobprofile,@minexp,@maxexp,@minsal,@maxsal,@noofvac,@notper,@comment,GETDATE(),@rid) -- date ka parameter nahi banta date sidhe Getdate func se insert karate hai.
end
if(@mode=2)
begin
select * from tbl_JobPost join tbl_JobProfile on tbl_JobPost.jobprofile=tbl_JobProfile.jpid
join tbl_Recruiter on tbl_JobPost.companyid=tbl_Recruiter.rid
end
if(@mode=3)
begin
select * from tbl_JobPost join tbl_JobProfile on tbl_JobPost.jobprofile=tbl_JobProfile.jpid
join tbl_Recruiter on tbl_JobPost.companyid=tbl_Recruiter.rid where status=1
end
if(@mode=4)
begin
update tbl_JobPost set status=1 where rid=@rid
end
if(@mode=5)
begin
select * from tbl_JobPost join tbl_JobProfile on tbl_JobPost.jobprofile=tbl_JobProfile.jpid
join tbl_Recruiter on tbl_JobPost.companyid=tbl_Recruiter.rid where tbl_JobPost.companyid=@rid
end
if(@mode=6)
begin
delete from tbl_JobPost where rid=@rid
end
if(@mode=7)
begin
select * from tbl_JobPost where rid=@rid
end
if(@mode=8)
begin
update tbl_JobPost set jobprofile=@jobprofile,minexp=@minexp,maxexp=@maxexp,minsal=@minsal
,maxsal=@maxsal,noofvac=@noofvac,notper=@notper,comment=@comment,inserted_date=GETDATE() 
where rid=@rid
end
if(@mode=9)
begin
select * from tbl_JobPost join tbl_JobProfile on tbl_JobPost.jobprofile=tbl_JobProfile.jpid
join tbl_Recruiter on tbl_JobPost.companyid=tbl_Recruiter.rid where jobprofile like '%'+@search+'%'
or minexp like '%'+@search+'%' or maxexp like '%'+@search+'%' or minsal like '%'+@search+'%'
or maxsal like '%'+@search+'%' or noofvac like '%'+@search+'%' or notper like '%'+@search+'%'
or jpname like '%'+@search+'%' or inserted_date like '%'+@search+'%' or name like '%'+@search+'%'
or email like '%'+@search+'%' or password like '%'+@search+'%'
end
end

GO
/****** Object:  StoredProcedure [dbo].[sp_Recruiter]    Script Date: 5/3/2023 2:23:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_Recruiter]
@mode int=0,
@rid int=0,
@name varchar(50)=null,
@category int=0,
@email varchar(50)=null,
@password varchar(50)=null,
@newpwd varchar(50)=null,
@comment varchar(1000)=null,
@search varchar(50)=null
as
begin
if(@mode=1)
begin
insert into tbl_Recruiter(name,category,email,password,comment)values(@name,@category,@email,@password,@comment)
end
if(@mode=2)
begin
select * from tbl_Recruiter join tbl_Category on tbl_Recruiter.rid=tbl_Category.ctid
end
if(@mode=3)
begin
delete from tbl_Recruiter where rid=@rid
end
if(@mode=4)
begin
select * from tbl_Recruiter where rid=@rid
end
if(@mode=5)
begin
update tbl_Recruiter set name=@name,category=@category,email=@email,password=@password,comment=@comment where rid=@rid
end
if(@mode=6)
begin
select * from tbl_Category
end
if(@mode=8)
begin
select * from tbl_Recruiter where email=@email and password=@password
end
if(@mode=9)
begin
update tbl_Recruiter set password=@newpwd where rid=@rid and password=@password
end
if(@mode=10)
begin
select * from tbl_Recruiter join tbl_Category
on tbl_Recruiter.category=tbl_Category.ctid
where category like '%'+@search+'%' or name like '%'+@search+'%' or email like '%'+@search+'%'
or comment like '%'+@search+'%' or password like '%'+@search+'%' or ctid like '%'+@search+'%'
or ctname like '%'+@search+'%'
end
end

GO
/****** Object:  Table [dbo].[tbl_Admin]    Script Date: 5/3/2023 2:23:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Admin](
	[aid] [int] NULL,
	[name] [varchar](20) NULL,
	[email] [varchar](20) NULL,
	[password] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Category]    Script Date: 5/3/2023 2:23:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Category](
	[ctid] [int] IDENTITY(1,1) NOT NULL,
	[ctname] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ctid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_City]    Script Date: 5/3/2023 2:23:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_City](
	[ctyid] [int] IDENTITY(1,1) NOT NULL,
	[sttid] [int] NULL,
	[ctyname] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ctyid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Country]    Script Date: 5/3/2023 2:23:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Country](
	[cntid] [int] IDENTITY(1,1) NOT NULL,
	[cntname] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[cntid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Employee]    Script Date: 5/3/2023 2:23:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Employee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[gender] [varchar](50) NULL,
	[age] [int] NULL,
	[mobno] [bigint] NULL,
	[email] [varchar](50) NULL,
	[jobprofile] [varchar](50) NULL,
	[country] [varchar](50) NULL,
	[state] [varchar](50) NULL,
	[photo] [varchar](50) NULL,
	[skills] [varchar](100) NULL,
	[city] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[comment] [varchar](1000) NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_JobPost]    Script Date: 5/3/2023 2:23:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_JobPost](
	[rid] [int] IDENTITY(1,1) NOT NULL,
	[jobprofile] [int] NULL,
	[minexp] [int] NULL,
	[maxexp] [int] NULL,
	[minsal] [int] NULL,
	[maxsal] [int] NULL,
	[noofvac] [int] NULL,
	[notper] [int] NULL,
	[comment] [varchar](1000) NULL,
	[status] [int] NULL,
	[inserted_date] [date] NULL,
	[companyid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_JobProfile]    Script Date: 5/3/2023 2:23:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_JobProfile](
	[jpid] [int] IDENTITY(1,1) NOT NULL,
	[jpname] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[jpid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Recruiter]    Script Date: 5/3/2023 2:23:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Recruiter](
	[rid] [int] IDENTITY(1,1) NOT NULL,
	[category] [int] NULL,
	[name] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[comment] [varchar](1000) NULL,
	[password] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Skills]    Script Date: 5/3/2023 2:23:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Skills](
	[sid] [int] IDENTITY(1,1) NOT NULL,
	[jpid] [int] NULL,
	[sname] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_State]    Script Date: 5/3/2023 2:23:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_State](
	[sttid] [int] IDENTITY(1,1) NOT NULL,
	[cntid] [int] NULL,
	[sttname] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[sttid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tbl_Admin] ([aid], [name], [email], [password]) VALUES (1, N'Admin', N'Admin', N'Admin')
GO
INSERT [dbo].[tbl_Admin] ([aid], [name], [email], [password]) VALUES (1, N'Admin', N'Admin', N'Admin')
GO
INSERT [dbo].[tbl_Admin] ([aid], [name], [email], [password]) VALUES (1, N'Admin', N'Admin', N'Admin')
GO
SET IDENTITY_INSERT [dbo].[tbl_Category] ON 

GO
INSERT [dbo].[tbl_Category] ([ctid], [ctname]) VALUES (1, N'IT')
GO
INSERT [dbo].[tbl_Category] ([ctid], [ctname]) VALUES (2, N'Bank')
GO
INSERT [dbo].[tbl_Category] ([ctid], [ctname]) VALUES (3, N'Buisness')
GO
SET IDENTITY_INSERT [dbo].[tbl_Category] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_City] ON 

GO
INSERT [dbo].[tbl_City] ([ctyid], [sttid], [ctyname]) VALUES (1, 1, N'New Delhi')
GO
INSERT [dbo].[tbl_City] ([ctyid], [sttid], [ctyname]) VALUES (2, 1, N'Mehrauli')
GO
INSERT [dbo].[tbl_City] ([ctyid], [sttid], [ctyname]) VALUES (3, 1, N'Firozabad')
GO
INSERT [dbo].[tbl_City] ([ctyid], [sttid], [ctyname]) VALUES (4, 2, N'Lacknow')
GO
INSERT [dbo].[tbl_City] ([ctyid], [sttid], [ctyname]) VALUES (5, 2, N'Agra')
GO
INSERT [dbo].[tbl_City] ([ctyid], [sttid], [ctyname]) VALUES (6, 2, N'Varanasi')
GO
INSERT [dbo].[tbl_City] ([ctyid], [sttid], [ctyname]) VALUES (7, 3, N'Ludhiana')
GO
INSERT [dbo].[tbl_City] ([ctyid], [sttid], [ctyname]) VALUES (8, 3, N'Amritsar')
GO
INSERT [dbo].[tbl_City] ([ctyid], [sttid], [ctyname]) VALUES (9, 3, N'Mohali')
GO
INSERT [dbo].[tbl_City] ([ctyid], [sttid], [ctyname]) VALUES (10, 4, N'Alampur Zafarabad')
GO
INSERT [dbo].[tbl_City] ([ctyid], [sttid], [ctyname]) VALUES (11, 4, N'Bahedi')
GO
INSERT [dbo].[tbl_City] ([ctyid], [sttid], [ctyname]) VALUES (12, 4, N'Bhadpura')
GO
INSERT [dbo].[tbl_City] ([ctyid], [sttid], [ctyname]) VALUES (13, 5, N'Gomti Nagar')
GO
INSERT [dbo].[tbl_City] ([ctyid], [sttid], [ctyname]) VALUES (14, 5, N'Jankipuram')
GO
INSERT [dbo].[tbl_City] ([ctyid], [sttid], [ctyname]) VALUES (15, 5, N'Indira Nagar')
GO
INSERT [dbo].[tbl_City] ([ctyid], [sttid], [ctyname]) VALUES (16, 6, N'Shahabad')
GO
INSERT [dbo].[tbl_City] ([ctyid], [sttid], [ctyname]) VALUES (17, 6, N'Sawayajpur')
GO
INSERT [dbo].[tbl_City] ([ctyid], [sttid], [ctyname]) VALUES (18, 6, N'Bilgram')
GO
SET IDENTITY_INSERT [dbo].[tbl_City] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Country] ON 

GO
INSERT [dbo].[tbl_Country] ([cntid], [cntname]) VALUES (1, N'India')
GO
INSERT [dbo].[tbl_Country] ([cntid], [cntname]) VALUES (2, N'Shrilanka')
GO
INSERT [dbo].[tbl_Country] ([cntid], [cntname]) VALUES (3, N'USA')
GO
SET IDENTITY_INSERT [dbo].[tbl_Country] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Employee] ON 

GO
INSERT [dbo].[tbl_Employee] ([id], [name], [gender], [age], [mobno], [email], [jobprofile], [country], [state], [photo], [skills], [city], [password], [comment], [status]) VALUES (1, N'Gulshan', N'1', 28, 1234567890, N'gulshan@gmail.com', N'1', N'1', N'1', N'Rigatoni Pasta.jpg', N'ASP.NET,ADO.NET,MVC,ASP.NET CORE', N'1', N'Gulshan@123', N'Good..', 1)
GO
SET IDENTITY_INSERT [dbo].[tbl_Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_JobPost] ON 

GO
INSERT [dbo].[tbl_JobPost] ([rid], [jobprofile], [minexp], [maxexp], [minsal], [maxsal], [noofvac], [notper], [comment], [status], [inserted_date], [companyid]) VALUES (1, 1, 2, 5, 20000, 100000, 10, 15, N'Good Profile..', 0, CAST(0x52450B00 AS Date), 1)
GO
INSERT [dbo].[tbl_JobPost] ([rid], [jobprofile], [minexp], [maxexp], [minsal], [maxsal], [noofvac], [notper], [comment], [status], [inserted_date], [companyid]) VALUES (2, 2, 2, 5, 20000, 150000, 15, 30, N'Good Company..', 0, CAST(0x52450B00 AS Date), 1)
GO
INSERT [dbo].[tbl_JobPost] ([rid], [jobprofile], [minexp], [maxexp], [minsal], [maxsal], [noofvac], [notper], [comment], [status], [inserted_date], [companyid]) VALUES (3, 1, 5, 10, 50000, 200000, 5, 30, N'Good Company..', 0, CAST(0x52450B00 AS Date), 1)
GO
INSERT [dbo].[tbl_JobPost] ([rid], [jobprofile], [minexp], [maxexp], [minsal], [maxsal], [noofvac], [notper], [comment], [status], [inserted_date], [companyid]) VALUES (4, 3, 2, 5, 20000, 150000, 10, 30, N'Good Company..', 0, CAST(0x52450B00 AS Date), 1)
GO
INSERT [dbo].[tbl_JobPost] ([rid], [jobprofile], [minexp], [maxexp], [minsal], [maxsal], [noofvac], [notper], [comment], [status], [inserted_date], [companyid]) VALUES (5, 3, 5, 15, 60000, 250000, 4, 15, N'Good Company..', 0, CAST(0x52450B00 AS Date), 1)
GO
INSERT [dbo].[tbl_JobPost] ([rid], [jobprofile], [minexp], [maxexp], [minsal], [maxsal], [noofvac], [notper], [comment], [status], [inserted_date], [companyid]) VALUES (6, 2, 1, 4, 8000, 45000, 4, 30, N'Good Company..', 0, CAST(0x52450B00 AS Date), 1)
GO
INSERT [dbo].[tbl_JobPost] ([rid], [jobprofile], [minexp], [maxexp], [minsal], [maxsal], [noofvac], [notper], [comment], [status], [inserted_date], [companyid]) VALUES (7, 2, 1, 4, 8000, 45000, 4, 30, N'Good Company..', 0, CAST(0x52450B00 AS Date), 1)
GO
SET IDENTITY_INSERT [dbo].[tbl_JobPost] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_JobProfile] ON 

GO
INSERT [dbo].[tbl_JobProfile] ([jpid], [jpname]) VALUES (1, N'Dotnet')
GO
INSERT [dbo].[tbl_JobProfile] ([jpid], [jpname]) VALUES (2, N'Php')
GO
INSERT [dbo].[tbl_JobProfile] ([jpid], [jpname]) VALUES (3, N'Python')
GO
SET IDENTITY_INSERT [dbo].[tbl_JobProfile] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Recruiter] ON 

GO
INSERT [dbo].[tbl_Recruiter] ([rid], [category], [name], [email], [comment], [password]) VALUES (1, 1, N'HCL', N'HCL@gmail.com', N'Good Company..', N'Hcl@123')
GO
INSERT [dbo].[tbl_Recruiter] ([rid], [category], [name], [email], [comment], [password]) VALUES (2, 2, N'HDFC', N'Hdfc@gmail.com', N'Good Bank..', N'Hdfc@123')
GO
SET IDENTITY_INSERT [dbo].[tbl_Recruiter] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Skills] ON 

GO
INSERT [dbo].[tbl_Skills] ([sid], [jpid], [sname]) VALUES (1, 1, N'ASP.NET')
GO
INSERT [dbo].[tbl_Skills] ([sid], [jpid], [sname]) VALUES (2, 1, N'ADO.NET')
GO
INSERT [dbo].[tbl_Skills] ([sid], [jpid], [sname]) VALUES (3, 1, N'MVC')
GO
INSERT [dbo].[tbl_Skills] ([sid], [jpid], [sname]) VALUES (4, 1, N'ASP.NET CORE')
GO
INSERT [dbo].[tbl_Skills] ([sid], [jpid], [sname]) VALUES (5, 2, N'Php')
GO
INSERT [dbo].[tbl_Skills] ([sid], [jpid], [sname]) VALUES (6, 2, N'Laravel')
GO
INSERT [dbo].[tbl_Skills] ([sid], [jpid], [sname]) VALUES (7, 2, N'My Sql')
GO
INSERT [dbo].[tbl_Skills] ([sid], [jpid], [sname]) VALUES (8, 2, N'WordPress')
GO
INSERT [dbo].[tbl_Skills] ([sid], [jpid], [sname]) VALUES (9, 3, N'Python')
GO
INSERT [dbo].[tbl_Skills] ([sid], [jpid], [sname]) VALUES (10, 3, N'Machine Learning')
GO
INSERT [dbo].[tbl_Skills] ([sid], [jpid], [sname]) VALUES (11, 3, N'Deep Learning')
GO
INSERT [dbo].[tbl_Skills] ([sid], [jpid], [sname]) VALUES (12, 3, N'Deep Learning')
GO
SET IDENTITY_INSERT [dbo].[tbl_Skills] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_State] ON 

GO
INSERT [dbo].[tbl_State] ([sttid], [cntid], [sttname]) VALUES (1, 1, N'Delhi')
GO
INSERT [dbo].[tbl_State] ([sttid], [cntid], [sttname]) VALUES (2, 1, N'Uttar Pradeh')
GO
INSERT [dbo].[tbl_State] ([sttid], [cntid], [sttname]) VALUES (3, 1, N'Punjab')
GO
INSERT [dbo].[tbl_State] ([sttid], [cntid], [sttname]) VALUES (4, 2, N'Colombo')
GO
INSERT [dbo].[tbl_State] ([sttid], [cntid], [sttname]) VALUES (5, 2, N'Gampaha')
GO
INSERT [dbo].[tbl_State] ([sttid], [cntid], [sttname]) VALUES (6, 2, N'Kalutara')
GO
INSERT [dbo].[tbl_State] ([sttid], [cntid], [sttname]) VALUES (7, 3, N'California')
GO
INSERT [dbo].[tbl_State] ([sttid], [cntid], [sttname]) VALUES (8, 3, N'Texas')
GO
INSERT [dbo].[tbl_State] ([sttid], [cntid], [sttname]) VALUES (9, 3, N'Florida')
GO
SET IDENTITY_INSERT [dbo].[tbl_State] OFF
GO
ALTER TABLE [dbo].[tbl_Employee] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[tbl_JobPost] ADD  DEFAULT ((0)) FOR [status]
GO
