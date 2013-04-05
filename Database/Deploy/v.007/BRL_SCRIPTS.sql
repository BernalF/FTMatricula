USE matriFunDB
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EnrollmentGroups_Classroom]') AND parent_object_id = OBJECT_ID(N'[dbo].[EnrollmentGroups]'))
ALTER TABLE [dbo].[EnrollmentGroups] DROP CONSTRAINT [FK_EnrollmentGroups_Classroom]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EnrollmentGroups_EnrollmentCourse]') AND parent_object_id = OBJECT_ID(N'[dbo].[EnrollmentGroups]'))
ALTER TABLE [dbo].[EnrollmentGroups] DROP CONSTRAINT [FK_EnrollmentGroups_EnrollmentCourse]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EnrollmentGroups_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[EnrollmentGroups]'))
ALTER TABLE [dbo].[EnrollmentGroups] DROP CONSTRAINT [FK_EnrollmentGroups_Users]
GO

/**[EnrollmentGroupSchedule]**/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EnrollmentGroupSchedule_EnrollmentGroups]') AND parent_object_id = OBJECT_ID(N'[dbo].[EnrollmentGroupSchedule]'))
ALTER TABLE [dbo].[EnrollmentGroupSchedule] DROP CONSTRAINT [FK_EnrollmentGroupSchedule_EnrollmentGroups]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnrollmentGroupSchedule]') AND type in (N'U'))
DROP TABLE [dbo].[EnrollmentGroupSchedule]
GO


/****** Object:  Table [dbo].[EnrollmentGroups]    Script Date: 03/03/2013 17:42:38 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnrollmentGroups]') AND type in (N'U'))
DROP TABLE [dbo].[EnrollmentGroups]
GO

IF OBJECT_ID('dbo.Classroom', 'U') IS NOT NULL
	DROP TABLE [dbo].[Classroom]
GO

/****** Object:  Table [dbo].[Classroom]    Script Date: 12/31/2012 10:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Classroom](
	[ClassroomID] [uniqueidentifier] NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Description] [varchar](180) NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL,
 CONSTRAINT [PK_Classroom] PRIMARY KEY CLUSTERED 
(
	[ClassroomID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO


/****** Object:  Table [dbo].[EnrollmentGroups]    Script Date: 03/03/2013 17:42:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[EnrollmentGroups](
	[EnrollmentGroupID] [uniqueidentifier] NOT NULL,
	[EnrollmentCourseID] [uniqueidentifier] NOT NULL,
	[GroupName] [varchar](80) NOT NULL,
	[ProfessorID] [uniqueidentifier] NULL,
	[Quota] [int] NOT NULL,
	[ExtraQuota] [int] NULL,
	
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL,
	
 CONSTRAINT [PK_EnrollmentGroups] PRIMARY KEY CLUSTERED 
(
	[EnrollmentGroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

--------------------------


CREATE TABLE [dbo].[EnrollmentGroupSchedule](
	[EnrollmentGroupScheduleID] [uniqueidentifier] NOT NULL,
	[EnrollmentGroupID] [uniqueidentifier] NOT NULL,
	[ClassroomID] [uniqueidentifier] NOT NULL,
	[DayOfWeek] [varchar](50) NOT NULL,
	[StartTime] [varchar](50) NOT NULL,
	[EndTime] [varchar](50) NOT NULL,
	
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL,
 CONSTRAINT [PK_EnrollmentGroupSchedule] PRIMARY KEY CLUSTERED 
(
	[EnrollmentGroupScheduleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


ALTER TABLE [dbo].[EnrollmentGroups]  WITH CHECK ADD  CONSTRAINT [FK_EnrollmentGroups_Users] FOREIGN KEY([ProfessorID])
REFERENCES [dbo].[Users] ([UserId])
GO

ALTER TABLE [dbo].[EnrollmentGroups] CHECK CONSTRAINT [FK_EnrollmentGroups_Users]
GO

ALTER TABLE [dbo].[EnrollmentGroups]  WITH CHECK ADD  CONSTRAINT [FK_EnrollmentGroups_EnrollmentCourse] FOREIGN KEY([EnrollmentCourseID])
REFERENCES [dbo].[EnrollmentCourse] ([EnrollmentCourseID])
GO
ALTER TABLE [dbo].[EnrollmentGroups] CHECK CONSTRAINT [FK_EnrollmentGroups_EnrollmentCourse]
GO


ALTER TABLE [dbo].[EnrollmentGroupSchedule]  WITH CHECK ADD  CONSTRAINT [FK_EnrollmentGroupSchedule_EnrollmentGroups] FOREIGN KEY([EnrollmentGroupID])
REFERENCES [dbo].[EnrollmentGroups] ([EnrollmentGroupID])
GO

ALTER TABLE [dbo].[EnrollmentGroupSchedule] CHECK CONSTRAINT [FK_EnrollmentGroupSchedule_EnrollmentGroups]
GO

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
ALTER TABLE dbo.Classroom SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.EnrollmentGroupSchedule ADD CONSTRAINT
	FK_EnrollmentGroupSchedule_Classroom FOREIGN KEY
	(
	ClassroomID
	) REFERENCES dbo.Classroom
	(
	ClassroomID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.EnrollmentGroupSchedule SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
