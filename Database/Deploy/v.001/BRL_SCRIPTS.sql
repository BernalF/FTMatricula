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
