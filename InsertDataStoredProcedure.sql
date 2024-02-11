CREATE PROCEDURE [dbo].[InsertDataIntoTable](
    @TableName nvarchar(max) = '',
    @ColumnNames nvarchar(max) = '',
    @Values nvarchar(max) = ''
)
AS
BEGIN
    IF @TableName = '' OR @ColumnNames = '' OR @Values = ''
    BEGIN
        PRINT 'Please provide valid parameters.'
        RETURN
    END

    DECLARE @SQLQuery nvarchar(max)
    SET @SQLQuery =  'INSERT INTO ' + QUOTENAME(@TableName) + ' (' + @ColumnNames + ') VALUES (' + @Values + ')'
    EXEC (@SQLQuery)
END