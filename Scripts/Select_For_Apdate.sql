use Kontragent
go


DROP PROC if exists [Select_For_Apdate]
go

Create Procedure [Select_For_Apdate] ( @UNP_Org nvarchar(20) = NULL
									  ,@Full_Name_Org nvarchar(200) = NULL 
									  ,@Short_Name_Org nvarchar(200) = NULL)
as
SELECT Organization.*
	  ,View_Risc_Level.*
	  ,Users.*
      ,Persone.*
	  ,Risk.*
	  ,Section.*
	  ,Country.*
      ,CountryPerson.Name_Country  as Country_Pers
	  
FROM Organization	
JOIN Risk	 on Organization.ID_Risk = Risk.ID_Risk
JOIN Persone on Organization.UNP_Org = Persone.UNP_Org
JOIN Country on Organization.ID_Country = Country.ID_Country
JOIN Section on Organization.ID_Section = Section.ID_Section
Join Country as CountryPerson on Persone.ID_Country_Pers = CountryPerson.ID_Country
Join Users on Organization.ID_User = Users.ID_User
Join View_Risc_Level on Organization.UNP_Org = View_Risc_Level.UNP_Org

WHERE
			(@UNP_Org is null or Organization.UNP_Org = @UNP_Org)
		AND
			(@Full_Name_Org is null or Organization.Full_Name_Org like '%' + @Full_Name_Org + '%' )
		AND
			(@Short_Name_Org is null or Organization.Short_Name_Org like '%' + @Short_Name_Org + '%')
GO








EXEC [Select_For_Apdate]
@Full_Name_Org = 3
--,@UNP_Org = 3