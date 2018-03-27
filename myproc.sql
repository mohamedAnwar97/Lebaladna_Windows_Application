use LeBaladna4
go
create procedure updatestatus @id int,@req  varchar(11)
as 
begin 
update Requests set status=1 where ID=@id
update Requests set datereq=@req where ID=@id
end
go
create procedure setrequest @fteam int,@tteam int,@info int,@sedate varchar(15),@Event int
as
begin
insert into Requests values((select count(*) from Requests)+1,@fteam,@tteam,@info,null,@sedate,0,@Event)
end
go
create procedure getrequests
as 
begin
select *
from Requests
end
go
create procedure addmember @name varchar(30),@adress varchar(30),@phone varchar(11),@mail varchar(30),@teamid int,@user varchar(10),@pass varchar(10)
as
begin
insert into Members values((select count(*) from Members)+1,@name,@adress,@phone,@mail,@teamid,@user,@pass)
end
go
create procedure deletemember @id int
as 
begin
delete from Members where ID=@id
end
go
create procedure getmemberid @name varchar(30)
as 
begin
select ID from Members where MName like @name
end 
go
create procedure updatemanager @Teamid int,@manid int
as
 begin
update Teams set managerID=@manid where ID=@Teamid
end
go
create procedure deletetl @id int
as 
begin
delete from TeamLeaders where Leader_ID=@id
end
go
create procedure addtl @id int,@tid int
as 
begin
insert into TeamLeaders values(@id,@tid)
end
go
create procedure setevent @EName varchar(30),@descp varchar(30),@datee varchar(10),@fromd varchar(10),@rod varchar(10),@Team int
as
begin
insert into Eventss values ((select count(*) from Eventss)+1,@EName,@descp,@datee,@fromd,@rod,@Team)
end
go
create procedure deleteevent @id int
as
begin
delete from Eventss where ID=@id
end 
go
create procedure getevent @id int
as 
begin
select * 
from Eventss
where ID=@id
end 
go
create procedure updateevent @id int,@EName varchar(30),@descp varchar(30),@datee varchar(10),@fromd varchar(10),@rod varchar(10),@Team int
as
begin
update Eventss set ID=@id,EName=@EName,descp=@descp,datee=@datee,fromd=@fromd,tod=@rod,TeamResp=@Team where ID=@id
end
go
create procedure Checkuser @user varchar(10),@pass varchar(10)
as
begin
if((select count(*) from Members where username=@user and mpassword=@pass)=1)
return (select ID from Members where username=@user and mpassword=@pass)
else
return 0
end 
go
