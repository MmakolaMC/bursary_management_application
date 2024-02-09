USE BursaryManagement 
GO

CREATE TABLE [dbo].[Institutions](
[instituteID] [int] IDENTITY(1,1) PRIMARY KEY  NOT NULL,
[InstituteName] [varchar] (120) DEFAULT "not Available",
[AccountNumber] [int] DEFAULT "Not Available",
[AmountAllocated] [Money] DEFAULT 0,
[AccountNumberToStudent] [Money] DEFAULT 0,
)

GO


CREATE TABLE [dbo].[HeadOfDepartment](
[HeadOfDepartmentID] [int] IDENTITY(1,1) PRIMARY KEY  NOT NULL,
[HeadOfDepartmentName] [varchar] (120) DEFAULT "Not Available",
[HeadOfDepartmentEmail] [varchar] (120) DEFAULT "Not Available",
[HeadOfDepartmentNumber] [int] DEFAULT "Not Available",
InstituteID [int] DEFAULT "Not Available",
FOREIGN KEY (InstituteID) REFERENCES Institutions(InstituteID)
)

GO

CREATE TABLE [dbo].[Applications](
[ApplicantID] [int] IDENTITY(1,1) PRIMARY KEY  NOT NULL,
[ApplicantName] [varchar] (120) DEFAULT "Not Available",
[Status] [varchar] (120)DEFAULT "Not Available",
[AmountAppliedFor] [Money] DEFAULT 0
)

GO

CREATE TABLE [dbo].[STUDENTS](
[StudentID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
[StudentName] [varchar] (120) DEFAULT "Not Available",,
[StudentNumber][int] DEFAULT "Not Available",,
[StudentAge][int] DEFAULT "Not Available",,
[Race][varchar] DEFAULT "Not Available",,
[Documents] [varBinary] DEFAULT "Not Available",,
[YearOfStudy] [date] DEFAULT "Not Available",
)

GO

CREATE TABLE [dbo].[BursaryYearlyBudget](
[BudgetID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
[DateAllocated] [date] DEFAULT "Not Available",
[AmountAllocated][Money] DEFAULT 0,
[AmountAllocatedToInstitute] [Money] DEFAULT 0,
)
