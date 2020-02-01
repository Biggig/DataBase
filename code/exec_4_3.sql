select sname
from STUDENTS
where STUDENTS.sid not in
	(
	select s.sid 
	from STUDENTS as s,CHOICES,COURSES
	where s.sid = CHOICES.sid and CHOICES.cid = COURSES.cid
	and COURSES.cname = 'java'
	)
	