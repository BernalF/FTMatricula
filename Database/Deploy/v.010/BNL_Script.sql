--Delete Professor X
exec sp_executesql N'delete [dbo].[Users]
where ([UserId] = @0)',N'@0 uniqueidentifier',@0='B400070D-8B4B-454E-863C-2AF7C26A5113'

--- Alter View Scheme Details, Add School        
ALTER VIEW [dbo].[SchemeDetails]        
AS        
SELECT s.SchemeID,       
  s.Name SchemeName,       
  s.Description,      
  s.OwnerUserId,      
  ISNULL(u1.UserName,'') OwnerName,      
  s.CoordinatorUserId,      
  ISNULL(u2.UserName, '') CoordinatorName,      
  s.ModalityID,      
  m.Name ModalityName,  
  s.SchoolID,  
  ISNULL(sc.Name, '') SchoolName  
FROM Scheme s    
INNER JOIN Modality m ON s.ModalityID = m.ModalityID      
LEFT JOIN Users u1 ON u1.UserId = s.OwnerUserId      
LEFT JOIN Users u2 ON u2.UserId= s.CoordinatorUserId    
LEFT JOIN School sc ON sc.SchoolID = s.SchoolID  
--- Add primary key to table school - scheme  