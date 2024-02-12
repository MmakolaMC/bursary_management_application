IF OBJECT_ID('Bursary_Management_Application_DB.dbo.Institution') IS NOT NULL
	BEGIN
		PRINT 'Database Table Exists'
	END;
ELSE
	BEGIN
		CREATE TABLE [dbo].[Institution](
		[InstituteID] [int] IDENTITY(1,1) PRIMARY KEY  NOT NULL,
		[InstituteName] [varchar] (120),
		[Province] [varchar](120)
)
	END


IF OBJECT_ID('Bursary_Management_Application_DB.dbo.Race') IS NOT NULL
	BEGIN
		PRINT 'Database Table Exists'
	END;
ELSE
	BEGIN
	  CREATE TABLE [dbo].[Race](
		[RaceID] [int] IDENTITY(1,1) PRIMARY KEY  NOT NULL,
		[Race] [varchar] (30)
)
END;

GO

IF OBJECT_ID('Bursary_Management_Application_DB.dbo.Department') IS NOT NULL
	BEGIN
		PRINT 'Database Table Exists'
	END;
ELSE
	BEGIN
		CREATE TABLE [dbo].[Department](
			[DepartmentID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
			[DepartmentName] [varchar] (120) NULL,
			[InstituteID] [int] REFERENCES Institution(InstituteID) 
	)
	END;
GO

IF OBJECT_ID('Bursary_Management_Application_DB.dbo.Program') IS NOT NULL
	BEGIN
		PRINT 'Database Table Exists'
	END;
ELSE
	BEGIN
		CREATE TABLE[dbo].[Program](
			[ProgramID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
			[ProgramName] [varchar] (255),
			[DepartmentID] [int] REFERENCES Department(DepartmentID) 
			)
END;
GO

IF OBJECT_ID('Bursary_Management_Application_DB.dbo.Student') IS NOT NULL
	BEGIN
		PRINT 'Database Table Exists'
	END;
ELSE
	BEGIN
		CREATE TABLE [dbo].[Student](
			[StudentID] [int] IDENTITY(1,1) PRIMARY KEY  NOT NULL,
			[StudentName] [varchar] (120) NOT NULL,
			[StudentAge][int] NOT NULL,
			[StudentAverage][int] NOT NULL,
			[YearOfStudy] [date] DEFAULT CONVERT(varchar,GETDATE(),23) NOT NULL,   
			[ProgramID] [int] REFERENCES Program(ProgramID) NOT NULL,
			[RaceID] [int] REFERENCES Race(RaceID) NOT NULL
		)
END;
GO

IF OBJECT_ID('Bursary_Management_Application_DB.dbo.Documents') IS NOT NULL
	BEGIN
		PRINT 'Database Table Exists'
	END;
ELSE
	BEGIN
		CREATE TABLE[dbo].[Documents](
			[DocumentID] [int] IDENTITY(1,1) PRIMARY KEY  NOT NULL,
			[DocumentType] [varbinary] (120) NOT NULL,
			[StudentID] [int] REFERENCES Student(StudentID) 
			)
END;

GO

IF OBJECT_ID('Bursary_Management_Application_DB.dbo.HeadOfDepartment') IS NOT NULL
	BEGIN
		PRINT 'Database Table Exists'
	END;
ELSE
	BEGIN
		CREATE TABLE [dbo].[HeadOfDepartment](
			[HeadOfDepartmentID] [int] IDENTITY(1,1) PRIMARY KEY  NOT NULL,
			[HeadOfDepartmentName] [varchar] (100) NOT NULL,
			[HeadOfDepartmentEmail] [varchar] (255) NOT NULL,
			[HeadOfDepartmentNumber] [int] NOT NULL,
			[DepartmentID] [int] REFERENCES Department(DepartmentID)
 )
 END;
GO

IF OBJECT_ID('Bursary_Management_Application_DB.dbo.Reviewer') IS NOT NULL
	BEGIN
		PRINT 'Database Table Exists'
	END;
ELSE
	BEGIN
CREATE TABLE[dbo].[Reviewer](
    [ReviewerID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
    [ReviewerName] [varchar] (120) NOT NULL,
    [ReviewerNumber] [int] NOT NULL,
    [ReviewerEmail] [varchar] (255) NOT NULL
)
END;
GO

IF OBJECT_ID('Bursary_Management_Application_DB.dbo.Budget') IS NOT NULL
	BEGIN
		PRINT 'Database Table Exists'
	END;
ELSE
	BEGIN
		CREATE TABLE[dbo].[Budget](
		[BudgetID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
		[DateTime] [date] NOT NULL,
		[BudgetAmount][Money] DEFAULT 0.00 NOT NULL,
		[ReviewerID] [int] REFERENCES Reviewer(ReviewerID) NOT NULL
		)
END;
GO

IF OBJECT_ID('Bursary_Management_Application_DB.dbo.Status') IS NOT NULL
	BEGIN
		PRINT 'Database Table Exists'
	END;
ELSE
	BEGIN
		CREATE TABLE [dbo].[Status](
			  [StatusID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL, 
			  [Status] [varchar] (20) NOT NULL 
	)
END;
GO

IF OBJECT_ID('Bursary_Management_Application_DB.dbo.Application') IS NOT NULL
	BEGIN
		PRINT 'Database Table Exists'
	END;
ELSE
	BEGIN
		CREATE TABLE[dbo].[Application](
			[ApplicationID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
			[DepartmentID] [int] REFERENCES Department(DepartmentID) NOT NULL,
			[Application_amount] [money] DEFAULT 0.00 NOT NULL,
			[StudentID] [int] REFERENCES Student(StudentID) NOT NULL,
			[StatusID] [int] REFERENCES Status(StatusID) NOT NULL
)
END;
GO

IF OBJECT_ID('Bursary_Management_Application_DB.dbo.Funds') IS NOT NULL
	BEGIN
		PRINT 'Database Table Exists'
	END;
ELSE
	BEGIN
		CREATE TABLE[dbo].[Funds](
			[FundID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
			[AmountFunded] [Money] DEFAULT 0.00,
			[DepartmentID] [int] REFERENCES Department(DepartmentID),
			[BudgetID] [int] REFERENCES Budget(BudgetID)
)
END;
GO
