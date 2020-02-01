--create view cs
--as select no, sid, cid, score
--from choices
--where score>=60

--create view sct
--(sname, cname, tname)
--as select students.sname, courses.cname, teachers.tname
--from choices, students, courses, teachers
--where choices.tid = teachers.tid and choices.cid = courses.cid and choices.sid = students.sid

--create view scc
--(sname, cname, score)
--as select students.sname, courses.cname, choices.score+5
--from choices, students, courses
--where choices.cid = courses.cid and choices.sid = students.sid

--create VIEW S_G(SID, SAVG)
--AS SELECT SID, AVG(SCORE)
--FROM CHOICES
--GROUP BY SID

--CREATE VIEW S_C_S(SID, CCOUNT, SAVG)
--AS SELECT SID, COUNT(CS.CID), AVG(SCORE)
--FROM CS
--GROUP BY CS.SID

--SELECT SNAME
--FROM SCT
--WHERE CNAME = 'SOFTWARE ENGINEERING'

--INSERT
--INTO CS
--VALUES('600000000', '823069829', '10010', 59)

--SELECT * FROM CHOICES
--WHERE SID = '823069829'

--UPDATE CS
--SET SCORE=SCORE-5
--WHERE CID = '10010'

--DELETE CS
--WHERE SID = '804529880'

--DROP VIEW CS
--SELECT * FROM CS

--CREATE VIEW VIEWC
--(SID, TID, CID, SCORE, CNAME)
--AS SELECT CHOICES.SID, CHOICES.TID, CHOICES.CID, CHOICES.SCORE, COURSES.CNAME
--FROM CHOICES, COURSES
--WHERE CHOICES.CID = COURSES.CID

--CREATE VIEW VIEWS
--(SID, TID, CID, SCORE, SNAME)
--AS SELECT CHOICES.SID, CHOICES.TID, CHOICES.CID, CHOICES.SCORE, STUDENTS.SNAME
--FROM CHOICES, STUDENTS
--WHERE CHOICES.SID = STUDENTS.SID

--CREATE VIEW S1(SID, SNAME, GRADE)
--AS SELECT STUDENTS.SID, STUDENTS.SNAME, STUDENTS.GRADE
--FROM STUDENTS

--SELECT * 
--FROM VIEWS
--WHERE SNAME = 'UXJOF'

--SELECT SID, SCORE
--FROM VIEWC
--WHERE CNAME = 'uml'

--INSERT
--INTO S1
--VALUES('60000001', 'LILY', '2001')

--DROP VIEW S1

--CREATE VIEW S1(SID, SNAME, GRADE)
--AS SELECT STUDENTS.SID, STUDENTS.SNAME, STUDENTS.GRADE
--FROM STUDENTS
--WHERE GRADE > 1998
--WITH CHECK OPTION

--DELETE S1
--WHERE SID = '60000001'

--INSERT 
--INTO S1
--VALUES('60000001', 'LILY', 1997)

--DELETE S1
--WHERE S1.GRADE = '1999'

--UPDATE VIEWS
--SET SCORE = SCORE + 5
--WHERE SNAME = 'UXJOF'

DROP VIEW VIEWC
DROP VIEW VIEWS
DROP VIEW S1



