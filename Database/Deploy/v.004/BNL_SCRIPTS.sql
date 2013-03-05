USE [matriFunDB]
GO
/****** Object:  View [dbo].[PlanDetails] ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PlanDetails]'))
DROP VIEW [dbo].PlanDetails
GO
/****** Object:  View [dbo].[PlanDetails] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[PlanDetails]
AS
SELECT	sp.SchemeID,
		s.Name AS SchemeName, 		 
		p.PlanID, 
		p.Name AS PlanName, 
		p.[Version] 
FROM [Plan] p
INNER JOIN [Scheme-Plan] sp ON p.PlanID = sp.PlanID
INNER JOIN Scheme s ON s.SchemeID = sp.SchemeID
GO