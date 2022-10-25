use master
go


--BACKUP DATABASE kontragent
TO DISK = 'C:\backups\kontragent0611201911111111111.bak'
go


--RESTORE DATABASE Kontragent FROM DISK = 'C:\backups\CONTRAGENT$KONTRAGENT_Kontragent_FULL_20191106_152032.bak'
GO

select* from Organization

