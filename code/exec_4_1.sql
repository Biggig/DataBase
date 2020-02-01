select CHOICES.sid, STUDENTS.sname
from STUDENTS,CHOICES,COURSES
where CHOICES.cid = COURSES.cid and COURSES.cname = 'C++'
	and CHOICES.sid = STUDENTS.sid and
	CHOICES.score > all
	(
	select c.score
	from CHOICES as c,STUDENTS as s
	where CHOICES.cid = c.cid and s.sname = 'ZNKOO' and s.sid = CHOICES.sid
	)