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
