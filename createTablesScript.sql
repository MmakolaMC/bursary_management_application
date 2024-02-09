USE BursaryManagement 
GO

CREATE TABLE [dbo].[Institutions](
[instituteID] [int] IDENTITY(1,1) PRIMARY KEY  NOT NULL,
[InstituteName] [varchar] (120),
[AccountNumber] [Money] (120)
)

GO


CREATE TABLE [dbo].[HeadOfDepartment](
[HeadOfDepartmentID] [int] IDENTITY(1,1) PRIMARY KEY  NOT NULL,
[HeadOfDepartmentName] [varchar] (120),
[HeadOfDepartmentEmail] [varchar] (120),
[HeadOfDepartmentNumber] [int],
InstituteID [int],
FOREIGN KEY (InstituteID) REFERENCES Institutions(InstituteID)
)

GO