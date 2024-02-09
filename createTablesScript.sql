USE BursaryManagement 
GO
CREATE TABLE [dbo].[InstituteApplication](
[instituteApplicationID] [int] IDENTITY(1,1) PRIMARY KEY  NOT NULL,
[InstituteName] [varchar] (120) ,
[Status] [varchar](50),
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
    [StudentName] [varchar] NULL,
    [StudentAge][int] NULL,
    [Race] [varchar] NULL,
    [Documents] [varBinary] NULL,
    [Status] [varchar] NULL,
    [AmountAppliedFor] [Money] DEFAULT 0.00
)
GO

CREATE TABLE [dbo].[FundedStudents](
[FundedStudentID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
[StudentName] [varchar] (120) NULL,
[StudentNumber][int] NULL,
[YearOfStudy] [date] DEFAULT CONVERT(varchar,GETDATE(),23),
[StudentApplicationID] [int] REFERENCES StudentApplication(StudentApplicationID) 
)

GO
CREATE TABLE [dbo].[HeadOfDepartment](
[HeadOfDepartmentID] [int] IDENTITY(1,1) PRIMARY KEY  NOT NULL,
[HeadOfDepartmentName] [varchar] (120) NULL,
[HeadOfDepartmentEmail] [varchar] (120) NULL,
[HeadOfDepartmentNumber] [int] NULL,
[FundedInstituteID] [int] REFERENCES FundedInstitutions(FundedInstituteID) )

GO

CREATE TABLE [dbo].[BursaryYearlyBudget](
[BudgetID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
[DateAllocated] [date] NULL,
[AmountAllocated][Money] DEFAULT 0,
[AmountAllocatedToInstitute] [Money] DEFAULT 0,
[FundedInstituteID] [int] REFERENCES FundedInstitutions(FundedInstituteID) 
)

GO