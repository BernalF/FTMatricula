USE [matriFunDB]
GO
IF OBJECT_ID('[FK_Plan_Location]', 'F') IS NOT NULL
	ALTER TABLE [dbo].[Plan] DROP CONSTRAINT [FK_Plan_Location]
GO
ALTER TABLE [Scheme] ALTER COLUMN  [OwnerUserId] UNIQUEIDENTIFIER NULL
GO
ALTER TABLE [Scheme] ALTER COLUMN  [CoordinatorUserId] UNIQUEIDENTIFIER NULL
GO
ALTER TABLE [Plan] DROP COLUMN  LocationID
GO
ALTER TABLE [Plan] ADD [Version] VARCHAR(100)
GO
--------- REQUERIMENTS TYPES
DELETE FROM [Type] WHERE Description in ('Program Requeriments', 'Plan Requeriments', 'Course Requeriments')
GO
INSERT INTO [Type] (TypeID, Name, [Description], Usage, InsertDate) 
	VALUES (NEWID(), 'REQ_PROGRAM', 'Program Requeriments', 'REQ', GETDATE())
GO	
INSERT INTO [Type] (TypeID, Name, [Description], Usage, InsertDate) 
	VALUES (NEWID(), 'REQ_PLAN', 'Plan Requeriments', 'REQ', GETDATE())	
GO	
INSERT INTO [Type] (TypeID, Name, [Description], Usage, InsertDate) 
	VALUES (NEWID(), 'REQ_COURSE', 'Course Requeriments', 'REQ', GETDATE())	