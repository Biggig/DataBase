select sname
from STUDENTS
where STUDENTS.grade = all
	(
	select grade
	from STUDENTS as s
	where s.sid = 883794999
	)
union
select sname
from STUDENTS
where STUDENTS.grade = all
	(
	select grade
	from STUDENTS as s
	where s.sid = 850955252
	)