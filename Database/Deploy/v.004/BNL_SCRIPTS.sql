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
		p.[Description],
		p.[Version] 
FROM [Plan] p
INNER JOIN [Scheme-Plan] sp ON p.PlanID = sp.PlanID
INNER JOIN Scheme s ON s.SchemeID = sp.SchemeID
GO
/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
ALTER TABLE dbo.[Scheme-Plan] ADD CONSTRAINT
	[PK_Scheme-Plan] PRIMARY KEY CLUSTERED 
	(
	SchemeID,
	PlanID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.[Scheme-Plan] SET (LOCK_ESCALATION = TABLE)
GO

