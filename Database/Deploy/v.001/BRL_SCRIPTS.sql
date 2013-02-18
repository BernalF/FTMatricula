--- modificacion de key roles
UPDATE dbo.Roles
SET RoleName = 'ROLE_ADMINISTRATOR'
WHERE RoleName = 'Administrator' 

UPDATE dbo.Roles
SET RoleName = 'ROLE_COORDINATOR'
WHERE RoleName = 'Coordinator' 

UPDATE dbo.Roles
SET RoleName = 'ROLE_STUDENT'
WHERE RoleName = 'Student' 

UPDATE dbo.Roles
SET RoleName = 'ROLE_AUDITOR'
WHERE RoleName = 'Auditor' 

-- new ROLES
INSERT INTO dbo.Roles
select
 ApplicationId
,NEWID()
,'ROLE_SCHOOL_ADMIN' as RoleName
,'School Administrator' as RoleDescription
from dbo.Applications

INSERT INTO dbo.Roles
select
 ApplicationId
,NEWID()
,'ROLE_TEACHER' as RoleName
,'Teacher' as RoleDescription
from dbo.Applications


GO

select * from [type]

UPDATE [Type]
SET [Name] = 'MARITAL_STATUS_SINGLE', [Description] = 'Marital status single'
WHERE Name = 'Casado'

UPDATE [Type]
SET [Name] = 'MARITAL_STATUS_MARRIED', [Description] = 'Marital status married'
WHERE Name = 'Soltero'

INSERT [Type]( TypeID,Name,[Description],Usage)
VALUES(NEWID(),'MARITAL_STATUS_DIVORCED','Marital status divorced','MST')

INSERT [Type]( TypeID,Name,[Description],Usage)
VALUES(NEWID(),'MARITAL_STATUS_COHABIT','Marital status cohabit','MST')

INSERT [Type]( TypeID,Name,[Description],Usage)
VALUES(NEWID(),'MARITAL_STATUS_WIDOW','Marital status widow','MST')


UPDATE [Type]
SET [Name] = 'NATIONAL_ID', [Description] = 'National ID'
WHERE Name = 'Cedula'

INSERT [Type]( TypeID,Name,[Description],Usage)
VALUES(NEWID(),'PASSPORT_ID','Passport ID','IDS')

INSERT [Type]( TypeID,Name,[Description],Usage)
VALUES(NEWID(),'RESIDENT_ID','Resident ID','IDS')



---------------------------
--Types for Aditional data
---------------------------
INSERT [Type]( TypeID,Name,[Description],Usage)
VALUES(NEWID(),'WPS_DADS','Dads','WPS')
INSERT [Type]( TypeID,Name,[Description],Usage)
VALUES(NEWID(),'WPS_FAMILY','Family','WPS')
INSERT [Type]( TypeID,Name,[Description],Usage)
VALUES(NEWID(),'WPS_SCHOLARSHIP','Scholarship','WPS')
INSERT [Type]( TypeID,Name,[Description],Usage)
VALUES(NEWID(),'WPS_INSTITUTION','Institution','WPS')
INSERT [Type]( TypeID,Name,[Description],Usage)
VALUES(NEWID(),'WPS_OWN_INCOME','Own income','WPS')
INSERT [Type]( TypeID,Name,[Description],Usage)
VALUES(NEWID(),'WPS_FUNDED','Funded','WPS')
INSERT [Type]( TypeID,Name,[Description],Usage)
VALUES(NEWID(),'WPS_OTHER','Other','WPS')

INSERT [Type]( TypeID,Name,[Description],Usage)
VALUES(NEWID(),'KAU_TV','TV','KAU')
INSERT [Type]( TypeID,Name,[Description],Usage)
VALUES(NEWID(),'KAU_INTERNET','INTERNET','KAU')
INSERT [Type]( TypeID,Name,[Description],Usage)
VALUES(NEWID(),'KAU_NEWS','NEWS','KAU')
INSERT [Type]( TypeID,Name,[Description],Usage)
VALUES(NEWID(),'KAU_OTHER','Other','KAU')

GO


/******************[StudentAdditionalData]*********************/

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudentAdditionalData_Student]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudentAdditionalData]'))
ALTER TABLE [dbo].[StudentAdditionalData] DROP CONSTRAINT [FK_StudentAdditionalData_Student]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudentAdditionalData_Type_HowYouKnow]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudentAdditionalData]'))
ALTER TABLE [dbo].[StudentAdditionalData] DROP CONSTRAINT [FK_StudentAdditionalData_Type_HowYouKnow]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudentAdditionalData_Type_WhoPays]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudentAdditionalData]'))
ALTER TABLE [dbo].[StudentAdditionalData] DROP CONSTRAINT [FK_StudentAdditionalData_Type_WhoPays]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StudentAdditionalData]') AND type in (N'U'))
DROP TABLE [dbo].[StudentAdditionalData]
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
	[Works] [bit] NOT NULL,
	[Studies] [bit] NOT NULL,
	[WhoPaysYourStudiesTypeID] [uniqueidentifier] NULL,
	[HowYouKnowAboutUsTypeID] [uniqueidentifier] NULL,
	[ReceiveOffers] [bit] NOT NULL,
	[ReceiveNews] [bit] NOT NULL
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

/******************[StudentAdditionalData]*********************/