use Kontragent
go

DROP PROC if exists ADD_Risk 
go

CREATE PROCEDURE ADD_Risk(

			 @Age_Org_Risk INT = NULL
			,@Ownership_Org INT =  NULL
			,@Broker_Client bit = NULL
			,@Trading_experience bit = NULL
			,@Manufacturer INT = NULL 
			,@Tax_Debt INT = NULL
			,@Debts_Enforcement_Documents INT = NULL
			,@False_Business INT = NULL 
			,@Special_Risc INT = NULL
			,@Execute_Proc INT = NULL
			,@Bankruptcy_Proc INT = NULL
			,@Liquidation_Proc INT = NULL
			,@Resident INT = NULL 
			,@Exchenge_Trading_Disorders INT = NULL
			,@Negativ_Data INT = NULL
			,@Reputation INT = NULL
			,@Prev_Liquidated INT = NULL
			,@Prev_Bankruptcy INT = NULL
			,@Prev_State_Debt INT = NULL
			,@Prev_Tax_Debt INT = NULL
			,@Prev_Execute_Proc INT = NULL		
		)
AS 

insert into Risk (
				 Age_Org_Risk, 
				 Ownership_Org, Broker_Client ,Trading_experience ,Manufacturer ,Tax_Debt ,Debts_Enforcement_Documents ,False_Business ,Special_Risc ,Execute_Proc ,Bankruptcy_Proc 
				,Liquidation_Proc ,Resident ,Exchenge_Trading_Disorders ,Negativ_Data ,Reputation ,Prev_Liquidated ,Prev_Bankruptcy ,Prev_State_Debt ,Prev_Tax_Debt ,Prev_Execute_Proc
				)

select Age_Org_Risk, 
				Ownership_Org, Broker_Client ,Trading_experience ,Manufacturer ,Tax_Debt ,Debts_Enforcement_Documents ,False_Business ,Special_Risc ,Execute_Proc ,Bankruptcy_Proc 
				,Liquidation_Proc ,Resident ,Exchenge_Trading_Disorders ,Negativ_Data ,Reputation ,Prev_Liquidated ,Prev_Bankruptcy ,Prev_State_Debt ,Prev_Tax_Debt ,Prev_Execute_Proc
from Risk
where Risk_End_Date is null 

declare @newID int = SCOPE_IDENTITY()

update Risk
set Risk_End_Date = getdate()
where Risk_End_Date is null
and ID_Risk <> @newID -- не равны 


update Risk
set 
			 Age_Org_Risk =			ISNULL(@Age_Org_Risk,Age_Org_Risk)
			,Ownership_Org =		ISNULL(@Ownership_Org,Ownership_Org)
			,Broker_Client =		ISNULL(@Broker_Client,Broker_Client) 
			,Trading_experience =	ISNULL(@Trading_experience,Trading_experience)
			,Manufacturer =			ISNULL(@Manufacturer,Manufacturer)
			,Tax_Debt =				ISNULL(@Tax_Debt,Tax_Debt)
			,Debts_Enforcement_Documents = ISNULL(@Debts_Enforcement_Documents,Debts_Enforcement_Documents)
			,False_Business =		ISNULL(@False_Business,False_Business)
			,Special_Risc =			ISNULL(@Special_Risc,Special_Risc)
			,Execute_Proc =			ISNULL(@Execute_Proc,Execute_Proc)
			,Bankruptcy_Proc =		ISNULL(@Bankruptcy_Proc,Bankruptcy_Proc)
			,Liquidation_Proc =		ISNULL(@Liquidation_Proc,Liquidation_Proc)
			,Resident =				ISNULL(@Resident, Resident)
			,Exchenge_Trading_Disorders = ISNULL(@Exchenge_Trading_Disorders,Exchenge_Trading_Disorders)
			,Negativ_Data =			ISNULL(@Negativ_Data,Negativ_Data)
			,Reputation =			ISNULL(@Reputation,Reputation)
			,Prev_Liquidated =		ISNULL(@Prev_Liquidated,Prev_Liquidated)
			,Prev_Bankruptcy =		ISNULL(@Prev_Bankruptcy,Prev_Bankruptcy)
			,Prev_State_Debt =		ISNULL(@Prev_State_Debt,Prev_State_Debt)
			,Prev_Tax_Debt =		ISNULL(@Prev_Tax_Debt,Prev_Tax_Debt)
			,Prev_Execute_Proc =	ISNULL(@Prev_Execute_Proc,Prev_Execute_Proc)
 where Risk_End_Date is null
GO


exec ADD_Risk 
--@Age_Org_Risk = 2
--@Manufacturer = 
--,@False_Business = 200
--,@Prev_Bankruptcy = 200
--,@Special_Risc = 200
--,@Prev_State_Debt = 200
go

select* from Risk