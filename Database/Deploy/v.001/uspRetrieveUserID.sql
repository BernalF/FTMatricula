IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspRetrieveUserID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[uspRetrieveUserID]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Berman Romero
-- Create date: 17-Febrero-2013
-- Description:	Retrieve UserID, table: User
-- =============================================
CREATE PROCEDURE uspRetrieveUserID
	@UserName nvarchar(100)
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		UserId 
	FROM dbo.Users
	WHERE UserName = @UserName
	
	SET NOCOUNT OFF;
END
GO
