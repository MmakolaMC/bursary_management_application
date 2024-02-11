USE Bursary_Management_Application_DB 
GO
CREATE TABLE IF NOT EXISTS [dbo].[Institution](
[InstituteID] [int] IDENTITY(1,1) PRIMARY KEY  NOT NULL,
[InstituteName] [varchar] (120) ,
)

CREATE TABLE IF NOT EXISTS [dbo].[Race](
    [RaceID] [int] IDENTITY(1,1) PRIMARY KEY  NOT NULL,
    [RaceName] [varchar] (30)
)

GO
CREATE TABLE IF NOT EXISTS [dbo].[Student](
    [StudentID] [int] IDENTITY(1,1) PRIMARY KEY  NOT NULL,
    [StudentName] [varchar] (120) NULL,
    [StudentAge][int] NULL,
    [YearOfStudy] [date] DEFAULT CONVERT(varchar,GETDATE(),23),   
    [InstituteID] [int] REFERENCES Institution(InstituteID),
    [RaceID] [int] REFERENCES Race(RaceID)
)
GO


CREATE TABLE IF NOT EXISTS [dbo].[Document](
[DocumentID] [int] IDENTITY(1,1) PRIMARY KEY  NOT NULL,
[DocumentType] [varbinary] (120) NULL,
[StudentID] [int] REFERENCES Students(StudentID) 
)

GO

CREATE TABLE IF NOT EXISTS [dbo].[Department](
[DepartmentID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
[DepartmentName] [varchar] (120) NULL,
[InstituteID] [int] REFERENCES Institution(InstituteID) 
)

GO
CREATE TABLE IF NOT EXISTS [dbo].[HeadOfDepartment](
[HeadOfDepartmentID] [int] IDENTITY(1,1) PRIMARY KEY  NOT NULL,
[HeadOfDepartmentName] [varchar] (100) NULL,
[HeadOfDepartmentEmail] [varchar] (255) NULL,
[HeadOfDepartmentNumber] [int] NULL,
[DepartmentID] [int] REFERENCES Department(DepartmentID)
 )

GO
CREATE TABLE IF NOT EXISTS[dbo].[Reviewer](
    [ReviewerID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
    [ReviewerName] [varchar] (120) NULL,
    [ReviewerNumber] [int] NULL,
    [ReviewerEmail] [varchar] (255) NULL
)
GO

CREATE TABLE IF NOT EXISTS [dbo].[Budget](
[BudgetID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
[DateTime] [date] NULL,
[BudgetAmount][Money] DEFAULT 0,
[ReviewerID] [int] REFERENCES Reviewer(ReviewerID)
)

GO
CREATE TABLE IF NOT EXISTS [dbo].[status](
  [StatusID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL, 
  [statusName] [varchar] (120) 
)

CREATE TABLE IF NOT EXISTS [dbo].[Application](
    [ApplicationID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
    [status] [varchar](120) NULL,
    [DepartmentID] [int] REFERENCES Department(DepartmentID),
    [StudentID] [int] REFERENCES Students(StudentID),
    [StatusID] [int] REFERENCES Status(StatusID)
)
GO

CREATE TABLE IF NOT EXISTS [dbo].[Funds](
    [FundID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
    [AmountFunded] [Money] DEFAULT 0.00,
    [DepartmentID] [int] REFERENCES Department(DepartmentID),
    [BudgetID] [int] REFERENCES Budget(BudgetID)
)

GO

CREATE TABLE IF NOT EXISTS [dbo].[Program](
[ProgramID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
[ProgramName] [varchar] (255),
[InstituteID] [int] REFERENCES Institution(InstituteID) 
)

GO
