use Kontragent
go


DROP proc IF Exists Delete_ORG_Cascade
go

CREATE PROCEDURE Delete_ORG_Cascade ( @UNP_Org nvarchar(20) = NULL
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
			(@Full_Name_Org is null or Organization.Full_Name_Org = @Full_Name_Org )
		AND
			(@Short_Name_Org is null or Organization.Short_Name_Org = @Short_Name_Org)
GO


Drop proc if exists Update_Cascade
go

CREATE PROCEDURE Update_Cascade (	 @UNP_Org nvarchar(20) = null
									,@Full_Name_Org nvarchar(200) = null 
									,@Short_Name_Org nvarchar(200) = null
									------------------
									,@UNP_Org_New nvarchar(20) = null
									,@Full_Name_Org_New nvarchar(200) = null 
									,@Short_Name_Org_New nvarchar(200)= null
									------------------
									,@Create_date_Org DateTIME NULL 
									,@Description_Org nvarchar(1000) 
									,@Ownership_Org bit 
									,@Tax_Debt bit 
									,@Debts_Enforcement_Documents bit
									,@False_Business bit
									,@Special_Risc bit 
									,@Execute_Proc bit 
									,@Bankruptcy_Proc bit 
									,@Liquidation_Proc bit 
									,@Resident bit 
									,@Broker_Client bit 
									,@Prev_Broker_Client bit
									,@Trading_experience bit
									,@Trader bit
									,@Manufacturer bit
									,@First_Accred bit 
									,@Second_Accred bit 
									,@Exchenge_Trading_Disorders bit 
									,@Negativ_Data bit 
									,@Reputation bit 
									,@Forced_Deposite bit
									,@Broker_Opinion nvarchar(1000) 
									,@Section_Head_Opinion nvarchar(1000) 
									,@Auditor_Opinion nvarchar(1000) 
									,@Country nvarchar (30)
									,@Name_Section nvarchar (20)
									--,@Update_Date_Org datetime
									------------------
									,@Owner_Name nvarchar(50)
									,@Head_Name nvarchar(50)
									,@Prev_Liquidated bit
									,@Prev_Bankruptcy bit
									,@Prev_State_Debt bit
									,@Prev_Tax_Debt bit
									,@Prev_Execute_Proc bit
									,@Negativ_Data_Pers bit
									,@Description_Pers nvarchar(1000)
									,@Country_Pers nvarchar (20)
									,@Login_User nvarchar (50) )
									
AS

DECLARE @ID_Country INT
select @ID_Country = Country.ID_Country from Country where Country.Name_Country like @Country
DECLARE @ID_Section INT
select  @ID_Section = Section.ID_Section from Section where Section.Name_Section like @Name_Section 
DECLARE @ID_Country_Pers INT 
select  @ID_Country_Pers = Country.ID_Country from Country where Country.Name_Country like @Country_Pers

DECLARE @ID_User_Update INT 
select  @ID_User_Update = Users.ID_User from Users where Users.Login_User like @Login_User
-----------
-- этот поиск надо делать не в этой проце, и передавать сюда токо @UNP_Org not null  
-- но пока путь так
declare 
	 @UNP nvarchar(20) 
	,@Full_Name nvarchar(200) 
	,@Short_Name nvarchar(200) 

SELECT  
				 @UNP = UNP_Org
				,@Full_Name = Full_Name_Org
				,@Short_Name = Short_Name_Org
from Organization 
WHERE	
				(Organization.UNP_Org is NULL or Organization.UNP_Org = @UNP_Org)
				or
				(Organization.Full_Name_Org is NULL or Organization.Full_Name_Org = @Full_Name_Org)
				or
				(Organization.Short_Name_Org is NULL or Organization.Short_Name_Org = @Short_Name_Org)

if 	 @UNP is null
begin
	raiserror('Not found',16, 1)
	return
end
-----------


UPDATE Persone 
SET
						 Persone.Owner_Name  = @Owner_Name 
						,Persone.Head_Name = @Head_Name 
						,Persone.Prev_Liquidated = @Prev_Liquidated 
						,Persone.Prev_Bankruptcy = @Prev_Bankruptcy 
						,Persone.Prev_State_Debt = @Prev_State_Debt 
						,Persone.Prev_Tax_Debt = @Prev_Tax_Debt 
						,Persone.Prev_Execute_Proc = @Prev_Execute_Proc 
						,Persone.Negativ_Data_Pers = @Negativ_Data_Pers 
						,Persone.Description_Pers = @Description_Pers 
						,Persone.ID_Country_Pers = @ID_Country_Pers 	
where UNP_Org = @UNP

UPDATE Organization 
SET  
						-- Organization.UNP_Org = @UNP_Org_New
						--,Organization.Full_Name_Org = @Full_Name_Org_New
						--,Organization.Short_Name_Org = @Short_Name_Org_New
						 Organization.Create_date_Org = @Create_date_Org 
						,Organization.Description_Org = @Description_Org
						,Organization.Ownership_Org = @Ownership_Org  
						,Organization.Tax_Debt = @Tax_Debt  
						,Organization.Debts_Enforcement_Documents = @Debts_Enforcement_Documents 
						,Organization.False_Business  = @False_Business 
						,Organization.Special_Risc = @Special_Risc  
						,Organization.Execute_Proc = @Execute_Proc  
						,Organization.Bankruptcy_Proc = @Bankruptcy_Proc  
						,Organization.Liquidation_Proc = @Liquidation_Proc  
						,Organization.Resident = @Resident  
						,Organization.Broker_Client = @Broker_Client  
						,Organization.Prev_Broker_Client = @Prev_Broker_Client 
						,Organization.Trading_experience = @Trading_experience 
						,Organization.Trader = @Trader 
						,Organization.Manufacturer = @Manufacturer 
						,Organization.First_Accred  = @First_Accred  
						,Organization.Second_Accred = @Second_Accred  
						,Organization.Exchenge_Trading_Disorders = @Exchenge_Trading_Disorders  
						,Organization.Negativ_Data = @Negativ_Data  
						,Organization.Reputation = @Reputation  
						,Organization.Forced_Deposite = @Forced_Deposite 
						,Organization.Broker_Opinion = @Broker_Opinion  
						,Organization.Section_Head_Opinion = @Section_Head_Opinion 
						,Organization.Auditor_Opinion = @Auditor_Opinion
						,Organization.ID_Country = @ID_Country 
						,Organization.ID_Section = @ID_Section 
						,Update_Date_Org =    FORMAT(GETDATE(), 'dd/MMM/yyyy hh:mm' , 'en-us')--hh:mm
						,ID_User_Update = @ID_User_Update
where UNP_Org = @UNP


if		(@UNP_Org_New <> @Unp)
	 or (@Full_Name_Org_New <> @Full_Name)
	 or (@Short_Name_Org_New <> @Short_Name)
begin 

UPDATE Organization 
	SET  
						 Organization.UNP_Org = isnull(@UNP_Org_New, UNP_Org)
						,Organization.Full_Name_Org = isnull(@Full_Name_Org_New,  Full_Name_Org)
						,Organization.Short_Name_Org = isnull (@Short_Name_Org_New, Short_Name_Org)
where UNP_Org = @UNP

END
go








exec Update_Cascade
@UNP_Org = '4'
,@Full_Name_Org = '4' 
,@Short_Name_Org = '4'
,@UNP_Org_New = '5'
,@Full_Name_Org_New = '5' 
,@Short_Name_Org_New = '5'
,@Create_date_Org = '2012-12-12'
,@Description_Org =N'йцйцйцй'

,@Ownership_Org = 0 
,@Tax_Debt = 0
,@Debts_Enforcement_Documents = 0
,@False_Business = 0
,@Special_Risc = 0
,@Execute_Proc = 0 
,@Bankruptcy_Proc = 1
,@Liquidation_Proc = 1 
,@Resident = 1 
,@Broker_Client = 1
,@Prev_Broker_Client = 1
,@Trading_experience = 1
,@Trader = 1
,@Manufacturer = 1
,@First_Accred = 1 
,@Second_Accred = 1 
,@Exchenge_Trading_Disorders = 1 
,@Negativ_Data = 1 
,@Reputation = 1 
,@Forced_Deposite = 1

,@Broker_Opinion = N'Черт' 
,@Section_Head_Opinion = N'Чудо'
,@Auditor_Opinion = N'Чууу' 
,@Country = N'Беларусь'
,@Name_Section = N'Металлопродукции'
,@Owner_Name = N'Алеша'
,@Head_Name = N'Попович'

,@Prev_Liquidated = 0
,@Prev_Bankruptcy = 0
,@Prev_State_Debt = 0
,@Prev_Tax_Debt = 0
,@Prev_Execute_Proc = 0
,@Negativ_Data_Pers = 0

,@Description_Pers = N'йййй'
,@Country_Pers = N'Польша'
,@Login_User = N'Карякин'


Select* from Organization
Select* from Persone


exec General_SELECT
@UNP_Org = 1

















	