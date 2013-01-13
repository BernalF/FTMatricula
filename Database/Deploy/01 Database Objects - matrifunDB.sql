USE [matriFunDB]
GO



IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Student_Type_MaritalStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[Student]'))
ALTER TABLE [dbo].[Student] DROP CONSTRAINT [FK_Student_Type_MaritalStatus]
GO


IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudentAdditionalData_Student]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudentAdditionalData]'))
ALTER TABLE [dbo].[StudentAdditionalData] DROP CONSTRAINT [FK_StudentAdditionalData_Student]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudentAdditionalData_Type_HowYouKnow]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudentAdditionalData]'))
ALTER TABLE [dbo].[StudentAdditionalData] DROP CONSTRAINT [FK_StudentAdditionalData_Type_HowYouKnow]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudentAdditionalData_Type_WhoPays]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudentAdditionalData]'))
ALTER TABLE [dbo].[StudentAdditionalData] DROP CONSTRAINT [FK_StudentAdditionalData_Type_WhoPays]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudiesInformation_Student]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudiesInformation]'))
ALTER TABLE [dbo].[StudiesInformation] DROP CONSTRAINT [FK_StudiesInformation_Student]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Student_Country]') AND parent_object_id = OBJECT_ID(N'[dbo].[Student]'))
ALTER TABLE [dbo].[Student] DROP CONSTRAINT [FK_Student_Country]
GO

IF OBJECT_ID('[[FK_Course_Requirement]]', 'F') IS NOT NULL
	ALTER TABLE [dbo].[Course] DROP CONSTRAINT [FK_Course_Requirement]
GO


IF OBJECT_ID('[FK_Enrollment_Plan]', 'F') IS NOT NULL
	ALTER TABLE [dbo].[Enrollment] DROP CONSTRAINT [FK_Enrollment_Plan]
GO

IF OBJECT_ID('[MembershipApplication]', 'F') IS NOT NULL
	ALTER TABLE [dbo].[Memberships] DROP CONSTRAINT [MembershipApplication]
GO


IF OBJECT_ID('[MembershipUser]', 'F') IS NOT NULL
	ALTER TABLE [dbo].[Memberships] DROP CONSTRAINT [MembershipUser]
GO


IF OBJECT_ID('[FK_Plan_Location]', 'F') IS NOT NULL
	ALTER TABLE [dbo].[Plan] DROP CONSTRAINT [FK_Plan_Location]
GO


IF OBJECT_ID('[FK_Plan-Course_Course]', 'F') IS NOT NULL
	ALTER TABLE [dbo].[Plan-Course] DROP CONSTRAINT [FK_Plan-Course_Course]
GO

IF OBJECT_ID('[FK_Plan-Course_Plan]', 'F') IS NOT NULL
	ALTER TABLE [dbo].[Plan-Course] DROP CONSTRAINT [FK_Plan-Course_Plan]
GO

IF OBJECT_ID('[UserProfile]', 'F') IS NOT NULL
	ALTER TABLE [dbo].[Profiles] DROP CONSTRAINT [UserProfile]
GO

IF OBJECT_ID('[FK_Record_Score]', 'F') IS NOT NULL
	ALTER TABLE [dbo].[Record] DROP CONSTRAINT [FK_Record_Score]
GO


IF OBJECT_ID('[RoleApplication]', 'F') IS NOT NULL
	ALTER TABLE [dbo].[Roles] DROP CONSTRAINT [RoleApplication]
GO


IF OBJECT_ID('[FK_Scheme_Type]', 'F') IS NOT NULL
	ALTER TABLE [dbo].[Scheme] DROP CONSTRAINT [FK_Scheme_Type]
GO


IF OBJECT_ID('[FK_Scheme-Plan_Plan]', 'F') IS NOT NULL
	ALTER TABLE [dbo].[Scheme-Plan] DROP CONSTRAINT [FK_Scheme-Plan_Plan]
GO


IF OBJECT_ID('[FK_Scheme-Plan_Scheme]', 'F') IS NOT NULL
	ALTER TABLE [dbo].[Scheme-Plan] DROP CONSTRAINT [FK_Scheme-Plan_Scheme]
GO


IF OBJECT_ID('[FK_Scheme-Requirement_Requirement]', 'F') IS NOT NULL
	ALTER TABLE [dbo].[Scheme-Requirement] DROP CONSTRAINT [FK_Scheme-Requirement_Requirement]
