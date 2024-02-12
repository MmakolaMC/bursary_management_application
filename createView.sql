CREATE VIEW [dbo].[StudentDetailView]
AS
SELECT 
    s.StudentID,
    s.StudentName,
    s.StudentAge,
    s.YearOfStudy,
    p.ProgramName,
    d.DepartmentName
FROM 
    dbo.Student s
JOIN 
    dbo.Program p ON s.ProgramID = p.ProgramID
JOIN 
    dbo.Department d ON p.DepartmentID = d.DepartmentID;