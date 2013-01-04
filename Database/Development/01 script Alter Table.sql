--Delete Table Modality
DROP TABLE Modality
-- Delete ClassroomID from Course table
ALTER TABLE Course DROP CONSTRAINT FK_Course_Classroom
ALTER TABLE Course DROP COLUMN ClassroomID
-- Add Is Active Column for Course table
ALTER TABLE Course ADD IsActive BIT NULL