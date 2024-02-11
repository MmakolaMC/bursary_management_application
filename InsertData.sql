USE BursaryManagement
GO


INSERT INTO INTO InstituteApplication (
    [InstituteName],
    [Status]

)
VALUES
("Institute A" , "Pending"),
("Institute B " , "Approved"),
('Institute c', "Pending")
GO

INSERT INTO [dbo].[FundedInstitutions] ([InstituteName], [AccountNumber], [Balance])
VALUES ('InstituteB', 987654321, 3000000.00);

GO

INSERT INTO [dbo].[StudentApplication] (StudentName, StudentAge, Race, Documents, Status, AmountAppliedFor)
VALUES 
('John Doe', 20, 'Colored', 123, 'Pending', 5000.00),
('Jane Smith', 22, 'African',123, 'Approved', 75000.00),
('Michael Brown', 19, 'Indian',123, 'Pending', 6000.00);

GO