
CREATE  PROCEDURE  search 
@lastNamePattern NVARCHAR(50)
as
BEGIN
    -- ��ѯ������ƥ���ѧ����Ϣ
    SELECT  sname,sex,sage,dno,dormno
    FROM dbo.student
    WHERE sname LIKE @lastNamePattern+ '%';
END 

EXEC  search '��';
