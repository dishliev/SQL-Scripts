CREATE PROCEDURE dbo.DeleteOldRecords
    @TableName NVARCHAR(128),
    @DateColumn NVARCHAR(128),
    @RetentionDays INT
AS
BEGIN
    DECLARE @RetentionDate DATE = DATEADD(DAY, -@RetentionDays, GETDATE());

    DECLARE @SQL NVARCHAR(MAX) = N'
        DELETE FROM ' + QUOTENAME(@TableName) +
        ' WHERE ' + QUOTENAME(@DateColumn) + ' < @RetentionDate';

    EXEC sp_executesql @SQL, N'@RetentionDate DATE', @RetentionDate;
END
