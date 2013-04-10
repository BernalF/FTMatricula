--- Delete table student course
DROP TABLE [Student-Course]

--- Add Foreign key to table score with student
ALTER TABLE [dbo].[Score] CHECK CONSTRAINT [FK_Score_Student]
GO
ALTER TABLE [dbo].[Score]  WITH CHECK ADD  CONSTRAINT [FK_Score_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] (StudentID)
GO
--- Add Enrollment Group ID
ALTER TABLE [dbo].[Score] ADD EnrollmentGroupID UNIQUEIDENTIFIER

ALTER TABLE [dbo].[Score] CHECK CONSTRAINT [FK_Score_EnrollmentGroup]
GO
ALTER TABLE [dbo].[Score]  WITH CHECK ADD  CONSTRAINT [FK_Score_EnrollmentGroup] FOREIGN KEY([EnrollmentGroupID])
REFERENCES [dbo].[EnrollmentGroups] (EnrollmentGroupID)
GO
