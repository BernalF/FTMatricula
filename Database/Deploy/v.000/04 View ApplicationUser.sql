USE [matriFunDB]
GO

/****** Object:  View [dbo].[ApplicationUser]    Script Date: 01/05/2013 16:58:22 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ApplicationUser]'))
DROP VIEW [dbo].[ApplicationUser]
GO

USE [matriFunDB]
GO

/****** Object:  View [dbo].[ApplicationUser]    Script Date: 01/05/2013 16:58:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ApplicationUser]
AS
SELECT 
	  a.UserId
	, ISNULL(c.StudentID,NEWID())  AS StudentID
	, a.UserName
	, ISNULL(b.Email,'') AS Email
	, ISNULL(c.FirstName,'') AS FirstName
	, ISNULL(c.LastName,'') AS LastName
	, ISNULL(c.Gender,'M') AS Gender
	, ISNULL(c.DateOfBirth,GETDATE()) AS DateOfBirth
	, ISNULL(c.CountryID,NEWID()) AS CountryID
	, ISNULL(d.CountryName,'') AS CountryName
	, ISNULL(c.MaritalStatusTypeID,NEWID()) AS MaritalStatusTypeID
	, ISNULL(c.Phone1,'') AS Phone1
	, ISNULL(c.Phone2,'') AS Phone2
	, ISNULL(c.Phone3,'') AS Phone3
	, ISNULL(f.RoleName,'') AS RoleName  
	, ISNULL(c.IdentificationTypeID,NEWID())IdentificationTypeID
FROM  dbo.Users AS a INNER JOIN
               dbo.Memberships AS b ON a.UserId = b.UserId LEFT JOIN
               dbo.Student AS c ON a.UserId = c.UserID LEFT JOIN
               dbo.Country AS d ON c.CountryID = d.CountryID
               LEFT JOIN dbo.UsersInRoles AS e ON e.UserId = a.UserId
               LEFT JOIN dbo.Roles AS f ON f.RoleId = e.RoleId
WHERE (c.IsAppUser is null OR c.IsAppUser = 1)
  AND a.UserName <> 'admin'

GO