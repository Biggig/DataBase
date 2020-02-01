select *
from STUDENTS
where sid in
	(select sid
	from CHOICES)