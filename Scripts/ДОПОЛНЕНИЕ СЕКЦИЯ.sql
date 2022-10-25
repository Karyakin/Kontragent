use Kontragent
go

DROP proc if exists ADD_Section
go

CREATE PROC ADD_Section (@Name_Section nvarchar(20) = NULL
						, @Risk_Section INT = NULL
						) 
AS
INSERT INTO Section ( Section.Name_Section, Section.Risk_Section,  Section.Risk_St_Date_Section, Section.Risk_End_Date_Section)
SELECT			      Section.Name_Section, Section.Risk_Section,  Section.Risk_St_Date_Section, Section.Risk_End_Date_Section
FROM Section
WHERE Name_Section = @Name_Section AND Risk_End_Date_Section is NULL
declare @newID int = SCOPE_IDENTITY()

update Section
set Risk_End_Date_Section = getdate()
where Risk_End_Date_Section is null AND Name_Section = @Name_Section
and ID_Section <> @newID -- не равны

update Section
set 
		Section.Risk_Section = ISNULL( @Risk_Section, Risk_Section)
	   ,Risk_St_Date_Section =  GETDATE()
where	Risk_End_Date_Section is null AND Name_Section = @Name_Section

GO

EXEC ADD_Section
 @Name_Section = N'ППТ'
,@Risk_Section = 10

SELECT * FROM Section