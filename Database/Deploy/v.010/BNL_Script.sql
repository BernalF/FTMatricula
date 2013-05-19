--Delete Professor X
exec sp_executesql N'delete [dbo].[Users]
where ([UserId] = @0)',N'@0 uniqueidentifier',@0='B400070D-8B4B-454E-863C-2AF7C26A5113'