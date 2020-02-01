select distinct sid
from CHOICES,COURSES
where CHOICES.cid = COURSES.cid
and (COURSES.cname = 'C++' or COURSES.cname = 'java')