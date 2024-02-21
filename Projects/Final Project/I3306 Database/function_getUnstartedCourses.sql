CREATE FUNCTION dbo.GetUserUnstartedCourseCount(@userId INT)
RETURNS INT
AS
BEGIN
    DECLARE @unstartedCount INT;

    SELECT @unstartedCount = COUNT(*)
    FROM unlocked
    WHERE userId = @userId AND started = 0;

    RETURN @unstartedCount;
END;


DECLARE @userId INT;
SET @userId = 2;

DECLARE @unstartedResult INT;
SET @unstartedResult = dbo.GetUserUnstartedCourseCount(@userId);

PRINT 'UserId ' + CAST(@userId AS NVARCHAR(10)) + ' has ' + CAST(@unstartedResult AS NVARCHAR(10)) + ' unstarted courses.';
