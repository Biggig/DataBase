--编写一个带有保存点的事务。更新teachers表中数据后，设置事务保存点，
--然后在表courses中插入数据，如果courses插入数据失败，则回滚到事务保存点。
--演示courses插入失败，但teachers表更新成功的操作

SELECT * FROM TEACHERS WHERE tid='1234567890'

BEGIN TRAN UPD_TEA
	UPDATE TEACHERS 
	SET salary = 5000
	WHERE tid= '1234567890'
	SAVE TRAN TRAN_UPD_TEA_DONE
	INSERT INTO COURSES VALUES('10001', '', '')
	IF @@ERROR != 0
		BEGIN 
		ROLLBACK TRAN TRAN_UPD_TEA_DONE
		PRINT 'fail'
		RETURN
		END
COMMIT TRAN UPD_TEA

GO
SELECT * FROM TEACHERS WHERE tid='1234567890'