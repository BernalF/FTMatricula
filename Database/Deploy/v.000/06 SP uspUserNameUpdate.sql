IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspUserNameUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[uspUserNameUpdate]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Berman Romero
-- Create date: 03-Febrero-2013
-- Description:	Update username, table: User
-- =============================================
CREATE PROCEDURE uspUserNameUpdate
	@UserNameOld nvarchar(100), @UserNameNew nvarchar(100)
AS
BEGIN
	SET NOCOUNT ON;
	
	UPDATE dbo.Users
		SET UserName = @UserNameNew
	WHERE UserName = @UserNameOld
	
	SET NOCOUNT OFF;
END
GO
