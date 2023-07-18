CREATE FUNCTION dbo.ReverseString
(
    @inputString NVARCHAR(MAX)
)
RETURNS NVARCHAR(MAX)
AS
BEGIN
    DECLARE @outputString NVARCHAR(MAX)
    SET @outputString = ''

    DECLARE @index INT
    SET @index = LEN(@inputString)

    WHILE @index > 0
    BEGIN
        SET @outputString = @outputString + SUBSTRING(@inputString, @index, 1)
        SET @index = @index - 1
    END

    RETURN @outputString
END