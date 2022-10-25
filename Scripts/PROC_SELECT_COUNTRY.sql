USE Kontragent
go


drop proc if exists Country_Select 
go

CREATE PROC Country_Select (@Country_Code nvarchar(1000) =NULL)
AS

SELECT Name_Country from Country
WHERE Country_Code is NULL or Country_Code = @Country_Code;
go

EXEC Country_Select
@Country_Code = 643