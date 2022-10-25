use Kontragent
go


Drop proc if exists Update_Cascade
go

CREATE PROCEDURE Update_Cascade (	 @UNP_Org nvarchar(20) = null
									,@Full_Name_Org nvarchar(200) = null 
									,@Short_Name_Org nvarchar(200) = null
									,@UNP_Org_New nvarchar(20) = null
									,@Full_Name_Org_New nvarchar(200) = null 
									,@Short_Name_Org_New nvarchar(200)= null
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
UPDATE Organization 
SET  
						 Organization.UNP_Org = @UNP_Org_New
						,Organization.Full_Name_Org = @Full_Name_Org_New
						,Organization.Short_Name_Org = @Short_Name_Org_New
						,Organization.Create_date_Org = @Create_date_Org 
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

WHERE	
				Organization.UNP_Org is NULL or Organization.UNP_Org = @UNP_Org
				or
				Organization.Full_Name_Org is NULL or Organization.Full_Name_Org = @Full_Name_Org
				or
				Organization.Short_Name_Org is NULL or Organization.Short_Name_Org = @Short_Name_Org

		
go




exec Update_Cascade
@UNP_Org = '11'
,@Full_Name_Org = '11' 
,@Short_Name_Org = '11'
--,@UNP_Org_New = '999'
--,@Full_Name_Org_New = '999' 
--,@Short_Name_Org_New = '999'
,@Create_date_Org = '1985-04-23'
,@Description_Org ='Не хуйня'
--Далее пошли биты
,@Ownership_Org = 0 
,@Tax_Debt = 1 
,@Debts_Enforcement_Documents = 1
,@False_Business = 1
,@Special_Risc = 1 
,@Execute_Proc = 1 
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
--далее пошли нварчары
,@Broker_Opinion = 'ебло' 
,@Section_Head_Opinion = 'ебло'
,@Auditor_Opinion = 'ебло' 
,@Country = 'Беларусь'
,@Name_Section = 'ППТ'
,@Owner_Name = 'Алибаба'
,@Head_Name = 'Алибаба'
--биты
,@Prev_Liquidated = 1
,@Prev_Bankruptcy = 1
,@Prev_State_Debt = 1
,@Prev_Tax_Debt = 1
,@Prev_Execute_Proc = 1
,@Negativ_Data_Pers = 1
--нварчары
,@Description_Pers = 'lehf'
,@Country_Pers = 'Украина'
,@Login_User = 'Карякин'


Select* from Organization
Select* from Persone

SELECT * from [View_Risc_Level]



















	