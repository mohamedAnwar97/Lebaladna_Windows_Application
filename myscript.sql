create database LeBaladna4
go
use LeBaladna4
go
create table Teams
(
ID int ,
TName varchar(20) not null,
managerID int ,
primary key(ID),
--foreign key(managerID) references Members on delete set null on update set null
)
create table Members
(
ID int,
MName varchar(30),
Adress varchar(30),
phone varchar(11),
mail varchar(30),
TeamID int,
primary key(ID),
foreign key(TeamID) references Teams
)
create table TeamLeaders
(
Leader_ID int ,
Team_ID int,
primary key(Leader_ID,Team_ID),
foreign key(Team_ID) references Teams,
foreign key(Leader_ID) references Members 
)
create table Eventss
(
ID int,
EName varchar(30),
descp varchar(30),
datee varchar(10),
fromd varchar(10),
tod varchar(10),
TeamResp int,
primary key(ID),
foreign key (TeamResp) references Teams on delete set null on update set null
)
create table Requests
(
ID int,
fromteam int,
toteam int,
info varchar(50),
datereq varchar(15),
redate varchar(15),
status int,
EventId int,
primary key(ID),
foreign key (fromteam) references Teams,
foreign key (toteam) references Teams,
foreign key (EventId) references Eventss 

)
go
use LeBaladna4
go
alter table Teams
Add foreign key(managerID) references Members;