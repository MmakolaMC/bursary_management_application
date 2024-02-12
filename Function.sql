CREATE FUNCTION GetDocuments
(
    @StudentID INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT * FROM Documents WHERE StudentID = @StudentID
);
 
SELECT * FROM GetDocuments(1);