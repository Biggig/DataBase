--编写一个包含事务的存储过程，用于更新courses表的课时。
--如果更新记录的cid不存在，则输出“课程信息不存在”，其他错误输出“修改课时失败”，
--如果执行成功，则输出“课时修改成功”。调用该存储过程，演示更新成功与更新失败的操作。


CREATE PROCEDURE UPDATE_COURSE_HOUR
	@COURSEID CHAR(10),
	@COURSENAME VARCHAR(30),
	@HOUR INT,
	@RETURNSTRING VARCHAR(100) OUT
AS 
BEGIN TRAN
	IF NOT EXISTS(SELECT CID FROM COURSES WHERE cid= @COURSEID)
		BEGIN
			SELECT @RETURNSTRING='课程信息不存在'
			goto ONERROR
		END
	UPDATE COURSES SET hour = @HOUR WHERE cid = @COURSEID
	IF @@ERROR != 0
		BEGIN 
			SELECT @RETURNSTRING = '修改课时失败'
			goto onerror
		end
	SELECT @RETURNSTRING = '课时修改成功'
	PRINT @RETURNSTRING
	COMMIT TRAN
ONERROR:
	PRINT @RETURNSTRING
	ROLLBACK TRAN


		