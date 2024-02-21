CREATE PROCEDURE InsertUser
    @userId INT,
    @username VARCHAR(20),
    @password VARCHAR(20),
    @name VARCHAR(40),
    @phone NCHAR(10),
    @checked BIT,
    @progress DECIMAL(5,2)
AS
BEGIN
    INSERT INTO [user] (userId, username, password, name, phone, checked, progress)
    VALUES (@userId, @username, @password, @name, @phone, @checked, @progress);
END;

-- Call the stored procedure to insert a new user
EXEC InsertUser 4, 'new_user', 'new_password', 'New User', '12345678', 0, 0;

SELECT * FROM [user]
