--- Insert Score Course Criteria Types
INSERT [Type]( TypeID, Name, [Description], Usage)
VALUES(NEWID(),'MIN_SCORE','Minimun Score','CSC')

INSERT [Type]( TypeID, Name, [Description], Usage)
VALUES(NEWID(),'ASSISTANCE','Assistance','CSC')

INSERT [Type]( TypeID, Name, [Description], Usage)
VALUES(NEWID(),'APPROVED_REPPROVED','Approved-Repproved','CSC')
/****** Object:  Table [dbo].[ScoreCriteria]    Script Date: 05/25/2013 11:25:42 ******/
GO
CREATE TABLE [dbo].[ScoreCriteria]
(
	[ScoreCriteriaID] [uniqueidentifier] NOT NULL,
	[TypeID] [uniqueidentifier] NULL,
	[MinimumScore] [varchar](50) NULL
) ON [PRIMARY]
GO
ALTER TABLE dbo.ScoreCriteria ADD CONSTRAINT
	PK_ScoreCriteria PRIMARY KEY CLUSTERED 
	(
	ScoreCriteriaID
	) 
	GO
ALTER TABLE dbo.ScoreCriteria ADD CONSTRAINT
	FK_ScoreCriteria_Type FOREIGN KEY
	(
	TypeID
	) REFERENCES dbo.Type
	(
	TypeID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 	
GO
--- Add isApproved Flag
ALTER TABLE dbo.Score ADD
	isApproved bit NULL
GO