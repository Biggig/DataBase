INSERT INTO TEACHERS VALUES('300000000', 'AA', 'BBB@163.COM', 5000)
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRAN
SELECT * FROM TEACHERS WHERE tid='300000000'
IF @@ROWCOUNT<>0
	BEGIN
		WAITFOR DELAY '00:00:20'
		SELECT * FROM TEACHERS WHERE tid='300000000'
	END
ROLLBACK TRANSACTION