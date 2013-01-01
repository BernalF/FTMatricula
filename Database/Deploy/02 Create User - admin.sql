USE [matriFunDB]
GO

DECLARE @ApplicationId uniqueidentifier
SET @ApplicationId = NEWID()
INSERT INTO dbo.Applications
SELECT 'MatriFun', @ApplicationId,'Sistema de Matrícula de FundaTEC'

DECLARE @UserId uniqueidentifier
SET @UserId = NEWID()
INSERT INTO dbo.Users
SELECT @ApplicationId, @UserId, 'admin', 0,GETDATE()


INSERT INTO dbo.Memberships
(
	 ApplicationId								--01
	,UserId										--02
	,[Password]									--03
	,PasswordFormat								--04
	,PasswordSalt								--05
	,Email										--06
	,PasswordQuestion							--07
	,PasswordAnswer								--08
	,IsApproved									--09
	,IsLockedOut								--10
	,CreateDate									--11
	,LastLoginDate								--12
	,LastPasswordChangedDate					--13
	,LastLockoutDate							--14
	,FailedPasswordAttemptCount					--15
	,FailedPasswordAttemptWindowStart			--16
	,FailedPasswordAnswerAttemptCount			--17
	,FailedPasswordAnswerAttemptWindowsStart	--18
	,Comment									--19
)
SELECT
	 @ApplicationId										--01
	,@UserId											--02
	,'TGXzxMcUBFnNyj8Llp2V/dg7WeCpqy2yYVNr+s2jsOA='		--03
	,1													--04
	,'E7tgtDnm5bt7ob0893W2WA=='							--05
	,'admin@bandbcorp.com'								--06
	,NULL												--07
	,NULL												--08
	,1													--09
	,0													--10
	,GETDATE()											--11
	,GETDATE()											--12
	,GETDATE()											--13
	,GETDATE()											--14
	,0													--15
	,'17540101'											--16
	,0													--17
	,'17540101'											--18
	,'User create by initial script'					--19
	
	
DECLARE @AdminRoleId uniqueidentifier
SET @AdminRoleId = NEWID()
INSERT INTO [dbo].[Roles]
SELECT 
	 @ApplicationId
	,@AdminRoleId
	,'Administrator' as RoleName
	,'Super Administrator' as RoleDescription
UNION
SELECT 
	 @ApplicationId
	,newid() as RoleID
	,'Student' as RoleName
	,'Student Role' as RoleDescription
UNION
SELECT 
	 @ApplicationId
	,newid() as RoleID
	,'Coordinator' as RoleName
	,'Coordinator Role' as RoleDescription
UNION
SELECT 
	 @ApplicationId
	,newid() as RoleID
	,'Auditor' as RoleName
	,'Auditor Role' as RoleDescription

INSERT INTO [dbo].[UsersInRoles]
SELECT @UserId, @AdminRoleId
GO