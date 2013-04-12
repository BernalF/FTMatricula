--- Delete table student course
DROP TABLE [Student-Course]
GO
--- Add Foreign key to table score with student
ALTER TABLE [dbo].[Score]  WITH CHECK ADD  CONSTRAINT [FK_Score_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] (StudentID)
GO
ALTER TABLE [dbo].[Score] CHECK CONSTRAINT [FK_Score_Student]
GO
--- Add Enrollment Group ID
ALTER TABLE  [dbo].[Score]  ADD [EnrollmentGroupID] UNIQUEIDENTIFIER
GO
ALTER TABLE [dbo].[Score]  WITH CHECK ADD  CONSTRAINT [FK_Score_EnrollmentGroup] FOREIGN KEY([EnrollmentGroupID])
REFERENCES [dbo].[EnrollmentGroups] (EnrollmentGroupID)
GO	
ALTER TABLE [dbo].[Score] CHECK CONSTRAINT [FK_Score_EnrollmentGroup]
GO
--- Add FK for OwnerUserID and CoordinatorUserID
ALTER TABLE [dbo].[Scheme]  WITH NOCHECK ADD  CONSTRAINT [FK_Scheme_OwUsers] FOREIGN KEY([OwnerUserID])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Scheme] CHECK CONSTRAINT [FK_Scheme_OwUsers]
GO
ALTER TABLE [dbo].[Scheme]  WITH NOCHECK ADD  CONSTRAINT [FK_Scheme_CooUsers] FOREIGN KEY([CoordinatorUserID])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Scheme] CHECK CONSTRAINT [FK_Scheme_CooUsers]
GO
--- Alter View Scheme Details, Add School      
ALTER VIEW [dbo].[SchemeDetails]      
AS      
SELECT s.SchemeID,     
  s.Name SchemeName,     
  s.Description,    
  s.OwnerUserId,    
  ISNULL(u1.UserName,'') OwnerName,    
  s.CoordinatorUserId,    
  ISNULL(u2.UserName, '') CoordinatorName,    
  s.ModalityID,    
  m.Name ModalityName,
  ss.SchoolID,
  ISNULL(sc.Name, '') SchoolName
FROM Scheme s  
INNER JOIN Modality m ON s.ModalityID = m.ModalityID    
LEFT JOIN Users u1 ON u1.UserId = s.OwnerUserId    
LEFT JOIN Users u2 ON u2.UserId= s.CoordinatorUserId 
LEFT JOIN [School-Scheme] ss ON ss.SchemeID = s.SchemeID 
LEFT JOIN School sc ON sc.SchoolID = ss.SchoolID
--- Add primary key to table school - scheme
GO