GO

IF OBJECT_ID('[FK_Scheme-Requirement_Scheme]', 'F') IS NOT NULL
	ALTER TABLE [dbo].[Scheme-Requirement] DROP CONSTRAINT [FK_Scheme-Requirement_Scheme]
GO


IF OBJECT_ID('[FK_School-Scheme_Scheme]', 'F') IS NOT NULL
	ALTER TABLE [dbo].[School-Scheme] DROP CONSTRAINT [FK_School-Scheme_Scheme]
GO


IF OBJECT_ID('[FK_School-Scheme_School]', 'F') IS NOT NULL
	ALTER TABLE [dbo].[School-Scheme] DROP CONSTRAINT [FK_School-Scheme_School]
GO

IF OBJECT_ID('[FK_Score_Course]', 'F') IS NOT NULL
	ALTER TABLE [dbo].[Score] DROP CONSTRAINT [FK_Score_Course]
GO


IF OBJECT_ID('[FK_Score_Student]', 'F') IS NOT NULL
	ALTER TABLE [dbo].[Score] DROP CONSTRAINT [FK_Score_Student]
GO


IF OBJECT_ID('[FK_Student_Type]', 'F') IS NOT NULL
	ALTER TABLE [dbo].[Student] DROP CONSTRAINT [FK_Student_Type]
GO

IF OBJECT_ID('[FK_Student_Users]', 'F') IS NOT NULL
	ALTER TABLE [dbo].[Student] DROP CONSTRAINT [FK_Student_Users]
GO


IF OBJECT_ID('[FK_Student-Course_Course]', 'F') IS NOT NULL
	ALTER TABLE [dbo].[Student-Course] DROP CONSTRAINT [FK_Student-Course_Course]
GO

IF OBJECT_ID('[FK_Student-Course_Student]', 'F') IS NOT NULL
	ALTER TABLE [dbo].[Student-Course] DROP CONSTRAINT [FK_Student-Course_Student]
GO

IF OBJECT_ID('[UserApplication]', 'F') IS NOT NULL
	ALTER TABLE [dbo].[Users] DROP CONSTRAINT [UserApplication]
GO


IF OBJECT_ID('[UsersInRoleRole]', 'F') IS NOT NULL
	ALTER TABLE [dbo].[UsersInRoles] DROP CONSTRAINT [UsersInRoleRole]
GO


IF OBJECT_ID('[UsersInRoleUser]', 'F') IS NOT NULL
	ALTER TABLE [dbo].[UsersInRoles] DROP CONSTRAINT [UsersInRoleUser]
GO

IF OBJECT_ID('[FK_Course_Requirement]', 'F') IS NOT NULL
	ALTER TABLE [dbo].[Course] DROP CONSTRAINT [FK_Course_Requirement]
GO


/****DROP EXISTING OBJECTS****/
IF OBJECT_ID('dbo.Location', 'U') IS NOT NULL
	DROP TABLE [dbo].[Location]
GO
IF OBJECT_ID('dbo.Place', 'U') IS NOT NULL
	DROP TABLE [dbo].[Place]
GO


IF OBJECT_ID('dbo.Classroom', 'U') IS NOT NULL
	DROP TABLE [dbo].[Classroom]
GO

IF OBJECT_ID('dbo.Applications', 'U') IS NOT NULL
	DROP TABLE [dbo].[Applications]
GO

IF OBJECT_ID('dbo.School', 'U') IS NOT NULL
	DROP TABLE [dbo].[School]
GO

IF OBJECT_ID('dbo.Requirement', 'U') IS NOT NULL
	DROP TABLE [dbo].[Requirement]
GO

IF OBJECT_ID('dbo.Type', 'U') IS NOT NULL
	DROP TABLE [dbo].[Users]
GO

IF OBJECT_ID('dbo.Scheme', 'U') IS NOT NULL
	DROP TABLE [dbo].[Scheme]
GO

IF OBJECT_ID('dbo.Roles', 'U') IS NOT NULL
	DROP TABLE [dbo].[Roles]
GO

IF OBJECT_ID('dbo.Course', 'U') IS NOT NULL
	DROP TABLE [dbo].[Course]
GO

IF OBJECT_ID('dbo.Plan', 'U') IS NOT NULL
	DROP TABLE [dbo].[Plan]
GO

IF OBJECT_ID('dbo.Memberships', 'U') IS NOT NULL
	DROP TABLE [dbo].[Memberships]
