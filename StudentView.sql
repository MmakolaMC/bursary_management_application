CREATE VIEW StudentInformation AS
SELECT 
    S.StudentID,
    S.StudentName,
    S.StudentAge,
    S.StudentAverage,
    S.YearOfStudy,
    P.ProgramName,
    D.DepartmentName,
    I.InstituteName,
    I.Province
FROM 
    Student S
    INNER JOIN Program P ON S.ProgramID = P.ProgramID
    INNER JOIN Department D ON P.DepartmentID = D.DepartmentID
    INNER JOIN Institution I ON D.InstituteID = I.InstituteID;
