USE BursaryManagement 
GO
CREATE TABLE [dbo].[InstituteApplication](
[instituteApplicationID] [int] IDENTITY(1,1) PRIMARY KEY  NOT NULL,
[InstituteName] [varchar] (120) NULL,
[Status] [varchar] DEFAULT 0.00,
)

GO



CREATE TABLE [dbo].[FundedInstitutions](
[FundedInstituteID] [int] IDENTITY(1,1) PRIMARY KEY  NOT NULL,
[InstituteName] [varchar] (120) NULL,
[AccountNumber] [int] NULL,
[Balance] [Money]
)


GO
CREATE TABLE [dbo].[StudentApplication](
    [StudentApplicationID] [int] IDENTITY(1,1) PRIMARY KEY  NOT NULL,
    [StudentName] [varchar],
    [StudentAge][int] NULL,
    [Race] [varchar],
    [Documents] [varBinary],
    [Status],
    [AmountAppliedFor] [Money] DEFAULT 0.00
)
GO

CREATE TABLE [dbo].[FundedSTUDENTS](
[FundedStudentID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
[StudentName] [varchar] (120) NULL,
[StudentNumber][int] NULL,
[YearOfStudy] [date] DEFAULT CONVERT(varchar,GETDATE(),23)
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


CREATE TABLE [dbo].[BursaryYearlyBudget](
[BudgetID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
[DateAllocated] [date] NULL,
[AmountAllocated][Money] DEFAULT 0,
[AmountAllocatedToInstitute] [Money] DEFAULT 0,
InstituteID [int] NULL,
FOREIGN KEY (InstituteID) REFERENCES Institutions(InstituteID)
)

GO