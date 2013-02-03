USE [matriFunDB]
GO

DECLARE @CountryID uniqueidentifier
SET @CountryID = NEWID()


INSERT INTO Country(
	 CountryID
	,CountryName
)
SELECT
	 @CountryID
	,'Costa Rica'

DECLARE @IdentificationTypeID uniqueidentifier
SET @IdentificationTypeID = NEWID()

DECLARE @MaritalStatusTypeID uniqueidentifier
SET @MaritalStatusTypeID = NEWID()

INSERT INTO dbo.[Type]
(
	 [TypeID]
	,[Name]
	,[Description]
	,[Usage]
)
SELECT
	 @IdentificationTypeID
	,'Cedula'
	,'Tipo de Identificacion - CRC Cedula Nacional'
	,'IDS'
UNION
SELECT
	 @MaritalStatusTypeID
	,'Casado'
	,'Tipo de Estado Marital - CRC Casado'
	,'MST'
UNION
SELECT
	 NEWID()
	,'Soltero'
	,'Tipo de Estado Marital - CRC Soltero'
	,'MST'

	

DECLARE @ApplicationId uniqueidentifier

SELECT @ApplicationId = ApplicationId FROM Applications

DECLARE @UserId uniqueidentifier
SET @UserId = NEWID()
INSERT INTO dbo.Users
SELECT @ApplicationId, @UserId, '303720138', 0,GETDATE()


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
	,'303720138@bandbcorp.com'							--06
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
	

DECLARE @StudentID uniqueidentifier
SET @StudentID = NEWID()

INSERT INTO dbo.Student(
	 StudentID
	,UserID
	,IdentificationTypeID
	,FirstName
	,LastName
	,Gender
	,DateOfBirth
	,CountryID
	,MaritalStatusTypeID
	,Phone1
	,Phone2
	,Phone3
	,IsAppUser
)
SELECT 
	 @StudentID
	,@UserId
	,@IdentificationTypeID
	,'Berman'
	,'Romero'
	,'M'
	,'19810310'
	,@CountryID --CountryID
	,@MaritalStatusTypeID
	,'+50688203956'
	,'+50688203956'
	,'+50688203956'
	,1 --IsAppUser