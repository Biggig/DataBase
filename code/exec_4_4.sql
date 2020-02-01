select *
from COURSES
where hour <= all
	(
	select c.hour
	from COURSES as c
	)