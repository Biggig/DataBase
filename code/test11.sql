/*
use	School
CREATE TABLE WORKER(
NUMBER CHAR(5),
NAME CHAR(8) CONSTRAINT U1 UNIQUE,
SEX CHAR(1),
SAGE INT CONSTRAINT U2 CHECK(SAGE<=28),
DEPARTMENT CHAR(20),
CONSTRAINT PK_WORKER PRIMARY KEY (NUMBER))

INSERT INTO WORKER
VALUES ('00001', '李勇', 'M', 14, '科技部')
select * from WORKER
*/

/*
insert into Worker
values('00002', '王勇', 'M', 38, '科技部')
select * from worker
*/

/*
alter table worker drop U2
insert into worker
values('00002', '王勇', 'M', 38, '科技部')
select * from worker
*/



/*
go
create rule rule_sex as @value in ('F', 'M')
go
exec sp_bindrule rule_sex, 'worker.[sex]'
*/
--insert into worker values('00003', '王浩', '1', '25', '研发部')

/*
exec sp_unbindrule 'worker.[sex]'
insert into worker values('00003', '王浩', '1', '25', '研发部')
*/

/*
go 
create trigger T1 on worker
for insert , update
as 
if (select sage from inserted) < 1
begin
print 'Sage must be a integer more than zero! Transaction fail'
Rollback transaction
End
*/
--insert into worker values ('00004', '李红', 'F', -10, '开发部')
--update worker set sage=-7 where number='00001' 

/*
go 
create trigger T2 on worker
for delete
as 
if (select number from deleted) = '00001'
begin
print 'He is the CEO!Delete Fail!'
end
*/

--delete from worker where number='00001'

--drop trigger T2 

/*
go 
create trigger T2 on worker
for delete
as 
if (select number from deleted) = '00001'
begin
print 'He is the CEO!Delete Fail!'
Rollback Transaction
end
*/
/*
go 
create trigger T3 on worker
for update
as 
if update(number)
begin
print 'Everynumber cannot be changed!'
Rollback Transaction
end
*/
--update worker set number='00007' where sex='F'

/*
create table scholarship
(sid char(10) references students(sid),
sname char(30),
money int,
primary key(sid)
)
*/

/*
create view studentScholarship as
select st.sid, st.sname, ss.money
from students st, scholarship ss
where st.sid = ss.sid
*/

/*
insert into STUDENTScholarship
values('1000', 'Tom', 1000)
*/

/*
create trigger tri_ins_sc on StudentScholarship
instead of insert
as
begin
	set nocount on
	if (not exists
			(select s.sid from students s, inserted i
			where s.sid=i.sid
			)
		)
	begin
		insert into students
			select sid, sname, null, null from inserted
		insert into scholarship
			select sid, sname, money from inserted
	end
	else print '数据已存在'
end
*/

--insert into StudentScholarship values('1000', 'Tom', 1000)

/*
alter table worker add
constraint U3 check(sage >=0)
*/
--insert into worker values ('00008', '李红', 'F', -10, '开发部')
--insert into worker values ('00008', '李红', 'F', 10, '开发部')
--alter table worker add 
--constraint U4 check(sage < 0)

/*
go 
create rule rule_sage as @value between 1 and 100
go
exec sp_bindrule rule_sage, 'worker.[sage]'
*/

--insert into worker values ('00010', '李红红', 'F', 101, '开发部')

/*
exec sp_unbindrule 'worker.[sage]'
insert into worker values ('00010', '李红红', 'F', 101, '开发部')
*/

/*
go
create rule rule_sage_ as @value > 50
go 
exec sp_bindrule rule_sage_, 'worker.[sage]'
*/

/*
go 
create trigger T4 on worker
for update, insert
as 
if (select sage from inserted) < (select max(sage) from worker)
begin
print 'Wrong, too small'
Rollback Transaction
end
*/

--insert into worker values ('00011', '红红', 'F', 65, '开发部')

/*
go 
create trigger T5 on worker
for update, insert
as 
begin
if (select sage from inserted) < (select worker.sage from worker, inserted where inserted.number = worker.number)
print 'Wrong, too small'
Rollback Transaction
end
*/

--update worker set sage=99 where number='00010'
--drop trigger T5

/*
go 
create trigger T6 on worker
for update
as 
begin
if (select number from deleted) = '00001'
print 'He is the CEO!Delete Fail!'
Rollback Transaction
end
*/

/*
create table stu_card(
	card_id char(14),
	stu_id char(10) references students(sid) on delete cascade,
	remained_money decimal (10,2),
	constraint PK_stu_card primary key (card_id)
	)
*/

/*
create view fuck as
select sd.stu_id
from STUDENTS st, stu_card sd
where st.sid = sd.stu_id
*/
/*
create trigger tri_st_sd on fuck
instead of insert
as 
begin
	set nocount on
	if(not exists
		(select st.sid from students st, inserted i
		where st.sid = i.stu_id
		)
	  )
	begin 
		insert into students
			select stu_id,null,null,null from inserted
		insert into stu_card
			select stu_id, stu_id, null from inserted
	end
	else print('fuke you!')
end
*/
insert into fuck values('800001216')