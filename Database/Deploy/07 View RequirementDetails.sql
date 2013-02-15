USE [matriFunDB]
GO

/****** Object:  View [dbo].[RequirementDetails] ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[RequirementDetails]'))
DROP VIEW [dbo].[RequirementDetails]
GO

/****** Object:  View [dbo].[RequirementDetails] ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[RequirementDetails]
AS
SELECT	r.RequirementID,
		r.Name,
		r.TypeID,
		t.Name TypeName
FROM Requirement r
INNER JOIN [Type] t ON r.TypeID= t.TypeID
ORDER BY r.TypeID
GO