USE matriFunDB
GO

/**[EnrollmentGroupSchedule]**/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EnrollmentGroupSchedule_EnrollmentGroups]') AND parent_object_id = OBJECT_ID(N'[dbo].[EnrollmentGroupSchedule]'))
ALTER TABLE [dbo].[EnrollmentGroupSchedule] DROP CONSTRAINT [FK_EnrollmentGroupSchedule_EnrollmentGroups]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnrollmentGroupSchedule]') AND type in (N'U'))
DROP TABLE [dbo].[EnrollmentGroupSchedule]
GO

CREATE TABLE [dbo].[EnrollmentGroupSchedule](
	[EnrollmentGroupScheduleID] [uniqueidentifier] NOT NULL,
	[EnrollmentGroupID] [uniqueidentifier] NOT NULL,
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

ALTER TABLE [dbo].[EnrollmentGroupSchedule]  WITH CHECK ADD  CONSTRAINT [FK_EnrollmentGroupSchedule_EnrollmentGroups] FOREIGN KEY([EnrollmentGroupID])
REFERENCES [dbo].[EnrollmentGroups] ([EnrollmentGroupID])
GO

ALTER TABLE [dbo].[EnrollmentGroupSchedule] CHECK CONSTRAINT [FK_EnrollmentGroupSchedule_EnrollmentGroups]
GO

/**[EnrollmentGroupSchedule]**/





