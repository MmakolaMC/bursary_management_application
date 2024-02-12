CREATE FUNCTION [dbo].udfStudentsWithStatus(@StatusID int)
RETURNS TABLE
AS
RETURN
    SELECT s.StudentName, a.ApplicationID, a.StatusID
    FROM Student s
    INNER JOIN Application a ON s.StudentID = a.StudentID
    WHERE a.StatusID = @StatusID;
 
SELECT * FROM udfStudentsWithStatus(1)