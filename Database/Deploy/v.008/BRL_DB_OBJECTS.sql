/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
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
ALTER TABLE dbo.Student SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Enrollment SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.EnrollmentStudent
	(
	EnrollmentStudentID uniqueidentifier NOT NULL,
	EnrollmentID uniqueidentifier NOT NULL,
	StudentID uniqueidentifier NOT NULL,
	PaymentNumber varchar(80) NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.EnrollmentStudent ADD CONSTRAINT
	PK_EnrollmentStudent PRIMARY KEY CLUSTERED 
	(
	EnrollmentStudentID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.EnrollmentStudent ADD CONSTRAINT
	FK_EnrollmentStudent_Enrollment FOREIGN KEY
	(
	EnrollmentID
	) REFERENCES dbo.Enrollment
	(
	EnrollmentID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.EnrollmentStudent ADD CONSTRAINT
	FK_EnrollmentStudent_Student FOREIGN KEY
	(
	StudentID
	) REFERENCES dbo.Student
	(
	StudentID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.EnrollmentStudent SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.EnrollmentGroups SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.EnrollmentStudentCourse
	(
	EnrollmentStudentCourseID uniqueidentifier NOT NULL,
	StudentID uniqueidentifier NOT NULL,
	EnrollmentGroupID uniqueidentifier NOT NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.EnrollmentStudentCourse ADD CONSTRAINT
	PK_EnrollmentStudentCourse PRIMARY KEY CLUSTERED 
	(
	EnrollmentStudentCourseID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.EnrollmentStudentCourse ADD CONSTRAINT
	FK_EnrollmentStudentCourse_Student FOREIGN KEY
	(
	StudentID
	) REFERENCES dbo.Student
	(
	StudentID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.EnrollmentStudentCourse ADD CONSTRAINT
	FK_EnrollmentStudentCourse_EnrollmentGroups FOREIGN KEY
	(
	EnrollmentGroupID
	) REFERENCES dbo.EnrollmentGroups
	(
	EnrollmentGroupID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.EnrollmentStudentCourse SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
