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
SELECT a.UserId, c.StudentID, a.UserName, b.Email, c.FirstName, c.LastName, c.Gender, c.DateOfBirth, c.CountryID, d.CountryName, c.MaritalStatusTypeID, c.Phone1, c.Phone2, c.Phone3
FROM  dbo.Users AS a INNER JOIN
               dbo.Memberships AS b ON a.UserId = b.UserId INNER JOIN
               dbo.Student AS c ON a.UserId = c.UserID INNER JOIN
               dbo.Country AS d ON c.CountryID = d.CountryID
WHERE c.IsAppUser = 1

GO