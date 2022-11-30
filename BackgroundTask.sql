USE [master]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BackgroundTask]
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @delay NVARCHAR(50)
    SET @delay = '00:01:00'  -- 1 min

    WHILE 1 = 1
    BEGIN
        WAITFOR DELAY @delay
        BEGIN
            EXECUTE <stored procedure>
        END
    END
END
