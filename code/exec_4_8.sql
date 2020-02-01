select CHOICES.sid
from CHOICES,COURSES
where CHOICES.cid = COURSES.cid and COURSES.cname = 'database'
intersect
select CHOICES.sid
from CHOICES,COURSES
where CHOICES.cid = COURSES.cid and COURSES.cname = 'UML'