USE [matriFunDB]
GO

/****** Object:  View [dbo].[SchemeDetails] ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[SchemeDetails]'))
DROP VIEW [dbo].[SchemeDetails]
GO

USE [matriFunDB]
GO

/****** Object:  View [dbo].[SchemeDetails] ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[SchemeDetails]
AS
SELECT	s.SchemeID, 
		s.Name SchemeName, 
		s.Description,
		s.OwnerUserId,
		u1.UserName OwnerName,
		s.CoordinatorUserId,
		u2.UserName CoordinatorName,
		s.ModalityID,
		m.Name ModalityName				 
FROM Scheme s
INNER JOIN Modality m ON s.ModalityID = m.ModalityID
INNER JOIN Users u1 ON u1.UserId = s.OwnerUserId
INNER JOIN Users u2 ON u2.UserId= s.CoordinatorUserId
GO