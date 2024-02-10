USE BursaryManagement 
GO
CREATE TABLE [dbo].[Institution](
[InstitutionID] [int] IDENTITY(1,1) PRIMARY KEY  NOT NULL,
[InstituteName] [varchar] (120) ,
)


CREATE TABLE [dbo].[Race](
    [RaceID] [int] IDENTITY(1,1) PRIMARY KEY  NOT NULL
    [RaceName] [varchar] (30)
)

CREATE TABLE [dbo].[Students](
    [StudentID] [int] IDENTITY(1,1) PRIMARY KEY  NOT NULL,
    [StudentName] [varchar] (120) NULL,
    [StudentAge][int] NULL,
    [YearOfStudy] [date] DEFAULT CONVERT(varchar,GETDATE(),23),   
    [InstituteID] [int] REFERENCES Institution(InstituteID) 
    [RaceID] [int] REFERENCES Race(RaceID)
)
GO


CREATE TABLE [dbo].[Documents](
[DocumentID] [int] IDENTITY(1,1) PRIMARY KEY  NOT NULL,
[DocumentType] [varbinary] (120) NULL,
[StudentID] [int] REFERENCES Students(StudentID) 
)

GO

CREATE TABLE [dbo].[Department](
[DepartmentID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
[DepartmentName] [varchar] (120) NULL,
[InstituteID] [int] REFERENCES Institution(InstituteID) 
)

GO
CREATE TABLE [dbo].[HeadOfDepartment](
[HeadOfDepartmentID] [int] IDENTITY(1,1) PRIMARY KEY  NOT NULL,
[HeadOfDepartmentName] [varchar] (100) NULL,
[HeadOfDepartmentEmail] [varchar] (255) NULL,
[HeadOfDepartmentNumber] [int] NULL,
[DepartmentID] [int] REFERENCES Department(DepartmentID)
 )

GO
CREATE TABLE [dbo].[Reviewer](
    [ReviewerID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
    [ReviewerName] [varchar] (120) NULL,
    [ReviewerNumber] [int] NULL,
    [ReviewerEmail] [varchar] (255) NULL
)
GO

CREATE TABLE [dbo].[Budget](
[BudgetID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
[DateTime] [date] NULL,
[BudgetAmount][Money] DEFAULT 0,
[ReviewerID] [int] REFERENCES Reviewer(ReviewerID)
)

GO
CREATE TABLE [dbo].[status](
  [StatusID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL 
  [statusName] [varchar] (120) 
)

CREATE TABLE [dbo].[Application](
    [ApplicationID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
    [ApplicationAmount] [Money] DEFAULT 0.00,
    [status] [varchar](120) NULL,
    [DepartmentID] [int] REFERENCES Department(DepartmentID),
    [StudentID] [int] REFERENCES Student(StudentID)
    [StatusID] [int] REFERENCES Status(StatusID)
)
GO

CREATE TABLE [dbo].[Funds](
    [FundID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
    [AmountFunded] [Money] DEFAULT 0.00,
    [DepartmentID] [int] REFERENCES Department(DepartmentID),
    [BudgetID] [int] REFERENCES Budget(BudgetID)
)

GO

CREATE TABLE [dbo].[Programs](
[ProgramID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
[ProgramName] [varchar] (255),
[InstituteID] [int] REFERENCES Institution(InstituteID) 
)