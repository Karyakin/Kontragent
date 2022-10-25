Use Kontragent
go


--AND (Forced_Deposite is NULL or Forced_Deposite = 0)

DROP VIEW if exists [View_Risc_Level]
go

CREATE VIEW View_Risc_Level
AS


select *,  case when [Степень риска] <= 10 then N'Задаток по биржевому сбору'Else N'Задаток по биржевым сделкам'  end as [Рекомендуемый вид задатка]
		  ,case when [Степень риска] <= 10 and Forced_Deposite = 0 then N'Задаток по биржевому сбору'  when [Степень риска] <= 10 AND Forced_Deposite is NULL then N'Задаток по биржевому сбору' when [Степень риска] <= 10 and Forced_Deposite = 1 then N'Задаток по биржевым сделкам'   
				when [Степень риска] >= 10 and Forced_Deposite = 0 then N'Задаток по биржевым сделкам' when [Степень риска] >= 10 AND Forced_Deposite is NULL then N'Задаток по биржевым сделкам'  when [Степень риска] >= 10 and Forced_Deposite = 1 then N'Задаток по биржевому сбору'
		  end    as [Вид задатка]  
from (
select Organization.UNP_Org
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
		,Organization.Forced_Deposite

from Organization 
				JOIN Risk	 on Organization.ID_Risk = Risk.ID_Risk
				JOIN Persone on Organization.UNP_Org = Persone.UNP_Org
				JOIN Country on Organization.ID_Country = Country.ID_Country
				JOIN Section on Organization.ID_Section = Section.ID_Section
				Join Country as CountryPerson on Persone.ID_Country_Pers = CountryPerson.ID_Country				
) as пофиглюбоеслово 




go


SELECT * from [View_Risc_Level]


SELECT * from Organization