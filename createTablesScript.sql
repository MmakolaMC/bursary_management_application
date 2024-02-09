USE BursaryManagement 
GO

CREATE TABLE [dbo].[Institutions](
[instituteID] [int] IDENTITY(1,1) PRIMARY KEY  NOT NULL,
[InstituteName] [varchar] (120) NULL,
[AccountNumber] [int] NULL,
[AmountAllocated] [Money] DEFAULT 0,
[AccountNumberToStudent] [Money] DEFAULT 0,
)

GO

CREATE TABLE [dbo].[HeadOfDepartment](
[HeadOfDepartmentID] [int] IDENTITY(1,1) PRIMARY KEY  NOT NULL,
[HeadOfDepartmentName] [varchar] (120) NULL,
[HeadOfDepartmentEmail] [varchar] (120) NULL,
[HeadOfDepartmentNumber] [int] NULL,
InstituteID [int] NULL,
FOREIGN KEY (InstituteID) REFERENCES Institutions(InstituteID)
)

GO

CREATE TABLE [dbo].[Applications](
[ApplicantID] [int] IDENTITY(1,1) PRIMARY KEY  NOT NULL,
[ApplicantName] [varchar] (120) NULL,
[Status] [varchar] (120)NULL,
[AmountAppliedFor] [Money] DEFAULT 0
)

GO

CREATE TABLE [dbo].[STUDENTS](
[StudentID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
[StudentName] [varchar] (120) NULL,,
[StudentNumber][int] NULL,,
[StudentAge][int] NULL,,
[Race][varchar] NULL,,
[Documents] [varBinary] NULL,,
[YearOfStudy] [date] DEFAULT GETDATE(),
)

GO

CREATE TABLE [dbo].[BursaryYearlyBudget](
[BudgetID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
[DateAllocated] [date] NULL,
[AmountAllocated][Money] DEFAULT 0,
[AmountAllocatedToInstitute] [Money] DEFAULT 0,
InstituteID [int] NULL,
FOREIGN KEY (InstituteID) REFERENCES Institutions(InstituteID)
)

GO