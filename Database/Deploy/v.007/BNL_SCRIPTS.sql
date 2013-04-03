-- Add ParentID, isActive, hasEnrollment columns to Plan Table
ALTER TABLE [Plan] ADD ParentID UNIQUEIDENTIFIER NULL
ALTER TABLE [Plan] ADD isActive BIT DEFAULT 1 NULL
ALTER TABLE [Plan] ADD hasEnrollment BIT NULL 

-- 

Select * from [Plan]