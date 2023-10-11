use MidTermProject;

create table member(
[mID] int not null primary key identity(1,1),
[account] nvarchar(50) not null unique,
[password] nvarchar(50) not null,
[level] nvarchar(10) not null,
[mName] nvarchar(10) not null,
[mPhone] nvarchar(10),
);

drop table member;

insert into member
([account],[password],[level],[mName])
values
('lptstore',1234,'owner','LPT');

create table product(
[pID] int not null primary key identity(1,1),
[pType] nvarchar(50) not null,
[pName] nvarchar(50) not null,
[pPrice] int not null,
[pPhoto] varbinary(max),
);

create table competition(
[cID] int not null primary key identity(1,1),
[cName] nvarchar(50) not null,
[cFee] int not null,
[cTime] nvarchar(50) not null,
[cReward] nvarchar(200) not null
);

drop table competition;

create table register(
[rID] int not null primary key identity(1,1),
[mID] int not null,
[cID] int not null
);

drop table register;

select * from [MidTermProject].[dbo].[register] as [r] join¡@[MidTermProject].[dbo].[competition] as [c] on¡@[r].[cID] = [c].[cID]¡@where [r].[mID] = 5;¡@