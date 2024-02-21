CREATE TRIGGER trg_AddCoursesForNewUser
ON [user]
AFTER INSERT
AS
BEGIN
    INSERT INTO unlocked (courseId, userId, started)
    SELECT courseId, userId, 0
    FROM inserted
    CROSS JOIN (
        VALUES 
            (101),
            (201)
    ) AS specific_courses(courseId);
END;


EXEC InsertUser 5, 'new_user2', 'new_password2', 'New User2', 87654321, 0, 0;

SELECT * FROM [user] WHERE userId = 5;
SELECT * FROM unlocked WHERE userId = 5;
