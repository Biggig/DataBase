select CHOICES.sid
from CHOICES
where CHOICES.score >= all
(
select score
from CHOICES as ch,COURSES as co
where co.cname = 'ERP' and ch.cid = co.cid and ch.score is not null
)