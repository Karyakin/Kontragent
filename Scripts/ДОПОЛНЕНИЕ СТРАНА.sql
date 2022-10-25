use Kontragent
go

DROP proc if exists ADD_Country
go

CREATE PROC ADD_Country (@Name_Country nvarchar(100) = NULL
						,@Risk_Country INT = NULL
						) 
AS
DECLARE @ID_Country INT
INSERT INTO Country ( Country_Code, Country.Name_Country, Country.Risk_Country,  Country.Risk_St_Date, Country.Risk_End_Date)
SELECT			      Country_Code, Country.Name_Country, Country.Risk_Country,  Country.Risk_St_Date, Country.Risk_End_Date
FROM Country
WHERE Name_Country = @Name_Country AND Risk_End_Date is NULL
SET @ID_Country = SCOPE_IDENTITY()

update Country
set Risk_End_Date = getdate()
where Risk_End_Date is null AND Name_Country = @Name_Country
and ID_Country <> @ID_Country -- не равны

update Country
set 
		Country.Risk_Country = ISNULL( @Risk_Country, Risk_Country)
	   ,Country.Risk_St_Date =  GETDATE()
where	Country.Risk_End_Date is null AND Name_Country = @Name_Country

GO


EXEC ADD_Country
 @Name_Country = N'Беларусь'
,@Risk_Country = 20

SELECT * FROM Country