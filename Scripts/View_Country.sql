Use Kontragent
go


DROP VIEW if exists [View_Country]
go

CREATE VIEW View_Country
AS 
			SELECT TOP 10000 *
			FROM Country
			WHERE Risk_End_Date is NULL
			ORDER BY Name_Country 
GO



Select * From View_Country
--ORDER BY Name_Country 






Select * From Country
ORDER BY Name_Country DESC

