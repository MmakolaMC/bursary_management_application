CREATE FUNCTION [dbo].udfStudentsWithStatus(@StatusID int)
RETURNS TABLE
AS
RETURN
    SELECT student.StudentName, application.ApplicationID, application.StatusID
    FROM Student student
    INNER JOIN Application application ON student.StudentID = application.StudentID
    WHERE application.StatusID = @StatusID;

SELECT * FROM udfStudentsWithStatus(1);