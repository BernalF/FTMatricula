--- Delete table student course
DROP TABLE [Student-Course]

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