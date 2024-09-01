
CREATE  PROCEDURE  search 
@lastNamePattern NVARCHAR(50)
as
BEGIN
    -- 查询并返回匹配的学生信息
    SELECT  sname,sex,sage,dno,dormno
    FROM dbo.student
    WHERE sname LIKE @lastNamePattern+ '%';
END 

EXEC  search '李';
