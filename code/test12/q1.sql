--��дһ��Ƕ����������޸�students��ĳ��¼���ڲ���teachers�����һ����¼����ʾ�ڲ�������ʧ�ܺ�����޸Ĳ����ع�
BEGIN TRAN UPD_STU
UPDATE STUDENTS SET GRADE = 2000 WHERE SID='800001216'
	BEGIN TRAN UPD_TEA
		INSERT INTO TEACHERS VALUES('123456780', '', '', '')
	IF @@ERROR != 0
		BEGIN
		ROLLBACK TRAN UPD_STU
		PRINT 'FAIL'
		RETURN 
		END
	COMMIT TRAN UPD_TEA
COMMIT TRAN UPD_STU
		
