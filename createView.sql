CREATE VIEW [dbo].[StudentDetailView]
AS
SELECT 
    student.StudentName,
    student.StudentID,
    student.StudentAge,
    student.YearOfStudy,
    program.ProgramName,
    department.DepartmentName
FROM 
    dbo.Student student
JOIN 
    dbo.Program program ON student.ProgramID = program.ProgramID
JOIN 
    dbo.Department department ON program.DepartmentID = department.DepartmentID;

SELECT * FROM [dbo].[StudentDetailView];