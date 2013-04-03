-- DELETE TEst Plan
DELETE FROM [Plan] WHERE PlanID = '54445E55-C2F2-49E2-973C-9B68DE2E7D8A'
-- Add ParentID, isActive, hasEnrollment columns to Plan Table
ALTER TABLE [Plan] ADD ParentID UNIQUEIDENTIFIER NULL
ALTER TABLE [Plan] ADD isActive BIT NULL
ALTER TABLE [Plan] ADD hasEnrollment BIT NULL 
GO
-- Active all the existing plans
UPDATE [Plan] SET isActive = 1
GO
--- ALTER VIEW [dbo].[PlanDetails] Add isActive
ALTER VIEW [dbo].[PlanDetails]  
AS  
SELECT sp.SchemeID,  
  s.Name AS SchemeName,      
  p.PlanID,   
  p.Name AS PlanName,  
  p.[Description],  
  p.[Version],
  p.isActive   
FROM [Plan] p  
INNER JOIN [Scheme-Plan] sp ON p.PlanID = sp.PlanID  
INNER JOIN Scheme s ON s.SchemeID = sp.SchemeID  
WHERE isActive = 1

