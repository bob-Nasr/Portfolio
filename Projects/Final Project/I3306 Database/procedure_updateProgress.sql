CREATE PROCEDURE UpdateUserProgress
    @userId INT
AS
BEGIN
    DECLARE @unstartedCount INT;
    DECLARE @totalCourses INT;
    DECLARE @progress DECIMAL(5, 2);

    -- Call the function to get the count of started courses
    SET @unstartedCount = dbo.GetUserCourseCount(@userId);

    -- Get the total number of courses
    SELECT @totalCourses = COUNT(*)
    FROM course;

    -- Calculate the progress 
    SET @progress = CASE
        WHEN @totalCourses > 0 THEN CONVERT(DECIMAL(5, 2), @unstartedCount) / @totalCourses * 100
        ELSE 0
    END;

    -- Update the progress in the user table
    UPDATE [user]
    SET progress = @progress
    WHERE userId = @userId;
END;

-- Call the procedure to update the progress for user with userId 1
DECLARE @userId INT;
SET @userId = 1;

EXEC UpdateUserProgress @userID;

SELECT * FROM [user] WHERE userId = @userID;
