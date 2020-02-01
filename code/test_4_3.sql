select cname
from COURSES
where cid not in
	(select cid
	from CHOICES
	)