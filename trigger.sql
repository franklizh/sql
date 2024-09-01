use student2
go
 CREATE TRIGGER trg_CheckStudentAge
ON dbo.student
AFTER INSERT, UPDATE
AS
BEGIN
    -- ��������������Ϣ
    SET NOCOUNT ON;

    -- ����²������µ�ֵ�Ƿ��ڷ�Χ��
    IF EXISTS (
        SELECT * FROM inserted
        WHERE sage< 18 OR sage > 28
    )
    BEGIN
        -- ������ڷ�Χ�ڣ��׳����󲢻ع�����
        RAISERROR ('Age must be between 18 and 28.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
INSERT INTO dbo.student(sno, sname, sage) VALUES (2, 'Bob', 20);
INSERT INTO dbo.student(sno, sname, sage) VALUES (3, 'Frankie', 40);