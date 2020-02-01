select teachers.tid,cid,salary
from TEACHERS,choices 
where  TEACHERS.tid = CHOICES.tid and Teachers.salary >= all
	(
	select T.salary
	from TEACHERS as T
	where T.salary is not null
	)