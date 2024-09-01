use student2
go
 CREATE TRIGGER trg_CheckStudentAge
ON dbo.student
AFTER INSERT, UPDATE
AS
BEGIN
    -- 禁用行数计数消息
    SET NOCOUNT ON;

    -- 检查新插入或更新的值是否在范围内
    IF EXISTS (
        SELECT * FROM inserted
        WHERE sage< 18 OR sage > 28
    )
    BEGIN
        -- 如果不在范围内，抛出错误并回滚事务
        RAISERROR ('Age must be between 18 and 28.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
INSERT INTO dbo.student(sno, sname, sage) VALUES (2, 'Bob', 20);
INSERT INTO dbo.student(sno, sname, sage) VALUES (3, 'Frankie', 40);