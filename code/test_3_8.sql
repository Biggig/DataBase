SELECT CHOICES.sid,COUNT(CHOICES.SID) AS NUM_COURSE,AVG(CHOICES.score) AS AVG_SCORE
FROM CHOICES
GROUP BY CHOICES.SID