SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
BEGIN TRAN
SELECT * FROM TEACHERS WHERE tid='300000000'
WAITFOR DELAY '00:00:10'
SELECT * FROM TEACHERS WHERE tid='300000000'
ROLLBACK TRAN