
INSERT INTO dbo.Roles(ApplicationId, RoleId, RoleName, [Description]) 
SELECT ApplicationID, NEWID(), 'ROLE_ASSISTANCE', 'Assistance Role'  
FROM Applications WHERE ApplicationName = 'MatriFun'

