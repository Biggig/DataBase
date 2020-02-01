select sname
from STUDENTS
where exists
(
select *
from CHOICES x
where x.cid = '10001' and x.sid = STUDENTS.sid
)