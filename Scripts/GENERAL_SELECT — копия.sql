use Kontragent
go

DROP proc IF Exists [General_SELECT]
go

CREATE PROCEDURE [General_SELECT]  ( @UNP_Org nvarchar(20) = NULL
									,@Full_Name_Org nvarchar(200) = NULL 
									,@Short_Name_Org nvarchar(200) = NULL
									,@Create_date_Org_FINAL DateTIME = NULL 
									,@Create_date_Org_START DateTIME = NULL 
									,@Description_Org nvarchar(1000) = NULL
									,@Ownership_Org bit = NULL
									,@Tax_Debt bit = NULL
									,@Debts_Enforcement_Documents bit = NULL
									,@False_Business bit = NULL
									,@Special_Risc bit = NULL
									,@Execute_Proc bit = NULL
									,@Bankruptcy_Proc bit = NULL
									,@Liquidation_Proc bit = NULL
									,@Resident bit = NULL
									,@Broker_Client bit = NULL
									,@Prev_Broker_Client bit = NULL
									,@Trading_experience bit = NULL
									,@Trader bit = NULL
									,@Manufacturer bit = NULL
									,@First_Accred bit = NULL
									,@Second_Accred bit = NULL
									,@Exchenge_Trading_Disorders bit = NULL
									,@Negativ_Data bit = NULL
									,@Reputation bit = NULL
									,@Forced_Deposite INT = NULL

									,@Broker_Opinion nvarchar(1000) = NULL
									,@Section_Head_Opinion nvarchar(1000) = NULL
									,@Auditor_Opinion nvarchar(1000) = NULL
									,@Name_Country nvarchar (30) = NULL
									,@Name_Section nvarchar (20) = NULL
									,@Owner_Name nvarchar(50) = NULL
									,@Head_Name nvarchar(50) = NULL
									,@Prev_Liquidated bit = NULL
									,@Prev_Bankruptcy bit = NULL
									,@Prev_State_Debt bit = NULL
									,@Prev_Tax_Debt bit = NULL
									,@Prev_Execute_Proc bit = NULL
									,@Negativ_Data_Pers bit = NULL
									,@Description_Pers nvarchar(1000) = NULL
									,@Country_Pers nvarchar (20) = NULL
									,@Login_User nvarchar (50) = NULL
									,@Check_Date_Org_START DateTIME = NULL
									,@Check_Date_Org_FINAL DateTIME = NULL 
									,@Risc_Level_More INT = NULL
									,@Risc_Level_Less int = NULL
									)
as


SELECT 
		Organization.*
	  ,View_Risc_Level.*
	  ,Users.*
      ,Persone.*
	  ,Risk.*
	  ,Section.*
	  ,Country.*
      ,CountryPerson.Name_Country  as Country_Pers
	  ,(select Login_User FROM Users   WHERE ID_User  = Organization.ID_User) as [Проверяющий]
	  ,(select Login_User FROM Users   WHERE ID_User  = Organization.ID_User_Update) as [Автор изменений]
	  
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
		AND 
			(@Name_Country is null or Country.Name_Country =  @Name_Country )
		AND
			(@Name_Section is null or Section.Name_Section = @Name_Section)
		AND
			(Create_date_Org is null or Organization.Create_date_Org Between @Create_date_Org_START and @Create_date_Org_FINAL)
		AND 
			(@Country_Pers is null or CountryPerson.Name_Country =  @Country_Pers )
		AND 
			(@Owner_Name is null or Persone.Owner_Name like '%' + @Owner_Name + '%' )
		AND 
			(@Head_Name is null or Persone.Head_Name like '%' + @Head_Name + '%' )
		AND
			(@Ownership_Org is null or @Ownership_Org = Organization.Ownership_Org)
		AND
			(@Tax_Debt is null or @Tax_Debt = Organization.Tax_Debt)
		AND
			(@Debts_Enforcement_Documents is null or @Debts_Enforcement_Documents = Organization.Debts_Enforcement_Documents)
		AND
			(@False_Business is null or @False_Business = Organization.False_Business)
		AND
			(@Special_Risc is null or @Special_Risc = Organization.Special_Risc)
		AND
			(@Execute_Proc is null or @Execute_Proc = Organization.Execute_Proc)
		AND
			(@Bankruptcy_Proc is null or @Bankruptcy_Proc = Organization.Bankruptcy_Proc)
		AND
			(@Liquidation_Proc is null or @Liquidation_Proc = Organization.Liquidation_Proc)
		AND
			(@Resident is null or @Resident = Organization.Resident)
		AND
			(@Broker_Client is null or @Broker_Client = Organization.Broker_Client)
		AND
			(@Prev_Broker_Client is null or @Prev_Broker_Client = Organization.Prev_Broker_Client)
		AND
			(@Trading_experience is null or @Trading_experience = Organization.Trading_experience)
		AND
			(@Trader is null or @Trader = Organization.Trader)
		AND
			(@Manufacturer is null or @Manufacturer = Organization.Manufacturer)
		AND
			(@First_Accred is null or @First_Accred = Organization.First_Accred)
		AND
			(@Second_Accred is null or @Second_Accred = Organization.Second_Accred)
		AND
			(@Exchenge_Trading_Disorders is null or @Exchenge_Trading_Disorders = Organization.Exchenge_Trading_Disorders)
		AND
			(@Negativ_Data is null or @Negativ_Data = Organization.Negativ_Data)
		AND
			(@Reputation is null or @Reputation = Organization.Reputation)
		AND
			(@Check_Date_Org_START is null or Organization.Check_Date_Org Between @Check_Date_Org_START and @Check_Date_Org_FINAL)
		AND
			(@Check_Date_Org_FINAL is null or Organization.Check_Date_Org Between @Check_Date_Org_START and @Check_Date_Org_FINAL)
		AND
			(@Prev_Tax_Debt is null or @Prev_Tax_Debt = Persone.Prev_Tax_Debt)
		AND
			(@Prev_State_Debt is null or @Prev_State_Debt = Persone.Prev_State_Debt)
		AND
			(@Prev_Liquidated is null or @Prev_Liquidated = Persone.Prev_Liquidated)
		AND
			(@Prev_Bankruptcy is null or @Prev_Bankruptcy = Persone.Prev_Bankruptcy)
		AND
			(@Prev_Execute_Proc is null or @Prev_Execute_Proc = Persone.Prev_Execute_Proc)
		AND
			(@Negativ_Data_Pers is null or @Negativ_Data_Pers = Persone.Negativ_Data_Pers)
		AND
			(@Prev_State_Debt is null or @Prev_State_Debt = Persone.Prev_State_Debt)
		AND 
			(@Risc_Level_Less is null or [Степень риска] <= @Risc_Level_Less )
		AND 
			(@Risc_Level_More is null or [Степень риска] >= @Risc_Level_More )	

			AND
			(@Forced_Deposite is null or @Forced_Deposite = Organization.Forced_Deposite)
		


go
									

EXEC General_SELECT
@Create_date_Org_START		= '1980-12-12' 
,@Create_date_Org_FINAL		= '2019-12-12' 
,@UNP_Org = 100185330


,@Forced_Deposite = 1
--,@Risc_Level_More = '43'
--,@Risc_Level_Less = '50'

--SELECT* FROM Organization
--SELECT* FROM Users


Update Users
Set Department = 'УИБ'
Where Login_User = 'Карякин'


SELECT* FROM Organization
JOIN Country on Organization.ID_Country = Country.ID_Country
Where Country.Name_Country != 'Беларусь'