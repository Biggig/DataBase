--��дһ�����б��������񡣸���teachers�������ݺ��������񱣴�㣬
--Ȼ���ڱ�courses�в������ݣ����courses��������ʧ�ܣ���ع������񱣴�㡣
--��ʾcourses����ʧ�ܣ���teachers����³ɹ��Ĳ���

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