-- Add Record rESULT to Score Table
ALTER TABLE dbo.Score ADD RecordResult VARCHAR(50) NULL

-- Move  existing result on table score to new column RecordResult
UPDATE Score SET RecordResult = Result

-- Move clomuns Record Result close to Result
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Score
	DROP CONSTRAINT FK_Score_Student
GO
ALTER TABLE dbo.Student SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Score
	DROP CONSTRAINT FK_Score_EnrollmentGroup
GO
ALTER TABLE dbo.EnrollmentGroups SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Score
	DROP CONSTRAINT FK_Score_Course
GO
ALTER TABLE dbo.Course SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_Score
	(
	ScoreID uniqueidentifier NOT NULL,
	CourseID uniqueidentifier NOT NULL,
	StudentID uniqueidentifier NULL,
	Result varchar(50) NULL,
	RecordResult varchar(50) NULL,
	InsertDate datetime NULL,
	InsertUserID uniqueidentifier NULL,
	ModifyDate datetime NULL,
	ModifyUserID uniqueidentifier NULL,
	IpAddress varchar(200) NULL,
	EnrollmentGroupID uniqueidentifier NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Score SET (LOCK_ESCALATION = TABLE)
GO
IF EXISTS(SELECT * FROM dbo.Score)
	 EXEC('INSERT INTO dbo.Tmp_Score (ScoreID, CourseID, StudentID, Result, RecordResult, InsertDate, InsertUserID, ModifyDate, ModifyUserID, IpAddress, EnrollmentGroupID)
		SELECT ScoreID, CourseID, StudentID, Result, RecordResult, InsertDate, InsertUserID, ModifyDate, ModifyUserID, IpAddress, EnrollmentGroupID FROM dbo.Score WITH (HOLDLOCK TABLOCKX)')
GO
ALTER TABLE dbo.Record
	DROP CONSTRAINT FK_Record_Score
GO
DROP TABLE dbo.Score
GO
EXECUTE sp_rename N'dbo.Tmp_Score', N'Score', 'OBJECT' 
GO
ALTER TABLE dbo.Score ADD CONSTRAINT
	PK_Score PRIMARY KEY CLUSTERED 
	(
	ScoreID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Score ADD CONSTRAINT
	FK_Score_Course FOREIGN KEY
	(
	CourseID
	) REFERENCES dbo.Course
	(
	CourseID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Score ADD CONSTRAINT
	FK_Score_EnrollmentGroup FOREIGN KEY
	(
	EnrollmentGroupID
	) REFERENCES dbo.EnrollmentGroups
	(
	EnrollmentGroupID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Score ADD CONSTRAINT
	FK_Score_Student FOREIGN KEY
	(
	StudentID
	) REFERENCES dbo.Student
	(
	StudentID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Record ADD CONSTRAINT
	FK_Record_Score FOREIGN KEY
	(
	ScoreID
	) REFERENCES dbo.Score
	(
	ScoreID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Record SET (LOCK_ESCALATION = TABLE)
GO
COMMIT



