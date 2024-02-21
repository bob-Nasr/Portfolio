CREATE TRIGGER trg_AddCourseToTakes
ON unlocked
AFTER UPDATE
AS
BEGIN
    IF UPDATE(started)
    BEGIN
        INSERT INTO takes (courseId, userId)
        SELECT i.courseId, i.userId
        FROM inserted i
        WHERE i.started = 1;
    END
END;


UPDATE unlocked
SET started = 1
WHERE userId = 1 AND courseId = 102;

SELECT * FROM unlocked
SELECT * FROM takes
 