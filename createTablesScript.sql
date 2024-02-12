IF OBJECT_ID('model.dbo.Institution') IS NOT NULL
	BEGIN
		PRINT 'Database Table Exists'
	END;
ELSE
	BEGIN
		CREATE TABLE [dbo].[Institution](
		[InstitutionID] [int] IDENTITY(1,1) PRIMARY KEY  NOT NULL,
		[InstituteName] [varchar] (120) ,
		[Province] [varchar] (120)
)
	END


IF OBJECT_ID('model.dbo.Race') IS NOT NULL
	BEGIN
		PRINT 'Database Table Exists'
	END;
ELSE
	BEGIN
	  CREATE TABLE [dbo].[Race](
		[RaceID] [int] IDENTITY(1,1) PRIMARY KEY  NOT NULL,
		[Race] [varchar] (10)
)
END;

GO

IF OBJECT_ID('model.dbo.Department') IS NOT NULL
	BEGIN
		PRINT 'Database Table Exists'
	END;
ELSE
	BEGIN
		CREATE TABLE [dbo].[Department](
			[DepartmentID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
			[DepartmentName] [varchar] (120) NULL,
			[InstitutionID] [int] REFERENCES Institution(InstitutionID) 
	)
	END;
GO

IF OBJECT_ID('model.dbo.Program') IS NOT NULL
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

IF OBJECT_ID('model.dbo.Student') IS NOT NULL
	BEGIN
		PRINT 'Database Table Exists'
	END;
ELSE
	BEGIN
		CREATE TABLE [dbo].[Student](
			[StudentID] [int] IDENTITY(1,1) PRIMARY KEY  NOT NULL,
			[StudentName] [varchar] (120) NULL,
			[StudentAge][int] NULL,
			[YearOfStudy] [date] DEFAULT CONVERT(varchar,GETDATE(),23),   
			[ProgramID] [int] REFERENCES Program(ProgramID),
			[RaceID] [int] REFERENCES Race(RaceID)
		)
END;
GO

IF OBJECT_ID('model.dbo.Documents') IS NOT NULL
	BEGIN
		PRINT 'Database Table Exists'
	END;
ELSE
	BEGIN
		CREATE TABLE[dbo].[Documents](
			[DocumentID] [int] IDENTITY(1,1) PRIMARY KEY  NOT NULL,
			[Document] [varbinary] (120) NULL,
			[StudentID] [int] REFERENCES Student(StudentID) 
			)
END;

GO


IF OBJECT_ID('model.dbo.HeadOfDepartment') IS NOT NULL
	BEGIN
		PRINT 'Database Table Exists'
	END;
ELSE
	BEGIN
		CREATE TABLE [dbo].[HeadOfDepartment](
			[HeadOfDepartmentID] [int] IDENTITY(1,1) PRIMARY KEY  NOT NULL,
			[HeadOfDepartmentName] [varchar] (100) NULL,
			[HeadOfDepartmentEmail] [varchar] (255) NULL,
			[HeadOfDepartmentNumber] [int] NULL,
			[DepartmentID] [int] REFERENCES Department(DepartmentID)
 )
 END;
GO

IF OBJECT_ID('model.dbo.Reviewer') IS NOT NULL
	BEGIN
		PRINT 'Database Table Exists'
	END;
ELSE
	BEGIN
CREATE TABLE[dbo].[Reviewer](
    [ReviewerID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
    [ReviewerName] [varchar] (120) NULL,
    [ReviewerNumber] [int] NULL,
    [ReviewerEmail] [varchar] (255) NULL
)
END;
GO

IF OBJECT_ID('model.dbo.Budget') IS NOT NULL
	BEGIN
		PRINT 'Database Table Exists'
	END;
ELSE
	BEGIN
		CREATE TABLE[dbo].[Budget](
		[BudgetID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
		[DateTime] [date] NULL,
		[BudgetAmount][Money] DEFAULT 0,
		[ReviewerID] [int] REFERENCES Reviewer(ReviewerID)
		)
END;
GO

IF OBJECT_ID('model.dbo.Status') IS NOT NULL
	BEGIN
		PRINT 'Database Table Exists'
	END;
ELSE
	BEGIN
		CREATE TABLE [dbo].[Status](
			  [StatusID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL, 
			  [status] [varchar] (120) 
	)
END;
GO

IF OBJECT_ID('model.dbo.Application') IS NOT NULL
	BEGIN
		PRINT 'Database Table Exists'
	END;
ELSE
	BEGIN
		CREATE TABLE[dbo].[Application](
			[ApplicationID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
			[status] [varchar](120) NULL,
			[DepartmentID] [int] REFERENCES Department(DepartmentID),
			[StudentID] [int] REFERENCES Student(StudentID),
			[StatusID] [int] REFERENCES Status(StatusID)
)
END;
GO

IF OBJECT_ID('model.dbo.Funds') IS NOT NULL
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