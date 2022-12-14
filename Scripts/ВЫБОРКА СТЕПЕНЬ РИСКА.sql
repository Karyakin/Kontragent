/****** Script forSelectTopNRows command from SSMS  ******/
use master
go


DROP PROC if exists [Risk_Level]
go

CREATE PROCEDURE [Risk_Level](@UNP_Org nvarchar(20) = NULL, @Full_Name_Org nvarchar(200) = NULL, @Short_Name_Org nvarchar(100) = NULL,
							  @Name_Country nvarchar(100) = NULL, @Name_Section nvarchar(20) = NULL, @Risk INT = NULL, @Less INT = NULL, @More INT = NULL
							 ,@Risk_Section INT = NULL
							 ) 
as
select *,  case when  [Степень риска] <= 10 then 
	   N'Задаток по биржевому сбору'
     Else 
	   N'Задаток по биржевым сделкам'
    end as [Рекомендуемый вид задатка]

from (

select Risk.ID_Risk, Organization.UNP_Org, Full_Name_Org as Наименование,  Country.Name_Country as Страна, CountryPerson.Name_Country as [Страна учредит], Owner_Name as Учредитель, Head_Name Директор, Description_Org as Описание, Risk.Risk_St_Date, Risk.Risk_End_Date, Name_Section as Секция, Section.Risk_Section as [Риск секции]
		,case when Organization.Ownership_Org				= 0 THEN Risk.Ownership_Org					else 0 end-- 
		+case when Organization.Broker_Client				= 0 THEN Risk.Broker_Client					else 0 end-- 
		+case when Organization.Trading_experience			= 0 THEN Risk.Trading_experience			else 0 end-- 
		+case when Organization.Manufacturer				= 0 THEN Risk.Manufacturer					else 0 end-- 
		+case when Organization.Tax_Debt					= 1 THEN Risk.Tax_Debt						else 0 end
		+case when Organization.Debts_Enforcement_Documents	= 1 THEN Risk.Debts_Enforcement_Documents	else 0 end
		+case when Organization.False_Business				= 1 THEN Risk.False_Business				else 0 end
		+case when Organization.Special_Risc				= 1 THEN Risk.Special_Risc					else 0 end
		+case when Organization.Execute_Proc				= 1 THEN Risk.Execute_Proc					else 0 end
		+case when Organization.Bankruptcy_Proc				= 1 THEN Risk.Bankruptcy_Proc				else 0 end
		+case when Organization.Liquidation_Proc			= 1 THEN Risk.Liquidation_Proc				else 0 end
		+case when Organization.Resident					= 0 THEN Risk.Resident						else 0 end--
		+case when Organization.Exchenge_Trading_Disorders	= 1 THEN Risk.Exchenge_Trading_Disorders	else 0 end
		+case when Organization.Negativ_Data				= 1 THEN Risk.Negativ_Data					else 0 end
		+case when Organization.Reputation					= 0 THEN Risk.Reputation					else 0 end-- 
		+case when Persone.Prev_Liquidated					= 1 THEN Risk.Prev_Liquidated				else 0 end
		+case when Persone.Prev_Bankruptcy					= 1 THEN Risk.Prev_Bankruptcy				else 0 end
		+case when Persone.Prev_State_Debt					= 1 THEN Risk.Prev_State_Debt				else 0 end
		+case when Persone.Prev_Tax_Debt					= 1 THEN Risk.Prev_Tax_Debt					else 0 end
		+case when Persone.Prev_Execute_Proc				= 1 THEN Risk.Prev_Execute_Proc				else 0 end

		+case when Persone.Negativ_Data_Pers				= 1 THEN Risk.Negativ_Data					else 0 end

		+case when Organization.Age_Org						< 12 then Risk.Age_Org_Risk					else 0 end
		+Country.Risk_Country
		+Section.Risk_Section 
		+CountryPerson.Risk_Country

         as [Степень риска]

from Organization 
				JOIN Risk	 on Organization.ID_Risk = Risk.ID_Risk
				JOIN Persone on Organization.UNP_Org = Persone.UNP_Org
				JOIN Country on Organization.ID_Country = Country.ID_Country
				JOIN Section on Organization.ID_Section = Section.ID_Section
				Join Country as CountryPerson on Persone.ID_Country_Pers = CountryPerson.ID_Country
					
WHERE	(@UNP_Org is null or Organization.UNP_ORG = @UNP_Org)
AND
		(@Full_Name_Org is null or Organization.Full_Name_Org = @Full_Name_Org)
AND
		(@Short_Name_Org is null or Organization.Short_Name_Org = @Short_Name_Org)
AND 
		(@Name_Country is null or Country.Name_Country = @Name_Country)
AND
		(@Name_Section is null or Section.Name_Section = @Name_Section)) as пофиглюбоеслово 
WHERE
		(@Risk is null or [Степень риска] = @Risk)
AND 
		(@Less is null or [Степень риска] <= @Less )
AND 
		(@More is null or [Степень риска] >= @More )	
go



Exec Risk_Level