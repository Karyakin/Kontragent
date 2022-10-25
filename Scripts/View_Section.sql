Use Kontragent
go


DROP VIEW if exists [View_Section]
go

CREATE VIEW View_Section
AS
SELECT * FROM Section
WHERE Risk_End_Date_Section IS NULL
GO


Select* From View_Section
go

SELECT* FROM Section
GO