GO

IF OBJECT_ID('dbo.Enrollment', 'U') IS NOT NULL
	DROP TABLE [dbo].[Enrollment]
GO

IF OBJECT_ID('dbo.Scheme-Requirement', 'U') IS NOT NULL
	DROP TABLE [dbo].[Scheme-Requirement]
GO

IF OBJECT_ID('dbo.Scheme-Plan', 'U') IS NOT NULL
	DROP TABLE [dbo].[Scheme-Plan]
GO

IF OBJECT_ID('dbo.Student', 'U') IS NOT NULL
	DROP TABLE [dbo].[Student]
GO

IF OBJECT_ID('dbo.UsersInRoles', 'U') IS NOT NULL
	DROP TABLE [dbo].[UsersInRoles]
GO

IF OBJECT_ID('dbo.School-Scheme', 'U') IS NOT NULL
	DROP TABLE [dbo].[School-Scheme]
GO

IF OBJECT_ID('dbo.Profiles', 'U') IS NOT NULL
	DROP TABLE [dbo].[Profiles]
GO

IF OBJECT_ID('dbo.Plan-Course', 'U') IS NOT NULL
	DROP TABLE [dbo].[Plan-Course]
GO

IF OBJECT_ID('dbo.Student-Course', 'U') IS NOT NULL
	DROP TABLE [dbo].[Student-Course]
GO

IF OBJECT_ID('dbo.Score', 'U') IS NOT NULL
	DROP TABLE [dbo].[Score]
GO

IF OBJECT_ID('dbo.Record', 'U') IS NOT NULL
	DROP TABLE [dbo].[Record]
GO

IF OBJECT_ID('dbo.Resource', 'U') IS NOT NULL
	DROP TABLE [dbo].[Resource]
GO

IF OBJECT_ID('dbo.Type', 'U') IS NOT NULL
	DROP TABLE [dbo].[Type]
GO

