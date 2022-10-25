use Kontragent
go

DROP proc IF Exists Delete_ORG_Constraint
go

CREATE PROCEDURE Delete_ORG_Constraint ( @UNP_Org nvarchar(20) = NULL
							 ,@Full_Name_Org nvarchar(200) = NULL 
							 ,@Short_Name_Org nvarchar(200) = NULL)
as
Delete Organization	 
	  	  
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


select* from Organization

exec Delete_ORG_Constraint
@UNP_Org = 1