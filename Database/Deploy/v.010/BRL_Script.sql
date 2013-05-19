USE matriFunDB
GO

ALTER TABLE dbo.School ADD
	AdminUserID uniqueidentifier NULL
GO
ALTER TABLE dbo.School ADD CONSTRAINT
	FK_School_Users FOREIGN KEY
	(
	AdminUserID
	) REFERENCES dbo.Users
	(
	UserId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.School SET (LOCK_ESCALATION = TABLE)
GO


ALTER TABLE dbo.Course ADD
	SchoolID uniqueidentifier NULL
GO

ALTER TABLE dbo.Course ADD CONSTRAINT
	FK_Course_School FOREIGN KEY
	(
	SchoolID
	) REFERENCES dbo.School
	(
	SchoolID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Course SET (LOCK_ESCALATION = TABLE)
GO


IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Scheme-Requirement_Requirement]') AND parent_object_id = OBJECT_ID(N'[dbo].[Scheme-Requirement]'))
ALTER TABLE [dbo].[Scheme-Requirement] DROP CONSTRAINT [FK_Scheme-Requirement_Requirement]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Scheme-Requirement_Scheme]') AND parent_object_id = OBJECT_ID(N'[dbo].[Scheme-Requirement]'))
ALTER TABLE [dbo].[Scheme-Requirement] DROP CONSTRAINT [FK_Scheme-Requirement_Scheme]
GO

/****** Object:  Table [dbo].[Scheme-Requirement]    Script Date: 05/18/2013 19:23:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Scheme-Requirement]') AND type in (N'U'))
DROP TABLE [dbo].[Scheme-Requirement]
GO