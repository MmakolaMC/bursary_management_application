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