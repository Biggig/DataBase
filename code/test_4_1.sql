use School
select *
from students
where grade = (
	select grade 
	from students
	where sid = '850955252')