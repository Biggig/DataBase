--��дһ����������Ĵ洢���̣����ڸ���courses��Ŀ�ʱ��
--������¼�¼��cid�����ڣ���������γ���Ϣ�����ڡ�����������������޸Ŀ�ʱʧ�ܡ���
--���ִ�гɹ������������ʱ�޸ĳɹ��������øô洢���̣���ʾ���³ɹ������ʧ�ܵĲ�����


CREATE PROCEDURE UPDATE_COURSE_HOUR
	@COURSEID CHAR(10),
	@COURSENAME VARCHAR(30),
	@HOUR INT,
	@RETURNSTRING VARCHAR(100) OUT
AS 
BEGIN TRAN
	IF NOT EXISTS(SELECT CID FROM COURSES WHERE cid= @COURSEID)
		BEGIN
			SELECT @RETURNSTRING='�γ���Ϣ������'
			goto ONERROR
		END
	UPDATE COURSES SET hour = @HOUR WHERE cid = @COURSEID
	IF @@ERROR != 0
		BEGIN 
			SELECT @RETURNSTRING = '�޸Ŀ�ʱʧ��'
			goto onerror
		end
	SELECT @RETURNSTRING = '��ʱ�޸ĳɹ�'
	PRINT @RETURNSTRING
	COMMIT TRAN
ONERROR:
	PRINT @RETURNSTRING
	ROLLBACK TRAN


		