/****** Object:  Table [dbo].[StudiesInformation]    Script Date: 01/05/2013 14:12:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StudiesInformation]') AND type in (N'U'))
DROP TABLE [dbo].[StudiesInformation]
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StudentAdditionalData]') AND type in (N'U'))
DROP TABLE [dbo].[StudentAdditionalData]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Country]') AND type in (N'U'))
DROP TABLE [dbo].[Country]
GO

/****** Object:  Table [dbo].[StudiesInformation]    Script Date: 01/05/2013 14:12:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[StudiesInformation](
	[StudyID] [uniqueidentifier] NOT NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](10) NULL,
	[StudentID] [uniqueidentifier] NULL,
	[SchoolName] [varchar](300) NULL,
	[Degree] [varchar](300) NULL,
	[Year] [int] NULL,
	[SchoolPlace] [varchar](400) NULL,
 CONSTRAINT [PK_StudiesInformation] PRIMARY KEY CLUSTERED 
(
	[StudyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


/****** Object:  Table [dbo].[Country]    Script Date: 01/05/2013 16:42:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Country](
	[CountryID] [uniqueidentifier] NOT NULL,
	[CountryName] [varchar](200) NOT NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](10) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


/****** Object:  Table [dbo].[StudentAdditionalData]    Script Date: 01/05/2013 14:09:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[StudentAdditionalData](
	[StudentID] [uniqueidentifier] NOT NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL,
	[PhysicalAddress] [varchar](400) NOT NULL,
	[AdditionalAddress] [varchar](400) NULL,
	[JobTitle] [varchar](200) NULL,
	[WorkPlace] [varchar](400) NULL,
	[Works] [bit] NULL,
	[Studies] [bit] NULL,
	[WhoPaysYourStudiesTypeID] [uniqueidentifier] NULL,
	[HowYouKnowAboutUsTypeID] [uniqueidentifier] NULL,
	[ReceiveOffers] [bit] NULL,
	[ReceiveNews] [bit] NULL
) ON [PRIMARY]

GO

ALTER TABLE dbo.StudentAdditionalData ADD CONSTRAINT
	PK_StudentAdditionalData PRIMARY KEY CLUSTERED 
	(
	StudentID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.StudentAdditionalData SET (LOCK_ESCALATION = TABLE)
GO


/****** Object:  Table [dbo].[Location]    Script Date: 12/31/2012 10:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Location](
	[LocationID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](120) NOT NULL,
	[Line1] [varchar](300) NULL,
	[Line2] [varchar](300) NULL,
	[InsertDate] [datetime] NULL,
	[Latitude] [decimal](9, 6) NULL,
	[Longitude] [decimal](9, 6) NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Place]    Script Date: 12/31/2012 10:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Place](
	[PlaseID] [uniqueidentifier] NOT NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
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
	[Code] [varchar](50) NULL,
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
/****** Object:  Table [dbo].[Applications]    Script Date: 12/31/2012 10:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Applications](
	[ApplicationName] [nvarchar](235) NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[School]    Script Date: 12/31/2012 10:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[School](
	[SchoolID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](120) NOT NULL,
	[Description] [varchar](300) NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL,
	[Code] [varchar](120) NULL,
 CONSTRAINT [PK_School] PRIMARY KEY CLUSTERED 
(
	[SchoolID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Resource]    Script Date: 12/31/2012 10:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Resource](
	[ResourceID] [uniqueidentifier] NOT NULL,
	[ResourceKey] [varchar](100) NOT NULL,
	[Culture] [varchar](6) NOT NULL,
	[ResourceValue] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Resource] PRIMARY KEY CLUSTERED 
(
	[ResourceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Requirement]    Script Date: 12/31/2012 10:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Requirement](
	[RequirementID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](120) NOT NULL,
	[TypeID] [uniqueidentifier] NOT NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL,
 CONSTRAINT [PK_Requirement] PRIMARY KEY CLUSTERED 
(
	[RequirementID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Type]    Script Date: 12/31/2012 10:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Type](
	[TypeID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](120) NOT NULL,
	[Description] [varchar](300) NULL,
	[Usage] [varchar](4) NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/31/2012 10:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[IsAnonymous] [bit] NOT NULL,
	[LastActivityDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Scheme]    Script Date: 12/31/2012 10:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Scheme](
	[SchemeID] [uniqueidentifier] NOT NULL,
	[Description] [varchar](120) NOT NULL,
	[OwnerUserId] [uniqueidentifier] NOT NULL,
	[CoordinatorUserId] [uniqueidentifier] NOT NULL,
	[TypeID] [uniqueidentifier] NOT NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL,
 CONSTRAINT [PK_Scheme] PRIMARY KEY CLUSTERED 
(
	[SchemeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 12/31/2012 10:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 12/31/2012 10:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Course](
	[CourseID] [uniqueidentifier] NOT NULL,
	[Code] VARCHAR(15) NOT NULL,
	[Name] [varchar](120) NOT NULL,
	[TeachingHours]	INT NULL,
	[Charge] MONEY NULL, 
	[IsActive] [BIT] NULL,
	[RequirementID] [uniqueidentifier] NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Plan]    Script Date: 12/31/2012 10:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Plan](
	[PlanID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](120) NOT NULL,
	[Description] [varchar](300) NULL,
	[LocationID] [uniqueidentifier] NOT NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL,
 CONSTRAINT [PK_Plan] PRIMARY KEY CLUSTERED 
(
	[PlanID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Memberships]    Script Date: 12/31/2012 10:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Memberships](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowsStart] [datetime] NOT NULL,
	[Comment] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enrollment]    Script Date: 12/31/2012 10:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Enrollment](
	[EnrollmentID] [uniqueidentifier] NOT NULL,
	[Description] [varchar](120) NOT NULL,
	[PlanID] [uniqueidentifier] NOT NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL,
 CONSTRAINT [PK_Enrollment] PRIMARY KEY CLUSTERED 
(
	[EnrollmentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Scheme-Requirement]    Script Date: 12/31/2012 10:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Scheme-Requirement](
	[SchemeID] [uniqueidentifier] NOT NULL,
	[RequirementID] [uniqueidentifier] NOT NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Scheme-Plan]    Script Date: 12/31/2012 10:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Scheme-Plan](
	[SchemeID] [uniqueidentifier] NOT NULL,
	[PlanID] [uniqueidentifier] NOT NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student]    Script Date: 12/31/2012 10:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Student](
	[StudentID] [uniqueidentifier] NOT NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[IdentificationTypeID] [uniqueidentifier] NOT NULL,
	[FirstName] [varchar](100) NOT NULL,
	[LastName] [varchar](100) NOT NULL,
	[Gender] [char](1) NOT NULL,
	[DateOfBirth] [datetime] NULL,
	[CountryID] [uniqueidentifier] NULL,
	[MaritalStatusTypeID] [uniqueidentifier] NOT NULL,
	[Phone1] [varchar](80) NOT NULL,
	[Phone2] [varchar](80) NULL,
	[Phone3] [varchar](80) NULL,
	[IsAppUser] [BIT] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UsersInRoles]    Script Date: 12/31/2012 10:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[School-Scheme]    Script Date: 12/31/2012 10:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[School-Scheme](
	[SchoolID] [uniqueidentifier] NOT NULL,
	[SchemeID] [uniqueidentifier] NOT NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Profiles]    Script Date: 12/31/2012 10:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Profiles](
	[UserId] [uniqueidentifier] NOT NULL,
	[PropertyNames] [nvarchar](4000) NOT NULL,
	[PropertyValueStrings] [nvarchar](4000) NOT NULL,
	[PropertyValueBinary] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Plan-Course]    Script Date: 12/31/2012 10:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Plan-Course](
	[PlanID] [uniqueidentifier] NOT NULL,
	[CourseID] [uniqueidentifier] NOT NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student-Course]    Script Date: 12/31/2012 10:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Student-Course](
	[StudentID] [uniqueidentifier] NOT NULL,
	[CourseID] [uniqueidentifier] NOT NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Score]    Script Date: 12/31/2012 10:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Score](
	[ScoreID] [uniqueidentifier] NOT NULL,
	[CourseID] [uniqueidentifier] NOT NULL,
	[StudentID] [uniqueidentifier] NULL,
	[Result] [varchar](50) NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL,
 CONSTRAINT [PK_Score] PRIMARY KEY CLUSTERED 
(
	[ScoreID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Record]    Script Date: 12/31/2012 10:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Record](
	[RecordID] [uniqueidentifier] NOT NULL,
	[ScoreID] [uniqueidentifier] NOT NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL,
 CONSTRAINT [PK_Record] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  ForeignKey [FK_Course_Requirement]    Script Date: 12/31/2012 10:54:49 ******/
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Requirement] FOREIGN KEY([RequirementID])
REFERENCES [dbo].[Requirement] ([RequirementID])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Requirement]
GO
/****** Object:  ForeignKey [FK_Enrollment_Plan]    Script Date: 12/31/2012 10:54:49 ******/
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Plan] FOREIGN KEY([PlanID])
REFERENCES [dbo].[Plan] ([PlanID])
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_Plan]
GO
/****** Object:  ForeignKey [MembershipApplication]    Script Date: 12/31/2012 10:54:49 ******/
ALTER TABLE [dbo].[Memberships]  WITH CHECK ADD  CONSTRAINT [MembershipApplication] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[Memberships] CHECK CONSTRAINT [MembershipApplication]
GO
/****** Object:  ForeignKey [MembershipUser]    Script Date: 12/31/2012 10:54:49 ******/
ALTER TABLE [dbo].[Memberships]  WITH CHECK ADD  CONSTRAINT [MembershipUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Memberships] CHECK CONSTRAINT [MembershipUser]
GO
/****** Object:  ForeignKey [FK_Plan_Location]    Script Date: 12/31/2012 10:54:49 ******/
ALTER TABLE [dbo].[Plan]  WITH CHECK ADD  CONSTRAINT [FK_Plan_Location] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Location] ([LocationID])
GO
ALTER TABLE [dbo].[Plan] CHECK CONSTRAINT [FK_Plan_Location]
GO
/****** Object:  ForeignKey [FK_Plan-Course_Course]    Script Date: 12/31/2012 10:54:49 ******/
ALTER TABLE [dbo].[Plan-Course]  WITH CHECK ADD  CONSTRAINT [FK_Plan-Course_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Plan-Course] CHECK CONSTRAINT [FK_Plan-Course_Course]
GO
/****** Object:  ForeignKey [FK_Plan-Course_Plan]    Script Date: 12/31/2012 10:54:49 ******/
ALTER TABLE [dbo].[Plan-Course]  WITH CHECK ADD  CONSTRAINT [FK_Plan-Course_Plan] FOREIGN KEY([PlanID])
REFERENCES [dbo].[Plan] ([PlanID])
GO
ALTER TABLE [dbo].[Plan-Course] CHECK CONSTRAINT [FK_Plan-Course_Plan]
GO
/****** Object:  ForeignKey [UserProfile]    Script Date: 12/31/2012 10:54:49 ******/
ALTER TABLE [dbo].[Profiles]  WITH CHECK ADD  CONSTRAINT [UserProfile] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Profiles] CHECK CONSTRAINT [UserProfile]
GO
/****** Object:  ForeignKey [FK_Record_Score]    Script Date: 12/31/2012 10:54:49 ******/
ALTER TABLE [dbo].[Record]  WITH CHECK ADD  CONSTRAINT [FK_Record_Score] FOREIGN KEY([ScoreID])
REFERENCES [dbo].[Score] ([ScoreID])
GO
ALTER TABLE [dbo].[Record] CHECK CONSTRAINT [FK_Record_Score]
GO
/****** Object:  ForeignKey [RoleApplication]    Script Date: 12/31/2012 10:54:49 ******/
ALTER TABLE [dbo].[Roles]  WITH CHECK ADD  CONSTRAINT [RoleApplication] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[Roles] CHECK CONSTRAINT [RoleApplication]
GO
/****** Object:  ForeignKey [FK_Scheme_Type]    Script Date: 12/31/2012 10:54:49 ******/
ALTER TABLE [dbo].[Scheme]  WITH CHECK ADD  CONSTRAINT [FK_Scheme_Type] FOREIGN KEY([TypeID])
REFERENCES [dbo].[Type] ([TypeID])
GO
ALTER TABLE [dbo].[Scheme] CHECK CONSTRAINT [FK_Scheme_Type]
GO
/****** Object:  ForeignKey [FK_Scheme-Plan_Plan]    Script Date: 12/31/2012 10:54:49 ******/
ALTER TABLE [dbo].[Scheme-Plan]  WITH CHECK ADD  CONSTRAINT [FK_Scheme-Plan_Plan] FOREIGN KEY([PlanID])
REFERENCES [dbo].[Plan] ([PlanID])
GO
ALTER TABLE [dbo].[Scheme-Plan] CHECK CONSTRAINT [FK_Scheme-Plan_Plan]
GO
/****** Object:  ForeignKey [FK_Scheme-Plan_Scheme]    Script Date: 12/31/2012 10:54:49 ******/
ALTER TABLE [dbo].[Scheme-Plan]  WITH CHECK ADD  CONSTRAINT [FK_Scheme-Plan_Scheme] FOREIGN KEY([SchemeID])
REFERENCES [dbo].[Scheme] ([SchemeID])
GO
ALTER TABLE [dbo].[Scheme-Plan] CHECK CONSTRAINT [FK_Scheme-Plan_Scheme]
GO
/****** Object:  ForeignKey [FK_Scheme-Requirement_Requirement]    Script Date: 12/31/2012 10:54:49 ******/
ALTER TABLE [dbo].[Scheme-Requirement]  WITH CHECK ADD  CONSTRAINT [FK_Scheme-Requirement_Requirement] FOREIGN KEY([RequirementID])
REFERENCES [dbo].[Requirement] ([RequirementID])
GO
ALTER TABLE [dbo].[Scheme-Requirement] CHECK CONSTRAINT [FK_Scheme-Requirement_Requirement]
GO
/****** Object:  ForeignKey [FK_Scheme-Requirement_Scheme]    Script Date: 12/31/2012 10:54:49 ******/
ALTER TABLE [dbo].[Scheme-Requirement]  WITH CHECK ADD  CONSTRAINT [FK_Scheme-Requirement_Scheme] FOREIGN KEY([SchemeID])
REFERENCES [dbo].[Scheme] ([SchemeID])
GO
ALTER TABLE [dbo].[Scheme-Requirement] CHECK CONSTRAINT [FK_Scheme-Requirement_Scheme]
GO
/****** Object:  ForeignKey [FK_School-Scheme_Scheme]    Script Date: 12/31/2012 10:54:49 ******/
ALTER TABLE [dbo].[School-Scheme]  WITH CHECK ADD  CONSTRAINT [FK_School-Scheme_Scheme] FOREIGN KEY([SchemeID])
REFERENCES [dbo].[Scheme] ([SchemeID])
GO
ALTER TABLE [dbo].[School-Scheme] CHECK CONSTRAINT [FK_School-Scheme_Scheme]
GO
/****** Object:  ForeignKey [FK_School-Scheme_School]    Script Date: 12/31/2012 10:54:49 ******/
ALTER TABLE [dbo].[School-Scheme]  WITH CHECK ADD  CONSTRAINT [FK_School-Scheme_School] FOREIGN KEY([SchoolID])
REFERENCES [dbo].[School] ([SchoolID])
GO
ALTER TABLE [dbo].[School-Scheme] CHECK CONSTRAINT [FK_School-Scheme_School]
GO
/****** Object:  ForeignKey [FK_Score_Course]    Script Date: 12/31/2012 10:54:49 ******/
ALTER TABLE [dbo].[Score]  WITH CHECK ADD  CONSTRAINT [FK_Score_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Score] CHECK CONSTRAINT [FK_Score_Course]
GO
/****** Object:  ForeignKey [FK_Score_Student]    Script Date: 12/31/2012 10:54:49 ******/
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Type] FOREIGN KEY([IdentificationTypeID])
REFERENCES [dbo].[Type] ([TypeID])
GO

ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Type]
GO

ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Type_MaritalStatus] FOREIGN KEY([MaritalStatusTypeID])
REFERENCES [dbo].[Type] ([TypeID])
GO

ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Type_MaritalStatus]
GO

ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserId])
GO

ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Users]
GO
/****** Object:  ForeignKey [FK_Student-Course_Course]    Script Date: 12/31/2012 10:54:49 ******/
ALTER TABLE [dbo].[Student-Course]  WITH CHECK ADD  CONSTRAINT [FK_Student-Course_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Student-Course] CHECK CONSTRAINT [FK_Student-Course_Course]
GO
/****** Object:  ForeignKey [FK_Student-Course_Student]    Script Date: 12/31/2012 10:54:49 ******/
ALTER TABLE [dbo].[Student-Course]  WITH CHECK ADD  CONSTRAINT [FK_Student-Course_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[Student-Course] CHECK CONSTRAINT [FK_Student-Course_Student]
GO
/****** Object:  ForeignKey [UserApplication]    Script Date: 12/31/2012 10:54:49 ******/
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [UserApplication] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [UserApplication]
GO
/****** Object:  ForeignKey [UsersInRoleRole]    Script Date: 12/31/2012 10:54:49 ******/
ALTER TABLE [dbo].[UsersInRoles]  WITH CHECK ADD  CONSTRAINT [UsersInRoleRole] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[UsersInRoles] CHECK CONSTRAINT [UsersInRoleRole]
GO
/****** Object:  ForeignKey [UsersInRoleUser]    Script Date: 12/31/2012 10:54:49 ******/
ALTER TABLE [dbo].[UsersInRoles]  WITH CHECK ADD  CONSTRAINT [UsersInRoleUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[UsersInRoles] CHECK CONSTRAINT [UsersInRoleUser]
GO


IF EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_ResourcesKey_Culture')
	DROP INDEX IX_ResourcesKey_Culture ON dbo.[Resource]

GO

IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_ResourcesKey_Culture')
	CREATE UNIQUE NONCLUSTERED INDEX IX_ResourcesKey_Culture
	ON dbo.[Resource](ResourceKey, Culture)

GO


ALTER TABLE [dbo].[StudiesInformation]  WITH CHECK ADD  CONSTRAINT [FK_StudiesInformation_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO

ALTER TABLE [dbo].[StudiesInformation] CHECK CONSTRAINT [FK_StudiesInformation_Student]
GO

ALTER TABLE [dbo].[StudentAdditionalData]  WITH CHECK ADD  CONSTRAINT [FK_StudentAdditionalData_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO

ALTER TABLE [dbo].[StudentAdditionalData] CHECK CONSTRAINT [FK_StudentAdditionalData_Student]
GO

ALTER TABLE [dbo].[StudentAdditionalData]  WITH CHECK ADD  CONSTRAINT [FK_StudentAdditionalData_Type_HowYouKnow] FOREIGN KEY([HowYouKnowAboutUsTypeID])
REFERENCES [dbo].[Type] ([TypeID])
GO

ALTER TABLE [dbo].[StudentAdditionalData] CHECK CONSTRAINT [FK_StudentAdditionalData_Type_HowYouKnow]
GO

ALTER TABLE [dbo].[StudentAdditionalData]  WITH CHECK ADD  CONSTRAINT [FK_StudentAdditionalData_Type_WhoPays] FOREIGN KEY([WhoPaysYourStudiesTypeID])
REFERENCES [dbo].[Type] ([TypeID])
GO

ALTER TABLE [dbo].[StudentAdditionalData] CHECK CONSTRAINT [FK_StudentAdditionalData_Type_WhoPays]
GO


ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO

ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Country]
GO