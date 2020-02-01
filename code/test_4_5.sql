select cname
from COURSES
where hour in
(
select hour
from COURSES
where cname = 'uml' or cname = 'C++'
)