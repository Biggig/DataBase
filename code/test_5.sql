use school
--insert 
--into STUDENTS
--values('200001000', 'LXL', 's4zrck@pew.net', '3024')

--update TEACHERS
--set salary = '4000'
--where tid = '200010493'

--update TEACHERS
--set salary = 2500
--where salary < 2500

--update CHOICES
--set tid = (
--select tid 
--from TEACHERS
--where TEACHERS.tname = 'rnupx')
--where tid = '200016731'

--update STUDENTS
--set grade = '2001'
--where sid = '800071780'

--delete 
--from COURSES
--where COURSES.cid not in 
--(select distinct cid
--from CHOICES)

--delete
--from STUDENTS
--where STUDENTS.grade > '1998'

--delete
--from STUDENTS
--where STUDENTS.sid not in
--(
--select distinct choices.sid
--from CHOICES)

delete 
from CHOICES
where CHOICES.score < 60