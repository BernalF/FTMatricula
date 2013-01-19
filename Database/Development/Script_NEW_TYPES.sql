--------- REQUERIMENTS TYPES
INSERT INTO [Type] (TypeID, Name, [Description], Usage, InsertDate) 
	VALUES (NEWID(), 'Program', 'Program Requeriments', 'REQ', GETDATE())
	
INSERT INTO [Type] (TypeID, Name, [Description], Usage, InsertDate) 
	VALUES (NEWID(), 'Plan', 'Plan Requeriments', 'REQ', GETDATE())	
	
INSERT INTO [Type] (TypeID, Name, [Description], Usage, InsertDate) 
	VALUES (NEWID(), 'Course', 'Course Requeriments', 'REQ', GETDATE())	
--SELECT * FROM [Type]