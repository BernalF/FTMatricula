USE matriFunDB
GO

INSERT StudentPlan (StudentID,PlanID,InsertDate)
SELECT b.StudentID, a.PlanID, GETDATE()
FROM Enrollment  a INNER JOIN EnrollmentStudent b  ON a.EnrollmentID = b.EnrollmentID
GROUP BY b.StudentID, a.planID

-----
ALTER TABLE dbo.Score ADD Reason VARCHAR(MAX) NULL