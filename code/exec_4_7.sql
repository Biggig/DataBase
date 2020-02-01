select distinct COURSES.cname
from COURSES,CHOICES
where COURSES.cid = CHOICES.cid and CHOICES.tid in
(
select distinct T.tid
from TEACHERS as T,COURSES as co,CHOICES as ch
where T.tid = ch.tid and co.cname = 'UML' 
and ch.cid = co.cid
)