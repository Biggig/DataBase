select sid
from CHOICES
where CHOICES.cid=
(
select COURSES.cid
from COURSES
where COURSES.cname = 'C++'
)
union
select sid
from CHOICES
where CHOICES.cid = 
(
select cid
from COURSES
where COURSES.cname = 'java'
)