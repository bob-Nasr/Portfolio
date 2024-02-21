CREATE FUNCTION dbo.GetUserCourseCount(@userId INT) 
RETURNS INT
AS
BEGIN
    DECLARE @courseCount INT;

    SELECT @courseCount = COUNT(*)
    FROM takes
    WHERE userId = @userId;

    RETURN @courseCount;
END;

DECLARE @userId INT;
SET @userId = 1;

DECLARE @result INT;
SET @result = dbo.GetUserCourseCount(@userId);

PRINT 'UserId ' + CAST(@userId AS NVARCHAR(10)) + ' takes ' + CAST(@result AS NVARCHAR(10));
