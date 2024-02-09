USE BursaryManagement 
GO

CREATE TABLE [dbo].[Institutions](
[instituteID] [int] IDENTITY(1,1) PRIMARY KEY  NOT NULL,
[InstituteName] [varchar],
[AccountNumber] [Money]
)

GO