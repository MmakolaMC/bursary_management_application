ALTER PROCEDURE [dbo].[InsertDataStoredProcedure](
    @TableName varchar(max) = '',
    @ColumnNames varchar(max) = '',
    @Values varchar(max) = ''
)
AS
BEGIN
    IF @TableName = '' OR @ColumnNames = '' OR @Values = ''
    BEGIN
        PRINT 'Please provide valid parameters.'
        RETURN
    END
 
    DECLARE @SQLQuery varchar(max)
    SET @SQLQuery =  'INSERT INTO ' + @TableName + ' (' + @ColumnNames + ') VALUES (' + @Values + ')'
    EXEC (@SQLQuery)
END
 
 
EXEC dbo.InsertDataIntoTable
@TableName ='Reviewer',
@ColumnNames= 'ReviewerName,ReviewerNumber,ReviewerEmail',
@Values = '''Dr Smith'',0788927345, ''smith@examample.co.za''